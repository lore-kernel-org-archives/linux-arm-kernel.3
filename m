Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B6FFED3EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 15:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cL3JNpv/5ux5K5zQUkIAsUUH302xWRWHJo1KqsuzLSQ=; b=i7omXbhFEpt3GXY6JZ5nxdswww
	z4u4+1sDwIPzNR84nYqShEMRn8EZKSzTzBAJYmKSg0VmFOs0lXbmnINWgJTi9JCFH9eFh6rCTD/nJ
	jPyv2A5VIStC4Tpwe/7EI44+HtUN7BgXZiNlHa5T3/s74BuWwvkB/2aryiqnZ8O9Qqfn8XOWD55KE
	RBbd92EhQS/iEcLuxgTI52iC5M+jQa0LtdE+iZ92mjW9B2ZFM22wGRo7eSOwvyfpFuq92+sqeHMCg
	nFHpvx6ywjvoo8ILroz68fAnhWpUU5vTTBGMVbX6zL7j3c/hcpBCrJHeTSVLAMwmv6jbDsPoinCm/
	mODU80bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIoX-0000000DQ1C-10Fo;
	Fri, 24 Apr 2026 15:51:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIoU-0000000DQ0n-2llP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 15:51:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AC18358D;
	Fri, 24 Apr 2026 08:51:23 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A1253F7B4;
	Fri, 24 Apr 2026 08:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777045888; bh=NC/mMOGrg8wY36a31hnnuUB+YEhuJPHUoFBs5yStwWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d61djaKJSu2S/PBDlhMBtiPsVG0Ltr3lfMEBD58Pcv7/JiwCkGHLqzvF8aemlAt2B
	 8J8BUV1MzkgXSOHQE5Dw9OC5mATVPGW6lrVCedYJlxPw1k+c8AnL1NGA4MJ8AzEknL
	 q15plqZe1mS1LYkh3ryLptk8LKYYApQD+NCRA18M=
Date: Fri, 24 Apr 2026 16:51:24 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <aeuRfEeOUWEHzPix@arm.com>
References: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_085130_740650_9EEEED8A 
X-CRM114-Status: GOOD (  15.58  )
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

On Wed, Apr 22, 2026 at 06:42:54PM +0100, Leo Yan wrote:
> Building on Debian sid with GCC 15 fails:
> 
>     CC       libc-gcs
>   libc-gcs.c: In function 'ptrace_read_write':
>   libc-gcs.c:142:25: error: storage size of 'child_gcs' isn't known
>     142 |         struct user_gcs child_gcs;
>         |                         ^~~~~~~~~
>   libc-gcs.c:142:25: warning: unused variable 'child_gcs' [-Wunused-variable]
> 
> For GCC-15, NT_ARM_GCS is defined in the libc header, causing gcs-util.h
> to skip its fallback definition of struct user_gcs. This leads to the
> compiler error.
> 
> Fix this by including <asm/ptrace.h> to provide the proper definition.

This is not caused by GCC-15 as it doesn't provide these headers. AFAICT
on Debian we have NT_ARM_GCS coming from glibc and user_gcs from the
kernel asm/ptrace.h uapi header (linux-libc-dev). We also have
NT_ARM_GCS in linux/elf.h as part of the kernel headers.

While the kernel exposed the macro and structure in the same commit, I
don't think it is required distros to align the glibc macro with the
linux headers. Glibc does not even use the kernel's linux/elf.h for the
macros, it just adds the definitions when they turn up in a released
kernel.

So you can have a glibc that defines NT_ARM_GCS but a linux-libc-dev
package that is not up to date to include struct user_gcs.

I think a better fix is to always define struct user_gcs and only
conditionally define NT_ARM_GCS (IOW, move the #endif higher).

-- 
Catalin

