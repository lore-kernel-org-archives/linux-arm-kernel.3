Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E51110ED664
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mixD/He9qmmJr+yOxb0v5dS8BcaS/ciPSUCsiG9+Jg=; b=P/2K5i4YYw3gMDV0l+IQYlaz0c
	J40VZItH7LBhwIyiMAxwieSvCL1hbIWTA8H5jteX/mFB9gPg3vyB4j0ffWJR/AauBZsS30cWQYWab
	ItXPMz6F8M4XNsenoyjDmidr6T2MVcQ5tFHlTsnwNK/lfYCisLBxPRQfyHaxe9QhowQ20q6JJLCeY
	esC8tMOBRzvyUb9wdbCP70JwI5tXWKUG0vxG+GRttsbAFSfEoO7aN7r6T2RqSCl6lpd4uFdWnXpdH
	DvjX7V17pspKAj5unN5wj85uaIf7Uy2t4794uv19NczEXT3P8gNxclgjKOFsEu+RWLFmcKDEflz7k
	yrm3dLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66nq-00000007Nmp-3DbU;
	Fri, 27 Mar 2026 13:00:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66np-00000007NmS-18s9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 13:00:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D41A635A1;
	Fri, 27 Mar 2026 06:00:33 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC02B3F905;
	Fri, 27 Mar 2026 06:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774616439; bh=NRpLU3VWNM4bFKxiVpEMaLJQ3c2gSocDeM31nmwqK/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ayg3wAwUNXPLxFqAh/uWuZwPccKhFmk7ZLTKxpy1ttsWaS8BxS8dNbQ/tLk9NREUe
	 tvjH1iqKRZVHjILG15WYSvazb3ayt3XldhFT2gER3haS5T08HXsiX6ksk3F3wU+aZ1
	 Cq+mxEJ8s6mcYChMj/EZnX10T5VNkjlMO7yOpOVo=
Date: Fri, 27 Mar 2026 13:00:35 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org, shuah@kernel.org, broonie@kernel.org,
	yeoreum.yun@arm.com, jonathan.cameron@huawei.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linuxarm@huawei.com,
	Yifan Wu <wuyifan50@huawei.com>
Cc: xiaqinxin@huawei.com, prime.zeng@hisilicon.com, wangyushan12@huawei.com,
	xuwei5@huawei.com, fanghao11@huawei.com, wangzhou1@hisilicon.com
Subject: Re: (subset) [PATCH v2 0/2] selftests/arm64: Fix sve2p1_sigill() and
 add cmpbr_sigill() for hwcap test
Message-ID: <acZ_cxnUjoFiAuJp@arm.com>
References: <20260305013638.992301-1-wuyifan50@huawei.com>
 <177461612664.2271410.12022212735709481989.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177461612664.2271410.12022212735709481989.b4-ty@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_060041_352785_EF3C1A08 
X-CRM114-Status: GOOD (  12.44  )
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

On Fri, Mar 27, 2026 at 12:58:11PM +0000, Catalin Marinas wrote:
> On Thu, 05 Mar 2026 09:36:36 +0800, Yifan Wu wrote:
> > This patch series fixes and adds two selftests in the arm64 hwcap
> > test suite.
> > 
> > Patch 1/2 fixes the sve2p1_sigill() test to correctly detect the
> > FEAT_SVE2p1 feature. Previously, the test incorrectly assumed that
> > the presence of FEAT_SVE2.1 implied support for the BFADD
> > instruction, which actually depends on the FEAT_SVE_B16B16 feature.
> > The test is updated to use the LD1Q instruction, which is
> > unambiguously implied by FEAT_SVE2p1.
> > 
> > [...]
> 
> Applied to arm64 (for-kernelci), thanks!

Wrong branch, it's for-next/kselftest (script got confused).

