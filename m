Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D80EFCD95
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1QEU3QKEQE6a2+Re4VYj+Jk8g8AHzUb5sI5a0hZZp8=; b=AWkKI1zyKirarJMKy9mAGxSpmi
	RAWWtWVg5ntHCYskwrGc15LAz2sLf5RFXVjMsjal0GeKGGfPhmI+JhUrMHByRfCSM/y7A654N0wew
	BZSe6fszrtSwpKLmQWXJrXw3l7kHuNjs0DlJz2vH1yO4wawGtkO8PYgiB2BH2JFY5E8aifn9pLohz
	pwpuxhWo2imUUfxZpWkHylAm/rxkzBwBRJOP1hHykhHnQuA8HeFOujxYqCPQKMmKmVcddl59bhDz6
	gzhV4RzflXIVr59Bh5c8RDMbs7ikTIwy3h6LVEFN8i63gfNOCEBnYRGXHh7jJRRofLPz6ppvf0F/Z
	XUudam3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYOD-00000007831-3HO3;
	Mon, 09 Mar 2026 11:03:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYOB-0000000782B-48tP;
	Mon, 09 Mar 2026 11:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=O1QEU3QKEQE6a2+Re4VYj+Jk8g8AHzUb5sI5a0hZZp8=; b=bGl3SEJ35YJo9Tibw4FkIM3F1v
	dviQobShS/uVLSIQEecAVJCUK2Nx5+KH5w2LC35TyJf+4A3SKEizDnTcC43UDw7ssSK2+U1KuG6m2
	SarEaf1z83zuUSCIlIdCK5qvet276By+8Wtu7FLp10nKGHCN7QPCqf+YFlbbWXUSyykmxf+OTVtHf
	CYdkvHSC4BjT2u8NeMmowC+6GCFofp0RbjSFR/LNpeV3zs6F8pTQaQC6yH5s2YleX3Kvf3BdUellZ
	1Dde/y/dIU4nEzndkFLVOf5bzi+Fpw5NaZ41sSAeTPftveTkcqWM68mUJk4T4rAtgW6k0m9S3ccNa
	U5x5U0oA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYO8-0000000BweD-0d7Y;
	Mon, 09 Mar 2026 11:03:06 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 629B0YVZ0399648, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773054034; bh=O1QEU3QKEQE6a2+Re4VYj+Jk8g8AHzUb5sI5a0hZZp8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=fwxmZ9haWt10UR5oCYBJszlzbq+LtgtbVsWN2OjsdadXJo6fliA2A4J+A9ZZtz8CX
	 JgP2zFJXfsW5f6v40PlYOHBdrBrSjAQX1Oay4Bni3rNiwTZ3tqMt8+p4C+5771xWK4
	 8PmVMSGkX9FvUe/1wITkwxiK/84sp9OcRcHSqWuERSXfVbQKrfFvtc0SuWNM5JkyLX
	 boykeCqc7njPnhSF1Y8yQ2dbSVG0SVQqGKJwHg7OXk1ojTn/BtQcKnl+KBFV8xe2px
	 AgWHYHDVel/ZumN4WJvt5cptTHpRSG2Du728r4fYuWDI36cG3Su5RhOaikoK7FBVEI
	 a0TP2wvxEXehQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 629B0YVZ0399648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 19:00:34 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 9 Mar 2026 19:00:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 9 Mar 2026 19:00:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Mon, 9 Mar 2026 19:00:29 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "linusw@kernel.org"
	<linusw@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "bartosz.golaszewski@oss.qualcomm.com"
	<bartosz.golaszewski@oss.qualcomm.com>,
        "afaerber@suse.com"
	<afaerber@suse.com>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
	<james.tai@realtek.com>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
	<cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?=
	<stanley_chang@realtek.com>,
        =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
	<tychang@realtek.com>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>
Subject: RE: [PATCH v2 09/14] dt-bindings: pinctrl: realtek: Rename
 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'
Thread-Topic: [PATCH v2 09/14] dt-bindings: pinctrl: realtek: Rename
 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'
Thread-Index: AQHcrT45GXc0XObXlE68QVSv60G8LrWigisAgANt3nD//4tdgIAAkCpQ
Date: Mon, 9 Mar 2026 11:00:28 +0000
Message-ID: <0ed4a4e5e25e47ca8f040ff4632ae0c1@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-10-eleanor.lin@realtek.com>
 <20260307-purring-kind-binturong-1fcb37@quoll>
 <1baf65a11c26482cae4f7b54df1521c5@realtek.com>
 <af8aa42e-8ef6-43c0-9a46-173420ffe49c@kernel.org>
In-Reply-To: <af8aa42e-8ef6-43c0-9a46-173420ffe49c@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_110304_847341_E4225C5F 
X-CRM114-Status: GOOD (  25.38  )
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

PiBPbiAwOS8wMy8yMDI2IDEwOjE4LCBZdS1DaHVuIExpbiBb5p6X56WQ5ZCbXSB3cm90ZToNCj4g
Pj4gT24gRnJpLCBNYXIgMDYsIDIwMjYgYXQgMDM6NTI6MzlQTSArMDgwMCwgWXUtQ2h1biBMaW4g
d3JvdGU6DQo+ID4+PiBGcm9tOiBUenV5aSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4g
Pj4+DQo+ID4+PiBSZW5hbWUgJ3JlYWx0ZWssZHV0eS1jeWNsZScgdG8gJ3JlYWx0ZWsscHVsc2Ut
d2lkdGgtYWRqdXN0Jy4NCj4gPj4+DQo+ID4+PiBUaGUgcHJldmlvdXMgbmFtZSB3YXMgbWlzbGVh
ZGluZyBiZWNhdXNlIHRoaXMgaGFyZHdhcmUgYmxvY2sgaXMgbm90DQo+ID4+PiBhIFBXTSBnZW5l
cmF0b3IuIEl0IGRvZXMgbm90IGdlbmVyYXRlIGEgc2lnbmFsIHdpdGggYSBzcGVjaWZpYw0KPiA+
Pj4gZnJlcXVlbmN5IGFuZCBkdXR5IHJhdGlvLg0KPiA+Pj4NCj4gPj4+IEluc3RlYWQsIGl0IHBy
b3ZpZGVzIGEgZml4ZWQgbmFub3NlY29uZC1sZXZlbCBhZGp1c3RtZW50IHRvIHRoZQ0KPiA+Pj4g
cmlzaW5nLyBmYWxsaW5nIGVkZ2VzIG9mIGFuIGV4aXN0aW5nIHNpZ25hbC4NCj4gPj4+DQo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBUenV5aSBDaGFuZyA8dHljaGFuZ0ByZWFsdGVrLmNvbT4NCj4gPj4+
IENvLWRldmVsb3BlZC1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29tPg0K
PiA+Pj4gU2lnbmVkLW9mZi1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29t
Pg0KPiA+Pj4gLS0tDQo+ID4+PiAgLi4uL2JpbmRpbmdzL3BpbmN0cmwvcmVhbHRlayxydGQxMzE1
ZS1waW5jdHJsLnlhbWwgICAgICAgfCA5ICsrKysrKy0tLQ0KPiA+Pj4gIC4uLi9iaW5kaW5ncy9w
aW5jdHJsL3JlYWx0ZWsscnRkMTMxOWQtcGluY3RybC55YW1sICAgICAgIHwgOSArKysrKystLS0N
Cj4gPj4+ICAuLi4vYmluZGluZ3MvcGluY3RybC9yZWFsdGVrLHJ0ZDE2MTliLXBpbmN0cmwueWFt
bCAgICAgICB8IDkgKysrKysrLS0tDQo+ID4+PiAgMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQNCj4gPj4+IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVhbHRlayxydGQxMzE1
ZS1waW5jdHJsDQo+ID4+PiAueQ0KPiA+Pj4gYW1sDQo+ID4+PiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JlYWx0ZWsscnRkMTMxNWUtcGluY3RybA0KPiA+Pj4g
LnkgYW1sIGluZGV4IDkwYmQ0OWQ4N2QyZS4uN2IzODg4YjJjZWE4IDEwMDY0NA0KPiA+Pj4gLS0t
DQo+ID4+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JlYWx0
ZWsscnRkMTMxNWUtcGluY3RybA0KPiA+Pj4gLnkNCj4gPj4+IGFtbA0KPiA+Pj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVhbHRlayxydGQxMzE1ZS1w
aW4NCj4gPj4+ICsrKyBjdA0KPiA+Pj4gKysrIHJsLnlhbWwNCj4gPj4+IEBAIC0xMzMsMTAgKzEz
MywxMyBAQCBwYXR0ZXJuUHJvcGVydGllczoNCj4gPj4+ICAgICAgICAgIG1pbmltdW06IDANCj4g
Pj4+ICAgICAgICAgIG1heGltdW06IDcNCj4gPj4+DQo+ID4+PiAtICAgICAgcmVhbHRlayxkdXR5
LWN5Y2xlOg0KPiA+Pj4gKyAgICAgIHJlYWx0ZWsscHVsc2Utd2lkdGgtYWRqdXN0Og0KPiA+Pg0K
PiA+PiBObywgdGhhdCdzIEFCSSBicmVhayB3aXRob3V0IGV4cGxhbmF0aW9uLiAibWlzbGVhZGlu
ZyIgaXMgbm90IHRoZQ0KPiA+PiBzdWZmaWNpZW50IGFyZ3VtZW50IGZvciBicmVha2luZyBBQkku
DQo+ID4+IFlvdSBhcmUgc3R1Y2sgd2l0aCB0aGUgQUJJIHlvdSBhZGRlZCBiYWNrIGluIDIwMjMu
DQo+ID4+DQo+ID4+IEJlc3QgcmVnYXJkcywNCj4gPj4gS3J6eXN6dG9mDQo+ID4NCj4gPiBUaGUg
cmVhc29uIEkgcmVuYW1lZCAncmVhbHRlayxkdXR5LWN5Y2xlJyB0bw0KPiA+ICdyZWFsdGVrLHB1
bHNlLXdpZHRoLWFkanVzdCcgaXMgdGhhdCBkdXJpbmcgdGhlIHYxIHJldmlldywgaXQgd2FzDQo+
ID4gcG9pbnRlZCBvdXQgdGhhdCB0aGUgbmFtZSBjYXVzZWQgY29uZnVzaW9uIHdpdGggc3RhbmRh
cmQgUFdNIGJpbmRpbmdzDQo+ID4gWzFdLiBTaW5jZSBJIG5lZWQgdG8gbW9kaWZ5IHRoZSBkcml2
ZXIgbG9naWMgdG8gYWRkcmVzcyB0aGlzLCBJIGludGVuZGVkIHRvDQo+IHVwZGF0ZSB0aGUgYmlu
ZGluZyBzaW11bHRhbmVvdXNseS4NCj4gDQo+IEFnYWluLCBjb25mdXNpb24gaXMgbm90IHJlYXNv
biB0byBicmVhayBBQkkuDQo+IA0KPiA+DQo+ID4gQWx0aG91Z2ggdGhlIGJpbmRpbmcgd2FzIGFk
ZGVkIGluIDIwMjMsIHRoZXJlIGFyZSBjdXJyZW50bHkgbm8gRFRTDQo+ID4gZmlsZXMgaW4gdGhl
IG1haW5saW5lIGtlcm5lbCB0aGF0IHVzZSB0aGUgMTMxNWUsIDEzMTlkLCBvciAxNjE5YiBwaW5j
dHJsDQo+IGRldmljZSBub2Rlcy4NCj4gDQo+IFN0aWxsIEFCSS4NCj4gDQo+ID4gVGhlcmVmb3Jl
LCBjaGFuZ2luZyB0aGlzIHByb3BlcnR5IG5hbWUgd2lsbCBub3QgYnJlYWsgYW55IGV4aXN0aW5n
DQo+ID4gZGV2aWNlIHN1cHBvcnQgaW4gdGhlIG1haW5saW5lIHRyZWUuDQo+IA0KPiBZZWFoLCBi
dXQgd2lsbCBicmVhayBhbGwgb3RoZXIgdXNlcnMuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEty
enlzenRvZg0KDQpJIHVuZGVyc3RhbmQgeW91ciBjb25jZXJuLiBJIHdpbGwgZHJvcCB0aGUgcHJv
cGVydHkgcmVuYW1lIGFuZCBrZWVwDQpyZWFsdGVrLGR1dHktY3ljbGUsIGJ1dCBJIHdpbGwgdXBk
YXRlIGl0cyBkZXNjcmlwdGlvbiBpbiB2MyB0byBtYWtlIGl0IGNsZWFyZXIuDQoNCkhpIExpbnVz
LA0KQWx0aG91Z2ggeW91IGFncmVlZCB3aXRoIHRoZSByZW5hbWUgdG8gcmVhbHRlayxwdWxzZS13
aWR0aC1hZGp1c3QgaW4gdjEsIEkNCndpbGwgcmV2ZXJ0IHRvIHRoZSBvcmlnaW5hbCBuYW1lIHJl
YWx0ZWssZHV0eS1jeWNsZSB0byBzdHJpY3RseSByZXNwZWN0IHRoZQ0KRFQgYmFja3dhcmQgY29t
cGF0aWJpbGl0eSBydWxlcy4gSSBob3BlIHRoaXMgaXMgZmluZSB3aXRoIHlvdS4NCg0KQmVzdCBy
ZWdhcmRzLA0KWXUtQ2h1bg0K

