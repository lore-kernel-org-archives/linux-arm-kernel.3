Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3780C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 07:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uBJ8Mta62b6RmQf7dtw94ndHIb5OKy4XaY6DIy9lLw=; b=XW1XMCi+qVRa4HQmlRNg1c6Fzh
	0ouh1nDYh1psBfvrnJvZaRi20f2OvQGhSnmDe0qSmFasU0wlDqsrrWKOV3RS9WOS1l6lj8vyMHT7Y
	aDrHj/8QtmsS6stvH4xUFcGFdkkoNd2XOakGQhX1mfZQaC8AGauRAgmB7EjoeHq1VscHkFEXiGvHH
	jtFu1cnzlWZSuNZuYnPq0i2V079+T43Ps36NXSpa72IyarMxhm+1ec0Az/hKTTi2pvKBxnFOyD+KK
	IMiOWWMqsDSAs/SEcKa3GEQUPwL+VleLJyRiXbV9WI6pXa5NEuvcM5Bwi5vaosKJZmD6PQeZr3KvS
	S6gd1y7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwpX-0000000B05m-1GXN;
	Thu, 20 Aug 2026 07:04:51 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwpU-0000000B04r-0FKl;
	Thu, 20 Aug 2026 07:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787209488; x=1818745488;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8uBJ8Mta62b6RmQf7dtw94ndHIb5OKy4XaY6DIy9lLw=;
  b=N9+2Bv5Za0EZW/RX277qdyaVR4NFCV+uGKbrV0f9h73xrUaxxAnDr8Nm
   Dy7/E2LTX+iaR9ovIX6KIHKaZDzhUOYQ8y6Jr9blLdAlS9ne1U8GBeAyx
   jJ4pwcwDzP7IseIWm8Cm2CaUcHgliGnD+KK5kUdtQXLtKJmCBmkpbBP5W
   g=;
X-CSE-ConnectionGUID: ABJj3vDsQVOZ22lUpvgejQ==
X-CSE-MsgGUID: wBy2RtI/QkmwESO3DyWbYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105427185"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="105427185"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 09:03:45 +0200
Received: from MUCSE818.infineon.com (172.23.29.44) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 09:03:44 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE818.infineon.com
 (172.23.29.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 09:03:44 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 09:03:44 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 23/23] mtd: spi-nor: debugfs: Expose SR opcodes and QE
 mask
Thread-Topic: [PATCH v3 23/23] mtd: spi-nor: debugfs: Expose SR opcodes and QE
 mask
Thread-Index: AQHdKzdfZ2b8fOyMyk+wKDEcGW2sy7amjJxQ
Date: Thu, 20 Aug 2026 07:03:44 +0000
Message-ID: <2bf142b04caf4c578cfbc57740490632@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-23-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-23-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_000448_429987_1A0A832A 
X-CRM114-Status: UNSURE (   9.67  )
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

SGkgTWlxdWVsLA0KDQo+IEV4cG9zZSBTdGF0dXMgUmVnaXN0ZXIgb3Bjb2RlcyBiYXNlZCBvbiB0
aGUgZmxhc2ggY2FwYWJpbGl0aWVzDQo+IGRpc2NvdmVyZWQgd2hpbGUgcGFyc2luZyB0aGUgU0ZE
UCBRRVIgZmllbGQuDQo+IA0KPiBWYWx1ZSAnMCcgaW5kaWNhdGVzIGFuIGFic2VuY2Ugb2Ygb3Bj
b2RlIChub24gc3VwcG9ydGVkKSwgd2UgZG8gbm90DQo+IHByaW50IGFueXRoaW5nIGluIHRoYXQg
Y2FzZS4NCj4gDQo+IFRoZSBRRSBiaXQgaXMgYWxzbyBkaXNwbGF5ZWQuDQo+IA0KPiBFeGFtcGxl
IG9uIGEgVzI1UTAySlYtTToNCj4gDQo+ICQgZ3JlcCBvcGNvZGVzIC1BMTAgL3N5cy9rZXJuZWwv
ZGVidWcvc3BpLW5vci9zcGkwLjAvcGFyYW1zDQo+IG9wY29kZXMNCj4gIHJlYWQgICAgICAgICAg
IDB4ZWMNCj4gICBkdW1teSBjeWNsZXMgIDYNCj4gIGVyYXNlICAgICAgICAgIDB4ZGMNCj4gIHBy
b2dyYW0gICAgICAgIDB4MzQNCj4gIFNSMSByZWFkICAgICAgIDB4MDUNCj4gIFNSMiByZWFkICAg
ICAgIDB4MzUNCj4gIFNSMStTUjIgd3JpdGUgIDB4MDENCj4gIFFFICAgICAgICAgICAgIFNSMiBi
aXQgMQ0KPiAgOEQgZXh0ZW5zaW9uICAgbm9uZQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCg0KUzI1SEw1MTJUOg0Kb3Bjb2Rl
cw0KIHJlYWQgICAgICAgICAgIDB4ZWMNCiAgZHVtbXkgY3ljbGVzICAxMA0KIGVyYXNlICAgICAg
ICAgIDB4ZDgNCiBwcm9ncmFtICAgICAgICAweDEyDQogU1IxIHJlYWQgICAgICAgMHgwNQ0KIFNS
MiByZWFkICAgICAgIDB4MzUNCiBTUjErU1IyIHdyaXRlICAweDAxDQogUUUgICAgICAgICAgICAg
U1IyIGJpdCAxDQogOEQgZXh0ZW5zaW9uICAgcmVwZWF0DQoNClMyNUZTNTEyUzoNCm9wY29kZXMN
CiByZWFkICAgICAgICAgICAweGVjDQogIGR1bW15IGN5Y2xlcyAgMTANCiBlcmFzZSAgICAgICAg
ICAweGRjDQogcHJvZ3JhbSAgICAgICAgMHgxMg0KIFNSMSByZWFkICAgICAgIDB4MDUNCiBTUjIg
cmVhZCAgICAgICAweDM1DQogU1IxK1NSMiB3cml0ZSAgMHgwMQ0KIFFFICAgICAgICAgICAgIFNS
MiBiaXQgMQ0KIDhEIGV4dGVuc2lvbiAgIG5vbmUNCg0KUzI1RkwyNTZTIChubyBTRkRQKToNCm9w
Y29kZXMNCiByZWFkICAgICAgICAgICAweDZjDQogIGR1bW15IGN5Y2xlcyAgOA0KIGVyYXNlICAg
ICAgICAgIDB4ZGMNCiBwcm9ncmFtICAgICAgICAweDEyDQogU1IxIHJlYWQgICAgICAgMHgwNQ0K
IFNSMiByZWFkICAgICAgIDB4MzUNCiBTUjErU1IyIHdyaXRlICAweDAxDQogUUUgICAgICAgICAg
ICAgU1IyIGJpdCAxDQogOEQgZXh0ZW5zaW9uICAgbm9uZQ0KDQpTMjhIUzUxMlQgKE9jdGFsLCBu
byBRRSk6DQpvcGNvZGVzDQogcmVhZCAgICAgICAgICAgMHhlZQ0KICBkdW1teSBjeWNsZXMgIDI0
DQogZXJhc2UgICAgICAgICAgMHhkOA0KIHByb2dyYW0gICAgICAgIDB4MTINCiBTUjEgcmVhZCAg
ICAgICAweDA1DQogU1IyIHJlYWQgICAgICAgMHgzNQ0KIFNSMSB3cml0ZSAgICAgIDB4MDENCiBT
UjErU1IyIHdyaXRlICAweDAxDQogOEQgZXh0ZW5zaW9uICAgcmVwZWF0DQoNClRlc3RlZC1ieTog
VGFrYWhpcm8gS3V3YW5vIDx0YWthaGlyby5rdXdhbm9AaW5maW5lb24uY29tPg0KDQoNCg0K

