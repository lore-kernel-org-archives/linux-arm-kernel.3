Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B8DC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihGPBiIAT0ONS82KUfYaHLC1u5yTJJn+nPz0lvfjuhM=; b=CiWwzSwZv8k3f4mW2JYbL2cPy/
	pM8dt4f71Ekc1DrMNPjYHcQg4In1zrmKxYqEIRlpxFsJI5y3dzBmo24CSXfxy7E0Y+x0mdKvDb7g+
	GX6jHW2UfItjL33Iu3H4w3SFa4H6qTDXJTJS23vWeLhR7pN4TDLpkd/RUb/A7bpmd62Z9I4Jtf9ja
	flS+aNfrMCzL/mI3lIvPUJJ53MjPqiPsz5pe8AwVwrp275UESFbOy8gKxmzuEc1/U5Ld/PpATgVme
	E4xL4QwsQRiPZqaiY8x0UNjeaE54pfaEUzCdjgPMJeipN8L6PkDfcbeuxXydNg7lUyH6wLJHI/LEA
	H3JiOm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9T4l-00000007CwP-39gG;
	Mon, 28 Apr 2025 18:19:31 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9T2n-00000007Cam-23JJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 18:17:30 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39c1efc4577so2976859f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 11:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745864248; x=1746469048; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ihGPBiIAT0ONS82KUfYaHLC1u5yTJJn+nPz0lvfjuhM=;
        b=OjancfIzaBrl53fzELI1n8OC3ICnB3GJpHq2Q6qBwRCKz3qJWVsc5e9lxJniJvQLkC
         C7EiCGiHIFNB1xzxU7AiUNGFBvCT4oqhM70sRwK9LWj2G2sxtdEclo+OjL2KfbaPyfbh
         MrpJtxIDQeR9pWlwW47nlTc9pLqnZ5meI7npiJScf9kYvA2rrMPAdhPFNFO6iVp0nfJ5
         q9j7gz6OOD57YQOyCKoCvRXrK68Cj6hSZIIt00QtJnVo/BI/U/veQ2f+9A2kaTLaqcAm
         +nXZJYfOAeLlhzhWbGZDjTebQUjy0Btk9ghvonZ7nPcU99+ozdtwas8hc/rFCi++ZQUx
         1Idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745864248; x=1746469048;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihGPBiIAT0ONS82KUfYaHLC1u5yTJJn+nPz0lvfjuhM=;
        b=aw0oMA2MrotLtz8NWk86HqZYm3xhJJcOf2zzrkasuVZYejiK857vyGOWbaloyJjYGD
         OxJZvpZIbX1KQc65DqjnVJZSnE/RB4cE14nDVAjvlZ7xq61GHbxOwmzr4cObko0QtEx2
         tvP6tL5QxvURvXLXHXvMOHAXFalHr4fp8tgQUvCrgODl8T/8rOplzs52EJ4noc/fv8SC
         eHeHKv6uVhoe4aFzvAgBcTtEQF+iGXT/kEzgxDAqBk1UV4eCBNV0BMsdeLcOyl4jHZMV
         UN3JRAYyJebPBCFpHHUKqNE/oNCRrAsMRPV+cW0tHgGwxlBaybpHPGUJ1RIMcwWbCkD6
         IQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJNJVzij1TVnnvX6oOQOPzVx2gALkZlmnm8kMVVF9d/nJ8aHdSGpMxMGZHdX6U498fRsKiUK0tH8zQH5aicIeh@lists.infradead.org
X-Gm-Message-State: AOJu0YwZsBD0xK2oOGU2Fzd7iKckbhbYGj/jdpdm05S8Iyz1iEu6m7WX
	Sdo0e8NI7OcXKu0o0vpKuMMrRLQmGNZWDV2OEWNoj0N4/d9gMLsrkdIdpzqPQ40=
X-Gm-Gg: ASbGnctAhmP/g5pGVd5zS3MLGW4i1e8Blhc46ogjFcYlIRriKRd7gkNtaT68Zjo9Bnp
	V+mITdCQx/65jP8EIrRUy8M7aOMjs56IQthYyOsCJTDJl3PTvidNqAt05ZgqIJQQN16AX+F5wB7
	fofw7LedgyB9ODGVNleYuQltnMkAtTITi2kqtWjw+UTdkuk26txihtIa2nj2oAh1Ca80/QDs2NU
	Yi3nsJRUcUN2LaGyIspz96tYF+V4V5jIOxU8JPHUtbgcMlzm2wW+uAjB4/4pz45xOiobN6adP7b
	eXfl3LJr/BPw5dKrfgNp8djadNLwQ4ByNzgou9ctMbx2CJaE3+Cnmhk=
X-Google-Smtp-Source: AGHT+IFizjQdKkSD/fIMemBtF85cPFPzy/Yw/Dq5QRP9W6htVYIl18G4A6sBNzjsAqVDMr/gP96C0g==
X-Received: by 2002:a05:6000:250e:b0:391:3157:7717 with SMTP id ffacd0b85a97d-3a08a371630mr250630f8f.34.1745864247691;
        Mon, 28 Apr 2025 11:17:27 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca497esm11718402f8f.24.2025.04.28.11.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 11:17:27 -0700 (PDT)
Message-ID: <24314441936d97a1892474eacdbbd690612de265.camel@linaro.org>
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
Date: Mon, 28 Apr 2025 19:17:25 +0100
In-Reply-To: <2025041715425693974c6d@mail.local>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250415160212.GA372032@google.com> <2025041715425693974c6d@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.54.3-2+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_111729_536779_6F02C297 
X-CRM114-Status: GOOD (  14.65  )
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

SGkgQWxleGFuZHJlLAoKT24gVGh1LCAyMDI1LTA0LTE3IGF0IDE3OjQyICswMjAwLCBBbGV4YW5k
cmUgQmVsbG9uaSB3cm90ZToKPiBPbiAxNS8wNC8yMDI1IDE3OjAyOjEyKzAxMDAsIExlZSBKb25l
cyB3cm90ZToKPiA+ID4gwqBkcml2ZXJzL21mZC9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDM1ICstCj4gPiA+
IMKgZHJpdmVycy9tZmQvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNSArLQo+ID4gPiDCoGRyaXZlcnMvbWZk
L3NlYy1hY3BtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDQ0MiArKysrKysrKysrKysrKysrKysrCj4gPiA+IMKgZHJpdmVycy9tZmQv
c2VjLWNvbW1vbi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDMwMSArKysrKysrKysrKysrCj4gPiA+IMKgZHJpdmVycy9tZmQvc2VjLWNvcmUu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgNDgxIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiDCoGRyaXZlcnMvbWZkL3NlYy1jb3Jl
LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMjMgKwo+ID4gPiDCoGRyaXZlcnMvbWZkL3NlYy1pMmMuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyMzkgKysrKysrKysr
Kwo+ID4gPiDCoGRyaXZlcnMvbWZkL3NlYy1pcnEuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0NjAgKysrKysrKy0tLS0tLS0tLS0t
LS0KPiA+IAo+ID4gPiDCoGRyaXZlcnMvcnRjL3J0Yy1zNW0uY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxOTcgKysrKysrLS0tCj4g
PiAKPiA+IE1GRCBwYXJ0cyBsb29rIG9rYXkgdG8gbWUgbm93Lgo+ID4gCj4gPiBXaXRoIEFja3Mg
ZnJvbSB0aGUgQ2xrIGFuZCBSVEMgbWFpbnRhaW5lcnMsIEkgY2FuIG1lcmdlIGFsbCBvZiB0aGUK
PiA+IGRyaXZlciBzdHVmZiB0b2dldGhlciBhbmQgc3VibWl0IGEgUFIgZm9yIG90aGVycyB0byBw
dWxsIGZyb20uCj4gPiAKPiAKPiBJIGRvbid0IHRoaW5rIHRoZSBSVEMgcGFydCBkZXBlbmRzIG9u
IHRoZSBNRkQgb25lIHNvIEkgd2FzIGdvaW5nIHRvCj4gYXBwbHkgdGhlIHBhdGNoZXMgaW4gbXkg
dHJlZSBpZiB0aGlzIGlzIGZpbmUgZm9yIGV2ZXJ5b25lLgoKUlRDIHBhdGNoIDI3IGRvZXMgZGVw
ZW5kIG9uIHRoZSBzMm1wZzEwIG1mZCBjb3JlIGRyaXZlciAoZHVlIHRvCnVzaW5nIGVudW1zIGFu
ZCBtYWNyb3MgaW50cm9kdWNlZCB0aGVyZSkuCgpQYXRjaGVzIDI1LiAyNiwgMjgsIDI5LCAzMCwg
MzEgaW5kZWVkIGRvbid0IHN0cmljdGx5IGRlcGVuZCBvbiB0aGUKTUZEIGNoYW5nZXMuIFdpdGhv
dXQgcGF0Y2ggMjcgaW4gcGxhY2UsIHBhdGNoZXMgMjUgJiAyNSB3aWxsCmRlZmluaXRlbHkgc3Rp
bGwgYXBwbHksIGFuZCBwYXRjaGVzIDI4Kysgd2lsbCBwcm9iYWJseSBhcHBseS4KCklmIHlvdSB3
YW50IHRvIHRha2UgdGhlbSwgSSBjYW4gdGhlbiByZWJhc2UgdGhpcyBzZXJpZXMgaWYgeW91IHRo
aW5rCnRoYXQncyBiZXR0ZXIuCgpJJ2xsIGRvIHdoYXRldmVyIGlzIHByZWZlcnJlZCwganVzdCBs
ZXQgbWUga25vdyA6LSkKCgpDaGVlcnMsCkFuZHJlJwoK


