Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D5CC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 07:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUrPJyM6gL/q3YPxoWb9BwFgr6uWjIw/EG2VK3UDrHQ=; b=eOEKaGuOlsztX0xgtDIKRonD9v
	3Iv/lYzslTFm8dn9BumRDrsBefVoqxiycyeT3V35bWhZi5kVVcMnQbyYZpeXPg9mu4V8iX7qxu+0n
	4CByOvAsgY4W2gytpx4CUePFaWPbXoDDpZMUgnYQrDMoVQytn8Jo8pHfxfhn/jSmPoc09gu0jZfDi
	b49DHAc1w5IwxjR8RNIIuOIRnzvoDVAV+Bv36EDcS9sE7Jq4VDNgQciNxAuUFq8MCrLo0NapGwoL4
	EVNhT9LTMxAVu3BWYmccvgLE3wQ80axKXAP87Z0SeS93WOlgHX7nnm/3VZ/Wh3FnYmFyTjkwH1n2/
	DDnIWSnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxQ4-0000000B5Ly-2EJ7;
	Thu, 20 Aug 2026 07:42:36 +0000
Received: from smtp2.infineon.com ([2a00:18f0:1e00:4::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxQ1-0000000B5LB-2zHq;
	Thu, 20 Aug 2026 07:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787211753; x=1818747753;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cUrPJyM6gL/q3YPxoWb9BwFgr6uWjIw/EG2VK3UDrHQ=;
  b=bNSmbeApOz14pAEU96AmJVpmzmtyKoSN36Pv3KphOAi47j4YMxBB3lrQ
   yD4PSlu1n3Vo6YneHw7Rseve8iz7kLS2HSXjgTDBufHtBcx1/+vw1ok2r
   +ucLQVtFmvw89S7zaer85k8f4aJf8Mew7IOWmA/M5U+/4anqmYRj11zis
   E=;
X-CSE-ConnectionGUID: lCqHMEPnSrKdVMxckNyj4A==
X-CSE-MsgGUID: 4xZULP0yRByH5K+2AZu/ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="173565685"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="173565685"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 09:42:31 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 09:42:31 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 09:42:31 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 22/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-Q/N/M
Thread-Topic: [PATCH v3 22/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-Q/N/M
Thread-Index: AQHdKzdeUgXLNx85nkGFTDayVR9si7amlcrg
Date: Thu, 20 Aug 2026 07:42:31 +0000
Message-ID: <516e6eb78d3741e7bf5127e928bbe597@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-22-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-22-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_004234_088657_1BEC5082 
X-CRM114-Status: UNSURE (   9.58  )
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

SGkgTWlxdWVsLA0KDQo+IEkgY3VycmVudGx5IGRvIG5vdCBoYXZlIGFjY2VzcyB0byBhbnkgY2hp
cHMgZnJvbSB0aGUgVzI1UTI1UlYNCj4gZGVuc2l0eS4gWWV0LCBJIHN1Y2Nlc3NmdWxseSB0ZXN0
ZWQgdGhlIGVudGlyZSBKViBmYW1pbHkgYW5kIGFsbCBvdGhlcg0KPiBjaGlwcyBmcm9tIHRoZSBS
ViBmYW1pbHkuIFRoZXkgYWxsIGJlaGF2ZWQgc3RyaWN0bHkgaWRlbnRpY2FsbHksIHNvIEkNCj4g
cHJvcG9zZSB0byBuZXZlcnRoZWxlc3MgYWRkIHRoZSBtaXNzaW5nIGNvbW1lbnRzIGZvciB0aGUg
c2FrZSBvZiBjbGFyaXR5DQo+IGFuZCBjb21wbGV0ZW5lc3MuDQoNClN1YmplY3Qgc2F5cyBXMjVR
NTFSViB0aGF0IGluY29uc2lzdGVudCB3aXRoIHdoYXQgeW91IGNoYW5nZWQuDQpBbmQgaXQgd291
bGQgYmUgbmljZSB0byBoYXZlIGEgVzI1UTI1UlYgY2hpcCBhbmQgY2hlY2sgU0ZEUC4NCg0KVGhh
bmtzLA0KVGFrYWhpcm8NCg0K

