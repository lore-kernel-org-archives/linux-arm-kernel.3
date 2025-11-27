Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A91BCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvaDduLsMJ2iqsK4R1vPoYFep9361xsT72NIMen+dRQ=; b=Sz4dV4/GQBaZ9aXn7kblt2qm9u
	J939GrQ28i+r/oidZAsRJyAdl4h8DTJ8liBtBgCGh5EovHj120qkFp3skYCZoaFbeOHSWZXKuHLju
	zhUK6UPth1JefYeimZEFeDRInyBfnH71CCTMV+EYpH+pROCsOb+Qe9pFl9kdhtQVmJtFg+JawhIVu
	qbFxkmtIo6Gi4DP2N1qxwJ9kA9mRtVzbvMMRW27fUwdXT9HTHaMg/iBkC6TzBkSLWEoaJ467JLTIm
	I8xeYlndAfvA2dHrk3ozjm0sz6ntURgaISrmcKONOTYtYT7vUxAWIh6ZlgVi3mHdBbuX/ZVgvhi6o
	uDntX5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYFk-0000000GIPb-2ktq;
	Thu, 27 Nov 2025 09:25:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYFh-0000000GIPG-2aKC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1764235524; x=1795771524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zGs0fOo6tXBdm2tLzw1qB8zGuJHcZAMDiT7yFjCFgFM=;
  b=dpZLFUnvjk5HhlRxHoxqgv7MguI5cxo4WrNSXGKtmo8DZnwJNDHfaEdm
   A3D4dPL7aSICsxyfy6oxKAR4ZZdMdoDwGY3OmVM6efNDecNFXX4bseFwu
   KBj3SOx8dqOKVaFQgkjTBjMX6RmeJFeQFyVSM6ZwXZwhVpYj2wC4CQhlw
   TDfRulEhHdJK6oEaTZC7vA5upwjgy/1CZf8GHRjxcpR+/AZ7TxwUoF9pQ
   u3QWJIs9DTrscTcxZXG/P2szGDNmaIH6iBhCvOhT7XR7CVF9F6UDmZDG1
   JsiPzK+6ZuUUw6gOZBYC5o+2dOYUAp+fKU7Guk6yACv52Z/wVekFpB4wO
   A==;
X-CSE-ConnectionGUID: h4V7cGYyRjS5kOD0W8j29A==
X-CSE-MsgGUID: RAgQNsCSRsK43X2m+wdQWg==
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="56355110"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2025 02:25:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 27 Nov 2025 02:24:56 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 27 Nov 2025 02:24:55 -0700
Date: Thu, 27 Nov 2025 10:24:50 +0100
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <wsa+renesas@sang-engineering.com>,
	<Ryan.Wanner@microchip.com>, <romain.sioen@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: Add support for pcb8385
Message-ID: <20251127092450.h3t5vxdfvseartx2@DEN-DL-M31836.microchip.com>
References: <20251126100151.1559590-1-horatiu.vultur@microchip.com>
 <20251126100151.1559590-3-horatiu.vultur@microchip.com>
 <4702976d-1b08-4565-88a5-d9a1b36582f9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4702976d-1b08-4565-88a5-d9a1b36582f9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_012525_889478_6A5DAB06 
X-CRM114-Status: GOOD (  15.56  )
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

The 11/26/2025 11:24, Krzysztof Kozlowski wrote:
> 

Hi Krzysztof,

> > +
> > +&flx0 {
> > +     atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
> > +     status = "okay";
> > +
> > +     i2c0: i2c@600 {
> 
> You added a label, so this feels like a new node, but then you miss
> compatible and status feels redundant.

Ah.. OK. I didn't want to add a new node.

> 
> If this is override, you should rather override by labels/phandles in
> the first place. Even when overriding by full node path, you should not
> add custom labels - they belong to the base SoC.

I can remove the label.
So, when I want to override or extend with new properties I should
labels?

> 
> > +             pinctrl-0 = <&fc0_b_pins>;
> > +             pinctrl-names = "default";
> > +             dmas = <0>, <0>;
> > +             i2c-analog-filter;
> > +             i2c-digital-filter;
> > +             i2c-digital-filter-width-ns = <35>;
> > +             i2c-sda-hold-time-ns = <1500>;
> > +             status = "okay";
> 
> > +
> > +             eeprom@54 {
> > +                     compatible = "atmel,24c01";
> > +                     reg = <0x54>;
> > +                     status = "okay";
> 
> Why? Was it disabled anywhere?

It wasn't disabled anywhere. I will remove this.

> 
> > +             };
> > +
> > +             eeprom@55 {
> > +                     compatible = "atmel,24c01";
> > +                     reg = <0x55>;
> > +                     status = "okay";
> > +             };
> > +     };
> > +};
> > +
> 
> 
> 
> Best regards,
> Krzysztof

-- 
/Horatiu

