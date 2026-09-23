Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FEEC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7vLiErv27RUD70UUHBrWpEb96rWFJU+SsC9JHBfrLA=; b=ysJRjO6u6Dm49y1smlrSc140cz
	JQaL6WLkba9/Jgl+6NkEAuK+aK4XZ/JboqK+Zv1Yy2bsAzcjETaxHFjhzmwUdqMp+2moYv+JOLoNX
	+WZh7SLjJ1jrutYLsfrD4gQ6AGdumYKvBnE38X51yGUH1BoqhTz2Na+hU88PaKFKR0mA7O46MZl0+
	+g+9nYwA6GTMBMzy/4uLcmkDC67ptgPKZ3Fv13p1dRjPUJtCszFbjAopyGoeiuXFFNTrQvHhhYLyl
	rGCebqNpt3aU9jKaNZ8DqUrRyaZQ+t719QmgBrkHPIPXNUuvIZbyf96ZbQIq813CwpT1Zej31z3W5
	ccaQm6UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9FkW-00000007Bjd-38Dq;
	Wed, 23 Sep 2026 05:42:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9FkD-00000007Bgw-0ic9;
	Wed, 23 Sep 2026 05:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=O7vLiErv27RUD70UUHBrWpEb96rWFJU+SsC9JHBfrLA=; b=nte9c1GtVrFKY4JsKFwiuJv0N6
	3YvJvDcJ5NS4vo/ibOGPfQicDKvNfXgjsGeMUTgT7BiOZL6GjU7w8Yv+AT7+TjyCs8jOCmmBe05au
	+4DzoqdTdt1RY0wO0X8h3M9RPGfh4Rcok5wIwakNGkZKeiaBTUgJW2ZdUgVtI1bDVdflK/nRGQ/XJ
	hFVEEWqo2O9j1lxkVEELTbzH8Ef/Gdgc57lhXFREWhf24jYTPwGhDKGw8xU7FBvpQrmU1AePun2Fs
	PKz/ZY6fN//nek0FHnaak254nizNJMe6Lcw7kdBkKQSlz0B2T3hHPrA+GY2SkUfckPqsNKh7n7Cpm
	lak6zhBw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Fk9-0000000EODS-0ghC;
	Wed, 23 Sep 2026 05:42:11 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68N5g1P71095606, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790142121; bh=O7vLiErv27RUD70UUHBrWpEb96rWFJU+SsC9JHBfrLA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=igGYhJC3fnM9NpG2Kyy7h4x/0diJcoDPsGqeRBJHlO6Dd8aprufTDtu5SQt8zpjN6
	 F06eWfjo/c7jnhtBejksv52s7dkgtm2KJUkCuaO/0zf3d5KnqNOX/HRqkfIagqwSzy
	 b8YpP7uxY8dnTSh9teYDt3WcxnsKxCek5TlBbmeDRo3K0XMYW5xLW2D9P4muiF3e4u
	 LXWMMH/X7KKyS9GpVeyQvD8l89GagWgFsjak/KnUj45YA/4mcHETZzoL0sO8t01zKW
	 PrnehLf/Epzy/UKKPtl55GR+4SP0xWBfAZsA8eIrdiNlpO7OaOXMHHSHhXOCTZq40F
	 bhKbNvRuTSyjQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68N5g1P71095606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Sep 2026 13:42:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 23 Sep 2026 13:42:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Wed, 23 Sep 2026 13:42:01 +0800
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
Subject: RE: [PATCH v14 07/11] clk: realtek: Add support for mux clock
Thread-Topic: [PATCH v14 07/11] clk: realtek: Add support for mux clock
Thread-Index: AQHdOeL/g/aJu9pvt06W4ewBENBGWbbPKKcAgAyf0hA=
Date: Wed, 23 Sep 2026 05:42:01 +0000
Message-ID: <0b1dd932101848b7ba18aba6ea2d5080@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-8-eleanor.lin@realtek.com>
 <178947683646.448573.8652586338644531668.b4-reply@b4>
In-Reply-To: <178947683646.448573.8652586338644531668.b4-reply@b4>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_064210_142191_69E2F15F 
X-CRM114-Status: GOOD (  12.09  )
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

SGkgSmVyb21lLA0KDQo+ID4gK3N0YXRpYyB1OCBydGtfY2xrX3JlZ21hcF9tdXhfZ2V0X3BhcmVu
dChzdHJ1Y3QgY2xrX2h3ICpodykgew0KPiA+ICsgICAgIHN0cnVjdCBydGtfY2xrX3JlZ21hcF9t
dXggKmNsa20gPSB0b19ydGtfY2xrX3JlZ21hcF9tdXgoaHcpOw0KPiA+ICsgICAgIHVuc2lnbmVk
IGludCBudW1fcGFyZW50cyA9IGNsa19od19nZXRfbnVtX3BhcmVudHMoaHcpOw0KPiA+ICsgICAg
IHUzMiB2YWw7DQo+ID4gKyAgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAgcmV0ID0gcmVn
bWFwX3JlYWQoY2xrbS0+Y2xrci5yZWdtYXAsIGNsa20tPm11eF9vZnMsICZ2YWwpOw0KPiA+ICsg
ICAgIGlmIChyZXQpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMHhmZjsNCj4gPiArDQo+ID4g
KyAgICAgdmFsID0gKHZhbCA+PiBjbGttLT5zaGlmdCkgJiBjbGttLT5tYXNrOw0KPiA+ICsNCj4g
PiArICAgICByZXR1cm4gdmFsID49IG51bV9wYXJlbnRzID8gMHhmZiA6IHZhbDsNCj4gDQo+IFRo
aXMgaXMgbm90IHJlYWxseSB1c2VmdWwsIHRoZSBjb3JlIGFscmVhZHkgcmVqZWN0cyB2YWwgPj0g
bnVtX3BhcmVudC4NCj4gU28gcmV0dXJuaW5nIGEgaGlnaGVyIG51bWJlciBjaGFuZ2VzIG5vdGhp
bmcgYXMgaXQgc3RhbmRzDQo+IA0KDQpXaWxsIGNoYW5nZSBpdCB0byAncmV0dXJuIHZhbDsnDQoN
CkJlc3QgUmVnYXJkcywNCll1LUNodW4NCg==

