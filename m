Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA4BD2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3DKzoGRNNveCs6SOsESX4/t1nglUdmun8SVRIZGpys=; b=j1wV04QwOHkwOUThnvOPb6lPJa
	A/tfjFKpZiAzr9XhrWR9BOfdhXbVZ8KJqTXjhnCTcM3c/q7isEUhsdiCDuVdGQAa/EIqJd6peUwvJ
	u8Lj6cwVfyBE81WonD1RweoQLstqt6M4imacHbHdfiCLlIyTurHY+KU/JknEwjoBE+61vmYMAIMB+
	l+Hn+vU1ldd+g6o1l4I0KiVOKJVFL35Azz7U69f635yYQBLPWyFQc8SA1C9FG7s3QD9MlieAM1xYB
	cULMXe/cjg2zxKFnMEHxG0k4UkPeBxyaIaUvH3KCprpzm9fKQkCKeYvrV9lEz1glQsaOmyqRz5GdT
	ZnY7B29Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vaZ-000000009HY-3RuY;
	Thu, 24 Oct 2024 11:01:11 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vNm-000000007MM-3Zn3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:48:00 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so10803261fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 03:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729766877; x=1730371677; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V3DKzoGRNNveCs6SOsESX4/t1nglUdmun8SVRIZGpys=;
        b=k/cwE/nWk8wAz4msfx1qQhZ3S3b55RaWiR1/pZdife5iujCu2LWgpIQmflldQuLFb3
         OTb8C204EtXHU1XlFbC9WUo3pptyF1j9A2fdAHWFMlIBuOnach/TgsBdeyfgkNe77ppV
         3kmLtHt+Mlwl0cHqF+vJ9JmNRIb72NllfcGCkSiTgamOC1R6JSX0BL0f0sOzZRktV7M+
         BnFQR8V8zxxNCXifkOOzEiYBgC2v5RftHHTgZ/nZkLAtM8iC117QVZjc/Ju/tSVGnad6
         rvMvtOYb6GwjM7t3Z8p8jK6jkqR2NFqpp9tUB3FFlOb1Oy3Ol2/Ji/+20ORBC7CHsvIp
         1MRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766877; x=1730371677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3DKzoGRNNveCs6SOsESX4/t1nglUdmun8SVRIZGpys=;
        b=RVvrnlZsHDNXi4M1/1RNTWLhhIBfEXi12hGan3n8X36j6U2F469oN5dsbPVvHuORYd
         MI0A55Y9xyEvGdi76a5Dq5b14crvgm9lvOaGholWSZB3JJWSsh539OpjqOP/rG4oF2PW
         r6WwMJ/AnJU9LJPBGXsHToiraBdliAGPDzxg5ye7cZBWTNF4ACGwElZ9S0V1ogBOzPz1
         TC/CboCr6R0sbz2VefmnAnHPYV3xleElFECdcUvIPiFW2W8I4z+TpEhHtMjn/b7xueV9
         XqtPoeJY0iHQx+xbsgnfV2fW8oMPgDcHLZLSI4GrQ4ViVXu0LYiaWc+HGpwU3pPaxrI4
         aDOg==
X-Forwarded-Encrypted: i=1; AJvYcCUBI+YMe2IWOenikuGRwuhfghgJOzGmHwzSKO2fOBrOcbObpPDhqdzFq/FeiHazyYe5qBGHC8O0Lm4ISJm9xXeO@lists.infradead.org
X-Gm-Message-State: AOJu0YzUGzjLMsOXoEfEt6TvN6ycdksjpXNYf+fi6xIyDN5rwervtVhc
	FC1yFM1JQWT6gwIVTWlPk1FjHwKrupZG1aUe5mOuNs27yBzZgQ7C
X-Google-Smtp-Source: AGHT+IHHCGUunbU1WBMJq+sAZx9YzaIXr41UGHDPNjS2vbTVWpJJQid4DmPQCcWS5iyhHtNJjwXglg==
X-Received: by 2002:a05:6512:4489:b0:53b:1f59:dc59 with SMTP id 2adb3069b0e04-53b1f59de4cmr4200149e87.6.1729766876589;
        Thu, 24 Oct 2024 03:47:56 -0700 (PDT)
Received: from [192.168.4.167] ([92.120.5.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91306fc0sm600659666b.91.2024.10.24.03.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 03:47:56 -0700 (PDT)
Message-ID: <8a017e66-6d84-4bdf-8188-9ae3428b6d17@gmail.com>
Date: Thu, 24 Oct 2024 13:47:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: fsl,imx-rproc: add new
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
 <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
 <ub7yylef6qyztjtg3pciamg6jjznxh3ydlqsdcg2xcoxqngpi4@j5jlex4qukyz>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ub7yylef6qyztjtg3pciamg6jjznxh3ydlqsdcg2xcoxqngpi4@j5jlex4qukyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_034758_931163_5C21D1C4 
X-CRM114-Status: GOOD (  17.63  )
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



On 10/24/2024 10:45 AM, Krzysztof Kozlowski wrote:
> On Wed, Oct 23, 2024 at 12:21:11PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add new compatible for imx95's CM7 with SOF.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 58 +++++++++++++++++--
>>  1 file changed, 53 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> index 57d75acb0b5e..ab0d8e017965 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> @@ -28,6 +28,15 @@ properties:
>>        - fsl,imx8qxp-cm4
>>        - fsl,imx8ulp-cm33
>>        - fsl,imx93-cm33
>> +      - fsl,imx95-cm7-sof
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dram
>> +      - const: mailbox
> That's quite different programming model. Are you sure these are devices
> from similar class/type?
Yep, these are all Cortex-M cores. It's just that their usage differs quite a lot.
>
> Your big if:then: block suggests this could be separate binding.
Ideally I would have wanted to place the compatible inside dsp/fsl,dsp.yaml as the
programming model would have been more similar.

Unfortunately, these are different physical devices (HiFi DSP core vs CM core) even
though they're all used for DSP purposes so I'm not sure this is entirely appropriate.

Alternatively, if you think grouping these devices (i.e: those represented by the -dsp compatibles
from fsl,dsp and the one represented by the compatible introduced here) under the same binding
is alright we can just branch off from fsl,dsp and fsl,imx-rproc and create a new binding for
these devices. I'm expecting this to be relatively clean as they have the same programming
model.

Let me know your thoughts on this.
>
> Best regards,
> Krzysztof
>


