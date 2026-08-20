Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43C9C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 07:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOkJzEkBMETe+uT6f45jBqKDjwjsvVCYVg1kvaxa8sw=; b=g65BdzM4xDAZPG97WhL6S+HfoF
	UTVn99IA1r7+gqi1ich9quFGdPCAn2xJD6B/v6/WliGTgSCRjQSLBIOEeBGP+bJA3FzdMegEW8VIt
	2uYrZI02I/u3Ys2Rbs4O5SjG3HJPWbsBwShEMduqpAY2XkmVMExWn0L9zPecIfyGDPfkVxrfCl5S7
	gxvqH5GTD3aL7uJW//+WHB8lyAwKCK8uVpYjrc+YM21nPK//JFSlcemNE9hnFgL2rnGMfzQwYJggv
	6tR6/0AgyWtDjkf6YswSJrmi22XvhZTCZl5YHO4M+vxT0+zjlkemRlfv2wmOImehO/GhzhGxVVdzQ
	b7n2bs/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxHA-0000000B4GC-2vqd;
	Thu, 20 Aug 2026 07:33:24 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxH8-0000000B4FM-0bZA;
	Thu, 20 Aug 2026 07:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787211202; x=1818747202;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HOkJzEkBMETe+uT6f45jBqKDjwjsvVCYVg1kvaxa8sw=;
  b=d/QT1f/U6D2jrwKMKfqfKaxrgYq3dbGIEAh2bkDKHiutWzy555zE4Fs9
   rysbh173wjwmkgdVTvJipdUieBDI/wYqrI8+kiXVEtTso7DBbFKXyKW3A
   4buZmxKjblvCCyPpf82fd0JA+JfQ7QjEXSA7t6L/nSNumvbesbtUR2/Uv
   E=;
X-CSE-ConnectionGUID: j5L/wBpHQm+iPmq6mVyOIg==
X-CSE-MsgGUID: OgU14aDxQ9yeSY++Kpgprw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105431057"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="105431057"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 09:32:20 +0200
Received: from MUCSE811.infineon.com (172.23.29.37) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 09:32:19 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE811.infineon.com
 (172.23.29.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 09:32:19 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 09:32:19 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 11/23] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
Thread-Topic: [PATCH v3 11/23] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
Thread-Index: AQHdKzdIpVH7yibg9keh3oZJFvnnIbamkPWw
Date: Thu, 20 Aug 2026 07:32:19 +0000
Message-ID: <cc933d88b77b4fb5ad8f22720f08bb19@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-11-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-11-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_003322_538316_96BB86C7 
X-CRM114-Status: UNSURE (   9.57  )
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

SGkgTWlxdWVsLA0KDQo+IFRoZXJlIGlzIGFuIElEIGNvbGxpc2lvbiB3aXRoIHRoZSBjaGlwIG9m
IHNhbWUgZGVuc2l0eSBmcm9tIHRoZSBKVg0KPiBmYW1pbHkuIEJvdGggY2hpcHMgYXJlIHZlcnkg
c2ltaWxhciBpbiBwcmFjdGljZSwgaXQgaXMgbW9zdGx5IGEgbWF0dGVyDQo+IG9mIGVsZWN0cmlj
YWwgZGlmZmVyZW5jZXMgKG1vc3RseSBwb3dlciBjb25zdW1wdGlvbiBiZWluZyBsb3dlcikuDQo+
IA0KPiBBcyBhIHNpZ25pZmljYW50IGRpZmZlcmVuY2UsIFJWIGNoaXBzIGlkZW50aWZ5IHRoZW1z
ZWx2ZXMgYXMgc3VwcG9ydGluZw0KPiB0aGUgbmV3IFNGRFAgKHJldiBGKSBmaWVsZCB3aGljaCBm
b3JjZXMgYW4gYWx0ZXJuYXRlIHdyaXRlIFNSMg0KPiBvcGNvZGUgKDB4MzEpLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCj4g
LS0tDQo+ICsgY2F0IC9zeXMvYnVzL3NwaS9kZXZpY2VzL3NwaTAuMC9zcGktbm9yL2plZGVjX2lk
DQo+IGVmNDAxOA0KPiArIGNhdCAvc3lzL2J1cy9zcGkvZGV2aWNlcy9zcGkwLjAvc3BpLW5vci9t
YW51ZmFjdHVyZXINCj4gd2luYm9uZA0KPiArIHh4ZCAtcCAvc3lzL2J1cy9zcGkvZGV2aWNlcy9z
cGkwLjAvc3BpLW5vci9zZmRwDQo+IDUzNDY0NDUwMGEwMTAwZmYwMDA4MDExNzgwMDAwMGZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZg0KPiBmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYNCj4gZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmDQo+IGZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZg0KPiBmZmZmZmZm
ZmZmZmZmZmZmZTUyMGY5ZmZmZmZmZmYwMzQ0ZWIwODZiMDgzYjQyYmJmZWZmZmZmZmZmZmYNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl4NCkp1c3Qgbm90aWNlZCBzaXplIGlzIHdy
b25nIGxpa2UgcGF0Y2ggIzE4Lg0KQkZQVCBEV09SRDIgYWR2ZXJ0aXNlcyBtZW1vcnkgZGVuc2l0
eSBpbiBiaXRzICgwLWJhc2VkKS4NCkluIDEyOE1iIHBhcnRzLCB0aGlzIHNob3VsZCBiZSAweDA3
RkZGRkZGLg0KTmVlZCBwb3N0X2JmcHRfZml4dXAuDQoNClRoYW5rcywNClRha2FoaXJvDQoNCg==

