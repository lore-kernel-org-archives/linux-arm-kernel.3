Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B685C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1u+6otlLYP9PUizxVuTiyaZgAtOo0g9T7ez9cTA60Y0=; b=xZb1w22UPsy0GWZoplnP2qcPHZ
	YWIwd2RJ8KoC6xNCd19d9O0QhPDoV+3ieaxyrdaUaIT0SJQYqNQcbbNgI8dHvwUlnyttXdUD1uQ6R
	4cnSSsK9wlLWOhbcvoa3tPaUedt9rJQo12bLXXNtZVx/FR6KH5FVeMhZzjK5cz93pORl90D5mM9K/
	NxanUoaCxKj2VAO7XJ7QANxas/wsNlIOmynmT0071sceh/FNWKZuZ/cGn41JiPDxQKh9xsy5GUrzg
	vghkbfrE504eUD/sJQPNQUrBoyXDmBArXEWuoYKotfxsN/aMjdktHbSOIYYpk2TypAvy5GGsPqBEY
	JztLluTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Sck-000000060Ad-3VPp;
	Mon, 07 Sep 2026 06:14:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Scj-000000060AH-1ELL;
	Mon, 07 Sep 2026 06:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1u+6otlLYP9PUizxVuTiyaZgAtOo0g9T7ez9cTA60Y0=; b=jVcqs2vmqDSfyaoWAk3DSfABhQ
	rtPzgU1zOCifUxclxZ4k1ytX/1OJOhohb7BPqRW7m6qFWDg2ScDypOwuAw2nOfuapncCarV2bhiBN
	FZageSOIQYMLxgvFFSkw6YONahPbS3hlaF0RzZqKRh8FNXk/2keqvgLKbKpfODrd55Rf/Opizei0a
	MmCrcxqdZO79xychV5ZHwW9pNtG2p0qsX0ZD6U4leOpDrbay2QkUasjERsbXcuKwjGGqXubvmLhi/
	b6F4TnzuZvanSkTcYnC/S+nRGaF7E4b3C2PumdejPOW/iAbiDb+2fsRmJjUfUap5hOHoZNgyT4XD4
	hACwVF2g==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3Sce-0000000FqxU-3fKu;
	Mon, 07 Sep 2026 06:14:31 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6876DfLiA2563156, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788761621; bh=1u+6otlLYP9PUizxVuTiyaZgAtOo0g9T7ez9cTA60Y0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=PTSp/vYDbglB0UVTkFZc1ZzYbvHwafcOjaj3QrDDaUw6RKUc81GKmE/vWUHeqUmJH
	 G/NG8u7NjCs8aHvpTL2A7hYrR54+btVw1shNRWPQNfo0P1047gusxYrAP/0W1D+VoX
	 AY0WUJ8/GlqJ49SSK4J5xWpas/6kaVt1Iin92X3dUFcI45PldTxW7faefPYFsPNDld
	 WzO8BQ3DcptYdpTKgQwY7nKa7Mjw0OQW2ONcdUY6Gzk+PsZ0shT6OssP3ZiFZocslt
	 8uclbPTHXEtShHBAoRYpzn1JQMz43wvatIn9M4pCg4M1gufKVleJJFCr9yoqN2EFR5
	 yxAnpaI3FJKyg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6876DfLiA2563156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Sep 2026 14:13:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 7 Sep 2026 14:13:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::126f:59ad:658:674d%10]) with mapi id
 15.02.2562.043; Mon, 7 Sep 2026 14:13:41 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: hpp.iscas <hppiscas@163.com>, =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
	<james.tai@realtek.com>
CC: =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.com>, Linus Walleij
	<linusw@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
	<tychang@realtek.com>
Subject: RE: [PATCH] pinctrl: realtek: rtd1619b: Publish the OF module alias
Thread-Topic: [PATCH] pinctrl: realtek: rtd1619b: Publish the OF module alias
Thread-Index: AQHdPTy094f4ciS4BkGSvd3QPNG9kbbCpD4A
Date: Mon, 7 Sep 2026 06:13:41 +0000
Message-ID: <84a7569139af472aaf704c6517b04f69@realtek.com>
References: <20260905134418.67619-1-hppiscas@163.com>
In-Reply-To: <20260905134418.67619-1-hppiscas@163.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_071429_751888_F6C91D72 
X-CRM114-Status: GOOD (  17.37  )
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

SGksDQoNCj4gVGhlIFJURDE2MTlCIHBpbmN0cmwgZHJpdmVyIGlzIGEgc2VwYXJhdGUgdHJpc3Rh
dGUgb2JqZWN0IHVzaW5nDQo+IA0KPiBydGQxNjE5Yl9waW5jdHJsX29mX21hdGNoLiBUaGUgZ2Vu
ZXJpYyBSZWFsdGVrIHBpbmN0cmwgc3VwcG9ydCBkb2VzIG5vdA0KPiANCj4gcHVibGlzaCBhbiBh
bGlhcyBmb3IgdGhpcyBTb0MgbW9kdWxlLg0KPiANCj4gDQo+IA0KPiBFeHBvcnQgdGhlIGV4aXN0
aW5nIE9GIHRhYmxlIHdoaWxlIHJldGFpbmluZyB0aGUgaW5pdGlhbGl6YXRpb24gb3JkZXIuDQo+
IA0KPiANCj4gDQo+IEZpeGVzOiBjNzkxMGY2YWNhNTYgKCJwaW5jdHJsOiByZWFsdGVrOiBBZGQg
cGluY3RybCBkcml2ZXIgZm9yIFJURDE2MTlCIikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IGhwcC5p
c2NhcyA8aHBwaXNjYXNAMTYzLmNvbT4NCj4gDQoNClBsZWFzZSB1c2UgeW91ciByZWFsIG5hbWUu
DQoNCj4gLS0tDQo+IA0KPiAgZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvcGluY3RybC1ydGQxNjE5
Yi5jIHwgMSArDQo+IA0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiAN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZDE2
MTliLmMNCj4gYi9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZDE2MTliLmMNCj4g
DQo+IGluZGV4IGIwN2U1MGQuLmUwM2UxZmIgMTAwNjQ0DQo+IA0KPiAtLS0gYS9kcml2ZXJzL3Bp
bmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZDE2MTliLmMNCj4gDQo+ICsrKyBiL2RyaXZlcnMvcGlu
Y3RybC9yZWFsdGVrL3BpbmN0cmwtcnRkMTYxOWIuYw0KPiANCj4gQEAgLTE1NzUsNiArMTU3NSw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkDQo+IHJ0ZDE2MTliX3BpbmN0cmxf
b2ZfbWF0Y2hbXSA9IHsNCj4gDQo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0
ZDE2MTliLXBpbmN0cmwiLCB9LA0KPiANCj4gICAgICAgICB7fSwNCj4gDQo+ICB9Ow0KPiANCj4g
K01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHJ0ZDE2MTliX3BpbmN0cmxfb2ZfbWF0Y2gpOw0KPiAN
Cj4gDQo+IA0KPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgcnRkMTYxOWJfcGluY3Ry
bF9kcml2ZXIgPSB7DQo+IA0KPiAgICAgICAgIC5kcml2ZXIgPSB7DQo+IA0KDQpUaGUgY29kZSBs
b29rcyBnb29kIHRvIG1lLCBidXQgJ2dpdCBhbScgZmFpbGVkIHRvIGFwcGx5IHRoZSBtYm94LiAN
Ckkgbm90aWNlZCA9MEQgaW4geW91ciBwYXRjaCwgd2hpY2ggbWlnaHQgYmUgdGhlIHJlYXNvbiBp
dCBmYWlsZWQuDQoNCkJlc3QgUmVnYXJkcywNCll1LUNodW4NCg==

