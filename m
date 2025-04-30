Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F93C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 08:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1B9Vx9TuYVitKWtnRjtEOwKGRCInOmSyUM43U80vjRQ=; b=X/H4p5chG2rn81EbMB9++MtNg6
	K06OAJdOP5UKcy0R/L6ngP2EUUr7e4Tnl87Quf/V8QdRDl66V3Bi97L5Y57TQDqLyt5waEXLzHAZW
	vB2MU9fTBO78pnd8m/5i2MopCvjEWtCBQrvg7lBFQ2C97oCQN1SF/E+vt/cfOeHVBIkdnS23pUQ6/
	W37HXe+rA55JcufVNteJzo5KXpcJBfXTn/ScY8dDbZOrr/qbQ70sr1tp4IRzBscdpqWXvNHIi/9rg
	PnlRXTU2DLf2Uq+GrEZqiRIObSUH5JwBboP44YeMWJ3dSnpV7jMogon+NHf837HptjIDJmnx6Zx2f
	LO/57r3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2Pb-0000000C5Ga-3PDO;
	Wed, 30 Apr 2025 08:03:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA26C-0000000C1iP-0pNG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:43:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2EA645C12F0;
	Wed, 30 Apr 2025 07:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF8EC4CEE9;
	Wed, 30 Apr 2025 07:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745998999;
	bh=gExrTVlcnDRsT84V3QRuYfykoVMoGAR/wS6ItbhLn+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8XyozunY9KfI/jWcSc7MBnMr/Kf4SDZWTl8wYF0aP3bD84wVy3Q981cvOTWZRchw
	 W44IeVBYWhlqp1UfVzv4CxaitJL8KHxK96xGyX3W3cS0aOfpISEErviIcsHEMxO8jN
	 ufO7OZF7NVZRMhw2FeuG42pUG5qv6mo/eAwLLXdQpP+xQl+PqRiR8M1fzDJntjJCad
	 bdMV4fS+ml9aXSQCcuKxd1wzMtR2P4+Qa0jl5ItXVKNTPCFqjEJ7yHhgzjcUcUocPj
	 JFxTLvBXTPZ1AqwLqQNdOLKzFXlqOyxPIYZ+CF6LA4E/tw0Ghm2N811XNkF1vIiH58
	 KdWV3hcm6Z4EQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uA26D-000000008WT-1rDN;
	Wed, 30 Apr 2025 09:43:21 +0200
Date: Wed, 30 Apr 2025 09:43:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
	quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
	quic_cang@quicinc.com
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
Message-ID: <aBHUmXx6N72_sCH9@hovoldconsulting.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
 <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
 <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>
 <aAt54vikoREWZyGY@hovoldconsulting.com>
 <17a1a4d9-fdc5-477a-bf4e-91cae5a62479@oss.qualcomm.com>
 <c4115bbc-e120-4a20-b6ad-a0d5266319d3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4115bbc-e120-4a20-b6ad-a0d5266319d3@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_004320_337931_834A31CD 
X-CRM114-Status: GOOD (  26.18  )
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

[ Qiang, it seems you mail client is removing newlines from your quoted
  replies which makes it hard to read the context. I've tried to add
  them back below, but please try to fix that up. ]

On Wed, Apr 30, 2025 at 12:15:56PM +0800, Qiang Yu wrote:
> On 4/26/2025 6:48 PM, Konrad Dybcio wrote:
> > On 4/25/25 2:02 PM, Johan Hovold wrote:
> >> On Fri, Apr 25, 2025 at 12:03:06PM +0200, Konrad Dybcio wrote:
> >>> On 4/25/25 11:51 AM, Johan Hovold wrote:

> >>>> AFAIU the PHYs do not use this qref supply directly so it does not
> >>>> belong in the PHY node (but possibly in the tcsr node that provides the
> >>>> refclk).
> >>>>
> >>>> Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
> >>>> qref supplies") it also won't have any effect for pcie4 and pcie6.

> >>> QREF is a separate hw block distributing the reference clocks across
> >>> certain on-SoC peripherals
> >>>
> >>> If its power goes out, I don't think much of the platform would be
> >>> functional anyway, so it's redundant here..
> >>>
> >>> It doesn't have its own single register region and it's frankly
> >>> one-shot-configured way before Linux starts up, so there should be
> >>> no need of describing it at all.

> >> Then it sounds like the qref supplies should be marked as always-on. Can
> >> they be disabled at all?

> > The best answer I can say is "maybe". I would (without knowing any better)
> > assume RPMh wouldn't let you turn them off. QREF predictably takes VDD_CX/MX
> > and some additional lines

> The vdda-qref power supply feeds the QREF clocks, which are consumed by 
> PCIe, UFS, USB and display on X1e80100.
> For PCIe, QREF clks are provided by the TCSR device with the following 
> bindings on X1E80100:
> #define TCSR_PCIE_2L_4_CLKREF_EN
> #define TCSR_PCIE_2L_5_CLKREF_EN
> #define TCSR_PCIE_8L_CLKREF_EN
> #define TCSR_PCIE_4L_CLKREF_EN
> 
> These QREF clocks are not enabled all the time and are disabled during 
> PHY deinit. Hence, vdda-qref should not be an always-on power supply. It 
> should be turned off when the QREF clocks are disabled.
> 
> Describing vdda-qref in the PHY device tree node is reasonable, as it 
> allows the vdda-qref power supply to be enabled or disabled along with 
> the QREF clocks during PHY init/deinit.

It may work, but it seems more reasonable to have the TCSR clock
controller manage them even if that isn't necessarily an entirely
accurate description of the hw either.

On the T14s (X1E), we have the following QREF supplies:

	VDD_A_QREFS_1P2_A
	VDD_A_QREFS_1P2_B

	VDD_A_QREFS_0P875_A
	VDD_A_QREFS_0P875_B
	VDD_A_QREFS_0P875_0
	VDD_A_QREFS_0P875_2
	VDD_A_QREFS_0P875_3

which does not seem to map directly to the three PCIe PHYs (and other
consumers).

Johan

