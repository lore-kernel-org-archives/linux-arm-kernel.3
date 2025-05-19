Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23913C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXgngoiMruUqQcJAJ36RBgxyhu0aqtovmZVT2JgqK6o=; b=h53TxpmfIDGv3WEzBFrxYZXXor
	G1qi/W5T7nMCm/cmu55hPP26X4bhseXNuUcAXIl1DzgB7QU8NBj8GUepWATphHdncR3JLGdaVKJh6
	jeGwT9ZoB78yfJjXHhw6nc9c7YP1EDQdfW01oDwDdwprrjSQT5QYr78rAUbNltEHcvj5/HOgagM4Q
	TLeDmYsuHzYXPEs9VCufnUov7mWUykd6DAL18YiegLlzXIHXwiAL2UtFXuubasjCSY3C+w804Lkfz
	DD4qt5MJfaP8i66Y7CYgnbHeJh8lIvhTDSNOI5oh+hIMZjVk7yyy7xStBkT8HwAS8BtiOSHQhlruQ
	z416f45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2Vw-00000009dLo-0LXf;
	Mon, 19 May 2025 15:34:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1g2-00000009TZe-03fx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:41:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so26054065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747665672; x=1748270472; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PXgngoiMruUqQcJAJ36RBgxyhu0aqtovmZVT2JgqK6o=;
        b=WqN/qXAj1Kdtb7mw6sKzjRK4BndEEarQ6JsueGmeFpce9dYDCw3vauXjtecHe9j0lU
         5maM/2sPCve3MiYvDbNeKAXR4vsdlGdRw6OIoeHdMjXWfZcWaIvSyK9GNMsNAAmlNcEB
         NLEEcrIVkT7HcKVHXnpXVfXKz/2hil/AOcDDhVV4+i0Ne0wztImY7T8ELZ9Rq3ySq7Vi
         GfeteAvLRJNjIzLqwj/K9Df/u9NeDgQebXjGVV9aBBdwKWERQYA2RpGCYfTEo56ybJng
         8BqOnHyTqf+/c+LpNA0Vxd/TFKZX313aAHiMFJ/CheU2df6+SW1f/0xdmS4KEARhlR/v
         wgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665672; x=1748270472;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXgngoiMruUqQcJAJ36RBgxyhu0aqtovmZVT2JgqK6o=;
        b=o8pvt6hVbbFXEdqQyeCf/I9V1NGpoejxiMNkm3pDywJy2xi17Lwxy+sMOaJ4IuoVGR
         5eYZmpFyRugi2eI6oP+93O4UY6w/rdTCoIb/FElglpx9vjKCHdBSXoX9g9SpehGSjWRd
         mZES5LTeD+9beoCF+zsr6YphruDvZv2iZgAvUiOncUt0K8Ui7MY8qr54SKZtuwSoU3qd
         zA4jAoNW1qpgGDeGbzjJmxZ0/dgjPxsOLhHYxpkjo/Wti6AjaNJO4HiJsJ7zpjt7yf4X
         yn34EUJeL7kE7KxVqflUvr17vN0I6BbvShTS+LYutUdTMCUug6NnDq5puXA7KbTmjiaT
         kMtg==
X-Forwarded-Encrypted: i=1; AJvYcCVybZpvpvJg0MKPrEkTZTyJv9k7ll9tT4p4gXeq5WTNKEZ6meueJ23eMxiss6yqkyHjP0eX9DaPFtPqJK7lbDsM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5zexjj4fYzeO5D5zlnUsp5JDzrAF5tZaFbg/sX8GPe5YgXk8Z
	igwX4FJUhc/NCxtZ5wjLcClRmJv8HluGf6eflt7b2XeDu91OqfD/lBtuzMqnlcDvpcw=
X-Gm-Gg: ASbGncst2o9UcuyyxqNhFnAutFk1KOxbbM9F7UHJG5YyboyqdR/H1/M5crMIprkHAOf
	EEgN91fkDPdsl0UZuar1DV5rMV6ITdLlS2pczYblk3tHdBneAs8ePfqXa0J+Cw8ENb0XkU/Vhz6
	VQz0olAlt9fPpxyH2+EiDXVr0ZTJKPb50tEo8CTWN1Ubjk5gPia/P+Y1tl2VMnw4m+NWcOBNNCm
	R5iX/AqbSq1eaGsjvP5M9EXVJM0rt8GVPdgkxKCkQg09AeFBTBF5Vxkk+hW5rhgBn2VQlnKvtKL
	Xzz+mZ/6KXGlbu0bmLSre+FRxwm2WQklITeFRTxQIXO2Kkn8K6/YzZU=
X-Google-Smtp-Source: AGHT+IHEhMCIc1i5zg2NHcyMONsLyjwexSaW7YUlCJbZ3CdVo6leSerVam5BZph5FKXtCrhVs3o4xg==
X-Received: by 2002:a05:6000:310a:b0:3a3:6a77:3350 with SMTP id ffacd0b85a97d-3a36a77371amr5540633f8f.8.1747665672038;
        Mon, 19 May 2025 07:41:12 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd583f20sm140139625e9.28.2025.05.19.07.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:41:11 -0700 (PDT)
Message-ID: <905e6cab9932c814a578826329f5e3f944418ef9.camel@linaro.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Lee Jones
	 <lee@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, 	linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 19 May 2025 15:41:09 +0100
In-Reply-To: <24314441936d97a1892474eacdbbd690612de265.camel@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
		 <20250415160212.GA372032@google.com> <2025041715425693974c6d@mail.local>
	 <24314441936d97a1892474eacdbbd690612de265.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.55.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_074114_053507_DA8B588F 
X-CRM114-Status: GOOD (  18.08  )
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

SGkgQWxleGFuZHJlLAoKT24gTW9uLCAyMDI1LTA0LTI4IGF0IDE5OjE3ICswMTAwLCBBbmRyw6kg
RHJhc3ppayB3cm90ZToKPiBIaSBBbGV4YW5kcmUsCj4gCj4gT24gVGh1LCAyMDI1LTA0LTE3IGF0
IDE3OjQyICswMjAwLCBBbGV4YW5kcmUgQmVsbG9uaSB3cm90ZToKPiA+IE9uIDE1LzA0LzIwMjUg
MTc6MDI6MTIrMDEwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiA+IMKgZHJpdmVycy9tZmQvS2Nv
bmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAzNSArLQo+ID4gPiA+IMKgZHJpdmVycy9tZmQvTWFrZWZpbGXCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqAgNSArLQo+ID4gPiA+IMKgZHJpdmVycy9tZmQvc2VjLWFjcG0uY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNDQyICsrKysrKysrKysr
KysrKysrKysKPiA+ID4gPiDCoGRyaXZlcnMvbWZkL3NlYy1jb21tb24uY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzMDEgKysrKysrKysrKysr
Kwo+ID4gPiA+IMKgZHJpdmVycy9tZmQvc2VjLWNvcmUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNDgxIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ID4gPiA+IMKgZHJpdmVycy9tZmQvc2VjLWNvcmUuaMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyMyArCj4gPiA+ID4gwqBk
cml2ZXJzL21mZC9zZWMtaTJjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjM5ICsrKysrKysrKysKPiA+ID4gPiDCoGRyaXZlcnMv
bWZkL3NlYy1pcnEuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCA0NjAgKysrKysrKy0tLS0tLS0tLS0tLS0KPiA+ID4gCj4gPiA+ID4g
wqBkcml2ZXJzL3J0Yy9ydGMtczVtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTk3ICsrKysrKy0tLQo+ID4gPiAKPiA+ID4gTUZE
IHBhcnRzIGxvb2sgb2theSB0byBtZSBub3cuCj4gPiA+IAo+ID4gPiBXaXRoIEFja3MgZnJvbSB0
aGUgQ2xrIGFuZCBSVEMgbWFpbnRhaW5lcnMsIEkgY2FuIG1lcmdlIGFsbCBvZiB0aGUKPiA+ID4g
ZHJpdmVyIHN0dWZmIHRvZ2V0aGVyIGFuZCBzdWJtaXQgYSBQUiBmb3Igb3RoZXJzIHRvIHB1bGwg
ZnJvbS4KPiA+ID4gCj4gPiAKPiA+IEkgZG9uJ3QgdGhpbmsgdGhlIFJUQyBwYXJ0IGRlcGVuZHMg
b24gdGhlIE1GRCBvbmUgc28gSSB3YXMgZ29pbmcgdG8KPiA+IGFwcGx5IHRoZSBwYXRjaGVzIGlu
IG15IHRyZWUgaWYgdGhpcyBpcyBmaW5lIGZvciBldmVyeW9uZS4KPiAKPiBSVEMgcGF0Y2ggMjcg
ZG9lcyBkZXBlbmQgb24gdGhlIHMybXBnMTAgbWZkIGNvcmUgZHJpdmVyIChkdWUgdG8KPiB1c2lu
ZyBlbnVtcyBhbmQgbWFjcm9zIGludHJvZHVjZWQgdGhlcmUpLgoKTGVlIGhhcyBraW5kbHkgbWVy
Z2VkIGFsbCB0aGUgY29yZSBkcml2ZXIgcGF0Y2hlcy4KCkFueSBjaGFuY2UgdGhlIHJ0YyBjaGFu
Z2VzIHdpbGwgbWFrZSBpdCBpbnRvIHRoZSBzYW1lIGtlcm5lbCByZWxlYXNlPwoKQ2hlZXJzLApB
bmRyZScKCg==


