Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CF2F45A08
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 18:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2kRYErxht9+39PIOH+sW3aIcoLVDzC/70VlLNqTxCc=; b=UaqW3/uyFm0W4Z8oceSaO9/sbR
	lxLcCZcEVQaOzC9odltLb8767NULAFOR9EeNWCJq+E0BZpVFC9LU7puRaM8Ussjn50T1aBflngjmR
	W1A1b0OSXtsIgOrOcj6S03WAqLGvXdyAuIEgOHdBrAigMAuIR+vrZdXO1qRUCOQIC1GSSbLQ4qdwo
	tAeoiuMm1zYIoGMcMzFYM7vclQFI/UncNT/x4yYUnqsthOCcgV7DdJJItH+pX7nWgn1xLDOaQjk4L
	sQsXb/2MVj8B5YfqcHSOs4kLrouROFbBxdgyj11jKEUZhiJ9lEQpr7eIh2lhEj1gywOVDUk9wVL/8
	jF+lWiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBGQM-0000000Cfmm-4A8Y;
	Fri, 10 Apr 2026 18:17:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBGQL-0000000Cfmf-3edX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 18:17:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0882F6001A;
	Fri, 10 Apr 2026 18:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80AA9C19421;
	Fri, 10 Apr 2026 18:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775845064;
	bh=SuJa5z1O4Ex3dm3isjIut9wwpnyyg1tTqQGk8pC4++U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pr5xw3oB6mQxDeVBWXS1JFjnmWLl3cTlZfyBJU3IYLpgT8Bb7LjaZALZ6MDwmWC5I
	 x8IBR9olqbwVMSLWQHyqxKRMC91qjYhYBxDoxHduCiqwB3Bmw5imnUQEaS+mKvo/pi
	 6vszb92F19ZYtUpIW8DZWIUJcdwKrra+pyIaMM6xtXHdv689zYjI9dzJBY9uyzuYNx
	 Fmp+OHtcQFqAVj5Sa1ohVP6qIc2POse9KxweGnjyHosNtvzh6Oa2L6YKqtkdb31Ie5
	 s6edTcFwoB5oxbcg7enyssfdLKO9Gu0jYNe0y369uDCtbtWhtGmIyvSijWCZprf94v
	 gsT45Dgn/y48g==
Date: Fri, 10 Apr 2026 13:17:42 -0500
From: Rob Herring <robh@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Puranjay Mohan <puranjay@kernel.org>, bpf@vger.kernel.org,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 2/4] perf: Fix uninitialized bitfields in
 perf_clear_branch_entry_bitfields()
Message-ID: <20260410181742.GA908431-robh@kernel.org>
References: <20260318171706.2840512-1-puranjay@kernel.org>
 <20260318171706.2840512-3-puranjay@kernel.org>
 <20260409162826.GX356832@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409162826.GX356832@e132581.arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Apr 09, 2026 at 05:28:26PM +0100, Leo Yan wrote:
> On Wed, Mar 18, 2026 at 10:16:56AM -0700, Puranjay Mohan wrote:
> 
> [...]
> 
> > diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> > index 48d851fbd8ea..d7f39b7e9cda 100644
> > --- a/include/linux/perf_event.h
> > +++ b/include/linux/perf_event.h
> 
> BTW, I found you didn't include correct maintainers for perf core
> changes.  You might need to loop them in the new version.

Yes. And use get_maintainers.pl please. b4 tool will do that for you. 
That will get everyone including authors of commits in "Fixes". That 
would be Marc Z in this case.

Rob

