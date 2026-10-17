Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A955CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpnO/un/psF2Y/wFeGeVBwnTbNzX3x4c8IXMLtpXIwQ=; b=zjArjQQzhUr2/0ck4INS7xvA/R
	UhWlDDi8E5WPubba8MBLwBIQKw4SyWWbIk8d2ep+EFfTxrJf8Rv8i6sPZxpAQClib2m4kowK6lb8Z
	RkORRIBKyf1kskgY/6dNDueBNF4ANvKUOyIqg4mgX7TY0i9Rl0mOOifX0CMolOja2WXakQroKhROq
	VwQ8zLXPrwZBbCC6vc9p/YEJF24wHP73Bn+hTwp/jX69tvSMh7NdAS5goOHs6WVBI01WGqCLEK7bU
	94+VHTCOVTl8G0MiEslkQFXYpkBU7OsA1xGYb/pqLRTa47JRvPR+QO7VoBO40Z0e3gxwMFvH8kRW0
	zhshcfrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0iv-00000004cER-0Fno;
	Sat, 17 Oct 2026 09:29:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0is-00000004cEH-3PSm;
	Sat, 17 Oct 2026 09:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OpnO/un/psF2Y/wFeGeVBwnTbNzX3x4c8IXMLtpXIwQ=; b=eeyoqrvYdwPAV6NEJayTQKLJwz
	I0bs6NZ12S8ZCwWk902mOZGMppxRZKhqNvyPBMXKk7kwtw2te57UBLbpmi7v2tmra7ABOSGNU+DaO
	LZqqbEDRkMh8drrQLTvTuDgVVvg82+gTtgw3dutVo+0mpgxm9ZWKYGLhmyHeUJRN6zkR7+5LnTLDy
	e7d7DsfANpKrInUbLIbP/1JDx4Eeu426IzWXELPV4rAqsHdr5CgHE+un19TZ4F+UQiSwptqRKJPS+
	brldPbe/9WcrJnzuJhWbV9+PT4dP3a6Gjg63xPvl/v7ReDsE3bZFRdtGfX+NxPLmUe2XMewEyp+UY
	CIfylO6Q==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xI0io-00000002GjY-42pA;
	Sat, 17 Oct 2026 09:29:01 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69H9S7bnC032779, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792229288; bh=OpnO/un/psF2Y/wFeGeVBwnTbNzX3x4c8IXMLtpXIwQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Y0jgNpDXrvMPPN4/NMv3W0FqBK/M5OigFv2srtWv52LaHBYTygAnB++afzcqGDSZ+
	 RbgTqxjlolsSkUNcBTG4dAFv0Bn59sKwcYB9TIKK/azEedn9cNL7yQWAkRCP2HtfkP
	 N8lJXea/BhU2rp5sa7MqegF+EOa+KgWPN/C0iwzqGFKBAd43bbXJ7XR4qYohcEs6IP
	 TOd1oAuOlr9obIWZgM+dNM0012SkSf/CsFmV819xqPup8LjlUl7ukPSZMg/eeR60JH
	 nEGp6g3hlFneyc4nIbjTFDjnscUFWtkPbnn2IAW2GcYQlTI54x+If6i9CXlXAsVfh/
	 neyzJleKdNbiA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69H9S7bnC032779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 17 Oct 2026 17:28:07 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 17:28:07 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Sat, 17 Oct 2026 17:28:07 +0800
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
Subject: RE: [PATCH v15 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Thread-Topic: [PATCH v15 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Thread-Index: AQHdUkHD9EdSKKuAl0mkgNwdw/LPJ7b1DaSAgAyBRoA=
Date: Sat, 17 Oct 2026 09:28:07 +0000
Message-ID: <443e5b0f037541e78e250e8e3141c8f3@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-9-eleanor.lin@realtek.com>
 <179157057524.266328.18071910694635064414.b4-review@b4>
In-Reply-To: <179157057524.266328.18071910694635064414.b4-review@b4>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.16.3.62]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_102900_054573_DF788933 
X-CRM114-Status: GOOD (  28.08  )
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

SGkgSmVyb21lLA0KDQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHJ0a19jbGtfcmVnbWFwX3BsbF9t
bWNfcHJlcGFyZShzdHJ1Y3QgY2xrX2h3ICpodykgew0KPiA+ICsgICAgIHN0cnVjdCBydGtfY2xr
X3JlZ21hcF9wbGxfbW1jICpjbGttID0gdG9fY2xrX3BsbF9tbWMoaHcpOw0KPiA+ICsNCj4gPiAr
ICAgICByZXR1cm4gc2V0X3Bvd19jdGwoY2xrbSwgNyk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0
YXRpYyB2b2lkIHJ0a19jbGtfcmVnbWFwX3BsbF9tbWNfdW5wcmVwYXJlKHN0cnVjdCBjbGtfaHcg
Kmh3KSB7DQo+ID4gKyAgICAgc3RydWN0IHJ0a19jbGtfcmVnbWFwX3BsbF9tbWMgKmNsa20gPSB0
b19jbGtfcGxsX21tYyhodyk7DQo+ID4gKw0KPiA+ICsgICAgIHNldF9wb3dfY3RsKGNsa20sIDAp
Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHJ0a19jbGtfcmVnbWFwX3BsbF9tbWNf
aXNfcHJlcGFyZWQoc3RydWN0IGNsa19odyAqaHcpIHsNCj4gPiArICAgICBzdHJ1Y3QgcnRrX2Ns
a19yZWdtYXBfcGxsX21tYyAqY2xrbSA9IHRvX2Nsa19wbGxfbW1jKGh3KTsNCj4gPiArICAgICB1
MzIgdmFsOw0KPiA+ICsgICAgIGludCByZXQ7DQo+ID4gKw0KPiA+ICsgICAgIHJldCA9IGdldF9w
b3dfY3RsKGNsa20sICZ2YWwpOw0KPiA+ICsgICAgIGlmIChyZXQpDQo+ID4gKyAgICAgICAgICAg
ICByZXR1cm4gMTsNCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuIHZhbCAhPSAweDA7DQo+ID4gK30N
Cj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgcnRrX2Nsa19yZWdtYXBfcGxsX21tY19lbmFibGUoc3Ry
dWN0IGNsa19odyAqaHcpIHsNCj4gPiArICAgICBzdHJ1Y3QgcnRrX2Nsa19yZWdtYXBfcGxsX21t
YyAqY2xrbSA9IHRvX2Nsa19wbGxfbW1jKGh3KTsNCj4gPiArICAgICBpbnQgcmV0Ow0KPiA+ICsN
Cj4gPiArICAgICByZXQgPSBzZXRfcGhydDAoY2xrbSwgMSk7DQo+ID4gKyAgICAgaWYgKHJldCkN
Cj4gPiArICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+IA0KPiBsb29rcyBmYWlybHkgY2xvc2Ug
dG8gdGhlIHJlZ3VsYXIgZ2F0ZSBhcyBpdCBzdGFuZC4NCj4gc2hvdWxkIHlvdXIgX3BvdyBiZSBp
biB0aGVyZSBpbnN0ZWFkID8NCj4gDQoNCldpbGwgbW92ZSB0aGUgcG93ZXItb24vb2ZmIG9wZXJh
dGlvbnMgaW50byB0aGUgLmVuYWJsZS8uZGlzYWJsZSBjYWxsYmFja3MuDQoNClsuLi5dDQoNCj4g
PiArDQo+ID4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIHJ0a19jbGtfcmVnbWFwX3BsbF9tbWNfcmVj
YWxjX3JhdGUoc3RydWN0IGNsa19odw0KPiAqaHcsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQNCj4gbG9uZw0KPiA+ICtw
YXJlbnRfcmF0ZSkgew0KPiA+ICsgICAgIHN0cnVjdCBydGtfY2xrX3JlZ21hcF9wbGxfbW1jICpj
bGttID0gdG9fY2xrX3BsbF9tbWMoaHcpOw0KPiA+ICsgICAgIHUzMiB2YWwsIGV4dF9mOw0KPiA+
ICsgICAgIHU2NCByYXRlLCBiYXNlOw0KPiA+ICsgICAgIGludCByZXQ7DQo+ID4gKw0KPiA+ICsg
ICAgIHJldCA9IGdldF9zc2NfZGl2X24oY2xrbSwgJnZhbCk7DQo+ID4gKyAgICAgaWYgKHJldCkN
Cj4gPiArICAgICAgICAgICAgIHJldHVybiAwOw0KPiA+ICsNCj4gPiArICAgICByZXQgPSBnZXRf
c3NjX2Rpdl9leHRfZihjbGttLCAmZXh0X2YpOw0KPiA+ICsgICAgIGlmIChyZXQpDQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gMDsNCj4gPiArDQo+ID4gKyAgICAgYmFzZSA9IHBhcmVudF9yYXRl
IC8gNDsNCj4gDQo+IFNvIHlvdSd2ZSBnb3QgYSBwcmUtZGl2aWRlcg0KPiANCj4gPiArICAgICBy
YXRlID0gYmFzZSAqICh2YWwgKyAyKTsNCj4gDQo+IFRoZW4gYW4gaW50ZWdlciBkaXZpZGVyDQo+
IA0KPiA+ICsgICAgIHJhdGUgKz0gZGl2X3U2NChiYXNlICogZXh0X2YsIDgxOTIpOw0KPiANCj4g
YW5kIGZpbmFsbHkgdGhlIGZyYWN0aW9uYWwgcGFydA0KPiANCj4gPiArDQo+ID4gKyAgICAgcmV0
dXJuIHJhdGU7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgcnRrX2Nsa19yZWdtYXBf
cGxsX21tY19kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywNCj4gPiArc3RydWN0IGNs
a19yYXRlX3JlcXVlc3QgKnJlcSkgew0KPiA+ICsgICAgIHUzMiB2YWwgPSBSVEtfUExMX01NQ19T
U0NfRElWX05fVkFMICsgMjsNCj4gPiArICAgICB1NjQgdG1wOw0KPiA+ICsNCj4gPiArICAgICBp
ZiAoIXJlcS0+YmVzdF9wYXJlbnRfcmF0ZSkNCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPiA+ICsNCj4gPiArICAgICByZXEtPnJhdGUgPSByZXEtPmJlc3RfcGFyZW50X3JhdGUg
LyA0ICogdmFsOw0KPiANCj4gSGVyZSB5b3Ugc2VlbSB0byBzdXBwb3J0IG9ubHkgYSBzaW5nbGUg
aW50ZWdlciBwYXJ0IHNldHRpbmcNCj4gDQo+ID4gKyAgICAgdG1wID0gKHU2NCkocmVxLT5iZXN0
X3BhcmVudF9yYXRlIC8gNCkgKiAxNTE3Ow0KPiA+ICsgICAgIHJlcS0+cmF0ZSArPSB0bXAgPj4g
MTM7DQo+IA0KPiBTbyBub3RoaW5nIHNheXMgdGhhdCBoZXJlIHRoYXQgdGhlIG1hdGggd29uJ3Qg
b3ZlcmZsb3cNCj4gDQo+IENvdWxkIHlvdSBleHBsYWluIHRoZSAxNTE3IGhlcmUgPyBJIHN1cHBv
c2UgaXQgaXMgbGlua2VkIHRvIHRoZSA4MTkyIGFib3ZlID8NCj4gDQoNClRoZSBmdWxsIGZvcm11
bGEgaXM6DQpwYXJlbnRfcmF0ZSAvIDQgKiAodmFsICsgMikgKyAocGFyZW50X3JhdGUgLyA0ICog
ZXh0X2YpIC8gODE5MjsNCg0KVG8gYXZvaWQgaGFyZGNvZGluZyBtYWdpYyBudW1iZXJzLA0KV2Ug
d2lsbCBpbnRyb2R1Y2UgYSByYXRlIHRhYmxlICgnc3RydWN0IGNsa19wbGxfbW1jX3JhdGUnKQ0K
DQpGb3IgZXhhbXBsZToNCnN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX3BsbF9tbWNfcmF0ZSBydGQx
NjI1X3BsbF9lbW1jX3JhdGVfdGJsW10gPSB7DQoJeyAucmF0ZSA9IDE5Njk5OTk2OSwgLnNzY19k
aXZfbiA9IDI3LA0KCSAgLnNzY19kaXZfZXh0X2YgPSAxNTE3LCAubmNvZGUgPSAyNywgLmZjb2Rl
ID0gMzIxLCAuZ3Jhbl9lc3QgPSA1OTg1IH0sDQoNClRoZSBsb2dpYyBpbiBydGtfY2xrX3JlZ21h
cF9wbGxfbW1jX2RldGVybWluZV9yYXRlKCkgd2lsbCBiZSB1cGRhdGVkIHRvIGZpbmQNCnRoZSBj
bG9zZXN0IG1hdGNoIGZyb20gdGhpcyB0YWJsZSwgc2ltaWxhciB0byB0aGUNCidydGtfY2xrX3Jl
Z21hcF9wbGxfZGV0ZXJtaW5lX3JhdGUnIGFwcHJvYWNoLg0KDQpBZGRpdGlvbmFsbHksIGluICdy
dGtfY2xrX3JlZ21hcF9wbGxfbW1jX3JlY2FsY19yYXRlKCknLCB3ZSB3aWxsIGZpcnN0DQphdHRl
bXB0IHRvIGZpbmQgYW4gZXhhY3QgbWF0Y2ggaW4gdGhlIHJhdGUgdGFibGUgYnkgY29tcGFyaW5n
IHRoZSBmdWxsIHNldA0Kb2YgcmVnaXN0ZXIgdmFsdWVzLiBUaGlzIGFsaWducyB3aXRoIG91ciBh
cHByb2FjaCBvZiByZWx5aW5nIG9uDQpjaGFyYWN0ZXJpemVkIG9wZXJhdGluZyBwb2ludHMsIGVu
c3VyaW5nIHdlIHJldHVybiB0aGUgZXhhY3QgdmFsaWRhdGVkDQpyYXRlIHdpdGhvdXQgaW50ZWdl
ciB0cnVuY2F0aW9uIGVycm9ycy4NCg0KSWYgbm8gZXhhY3QgbWF0Y2ggaXMgZm91bmQsIGl0IHdp
bGwgZmFsbCBiYWNrIHRvIGEgaGVscGVyIGZ1bmN0aW9uIHRoYXQNCmNhbGN1bGF0ZXMgdGhlIHJh
dGUgdXNpbmcgdGhlIG1hdGhlbWF0aWNhbCBmb3JtdWxhLCBjYXN0aW5nIHZhcmlhYmxlcyB0bw0K
dTY0IHRvIHByZXZlbnQgb3ZlcmZsb3cuDQoNCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuIDA7DQo+
ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgcnRrX2Nsa19yZWdtYXBfcGxsX21tY19zZXRf
cmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQNCj4gbG9uZyByYXRlLA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBwYXJlbnRf
cmF0ZSkNCj4gew0KPiA+ICsgICAgIHN0cnVjdCBydGtfY2xrX3JlZ21hcF9wbGxfbW1jICpjbGtt
ID0gdG9fY2xrX3BsbF9tbWMoaHcpOw0KPiA+ICsgICAgIHUzMiB2YWwgPSBSVEtfUExMX01NQ19T
U0NfRElWX05fVkFMOw0KPiA+ICsgICAgIGludCByZXQ7DQo+ID4gKw0KPiA+ICsgICAgIC8qDQo+
ID4gKyAgICAgICogVGhlICdyYXRlJyBhbmQgJ3BhcmVudF9yYXRlJyBhcmUgaW50ZW50aW9uYWxs
eSB1bnVzZWQgaGVyZS4NCj4gPiArICAgICAgKg0KPiA+ICsgICAgICAqIERlc3BpdGUgcmVjZWl2
aW5nIHZhcmlvdXMgcmF0ZSByZXF1ZXN0cyAoZS5nLiwgMjZNSHosIDUyTUh6LA0KPiAyMDBNSHop
LA0KPiA+ICsgICAgICAqIHRoaXMgZnVuY3Rpb24gY29uc2lzdGVudGx5IGNvbmZpZ3VyZXMgdGhl
IGhhcmR3YXJlIGZvciAyN01Ieg0KPiAoMHgxYikuDQo+IA0KPiBNYXliZSB5b3Ugc2hvdWxkIGZp
eCB0aGUgbW1jIGRyaXZlciB0aGVuIGFuZCBwcm9wZXJseSByZXF1ZXN0IDI3TUh6IGlmIHRoaXMN
Cj4gd2hhdCB5b3UgZXhwZWN0IG9mIHRoaXMgcGFydGljdWxhciBQTEwuIEp1c3QgdGFraW5nIGFu
eSByZXF1ZXN0IGFuZCBzZXR0aW5nDQo+IHNvbWV0aGluZyBlbHNlIHJlZ2FyZGxlc3MgaXMgbm90
IE9LLg0KPg0KDQpXaXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhlIHJhdGUgdGFibGUgKHJ0ZDE2
MjVfcGxsX2VtbWNfcmF0ZV90YmwpIG1lbnRpb25lZA0KYWJvdmUsIHRoZSBhY3R1YWwgY2FsY3Vs
YXRlZCBvdXRwdXQgcmF0ZSAoZS5nLiwgMTk2OTk5OTY5KSBmb3IgdGhlIHNoYXJlZA0KMjcgTUh6
IHJlZmVyZW5jZSBzZXR0aW5ncyB3aWxsIGJlIHByb3Blcmx5IGRlZmluZWQuDQoNClRoZSBkcml2
ZXIgd2lsbCBwcm9wZXJseSByZXNwZWN0IHRoZSByZXF1ZXN0ZWQgcmF0ZSwgcGljayB0aGUgY29y
cmVzcG9uZGluZw0KY29uZmlndXJhdGlvbiBmcm9tIHRoZSByYXRlIHRhYmxlLCBhbmQgYXBwbHkg
dGhlIGV4YWN0IHJlZ2lzdGVyIHNldHRpbmdzLg0KDQpbLi4uXQ0KDQo+ID4gK30NCj4gPiArDQo+
ID4gK2NvbnN0IHN0cnVjdCBjbGtfb3BzIHJ0a19jbGtfcGxsX21tY19vcHMgPSB7DQo+ID4gKyAg
ICAgLnByZXBhcmUgICAgICAgICAgPSBydGtfY2xrX3JlZ21hcF9wbGxfbW1jX3ByZXBhcmUsDQo+
ID4gKyAgICAgLnVucHJlcGFyZSAgICAgICAgPSBydGtfY2xrX3JlZ21hcF9wbGxfbW1jX3VucHJl
cGFyZSwNCj4gPiArICAgICAuaXNfcHJlcGFyZWQgICAgICA9IHJ0a19jbGtfcmVnbWFwX3BsbF9t
bWNfaXNfcHJlcGFyZWQsDQo+IA0KPiBwcmVwYXJlIGlzIG1lYW50IGZvciBzbG93IChhcyBpbiBz
bGVlcGluZykgb3BlcmF0aW9uLg0KPiBJJ3ZlIHNlZW4gbm8gc2xlZXBpbmcgb3BlcmF0aW9uIGlu
IHlvdXIgaW1wbGVtZW50YXRpb24uDQo+IElmIHRoZSByZWdtYXAgaXMgc2xvdywgdGhlbiB0aGVy
ZSBpcyBwcm9ibGVtIGJlY2F1c2UgeW91ciB1c2luZyB0aGUgc2FtZSBvbmUNCj4gaW4gZW5hYmxl
L2Rpc2FibGUoKSB3aGljaCBydW4gdW5kZXIgYSBzcGluIGxvY2sNCj4gDQoNCkFncmVlZCwgYXMg
dGhlIGFib3ZlIHRhbGsgYWJvdXQuIHdpbGwgcmVtb3ZlIHRoZXNlIHRocmVlIGNhbGxiYWNrIGlt
cGxlbWVudGFpdG9uLg0KbWVyZ2UgdGhlbSB0byBlbmFibGUsIGRpc2FibGUgYW5kIGlzX2VuYWJs
ZSgpLg0KDQpbLi4uXQ0KDQo+ID4gK3N0cnVjdCBydGtfY2xrX3JlZ21hcF9wbGxfbW1jIHsNCj4g
PiArICAgICBzdHJ1Y3QgcnRrX2Nsa19yZWdtYXAgY2xrcjsNCj4gPiArICAgICB1bnNpZ25lZCBp
bnQgcGxsX29mczsNCj4gPiArICAgICB1bnNpZ25lZCBpbnQgc3NjX2RpZ19vZnM7DQo+ID4gKyAg
ICAgc3RydWN0IGNsa19odyBwaGFzZTBfaHc7DQo+ID4gKyAgICAgc3RydWN0IGNsa19odyBwaGFz
ZTFfaHc7DQo+IA0KPiB5b3VyIHBoYXNlcyBhbmQgcGxsIHVzZSBjb21wbGV0bHkgZGlmZmVyZW50
IG9wcy4gV2h5IGRvIHlvdSB0byBtaXggdGhlIDINCj4gaGVyZSA/DQo+IA0KDQpXaWxsIGNyZWF0
ZSAnc3RydWN0IHJ0a19jbGtfcGxsX21tY19waGFzZScgZm9yIHRoZSBwaGFzZSBjbG9ja3MsIHNl
cGFyYXRpbmcNCnRoZW0gZW50aXJlbHkgZnJvbSB0aGUgbWFpbiAnc3RydWN0IHJ0a19jbGtfcmVn
bWFwX3BsbF9tbWMnLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdS1DaHVuDQoNCj4gLS0NCj4gSmVyb21l
DQo=

