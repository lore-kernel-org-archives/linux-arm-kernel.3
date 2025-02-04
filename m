Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1020AC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 03:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YINX4T9CJ8CGG/ntIWWY0zDTXw3cBhl99CQ3+fEeTo=; b=4m7uY1nrZytM7vDTUdMtX35NBd
	5oGiYfAcBxxJu+rgW6yvuS3KCVKE97N7GHjAabrDb/76o217gr8Q7siIDT/EgRP2btC58gjMIi0R9
	12NKaDk+fc4o37vTjRqcNTDIQ2Lnc4A0YDxzj7A40YIzUUWMYvwtEEFgJDZCEAsX49u9Ee3b3QFHz
	xzA+ZDALfxkKumn2LNs3w5vOxAHxJaojfYMia8cyECTH+WtH35vGRx17Yeu3Fvu3TRkw09Wg4Z40j
	2SXyrbHnTwLQeYJuUyrR4l30jrvQ6+Pwl6nkCWFVsMn4zMTuCU5mLTn8RqgRy0adexh7owO8eS66h
	H+rUq0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfA1d-0000000HCJg-2xLX;
	Tue, 04 Feb 2025 03:55:01 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfA0F-0000000HCFC-2CGK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 03:53:36 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5143rTJW3146450
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 21:53:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738641209;
	bh=9YINX4T9CJ8CGG/ntIWWY0zDTXw3cBhl99CQ3+fEeTo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FtnFSKOdGqnhFJgLzBoy7zsGJrg2WSWeuVWBz8pKwbp828VdnIoy77ErmgQpURSRn
	 O7GsFrdlECsX/0J6iGjTlgK+nYReqp0jfgDUoPTe2dECWbDOMKWes1z94MU3Amy6Iu
	 NyxS1ip+597ywIfGmg0QM8soW1wjZabQgYqFB+o0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5143rTQ3024196
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 21:53:29 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 21:53:29 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 21:53:29 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5143rT3b061285;
	Mon, 3 Feb 2025 21:53:29 -0600
Date: Mon, 3 Feb 2025 21:53:29 -0600
From: Nishanth Menon <nm@ti.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vishal Mahaveer <vishalm@ti.com>,
        Kevin
 Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
        Sebin Francis
	<sebin.francis@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am62x-sk-common: Add serial
 aliases
Message-ID: <20250204035329.jzss2ar3t5arpgwt@reoccur>
References: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
 <20250203-topic-am62-serial-aliases-v6-14-v1-1-f26d4124a9f1@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250203-topic-am62-serial-aliases-v6-14-v1-1-f26d4124a9f1@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_195335_705633_C11DC6CF 
X-CRM114-Status: GOOD (  14.06  )
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

On 10:34-20250203, Markus Schneider-Pargmann wrote:
> Add aliases for mcu_uart0 and wkup_uart0.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> index 2f129e8cd5b9f127b1d1baab17be868938fae013..d52cb2a5a589a8e5eb325fd90324d57ec1e3783b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> @@ -12,6 +12,8 @@
>  
>  / {
>  	aliases {
> +		serial0 = &wkup_uart0;
> +		serial1 = &mcu_uart0;
>  		serial2 = &main_uart0;
>  		mmc0 = &sdhci0;
>  		mmc1 = &sdhci1;
> 
> -- 
> 2.47.2
> 
Are'nt these reserved nodes for DM/TIFS and MCU? What purpose does it
serve for us to have an alias in Linux?
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

