Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6FC10F9940
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 14:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxH0oCbGTr6B8Wm+BS8m8qhdCPE3WP5aAsJAIX7L2eQ=; b=rcELkffn+dMt6Q/uta/J2gaAt9
	PMJYd6t/uLvhx1xACDkDneiZzI5utXaLQnK7tqMQdnywIBkcm7x9zIiLGdHPCyTJqGYVRON+th+U5
	eG8wtAv5TsnP8rvq8G2gHdJ2lARSVBJrFyeLVS5bUApOCuXUYWcJ4dBJvGVGT8hnVaINWrx1W6Phn
	/X+oVOAe1vvVuPAeExL49gcKFkW8O2ITx7zEF2jd0Ajthvx+PEX1cHLxbabLRUDySYII4A69xqe9D
	i7b7mOWm1Fi9aUPtzQxoV2H8doUtRuqHeYA0EfT691RKK8jnq0kWuyWVA1ybbmCsi85t7Q/A+vDDf
	A9lqhanA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATvq-00000008zvb-1SKn;
	Wed, 08 Apr 2026 14:31:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATvo-00000008zvF-2KeS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 14:31:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so29156775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 07:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775658658; x=1776263458; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxH0oCbGTr6B8Wm+BS8m8qhdCPE3WP5aAsJAIX7L2eQ=;
        b=wkac37olDKSEC026vzmeimG37s7EPLEHOoXXzbHJ83fNm037pk7HWobA8yhlSnNlyE
         Uw05lAcbWumTuH42scXLMbppPLyNyF6eEp7AoLyIskvMNhBHVH0f4T6Y38TgBoSXU//F
         S+1PGJUcPZwpv+4xbUBFVqfvw3ksLNJ400Et9/MSxnMHhw1zunm0D9Xb+hiYQVQC4ng1
         qcXMURQDDpWzoO3jzhjHRiis4VbBBwZaS/t+Myn+x18OHCwG1widY+/rVbQ1QO3XDNQQ
         U56xAVWdyD2XVjXqi95oikS5spBm44h1WaTl/bHyYaYCVdtEtcBeMWQKBJpqCRNe3imR
         n6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775658658; x=1776263458;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CxH0oCbGTr6B8Wm+BS8m8qhdCPE3WP5aAsJAIX7L2eQ=;
        b=PB53EtVvPoUn8gn+jR5i4ZmHYLlBQS16zc3dDP5eUwLZodS9+zsOa3YSO1hZ81kRYE
         6tFTY5mJAeGnfRV8dsgNFRYQ7sR2u8pHNd9n+ExN/H6EpeWoy92P38Y59r6Z6/IDiWEf
         1RlX3l/VZWfdd5FlXEag684m7KoA1qlC+qwx9JxnvGQxGTQHwE16cPcwz9JSNyIiJvBd
         hIfpoLn/BKp4Kh5YeH0XPVqzqj6drAw4XSZIkYzN1P+8do0qeFitlRgSa3ZdfDvalScN
         l4ID7SAU1qV+4gQrPwskljlKGPiEBIseIy4tJjsUpmRGALGqs8R+F9PEhFO0CL/otp68
         nn0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVo+2i7M2jhHZEeY04Iz4PPN2SV9c44btErqrJFtoKRoxgEh4+el52rK5rMqL3a51XB299fqTLbax9xw55fVpbM@lists.infradead.org
X-Gm-Message-State: AOJu0YybHnnLvzq99FuOdLvKNehIYRRwAE9xePMfZBXqsud067/L6EAF
	U8WvwQS4FLWljQmfLgRNB1PsN1Rc1Jp+LeG1SJxwtau4cibZZgyHm3zJUo6yJA7oiR4=
X-Gm-Gg: AeBDieuSQHPNNX6/xDBz+9QCD2zQcHZK19/9S+uejurSYGczH5YpTfYuS7r9q8eE+E9
	RG7p+fU4EZcCLlOI54zUbwVgDXKuKmzjdx31Frd7HcQmdBCZh6+fSAaDuPaBgEbc0O2G+NNQnaH
	xfH64pmni/a4BKZY+MNbVis6l31A/NehmYQzG4FMn+iU/taoLGGfxpoCG7gMGowjlQsa1o5u5Ow
	4qNR8OI1s5h3J4By95X7FmYLtfVQL2JgEndzy0FPo+zMqSY26YC1+bUKfIQVk4L6Z73LkyrSIgv
	wXqaAPNqK21dxnPKb/01dp1pilAZiIb3/GAq+3+Rjp9ZvYm/dFMLu7t/sJh3JJYWp4ou+8c3EWX
	f1EvqjOw1dWVFETJFI+HpJL9iXblfneozqVd1ll5e7+5FF6d2f+hnuMYz4Fp8vhoMCuXkcvBCU4
	A4svsP7mSnaL+UF23IB7wMUn4T5wrL4TfTxuYjNBEhNBIG5IB7IRy4E8mbjquwxkBYtyc4xZlyU
	zvNsNRWjPZ5+mhWqg==
X-Received: by 2002:a05:600c:8710:b0:485:5ba3:37d8 with SMTP id 5b1f17b1804b1-488996b0589mr341915565e9.5.1775658658541;
        Wed, 08 Apr 2026 07:30:58 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9775:58c0:569c:bd74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e56fesm56397818f8f.27.2026.04.08.07.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 07:30:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 15:30:56 +0100
Message-Id: <DHNUGLJYPTUR.BTHWV3J1RRVT@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Sam
 Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
X-Mailer: aerc 0.20.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
 <01ffe5d3aca040edcedb084386ab6e195cb93013.camel@linaro.org>
In-Reply-To: <01ffe5d3aca040edcedb084386ab6e195cb93013.camel@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_073100_633115_62464A7F 
X-CRM114-Status: GOOD (  14.04  )
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

Hi Andr=C3=A9,

On Fri Apr 3, 2026 at 11:17 AM BST, Andr=C3=A9 Draszik wrote:
> Hi Alexey,
>
> On Wed, 2026-04-01 at 05:51 +0100, Alexey Klimov wrote:
>> Some Exynos-based SoCs, for instance Exynos850, require access
>> to the pmu interrupt generation register region which is exposed
>> as a syscon. Update the exynos-pmu bindings documentation to
>> reflect this.
>
> You could mention that this is similar to the existing google,...
> one due to same requirement, hence a new and more general property.

Ok. Thanks.

>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>> =C2=A0.../devicetree/bindings/soc/samsung/exynos-pmu.yaml=C2=A0=C2=A0=C2=
=A0 | 18 ++++++++++++++++++
>> =C2=A01 file changed, 18 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.ya=
ml b/Documentation/devicetree/bindings/soc/samsung/exynos-
>> pmu.yaml
>> index 76ce7e98c10f..92acdfd5d44e 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> @@ -110,6 +110,11 @@ properties:
>> =C2=A0=C2=A0=C2=A0=C2=A0 description:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Node for reboot method
>> =C2=A0
>> +=C2=A0 samsung,pmu-intr-gen-syscon:
>> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
>> +=C2=A0=C2=A0=C2=A0 description:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Phandle to PMU interrupt generation inte=
rface.
>> +
>> =C2=A0=C2=A0 google,pmu-intr-gen-syscon:
>
> Please keep alphabetical order of vendors.

Sure. Thanks for noticing this.

Best regards,
Alexey

