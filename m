Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593D8C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 06:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ip4PDGMrpZEu3HCJLdL+aBJ9D7NGYmTHQuK2MeL1HOE=; b=MdEcB/Kx7b7ac/oAtCKr+8GLsk
	zBNFGPVLWiGyb1Nf4jV4sNlKtpW7d9Hbfg0gtIp0xzQWlvCTeyH05rm0RPGiAH/UkpSJoGMprgjBz
	tGUoC9UMlR3J1W/tf5Sr7MBMNuD02PV0KsMynjopBQEdmuEElKTXc7loSw9vpnQgs/4H7VswQy7y6
	64X/gnmZasS3F29gBNk9RLqCuvxzmjEVIgPspL+IGYArDPu7HdRhBGzZlOuQxOvj6OqZ/MXCo9Lvb
	ovU/4szAg5TYxSHy1xsaNaO+ggwHmu4FxkysUfFAd4dK/XbXTF5EGC4Od7OyXFzMMfHoDhHPSKfaK
	L7MiXVJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1www6e-0000000Avth-14PV;
	Thu, 20 Aug 2026 06:18:28 +0000
Received: from smtp14.infineon.com ([2a00:18f0:1e00:4::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1www6a-0000000AvsM-3KzQ;
	Thu, 20 Aug 2026 06:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787206705; x=1818742705;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ip4PDGMrpZEu3HCJLdL+aBJ9D7NGYmTHQuK2MeL1HOE=;
  b=VNu0tLCk4TWGx1YjIrfUNl0l7WX7f3FogWglVhxL4cx+xoeDFCPL3XWS
   H3faseTJrnapUncCLlcBnE2fug5fUYRNO/OlFPCqpf2DodiNM7Uxosc6l
   mGrgLnNR2YIIsmON74J9Am2x1VScA+hwivs1AQi9cy7VV0LT+rT7igW9T
   Q=;
X-CSE-ConnectionGUID: EFRnncL4SHCmkkdcXbIAmg==
X-CSE-MsgGUID: QL3SOuhdSpuHSFl/YUX4+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="142734583"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="142734583"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE822.infineon.com) ([172.23.29.53])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 08:18:23 +0200
Received: from MUCSE813.infineon.com (172.23.29.39) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:18:22 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE813.infineon.com
 (172.23.29.39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:18:22 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 08:18:22 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 15/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-M parts
Thread-Topic: [PATCH v3 15/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-M parts
Thread-Index: AQHdKzdYgZD7ATgWRUKQB1xcsStmCramgOFQ
Date: Thu, 20 Aug 2026 06:18:22 +0000
Message-ID: <2556eaef1ad346518e169552d60474ed@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-15-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-15-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_231825_148901_AC3ABB3D 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

PiBUaGVyZSBpcyBhbiBJRCBjb2xsaXNpb24gYmV0d2VlbiB0aGUgSlYgYW5kIFJWIGZhbWlsaWVz
LiBCb3RoIGNoaXBzIGFyZQ0KPiB2ZXJ5IHNpbWlsYXIgaW4gcHJhY3RpY2UsIGl0IGlzIG1vc3Rs
eSBhIG1hdHRlciBvZiBlbGVjdHJpY2FsDQo+IGRpZmZlcmVuY2VzIChtb3N0bHkgcG93ZXIgY29u
c3VtcHRpb24gYmVpbmcgbG93ZXIpLg0KPiANCj4gQXMgYSBzaWduaWZpY2FudCBkaWZmZXJlbmNl
LCBSViBjaGlwcyBpZGVudGlmeSB0aGVtc2VsdmVzIGFzIHN1cHBvcnRpbmcNCj4gVGhlIG5ldyBT
RkRQIChyZXYgRikgZmllbGQgd2hpY2ggZm9yY2VzIGFuIGFsdGVybmF0ZSB3cml0ZSBTUjIgb3Bj
b2RlDQo+ICgweDMxKS4NCj4gDQo+IFNpbmNlIHRoZXkgc2hhcmUgdGhlIElEcyBidXQgbm90IHRo
ZSBuYW1lcywgd2UgbXVzdCBoaWRlIHRoZSBuYW1lcyB1c2luZw0KPiBhIGZpeHVwLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4N
Cg0KUmV2aWV3ZWQtYnk6IFRha2FoaXJvIEt1d2FubyA8dGFrYWhpcm8ua3V3YW5vQGluZmluZW9u
LmNvbT4NCg0K

