Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650BDCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AD+I3IeZxof6zIt9GD5seJRrZ7kdsZEabt0AFNRMoc0=; b=vpHvf2hx8qjL2OVP6dEYl0n2Jy
	hCOr/T0V9N7q0JXotzhwTL/p4oBd5lOnrvgg5Lbf0POylY4n/L7qbYD1Rm/Rk7YtHpXp6neGCxP9b
	7fYmNG8xo0QRXg89OKHxf5BAs9z+ImrXCJRNVhE+ltsZYJe2uVt4AoXK15en4nix6qaS1dc/5Qqib
	yJGEGcq99104QmFNtkIxAc/85Rz3I96Ew2o8Tx2DJOwoHdSyaXGnVhJYXQPLSMl9yQ1lYyKqNMLOj
	I8F5saqZwIYWM316lUfm4533LhAdCrTPWIThyqJrAEU4SE3zX9aAkhm1kd0qDJA7RTTdyzLDEtSUg
	wiArfc7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOy95-00000000Sb7-26xy;
	Fri, 28 Nov 2025 13:04:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOy91-00000000Sal-2Div
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 13:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1764335054; x=1795871054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lWNOLheKOqEWsmv9LHfowT+6iUlIRUKSl71DP3/ezrg=;
  b=X6Yt/U8w5NdGhdZTAKSLVlwlPgbYjdQ7jYlxzPJxZSbPPBthkCrrjPPF
   AJXqjtg8QPQjwJTU7c9jeIrKnPGfhvu5iJRKlqTzyJmu2QYohYjTsTvWW
   54xkHKu/HvH4Ihn5C/+rlz1+qvU0gIzgG9oBsuzh6KRsjCaX4/bUtUmmy
   ozs9YPxPIYz1GlXZJhH9UT2OS6snpoAlKDBW3SuVHfgA7WI/YKHIKnize
   /BpQfUh6ZbuGPcZ1Z1Ol7LdJMxpj/2aJ5zCb2OOk0EJ2i/UjdkKul/NT1
   FKbADOIVSH0VyAT0tI3YCSa7nhRcjrZ7ExRIjxHmszGUPTZ89inKmOEUK
   Q==;
X-CSE-ConnectionGUID: +nmuSS8DRJO584yhKDEqKw==
X-CSE-MsgGUID: 8Fna7HzhRnOI7SAsGjtD6Q==
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="56402189"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 06:04:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 28 Nov 2025 06:04:08 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 28 Nov 2025 06:04:07 -0700
Date: Fri, 28 Nov 2025 14:04:00 +0100
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <wsa+renesas@sang-engineering.com>,
	<Ryan.Wanner@microchip.com>, <romain.sioen@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: Add support for pcb8385
Message-ID: <20251128130400.bimjex7ptnbsokul@DEN-DL-M31836.microchip.com>
References: <20251126100151.1559590-1-horatiu.vultur@microchip.com>
 <20251126100151.1559590-3-horatiu.vultur@microchip.com>
 <4702976d-1b08-4565-88a5-d9a1b36582f9@kernel.org>
 <20251127092450.h3t5vxdfvseartx2@DEN-DL-M31836.microchip.com>
 <da46dd3f-7259-40a6-b9cd-2586ee5a4aed@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <da46dd3f-7259-40a6-b9cd-2586ee5a4aed@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_050415_798883_89DDE993 
X-CRM114-Status: GOOD (  19.91  )
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

The 11/28/2025 10:08, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/11/2025 10:24, Horatiu Vultur wrote:
> > The 11/26/2025 11:24, Krzysztof Kozlowski wrote:
> >>
> >
> > Hi Krzysztof,
> >
> >>> +
> >>> +&flx0 {
> >>> +     atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
> >>> +     status = "okay";
> >>> +
> >>> +     i2c0: i2c@600 {
> >>
> >> You added a label, so this feels like a new node, but then you miss
> >> compatible and status feels redundant.
> >
> > Ah.. OK. I didn't want to add a new node.
> >
> >>
> >> If this is override, you should rather override by labels/phandles in
> >> the first place. Even when overriding by full node path, you should not
> >> add custom labels - they belong to the base SoC.
> >
> > I can remove the label.
> > So, when I want to override or extend with new properties I should
> > labels?
> 
> 
> Yes, child of serial engine should still be extended by label/phandle,
> unless this SoC subsystem has different rule.

What do you mean by "child of serial engine"?

> 
> Best regards,
> Krzysztof

-- 
/Horatiu

