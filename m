Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3BEF46139
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+UUACqAEvJ8nDbjPv0hUOrpaSay71+UWgCtj8ajV1Q=; b=AUeJ+y5LcW5FylSEMWiy4G8C1f
	gSGZXEy7TkBHL5JDqpcpeP4NzRyNBJKqI+PBozJ/wdpNgsbkzdUDJO8zV3yVEJ66L9Kb+EVq/ZPT5
	RrD8Rpr/1OM6VE5alMYOGcMU7iVKBXM4jt4kJJpbA8r60qWWhuIatCtDMSkn7z+3hNRSrbxCl8aHw
	S9Cp1/vu7RsA/ZVCeTfWupt7YDPUv//xjAnhuwKCqYjrzlkEldWveDDX0F+wR3OKRAZS4Lwr7keu2
	ks9KhRCtrCI/W9RVCByGmtmAkjELvuGijqVueYUCCk8E5jaxrD4EWWdPwQP93Tvn2ohMglZ5v/Rne
	b+d9UIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hQE-0000000H3O1-0xds;
	Mon, 23 Mar 2026 15:42:30 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hQB-0000000H3Nc-0SYX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:42:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43b7ffed973so150948f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774280545; x=1774885345; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+UUACqAEvJ8nDbjPv0hUOrpaSay71+UWgCtj8ajV1Q=;
        b=kJ/0oylWHneA+0ZXyMHJcYvzTFuxSS2gFdgXsMLt9BZtkzGbc07Aim5bhOJDWU7Md0
         1iZyG+PJMSwtV3zQT85l+ar4IPdY2t+0Vn0GAdBzoZdt9be9PvztmN6/du/gRZAXifDA
         KH9BrZ51RH4VzBgEKs2HOlNvzdou9O9T/mEd9Lmrrufyp27VYJC17OeZmqqknWQ0dH46
         OEui1Zs671HdqK/gILGicleQM9UTNfnZFSFa5tm5LPy8H4hWP3DvnVAlh23hKX+lCbe5
         u3E2faa1FqnOEf258tuZzMak6g3M/8DsBe3/Z05+jxB9mwozFv/d2Ed/RMG81WAYHtKc
         KbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774280545; x=1774885345;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d+UUACqAEvJ8nDbjPv0hUOrpaSay71+UWgCtj8ajV1Q=;
        b=Z2gGuktI9Ot6w+hQnGf8EEIs0l8oiLXUIXKZHzI4dIat+ssmGr6OElBVRwjwj3ZWAK
         zR1iLSOl81fNdo57DVm81ytOs1jjn5ODWyikSpJYoOjmSrN4Ch0ih/13qqqvugHUzP98
         5wj0x9OqivwNlCxcxDUSUH/XgnArsCvy65xFMwx3ZXXEYAVB9M0VrkczukLWi5aFXYkr
         yQSHerwaMzKFX0pd08lRhKdVP823diEnwqNELV6eGqjRmFxTB5IDI/2fLomCHVIat5Fc
         6kPbulKYhlJOLhmJ2e2MwgxJ1tjTTuxH+QYBdguAvSGTFYgldyauc72F5o9BFhLjSfHI
         E77w==
X-Forwarded-Encrypted: i=1; AJvYcCWGimOYd4KHfY2liTnQc4WvkX5d0OT5GpUzHEiMYLXtuKSaxsxV9CeV/I6IFHqUvdGmBe9gKEVOWvhM2VwhKHkl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7R6GCJrCN+TqxIvGPTIECrat5S2fLjOMi4dZek/jvKkVee6/u
	izaZaT1n2b4trkCdUTXBMfcJ3XCF3wMgt+OBuu46/ZXSGLDs6TP8ZxtHwpml9vzmH9g=
X-Gm-Gg: ATEYQzwk2QnvhGi8MCwP2opQKxooKJpzsnYK4klq7fg/eoXyb2OewjrocnelNwbfmyI
	EyT6+J877epV7K8ImaFHClb+qMaP+EocqZO2hrmxIY+L6ZmRuMWWYyopczX9s11kyiwbqHyg6+v
	CqqNEHUZqA1FlquZpNgFuhcEvyHPiqZ50E8VnWIhP0SzFep5/YWBFbvny8r+TQS3PcMEKg9JIq3
	9+In/ZKZIxrznDXWcIrj0s2mu3YzOdpZrid7GSUsk7WK2CHOBQ972aRcOET21IO8AAG1sYUx/UR
	I55MI/jgQRRv7DJPokYtdRfDfO3WWrvKfb7JmJZ3TFzf8uk8b5PgfOQ9rPmBlQkF118DLYl8bNA
	QuPp3eMEUWOSrDgGmPXYjLptR7fnOLCCDjuQ84x+OfsAPdZFjPbtANHm3CfyJY89ZVufPcdMPAW
	Pexa0d3ZsVyTePwZPsELlJYZLSoejq9xk6/Hv2zG3e/InPin8Eim01v7W1qeYoa/0ZjAIha/yHr
	sepUhWOrxV6
X-Received: by 2002:a5d:5f53:0:b0:439:be04:13c4 with SMTP id ffacd0b85a97d-43b6423d85bmr18780048f8f.4.1774280545056;
        Mon, 23 Mar 2026 08:42:25 -0700 (PDT)
Received: from localhost ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644acb52sm32068966f8f.7.2026.03.23.08.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:42:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 15:42:23 +0000
Message-Id: <DHA9YL83GF3E.VOMD4KV10NLW@linaro.org>
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
Subject: Re: [PATCH RFC 1/8] dt-bindings: soc: move and rename
 google,gs101-pmu-intr-gen schema under soc/samsung/
X-Mailer: aerc 0.21.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
 <20260226-exynos850-cpuhotplug-v1-1-71d7c4063382@linaro.org>
 <b02f06e1-dac7-4521-bf5e-471b5575467d@kernel.org>
In-Reply-To: <b02f06e1-dac7-4521-bf5e-471b5575467d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_084227_171623_3B3A3DCC 
X-CRM114-Status: GOOD (  13.08  )
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

On Sat Mar 7, 2026 at 5:03 PM GMT, Krzysztof Kozlowski wrote:
> On 26/02/2026 16:47, Alexey Klimov wrote:
>> The GS101 PMU interrupts generation block is actually a standard Samsung
>> Exynos IP block found in older SoCs like the Exynos 850 and others and
>> not exclusive to Google SoCs. Thus, renaming to
>> samsung,exynos850-pmu-intr-gen, moving the schema file to soc/samsung
>> directory to reflect its origin, since Exynos850 predates GS101 SoCs,
>> and preparing for adding Exynos850 description.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  .../samsung,exynos850-pmu-intr-gen.yaml}                              |=
 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-p=
mu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,ex=
ynos850-pmu-intr-gen.yaml
>> similarity index 80%
>> rename from Documentation/devicetree/bindings/soc/google/google,gs101-pm=
u-intr-gen.yaml
>> rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos85=
0-pmu-intr-gen.yaml
>> index 2be022ca6a7d..f9b40f3fd165 100644
>> --- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr=
-gen.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pm=
u-intr-gen.yaml
>> @@ -1,10 +1,10 @@
>>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>  %YAML 1.2
>>  ---
>> -$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen=
.yaml#
>> +$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-in=
tr-gen.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>> =20
>> -title: Google Power Management Unit (PMU) Interrupt Generation
>> +title: Samsung Power Management Unit (PMU) Interrupt Generation
>
> Rename is fine if you add here compatible, otherwise the name does not
> match the compatible.

Thanks, I'll rearrange commits then to make it sane in the next submission.

BR,
Alexey

