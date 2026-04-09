Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBADEA3C4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUUHlu1N4CjPZuX0N0TWZbAyok7i7wpOT1uRT3SmERk=; b=ZxNgCZF/ESaOte39tYPZ8WijY1
	OWyU75+qlLGdtnzFLfa9FSRjTKPzFy6odIfw0N17mVsJ0pFEWWRb2PlhwtcsJNlx10cxAiHeK/sfP
	Nx2/JkaDw50XZeJ45Xo+VDclzQzx187rM3sfwYPbbCWnJ54+0Z5h9FK9BTIteWfWl3XzKBpwm5Cm9
	eQvwUsxawbam0SDBBZcEylZYyMupVtXIgjSWIlpMmMxeSMvda05EXnhl7oXrliTFcMk5UjsUMDqsl
	/3GiF/oXrNz/83mDcnQ8Zc/leEq2IXWgJ3yOdxp0yUXjnbtEuFRsiXDYKGa50vAia4cACBr2Hsq9I
	ObMhnzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAsF6-0000000AvmZ-2HtN;
	Thu, 09 Apr 2026 16:28:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAsF4-0000000AvmD-0tiy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 16:28:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE55C452F;
	Thu,  9 Apr 2026 09:28:23 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 127023F641;
	Thu,  9 Apr 2026 09:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775752109; bh=mS0+4tVHW5CPuehmB2qvZU92Djvs7OnTPDGBJtsLHvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DDB4zHVRP754Y+6JyGLXpKvVICURuVCUvu19SAznMP4bCA6nqiMO7fo/IHa4I3FWp
	 hK7XDfa23OPvzSAAD2wsEpQm4lzKFoXhI81C7H5a0m/+jflQU35DlXK17yMfez72Bu
	 BiyNa2YBYSz0LFzfb4LHWC0PeimVwh9x1vbIhwSQ=
Date: Thu, 9 Apr 2026 17:28:26 +0100
From: Leo Yan <leo.yan@arm.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Rob Herring <robh@kernel.org>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 2/4] perf: Fix uninitialized bitfields in
 perf_clear_branch_entry_bitfields()
Message-ID: <20260409162826.GX356832@e132581.arm.com>
References: <20260318171706.2840512-1-puranjay@kernel.org>
 <20260318171706.2840512-3-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318171706.2840512-3-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_092830_296462_6A6CDF4C 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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

On Wed, Mar 18, 2026 at 10:16:56AM -0700, Puranjay Mohan wrote:

[...]

> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 48d851fbd8ea..d7f39b7e9cda 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h

BTW, I found you didn't include correct maintainers for perf core
changes.  You might need to loop them in the new version.

