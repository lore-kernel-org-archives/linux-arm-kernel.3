Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BAACCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbibGSHctlVdbJsTuBC/kmZGeVRnYngnwTvlaiUstwI=; b=U/NuEdP0H7iEUeK0uZit+/uoOc
	9nHQU7mrFxakHKMBcg8Yz0m4seF6Dw0RkwHPvFY+NVCzf8+9TX8BIiiYcXv/mJhHVJhhOyr81eTqZ
	CEd0h42IE+fGhv0mf1s6xIDsBF543EV3TAqmu5EEBE8LQ/v8Um/XuFn69XMZjQFlvySP9pUn0sxrb
	A2jPEOUeNBUrkIpJekR7en00PsWUBAgY75Uy2AZiLy1HUvGxadlaZoPogYCer/L/FUJ1fmXfKn/Qe
	FXf1aI5sOflurhNFbQ9GmHJlRp9cK9TuXgRon9IYIflKokjKRjLSr0w5042riDcbPN2xGQ3C0/jpM
	h/+dlPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0Mr-00000004bSb-1PbW;
	Sat, 17 Oct 2026 09:06:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0Mk-00000004bQp-27HP;
	Sat, 17 Oct 2026 09:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FbibGSHctlVdbJsTuBC/kmZGeVRnYngnwTvlaiUstwI=; b=dKeLd+RYHTi1/E7SZaGuB2HcO5
	PhgexhVO4RdKaULYZVn0osUdX/q0aek42vUm4bIV5YfRDIWMX5uQZHS0jm43jGwErDYM8uOzen14m
	OJ3QkhM+jUHUv90+/lw++Q+iJye1tNeVyQv1rSFJGELZKbH05eLV6qkSzzItuJRUUI7mnABzUvCu/
	mFa/Ix0SlBpWb+VMywzgptlV+in4/eNHty+mIlJH2hL0tc4dKcxq3dcabZNcys4Xp0G5H57Z9y+dN
	SLDury1kbP+JDOfpDV/L6diLdc0hJjrUHUHJqOXzbXoNtbpgzusRQ6djjne76ef6j6t8zWCOD5GjF
	lvGaINLA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xI0Mg-00000002Fy2-3DKq;
	Sat, 17 Oct 2026 09:06:09 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69H95G9m8009797, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792227916; bh=FbibGSHctlVdbJsTuBC/kmZGeVRnYngnwTvlaiUstwI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=k6KBkH9nmehZdn7s3kmV9BOKv4wqGAiL4H2VR2l5TeE2fhIowRTS7gUZpTj9ATerU
	 oW6NnyuqdpChEe6a3srv7V3oEnQ1spoYGBevmpYKl8bpL2lG7t7KS8FyfGqGClTA6N
	 JOjZtiPFCGtq7q/qDTX6nPe4YmxU8Mzyo4mXKj/FazxmshOgChv85B0gSfMMNqRbEC
	 6f/2dEK/+3MqHhT/LZUghgtj+Xzk1RREUSQDCkfNWxFVsj/oAG8bgEHY3s9DQBVFZj
	 AmvYPX0n+ye9pLZmWyjOn9NVv4ZeANSrjUAB6XQNZvGM3kizKcTXpl7S0mHPqThTO7
	 IUyA0n9PhQbdQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69H95G9m8009797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 17 Oct 2026 17:05:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 17:05:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Sat, 17 Oct 2026 17:05:15 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: "jbrunet+clk@baylibre.com" <jbrunet+clk@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"bmasney+clk@redhat.com" <bmasney+clk@redhat.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	Brian Masney <bmasney@redhat.com>
Subject: RE: [PATCH v15 06/11] clk: realtek: Add support for gate clock
Thread-Topic: [PATCH v15 06/11] clk: realtek: Add support for gate clock
Thread-Index: AQHdUkHCGMJ17VacYUWU4SZmtnaJtrb1DaSAgAx6+iA=
Date: Sat, 17 Oct 2026 09:05:15 +0000
Message-ID: <fd89a628e14546a3ac28c78f7cc0419e@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-7-eleanor.lin@realtek.com>
 <179157057524.266328.4248123787670079601.b4-review@b4>
In-Reply-To: <179157057524.266328.4248123787670079601.b4-review@b4>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.16.3.62]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_100607_743140_61E6A3D2 
X-CRM114-Status: GOOD (  10.86  )
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

SGkgSmVyb21lLA0KDQo+ID4gSW50cm9kdWNlIGNsa19yZWdtYXBfZ2F0ZV9vcHMgc3VwcG9ydGlu
ZyBlbmFibGUsIGRpc2FibGUsIGFuZA0KPiA+IGlzX2VuYWJsZWQgZm9yIHN0YW5kYXJkIHJlZ21h
cCBnYXRlIGNsb2Nrcy4gVG8gYWNjb21tb2RhdGUgaGFyZHdhcmUNCj4gPiBkZXNpZ25zLCB0aGUg
ZW5hYmxlIGFuZCBkaXNhYmxlIG9wZXJhdGlvbnMgaGFuZGxlIGEgJ3dyaXRlX2VuJyBmbGFnLA0K
PiA+IHdoaWNoIGFzc2VydHMgYW4gYWRqYWNlbnQgd3JpdGUtZW5hYmxlIGJpdCAoYml0X2lkeCAr
IDEpDQo+ID4gc2ltdWx0YW5lb3VzbHkgd2hlbiBtb2RpZnlpbmcgdGhlIGdhdGUgYml0Lg0KPiA+
DQo+ID4gQWRkIGNsa19yZWdtYXBfZ2F0ZV9yb19vcHMgYXMgYSByZWFkLW9ubHkgdmFyaWFudCBl
eHBvc2luZyBvbmx5DQo+IGlzX2VuYWJsZWQuDQoNClsuLi5dDQoNCj4gPiArI2RlZmluZSBSVEtf
Q0xLX1JFR01BUF9HQVRFX05PX1BBUkVOVChfbmFtZSwgX2ZsYWdzLCBfb2ZzLA0KPiBfYml0X2lk
eCwgX3dyaXRlX2VuKSAgICAgICAgXA0KPiA+ICsgICAgIF9fUlRLX0NMS19SRUdNQVBfR0FURV9O
T19QQVJFTlQoX25hbWUsDQo+ICZydGtfY2xrX3JlZ21hcF9nYXRlX29wcywgX2ZsYWdzLCBfb2Zz
LCBcDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9iaXRfaWR4LCBfd3Jp
dGVfZW4pDQo+ID4gKw0KPiA+ICsjZGVmaW5lIFJUS19DTEtfUkVHTUFQX0dBVEVfTk9fUEFSRU5U
X1JPKF9uYW1lLCBfZmxhZ3MsIF9vZnMsDQo+IF9iaXRfaWR4LCBfd3JpdGVfZW4pICBcDQo+ID4g
KyAgICAgX19SVEtfQ0xLX1JFR01BUF9HQVRFX05PX1BBUkVOVChfbmFtZSwNCj4gJnJ0a19jbGtf
cmVnbWFwX2dhdGVfcm9fb3BzLCBfZmxhZ3MsIFwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgX29mcywgX2JpdF9pZHgsIF93cml0ZV9lbikNCj4gDQo+IElzIHRoaXMgX05P
X1BBUkVOVCBzdGlsbCB1c2VkID8gaWYgbm90IGRyb3AgaXQNCg0KQWNrLiBXaWxsIGRyb3AuDQoN
CkJlc3QgUmVnYXJkcywNCll1LUNodW4NCj4gDQo+IC0tDQo+IEplcm9tZQ0K

