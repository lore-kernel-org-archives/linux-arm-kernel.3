Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB68C4450E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RH04RLGz+jFlIqWnHEegMUoRMI01fhF20NaK8B6pDMw=; b=J6QSihTGXYzVuGXzUFzXvMnk4n
	EH1oGn/KJPz93VnxpLuZVtab6Ox87OQQwyifB26FBGpOihxqT3nBxAYohtIVe2ElRCw11teabpP/6
	9fmxX2h2vgGvn9yT/JaSxB8zOu8+X65Lkw+LJEXYO+Ra2aLrunbb2W/LYnn9zS8gaduDqokxzHtVG
	1ynLyjTJgG7AG8rxaDGYlPll9Kb3O+jN8VuhxDHQ3uxq8EJ2nvuF6aoilc/McME2o6AIa4onMzgsh
	wbR/YkSO6Xl5cufh6nQzbVMcSFRC72mOPKnctPc+2TIF9Zn1qcw4aidn2XOlLQbSGvIejFJbYFWTE
	H9S/6Q9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKuT-0000000HCuh-47t8;
	Thu, 16 Jul 2026 12:09:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKuS-0000000HCuK-1Yey;
	Thu, 16 Jul 2026 12:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RH04RLGz+jFlIqWnHEegMUoRMI01fhF20NaK8B6pDMw=; b=JRuv7F6Y5VUNnFw/FEPRoV49kD
	OAc+rNzA1j+Z/KIwKbl+h88Vdue29xdNIzRReHrLg9SVYWyLPEeaLf6qGQmFnE3YQ0qC8P9yW/Aeo
	7cMceyywICIvuYqyLnEIjktfLYQzIqqX7OJGVaINJxXiJqwKltH1fu21cGnBTmSH88oZnaEeTtYt0
	WJsChg4oFnt3+CbieNLBmNXA4DnmD4LW0eF44wI0b3kdZ5XjKOzPqvfpA9EUfEPGI6hBRUOosz89L
	BWe+DuH9bTzRH6RTscFyE5rs+7HRaKnqNGq4R8dcDBj4OusIf+BXUJRVkBO07c4LVQCKzCiq0xEJZ
	GDiM1m4g==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkKuO-0000000E1ki-3uID;
	Thu, 16 Jul 2026 12:09:47 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66GC8wLhA3620812, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784203738; bh=RH04RLGz+jFlIqWnHEegMUoRMI01fhF20NaK8B6pDMw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=FC89PrXKFju57TtTTAFDKLIpqT8K+zrLLqJZvevop/VX9IQuapCEyMsquHJ9OySqL
	 2mVH4njGdnheS849qfn+QOOFEMekesJfXxx/WPvbwauw/6Ed2/Uv260NFkdYqfxR7h
	 8gVRMVlnl5mJCYeSz1sJqpQcBcTV0JfeAu9oTxMyDwsfOHEfZnP4iiERwI+ufjJ+VL
	 zSRih+2xZu3KezvkmziaPf5ctik/BG16VFha9bFtmTeUQIWbdYzdOTGxWrSs+/8BoI
	 OueLMvOPUK9X9hqZ9OLMWkj2eLw6Q3UabJaqz/b50THmBHB6zGhuqfdhGBmDkQHGnE
	 WS/x39TeiDyQQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66GC8wLhA3620812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jul 2026 20:08:58 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 16 Jul 2026 20:08:58 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 16 Jul 2026 20:08:58 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Michael Walle <mwalle@kernel.org>, Andy Shevchenko
	<andriy.shevchenko@intel.com>
CC: "Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
	"afaerber@suse.com" <afaerber@suse.com>, "andy@kernel.org" <andy@kernel.org>,
	"brgl@kernel.org" <brgl@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
	<cy.huang@realtek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "dlechner@baylibre.com"
	<dlechner@baylibre.com>, =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
	<james.tai@realtek.com>, "jic23@kernel.org" <jic23@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "lars@metafoo.de"
	<lars@metafoo.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linusw@kernel.org" <linusw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>, "nuno.sa@analog.com"
	<nuno.sa@analog.com>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	=?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
	"wbg@kernel.org" <wbg@kernel.org>
Subject: RE: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Thread-Topic: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Thread-Index: AQHc4cATPP5CAXxOA0S9aBj6QrzqgrYJ8C6AgFvXxWCACcZxAIAAIc4AgAALpoCAAAi9AIAAl8rg//9/lACAAIpZkP//gIUAgACMm8A=
Date: Thu, 16 Jul 2026 12:08:58 +0000
Message-ID: <b8eb4f0680b6424097d4b8049608b27b@realtek.com>
References: <d301ba0cd45d49d59e6a014188306ec9@realtek.com>
 <20260716062614.1507243-1-eleanor.lin@realtek.com>
 <aliV4u6_xzx9D9Aq@ashevche-desk.local>
 <DJZVLZ4LLD9E.3MPLYYXT1VQ9R@kernel.org>
 <alim_HGTD5RCupav@ashevche-desk.local>
 <9ee344c1d9c642bdb7d3b85bc922fe66@realtek.com>
 <DJZY1YPMDLIN.3W0QOPEI9L8JA@kernel.org>
 <068b13e117464cf38b7b215eee72fe7a@realtek.com>
 <DJZYVQSJL0MO.143E5QFQRAXVV@kernel.org>
In-Reply-To: <DJZYVQSJL0MO.143E5QFQRAXVV@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_130945_585759_E70FB240 
X-CRM114-Status: GOOD (  17.42  )
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

PiBIaSwNCj4gDQo+ID4+IGludCAoKnZhbHVlX3hsYXRlKShzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlw
LCBlbnVtIGdwaW9fcmVnbWFwX29wIG9wLA0KPiA+PiB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB1bnNp
Z25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgbWFzaywgdW5zaWduZWQNCj4gPj4gaW50ICp2YWx1
ZSkNCj4gPj4NCj4gPj4gbWFzayBzaG91bGRuJ3QgbmVlZCB0byBiZSBhIHBvaW50ZXIgYXMgeW91
IGRvbid0IGhhdmUgdG8gbW9kaWZ5IGl0LCBkbyB5b3U/DQo+ID4+IHJlZ19tYXNrX3hsYXRlLCBh
bHJlYWR5IGRvZXMgdGhhdC4NCj4gPj4NCj4gPg0KPiA+IEFjdHVhbGx5LCBJIGRvIG5lZWQgdG8g
bW9kaWZ5IHRoZSAnbWFzaycsIHNvIGl0IHN0aWxsIG5lZWRzIHRvIGJlDQo+ID4gcGFzc2VkIGFz
IGEgcG9pbnRlciB0byB0aGlzIGNhbGxiYWNrLg0KPiA+DQo+ID4gU2luY2UgdGhlIFdSRU4gZW5h
YmxlIGJpdCBhbmQgdGhlIGRhdGEgYml0IGFyZSBsb2NhdGVkIGF0IGRpZmZlcmVudA0KPiA+IGJp
dCBwb3NpdGlvbnMsIHRoZSBmaW5hbCAnbWFzaycgdXNlZCBpbiB3cml0ZSBBUEkgbXVzdCBiZSBl
eHBhbmRlZCB0bw0KPiA+IGluY2x1ZGUgYm90aCB0aGUgV1JFTiBtYXNrIGFuZCB0aGUgZGF0YSBt
YXNrLg0KPiANCj4gWW91IGNvdWxkIHN0aWxsIHJldHVybiBib3RoIGJpdHMgaW4gdGhlIGZpcnN0
IHhsYXRlLCBubz8NCj4gDQo+IEJ1dCB5ZWFoLCB0aGF0IG1pZ2h0IGJlIGEgYml0IGFzeW1tZXRy
aWNhbCBhbmQgbm90IGludHVpdGl2ZS4gU28gY2hhbmdpbmcgdGhlDQo+IG1hc2sgKGFnYWluKSB3
aXRoIHRoZSB2YWx1ZSBzb3VuZHMgb2sgdG8gbWUuDQo+IA0KPiAtbWljaGFlbA0KPiANCg0KVGhh
bmtzIGZvciBhZ3JlZWluZy4gSnVzdCB0byBjbGFyaWZ5LCByZXR1cm5pbmcgYm90aCBiaXRzIGlu
IHRoZSBmaXJzdCB4bGF0ZQ0KYWN0dWFsbHkgd291bGRuJ3Qgd29yayBmdW5jdGlvbmFsbHkuDQoN
CklmICdtYXNrJyBpbmNsdWRlcyBib3RoIHRoZSBkYXRhIGFuZCBXUkVOIG1hc2tzLCBjbGVhcmlu
ZyB0aGUgR1BJTyB3aWxsDQppbmFkdmVydGVudGx5IGNsZWFyIHRoZSBXUkVOIGJpdCBpbiAndmFs
JyBhcyB3ZWxsLg0KDQoJcmV0ID0gZ3Bpby0+cmVnX21hc2tfeGxhdGUoLi4uLCAmbWFzayk7DQoJ
LyogSWYgb3V0cHV0IGlzIDAsIFdSRU4gYml0IGluIHZhbCBiZWNvbWVzIDAqLw0KCXZhbCA9IG91
dHB1dCA/IG1hc2sgOiAwOw0KDQpTaW5jZSB0aGUgV1JFTiBiaXQgbXVzdCBhbHdheXMgYmUgJzEn
IGZvciB0aGUgaGFyZHdhcmUgdG8gdXBkYXRlLCB3ZSBtdXN0DQphcHBlbmQgaXQgYWZ0ZXIgJ3Zh
bCcgaXMgZGV0ZXJtaW5lZC4NCg0KQmVzdCBSZWdhcmRzLA0KWXUtQ2h1bg0K

