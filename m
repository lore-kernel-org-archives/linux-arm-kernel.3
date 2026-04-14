Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D67F9D0D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAo7ya1UV+iUteVyqPUr+hg05LINCS2Wr9p6hmA+q2Q=; b=Y9B0/YOrYXfUMUf7RR4mbx/y3S
	HAfSVy6sj+Lxtc1aqeXslrQLZcYvlSmEplVUCgGRcgSOWNoPlBJQHpGy/lqAcO+Hth6m5Yn4O0+5w
	qnbRNj6Or4AcBZg9mSW7GKiUi4vGFVLQKb21NXizvgwWVJmVwUtcnZGONPtpIUKUk3GGpk95ZTkiq
	aog25SZ6WKC4JzJzyczO/07gmfL/BDdjCry4ARis7njKnEAEzThtsLaLwduu0DKY9xkrMdN76Lr2z
	2pKNryrQYmw52RcbrR2ijk1F80g6VlUI6Yvctafpl8dGPseOsf9Wuu6nn5oiHsxkBbDK3SvEV4wVF
	xfy+15Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCfA3-0000000HU2Y-328I;
	Tue, 14 Apr 2026 14:54:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCfA1-0000000HU1o-0kC9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 14:54:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so89701545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 07:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776178479; x=1776783279; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAo7ya1UV+iUteVyqPUr+hg05LINCS2Wr9p6hmA+q2Q=;
        b=QbmQZqiLqnwzU83Mx5kC6UEPKE45kDt2KTJ6/HVqMsC7isaCldDgE8AlecGFVBDew+
         rmT3jSkW9K0f63c33jRlhP65nq3Sp10f5une9Am6xphRIEtMTzQoqMpoVj6gAsQOE2hz
         VpQLTUQwKTK2/ZtZMACE+uSVg4sDdlQMK6mb52skku2aCcAM8CFJUpLHuYqI4OkRxogp
         PzCleI/I0WpXhB01SgPdpFxnrY+SuZiThgV9BzUorFsVIzQ2vroGtGt4mabl/4IBT/L0
         aLjwBKCIIyLypcg8BJ0OBE0BgcVhXaRjft4h1kZKX/ncXJDy/bd1jmrCZUEwCjeaDHkS
         5jEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178479; x=1776783279;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PAo7ya1UV+iUteVyqPUr+hg05LINCS2Wr9p6hmA+q2Q=;
        b=JscFbPun9QDm9zNzPL1VAQ25hKAukCQsgBY7+p1PMlPlKnK14KcPW0QSofZ2615rm5
         ZzMCJnJfx93Fu/aAo37IZ2QTH8JcKhdKcjN7baLmhaQMHVBAgltuvaE3eI+GrKGF95TO
         8T3Tyk+5rgD8a6n69POMMjYMC/enjFlkIf2aqfz8FugRstqCL2iJDiyBM9t40Mqodk0M
         jMCR/5IXFUO9iXNtw108peV5xv7ZuV0SmXJVMYyhZwA5ofvKBFlC/v0yVEnqx9sW8zdg
         DosoHqdsbSY+tfJg14BeGcs6LD91D33zVQrkHz4PWd0cONjwvrAlvxrbzlcr9+C4XKQS
         pnAw==
X-Forwarded-Encrypted: i=1; AFNElJ+k1blrldZKzHdRMnLBYX3NBMUGleiJ/0RxKNTCYNNJV24wlgEFgPCVELMrSXIpZPyYp7UF+7rrheXBHAPZe3Fb@lists.infradead.org
X-Gm-Message-State: AOJu0YxVqECRV+zrwOXgtnw6hrjIdG8F5345KCuxMz+PAaGLafQZFx5n
	480T16cdMV0RFB6sxth59UkHMROf+r4IA9cAkWFc+jVHLu40R0hy0Jl4lmAg4VCbltg=
X-Gm-Gg: AeBDievJO0SpRJV5IaPm+xCRxpmBYSwuVzU3AZSdC05/57KtrZa9YbouBhLmB0jyQoa
	YGcjvkMCzm+xx4fCpN1egTwB7TMc1Kb0Eq/FWXpDGtVKRd/BIKL+2blhruAoM/kQrde6Fkqql+Q
	cHFP6/Rktlk+EQlzmd8I1aZE8owTQMWKIXoYIugMO/1Y8H6lBqu//oB0fEUsyNnBDmclpYCIcTF
	Sdj2Rbl0tPXIJ9vbMkwr6jmd9ZklRVO6eR65PsuqooSCIB6AcaSUXhOB5Xjjr1zu/1mST5F9PU3
	H390wGcYQzDLGcLrHcTq8wf5KY/9DYWelUtOsswDejj+rCFANbeodDYOc0t2Es879ESX6WIKgM1
	c7XmlwcXoYgGz3JS5eHulSDl/NHYxfGZJZr8JK28Du2GhcMj5qa6wLvXliWXUNV5Xus8DI1uNP+
	Mnm64Gn1Q2RAQ6+MD+nnlz+pUFkpqhpCEJ8pj2NpH8ivDoRBHxEGEzHAVrHUzV9Ez3lFdkNlZIF
	fxy+FgGdub94/HWXA==
X-Received: by 2002:a05:600c:1391:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488d67e6a48mr259531285e9.9.1776178478697;
        Tue, 14 Apr 2026 07:54:38 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73e36e7csm22002840f8f.10.2026.04.14.07.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:54:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 15:54:37 +0100
Message-Id: <DHSYQ027GZGC.4I9F6TPPMBI5@linaro.org>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
 <20260413221638.GA3624532-robh@kernel.org>
In-Reply-To: <20260413221638.GA3624532-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_075441_254460_A230AF11 
X-CRM114-Status: GOOD (  18.17  )
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

On Mon Apr 13, 2026 at 11:16 PM BST, Rob Herring wrote:
> On Wed, Apr 01, 2026 at 05:51:55AM +0100, Alexey Klimov wrote:
>> Some Exynos-based SoCs, for instance Exynos850, require access
>> to the pmu interrupt generation register region which is exposed
>> as a syscon. Update the exynos-pmu bindings documentation to
>> reflect this.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml    | 18 +++++++++++=
+++++++
>>  1 file changed, 18 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.ya=
ml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> index 76ce7e98c10f..92acdfd5d44e 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> @@ -110,6 +110,11 @@ properties:
>>      description:
>>        Node for reboot method
>> =20
>> +  samsung,pmu-intr-gen-syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to PMU interrupt generation interface.
>> +
>>    google,pmu-intr-gen-syscon:
>
> Does this mean the driver is just going to have to look at both=20
> properties for the same thing? If so, just use the existing property. We=
=20
> don't need 2. Yeah, 'google' in Samsung SoCs is a bit weird, but that's=
=20
> Samsung's fault for not upstreaming support for their h/w first.

First question - yes, look for both properties. Using the existing
property is even better, I don't mind at all. Thanks for pointing that
out.

Initially, I added more generic samsung,... property because I thought
that device tree style prefers <vendor>,<property-name> semantics where
<vendor> is actual (real) HW vendor of corresponding hw block and it
should also refer to the first/earlier hw vendor in terms of the
timeline.

Using google,<..> is simplier and I don't need need commit that
obsoletes that, so I'll rework the series in that way.

BR,
Alexey


