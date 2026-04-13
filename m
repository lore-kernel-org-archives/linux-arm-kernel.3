Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850B6EBFD22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LyTRrutYnATzApAeFIWft4RRx7gSZRf923LkUajEI58=; b=uL77DJ9JFcUgW5uYR6DYde1+z6
	pUm72pQ0nl+hsVX5/8AlM0A8eG5ysBwmS+8aZWE4RT0nZqx7v0/Xl/SEL08bMHq8pA/XEUhkNqxTd
	axqsfN46IXxmBnvFbmg8M2Z3ymFDJHMAn9LpkOFD/BeEXSKm9kLaduqNKzVIstjBZggCkn3a+r4bB
	DbUUi0o6h4R6viib4kDTWAyQuF4TY51+JzPR2wooerKuNIOOar1xGduezqtza7FxHL5T0z5wRPfKQ
	fIkFRl+0zHOvSW3O2vjfi7Tu16HBLg6D6Dj7Khb0C9sRS9aKX5E0UcxsYixET8QBrC4ePiVxJ1J3S
	A8JDZIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDYY-0000000FMsX-1syf;
	Mon, 13 Apr 2026 09:26:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDYX-0000000FMsN-1ZBY;
	Mon, 13 Apr 2026 09:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LyTRrutYnATzApAeFIWft4RRx7gSZRf923LkUajEI58=; b=kWxfZceAeGE186Qa4l2ZBwxRM9
	wYy3LecGINJNL+4t53FjWIRNCdgFl1z8ZNpXZJiHYwdOSOA1TwjA/THTHp1HiKhXjXkbe80ac0B9E
	cKzdtl7liyvgW3RL8bqDYzqHcdWwLL7b14Th/F3On7r0cyVJo1l6wN/cDdPBAZ82LLFyItYs1ukrt
	rJ4E+/26GD9k2QfG2VlbREKaQFNfDJZt03sY9IHPuiW90klJjpxDxsP8OrwtUe4AmPwG45dsm0XN7
	FlJH5oTrE1azJJyM8CKHS/S/g2v1fvAkPgbcra4RrnfsKJb2N0U3chRV3qp/x7rtJ9OlduVwKBF20
	vVMY+x/A==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDYS-0000000GUa6-42J4;
	Mon, 13 Apr 2026 09:26:07 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63D9ND4z83976123, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1776072193; bh=LyTRrutYnATzApAeFIWft4RRx7gSZRf923LkUajEI58=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=QUOwRZ03s5JS1wgUz5eQ7+cw0w7zUStWcsVSVzMw5mnwen6pHeIyiVQ8pi5NdXGFb
	 B24djn7qgmar6G18riwNisBfCLvaLOotjWEsHRrrYfCWRS0AZOR3bOBcEDbukNrGqf
	 Osr1gZzLTfDlpNpLI/F+nA+HwzwTDsQjv2pGmOAAY1FU47amqCbkFDTXpqYtdoqw5q
	 tpoYLUYM1LmrgYjUotV3BkcVj0nuLMhJa8H3T+z81vbs4omCn5W+LRKLG5um0cbgUy
	 vw5BKPdO8n+nwjoWVJrhF+OCk1K9s3JlJEHTRok1E8cBX7FI2qulm8TfqmVMTIOYuL
	 wIAAE0nAROopg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63D9ND4z83976123
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Apr 2026 17:23:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Apr 2026 17:23:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Mon, 13 Apr 2026 17:23:13 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Linus Walleij
	<linusw@kernel.org>,
        =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andrew Jeffery
	<andrew@codeconstruct.com.au>,
        "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>,
        "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        Joel Stanley <joel@jms.id.au>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>
Subject: RE: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller
 drivers
Thread-Topic: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller
 drivers
Thread-Index: AQHcyOquo2WiRIDaMEumOWsAJK/C+LXctDBA
Date: Mon, 13 Apr 2026 09:23:13 +0000
Message-ID: <45866135c8a54e1d98cac51932ca8e1a@realtek.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
 <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_102605_721919_4830B914 
X-CRM114-Status: GOOD (  15.45  )
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

PiBObyBkZWRpY2F0ZWQgbWFpbnRhaW5lcnMgYXJlIHNob3duIGZvciBSZWFsdGVrIFNvQyBwaW4g
Y29udHJvbGxlcnMsIGV4Y2VwdA0KPiBwaW5jdHJsIHN1YnN5c3RlbSBtYWludGFpbmVyLCB3aGlj
aCBtZWFucyByZWR1Y2VkIHJldmlldyBhbmQgaW1wcmVzc2lvbiBvZg0KPiBhYmFuZG9uZWQgZHJp
dmVycy4gIFBpbiBjb250cm9sbGVyIGRyaXZlcnMgYXJlIGVzc2VudGlhbCBwYXJ0IG9mIGFuIFNv
Qywgc28gaW4NCj4gY2FzZSBvZiBsYWNrIG9mIGRlZGljYXRlZCBlbnRyeSBhdCBsZWFzdCBjb3Zl
ciBpdCBieSB0aGUgU29DIHBsYXRmb3JtDQo+IG1haW50YWluZXJzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNv
bW0uY29tPg0KPiANCj4gLS0tDQo+IA0KPiBUaGlzIHBhdGNoIHNob3VsZCBnbyB2aWEgUmVhbHRl
ayBTb0MgbWFpbnRhaW5lcnMsIG5vdCBwaW5jdHJsLg0KPiAtLS0NCj4gIE1BSU5UQUlORVJTIHwg
MSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+IGluZGV4IDEwZDEyYjUxYjFmNi4uMzc0Y2U1
NWU0ZmI2IDEwMDY0NA0KPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiArKysgYi9NQUlOVEFJTkVSUw0K
PiBAQCAtMzM3Myw2ICszMzczLDcgQEAgRjoNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9yZWFsdGVrLnlhbWwNCj4gIEY6ICAgICBhcmNoL2FybS9ib290L2R0cy9yZWFs
dGVrLw0KPiAgRjogICAgIGFyY2gvYXJtL21hY2gtcmVhbHRlay8NCj4gIEY6ICAgICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlYWx0ZWsvDQo+ICtGOiAgICAgZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsv
DQo+IA0KPiAgQVJNL1JJU0MtVi9SRU5FU0FTIEFSQ0hJVEVDVFVSRQ0KPiAgTTogICAgIEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiAtLQ0KPiAyLjUx
LjANCg0KQWNrZWQtYnk6IFl1LUNodW4gTGluIDxlbGVhbm9yLmxpbkByZWFsdGVrLmNvbT4NCg==

