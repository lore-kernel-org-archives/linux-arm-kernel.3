Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907C5C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUJtxVCgOPUC9izlgo4CNw2jnzc7+5K3qEajbBawjgg=; b=gxyPltOpOejsw/tBJtJOOS/1F9
	IwsCFSGZec7kE4p1xtj4luTLrrNG7lCEPE7TeBNxLDKN1C12s2LsFR+44RO4UMDlfNkc6vXpuYnFW
	+XasR2ygEu+S8ZevI22t77phHgLX9WX1zK4TQK2ZVPxG84xMBph69T8UESIZ0/OjCP1D2aOZSn8bc
	rT1wU7tMvxBREgoHdBQ622whtKrh+QcBmhtaICVSWI1FXVqNfba02yPGceInupiu1FuZwJ8ZqL6ht
	PLbUmBXLBXPREiNH66FqasLU8n1paFDCbk0I0ByvTUDjbRHY0mlX/vwWi5cfCgbeP3q04MIQ/UCEn
	xbAQNl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR90n-00000004NSx-2agQ;
	Mon, 16 Jun 2025 12:32:29 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR85d-00000004DDG-1Knz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:33:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so3387920f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 04:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750073603; x=1750678403; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sUJtxVCgOPUC9izlgo4CNw2jnzc7+5K3qEajbBawjgg=;
        b=uxfpk/392HHZDIRVx+8pB4n1onDwAEMY9aVFqievwKiaZ2Q+KcLsgsOSUn0FMHJHPn
         o9Xa8yJ6uIKVbVjev33MBejDH6cy9CxgpyzmYAcTtjpTNk/a4sVpMwx7e97LjKS/vKBc
         gy0Rbov40tSwRZ59B195zxtDSrDvk1ro3GIdtKUGeS1zlj2XBurxBnN3fIRS0cGiq4eB
         gGhYiGiZUfRhDBw0XcvV/xfnyUiU8HafTgYkV/78vx06LDPOTWs9jjFyIfrc2U0EUnij
         ZzacunDg5kL0PHRSpURpJWLJpLREHrpmzTynuw1T+eGTl2EYcituLXNPfGR+HIpPZkcY
         7lVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750073603; x=1750678403;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUJtxVCgOPUC9izlgo4CNw2jnzc7+5K3qEajbBawjgg=;
        b=szvr47iR3mvG+6hSASX46PWE8NOeLHljMix9mORQ7Ebd4SB73y/oYYtm80UqTy9lVd
         QX+pXYO8hZrFuoSB0YqbmHCH4lxyevSJFSuEhWgE3IzdoyxfJQ71PDZlumBkeCwAtbKG
         Wv0rccBfaI413m26r3chG+E+cIQ7JsQUHqkoBAEk7rN/M1DFzd+IHBunHErMZlrG+YjF
         0Er0tubz1LX4ChncBATuFQ4MCo7K86QDV13EHSN6lHKAfGHhe1KMQZ/iJFBbQZvsCXhf
         hLtp6ynj+flPZVMAE8xafJr6iY2pzd4eLFIuEH6DkWQMGf/2NiWaRFVP+SO95WZ2ywAd
         gg0A==
X-Forwarded-Encrypted: i=1; AJvYcCWMFH69YzGD1jkqEssSTeYeVAuEgZg0jowAdE1GKNXURYfABUhzWqvGP0vQtxQGPtS54MSzfMDMR1rQqjAJ/6Ar@lists.infradead.org
X-Gm-Message-State: AOJu0YzjTRo6Wx9ND3PYUHbuPtgqWdJuNN5KlOY6r0PbsMY9CZ9iTbd2
	KOY2MyUiM3RlhH3ZIUtxOz2UmnvMVaTG7pJbrt4AxLwUSWR/anAxsXG8pTvPAmNXciA=
X-Gm-Gg: ASbGnctBSIP3haLgjmebIjA6SNAo6OTKOMbwkZ97zmyazHIq1XbKIfj55kyYQ2XcD76
	DLjD9mcIDkDrfwmaQHfcRk6PMoOBBDJngwjFKnf9Pcy3eiYH/CXFJrOq2mxorl4m2eYLg1th/RP
	BDFYVSU0MarxHNqPlZaX9tH9v6Ns+f3Jfbb2eaccvuCxIG5iT75nvdSMmDl0FfBf/DIK8tarYHY
	7g2lL4wzFv1mdWA1ti9hcdulh7vJvHtGGmis8hOs8Tr5xcpp8y/EqlfTO6IO9ZNBbVyIQzKqIfH
	6rKhkp+1v+8tKiUfJBg35BfoxwIdqMpmApIkx8B6eiHjsLreutOOK/HXVumwVV7awmmNUIqfRui
	Bog==
X-Google-Smtp-Source: AGHT+IHENEkwxduA7K0Vjfe2dGuq+xptRSYw34g+0tog7rCYhbhJGOxjnsq/iY/dAhPOFFaN1g90tg==
X-Received: by 2002:a05:6000:2501:b0:3a4:d700:f773 with SMTP id ffacd0b85a97d-3a5723977camr6533466f8f.11.1750073603145;
        Mon, 16 Jun 2025 04:33:23 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532063ebf6sm111747185e9.3.2025.06.16.04.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:33:22 -0700 (PDT)
Message-ID: <b193e94f042cf6134d2bed92152c23ee5bba6a26.camel@linaro.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus	 <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rtc@vger.kernel.org, Lee Jones
 <lee@kernel.org>
Date: Mon, 16 Jun 2025 12:33:21 +0100
In-Reply-To: <905e6cab9932c814a578826329f5e3f944418ef9.camel@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
			 <20250415160212.GA372032@google.com> <2025041715425693974c6d@mail.local>
		 <24314441936d97a1892474eacdbbd690612de265.camel@linaro.org>
	 <905e6cab9932c814a578826329f5e3f944418ef9.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_043325_365041_1E4218A1 
X-CRM114-Status: GOOD (  18.92  )
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

SGkgQWxleGFuZHJlLAoKT24gTW9uLCAyMDI1LTA1LTE5IGF0IDE1OjQxICswMTAwLCBBbmRyw6kg
RHJhc3ppayB3cm90ZToKPiBIaSBBbGV4YW5kcmUsCj4gCj4gT24gTW9uLCAyMDI1LTA0LTI4IGF0
IDE5OjE3ICswMTAwLCBBbmRyw6kgRHJhc3ppayB3cm90ZToKPiA+IEhpIEFsZXhhbmRyZSwKPiA+
IAo+ID4gT24gVGh1LCAyMDI1LTA0LTE3IGF0IDE3OjQyICswMjAwLCBBbGV4YW5kcmUgQmVsbG9u
aSB3cm90ZToKPiA+ID4gT24gMTUvMDQvMjAyNSAxNzowMjoxMiswMTAwLCBMZWUgSm9uZXMgd3Jv
dGU6Cj4gPiA+ID4gPiDCoGRyaXZlcnMvbWZkL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMzUgKy0KPiA+ID4g
PiA+IMKgZHJpdmVycy9tZmQvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNSArLQo+ID4gPiA+ID4gwqBkcml2
ZXJzL21mZC9zZWMtYWNwbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCA0NDIgKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ID4gwqBk
cml2ZXJzL21mZC9zZWMtY29tbW9uLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgMzAxICsrKysrKysrKysrKysKPiA+ID4gPiA+IMKgZHJpdmVy
cy9tZmQvc2VjLWNvcmUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgNDgxIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiA+ID4gwqBk
cml2ZXJzL21mZC9zZWMtY29yZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIzICsKPiA+ID4gPiA+IMKgZHJpdmVycy9tZmQvc2Vj
LWkyYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDIzOSArKysrKysrKysrCj4gPiA+ID4gPiDCoGRyaXZlcnMvbWZkL3NlYy1pcnEu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCA0NjAgKysrKysrKy0tLS0tLS0tLS0tLS0KPiA+ID4gPiAKPiA+ID4gPiA+IMKgZHJpdmVy
cy9ydGMvcnRjLXM1bS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDE5NyArKysrKystLS0KPiA+ID4gPiAKPiA+ID4gPiBNRkQgcGFy
dHMgbG9vayBva2F5IHRvIG1lIG5vdy4KPiA+ID4gPiAKPiA+ID4gPiBXaXRoIEFja3MgZnJvbSB0
aGUgQ2xrIGFuZCBSVEMgbWFpbnRhaW5lcnMsIEkgY2FuIG1lcmdlIGFsbCBvZiB0aGUKPiA+ID4g
PiBkcml2ZXIgc3R1ZmYgdG9nZXRoZXIgYW5kIHN1Ym1pdCBhIFBSIGZvciBvdGhlcnMgdG8gcHVs
bCBmcm9tLgo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gSSBkb24ndCB0aGluayB0aGUgUlRDIHBhcnQg
ZGVwZW5kcyBvbiB0aGUgTUZEIG9uZSBzbyBJIHdhcyBnb2luZyB0bwo+ID4gPiBhcHBseSB0aGUg
cGF0Y2hlcyBpbiBteSB0cmVlIGlmIHRoaXMgaXMgZmluZSBmb3IgZXZlcnlvbmUuCj4gPiAKPiA+
IFJUQyBwYXRjaCAyNyBkb2VzIGRlcGVuZCBvbiB0aGUgczJtcGcxMCBtZmQgY29yZSBkcml2ZXIg
KGR1ZSB0bwo+ID4gdXNpbmcgZW51bXMgYW5kIG1hY3JvcyBpbnRyb2R1Y2VkIHRoZXJlKS4KPiAK
PiBMZWUgaGFzIGtpbmRseSBtZXJnZWQgYWxsIHRoZSBjb3JlIGRyaXZlciBwYXRjaGVzLgo+IAo+
IEFueSBjaGFuY2UgdGhlIHJ0YyBjaGFuZ2VzIHdpbGwgbWFrZSBpdCBpbnRvIHRoZSBzYW1lIGtl
cm5lbCByZWxlYXNlPwoKRnJpZW5kbHkgcGluZy4KCgpDaGVlcnMsCkFuZHJlJwo=


