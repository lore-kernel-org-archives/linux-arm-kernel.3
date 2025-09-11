Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD50CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJRJznHANynIMUFvDNfbTyPduybh9o/y/VfvRCKUidI=; b=UyWNRFVQIDl9TommrtKlavXa9z
	fHg0A0OvWj92PMUWQnimwU9OhXII9uXMOzE2eTaKwuahVDE+Itjms+6QEiFk/YRbSOHWRFvGHhnwf
	5SQcpdS7w0A1XDJwdstSrATREcHhiQ3DyXyMugkggnp7dE0FXmFoIN1vsg1nFfgfRMEKktRS+gCJJ
	1X8ztaVo+r6VA3+9pMYIIKa5z6G/k07iBhPxPqmNa9MCs4z4xMmUA3tRjL9rxMXyNYuP3JvfobZPk
	yU0ZeRPg0+f1cVmNNU8cZLUlfjpSb8cY1N572U///Uf9cdFwcmU+5n78cvdFizgq8dP+GZJyXhsDR
	eRMo4lOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjZ1-00000003zxc-1JYH;
	Thu, 11 Sep 2025 15:50:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjYz-00000003zwW-2jpg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:50:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46C584020C;
	Thu, 11 Sep 2025 15:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A9AC4CEF5;
	Thu, 11 Sep 2025 15:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757605821;
	bh=KrP0T2DcrwhQKhYMWfFSKZufjGZ6OuhA6JrtiaI9b+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G6zXuT/zvwAvW/LwpZj95aIEc1iO6la+8BhMyRIFh+A823lmW0h0fUNxNZLxsH/rS
	 Yz0eSycTxUvy/Tv3ocvDpEbrh5ZTXZwzreTCjUT+Am2S+6K96ulA40DxURNB31xlRP
	 NRKR6OSIVKo+P0kQIy7DBQYfZDxIcVzp7pEA+MaSzfPYQciq5bp3lGX3Wlr2H4rx6h
	 VkItVoTHHwzx6pM1IylBMm05gQgVfxVQKTfmab6LxEZ7EF/Gmtfn/oTY7sQtDuPwK5
	 TfqKexDtTMPfk5hg73O6a/EOqzggZWFGXm+GNh+uq2ERCEKw3pfIk4XOIIDqnQiXJF
	 NEO4AozbipWaQ==
Date: Thu, 11 Sep 2025 16:50:14 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, catalin.marinas@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, corbet@lwn.net,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	shuah@kernel.org, jonathan.cameron@huawei.com,
	shameerali.kolothum.thodi@huawei.com, linuxarm@huawei.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com,
	tangchengchang@huawei.com, wangzhou1@hisilicon.com
Subject: Re: [PATCH v4 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
Message-ID: <aMLvtpaCgRqPAU2Z@willie-the-truck>
References: <20250715081356.12442-1-yangyicong@huawei.com>
 <20250715081356.12442-6-yangyicong@huawei.com>
 <aL7Fgx__LeLfbDyU@willie-the-truck>
 <5d2ba565-715b-9b17-951b-f805dde5988b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d2ba565-715b-9b17-951b-f805dde5988b@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_085021_710384_04536868 
X-CRM114-Status: GOOD (  18.39  )
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

On Tue, Sep 09, 2025 at 09:48:04AM +0800, Yicong Yang wrote:
> On 2025/9/8 20:01, Will Deacon wrote:
> > On Tue, Jul 15, 2025 at 04:13:54PM +0800, Yicong Yang wrote:
> >> diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
> >> index 69d7afe56853..9e6db258ff48 100644
> >> --- a/Documentation/arch/arm64/elf_hwcaps.rst
> >> +++ b/Documentation/arch/arm64/elf_hwcaps.rst
> >> @@ -435,6 +435,12 @@ HWCAP2_SME_SF8DP4
> >>  HWCAP2_POE
> >>      Functionality implied by ID_AA64MMFR3_EL1.S1POE == 0b0001.
> >>  
> >> +HWCAP3_LS64
> >> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0001.
> >> +
> >> +HWCAP3_LS64_V
> >> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0010.
> > 
> > Given that these instructions only work on IMPLEMENTATION DEFINED memory
> > locations and aren't guaranteed to generate an abort if used elsewhere,
> > how is userspace supposed to know what to do with them?
> > 
> 
> per ARM DDI0487 L.b section C3.2.6,
> 
>   When the instructions access a memory type that is not one of the following,
>   a data abort for unsupported Exclusive or atomic access is generated...

That's about the memory _type_. I'm talking about a supported memory type
(e.g. writeback cacheable) but when the physical location doesn't support
the instruction. That's captured a little later in the same section:

  | If the target memory location does not support the LD64B or ST64B
  | instructions, then one of the following behaviors occurs:
  |  * A stage 1 Data Abort, reported using the DFSC code of 0b110101,
  |    is generated.
  |  * The instruction performs the memory accesses, but the accesses
  |    are not single-copy atomic above the byte level

and I think that's a bad interface to expose blindly to userspace solely
as a boolean hwcap.

Will

