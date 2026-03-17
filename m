Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3D6FD8770
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtjYw7NIr5M9DO4GZFC2fJ8GnFCnCjLLvq9mVI1210Q=; b=bTOY8dvedo87a9WgJmCGw8IUP8
	D2Zci7N5v43nZhv56401o9pVR+nLzBDOdx9nci7bcccoUoecwokED8Hp3liptilecEVcjlpXl2i+F
	CcZrxkrAVnzm473VPfxglogJvJi0vNNizRjMcXajXRgd8NhVcI0Cc3YUBA8Vx0dwKokDRVtbcpVv0
	DbjgOcxixLU/SoR5WKOLNAoAdPa7l0D9PSOOtk+6HSZb1pnR1vHdTRaa7nK+OPfqCu7512IsERnSm
	555adf5UWquy+lvsMNaUTcvMVAM/w5kHGE+36nbKovreUhBzPgOo2DhszLLMahV4LZcQqxzQh9d1s
	SpO2dYJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V8w-00000006Wrd-3FBw;
	Tue, 17 Mar 2026 14:11:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V8t-00000006Wpr-370a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:11:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-486b9675d36so5143605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773756690; x=1774361490; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtjYw7NIr5M9DO4GZFC2fJ8GnFCnCjLLvq9mVI1210Q=;
        b=GlnkxbsTKyTl44i5nZWLnqqFM9JekJHwTcm7XEP3U41Bh0bpYk5aBouZC6DewYjCf+
         CFHJUAPgOInrypoC7Fqm1KDfnjyH9YY6YxEkeZ7tJlQREq6EC1SIL6FaSSURFNke1Pjt
         UGZm9k7xNEWiyWzl4dwEMxxOPhYEne24BpyqrsGsYD+UJMsxvnuCahE+HqoXu7B6Z0NO
         Q0crPGmtAiRqVo3MJ1UZv8pWkk/YwQHy0bhtlDSVLn/bERrDqaZdEN5WIR6MfDnGYAVg
         +X+wNR5cOl+8v3a+SppE95X8LYG1Pjj4yyc6+VFKRViNZLw8y4nRWP87ado8to49kKqj
         lNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756690; x=1774361490;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mtjYw7NIr5M9DO4GZFC2fJ8GnFCnCjLLvq9mVI1210Q=;
        b=fSh+hmnnSGeKqcdDwutP3hsAEhMVgoSic8MrnrpHGRsIYwHXAbGgUXRXn0BCmYFo4A
         g7uUWmYKAiDUAZC7SnNIkIeY2VPvYDjo220EO2iI74cSTNMau+SajF+2c6rY5HczOwi6
         SsPyg1/2YaLxkvlU61XEEb8h2SLCfP8jpqOAWcLFmIbGrdaCRb0YYKEpCuDdH1wCbXks
         tzfSGG+ZXzRPfKCDRrAcQg4CgkN83Eh2EcXlRja9cuSuTjjByrQ+qrGUZ+h6vh6h6bMC
         k0G4oG5Fx8Llhpl5IwYWC0/AKL876nVGi0rIbeA8R0fXVGFBynqA8vSyA0ZfPbtxBX6S
         zMPA==
X-Forwarded-Encrypted: i=1; AJvYcCVJuIEPV4E7eTP3mNbvse12fVfV/1fEbdqMdQrcnvVH7oQLwBYsMJ64K49DPBhWZncRu/Y8UnNMEwiNo6RMbfrQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyNj+mz9m6kUUYzflg6Q9f92WrBw9nWeaPcNSbhnrs1Gvflojo1
	zH8waj9Ku+UTH/WESytdV3yS7Jc1PI7mHKm2cYhREnLMzD1aTsfTasqK91ZqQ0AO6r8=
X-Gm-Gg: ATEYQzwxf8BoZiWXJOuZWzBEVkYZrnVYncaeBSWEItRqwBr04HHi05cf3e1xonJ0yQP
	8mxXlHDHIYJzEA4CfQJCRrjKbO6SWX8RjQOkkSK1xrP7L872+4x0hNT5dAcgRd72UTsb7hwhhy2
	9/31mYSSA8933eTHAduMMYBRjVlAnFDyoDK24acSqMlXrjw55p2E2VW60Snn8tF2sUvqNHE9Lor
	SXamDtUq+1WelhwndSPuE1jh0c8lTmOS1IWtw0adJzgOmQus2hRodMQ6gov8UngNTtkxKO3Rf41
	wdXOTyuyVeL0mRQJaUM+MNgpTwonuYzV2z2EkCqzeGDqNS5qh30lG1/XyA4QIvzJTqy/TfIXqSV
	QBVqz5IPbirmkodiWTykZQzBGXdg2JTynr9sXT/FPHQIecaUdNSor2PcjLHSAMRi+/k3zD7vlwT
	Pc54swNT4A+yOp7JGnanyC5m4lnwqI35aHXRxOdLiei7MtkK1u4xVT1/OkFVtbbpmt4YA8Zi1hW
	Nl4AnHIJ7j3Dw453Q==
X-Received: by 2002:a05:600c:4514:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-48556709e21mr271873225e9.29.1773756689493;
        Tue, 17 Mar 2026 07:11:29 -0700 (PDT)
Received: from localhost ([2a02:c7c:5e34:8000:df24:76aa:fdca:2fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485563903bbsm194524525e9.0.2026.03.17.07.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:11:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 14:11:27 +0000
Message-Id: <DH549OXPHXQA.265AMHWFSNK5C@linaro.org>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 7/8] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
 <20260226-exynos850-cpuhotplug-v1-7-71d7c4063382@linaro.org>
 <CADrjBPoLCDnvWocLYrg-zGRZNcBvPVYnUi4L7DA78m7QmkmQdQ@mail.gmail.com>
In-Reply-To: <CADrjBPoLCDnvWocLYrg-zGRZNcBvPVYnUi4L7DA78m7QmkmQdQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_071131_801084_85BF7C18 
X-CRM114-Status: GOOD (  21.60  )
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

On Fri Mar 6, 2026 at 2:15 PM GMT, Peter Griffin wrote:
> On Thu, 26 Feb 2026 at 15:47, Alexey Klimov <alexey.klimov@linaro.org> wr=
ote:
>>
>> Some Exynos-based SoCs require specific set of writes/updates to PMU
>> and PMU intr gen blocks in order to put a CPU or a group of CPUs into
>> a different sleep states or prepare these entities for a CPU_OFF.
>> The same is valid for a reverse procedures like wake-ups or CPU(s)
>> online. Without these writes/updates the CPU(s) wake-up or online
>> fails.
>> Add support for Exynos850-based SoCs for PMU and PMU intr gen write/upda=
te
>> sequences.
>> While at this, also add description of Exynos850 PMU registers.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  drivers/soc/samsung/exynos-pmu.c            | 86 ++++++++++++++++++++++=
+++++--
>>  include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
>>  2 files changed, 87 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exyn=
os-pmu.c
>> index 0967fa56708a..7b9b8e22d91b 100644
>> --- a/drivers/soc/samsung/exynos-pmu.c
>> +++ b/drivers/soc/samsung/exynos-pmu.c
>> @@ -118,6 +118,10 @@ static const struct regmap_config regmap_pmu_intr =
=3D {
>>         .use_raw_spinlock =3D true,
>>  };
>>
>> +const struct exynos_pmu_data exynos850_pmu_data =3D {
>> +       .pmu_cpuhp =3D true,
>> +};
>> +
>
> You may want to consider having an e850-pmu.c file to contain the e850
> specific data and hooks.
>
> Andre recently moved some of the gs101-specific parts into gs101-pmu.c
> (although not the actual gs101 online/offline hooks). Now that more
> SoCs are being added it could be a good time for exynos-pmu to contain
> only the generic code and the <soc>-pmu.c file having the
> peculiarities/hooks for the specific SoC.

Thanks. Yeah. That's why it was sent as an RFC to get pointers where
to place things properly. I'll update it.

[..]

>> -       pmu_context->cpu_pmu_online =3D __gs101_cpu_pmu_online;
>> -       pmu_context->cpu_pmu_offline =3D __gs101_cpu_pmu_offline;
>> +       if (of_machine_is_compatible("google,gs101")) {
>> +               pmu_context->cpu_pmu_online =3D __gs101_cpu_pmu_online;
>> +               pmu_context->cpu_pmu_offline =3D __gs101_cpu_pmu_offline=
;
>> +       }
>> +
>> +       if (of_machine_is_compatible("samsung,exynos850")) {
>> +               pmu_context->cpu_pmu_online =3D __exynos850_cpu_pmu_onli=
ne;
>> +               pmu_context->cpu_pmu_offline =3D __exynos850_cpu_pmu_off=
line;
>>
>
> There should be no compatibles inside probe (that rule applies to all
> drivers & subsystems). Instead use the driver match data
> (exynos_pmu_data).

Thanks. Yep, I'll update it.

BR,
Alexey

