Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DD5CFD315
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 07:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhXnDQ4V/9KIygl7dx0CSNmElN3ILCs16Za7qce/QdM=; b=fduG0li9NTzoVAcRTx/l7+0PDo
	8Gk7qaPnuJt7TPSgtouWjBsLtbvd6dDkc6GWMR75NBeaJEm5RmJcErnP4c4bnpcmzEmGd9pqlXbG9
	UBKLKrkvEu4O9oSA3lpsR+Qa36egkJgL4OOQWWcW1ZDpiM1B31eEKkrtl56vsEEznJmNSlu29Jc+g
	dVRN7Yn+vuQuZ77UjGfZzVU6iC3GlpyW9HXGCmdmQPzTdoChAKBNdyIdgLpJb8N7E48LJKr2F51uQ
	I4FWLPsgcPG9QW/kU2kHHxz10SVlg+m9TaoIZYxBb0sMNr2BUJFNSkU64LpXoiWDbSbZN8d/H3PnZ
	UWSGW2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnhu-0000000Cuxl-3krf;
	Tue, 25 Nov 2025 07:43:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnhr-0000000CuxL-3zfk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 07:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1764056603; x=1795592603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s3OVtX0Inb2w62M5PPfu4Si1gSMWQ8V+WAIDspeJzbY=;
  b=Zcdz6O8dFKxB2udyzG3SrXZpVrW7lojZXvRhEiJBE8GpWnAT2qgIK8z7
   fxgs8sDk9QeCmwzPAgE4YVTB3zJQ0EY7DRHz+pp5tIulyOy5cwvQkr2RJ
   neA08KbUjAdTR22j6ItOrY2pWyDNEW4L6KKBPPb4T/n5ZwdKQLiiQNESv
   JLxUIS/xvyJ1aKH44pqkt6EyEHWTvfvhfM/MMfCH9Z7X0FIXCOAf2zfSx
   BBntbh6AesO0rXhMxrJPczPLwq11TGdoCDYgfSwRJNDSAf91eQ8gBRHR7
   3jzkTUAShkI2doWuklhHB9pOn6Nov1fxkhZ8jof9Xn4x7uDHLCDcKRwyW
   g==;
X-CSE-ConnectionGUID: u2aaJ1hoQM6K03C9PX/RcQ==
X-CSE-MsgGUID: TEPHXMFWRgmirBXI6sA6zg==
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="56204871"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 00:43:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 25 Nov 2025 00:42:40 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 25 Nov 2025 00:42:40 -0700
Date: Tue, 25 Nov 2025 08:42:36 +0100
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<wsa+renesas@sang-engineering.com>, <romain.sioen@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: Add support for pcb8385
Message-ID: <20251125074236.bf7wms6djtcy3ymq@DEN-DL-M31836.microchip.com>
References: <20251117125709.102013-1-horatiu.vultur@microchip.com>
 <20251117125709.102013-3-horatiu.vultur@microchip.com>
 <0d21cf40-3614-48f4-86e0-69c7a87458e9@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <0d21cf40-3614-48f4-86e0-69c7a87458e9@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_234324_202521_66281AFB 
X-CRM114-Status: GOOD (  12.63  )
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

The 11/22/2025 16:21, Claudiu Beznea wrote:
> 
> Hi, Horatiu,

Hi Claudiu,

> 

> > +&flx0 {
> 
> This would go after aes node to have them alphanumerically sorted. I can
> handled it while applying, if any.

Yes, I make sure that the nodes are sorted alphanumerically.

> 
> > +     atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
> > +     status = "okay";
> > +
> > +     i2c0: i2c@600 {
> > +             pinctrl-0 = <&fc0_b_pins>;
> > +             pinctrl-names = "default";
> > +             dmas = <0>, <0>;
> > +             i2c-analog-filter;
> > +             i2c-digital-filter;
> > +             i2c-digital-filter-width-ns = <35>;
> > +             i2c-sda-hold-time-ns = <1500>;
> > +             status = "okay";
> > +     };
> > +};

...

> > +&i2c0 {
> > +     eeprom@54 {
> > +             compatible = "atmel,24c01";
> > +             reg = <0x54>;
> > +             status = "okay";
> > +     };
> > +
> > +     eeprom@55 {
> > +             compatible = "atmel,24c01";
> > +             reg = <0x55>;
> > +             status = "okay";
> > +     };
> 
> Any reason for not keeping these above under "i2c0: i2c@600 {" ?

Not really. I will move them there.

> 
> Thank you,
> Claudiu
> 
> > +};
> > +
> > +&sgpio {
> > +     pinctrl-0 = <&sgpio_a_pins>;
> > +     pinctrl-names = "default";
> > +     microchip,sgpio-port-ranges = <0 3>;
> > +     status = "okay";
> > +
> > +     gpio@0 {
> > +             ngpios = <64>;
> > +     };
> > +     gpio@1 {
> > +             ngpios = <64>;
> > +     };
> > +};
> 

-- 
/Horatiu

