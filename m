Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0174C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 03:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxgICOMpj0NVx3WYcPGVSamgvQ2YeH2wLMAPVBj+n7M=; b=p9L7MVq/Opk9ol+A/XFJ5xy6uh
	ktFOmrA5Fehtakt9fnIGMw+uhZRe16rGw6iz/UKqq5Hq+k2M84G7o4WABbLx4gxZHkZiXaPOY/Ewt
	hS+P0hleyFcyzB1EjOeK6dWP+pJk4X8Tewbx10jpkoXz6NnVBJT0t603tThawJ758KOBdaSq0ne3l
	OPuQVihJdR4iaGnpwELItq4G6rIofLMtWxzjGkksX+55Gk808dctA5aYBPU3vY3WzJ3QAHBZmnlrA
	tXhAyHEXBDhWmm7tXsEDd4HfGW8BQkrQOM/2kvzunFRmF/uv64xHS/fAxHFE1oe06UIk8AbIz6crG
	ZjHSVqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Ruw-0000000FMzT-2aH8;
	Sat, 12 Apr 2025 03:52:30 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Rt9-0000000FMtZ-0KzK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 03:50:40 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-736c062b1f5so2276062b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 20:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744429838; x=1745034638; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uxgICOMpj0NVx3WYcPGVSamgvQ2YeH2wLMAPVBj+n7M=;
        b=cKuM3pKiEgPumBcFeGMc1Ppecqrxtmqb6gUEc7vD2RH9O6nJPwgOY179m8LJtUXS/U
         FcJzyxP7jumNaZcl7mR21boaNYA9G36uNnShos390+TmrvFb2pP1UOTXhW5LxDTGlQIx
         sivaXnHFjVIGfrDYxbliCNcvGpVjSKzwxPJPFywxYH+jt6EyKVNz7YjQLJMYfY65v8sW
         AWg0GTdwK/q3KAAZ9a5KQDAvsV2i9Dy4I3l8y2+R3PgxXYIO11L/lG8WT8OJMScIpKaR
         NHPneO5fwc396WRqaGF/2r6kkKCcRywawV+9pFv67EcYNNUjEi4KO5Yp7o0cWozcCN1/
         /6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744429838; x=1745034638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxgICOMpj0NVx3WYcPGVSamgvQ2YeH2wLMAPVBj+n7M=;
        b=wlKvwlbadpHOSaapAWYmK5m7oYkcrL0x7RgyaEFGsn5CX08jXPdnCmuG3w3Dufnb7g
         LwajSdZIcQ+Yj81SBxHASbFXUk1+WJ/NSjwfUIw4FZUCZzK9hgWhbAraxebsOuaqWp/5
         akNSLM1CaoActlZkD6UsGOqWhPRx8btoKppT7ghL+iHr+ypcwg+oUZCf5woAmEmay89O
         CF+T9oHYbqTp626UXebsXORZIhes6O+GQZfrLI/Ig4ynfT7gGwadUlB8wGSl1RhOmNwV
         TiOtkyF+GJStFu+dMAFws5x9iF34pNsWpl/5CbMY4wLveEfN+doxD/wYYdAk6nVg5wnE
         uiwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/wJsfZ52ncq5fPztTxBuTF8has72w/hgFFPPgCbzHsf8hGCQjnOS75/Fyqgns25IxCsl7FVgArRYaZSX6rc4U@lists.infradead.org
X-Gm-Message-State: AOJu0YxL10ytbeikmMgmEtPOiIprmtOvT5tFkEqBA0uCmhaqobQUYZoJ
	MLD93d6Og8d4fORNMXgqqubvdNL7iYAifL361k7CXxA6e/TE8hEJ
X-Gm-Gg: ASbGncs4faGrwjqCLlKPyS46P6+IzZd3PjKjiZ0rDKquXNrPXnpmu3MRGzcf3tchZUX
	CE4mA45KR4/2u82BS+ruHJN0fEJ/VnEzLLtJgR0z/Zdw/XO1m3at1baF4RGl6IFWL804upne/D2
	wmR70vSMZcCzA/zzzRfTgEZ3Gr4izLaKoI+uzNnXLCBdt5E90M1SUAx44ssNCK7a9hj2hEj61iW
	xWhU6TOgUyR9IRfF8P0Ai47ul4qJjkheZGOqKWUaeqJPy7rLR+k4cvynzVS0BoDgoFxC3u1ocii
	kmgZgd1Q/MtKD4izfU0A
X-Google-Smtp-Source: AGHT+IHEPw9l2lckImW21hc5WfLjuKibfw20oGZVWj/fM/Sh5wIaMnFrYyjNGc7ye9/ekqZxC0bumQ==
X-Received: by 2002:a05:6a21:3a4a:b0:1f3:194b:30ae with SMTP id adf61e73a8af0-20179780638mr6529548637.1.1744429837641;
        Fri, 11 Apr 2025 20:50:37 -0700 (PDT)
Received: from [192.168.101.248] ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c210esm2476926b3a.41.2025.04.11.20.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 20:50:37 -0700 (PDT)
Message-ID: <dc4cc121-9e75-45af-98c1-5a4c0802e2ca@gmail.com>
Date: Sat, 12 Apr 2025 03:50:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] dt-bindings: thermal: sun8i: Add A523 THS0/1
 controllers
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>
References: <20250411003827.782544-1-iuncuim@gmail.com>
 <20250411003827.782544-7-iuncuim@gmail.com>
 <174433447237.1635065.9681378963946489764.robh@kernel.org>
Content-Language: en-US
From: Mikhail Kalashnikov <iuncuim@gmail.com>
In-Reply-To: <174433447237.1635065.9681378963946489764.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_205039_126422_DF3DF11F 
X-CRM114-Status: GOOD (  19.58  )
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

On 4/11/25 04:21, Rob Herring (Arm) wrote:
> On Fri, 11 Apr 2025 08:38:26 +0800, iuncuim wrote:
>> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>>
>> Add dt-bindings description of the thermal sensors in the A523 processor.
>>
>> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
>> ---
>>   .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml           | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.example.dtb: thermal-sensor@1c25000 (allwinner,sun8i-h3-ths): clock-names:1: 'gpadc' was expected
> 	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
Thanks for the reply, I didn't know about this tool, I will use it in v2.
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250411003827.782544-7-iuncuim@gmail.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
Yes, I forgot to point out that the patches are based on 6.15-rc1 using dts
patches from that series that didn't make it into the latest rc:
https://lore.kernel.org/linux-sunxi/20250307005712.16828-1-andre.przywara@arm.com/T/#t
I'll add that information to the cover letter.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>

