Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85045C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPoHsPfy/OgluxiJX0tnkjqLEl8vAeTNXImQ3O20BnU=; b=zpvX16VAmVFHYeuRF03byt2qWz
	Pk8z0WO30B6ZmnpojFO1UbsjqN2Mre9Jx71Vt9M22HHpvqXRFcQD6uTi3Pcqv/Qs9dpt3gOocu18A
	TshAORngUjZ78E33cQ5vq6GCOL3KltMcQNX0NCCw9QHPg0OtG8rGgkYswB5A7S2+Eh1aEe5qORtx1
	kBIPKqQ2pbpUUGRB71oCu2h//t95dNB2hCvtZwrJiUBI+qpSZqNjJCSnpE08QFK7jg/S6LG4a7wsy
	kndFDQ/XgEEsDyFbktoSMM9KWj2b0gGvrV3xfCzm6tilJBEXtj/N7lXSP4YHC/rB/558aWwY7AuU6
	MNRJ6U4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DgR-00000007Igb-3rzM;
	Tue, 22 Apr 2025 13:29:07 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CMW-0000000734Q-0luc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:04:29 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MC4Lkr1937743
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 07:04:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745323461;
	bh=oPoHsPfy/OgluxiJX0tnkjqLEl8vAeTNXImQ3O20BnU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OGpJAC0VuVGOA3kOuyjgqGq8wsS0jXgYJnzMjjBz0VafePx6UoBIIZAkruXPKloTq
	 a7VGhNc048jSWr9uKP1GpMse6iaUqQCqQYUaXHVwEx0RYER+seXV1F+O5VvMX93rO7
	 ap+k5QnhRF2zQsdcFdd8TdPBIiPKfAecr1rFQGRk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MC4Lnm129809
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 07:04:21 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 07:04:20 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 07:04:20 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MC4KYl099080;
	Tue, 22 Apr 2025 07:04:20 -0500
Date: Tue, 22 Apr 2025 07:04:20 -0500
From: Nishanth Menon <nm@ti.com>
To: Randolph Sapp <rs@ti.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>, Matt Coster <matt.coster@imgtec.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Frank Binns
	<frank.binns@imgtec.com>,
        Alessio Belle <alessio.belle@imgtec.com>,
        Alexandru
 Dadu <alexandru.dadu@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
Message-ID: <20250422120420.iv2hbaf4ykqazvlx@bleak>
References: <20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com>
 <20250417-bxs-4-64-dts-v2-2-9f8c09233114@imgtec.com>
 <8017c015-73aa-4807-a177-d5391e073981@ti.com>
 <D9CPY0IDAJSR.39JPPAXZAUNQE@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <D9CPY0IDAJSR.39JPPAXZAUNQE@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_050428_312301_4D39831B 
X-CRM114-Status: GOOD (  34.17  )
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

On 18:51-20250421, Randolph Sapp wrote:
> On Sat Apr 19, 2025 at 11:15 AM CDT, Udit Kumar wrote:
> > Hello Matt,
> >
> > On 4/17/2025 2:40 PM, Matt Coster wrote:
> >> The J721S2 binding is based on the TI downstream binding in commit
> >> 54b0f2a00d92 ("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1]
> >> but with updated compatible strings.
> >
> > Downstream kernel[1] sha 5657fc069e8b3 ("PENDING: arm64: dts: ti: 
> > k3-j721s2-main: add gpu node")
> >
> > also has assigned-clock-rates.
> >
> > Please check if gpu node needs assigned-rate too.
> 
> If I remember correctly, J721S2 was one of the few platforms that actually
> defaulted to 800MHz, so it may not be necessary for that platform specifically.
> (I don't have a board to test this right now though. This very well may have
> changed.) AM62 also defaults to the correct value, and that one I did manage to
> verify.
> 
> That being said, Udit is right, it's generally a good idea to explicitly set the
> clock speed for our devices. I know AM62P, for example, used to default our
> clock to the bus speed.
> 
> At one point though this driver was experimenting with a DVFS mechanism. Matt,
> use of assigned-clocks shouldn't interfere with that assuming there is no
> defined opp-table, right? May be a good idea to set our usual 800 MHz for J721S2
> and 500 MHz for AM625. This shouldn't require any binding related changes.
> 
> On the topic of opp tables for the GPU, I did some testing on the proprietary
> driver a little while back. These devices do not support voltage scaling and
> simple frequency scaling saw a general decrease in performance and increase in
> power draw for the usual utilization bursts a single application running at 60
> FPS generates. I have a feeling this will carry over to the open source driver,
> but we can always do additional testing if you are curious.
> 
> - Randolph
> 
> >> The clock[2] and power[3] indices were verified from HTML docs, while
> >> the intterupt index comes from the TRM[4] (appendix
> >> "J721S2_Appendix_20241106_Public.xlsx", "Interrupts (inputs)",
> >> "GPU_BXS464_WRAP0_GPU_SS_0_OS_IRQ_OUT_0").
> >
> >> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
> >> [2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.html
> >> [3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devices.html
> >> [4]: https://www.ti.com/lit/zip/spruj28 (revision E)
> >>
> >> Reviewed-by: Randolph Sapp <rs@ti.com>
> >> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> >> ---
> >> Changes in v2:
> >> - Add interrupt reference details
> >> - Add Randolph's Rb
> >> - Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-2-f7d3fa06625d@imgtec.com
> >>
> >> This patch was previously sent as [DO NOT MERGE]:
> >> https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-18-eda620c5865f@imgtec.com
> >> ---
> >>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
> >>   1 file changed, 12 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> >> index 92bf48fdbeba45ecca8c854db5f72fd3666239c5..a79ac41b2c1f51b7193e6133864428bd35a5e835 100644
> >> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> >> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> >> @@ -2048,4 +2048,16 @@ watchdog8: watchdog@23f0000 {
> >>   		/* reserved for MAIN_R5F1_1 */
> >>   		status = "reserved";
> >>   	};
> >> +
> >> +	gpu: gpu@4e20000000 {
> >> +		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
> >> +		reg = <0x4e 0x20000000 0x00 0x80000>;
> >> +		clocks = <&k3_clks 130 1>;

On the basis of the above discussion, Matt,
please add:
assigned-clocks = <&k3_clks 130 1>;
assigned-clock-rates = <800000000>;

> >> +		clock-names = "core";
> >> +		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> >> +		power-domains = <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
> >> +				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
> >> +		power-domain-names = "a", "b";
> >> +		dma-coherent;
> >> +	};
> >>   };
> >>
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

