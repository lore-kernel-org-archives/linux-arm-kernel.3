Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BE0C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7lHqJ/Hl5Sm73+oTCqDi4vn8wXD99IJUxH9/6loJzU=; b=X0M/I10tUw1kUUxLv5kK/VVyeR
	6L4cp1Jr6KRs5jwZ8URIe3V1wyKZkzGd7ERobZZKvmdh3YM9gp30ifD0Gwq138DT9r4zsxPDsE5tp
	W/01cGrKBYKNeO/aRwk8obmaJpszZR+4yY32rEGmkx10hQSWPXmMbxN4smPuOci421YcQYMe20mOb
	kdr6PUoDptOzgDHEDm6QyeC1GLIeX8+WakxPkZrIUQg0xi37NbBt181tFVzOIr1O8Kxam4+YDULVI
	iEiNkHOf+/kLufMgiacgjEC9xzgYZpzqq6FUfCBZByri51plUGLHUrzbXO5SN4YyBcNIGGK1O7mxP
	8rbgDbIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpPj-0000000GlQ3-3t80;
	Mon, 03 Aug 2026 09:56:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpPi-0000000GlPe-2sYZ;
	Mon, 03 Aug 2026 09:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=L7lHqJ/Hl5Sm73+oTCqDi4vn8wXD99IJUxH9/6loJzU=; b=QcNTZeL/g7ZqoYEFRStuREm5kA
	vRZU6venUK8ANnPHuapbeuGP0AAYsC/N/Nol1VhyOexfSIlhDoElSCF/E6z2ykbPYexBFvSRrZ16c
	Z/aKSi2PazbyI5dUAoBAKCZxqq2ss74BMqOChVYgcQ3fDk0kTC8f1tx0ObOiQ0bOtHwKSZrfG2itQ
	SsdMsYUyQ1zx7sCi8NijWTO3Uq5CmxBr6t2IEClpplmsnx77pH4Y/GXDxOgEwZYSTmYkVd7PAsXao
	5TYfribKWAO8DqPwPR/Z/FlcunZszvahCWgUrqL/hM90K15iZOe/yq27huGp14QkU1z5a8ujBFhvb
	thRqUs8g==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqpPe-00000008s0M-01kT;
	Mon, 03 Aug 2026 09:56:52 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6739u1ohD232142, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785750962; bh=L7lHqJ/Hl5Sm73+oTCqDi4vn8wXD99IJUxH9/6loJzU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=e4LY5R9Xvamz7+byx8pe5ih1kqftXm3r3vcjgzHMDV7XOf7F+6Bc57gMs9Wu663Ya
	 Wt0AKinO3uoaLOCsIdFqujrrnhSxSCEVmHXfikJP+a2jG2T/GzkXP8oAPtS0RReLuG
	 KP7lEvDsAv23V+2uX/yKFF8E57RyD1qDTJ1fML4SIyehUt+A3OlDhsPESBjMJvaC49
	 7RytFYq9G0DRWdsEqdWbtPfQD0RZC8sc4fC/bjVuScS8GkWRjvEl3MYSsSiFC97FGY
	 uJQO+Q5ch8yF2cIXv1iV0YVnFf7iwsOmlfyPCjP/p5exTq5P2+2QLkFJGRJBW4+8Db
	 49OMinQTYswzw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6739u1ohD232142
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Aug 2026 17:56:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 3 Aug 2026 17:56:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Mon, 3 Aug 2026 17:56:02 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Brian Masney <bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Topic: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Index: AQHdHp1PRrydlNtj20y7WRFW4A3UiraFxLQAgAGIGQD//+r2AIAE5x2Q
Date: Mon, 3 Aug 2026 09:56:01 +0000
Message-ID: <a216b77c125544c0871b40f31c021ef7@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-10-eleanor.lin@realtek.com>
 <amuBqi43ce9bYbir@redhat.com> <577a6882b25e457fa94fa199e66f3197@realtek.com>
 <amy47how40BJnHsn@redhat.com>
In-Reply-To: <amy47how40BJnHsn@redhat.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_105650_796637_4E2C99C2 
X-CRM114-Status: GOOD (  21.47  )
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

SGkgQnJpYW4sDQoNCj4gT24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMDg6MTc6NDRBTSArMDAwMCwg
WXUtQ2h1biBMaW4gW+ael+elkOWQm10gd3JvdGU6DQo+ID4gPiBPbiBUdWUsIEp1bCAyOCwgMjAy
NiBhdCAxMDoyODowNFBNICswODAwLCBZdS1DaHVuIExpbiB3cm90ZToNCj4gPiA+ID4gRnJvbTog
Q2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0ZWsuY29tPg0KPiA+ID4gPg0KPiA+DQo+ID4gKC4u
LikNCj4gPg0KPiA+ID4gPiArICAgICB7IC8qIHNlbnRpbmVsICovIH0NCj4gPiA+ID4gK307DQo+
ID4gPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBydGQxNjI1X2NydF9tYXRjaCk7DQo+ID4g
PiA+ICsNCj4gPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJ0ZDE2MjVfY3J0
X2RyaXZlciA9IHsNCj4gPiA+ID4gKyAgICAgLnByb2JlID0gcnRkMTYyNV9jcnRfcHJvYmUsDQo+
ID4gPiA+ICsgICAgIC5kcml2ZXIgPSB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgLm5hbWUgPSAi
cnRrLXJ0ZDE2MjUtY3J0LWNsayIsDQo+ID4gPiA+ICsgICAgICAgICAgICAgLm9mX21hdGNoX3Rh
YmxlID0gcnRkMTYyNV9jcnRfbWF0Y2gsDQo+ID4gPiA+ICsgICAgICAgICAgICAgLnN1cHByZXNz
X2JpbmRfYXR0cnMgPSB0cnVlLA0KPiA+ID4NCj4gPiA+IFRoaXMgZHJpdmVyIGlzIGxpc3RlZCBh
cyBhIHRyaXN0YXRlIGluIHRoZSBLY29uZmlnIGJ1dCB0aGVuIHlvdSBoYXZlDQo+ID4gPiB0aGlz
LiBJcyB0aGUgaW50ZW50aW9uIG9mIHRoaXMgZHJpdmVyIHRvIGJlIGJ1aWx0IGluIG9ubHk/DQo+
ID4gPg0KPiA+DQo+ID4gSSB3aWxsIGNoYW5nZSB0aGUgS2NvbmZpZyBvcHRpb25zIGZvciB0aGlz
IGRyaXZlciwgYXMgd2VsbCBhcyB0aGUNCj4gPiByZWxhdGVkIGNvbmZpZywgZnJvbSB0cmlzdGF0
ZSB0byBib29sLg0KPiANCj4gS2VlcCBpdCBhcyBhIHRyaXN0YXRlIGlmIHlvdSBhcmUgZ29pbmcg
dG8gdXNlIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoKS4NCj4gWW91IGNhbiBhbHNvIGRyb3Agc3Vw
cHJlc3NfYmluZF9hdHRycyB1bmxlc3MgeW91IGhhdmUgYSBzcGVjaWZpYyBuZWVkIHdoeS4NCj4g
DQo+IEJyaWFuDQoNCllvdSBhcmUgcmlnaHQuIEtlZXBpbmcgaXQgdHJpc3RhdGUgaXMgYmVuZWZp
Y2lhbCwgZXNwZWNpYWxseSBmb3IgYWxpZ25pbmcNCndpdGggdGhlIEFuZHJvaWQgR0tJIGRlc2ln
bi4NCg0KVG8gcHJvcGVybHkgc3VwcG9ydCBtb2R1bGUgdW5sb2FkaW5nIGFuZCBkcml2ZXIgdW5i
aW5kaW5nLCBJIHdpbGwgYWRkDQp0aGUgLnJlbW92ZSBjYWxsYmFjayBhbmQgZHJvcCBzdXBwcmVz
c19iaW5kX2F0dHJzLg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgdGhvcm91Z2ggcmV2
aWV3IGFuZCBzdWdnZXN0aW9ucyENCg0KQmVzdCByZWdhcmRzLA0KWXUgQ2h1bg0K

