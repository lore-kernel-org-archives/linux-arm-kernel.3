Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C12C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 04:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxeehXDFLRsNUuKhUGkDhc+YbuEwlOqXR+z+Te6Yid4=; b=UvvUHIqSWQiE9KT5oAmDlJqF1l
	wN9mGXGjn4KxGaABmmOk/aWuuqNruzU61jhAKJriAlhw6zdl+nh1swMScq1IQi/SIO228Xm72EeUs
	5R1Cm+XwPYTCVzRMi5mCLqUAqk8+B5DrPcBn1y1Am5uqu+jRBFLUCsClBDy3vcAn4ue9CEzQMZdy+
	1VzGDSzz1r4TE/VNtSGsxuZYMNzIvEc/yscEk2qbQR7LUq/7M/OPUm7PxXrITt2Q3tak8LG+SU3FF
	hMtugNZxVgEoq/yWdICDo14M0lYy/fsTSGp6w2nnbW41srYVNeV8v6PoZaq3pfZi3fTepSTjiRJJh
	wjplzUHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udiUi-0000000GCmL-09FH;
	Mon, 21 Jul 2025 04:51:20 +0000
Received: from mail2.coasia.com ([112.168.119.159] helo=spam.coasia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udiSH-0000000GCTJ-1Em8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 04:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1753073325; bh=jxeehXDFLRsNUuKhUGkDhc+YbuEwlOqXR+z+Te6Yid4=;
	l=4378; h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=a8Ib234RDM5o/AN7BqSWqPGXFUI8ACN6QlmcwfrpgSKEQeuylIl2G2rOzbfuzCjAC
	 Shvlncw8ww907EuwoIEzwVuAhyDYv384xIgYRRFtG17O8kkOM9YA/bPp3iHcyPAQEU
	 buYAWNFZh/H2cPhnVSiYJr3DGhl5PbRs/m44EDQM=
Received: from unknown (HELO ?192.168.36.110?) (115.23.218.194)
	by 192.168.10.159 with ESMTP; 21 Jul 2025 13:48:45 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: krzk@kernel.org,
	jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ravi.patel@samsung.com,
	smn1196@coasia.com,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Message-ID: <f9a1944be69ebaada81c5928c76d9b5266e242a2.camel@coasia.com>
Subject: Re: [PATCH 15/16] arm64: dts: axis: Add initial pinctrl support
From: SeonGu Kang <ksk4725@coasia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jesper Nilsson
 <jesper.nilsson@axis.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus
 Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,  Ravi Patel <ravi.patel@samsung.com>,
 SungMin Park <smn1196@coasia.com>
Cc: kenkim <kenkim@coasia.com>, Jongshin Park <pjsin865@coasia.com>, GunWoo
 Kim <gwk1013@coasia.com>, HaGyeong Kim <hgkim05@coasia.com>, GyoungBo Min
 <mingyoungbo@coasia.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Shradha
 Todi <shradha.t@samsung.com>, Inbaraj E <inbaraj.e@samsung.com>, Swathi K S
 <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>, Dongjin
 Yang <dj76.yang@samsung.com>, Sang Min Kim <hypmean.kim@samsung.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 21 Jul 2025 13:48:45 +0900
In-Reply-To: <78d46ee0-d53f-4980-aa90-c9111043ae90@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	 <20250710002047.1573841-16-ksk4725@coasia.com>
	 <78d46ee0-d53f-4980-aa90-c9111043ae90@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_214849_595607_6EDF5562 
X-CRM114-Status: GOOD (  21.59  )
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

MjAyNS0wNy0xMCAo66qpKSwgMDk6MDQgKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2k6Cj4gT24g
MTAvMDcvMjAyNSAwMjoyMCwga3NrNDcyNUBjb2FzaWEuY29twqB3cm90ZToKPiA+IEZyb206IFNl
b25HdSBLYW5nIDxrc2s0NzI1QGNvYXNpYS5jb20+Cj4gPiAKPiA+IEFkZCBpbml0aWFsIHBpbiBj
b25maWd1cmF0aW9uIG5vZGVzIGZvciB0aGUgQXhpcyBBUlRQRUMtOCBTb0MuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IFJhdmkgUGF0ZWwgPHJhdmkucGF0ZWxAc2Ftc3VuZy5jb20+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBTZW9uR3UgS2FuZyA8a3NrNDcyNUBjb2FzaWEuY29tPgo+ID4gLS0tCj4gPiDC
oGFyY2gvYXJtNjQvYm9vdC9kdHMvYXhpcy9hcnRwZWMtcGluY3RybC5owqDCoMKgwqAgfMKgIDM2
ICsrCj4gPiDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvYXhpcy9hcnRwZWM4LWdyaXp6bHkuZHRzwqAg
fMKgwqAgMSArCj4gPiDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvYXhpcy9hcnRwZWM4LXBpbmN0cmwu
ZHRzaSB8IDM3Mwo+ID4gKysrKysrKysrKysrKysrKysrCj4gPiDCoGFyY2gvYXJtNjQvYm9vdC9k
dHMvYXhpcy9hcnRwZWM4LmR0c2nCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNyArCj4gCj4gVGhpcyBi
ZWxvbmdzIHRvIHRoZSBwcmV2aW91cyBwYXRjaCByYXRoZXIuIFlvdSBjYW4gc3BsaXQgYm9hcmQg
RFRTLAo+IHRob3VnaC4KCk9rLCBJIHdpbGwgbW92ZSB0aGUgZHRzaSBjaGFuZ2VzIHRvIHByZXZp
b3VzIHBhdGNoCgo+IAo+ID4gwqA0IGZpbGVzIGNoYW5nZWQsIDQyNyBpbnNlcnRpb25zKCspCj4g
PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2F4aXMvYXJ0cGVjLXBp
bmN0cmwuaAo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9heGlz
L2FydHBlYzgtcGluY3RybC5kdHNpCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2F4aXMvYXJ0cGVjLXBpbmN0cmwuaAo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2F4
aXMvYXJ0cGVjLXBpbmN0cmwuaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uYzJjMWUyNWI3ZjZhCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2F4aXMvYXJ0cGVjLXBpbmN0cmwuaAo+ID4gQEAgLTAsMCArMSwzNiBA
QAo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gPiArLyoKPiA+
ICsgKiBBeGlzIEFSVFBFQy04IFNvQyBkZXZpY2UgdHJlZSBwaW5jdHJsIGNvbnN0YW50cwo+ID4g
KyAqCj4gPiArICogQ29weXJpZ2h0IChjKSAyMDIyLTIwMjUgU2Ftc3VuZyBFbGVjdHJvbmljcyBD
by4sIEx0ZC4KPiAKPiBGaXJzdCBwdWJsaXNoIGRhdGUgd2FzIDIwMjUsIG5vdCAyMDIyLCBzbyBh
bGwgdGhlc2UgY29weXJpZ2h0cyBmZWVsCj4gd3JvbmcuCj4gCgpPaywgSSB3aWxsIHVwZGF0ZSB0
aGUgY29weXJpZ2h0IHllYXIgdG8gMjAyNSBvbmx5Cgo+ID4gKyAqwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGh0dHBzOi8vd3d3LnNhbXN1bmcuY29tCj4gPiArICogQ29weXJpZ2h0IChjKSAyMDIy
LTIwMjXCoCBBeGlzIENvbW11bmljYXRpb25zIEFCLgo+ID4gKyAqwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGh0dHBzOi8vd3d3LmF4aXMuY29tCj4gPiArICovCj4gPiArCj4gCj4gCj4gLi4uCj4g
Cj4gPiArwqDCoMKgwqDCoMKgwqBpMnMwX2lkbGU6IGkyczAtaWRsZS1waW5zIHsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzYW1zdW5nLHBpbnMgPSAiZ3BhMS00IiwgImdwYTEt
NSIsICJncGExLTYiLCAiZ3BhMS0KPiA+IDciOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHNhbXN1bmcscGluLWZ1bmN0aW9uID0gPEFSVFBFQ19QSU5fRlVOQ19JTlBVVD47Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2Ftc3VuZyxwaW4tcHVkID0gPEFSVFBF
Q19QSU5fUFVMTF9VUD47Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2Ftc3Vu
ZyxwaW4tZHJ2ID0gPEFSVFBFQ19QSU5fRFJWX1NSMz47Cj4gPiArwqDCoMKgwqDCoMKgwqB9Owo+
ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgaTJzMV9idXM6IGkyczEtYnVzLXBpbnMgewo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNhbXN1bmcscGlucyA9ICJncGExLTAiLCAiZ3Bh
MS0xIiwgImdwYTEtMiIsICJncGExLQo+ID4gMyI7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgc2Ftc3VuZyxwaW4tZnVuY3Rpb24gPSA8QVJUUEVDX1BJTl9GVU5DXzM+Owo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNhbXN1bmcscGluLXB1ZCA9IDxBUlRQRUNf
UElOX1BVTExfVVA+Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNhbXN1bmcs
cGluLWRydiA9IDxBUlRQRUNfUElOX0RSVl9TUjM+Owo+ID4gK8KgwqDCoMKgwqDCoMKgfTsKPiA+
ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGkyczFfaWRsZTogaTJzMS1pZGxlLXBpbnMgewo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNhbXN1bmcscGlucyA9ICJncGExLTAiLCAiZ3Bh
MS0xIiwgImdwYTEtMiIsICJncGExLQo+ID4gMyI7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgc2Ftc3VuZyxwaW4tZnVuY3Rpb24gPSA8QVJUUEVDX1BJTl9GVU5DX0lOUFVUPjsK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzYW1zdW5nLHBpbi1wdWQgPSA8QVJU
UEVDX1BJTl9QVUxMX1VQPjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzYW1z
dW5nLHBpbi1kcnYgPSA8QVJUUEVDX1BJTl9EUlZfU1IzPjsKPiA+ICvCoMKgwqDCoMKgwqDCoH07
Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBoc2kyYzJfYnVzOiBoc2kyYzItYnVzLXBpbnMgewo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNhbXN1bmcscGlucyA9ICJncGEwLTYi
LCAiZ3BhMC03IjsKPiAKPiBXZSBzb3J0IG5vZGVzIGJ5IHBpbiBuYW1lcywgdXN1YWxseS4gV2hh
dCBzb3J0aW5nIHJ1bGUgeW91IGFwcGxpZWQKPiBoZXJlPwo+IAoKT2ssIEkgd2lsbCBzb3J0IHRo
ZSBwaW4gbm9kZXMgYWxwaGFiYXRpY2FsbHkKCj4gCj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlz
enRvZgoK


