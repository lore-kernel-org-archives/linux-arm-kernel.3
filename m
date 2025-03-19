Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5474AC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 06:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUXnCyDASHK//JuPGYOT/cwmigfr8c30bsecRv8YH18=; b=2VMVPBCGLQAhB8LrL0xkIPS7+R
	lXHRiJHRcdPSkzzxBPH2CCJ4WoxOfY9ygfWFVozLcYsBnoc2wB4/SZodl0mbCYeVfI28wSHJlywbC
	jOMrKjG+K7GobzgdOYIdd6cKlyr7n+XIks4F/I6Ba++MA5Sh55lLz/UznV5zpnET8YblHgwWoSF8z
	Kn+j5GJF4bjDaYfvIPFO0TQvueFit42LAJ2PKMnPTtRvhmPc2zrY57eT01/YzrJGeyCKc1erZJRM9
	HiB0T9n/7JaNVOIiuqUqVFby2RQ3E9VjhfLSBobo0P3rKzJ/1D2oAcPcmbXgALX6eSTyZW+ZNJSQz
	T7oGdvFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tunEj-000000089mg-38M0;
	Wed, 19 Mar 2025 06:49:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tum9n-000000084hk-0Pbo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 05:39:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21C8661145;
	Wed, 19 Mar 2025 05:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2152C4CEEA;
	Wed, 19 Mar 2025 05:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742362798;
	bh=SSaYbMiudPMxmZdaaCLLVz0v1iCsVRHIWVKduwiZFO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OPPNVaVB2tsCJjXcWL+hMpGUYU9Fm1O+ahyqX7WMS9b2LMRjm+Em3mDBtPLotCPFm
	 83/dhNxzj0uUgOGKsqVz8uwkuCtJJuI/oND3GqMnRPsSHymHk2avYaTIMmWf1FsdAm
	 Xqh2RMhImHrLsd23rUdrrQeeR6MpWBJKaoZYN+aAghG3Sl4XlEXL7pjQq1BFgyvppf
	 +0SZvUqzhtJEIFYPesQiEV5aTQhY+EgPNrGCCWQ7OCSgoHiNn66cL4X2iIqjYsONyB
	 RcSzTei6CidAkT32PVL8HZFM1Ft5wILBr3xqb9V5ee4d3dsBkS0d/9IqX5I0ASuD1R
	 O+a6xCXbCtvVA==
Date: Tue, 18 Mar 2025 22:39:54 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, indu.bhagat@oracle.com, 
	puranjay@kernel.org, wnliu@google.com, irogers@google.com, joe.lawrence@redhat.com, 
	mark.rutland@arm.com, peterz@infradead.org, roman.gushchin@linux.dev, 
	rostedt@goodmis.org, will@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] arm64: Implement arch_stack_walk_reliable
Message-ID: <ifqn5txrr25ffky7lxtnjtb4b2gekq5jy4fmbiwtwfvofb4wgw@py7v7xpzaqxa>
References: <20250308012742.3208215-1-song@kernel.org>
 <20250308012742.3208215-2-song@kernel.org>
 <iajk7zuxy7fun7f7sv52ydhq7siqub3ec2lmguomdd3fhdw4s2@cwyfihj3gvpn>
 <CAPhsuW4A73c0AjpUwSRJ4o-4E6wpA9c5L0xWaxvHkJ3m+BLGVA@mail.gmail.com>
 <ox4c6flgu7mzkvyontbz2budummiu7e6icke7xl3msmuj2q2ii@xb5mvqcst2vg>
 <CAPhsuW4BEDU=ZJavnofZtygGcQ9AJ5F2jJiuV6-nsnbZD+Gg-Q@mail.gmail.com>
 <pym6gfbapfy6qlmduszjk6tf2oc2fv4rtxgwjgex7bwlgpfwvs@bkt7qfmf7rc4>
 <CAPhsuW6_ZA+V_5JK+xy4v3pyQ-kaZzUooxO=4L+c95fHaW38ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPhsuW6_ZA+V_5JK+xy4v3pyQ-kaZzUooxO=4L+c95fHaW38ig@mail.gmail.com>
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

On Tue, Mar 18, 2025 at 08:58:52PM -0700, Song Liu wrote:
> On a closer look, I think we also need some logic in unwind_find_stack()
> so that we can see when the unwinder hits the exception boundary. For
> this reason, we may still need unwind_state.unreliable. I will look into
> fixing this and send v2.

Isn't that what FRAME_META_TYPE_PT_REGS is for?

Maybe it can just tell kunwind_stack_walk() to set a bit in
kunwind_state which tells kunwind_next_frame_record_meta() to quit the
unwind early for the FRAME_META_TYPE_PT_REGS case.  That also has the
benefit of stopping the unwind as soon as the exception is encounterd.

-- 
Josh

