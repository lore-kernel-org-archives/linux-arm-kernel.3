Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED4DC9EC8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfbWO1aGuOn2uSoQoraer2tqN4rBchMXS5VzEnX6yfI=; b=Hbc/VXdFtZZ7HiCB9KrrNTtmWI
	m3jtOTP59nhAKnTvVRHNM3YMoKxcTcYCpF682nS3xeXwqs7vj3Z/Flld/iitcBx5Edmi0y95ZLTtg
	NKombGJ9m381KegtTDI6Qh0XpY1ey4Zd50uud0uxfkIk+HMzDpbSRPeIRxAK2x1QSftugbW7Lchg2
	tFPI3JBYxqOndzNVOmtrI2HF6eI5BxIDcRpijnKcqYRfnTcBlDQIZaOJE98czDp1BHW0wkYImyqGg
	4aRIw7HyeW18f6oxqrl/QTkLZyK39Zu3SfAs1Mxe28awog70Ixgkdlh/DAzXjeX/da99cKfUoh4FO
	Dlv5tdSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIxs-00000005XHK-0I0m;
	Mon, 12 Jan 2026 14:32:16 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIxp-00000005XGu-2Il1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:32:14 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4ffbc2b861eso56263861cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 06:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768228332; x=1768833132; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FfbWO1aGuOn2uSoQoraer2tqN4rBchMXS5VzEnX6yfI=;
        b=a6giHISVpu7YxenVAbjfOqAMvi7o9zu40kPYJf5KQ48Co6NFt7/buWSLg4KBoo7bwx
         oiPmvQzBYHW5VE/VKsaDOmgMldCiFeiQ/qc+BImzO/zuHzjGT47oUXg7Qn/O9ycFD8Mh
         yDUHvmyFNX6A7ZZpB7SD4uNJUL8+pdT9YO7FcB3gwlLoS6yksi0MRO7BUroe+YkiAkKV
         fAcjMTCtTf+T6RhsUJRE5gJG1A1bmW+vQR1z5bxkUgskwnVPNthTartxnI2YSFltiVnU
         +bW/ezwE+mfNH7rbYRFctPczJm+n9koO+rJvSFcxW0PD4PJCtqkebwn2eH9P4tlQNk1e
         /xQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228332; x=1768833132;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FfbWO1aGuOn2uSoQoraer2tqN4rBchMXS5VzEnX6yfI=;
        b=al2IzMeMjm6lPATiqNGxYrm08Hg9gATlWSlTwv7JXPZhk6cbe+MkMFD+jhPiQP09eJ
         q6JNDR72zoDTUbOuCOEaY+plUHzexz969CHUUNrZpNKTtbyyUN44+bAbL+/nXqnQ7sGq
         mLvxlfs1bt86vkv6aXzcHRWkQA4rTBlU4lqxDHF/0AOsTFHkRWmoopQckpZmYiUBShuo
         Twp7LE+Wzy32U1HkVZReCr90rrHGeCSq30S0PMI7tnzKCmEhYW79rAU/KEfYYrd6WZbs
         FG68igqmBWjMstNmNVb42fnb2npZb3nOZFun6Kiy22dU+tyspkZENkU79vM6lzwU1JO3
         W/NQ==
X-Gm-Message-State: AOJu0YxSKaya966WbMh3l+O8N8oKdRWq/fUEw74bxDmDBkO7Hv7RjBKC
	ySH6GZauwj49KhNqKBjNUhruRUydG9OYqkH7U+bcrsAZUP5v2fiIYPPI8Ty5GyreRUQ=
X-Gm-Gg: AY/fxX7IL6QaBKpg2koVO+XgjeGxT9ZjEFupemkVXmTNPu77KG939CAmuOVnVbEJ9WA
	mSlB+acHLq+O2021ndrqb0b+14+tZnfOdzdh1PFgjqEoSzae0RT9SoWIS5OWbNzhLKVL3ZO+A72
	TDXDJbJRy3gAx/1bZvrdQWhJPczA9CzmeKLOKQSdb02wiRAaaMMRyWy8gxz00sbyLn+wgOdfmdx
	wwhAWYSdnp/BSTnkBhhoOd6ruqdDQsOZv+3dnP5ocbBKSMF7DDB4yzMSi3cm6sh67KC9ZH5B9le
	rXiExiPx+p3xZFLuO37LN38Ta0MnjZiTGWSHpj1i3Qkws7twnkUY6IuAt+5Yyua/xRaggD4x6pl
	HB4t++KfXAzPe1AQKZ+0EhDzOSrNLOsOE4kEhraNE95sSV1S9JD/FL7q/5HpSDjWNbq+vT8QWSF
	7vWJwMz5FmOqQGuV38
X-Google-Smtp-Source: AGHT+IHea1XbblI0vmCFH9AgF6ECutmFZl6Uyg98T0XsIc8dVZ57in8jEwwvFP3O7OjCYMeRYIbGfw==
X-Received: by 2002:ac8:5359:0:b0:4ff:c63c:3ca3 with SMTP id d75a77b69052e-4ffc63c3d79mr136106261cf.47.1768228332043;
        Mon, 12 Jan 2026 06:32:12 -0800 (PST)
Received: from draszik.lan ([212.129.79.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e627absm122860611cf.30.2026.01.12.06.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:32:11 -0800 (PST)
Message-ID: <0076e60fb5a4d3a6970d93b4768d4f083baa7a83.camel@linaro.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: google,gs101-clock: Add DPU
 clock management unit
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Mon, 12 Jan 2026 14:32:49 +0000
In-Reply-To: <20260112-dpu-clocks-v2-2-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-2-bd00903fdeb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_063213_603118_26E08B23 
X-CRM114-Status: GOOD (  14.30  )
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

T24gTW9uLCAyMDI2LTAxLTEyIGF0IDE0OjE2ICswMDAwLCBQZXRlciBHcmlmZmluIHdyb3RlOgo+
IEFkZCBkdCBzY2hlbWEgZG9jdW1lbnRhdGlvbiBhbmQgY2xvY2sgSURzIGZvciB0aGUgRGlzcGxh
eSBQcm9jZXNzIFVuaXQKPiAoRFBVKSBjbG9jayBtYW5hZ2VtZW50IHVuaXQgKENNVSkuIFRoaXMg
Q01VIGZlZWRzIElQcyBzdWNoIGFzIGltYWdlIHNjYWxlciwKPiBlbmhhbmNlciBhbmQgY29tcHJl
c3Nvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBHcmlmZmluIDxwZXRlci5ncmlmZmluQGxp
bmFyby5vcmc+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2Mgo+IMKgLSBhbHBoYW51bWVyaWMgcGxhY2Vt
ZW50IChLcnp5c3p0b2YpCj4gLS0tCj4gwqAuLi4vYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAx
LWNsb2NrLnlhbWzCoMKgwqDCoMKgwqDCoMKgIHwgMTkgKysrKysrKysrKysrCj4gwqBpbmNsdWRl
L2R0LWJpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS5owqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAz
NiArKysrKysrKysrKysrKysrKysrKysrCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Nsb2NrL2dvb2dsZSxnczEwMS1jbG9jay55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS0KPiBjbG9jay55YW1sCj4gaW5kZXggYTgxNzY2
ODdiYjc3M2FlOTA4MDBiOWMyNTZiY2NjZWJmZGVmMmU0OS4uMDA2MjBhYjE4NzJkYjA0ODlkY2Ux
ODIzYWI1MDBjMDA2MmI2NTFmMCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAxLWNsb2NrLnlhbWwKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAxLWNsb2NrLnlhbWwK
PiBAQCAtMjgsNiArMjgsNyBAQCBwcm9wZXJ0aWVzOgo+IMKgwqAgY29tcGF0aWJsZToKPiDCoMKg
wqDCoCBlbnVtOgo+IMKgwqDCoMKgwqDCoCAtIGdvb2dsZSxnczEwMS1jbXUtYXBtCj4gK8KgwqDC
oMKgwqAgLSBnb29nbGUsZ3MxMDEtY211LWRwdQo+IMKgwqDCoMKgwqDCoCAtIGdvb2dsZSxnczEw
MS1jbXUtaHNpMAo+IMKgwqDCoMKgwqDCoCAtIGdvb2dsZSxnczEwMS1jbXUtaHNpMgo+IMKgwqDC
oMKgwqDCoCAtIGdvb2dsZSxnczEwMS1jbXUtbWlzYwo+IEBAIC04Miw2ICs4MywyNCBAQCBhbGxP
ZjoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpdGVtczoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLSBjb25zdDogb3NjY2xrCj4gwqAKPiArwqAgLSBpZjoKPiArwqDCoMKgwqDCoCBwcm9wZXJ0
aWVzOgo+ICvCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAg
Y29udGFpbnM6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Q6IGdvb2dsZSxnczEwMS1j
bXUtZHB1Cj4gKwo+ICvCoMKgwqAgdGhlbjoKPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+ICvC
oMKgwqDCoMKgwqDCoCBjbG9ja3M6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBpdGVtczoKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBFeHRlcm5hbCByZWZlcmVuY2UgY2xv
Y2sgKDI0LjU3NiBNSHopCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjog
RFBVIGJ1cyBjbG9jayAoZnJvbSBDTVVfVE9QKQo+ICsKPiArwqDCoMKgwqDCoMKgwqAgY2xvY2st
bmFtZXM6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBpdGVtczoKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAtIGNvbnN0OiBvc2NjbGsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBi
dXMKPiArCj4gwqDCoCAtIGlmOgo+IMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+IMKgwqDCoMKg
wqDCoMKgwqAgY29tcGF0aWJsZToKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9j
bG9jay9nb29nbGUsZ3MxMDEuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdz
MTAxLmgKPiBpbmRleCA0NDJmOWU5MDM3ZGMzMzE5OGExY2VlMjBhZjYyZmM3MGJiZDk2NjA1Li40
ZWU0NjUwMzY2M2MxZjhkOTQ2MzUzNmMzNDdkZTVkOTkxNDc0MTQ1IDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAxLmgKPiArKysgYi9pbmNsdWRlL2R0
LWJpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS5oCj4gQEAgLTYzNCw0ICs2MzQsNDAgQEAKPiDC
oCNkZWZpbmUgQ0xLX0dPVVRfUEVSSUMxX0NMS19QRVJJQzFfVVNJOV9VU0lfQ0xLCQk0NQo+IMKg
I2RlZmluZSBDTEtfR09VVF9QRVJJQzFfU1lTUkVHX1BFUklDMV9QQ0xLCQk0Ngo+IMKgCj4gKy8q
IENNVV9EUFUgKi8KCk1heWJlIGFkZCB0aGlzIGJsb2NrIGJlZm9yZSBoc2kwIGFuZCBhZnRlciBh
cG0gdG8ga2VlcCBhbHBoYWJldGljIG9yZGVyaW5nCm9mIENNVSBibG9ja3MgaW4gdGhpcyBmaWxl
LgoKQ2hlZXJzLApBbmRyZScK


