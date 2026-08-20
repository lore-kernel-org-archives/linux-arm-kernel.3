Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7383C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 05:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qe8FKlZhSpcuo4F/GPBPV4eCBlhrPJ5e3vrOBNcgGIA=; b=XN7WN2/fxQDUEiLVdGK2off09E
	uDJGT83OyNGwDLSPdKI1v/CSvqXR7qXMKmlAe75GaKzy4YZ5x4SmCHK5U/nIxKT98M78n0iWTyApj
	MbRZfO4hUL8w7dTtjlmfTgFyQkI7kMpOqu2tgl6ssCZV4eNFDWGSC1u3EayNbkwO4PyRr52/fkUds
	qUL7Pxedjm194vKdaUhrJqsrb3xVCPFUw/eyEE0z0Voc2PKspJJt05fNNVAnFqKot7IDxXjQ32B+Y
	Wse75K8IS10ZTq4m97ZKCyv2Pv10fZ/Mqevbt0Qlls1B1Pa5iRevUakMDS1LTV0mjVxZrEh6ls7SM
	Su/zJ2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvnr-0000000Atci-3vec;
	Thu, 20 Aug 2026 05:59:03 +0000
Received: from smtp2.infineon.com ([2a00:18f0:1e00:4::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvnp-0000000Atbl-1BAs;
	Thu, 20 Aug 2026 05:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205541; x=1818741541;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Qe8FKlZhSpcuo4F/GPBPV4eCBlhrPJ5e3vrOBNcgGIA=;
  b=f4n9k6kkVta/ut6QCfgNHxJHSb8yPOzgaI9AiOHSIxYWqKSHiYgb8pPy
   iGGpncr2evz2Sq4xWiUIrUzLUqwA0+m3gKEWHmRsh9nOWrExSN9tMezA8
   nTN2tj7jxy8qSeP7UW2FyqToVuZ3DpSFhULJLre8P6CCP6ahh2KY0dhis
   s=;
X-CSE-ConnectionGUID: xT6esWTyRY2U0JVNUEzQwA==
X-CSE-MsgGUID: yiniqULCTga91r315KvwQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="173544398"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="173544398"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:58:59 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:58:59 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE815.infineon.com
 (172.23.29.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:58:58 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:58:58 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 08/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-Q/N parts
Thread-Topic: [PATCH v3 08/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-Q/N parts
Thread-Index: AQHdKzc8iS3M3S4Pl0ajaTH9fJZ747ame0sg
Date: Thu, 20 Aug 2026 05:58:58 +0000
Message-ID: <fca9748398d1496e9e1dbdac19cab2dc@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-8-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-8-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_225901_640934_FFE0AD9A 
X-CRM114-Status: UNSURE (   8.99  )
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
LCBSViBjaGlwcyBpZGVudGlmeSB0aGVtc2VsdmVzIGFzIHN1cHBvcnRpbmcNCj4gdGhlIG5ldyBT
RkRQIChyZXYgRikgZmllbGQgd2hpY2ggZm9yY2VzIGFuIGFsdGVybmF0ZSB3cml0ZSBTUjIgb3Bj
b2RlDQo+ICgweDMxKS4gVGhleSBhbHNvIGRvIG5vdCByZXF1aXJlIHRoZSBtdWx0aS1kaWUgZml4
dXBzIHdoaWNoIG11c3QgcmVtYWluDQo+IGFzc2lnbmVkIHRvIHRoZSBKViBjaGlwcy4NCj4gDQo+
IEZpbmFsbHksIHNpbmNlIHRoZXkgc2hhcmUgdGhlIElEcyBidXQgbm90IHRoZSBuYW1lcywgd2Ug
bXVzdCBoaWRlIHRoZQ0KPiBuYW1lcyB1c2luZyBhIGZpeHVwLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCg0KUmV2aWV3ZWQt
Ynk6IFRha2FoaXJvIEt1d2FubyA8dGFrYWhpcm8ua3V3YW5vQGluZmluZW9uLmNvbT4NCg0K

