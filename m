Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFDEC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 03:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCjo++jxPb2m26uPX5nEv2seRmQSxTmYhd+wC5dx3tQ=; b=1F2ANAnsXVtSMm7sykow5WWPB0
	pjHQdxw+OgvnIJ0/bqRy9ut1hlZRSVaJdH0TzoFxN6Fd6Dbspojl8DKH47WKE3aA/RLNU1OTj17xg
	0C4fidggOXb401QkSANFJ3FQhEbSixPC4H8igrymdPMUvpbVqubZbyXI/WeENncmIEbpluOMebAhZ
	6YPKk2/YFjA3NyscgP9LwPeUxT/KZp3wm0Azc3suAVpNqMQk4H8+5nSWwybV/+BHOQzHjqILTWq09
	phnFF4vzRVjgz9227Zn2woRqRhk2l+xXvGlOP673hYdqkekfyqt4zC37w1U1Pr+xssfEA15OcTVyw
	EZv0hCsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWnoc-000000076fN-1MQr;
	Wed, 02 Jul 2025 03:07:18 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWnmH-000000076Ha-1qCl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 03:04:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751425470; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XUfxS/9WxCXUjsdlc0UxWCoHfuTflL9TbGEtvjoMBMJfPpjXH2e5Z6tAUQIj2zdQZDm1D4RMmiyDcufXUZ1JKT+Q2Nq3rRClA09tGYI8AowATgGGTYBEtxwTqpa15bbVL40zX9CcOhmgxJVfG82hwnm8EPTn2NuyxNYR9WtLBvg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751425470; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kCjo++jxPb2m26uPX5nEv2seRmQSxTmYhd+wC5dx3tQ=; 
	b=awTBKLvKqgEtc5Moi4QyIUUzAJWegDz66GnMm4LmgwqhqrrzX1JO39za4oeJH6pRNOq897pbHk2PP4zZ8KLsZJjZiOh6jCgljxgpmTnMEyKK69cbDVTtXsczeoDahH3y5h1Y+IN+YilEXJvox0AWE0TJr1jmhsDKiqvM59J54pU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751425470;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=kCjo++jxPb2m26uPX5nEv2seRmQSxTmYhd+wC5dx3tQ=;
	b=UvQX87EuDyQL6heWHjlgUaK9WLUyis9VEiqNpnfswdPVykTchPYe2wUdC4Sp397W
	jdveOjIw8ACk1Cf8ccnv6m+HbruCvDkDuGGWNZNoKZdMt0anRzEMACCzr8dXf5IlzJ0
	N8kB/vSdKpDtyALos+X1fTtr/RiittEV2DjvXpBAmQodgL3w3m3/KeSInotUYC4M6XX
	PA3jVp6AtiU8poqLk0/jULBDldc2P/HKbCMcrX3xRLhGWQpMcpKQH+39A/Wo4tFu3qc
	FPrhBnk+FXULWKGWicXbFJkpExmUbbhhsNkGpaSYkzcyL9SgCNoqJPwVLNVIbY2ewui
	XhtoSsE8MA==
Received: by mx.zohomail.com with SMTPS id 1751425468750404.3223451135418;
	Tue, 1 Jul 2025 20:04:28 -0700 (PDT)
Message-ID: <04ee563fda1411961e6f16bb1a2ab0a3163d550d.camel@icenowy.me>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: v3s: Fix wrong comment about UART2
 pinmux
From: Icenowy Zheng <uwu@icenowy.me>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-gpio@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,  Icenowy Zheng
 <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>
Date: Wed, 02 Jul 2025 11:04:18 +0800
In-Reply-To: <20250701201124.812882-2-paulk@sys-base.io>
References: <20250701201124.812882-1-paulk@sys-base.io>
	 <20250701201124.812882-2-paulk@sys-base.io>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_200453_527487_F60A8D3B 
X-CRM114-Status: GOOD (  14.00  )
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

5ZyoIDIwMjUtMDctMDHmmJ/mnJ/kuoznmoQgMjI6MTEgKzAyMDDvvIxQYXVsIEtvY2lhbGtvd3Nr
aeWGmemBk++8mgo+IFRoZSBvcmlnaW5hbCBjb21tZW50IGRvZXNuJ3QgbWF0Y2ggdGhlIHBpbiBh
dHRyaWJ1dGlvbiwgcHJvYmFibHkgZHVlCj4gdG8gYSBoYXN0eSBjb3B5L3Bhc3RlLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFBhdWwgS29jaWFsa293c2tpIDxwYXVsa0BzeXMtYmFzZS5pbz4KPiAtLS0K
PiDCoGRyaXZlcnMvcGluY3RybC9zdW54aS9waW5jdHJsLXN1bjhpLXYzcy5jIHwgMiArLQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGluY3RybC9zdW54aS9waW5jdHJsLXN1bjhpLXYzcy5jCj4gYi9kcml2
ZXJzL3BpbmN0cmwvc3VueGkvcGluY3RybC1zdW44aS12M3MuYwo+IGluZGV4IDY5NmQ3ZGQ4ZDg3
Yi4uMmUzYmQzNmE0NDEwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9zdW54aS9waW5j
dHJsLXN1bjhpLXYzcy5jCj4gKysrIGIvZHJpdmVycy9waW5jdHJsL3N1bnhpL3BpbmN0cmwtc3Vu
OGktdjNzLmMKPiBAQCAtNDUsNyArNDUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN1bnhpX2Rl
c2NfcGluIHN1bjhpX3Yzc19waW5zW10KPiA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgU1VOWElfUElO
KFNVTlhJX1BJTkNUUkxfUElOKEIsIDMpLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgU1VOWElfRlVOQ1RJT04oMHgwLCAiZ3Bpb19pbiIpLAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgU1VOWElfRlVOQ1RJT04oMHgxLCAiZ3Bpb19vdXQiKSwKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1VOWElfRlVOQ1RJT04oMHgyLCAidWFydDIi
KSzCoMKgwqDCoMKgwqDCoMKgwqAvKiBEMSAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBTVU5YSV9GVU5DVElPTigweDIsICJ1YXJ0MiIpLMKgwqDCoMKgwqDCoMKgwqDCoC8q
IENUUyAqLwoKTEdUTS4gQmxhbWUgdG8gbXkgQURIRCA7LSkKClJldmlld2VkLWJ5OiBJY2Vub3d5
IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBTVU5YSV9GVU5DVElPTl9JUlFfQkFOSygweDYsIDAsIDMpKSzCoMKgLyogUEJfRUlOVDMK
PiAqLwo+IMKgwqDCoMKgwqDCoMKgwqBTVU5YSV9QSU4oU1VOWElfUElOQ1RSTF9QSU4oQiwgNCks
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTVU5YSV9GVU5DVElPTigweDAs
ICJncGlvX2luIiksCgo=


