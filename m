Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2903C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIPg/mGpfh9Oy9NFjMRYChG/HWVzI/yjdz0fJkmdMM0=; b=iEI45hpQW4awj+QUkEzYzrp1BE
	eCRfMWAy8OqhhICyOCXuoA4BrJLDPoaSgbBa64iqMLfBK1uZFMswEPSSDp6IuUvq90Xlx0gpRJAWC
	L2ooJCU/V9jrkZLNQ8HTwXfxow914AFD4PE5Tgz4UBQheKFJt90o3HWKv18Cy7ybs55zaNtOxfmTI
	XCoO5vpCoK2M/eaXwLohtL7ONZgJ/N75xJN5DaZfanMAJGoWcq3YAglhi59snyaG+91hsFGR8oA3m
	8x3v7mqL2jXp/IGy5PjLVN3nGceQO79+BXYDumzjWrq/0vdwrrcxb3OqEjIpAg/BBCVo4J3W+ypJa
	sSBrk/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibC8-00000005o8T-1LL7;
	Wed, 21 Jan 2026 16:36:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibC7-00000005o8D-1inw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 335EC6013C;
	Wed, 21 Jan 2026 16:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC97EC4CEF1;
	Wed, 21 Jan 2026 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769013393;
	bh=jyOJK9Brcl5ZhV3njyf4Ouj8+fRI7j/5TDwpUrYhhXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zs53a3dzsy5r4PU1K9PbWEb29lqyMc8Z4LfVH4n2J6kl/zuNIeNgEJB8SAe4xCcab
	 y65vr7O65h02QXskM4MYait5EBO2A7Vcmg+k6p9I9bXjjF/ejdB/Z6iWohzEmIwaT7
	 VNhVHC3wWxUTaFNoKYxWnQKbdLgzvKVFTXoLehBsnWcr4Z5e7xBxC4vOPhRQ0RIy3z
	 0d3f/j3ufkuXBv0PZGyZVoNUm351ySV0cr9QbPO5WfkWBLnE3rjkj2q5N6oPRd73ar
	 xXYMgG+XGNU1PQkCuK8yNt6E/ZgwsiXRKn9Q1WfImTMQXo3jltfuO8wqYg5WmSNca6
	 R5q/Nl7u8fyjQ==
Date: Wed, 21 Jan 2026 16:36:26 +0000
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	catalin.marinas@arm.com, broonie@kernel.org, oliver.upton@linux.dev,
	miko.lenczewski@arm.com, kevin.brodsky@arm.com, ardb@kernel.org,
	suzuki.poulose@arm.com, lpieralisi@kernel.org,
	yangyicong@hisilicon.com, scott@os.amperecomputing.com,
	joey.gouly@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com,
	shuah@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 RESEND 9/9] arm64: armv8_deprecated: apply FEAT_LSUI
 for swpX emulation.
Message-ID: <aXEAitvWkRWX_eiL@willie-the-truck>
References: <aW5O714hfl7DCl04@willie-the-truck>
 <aW6w6+B21NbUuszA@e129823.arm.com>
 <aW9O6R7v-ybhrm66@J2N7QTR9R3>
 <aW9T5b+Y2b2JOZHk@e129823.arm.com>
 <aW9sBkUVnpAkPkxN@willie-the-truck>
 <aW/Ck3M3Xg02DpQX@e129823.arm.com>
 <aXDbBKhE1SdCW6q4@willie-the-truck>
 <aXDn3iRXEtgaUtnp@e129823.arm.com>
 <aXD81LT6TX32vlTS@willie-the-truck>
 <aXD/YFNirTfoATvN@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXD/YFNirTfoATvN@e129823.arm.com>
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

On Wed, Jan 21, 2026 at 04:31:28PM +0000, Yeoreum Yun wrote:
> On Wed, Jan 21, 2026 at 04:20:36PM +0000, Will Deacon wrote:
> > On Wed, Jan 21, 2026 at 02:51:10PM +0000, Yeoreum Yun wrote:
> > > > On Tue, Jan 20, 2026 at 05:59:47PM +0000, Yeoreum Yun wrote:
> > > > > On second thought, while a CPU that implements LSUI is unlikely to
> > > > > support AArch32 compatibility,
> > > > > I don't think LSUI requires the absence of AArch32.
> > > > > These two are independent features (and in fact our FVP reports/supports both).
> > > >
> > > > Did you have to configure the FVP specially for this or that a "default"
> > > > configuration?
> > > >
> > > > > Given that, I'm not sure a WARN is really necessary.
> > > > > Would it be sufficient to just drop the patch for swpX instead?
> > > >
> > > > Given that the whole point of LSUI is to remove the PAN toggling, I think
> > > > we should make an effort to make sure that we don't retain PAN toggling
> > > > paths at runtime that could potentially be targetted by attackers. If we
> > > > drop the SWP emulation patch and then see that we have AArch32 at runtime,
> > > > we should forcefully disable the SWP emulation but, since we don't actually
> > > > think we're going to see this in practice, the WARN seemed simpler.
> > >
> > > TBH, I missed the FVP configuration option clusterX.max_32bit_el, which
> > > can disable AArch32 support by setting it to -1 (default: 3).
> > > Given this, I think it’s reasonable to emit a WARN when LSUI is enabled and
> > > drop the SWP emulation path under that condition.
> >
> > I'm asking about the default value.
> >
> > If Arm are going to provide models that default to having both LSUI and
> > AArch32 EL0 supported, then the WARN is just going to annoy people.
> >
> > Please can you find out whether or not that's the case?
> 
> Yes. I said the deafult == 3 which means that allow to execute
> 32-bit in EL0 to EL3 (IOW, ID_AA64PFR0_EL1.EL0 == 0b0010)
> -- but sorry for lack of explanation.
> 
> When I check the latest model's default option value related for this
> based on FVP version 11.30
> (https://developer.arm.com/Tools%20and%20Software/Fixed%20Virtual%20Platforms/Arm%20Architecture%20FVPs),
> 
>   - cluster0.has_lsui=1 default = '0x1'    : Implement additional load and store unprivileged instructions (FEAT_LSUI).
>   - cluster0.max_32bit_el=3 default = '0x3'    : Maximum exception level supporting AArch32 modes. -1: No Support for A32 at any EL, x:[0:3] - All the levels below supplied ELx supports A32 : [0xffffffffffffffff:0x3]
> 
> So it would be a annoying to people.

Right, so you can probably do something like setting the 'status'
field of 'insn_swp' to INSN_UNAVAILABLE if we detect LSUI.

Will

