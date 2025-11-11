Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643B3CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 09:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/FDcgEC0NqdGGYV5LPhCY8eQLNHWRRJowrE/ROA2P8=; b=H7hduxhQBgkBJJL5ltogSU/R3W
	yCQ8LAiddAiPEB7g9QYAXd0xfzJBaf7FAsN/Ljsjn4xxywH+mW/n/liV7tcYr8PkgNd7UDJS2+dmn
	9LsquWsNaLEbBIddj78MlP6KXUWDgXQHA8L6ibC/5h23vpfAMwh/1E+LZNXOHT5EHBormgyliOH/3
	cPJbSRjFG7ib2ZEwPBIqyRnEFMr9YI5DsXZ/eQtRQtKabV/g1AgYRW33pAC7H70upCCsnc83+ZUQ6
	/qCxQvjEALNdhedD5zJ6Tcb973RVw87JMcn1GshaSAc5Nxt5pnc1K59adF7QgVwtYKaD7SbQTs0pZ
	hj2tVoHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl8I-00000006taQ-0Qdt;
	Tue, 11 Nov 2025 09:57:50 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl8G-00000006tZs-1A56
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 09:57:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-477775d3728so23154805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 01:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762855066; x=1763459866; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A/FDcgEC0NqdGGYV5LPhCY8eQLNHWRRJowrE/ROA2P8=;
        b=AFk1+ExXLA6DITmlgTPKY8aLQmpztPcd+9hfg1/Lh7fv4RI78F6JIDIVxbLfR2oyT/
         JYtI7LSF2VuZx2UkSw9uuDviJLqzqWD/iaSlnBfPLke8+SaQVcUQ0N1oZW4GkJRbe0tV
         z6+LCMLbzcbDWER/fIh97wLiQVEFA4jHCsC6t4gKn+jiaOs0J5ajzAm40B18U9bhPRIX
         VqioaMOHad8vxBCVgOuY+CZ2k8v6btqzc0rWKVB7hNd5Cg3tWKdSF1UEVwnMdtNnHgJJ
         K1EwCC55+ZNSOmwQWKF+ZuGI1ti735IowzjyeRxB7lDM+7qlzdH+xWFwxmVFeIfEcq//
         cGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762855066; x=1763459866;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A/FDcgEC0NqdGGYV5LPhCY8eQLNHWRRJowrE/ROA2P8=;
        b=vY1DGl5BhicxIFI3wZW3mKJaOcTQw1czNYQXxxntB2h6vObzvFh0r0V7kzws31mBJY
         mOLQjZdbCVbYP7Yfdxm1w5mF5ZaZPJuErH0p7Wcb3zdW+zi6wYR0lSJju4upCE5Yz9Qp
         eLoX3oJIsUhXAbCrGCMGlSsyZQNwOAWdwLEQDu5OmL1zZ2FAQrLjlFtfu4mjZTjkhVfB
         8S66WaJ+iCpwYzne1HwmlVmTM21N7f01VBiQQRKBK/aXeHhUNYGt3HIP/p69ZUki0fIm
         joXc3xuQnx756LVQJbBSnLsAabByqWItZ5/vOSPmTEum2P1GyDOEe1odyvEHckfvk6l6
         QuDg==
X-Forwarded-Encrypted: i=1; AJvYcCVHY1PecZMa2YUtzwR4eHryUKyObHswsJ80GwpcfnHm65UDMpFY/B+6t5hEWWFCkQO7dbMntHAbT0wBgVHwRSY2@lists.infradead.org
X-Gm-Message-State: AOJu0YyRrvsIY7CePZ5LRmJjZ4WDOpckw+asfGoNls3FgnWKiRp74ceg
	p8fEBjJb/XLksYkzxR7ZyH/wNXePj+BZo8srNVBXR9t2Pg08Noq1ycZUSHAzoOAOhvg=
X-Gm-Gg: ASbGncsVx6wG7IKPJeLIZYujTriOX8LbunKdAIFsm/z/N+cxHfNnlHWg5flnp/Tf4eF
	xpetEvGHPwDFNqbNRseLoBoTSK+FajZvsFD6XCSPcWgu269dtKtoVnCsrc0Jix7YOoclIrSR0a5
	t1jj7jrjF1rpyR84yKVTsPbUJ0CpK4QXgrP/zK6Q6iJZSKaTD35u7uewdZBX5NrJvTGza35JLmR
	A6liSExDwEgS5urAdRv9578ejMhrnMA4JfoXtbC2D/ZQcHYQhB5EtAC53OUtbl++wLjPOvkZr4C
	/YI6ceAz84KXtMPAW4KWh3IFUnSOgasIwN2tCrFTOrgKwtwwyNFF2pKfy6hT4yaXBbWEKRD7XTp
	caYYQlfix0K/UUG0XhGjC5DMgO/eZgx+xZZlOUo7SlPo3RZ9be+5j8flf25MaqEE5HwiOn7nhj3
	fIV52xXw==
X-Google-Smtp-Source: AGHT+IFx1tQhYEcMAjmeDGusVpDAcsUi3ywSe54TVsoxYy0zvPtJEA10WARNrOByXA/spkwUzB6jqA==
X-Received: by 2002:a05:600c:1c08:b0:475:df91:de03 with SMTP id 5b1f17b1804b1-47773289066mr81723875e9.39.1762855066460;
        Tue, 11 Nov 2025 01:57:46 -0800 (PST)
Received: from draszik.lan ([212.129.83.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce211d8sm380577775e9.11.2025.11.11.01.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:57:45 -0800 (PST)
Message-ID: <9c344c5f43e71f30ccbd07b201eb470ed8e5fe35.camel@linaro.org>
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
Date: Tue, 11 Nov 2025 09:57:42 +0000
In-Reply-To: <3bb47929b08370d9114ff1dd6b0d0f16d354d63b.camel@linaro.org>
References: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
		 <20251110-automatic-clocks-v4-1-8f46929f50b7@linaro.org>
	 <3bb47929b08370d9114ff1dd6b0d0f16d354d63b.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_015748_365187_EE7C4223 
X-CRM114-Status: GOOD (  15.23  )
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

T24gVHVlLCAyMDI1LTExLTExIGF0IDA5OjU0ICswMDAwLCBBbmRyw6kgRHJhc3ppayB3cm90ZToK
PiBIaSBQZXRlciwKPiAKPiBPbiBNb24sIDIwMjUtMTEtMTAgYXQgMTQ6MjEgKzAwMDAsIFBldGVy
IEdyaWZmaW4gd3JvdGU6Cj4gPiBbLi4uXQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS1jbG9jay55YW1sCj4g
PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9nb29nbGUsZ3MxMDEt
Cj4gPiBjbG9jay55YW1sCj4gPiBpbmRleCAzMWUxMDZlZjkxM2RlYWQ5YTAzOGIzYjZkOGI0M2I5
NTA1ODdmNmFhLi41Y2U1YmE1MjMxMTBhZjNhMmE3NzQwYjhiYTI4ZTIyNzFjNzZiZGRiIDEwMDY0
NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2dvb2ds
ZSxnczEwMS1jbG9jay55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvY2xvY2svZ29vZ2xlLGdzMTAxLWNsb2NrLnlhbWwKPiA+IEBAIC01Miw2ICs1MiwxMSBA
QCBwcm9wZXJ0aWVzOgo+ID4gwqDCoCByZWc6Cj4gPiDCoMKgwqDCoCBtYXhJdGVtczogMQo+ID4g
wqAKPiA+ICvCoCBzYW1zdW5nLHN5c3JlZzoKPiA+ICvCoMKgwqAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+ID4gK8KgwqDCoCBkZXNjcmlwdGlvbjoKPiA+
ICvCoMKgwqDCoMKgIFBoYW5kbGUgdG8gc3lzdGVtIHJlZ2lzdGVycyBpbnRlcmZhY2UuCj4gPiAr
Cj4gPiDCoHJlcXVpcmVkOgo+ID4gwqDCoCAtIGNvbXBhdGlibGUKPiA+IMKgwqAgLSAiI2Nsb2Nr
LWNlbGxzIgo+ID4gQEAgLTE2Niw2ICsxNzEsMjIgQEAgYWxsT2Y6Cj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLSBjb25zdDogYnVzCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBj
b25zdDogaXAKPiA+IMKgCj4gPiArwqAgLSBpZjoKPiA+ICvCoMKgwqDCoMKgIHByb3BlcnRpZXM6
Cj4gPiArwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZToKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAg
Y29udGFpbnM6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtOgo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1hcG0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtIGdvb2dsZSxnczEwMS1jbXUtbWlzYwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0gZ29vZ2xlLGdzMTAxLWhzaTAKPiAKPiBTaG91bGRuJ3QgdGhpcyBi
ZSBnb29nbGUsZ3MxMDEtY211LWhzaTA/Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLSBnb29nbGUsZ3MxMDEtY211LWhzaTIKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAtIGdvb2dsZSxnczEwMS1jbXUtcGVyaWMwCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLSBnb29nbGUsZ3MxMDEtY211LXBlcmljMQo+ID4gKwo+ID4gK8KgwqDCoCB0aGVuOgo+ID4g
K8KgwqDCoMKgwqAgcmVxdWlyZWQ6Cj4gPiArwqDCoMKgwqDCoMKgwqAgLSBzYW1zdW5nLHN5c3Jl
Zwo+IAo+IFRoZSBhYm92ZSBzdGlsbCBhbGxvd3MgKGJ1dCBkb2Vzbid0IGVuZm9yY2UpIHNhbXN1
bmcsc3lzcmVnIG9uIGNtdS10b3AuCj4gCj4gTWF5YmUgaXQnZCBiZSBiZXR0ZXIgdG8gaW52ZXJ0
IHRoZSB0ZXN0LCBhcyBjbXUtdG9wIGlzIHRoZSBvbmx5Cj4gb3V0bGllciwgYW5kIHRoZW4gdGhl
IGJpbmRpbmcgZG9lc24ndCBuZWVkIHRvIGJlIHVwZGF0ZWQgd2hlbiBtb3JlCj4gQ01VcyBhcmUg
YWRkZWQgKHVudGVzdGVkKToKPiAKPiDCoCAtIGlmOgo+IMKgwqDCoMKgwqAgcHJvcGVydGllczoK
PiDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+IMKgwqDCoMKgwqDCoMKgwqDCoCBjb250YWlu
czoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0OiBnb29nbGUsZ3MxMDEtY211LXRvcAo+
IAo+IMKgwqDCoCB0aGVuOgo+IMKgwqDCoMKgwqAgcmVxdWlyZWQ6Cj4gwqDCoMKgwqDCoMKgwqAg
LSBzYW1zdW5nLHN5c3JlZwo+IAo+IMKgwqDCoCBlbHNlOgo+IMKgwqDCoMKgwqAgcHJvcGVydGll
czoKPiDCoMKgwqDCoMKgwqDCoCBzYW1zdW5nLHN5c3JlZzogZmFsc2UKCm9idmlvdXNseSB0aGVu
OiBhbmQgZWxzZTogY2FzZXMgc2hvdWxkIGJlIHN3YXBwZWQuCgpBLgo=


