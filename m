Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46063C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 05:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsG6ot7ZlmOazh1UtDrX8fT8gQWrTeFG4WBeIFI+eJs=; b=0P9EN8udSvsNyfDIO59/jDzcC7
	d747FUlQdkAKD0SWKL31i/pU1lzCPllcG00FR/wio2VUCDCUFwF+G2+hxIjvlaY6ZMo7fZ0n1RYyN
	f2e+8myQIMqu/cdKEjF1lgBD2pRONQtBerCiDPIq0EvFMe8VyPU/Cln6o/S183jBn417F/+rYxDN+
	eZbQv84rPyglvBzFDjcnvZqlrLf/Mkb7rVLBS8+ptdw0OBFGiMOQdbFTdyIvkziDssA5jM69Dev18
	Y98emKpgJuAJdlcF3gLYSp6H0JAmD2wJPsky4S7CSiLeSG79P+bMs2KfBh2/JuCwc6IowrrpMm/Tv
	Lv0uCutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fjr-00000007BcE-0L3v;
	Wed, 23 Sep 2026 05:41:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9FjG-00000007BXg-093z;
	Wed, 23 Sep 2026 05:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FsG6ot7ZlmOazh1UtDrX8fT8gQWrTeFG4WBeIFI+eJs=; b=L9BQlBqD4WjMhJzSC1Tg9IS2K6
	e8ZwPZdRbwAHnAkkiIsSnKb0vBnRUs6XUrnHyVm0HW4HFkFARKY3IWvBciZhYvFPUIsuBRAAOkeuD
	hpWpDy8qMcqP+ep1Is3/NsIFD+b+o5APE6L/zCCjfV1mi9KkNzz7hv4jUc+9/DLbwheG9WW4TsJKQ
	Hux8B424F5iaXq6QXEdq5lMoZpyfTx5ROOKymqQxMAg5tY0pd1g82p/dwUegmQY9RnaQ+/k6RLu7M
	EYikbc/BapUGwGgl/uMi5dsLRlfjNXYmnfaF2gOdaBIcmcCCEiXK6chmqA0j0TwdeVx6O3jzMUx9c
	7GRPACbQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9FjC-0000000EOA2-08Fj;
	Wed, 23 Sep 2026 05:41:12 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68N5f17d9095196, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790142062; bh=FsG6ot7ZlmOazh1UtDrX8fT8gQWrTeFG4WBeIFI+eJs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=pymqhFPPeU4tER84cy1XcFtHI6a1KC31LW9vA5Q2a9sLk8f5NZvVgxRIo3Z27dLnV
	 15TaSUTUiVeaD3U/noIKlDAnxdqCf800nIeRc+CqUa2j35mxLzKD3y74gTHJ56PD5e
	 VO1YVb6j/rY26DzXLbVFS/4aKZ6/Uwn4z6TII5y67yqcuGxuLtJh3QOLDi+8Sn1jhW
	 avLFgtrd25VFiYWaRs401wLDj2y+guF0c+ae/nZwZBHjAoUkFDN4UMXLa+CP7NpMDk
	 CTg1xQCjoEpCYY/xr1NPK5HrTQ5hsdfUjfWT6crk4vTD+I1FPVm0pSb8beZeUmL19N
	 DUskn6t7TIJxw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68N5f17d9095196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Sep 2026 13:41:01 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 23 Sep 2026 13:41:00 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 23 Sep 2026 13:41:00 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Wed, 23 Sep 2026 13:41:00 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: "sboyd@kernel.org" <sboyd@kernel.org>, "bmasney+clk@redhat.com"
	<bmasney+clk@redhat.com>, "jbrunet+clk@baylibre.com"
	<jbrunet+clk@baylibre.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
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
Subject: RE: [PATCH v14 06/11] clk: realtek: Add support for gate clock
Thread-Topic: [PATCH v14 06/11] clk: realtek: Add support for gate clock
Thread-Index: AQHdOeL+riV/rLDnjUiZnj9EMhgPfbbPJVYAgAyi+QA=
Date: Wed, 23 Sep 2026 05:41:00 +0000
Message-ID: <63254471a74d49f198cb69718e3a565b@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-7-eleanor.lin@realtek.com>
 <178947612411.448573.8319851834736456413.b4-reply@b4>
In-Reply-To: <178947612411.448573.8319851834736456413.b4-reply@b4>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_064110_950421_BDD49ECF 
X-CRM114-Status: GOOD (  13.07  )
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

SGkgSmVyb21lLA0KDQo+ID4gK3N0YXRpYyBpbnQgcnRrX2Nsa19yZWdtYXBfZ2F0ZV9lbmFibGUo
c3RydWN0IGNsa19odyAqaHcpIHsNCj4gPiArICAgICBzdHJ1Y3QgcnRrX2Nsa19yZWdtYXBfZ2F0
ZSAqY2xrZyA9IHRvX3J0a19jbGtfcmVnbWFwX2dhdGUoaHcpOw0KPiA+ICsgICAgIHVuc2lnbmVk
IGludCBtYXNrOw0KPiA+ICsgICAgIHVuc2lnbmVkIGludCB2YWw7DQo+ID4gKw0KPiA+ICsgICAg
IG1hc2sgPSBCSVQoY2xrZy0+Yml0X2lkeCk7DQo+ID4gKyAgICAgdmFsID0gQklUKGNsa2ctPmJp
dF9pZHgpOw0KPiA+ICsNCj4gPiArICAgICBpZiAoY2xrZy0+d3JpdGVfZW4pIHsNCj4gPiArICAg
ICAgICAgICAgIG1hc2sgfD0gQklUKGNsa2ctPmJpdF9pZHggKyAxKTsNCj4gPiArICAgICAgICAg
ICAgIHZhbCB8PSBCSVQoY2xrZy0+Yml0X2lkeCArIDEpOw0KPiA+ICsgICAgIH0NCj4gPiArDQo+
ID4gKyAgICAgcmV0dXJuIHJlZ21hcF91cGRhdGVfYml0cyhjbGtnLT5jbGtyLnJlZ21hcCwgY2xr
Zy0+Z2F0ZV9vZnMsDQo+ID4gK21hc2ssIHZhbCk7IH0NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lk
IHJ0a19jbGtfcmVnbWFwX2dhdGVfZGlzYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykgew0KPiA+ICsg
ICAgIHN0cnVjdCBydGtfY2xrX3JlZ21hcF9nYXRlICpjbGtnID0gdG9fcnRrX2Nsa19yZWdtYXBf
Z2F0ZShodyk7DQo+ID4gKyAgICAgdW5zaWduZWQgaW50IG1hc2s7DQo+ID4gKyAgICAgdW5zaWdu
ZWQgaW50IHZhbDsNCj4gPiArDQo+ID4gKyAgICAgbWFzayA9IEJJVChjbGtnLT5iaXRfaWR4KTsN
Cj4gPiArICAgICB2YWwgPSAwOw0KPiA+ICsNCj4gPiArICAgICBpZiAoY2xrZy0+d3JpdGVfZW4p
IHsNCj4gPiArICAgICAgICAgICAgIG1hc2sgfD0gQklUKGNsa2ctPmJpdF9pZHggKyAxKTsNCj4g
PiArICAgICAgICAgICAgIHZhbCB8PSBCSVQoY2xrZy0+Yml0X2lkeCArIDEpOw0KPiA+ICsgICAg
IH0NCj4gDQo+IENvdWxkIGFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyB0aGlzIHdyaXRlX2VuIHRo
aW5nID8gU29tZSBraW5kIG9mIHZvbGF0aWxlIGJpdA0KPiB0byBjb21taXQgdGhlIGNoYW5nZSA/
DQo+IA0KDQpXaWxsIGFkZCBhIGNvbW1lbnQgYW5kIGltcHJvdmUgY29tbWl0IG1lc3NhZ2UuDQpJ
dCBpcyBhIGhhcmR3YXJlLXNwZWNpZmljIGRlc2lnbi4gVG8gbW9kaWZ5IHRoZSB0YXJnZXQgYml0
LCB0aGUgYWRqYWNlbnQNCndyaXRlLWVuYWJsZSBiaXQgbXVzdCBiZSBhc3NlcnRlZC4NCg0KPiA+
ICsNCj4gPiArICAgICByZWdtYXBfdXBkYXRlX2JpdHMoY2xrZy0+Y2xrci5yZWdtYXAsIGNsa2ct
PmdhdGVfb2ZzLCBtYXNrLA0KPiA+ICsgdmFsKTsNCj4gDQo+IE5pdHBpY2s6IHRoZSAyIGZ1bmN0
aW9ucyBhYm92ZSBtb3JlIGxlc3MgY29weS9wYXN0ZS4NCj4gDQoNCkkgd2lsbCBleHRyYWN0IHRo
ZSBjb21tb24gbG9naWMgaW50byBhIGhlbHBlciBmdW5jdGlvbi4NCg0KQmVzdCBSZWdhcmRzLA0K
WXUtQ2h1bg0K

