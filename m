Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82CDCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IebP5jPLEOV9y5xfdECM/kbLF/W1XSjQ1/QWle3e8U=; b=jdwCkax1P/vLvRisemHcGwlP22
	iDNcZJee23uFlCjhbg5R2LfryBpxbyBZNrqEHMaxXaQpD+KVHogkNNR2n66LqilXhK6ntw1Gs1RXk
	OFaYYn1IUKu2YQtWJ83gsrHp9npj/p/Ve1ue/gExOdZjaBryTBbZ9zKgc7sByWM+9xCCuxdjRzlFX
	K9myrbPjYoTuu970X6uD94XmiKRlSY3oDxPKDRROcwP8gh5Df3DMfNNAmU3PxDyEvSeSqxqAZ/EwK
	q98eJbmhfQBgDSvTWCJKoUmBxB5Nakl9RxtB/5eRpcjsujq3joiXHL7b2NN0X38+zq5dkhAvE+Nu2
	O6gNFrSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPl-0000000ErFV-2WfJ;
	Wed, 13 Aug 2025 19:45:37 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFyF-0000000Eh97-44J6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 18:13:09 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DID1bQ2205285;
	Wed, 13 Aug 2025 13:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755108781;
	bh=7IebP5jPLEOV9y5xfdECM/kbLF/W1XSjQ1/QWle3e8U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HEUvkxYPYVFUykPkuwuYTvUtj4Hd8WtVAkZcURzvpJdBrV+Y+oiRnD0s55+p0ZZqQ
	 NfvXJiL8UfvH+g/ZgsCa0Ll3Y8pTX18yTtlcFTqh0xt8Th5Ovu2RsvFzDpHOGVchj/
	 xkSXqsP4QBwVm9AVuQtXn2bXc9BlJw4SQddnz0ao=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DID1DW1152224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 13:13:01 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 13:13:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 13:13:00 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DID0Oa2390456;
	Wed, 13 Aug 2025 13:13:00 -0500
Date: Wed, 13 Aug 2025 13:13:00 -0500
From: Nishanth Menon <nm@ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <d-gole@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <detheridge@ti.com>, <matt.coster@imgtec.com>
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j784s4-j742s2: enable the bxs-4-64
Message-ID: <20250813181300.xfpsu23arx7xy4fy@anointer>
References: <20250808232522.1296240-1-rs@ti.com>
 <20250808232522.1296240-3-rs@ti.com>
 <20250813151819.5rthljjrpryfwezz@skinning>
 <DC1HU458W3QA.YLONSMYKK0C4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DC1HU458W3QA.YLONSMYKK0C4@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_111308_098324_2BC5B14A 
X-CRM114-Status: GOOD (  20.77  )
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

On 12:58-20250813, Randolph Sapp wrote:
> On Wed Aug 13, 2025 at 10:18 AM CDT, Nishanth Menon wrote:
> > On 18:25-20250808, rs@ti.com wrote:
> >> From: Randolph Sapp <rs@ti.com>
> >> 
> >> Add the relevant device tree node for Imagination's BXS-4-64 GPU.
> >> 
> >> These devices uses a similar MSMC configuration to the J721S2. As such,
> >> they also require the use of the dma-coherent attribute.
> >> 
> >> Signed-off-by: Randolph Sapp <rs@ti.com>
> >> ---
> >>  .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 14 ++++++++++++++
> >>  1 file changed, 14 insertions(+)
> >> 
> >> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> >> index 7c5b0c69897d..a44ca34dda62 100644
> >> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> >> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> >> @@ -2691,4 +2691,18 @@ bist_main14: bist@33c0000 {
> >>  		bootph-pre-ram;
> >>  		ti,sci-dev-id = <234>;
> >>  	};
> >> +
> >> +	gpu: gpu@4e20000000 {
> >> +		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
> >
> > Following  https://lore.kernel.org/linux-arm-kernel/DBE4UO2RGAYX.17V1DAF8MQYJM@kernel.org/
> > Is it worth having ti,j784s4-gpu here? Are there any SoC specific quirks
> > that driver will need to handle?
> 
> No SoC specific quirks, aside from those already being tracked through the
> dma-coherent attribute. If we actually want to register SoC specific
> compatibility entries as advised by the kernel docs, just let me know. I've seen
> this opinion toggle a few times.
> 

Please provide bootlogs on linux-next with just this series applied.
IMHO, based on what I see at the moment on GPU, it might be a good idea
to have SoC specific compatibility entries.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

