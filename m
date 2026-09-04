Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79A5C79F83
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MoKXvC6968eejIFP7iCwt2T4ExB49oBcRo4K3eSCKI=; b=IdESXvASLg4vfdZumjdap+r7km
	BuZUCu0xaxasoljCbt3uwmYcD61AedI1Ig3c+2PlS+QscHKxKKBTzATpcDoEm1rCfuGWIfjRKaM/4
	GxBGJMc9fb+eJG+kJwDmbmt571TwXZ8k/fSosFlerssP1l+oj0D89LphiwPpbolg1t2KKnObihn9y
	5+9pV7da8+3GuNYUSrlU41uKx9VFGZLjFNfCL8D5JbAsDtENwVjrGYAE83jjpLM8uBV2lZoWHlTYe
	NZX1GomWekztB0SpC/EmxalKvYSeVCZPBpkKMLijtnlX8WkchCDRSIN7+4ECjE+CbXghU8zsMZAYb
	Di/fxjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PtV-00000001TyL-1r3G;
	Fri, 04 Sep 2026 09:07:33 +0000
Received: from smtp14.infineon.com ([2a00:18f0:1e00:4::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PtR-00000001Twa-3Zov;
	Fri, 04 Sep 2026 09:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1788512850; x=1820048850;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7MoKXvC6968eejIFP7iCwt2T4ExB49oBcRo4K3eSCKI=;
  b=l9YYbmfTAf1yzAqAL27w4Iu95bRkULpD5NEV4W5yZJ2mh56J2Bd3VLcG
   YZgWNQsA8EKw+u/bI+JfgjvZvXeIX1189YxTCXiJWGikPhX+7WUiyAWi1
   MH3FdPWe/Zq0cY/2YZOEg4kOsOSMi9ifC3s9btu0Du3KorAi2kDls5aKO
   M=;
X-CSE-ConnectionGUID: uJTRJ/DhRNev+wUkTRcQKg==
X-CSE-MsgGUID: 9jXa/FKoS4qX45ndJbitBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="145631225"
X-IronPort-AV: E=Sophos;i="6.25,260,1779141600"; 
   d="scan'208";a="145631225"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:07:25 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 4 Sep
 2026 11:07:24 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.046; Fri, 4 Sep 2026 11:07:24 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v4 12/25] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
Thread-Topic: [PATCH v4 12/25] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
Thread-Index: AQHdOvyPDTQdnozUAk+qARRuXX3Ydba+Hwgw
Date: Fri, 4 Sep 2026 09:07:24 +0000
Message-ID: <a6f90df0e0f742ddbbaea48ec5c0cc59@infineon.com>
References: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
 <20260902-winbond-v7-1-spi-nor-rv-addition-v4-12-779d35303dff@bootlin.com>
In-Reply-To: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-12-779d35303dff@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_020730_203094_9964C71B 
X-CRM114-Status: UNSURE (   8.94  )
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
b3JjZXMgYW4gYWx0ZXJuYXRlIHdyaXRlIFNSMg0KPiBvcGNvZGUgKDB4MzEpLg0KPiANCj4gVGhp
cyBkZW5zaXR5IHdyb25seSBhZHZlcnRpemVzIGl0cyBzaXplIGFuZCByZXF1aXJlcyBhIGZpeHVw
IGZvcg0KDQpUeXBvPyAnd3JvbmdseScNClNhbWUgaW4gcGF0Y2ggIzIwLg0KDQo+IFsuLi5dDQo+
ICsgbXRkX2RlYnVnIGluZm8gL2Rldi9tdGQwDQo+IG10ZC50eXBlID0gTVREX05PUkZMQVNIDQo+
IG10ZC5mbGFncyA9IE1URF9DQVBfTk9SRkxBU0gNCj4gbXRkLnNpemUgPSA4Mzg4NjA4ICg4TSkN
Cg0KSXMgbXRkMCBhIDhNQiBwYXJ0aXRpb24/DQoNClRoYW5rcywNClRha2FoaXJvDQoNCg==

