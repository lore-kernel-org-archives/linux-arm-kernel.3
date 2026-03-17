Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD86DFD8770
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4FQFwct641zr80eIr2ZHYhiIx/XAziYXoGFH19ywqk=; b=06he7gNGXUKD4nDFdZaIUgAjiI
	bGRwd7yWmLALkEUGgu8jettJp26mamOkAnXio1cs7eu25gu3OtxFu8ifjIqs1VAkc7gUwlwNRWCQ1
	160Ojqb8SEz99wIx+drpOYyKxYoKxFEQte5ATL6ctKRLYMe+BTNBHI1AIB5gfbtOusXYBq9608m1e
	QEv7aCZXOaDu6B3Jxjbo3mAM4Q/UfKxK6L5VnPff7SV3itGgxbdv+EGUkERQ1AB0qsIFuRkZ6ahT4
	AMRZCC7OKp0askSq3FQe+QTSNsi/HB7o3isbABxFDKY0Qkgf60g1QCnS9bUvVAVaspBeJSBkcTeRq
	GNG6dY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V5E-00000006WH3-2M13;
	Tue, 17 Mar 2026 14:07:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V5B-00000006WGT-2quH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:07:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso51443885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773756459; x=1774361259; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4FQFwct641zr80eIr2ZHYhiIx/XAziYXoGFH19ywqk=;
        b=ZHt3/DU7zAgy2uH0f2djROoX4uQgM8BLauUr9gh6m61hK+OoEav0A+C813dHzcp0Pt
         7pOKBmeadLknfYYRWs3C4kUl9Nae62gWj3nIWr6UaSRh3lpYLSv+uSpAFqqdJfZ9WiZP
         DIiVNEWGrL25PgWIwQkGg9B5i4i+gUEHhVIBvWK9KRUeTM53hMkqfs6tDto0sQ216V9M
         V3DpO+nwuLY7RxVm6jW3v4t+C3t4TkjD+k5eoAzn86vn8GBQa0ztbS8BlSKlGrwAPJro
         wmQp4KfRMSjrdlJyx/75fajv7T3MYGwkr0vH5Gthid93nn4MXojw0KGIdgWoAhEcrQ5z
         KICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756459; x=1774361259;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N4FQFwct641zr80eIr2ZHYhiIx/XAziYXoGFH19ywqk=;
        b=sHXOYLrQ8MRmimiwK9atEFRGLkyeCA79HzMj+01ZIoarswylvgc0n+Ml6ITLvL35Sa
         LwrECzeX0GfyUlSxBngtE6C8T3E3SkhMpmAuPloslSe+n788tz3rdBobjB5RA+TAlzXk
         zSagr8XwFZeJdvvb5OvKTHNTKXsBxX3wwvkq5PPVRKAJbdh3uiNM2PAXmdekpf9jtVCB
         JhFR60OpTGEJq6mS4q54RZUVRcJKO6RbYBhJ1uyEaytdtXysLCKd+9xpImuoce8NdgNG
         0S9pvAdBMmcdmKtv6KkdUR8m9SjueJU4JrLaqd/3gaLkE8gy1mzBzc/NIRlC5mHsPxxI
         JTMg==
X-Forwarded-Encrypted: i=1; AJvYcCWsZQ8Yc2jfI732QNw3Yx1jEZEIFaaGlCUZhYv7Ppn+iVYVlvveHaqReZp1pFgXWpNC5p/6oo+iSwSUvRm8ZQvz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjz88YHOgqUuPEwP6H4QKr80F68wOwjYPqzRpo25tyuO1hSLiR
	uxDahLxqQ2xx+i+z2KAVtfUX+EOZUKljiXuezLm3RtirMejjxmC11MA4rmpC6z+isQeL5ybGf/v
	8aiV/OAU=
X-Gm-Gg: ATEYQzzXrIgmkjr8ZYOHAEzsXpjupPf73PY8m59yyHbtTRIiRHlMu7CP2xPfpUFWtqV
	8tT0XDCOXgIUDl/iMMMfi/UbxIG+rascxD4qdiVSCdwLMfTjbmnIrb0zO92SKFpdi5FTcemhzlK
	bxk0hIioGfcUzvqUyG+uipn1MOggihtphBaPSa6ZWD3x3tS4v0hTuYra22Y8VFyyt7JacTWnk0m
	p0RLu9gR2kvgVrAKpdBdR7SS5WyNKGATjwgLNXgu9zWhAJhVZpr/QwnTInZwQaoNMIXQWFAXvBD
	V57tsgAg2jcqGP2cUgmagDkaliDfSoRSGN36e99z6NIh2+refjeZWJ3ZknaXBVGtpagq/YW3ybA
	LRt08gFW33xM9jt68j6jpEOQqzykHra8QedHliXQMYvvuXqnHLD2A6tHE8FONBSeXNLgyljzzU/
	dujbtLcTCGqji1sLdSPBkWS4dI0ww3AWOdkrVd7QQ3KSeYaRHC1qJ/uE/hgqBwoRrYp7KypPhgF
	k/L/sZkOAEtIpWUCQ==
X-Received: by 2002:a05:600c:1913:b0:483:6a8d:b2f9 with SMTP id 5b1f17b1804b1-485566e2d50mr291282515e9.5.1773756459032;
        Tue, 17 Mar 2026 07:07:39 -0700 (PDT)
Received: from localhost ([2a02:c7c:5e34:8000:df24:76aa:fdca:2fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fb0dsm125024095e9.3.2026.03.17.07.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:07:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 14:07:37 +0000
Message-Id: <DH546REC2G49.2YNUL3SWK4QNB@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 8/8] arm64: dts: exynos850: add PMU interrupt
 generation node
X-Mailer: aerc 0.21.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
 <20260226-exynos850-cpuhotplug-v1-8-71d7c4063382@linaro.org>
 <CADrjBPrC43gaRZw8289a15PLBN8ideWvO9jJwPr5beRJ=x4Rbw@mail.gmail.com>
In-Reply-To: <CADrjBPrC43gaRZw8289a15PLBN8ideWvO9jJwPr5beRJ=x4Rbw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_070741_741833_0B431BD1 
X-CRM114-Status: GOOD (  13.78  )
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

Hi Peter,

On Fri Mar 6, 2026 at 1:44 PM GMT, Peter Griffin wrote:
> Hi Alexey,
>
> On Thu, 26 Feb 2026 at 15:47, Alexey Klimov <alexey.klimov@linaro.org> wr=
ote:
>>
>> Add pmu_intr_gen node for Exynos850. This hw block is required
>> for different power management routines like CPU hotplug and
>> different sleep and idle states.
>> Also reference this node from main PMU node.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index cb55015c8dce..e3f4fe6ee118 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -211,9 +211,15 @@ gic: interrupt-controller@12a01000 {
>>                                                  IRQ_TYPE_LEVEL_HIGH)>;
>>                 };
>>
>> +               pmu_intr_gen: syscon@11870000 {
>> +                       compatible =3D "samsung,exynos850-pmu-intr-gen",=
 "syscon";
>> +                       reg =3D <0x11870000 0x10000>;
>> +               };
>
> This should be ordered by unit address (so in this case placed after
> the pmu_system_controller node). Refer to
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Thanks, I'll update it.

Best regards,
Alexey

