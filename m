Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45D9F483C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tw1CKAGR78adc6SIaonWynMm4T02YyIsxi3rErXI5qo=; b=xAb/0VwZRNCoXmUb4OqvlU0yQ+
	/yDtO1Z7s/Xq5isCNobW96+L+j0aEXM1Dn//Qhmk8GP0kAKkEN4OhuF/g9iqR/qra483/hAEUivG2
	TeE9Ms1RpKghJZfKxjy0hJRnyjydOpaI25pHSfCvS6dKY2IhC7R72G62DZBA71rh1OHq50vsgu6P3
	82yRuIViqdhXERiC2lVFft3dWCtFKky3ikWqVqy1Xk5YXup3LYyOoN5HfMW7C5GDF72MBsUtgayzN
	CLDgQevHiFblVBj6XsXWAJ7el+xFUk2WQSlaAqpmskoqwnIcw74ixe+Efc6QFXOWOCYIlCI6Newpp
	dch3Haig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iDe-0000000H9DV-3tgI;
	Mon, 23 Mar 2026 16:33:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iDc-0000000H9D7-126R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:33:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-486fb112c09so27363975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774283610; x=1774888410; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw1CKAGR78adc6SIaonWynMm4T02YyIsxi3rErXI5qo=;
        b=sWdDYk0TS+/BVzB5Qu8pvXl+HmNG+Bbu5o9hNDhGGV+cL6Iz+9NBpUywoXwruf6tNj
         2gBpm5mGknnl56t6tHvdlf1IrOeeT4bgxL+QaUVvpLhpbL6H17cfD/oRY4TL3LSdsVaB
         BpuHLOw4W1av6A5UqOraClokcSM3iquT0frUqHqKo/6lbLHcuKK/Ud0ewSfMb7B9Ddi/
         z4FDLTGSYayNxlkpFtmhCwB2PblFPUKaq1nrX8OUwVEUzy7/YEjHmv9zhlRDpzTQ4c+3
         YP9rBK+tOdwOdIlj70nXw+prW7i1aAy0lhvE42kUvEfpIcQWl9N7i4ouTwynBlnG4cUR
         qpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283610; x=1774888410;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tw1CKAGR78adc6SIaonWynMm4T02YyIsxi3rErXI5qo=;
        b=Z2X8zYbEj0R95cFesS6uQbSiG8BkYppqgR03xCR5BxOL1l22t/LPI+MhD3DDj6k9Hq
         7Nr24XVOJIOE+kwd3kPPsqSprupxnB43Kw+MkD59PAWhG2/UE++RjSPKjrncA3bMNTqA
         XmJeGVDRR6tytltYl7MuNkO1Ed5rf++zBlpIdTDN1Wa/T7UJLDPuLibNMLDhG9KK7O5c
         RmaG5Lugi0EJEW6HQZnNvVBSD8blrLSdW8xmZ6DO1/Ga7cPpdZtKzwD/TmHvEmUKkZ+2
         jB7nuv0asXmI5GVxIaSs+wJ0jZPbqnWG/fnUTrc033BtZdggIzbN7V7IWm4e5H+YLwAO
         NmMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG2NQFBPYG7j4q5L9MBK1UWSI2CMIE7izIXBB825Btqgm9TlLT4IIwtPtBaWHGvDddzdco0c5ozcAg+1IEDfQx@lists.infradead.org
X-Gm-Message-State: AOJu0YyRfvyN6Xm0m4M2CeM4refmE1pJzTfPhd1hpEqGFniZRAodYwcx
	Pa1oa3NSvCPKtMHnH2phPnc8abNpPotiV1KaBWlANEKN/rP0g8XevJ39T/NbxyXRlUs=
X-Gm-Gg: ATEYQzzMZ3MN0GukmUYYAnX6slPp85D8k/bzoTxweWFcxgGJsJCKdX0rjZMvCIDQRut
	9cXvMSpZ4+hwcw6B2qnGXavAJC3l1yGFY9HVSyLRHORCVq6CSkmQe68J4s83nJ+A9JeK5Ov4FWY
	H/1HRtkmxM7x9RR0Y2mXiejNcZZ+aKB3fd7LHhnztQmC1tEpAw5QpFF9hyIJTwPzHkoGqtfN0Lg
	CpB0gOBSV7QQdesno/8icmWlPTWZDMLF3zaVNunygoWDPXMMd0qKMbDOPh0/59tUygHyAgqAzim
	+Nh1Yq97IBZSPoXnVy6r3dTGNyOaHBq7CfKvZ1PPrWu1IftaqA24hYzkY5ZpND9StbZBOIbbQ5X
	lbJdvf9slc9jXg4a3CE5eWRSIAJd755W6Pejnghpe+j4H2nZTmVtU4yBODr9gEevRKdzwgmGb2Q
	ogBy4bapeZcX2fFrmQ37WO1sv1RUrM7rEZW1ZxL5BNio1Ntc6Ca7WRZfQTAjYn4RZrYbmCpRtFG
	Ppx8iBLCii3
X-Received: by 2002:a05:600c:4714:b0:485:3bc7:a231 with SMTP id 5b1f17b1804b1-486ff01f1d0mr187337805e9.29.1774283610196;
        Mon, 23 Mar 2026 09:33:30 -0700 (PDT)
Received: from localhost ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8ba4baesm564276095e9.13.2026.03.23.09.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 09:33:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 16:33:28 +0000
Message-Id: <DHAB1PA67E94.241OXUFJG1GSK@linaro.org>
Subject: Re: [PATCH RFC 1/8] dt-bindings: soc: move and rename
 google,gs101-pmu-intr-gen schema under soc/samsung/
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
 <20260226-exynos850-cpuhotplug-v1-1-71d7c4063382@linaro.org>
 <b02f06e1-dac7-4521-bf5e-471b5575467d@kernel.org>
 <DHA9YL83GF3E.VOMD4KV10NLW@linaro.org>
 <7831dd9f-3e7c-4016-8d84-fe1fa82bdf9d@kernel.org>
In-Reply-To: <7831dd9f-3e7c-4016-8d84-fe1fa82bdf9d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_093332_305651_2BF46741 
X-CRM114-Status: GOOD (  14.88  )
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

On Mon Mar 23, 2026 at 4:03 PM GMT, Krzysztof Kozlowski wrote:
> On 23/03/2026 16:42, Alexey Klimov wrote:
>> On Sat Mar 7, 2026 at 5:03 PM GMT, Krzysztof Kozlowski wrote:
>>> On 26/02/2026 16:47, Alexey Klimov wrote:
>>>> The GS101 PMU interrupts generation block is actually a standard Samsu=
ng
>>>> Exynos IP block found in older SoCs like the Exynos 850 and others and
>>>> not exclusive to Google SoCs. Thus, renaming to
>>>> samsung,exynos850-pmu-intr-gen, moving the schema file to soc/samsung
>>>> directory to reflect its origin, since Exynos850 predates GS101 SoCs,
>>>> and preparing for adding Exynos850 description.
>>>>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  .../samsung,exynos850-pmu-intr-gen.yaml}                             =
 | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101=
-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,=
exynos850-pmu-intr-gen.yaml
>>>> similarity index 80%
>>>> rename from Documentation/devicetree/bindings/soc/google/google,gs101-=
pmu-intr-gen.yaml
>>>> rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
850-pmu-intr-gen.yaml
>>>> index 2be022ca6a7d..f9b40f3fd165 100644
>>>> --- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-in=
tr-gen.yaml
>>>> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-=
pmu-intr-gen.yaml
>>>> @@ -1,10 +1,10 @@
>>>>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>  %YAML 1.2
>>>>  ---
>>>> -$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-g=
en.yaml#
>>>> +$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-=
intr-gen.yaml#
>>>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> =20
>>>> -title: Google Power Management Unit (PMU) Interrupt Generation
>>>> +title: Samsung Power Management Unit (PMU) Interrupt Generation
>>>
>>> Rename is fine if you add here compatible, otherwise the name does not
>>> match the compatible.
>>=20
>> Thanks, I'll rearrange commits then to make it sane in the next submissi=
on.
>
> If you re-order then the case will be the same. Filename will not match
> compatible. IOW, rename is not a logical change on its own.

I probably should have used another word for this.
I am not going to *just* re-order.

Thanks,
Alexey

