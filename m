Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB67D25039
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 06:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUeBuyvG02WL9NUy0Rpmjt3Vi6GIXO5jsLu58g1hMwA=; b=KJYn6YRpAV15DMYoBPDGf2TdkU
	LXT/GlvLPd8CrAcz2wgpmKKYrCHpWuQV5GlUPuf7gmbtiSayD0+x2rEw6fRk86ugE3Wsiltx3QSjG
	LJ8DJKZtnn46izQBlVsX8MDLVlavRIeA+i4t9u6lB2AW8PejUcxq0s7dyfN0XrGEmgoGGJl0db/Jb
	R2vK4djRwAL/S0BN+E3yBBHwhLpkCrw9NUWnIYB+1scxEmqfsqfp959h8mJgRsWtL2+3JOe7Gg8YE
	jzCMclGHg4468nzNSnr0L96NJbPgJAo9siAunfZm/aDVKvftqkLbbOF3Sg4pC8iHFuq0vFLiY1nBB
	KzxDwIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfBqX-00000004qJr-1Bjh;
	Mon, 12 Jan 2026 06:56:13 +0000
Received: from azure-sdnproxy.icoremail.net ([52.175.55.52])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfBqT-00000004qJN-14Cg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 06:56:11 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Mon, 12 Jan 2026 14:55:45 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Mon, 12 Jan 2026 14:55:45 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH v1 2/2] net: stmmac: eic7700: enable clocks before
 syscon access and correct RX sampling timing
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <1f553a6e-ca95-45e2-be14-96557a35e618@lunn.ch>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080929.1308-1-lizhi2@eswincomputing.com>
 <1f553a6e-ca95-45e2-be14-96557a35e618@lunn.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3c434477.2d22.19bb0fd3f21.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgAXH2zymmRp3RGUAA--.9130W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQEFDGlj0ItHlAABsK
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_225609_623348_9C84B9F9 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
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

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiQW5kcmV3IEx1bm4iIDxh
bmRyZXdAbHVubi5jaD4KPiDlj5HpgIHml7bpl7Q6MjAyNi0wMS0xMCAwMjozMTowOSAo5pif5pyf
5YWtKQo+IOaUtuS7tuS6ujogbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbQo+IOaKhOmAgTogZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGFuZHJldytuZXRkZXZAbHVubi5jaCwgZGF2ZW1AZGF2
ZW1sb2Z0Lm5ldCwgZWR1bWF6ZXRAZ29vZ2xlLmNvbSwga3ViYUBrZXJuZWwub3JnLCByb2JoQGtl
cm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywgbmV0ZGV2
QHZnZXIua2VybmVsLm9yZywgcGFiZW5pQHJlZGhhdC5jb20sIG1jb3F1ZWxpbi5zdG0zMkBnbWFp
bC5jb20sIGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20sIHJtaytrZXJuZWxAYXJtbGludXgu
b3JnLnVrLCBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tLCBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcsIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5jb20sIGxpbm1pbkBlc3dpbmNvbXB1dGluZy5jb20s
IHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbSwgd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0
aW5nLmNvbQo+IOS4u+mimDogUmU6IFtQQVRDSCB2MSAyLzJdIG5ldDogc3RtbWFjOiBlaWM3NzAw
OiBlbmFibGUgY2xvY2tzIGJlZm9yZSBzeXNjb24gYWNjZXNzIGFuZCBjb3JyZWN0IFJYIHNhbXBs
aW5nIHRpbWluZwo+IAo+ID4gKwlkd2NfcHJpdi0+ZWljNzcwMF9oc3BfcmVnbWFwID0KPiA+ICsJ
CQlzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKHBkZXYtPmRldi5vZl9ub2RlLAo+ID4g
KwkJCQkJCQkiZXN3aW4saHNwLXNwLWNzciIpOwo+ID4gKwlpZiAoSVNfRVJSKGR3Y19wcml2LT5l
aWM3NzAwX2hzcF9yZWdtYXApKQo+ID4gIAkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRl
diwKPiA+IC0JCQkJUFRSX0VSUihlaWM3NzAwX2hzcF9yZWdtYXApLAo+ID4gKwkJCQlQVFJfRVJS
KGR3Y19wcml2LT5laWM3NzAwX2hzcF9yZWdtYXApLAo+ID4gIAkJCQkiRmFpbGVkIHRvIGdldCBo
c3Atc3AtY3NyIHJlZ21hcFxuIik7Cj4gCj4gSW4gb3JkZXIgdG8gYmUgYmFja3dhcmRzIGNvbXBh
dGlibGUsIHlvdSBjYW5ub3QgZXJyb3Igb3V0IGhlcmUsCj4gYmVjYXVzZSBvbGQgRFQgYmxvYnMg
d29uJ3QgaGF2ZSB0aGlzIHByb3BlcnR5Lgo+IAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKV2Ug
d291bGQgbGlrZSB0byBjbGFyaWZ5IG91ciB1bmRlcnN0YW5kaW5nIGJlZm9yZSBjaGFuZ2luZyB0
aGUgYmVoYXZpb3IuCgonZXN3aW4saHNwLXNwLWNzcicgaGFzIGJlZW4gZG9jdW1lbnRlZCBhcyBh
IHJlcXVpcmVkIHByb3BlcnR5IHNpbmNlIHRoZQppbml0aWFsIEVJQzc3MDAgRFdNQUMgYmluZGlu
ZywgYW5kIHRoZSBleGlzdGluZyBkcml2ZXIgYWxyZWFkeSByZWxpZXMgb24KaXQgZm9yIFJYL1RY
IGNsb2NrIGRlbGF5IHByb2dyYW1taW5nLiBGcm9tIG91ciB1bmRlcnN0YW5kaW5nLCB0aGlzCnBy
b3BlcnR5IGlzIGZ1bmRhbWVudGFsIHRvIGNvcnJlY3QgTUFDIGNsb2NrIGNvbmZpZ3VyYXRpb24g
b24gRUlDNzcwMCwKcmF0aGVyIHRoYW4gYW4gb3B0aW9uYWwgZW5oYW5jZW1lbnQuCgpHaXZlbiB0
aGlzLCBjb3VsZCB5b3UgcGxlYXNlIGNsYXJpZnkgd2hldGhlciB3ZSBzaG91bGQgc3RpbGwgdHJl
YXQKZXN3aW4saHNwLXNwLWNzciBhcyBvcHRpb25hbCBhdCBydW50aW1lIHB1cmVseSBmb3IgRFQg
QUJJIHJvYnVzdG5lc3MsCmV2ZW4gdGhvdWdoIGl0IGlzIHJlcXVpcmVkIGJ5IHRoZSBiaW5kaW5n
IGFuZCBoYXJkd2FyZSBkZXNpZ24/CgpPbmNlIGNvbmZpcm1lZCwgd2Ugd2lsbCB1cGRhdGUgdGhl
IGRyaXZlciBhbmQgYmluZGluZyBhY2NvcmRpbmdseS4KClRoYW5rcywKTGkgWmhpCg==

