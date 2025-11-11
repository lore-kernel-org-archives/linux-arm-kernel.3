Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46195CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juEdnXgxukjP9ZDJM/F2G+Y1pTg5tm7ZX7Y0m15vG88=; b=U4LqoqPW7l0xkP8xiXaU67x7dK
	Fv+w8jRxXE3WeqjudfkCf5PVIoLB5yL8qUjSch41dWooQqt2oCM4rCII8o+WXr3P3QbRbRUxB7i53
	TBaoPtIzTtwIKzk5ar2r3N05PB641WOqgsw4dKtxTgsLH6GM4+wsJGEAQ4mxxn5jlS7mmkfY4WJnN
	FYx45lIF5JOAp59CfwLPThGqKUu/t2MTUFqqj0jN0SnmKZCz03r0mSjCHdE7kSgJt/t6Z/UTkTie8
	XNUR40txZQqEZF7xVc2cpJbGWxKKW/UajP91FNFJ6qWGArid9BJgOUdHyChcpr6LiIgdRy77Z6UIV
	IunKWuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl5P-00000006sqq-18fA;
	Tue, 11 Nov 2025 09:54:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl5N-00000006sqM-1jqp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 09:54:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42b312a089fso1514975f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 01:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762854887; x=1763459687; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=juEdnXgxukjP9ZDJM/F2G+Y1pTg5tm7ZX7Y0m15vG88=;
        b=blaBFYie/1IeDXAKdoIhGPSh/4cl8BseIMWPL+iyBPhPyo/EL/wntHE70e8BgLUhRI
         VZaOeVXH2sIW6awK+97oFPEt0fAxN98AI791uFP253KncrbedgYz3DOwTHGmt5EZb1en
         nPUdOYFK2GBdxH2vilOORi5WGbLRt0G3dn0lgrEoGPH2MVrFI+EtVJ7PyJfGStfBFn5p
         iq6herX7pXmLJp+NG98/ahASidcQKE1HmvavTodS4vIWCJ5924lm8iA+I6ct9jKRNRYC
         LKboktwKQCSA/uv5CfoFgbW/BjIkMUvWCKeP02iPqnTQztGTkutvI0S6PMsjt015T5xU
         XSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854887; x=1763459687;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juEdnXgxukjP9ZDJM/F2G+Y1pTg5tm7ZX7Y0m15vG88=;
        b=Z7MjM2nzlKHO22RM2pN/f4J1vwF9I9t9ZvuLl0xZsP5xbzwVfx2krDgGvD+ICVriQQ
         h05a/5L8bPQGNgVqdyvMznSxKDcJBTqSVl4rafJyke8u5yU2MZQ08QcaqU13FGn72+/z
         BGRiwYSAtCyjv+hI9vymy2LI1DATn2fTYj3TpwdrnUt3CeVwMf19Cp3oyY+Ilq/zux3W
         zv5mw0rRWLRDI7qvUeGk/Np68yRg8lbm0pth8owilCZClxd/e5odIsmkzcVQsvGr8y/G
         dBFA/dBpj8BXUljpkwmtGz7QEHx3JsJ0EKb2zr7eKDeOlaD8txq2UBzSpEb8wcQWFgNU
         8zHw==
X-Forwarded-Encrypted: i=1; AJvYcCUU5m7nyUNeDh2S576gyPSaeCaNjY5xDWHq5rm+Pk7QZJy/MMpPcao4rEqiB6YuUV9Kfo2zn1cZ7u04XL+b/w0U@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0y8u4p146CdEuYX1sA0ehTRw/aspEUme1Gw2d1kk+puaYTceT
	uF+2eI5futquXePXOmWAH2T5rt0PdDVwE3F9qEvISUFh3kh3BshyiS1grRCR5NX0sIM=
X-Gm-Gg: ASbGncsNjOrvyBDkrTTwqWfDUwhS8uYqcc+/P2CE8fp9Aq+ubU8y43G25DJ39QTQujV
	SKSiYFNv/FiSJFU7hWVrILzWDW8xVE3S6cSJyBV28JOzt2/561h+SzoL4IWH5/OR81p6uYburbw
	l+HJzZPlJNqCWfUPbu0vB/VO3ip26VsM89cemZwpNW22AE8I24dO6t2oOZjJFNSlKLNQMnATuF9
	5tyVUQzyKAQGQMVzkC/YfOgluPInGluIx/FzFdkqJ+2ZDtQgk8lso/CLiPi2Br5eg1WPW99FLRJ
	hCKPidJGmOrRN05PCDYMlLCiebwTIoiozZVonDX5TB5DeF2OxYVjEALhHg6uZHV9w/Q40Fjcbyp
	Jew5ET7d4gEZ7zJLrteLvUbQX1x6pK45R89vcoQyFaTNEpxTUEDCuSOA5jEe20AD8/P9u/ZusTG
	zsjzYh9XajjnFPInrsHSkgHVOoSjQ=
X-Google-Smtp-Source: AGHT+IHvLNA4fOeh9HdXCHeE6agVf5WRmWl1BvXGsAPsjjhtMFCdo+PVgS0jTmWpuz3ipwTVliR8Gw==
X-Received: by 2002:a05:6000:2211:b0:42b:4081:ccea with SMTP id ffacd0b85a97d-42b4081cff2mr3938949f8f.35.1762854887062;
        Tue, 11 Nov 2025 01:54:47 -0800 (PST)
Received: from draszik.lan ([212.129.83.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d544sm28207462f8f.46.2025.11.11.01.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:54:46 -0800 (PST)
Message-ID: <3bb47929b08370d9114ff1dd6b0d0f16d354d63b.camel@linaro.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 kernel-team@android.com
Date: Tue, 11 Nov 2025 09:54:42 +0000
In-Reply-To: <20251110-automatic-clocks-v4-1-8f46929f50b7@linaro.org>
References: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
	 <20251110-automatic-clocks-v4-1-8f46929f50b7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_015449_490433_BEACC0FE 
X-CRM114-Status: GOOD (  12.71  )
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

SGkgUGV0ZXIsCgpPbiBNb24sIDIwMjUtMTEtMTAgYXQgMTQ6MjEgKzAwMDAsIFBldGVyIEdyaWZm
aW4gd3JvdGU6Cj4gWy4uLl0KPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS1jbG9jay55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS0KPiBjbG9jay55YW1sCj4g
aW5kZXggMzFlMTA2ZWY5MTNkZWFkOWEwMzhiM2I2ZDhiNDNiOTUwNTg3ZjZhYS4uNWNlNWJhNTIz
MTEwYWYzYTJhNzc0MGI4YmEyOGUyMjcxYzc2YmRkYiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAxLWNsb2NrLnlhbWwKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAx
LWNsb2NrLnlhbWwKPiBAQCAtNTIsNiArNTIsMTEgQEAgcHJvcGVydGllczoKPiDCoMKgIHJlZzoK
PiDCoMKgwqDCoCBtYXhJdGVtczogMQo+IMKgCj4gK8KgIHNhbXN1bmcsc3lzcmVnOgo+ICvCoMKg
wqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+ICvCoMKg
wqAgZGVzY3JpcHRpb246Cj4gK8KgwqDCoMKgwqAgUGhhbmRsZSB0byBzeXN0ZW0gcmVnaXN0ZXJz
IGludGVyZmFjZS4KPiArCj4gwqByZXF1aXJlZDoKPiDCoMKgIC0gY29tcGF0aWJsZQo+IMKgwqAg
LSAiI2Nsb2NrLWNlbGxzIgo+IEBAIC0xNjYsNiArMTcxLDIyIEBAIGFsbE9mOgo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBidXMKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LSBjb25zdDogaXAKPiDCoAo+ICvCoCAtIGlmOgo+ICvCoMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4g
K8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGU6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBjb250YWlu
czoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIGdvb2dsZSxnczEwMS1jbXUtYXBtCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1taXNjCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC0gZ29vZ2xlLGdzMTAxLWhzaTAKClNob3VsZG4ndCB0aGlzIGJlIGdvb2dsZSxnczEwMS1jbXUt
aHNpMD8KCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1o
c2kyCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1wZXJp
YzAKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBnb29nbGUsZ3MxMDEtY211LXBlcmlj
MQo+ICsKPiArwqDCoMKgIHRoZW46Cj4gK8KgwqDCoMKgwqAgcmVxdWlyZWQ6Cj4gK8KgwqDCoMKg
wqDCoMKgIC0gc2Ftc3VuZyxzeXNyZWcKClRoZSBhYm92ZSBzdGlsbCBhbGxvd3MgKGJ1dCBkb2Vz
bid0IGVuZm9yY2UpIHNhbXN1bmcsc3lzcmVnIG9uIGNtdS10b3AuCgpNYXliZSBpdCdkIGJlIGJl
dHRlciB0byBpbnZlcnQgdGhlIHRlc3QsIGFzIGNtdS10b3AgaXMgdGhlIG9ubHkKb3V0bGllciwg
YW5kIHRoZW4gdGhlIGJpbmRpbmcgZG9lc24ndCBuZWVkIHRvIGJlIHVwZGF0ZWQgd2hlbiBtb3Jl
CkNNVXMgYXJlIGFkZGVkICh1bnRlc3RlZCk6CgogIC0gaWY6CiAgICAgIHByb3BlcnRpZXM6CiAg
ICAgICAgY29tcGF0aWJsZToKICAgICAgICAgIGNvbnRhaW5zOgogICAgICAgICAgICBjb25zdDog
Z29vZ2xlLGdzMTAxLWNtdS10b3AKCiAgICB0aGVuOgogICAgICByZXF1aXJlZDoKICAgICAgICAt
IHNhbXN1bmcsc3lzcmVnCgogICAgZWxzZToKICAgICAgcHJvcGVydGllczoKICAgICAgICBzYW1z
dW5nLHN5c3JlZzogZmFsc2UKCgpDaGVlcnMsCkFuZHJlJwo=


