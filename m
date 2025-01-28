Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E41C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 22:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:In-Reply-To:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1oPsq/wPc1Em+Hg0p1lVXpPB57NYp/vl2OLeJ/UDojs=; b=phOaZlp8xcQzosGWPpBbzBJUoH
	6BNN3hr0ZdsKTdR8pCGiNcDYgRYr8Ji0pTuSz8j45fPy/d64LRUW9ETt8kpycYQcqjSW18BbXHGje
	1NOuPmhTlUEZID/G2O585lmAevJNtXZKwhbkuyjjysyagzGVmXobf85iTKGz2XAEnxlXIKMqiaWZU
	vkRwwr4ebgssOOjqiHaRKZgncJPlD4PxXl3MWf/GjOzzQVY4n99N1YRh/UQ/Ccp7oE2JhIZ/nHTW7
	DAJAJuXg4aTiqxB8yNcn58X9+jk/2rbeJJCHhjAzUz3lYFMXUXgYcpmaRFVByo0ieWnwFsrffFocE
	BSoUKQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcu4T-00000005vxP-1dgY;
	Tue, 28 Jan 2025 22:28:37 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcu38-00000005vlS-2e9b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 22:27:15 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-2aa17fc59d1so4510029fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 14:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738103232; x=1738708032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oPsq/wPc1Em+Hg0p1lVXpPB57NYp/vl2OLeJ/UDojs=;
        b=4wYWnHQr32SIylASyjFlYQRpFCXaT9SgHX/VMRWg7e6+6pJCfxxrSFbOC5R4A4YdYO
         DtxTymEx+W58H+tH9PZDvLKlfn93UnPtsRsUdcy9c6JK5gxeIB1fYXcG0yjTKf7zgsr/
         wYdzDfjj2rB61E36UU8Lj25ppGf+GJO37SM2JKs0nQe9er+cNCiUHlEEpWyS5zpfapVt
         TyR5xjCPZWvgGsCSwyGb5mEc3mLqKABQzffEeDK6/usHP621mS3IZBXeoBZ3Pr3xJH3+
         WTtHsdG0m96eVh18EmFU6p04xbWtEy8x7BZQKf6ByrmGo+SotB67z4MJdfMpHm6S8k15
         vY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738103232; x=1738708032;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1oPsq/wPc1Em+Hg0p1lVXpPB57NYp/vl2OLeJ/UDojs=;
        b=gQ2GsN+iAZKv7lM2doGQgAjsoptuvVj47Wnr+QI4rpC6j67Ui1XcVVNzJN5ohDz69x
         2tHaeSu9lwkGFRz5Y09zqHsLugNYmRaRx/CYnFSC57I/WQQ8kV9yiSaaMybT7t66o/i+
         VQKSTgcnYs42piphFzS7GZl+xZbJFGJv+Ffo242e2/I8c5gdny0jSjqMFQo9ntLNDNGI
         QzFo1L+J0JVfC7TzLV6Og5MCyqAfjSSRtJQwX8caXzEJZ0CsO7nhJ0i3DBVjnyVcMguq
         4fm3+j0HJjYzvB43HM0f5rThZ0Y3MOQyHqIjWtM/0gNDrdLi6XR4xEa7vrxqop0JxdEa
         Msaw==
X-Forwarded-Encrypted: i=1; AJvYcCUIYs+AaXwvph7l+o15s3xdx8E2IZvH2Uk+nBFbun7wjKpLgNfN9qx4Tck7IVp3jUrDtEh0NZ446TjsCzuYJhaE@lists.infradead.org
X-Gm-Message-State: AOJu0YzyPCm8oHt9BAFyuIYXMr1siYlDgi53N8V68PsTrY4tS6O1Yg1y
	oPgzpoitS57RKGbp732CxtEK65GmBGAnTv6BcCf2Fb7Acq+7KA0XRgu896zZnflyfWQbBH2Pk0K
	GD34YTCn+LH5+TYjnpXstQw==
X-Google-Smtp-Source: AGHT+IFeAG2C9xR8f1M0hgf6V1daJ+fxDJUQydwjRBaY2ElBo17h0wGY5yg/cvc7a2DwDoaMiKoVVrkpEHs3u1ntTw==
X-Received: from oabpn27.prod.google.com ([2002:a05:6870:4d1b:b0:296:e327:5292])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:46a1:b0:29e:24c7:284f with SMTP id 586e51a60fabf-2b32f1b5a9dmr628806fac.15.1738103232354;
 Tue, 28 Jan 2025 14:27:12 -0800 (PST)
Date: Tue, 28 Jan 2025 22:27:11 +0000
In-Reply-To: <CAL_JsqLa9KmYjkVBpxwkQXfQyj53=dgj_9rijca5JGem46qZLg@mail.gmail.com>
 (message from Rob Herring on Tue, 28 Jan 2025 09:25:25 -0600)
Mime-Version: 1.0
Message-ID: <gsnt8qqu377k.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [RFC PATCH 1/4] perf: arm_pmuv3: Introduce module param to
 partition the PMU
From: Colton Lewis <coltonlewis@google.com>
To: Rob Herring <robh@kernel.org>
Cc: kvm@vger.kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	pbonzini@redhat.com, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_142714_674436_9CE09AF4 
X-CRM114-Status: GOOD (  16.27  )
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

SGV5IFJvYiwgdGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cml0ZXM6DQoNCj4gT24gTW9uLCBKYW4gMjcsIDIwMjUgYXQgNDoyNuKAr1BNIENv
bHRvbiBMZXdpcyA8Y29sdG9ubGV3aXNAZ29vZ2xlLmNvbT4gIA0KPiB3cm90ZToNCj4+IEBAIC0x
MjE1LDEwICsxMjQzLDE5IEBAIHN0YXRpYyB2b2lkIF9fYXJtdjhwbXVfcHJvYmVfcG11KHZvaWQg
KmluZm8pDQoNCj4+ICAgICAgICAgIGNwdV9wbXUtPnBtdXZlciA9IHBtdXZlcjsNCj4+ICAgICAg
ICAgIHByb2JlLT5wcmVzZW50ID0gdHJ1ZTsNCj4+ICsgICAgICAgcG1jcl9uID0gRklFTERfR0VU
KEFSTVY4X1BNVV9QTUNSX04sIGFybXY4cG11X3BtY3JfcmVhZCgpKTsNCg0KPj4gICAgICAgICAg
LyogUmVhZCB0aGUgbmIgb2YgQ05UeCBjb3VudGVycyBzdXBwb3J0ZWQgZnJvbSBQTU5DICovDQo+
PiAtICAgICAgIGJpdG1hcF9zZXQoY3B1X3BtdS0+Y250cl9tYXNrLA0KPj4gLSAgICAgICAgICAg
ICAgICAgIDAsIEZJRUxEX0dFVChBUk1WOF9QTVVfUE1DUl9OLCBhcm12OHBtdV9wbWNyX3JlYWQo
KSkpOw0KPj4gKyAgICAgICBiaXRtYXBfc2V0KGNwdV9wbXUtPmNudHJfbWFzaywgMCwgcG1jcl9u
KTsNCj4+ICsNCj4+ICsgICAgICAgaWYgKHJlc2VydmVkX2d1ZXN0X2NvdW50ZXJzID4gMCAmJiBy
ZXNlcnZlZF9ndWVzdF9jb3VudGVycyA8ICANCj4+IHBtY3Jfbikgew0KPj4gKyAgICAgICAgICAg
ICAgIGNwdV9wbXUtPmhwbW4gPSByZXNlcnZlZF9ndWVzdF9jb3VudGVyczsNCj4+ICsgICAgICAg
ICAgICAgICBjcHVfcG11LT5wYXJ0aXRpb25lZCA9IHRydWU7DQoNCj4gWW91J3JlIHN0b3Jpbmcg
dGhlIHNhbWUgaW5mb3JtYXRpb24gMyB0aW1lcy4gJ3BhcnRpdGlvbmVkJyBpcyBqdXN0DQo+ICdy
ZXNlcnZlZF9ndWVzdF9jb3VudGVycyAhPSAwJyBvciAnY3B1X3BtdS0+aHBtbiAhPSBwbWNyX24n
Lg0KDQpZZXMsIGJlY2F1c2UgY29kZSBvdXRzaWRlIHRoaXMgbW9kdWxlIHRoYXQgaXNuJ3QgYWxy
ZWFkeSByZWFkaW5nIFBNQ1IuTg0Kd2lsbCBuZWVkIHRvIGtub3cgdGhlIHJlc3VsdCBvZiB0aGF0
IGNvbXBhcmlvbi4NCg0KPj4gKyAgICAgICB9IGVsc2Ugew0KPj4gKyAgICAgICAgICAgICAgIHJl
c2VydmVkX2d1ZXN0X2NvdW50ZXJzID0gMDsNCj4+ICsgICAgICAgICAgICAgICBjcHVfcG11LT5o
cG1uID0gcG1jcl9uOw0KPj4gKyAgICAgICAgICAgICAgIGNwdV9wbXUtPnBhcnRpdGlvbmVkID0g
ZmFsc2U7DQo+PiArICAgICAgIH0NCg0KPj4gICAgICAgICAgLyogQWRkIHRoZSBDUFUgY3ljbGVz
IGNvdW50ZXIgKi8NCj4+ICAgICAgICAgIHNldF9iaXQoQVJNVjhfUE1VX0NZQ0xFX0lEWCwgY3B1
X3BtdS0+Y250cl9tYXNrKTsNCj4+IEBAIC0xNTE2LDMgKzE1NTMsNSBAQCB2b2lkIGFyY2hfcGVy
Zl91cGRhdGVfdXNlcnBhZ2Uoc3RydWN0IHBlcmZfZXZlbnQgIA0KPj4gKmV2ZW50LA0KPj4gICAg
ICAgICAgdXNlcnBnLT5jYXBfdXNlcl90aW1lX3plcm8gPSAxOw0KPj4gICAgICAgICAgdXNlcnBn
LT5jYXBfdXNlcl90aW1lX3Nob3J0ID0gMTsNCj4+ICAgfQ0KPj4gKw0KPj4gK21vZHVsZV9wYXJh
bShyZXNlcnZlZF9ndWVzdF9jb3VudGVycywgYnl0ZSwgMCk7DQoNCj4gTW9kdWxlIHBhcmFtcyBh
cmUgZ2VuZXJhbGx5IGRpc2NvdXJhZ2VkLiBTaW5jZSB0aGlzIGRyaXZlciBjYW4ndCBiZSBhDQo+
IG1vZHVsZSwgdGhpcyBpcyBhIGJvb3QgdGltZSBvbmx5IG9wdGlvbi4gVGhlcmUncyBsaXR0bGUg
cmVhc29uIHRoaXMNCj4gY2FuJ3QgYmUgYSBzeXNmcyBzZXR0aW5nLiBUaGVyZSdzIHNvbWUgY29t
cGxleGl0eSBpbiBjaGFuZ2luZyB0aGlzDQo+IHdoZW4gY291bnRlcnMgYXJlIGluIHVzZSAoanVz
dCByZWplY3QgdGhlIGNoYW5nZSkgYW5kIHdoZW4gd2UgaGF2ZQ0KPiBhc3ltbWV0cmljIFBNVXMu
IEFsdGVybmF0aXZlbHksIGl0IGNvdWxkIGJlIGEgc3lzY3RsIGxpa2UgdXNlciBhY2Nlc3MuDQoN
Ckkgc2VlIHdoYXQgeW91IG1lYW4uIEknbSBub3QgZGVhbGluZyB3aXRoIHRob3NlIGNvbXBsZXhp
dGllcyB5ZXQuIFRoYXQncw0Kd2h5IHRoaXMgaXMgYW4gUkZDLg0KDQo+IFJvYg0K

