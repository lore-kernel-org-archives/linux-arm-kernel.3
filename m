Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC938CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 02:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8MoHDV87EkButoVtnwYzpxxD5cG3nCo6IslC3GitKU=; b=tgaspI3re5pzAl7s2HbeK+ghMc
	E6WzYzQF2z8lVeqDNUT9T4hoDqRUsLAQUjAiH39NzaHzlgrLcYbKZwnGi5UQW8TH6GYi71a1odG6V
	GoTN27QBwfsNBKFkF9Bx6m9hAMs7KMQPyePLu7Fw90g2iYRPN37P4vq63kNoYu9+juNhRwg/D7AQr
	iamgdB8m8bPSUrtrHq4xyP3dqA9/9qa/T4/+1sV1Pb3aJbErQ7wIMQVZbXaIcf7UWf8Lcb1o6zgxy
	BUheJqZRrp6SNTdBYoZmKmeup27aiv1rtcXX+UQTjtn//GqbPPLBx6Le/uDTi9+u7QCrwRen0PNg/
	hKOIm+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNLmY-00000004MSQ-37ZS;
	Thu, 14 May 2026 02:26:38 +0000
Received: from azure-sdnproxy.icoremail.net ([13.75.44.102])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNLmU-00000004MRC-2V0p;
	Thu, 14 May 2026 02:26:37 +0000
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Thu, 14 May 2026 10:25:55 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Thu, 14 May 2026 10:25:55 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Jakub Kicinski" <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, devicetree@vger.kernel.org, davem@davemloft.net,
	edumazet@google.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maxime.chevallier@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com,
	horms@kernel.org
Subject: Re: Re: [PATCH net-next v7 2/4] net: stmmac: eic7700: enable clocks
 before syscon access and correct RX sampling timing
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260512161315.141aba88@kernel.org>
References: <20260427072353.1114-1-lizhi2@eswincomputing.com>
 <20260427072508.1151-1-lizhi2@eswincomputing.com>
 <20260428180625.738223cf@kernel.org>
 <2117464.7991.19ddd2125d1.Coremail.lizhi2@eswincomputing.com>
 <20260430163551.7491407a@kernel.org>
 <38d052b7.7a70.19dfb0d782b.Coremail.lizhi2@eswincomputing.com>
 <446f69bd.7fe4.19e1ab248fb.Coremail.lizhi2@eswincomputing.com>
 <20260512161315.141aba88@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7171f9b3.81b6.19e244e0e9f.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TAJkCgDHaXO1MgVqOkkZAA--.7373W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQEGDGoDVh1cGAAEso
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_192634_936942_CAB07471 
X-CRM114-Status: GOOD (  10.88  )
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

CgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2VzLS0tLS0KPiBGcm9tOiAiSmFrdWIgS2ljaW5za2ki
IDxrdWJhQGtlcm5lbC5vcmc+Cj4gU2VuZCB0aW1lOldlZG5lc2RheSwgMTMvMDUvMjAyNiAwNzox
MzoxNQo+IFRvOiDmnY7lv5cgPGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gQ2M6IGFuZHJl
dytuZXRkZXZAbHVubi5jaCwgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGRhdmVtQGRhdmVt
bG9mdC5uZXQsIGVkdW1hemV0QGdvb2dsZS5jb20sIHJvYmhAa2VybmVsLm9yZywga3J6aytkdEBr
ZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3JnLCBuZXRkZXZAdmdlci5rZXJuZWwub3JnLCBw
YWJlbmlAcmVkaGF0LmNvbSwgbWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbSwgYWxleGFuZHJlLnRv
cmd1ZUBmb3NzLnN0LmNvbSwgcm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWssIHBqd0BrZXJuZWwu
b3JnLCBwYWxtZXJAZGFiYmVsdC5jb20sIGFvdUBlZWNzLmJlcmtlbGV5LmVkdSwgYWxleEBnaGl0
aS5mciwgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZywgbGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBtYXhpbWUuY2hldmFsbGllckBib290
bGluLmNvbSwgbmluZ3l1QGVzd2luY29tcHV0aW5nLmNvbSwgbGlubWluQGVzd2luY29tcHV0aW5n
LmNvbSwgcGlua2VzaC52YWdoZWxhQGVpbmZvY2hpcHMuY29tLCBwcml0ZXNoLnBhdGVsQGVpbmZv
Y2hpcHMuY29tLCB3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tLCBob3Jtc0BrZXJuZWwu
b3JnCj4gU3ViamVjdDogUmU6IFtQQVRDSCBuZXQtbmV4dCB2NyAyLzRdIG5ldDogc3RtbWFjOiBl
aWM3NzAwOiBlbmFibGUgY2xvY2tzIGJlZm9yZSBzeXNjb24gYWNjZXNzIGFuZCBjb3JyZWN0IFJY
IHNhbXBsaW5nIHRpbWluZwo+IAo+IE9uIFR1ZSwgMTIgTWF5IDIwMjYgMTM6Mzk6MTIgKzA4MDAg
KEdNVCswODowMCkg5p2O5b+XIHdyb3RlOgo+ID4gRm9yIHRoZSBldGgxIGVuYWJsZW1lbnQgcGFy
dCwgbXkgY3VycmVudCB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgaXQKPiA+IHNob3VsZCBiZSB0cmVh
dGVkIGFzIGEgbmV3IGluZGVwZW5kZW50IHYxIHNlcmllcyBmb3IgbmV0LW5leHQsCj4gPiBzaW5j
ZSB0aGUgc2NvcGUgYW5kIHRhcmdldCB0cmVlIGhhdmUgY2hhbmdlZCBhZnRlciB0aGUgc3BsaXQu
Cj4gPiAKPiA+IFdvdWxkIHlvdSBwcmVmZXIgdGhpcyBldGgxIHNlcmllcyB0byBzdGFydCBhcyB2
MSwgb3Igc2hvdWxkIGl0Cj4gPiBjb250aW51ZSBhcyB2OCBmb3IgY29udGludWl0eSB3aXRoIHRo
ZSBvcmlnaW5hbCBzZXJpZXM/Cj4gCj4gdjggaXMgYmV0dGVyLCBidXQgaXMgdGhlIGZpeCBpbiBu
ZXQtbmV4dCBhbHJlYWR5Pwo+IAo+IElmIHRoaXMgaXMgdGhlIHBvc3RpbmcgeW91J3JlIHJlZmVy
cmluZyB0bzoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA1MDcwODMyMTQuMTky
LTEtbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbS8KPiBpdCBoYXMgYmVlbiBkcm9wcGVkIGJhc2Vk
IG9uIGZlZWRiYWNrIGZyb20gTWF4aW1lIGFuZCBJIGRvbid0IHNlZSBhIHYyLgoKWWVzLCB0aGUg
ZXRoMCBmaXhlcyBoYXZlIG5vdyBiZWVuIHJlcG9zdGVkIGFzIGEgZGVkaWNhdGVkIHNlcmllcyB0
YXJnZXRpbmcgbmV0OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjYwNTA3MDgzMDM3
LjE1Mi0xLWxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20vCgpUaGUgcHJldmlvdXMgbmV0LW5leHQg
ZXRoMS1yZWxhdGVkIHBvc3Rpbmcgd2FzIGRyb3BwZWQgZm9sbG93aW5nIHlvdXIgZ3VpZGFuY2UK
dG8gZmlyc3QgY29tcGxldGUgdGhlIGV0aDAgZml4ZXMgaW4gbmV0IGJlZm9yZSBjb250aW51aW5n
IHdpdGggZXRoMS4gSSB3aWxsCmtlZXAgZXRoMSBhcyB2OCBhcyBwcmV2aW91c2x5IHN1Z2dlc3Rl
ZC4KCkZvciB0aGUgZXRoMCBuZXQgc2VyaWVzLCBJIHdpbGwgc3BsaXQgdGhlIHJlbWFpbmluZyBj
aGFuZ2VzIGluIHYyIGFzIHN1Z2dlc3RlZApieSBNYXhpbWUgdG8gaW1wcm92ZSByZXZpZXdhYmls
aXR5IGFuZCBiaXNlY3RhYmlsaXR5LCBhbmQgcmVzZW5kIHNob3J0bHkuCgpPbmNlIHRoYXQgaXMg
Y29tcGxldGVkLCBJIHdpbGwgcHJvY2VlZCB3aXRoIHRoZSBldGgxIGVuYWJsZW1lbnQgc2VyaWVz
ICh2OCkKYmFzZWQgb24gdGhlIHVwZGF0ZWQgY29udGV4dC4KClRoYW5rcywKWmhpCg==

