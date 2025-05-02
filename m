Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A288C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4/jusf2Aa0zeSOt4O3iLnwmJBt0CRJJuL2eBj1uMhU=; b=ArXOMZWIIBKs+AxlSvKdNbaas5
	4LBwC+9fKHtAARfOWAFF1TUMUB5q59wzIK/0xNHGc6gN42obKqL13IJAVeGztUGI/Cz8ZGfil5z07
	d6CO6K/ieHAiDJLZ5/NbCLidY4t3Y7iS3HDKo7BvYF02tn9zM8Qo50ZwvkffCH0qVodbcDeW2i2VI
	/bYJ0IondNKIGhtlbQRy6/wMfcHrY0QtNYn/IzprUsiN8k9b7AfBV9EBifDSG8pLKwOQYCjtTd6lN
	WwoHO5BgQXTRUwepHS2V97qVCRYTxDbe7czr/d2pJCBxFXxa1jBpyAPEMtDILofJm/ZAH/ye3yaIb
	GUA1uzOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArnT-00000002G0q-44iq;
	Fri, 02 May 2025 14:55:27 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArhq-00000002F9G-1TDo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:49:39 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542EnZlG253461
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 09:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746197375;
	bh=i4/jusf2Aa0zeSOt4O3iLnwmJBt0CRJJuL2eBj1uMhU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YINDoVXXjJDbV7erQnWP0Gty7XaKwMtMNJ94QIn2McScwhf7BP2GRa57kfacI13DO
	 eBYLoRDgRqzEigr7YH4WULQroKOHjtNR0LQscKx4Bqa3u1L3jkOX1KlCVRGJUgK8H3
	 b038iefF/rnE2UtIwTagAUce/CG3rNoEMcq1ZWTk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542EnZ3a064657
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 09:49:35 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 09:49:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 09:49:34 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542EnYM0003137;
	Fri, 2 May 2025 09:49:34 -0500
Date: Fri, 2 May 2025 09:49:34 -0500
From: Nishanth Menon <nm@ti.com>
To: Daniel Schultz <d.schultz@phytec.de>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62a: Set Critical Temp. to 105C
Message-ID: <20250502144934.t6hjiwp2f64ovb34@deeply>
References: <20250502142606.2840508-1-d.schultz@phytec.de>
 <20250502142606.2840508-2-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250502142606.2840508-2-d.schultz@phytec.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_074938_487459_035EA426 
X-CRM114-Status: GOOD (  19.40  )
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

On 07:26-20250502, Daniel Schultz wrote:
> The AM62Ax SoC supports two temperature ranges:
> * A: -40 to 105C - Extended Industrial
> * I: -40 to 125C - Automotive
> 
> By default, use the lower limit (105 °C) so that any AM62A running
> in Extended Industrial mode will shut down safely before overheating.
> 
> If the bootloader detects an Automotive-grade device, it should
> override this and raise the critical trip point to 125 °C.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
> index 39ff9118b6c4..40dcb9bab965 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi

Why not create a separate header for industrial grade and rename this as
automotive grade and let the board file pick the right grade used on the
board?

> @@ -19,7 +19,7 @@ main0_alert: main0-alert {
>  			};
>  
>  			main0_crit: main0-crit {
> -				temperature = <125000>;	/* milliCelsius */
> +				temperature = <105000>;	/* milliCelsius */
>  				hysteresis = <2000>;	/* milliCelsius */
>  				type = "critical";
>  			};
> @@ -50,7 +50,7 @@ main1_alert: main1-alert {
>  			};
>  
>  			main1_crit: main1-crit {
> -				temperature = <125000>;	/* milliCelsius */
> +				temperature = <105000>;	/* milliCelsius */
>  				hysteresis = <2000>;	/* milliCelsius */
>  				type = "critical";
>  			};
> @@ -81,7 +81,7 @@ main2_alert: main2-alert {
>  			};
>  
>  			main2_crit: main2-crit {
> -				temperature = <125000>;	/* milliCelsius */
> +				temperature = <105000>;	/* milliCelsius */
>  				hysteresis = <2000>;	/* milliCelsius */
>  				type = "critical";
>  			};
> -- 
> 2.25.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

