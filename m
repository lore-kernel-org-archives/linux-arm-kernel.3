Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1932BCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 12:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGTQzqOpqmdFB4gV3HPPWK1ZwdyzuxlpeMip3GTHBhA=; b=kgr0f15UbpynLwLbVJ5LqMuapB
	R9NdNKk27tF4z+hOXFSw9OUwARNSObvfkUx4PLNzLYKwK+iyLyj1U5Edc1XTAneKbESdUhXrdOxSH
	c+mGYkTgxI/QKqzetfRLb/4QM+uGNrf3+CEoytMptRuRqbJSDjXMXcwm46RrKMtF6bpQZkV/q7K/F
	eCyrY3PprCorP7yBBkxYcMTV2cOEfZ/+ljOBWRlGPgc4lW3CEKOB0Z6AtutC5ZDLx/SK+EoYH1zSg
	9X16JxXVI+AHMtB/yqZZFXNTacpBaszLF+lhLUrk4/gLuJAf9Y54wKAOQE/SMJiwD82ATyemOhyJr
	9MOqcNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8I2o-0000000DAey-2eHs;
	Mon, 13 Oct 2025 12:52:54 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8I2n-0000000DAee-0UGV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 12:52:54 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b3dbf11fa9eso690714166b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760359971; x=1760964771; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RGTQzqOpqmdFB4gV3HPPWK1ZwdyzuxlpeMip3GTHBhA=;
        b=Iqe7jQ/cyeGqmogmcwVx+E+ifeNa+diu06lxkxjO/iu+rQ2IylUF/rvH/cq0bUwR9P
         8HXUtmpKqOlC4oAAD21ytQCZSKR6ofe4OCCdPckWjTSOY/yQztE9Gt0fEC1VbCRLbs0U
         Ijqor9zUCOO4Mya9sdUg6SXZ54QVKGSikLg/ihHdf3jeYhq3AxukP6O9AfJZEmHzBxu9
         GLgQAeookNSp6vm/Nzi6iU7YtSqign7GfG5cd8YuZbAAnBvHXvMRacuAO3QlzxakiSpf
         YN31bEBGkwM4YQHFnwXl3KsU6NUHxZDMARmS0Sd86CL9+bOYsSeQuoKtdalcGUWKWWXm
         WTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760359971; x=1760964771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RGTQzqOpqmdFB4gV3HPPWK1ZwdyzuxlpeMip3GTHBhA=;
        b=Ch81VuJukQS0tZxuC3jr2LbyuUggNxeLOYWB4xBsYvh9so8Ll/d01jAclpFXVUbZ88
         U20MiB9HUQFjqbhe+GY/B5Kwy0v4cNqkAfMXHGhyEMn9FB7jFfSFCqe4Ovm/l09BUSo7
         oZ3JPCAiosfqF24zpPylpU8DsztFSAfUa0pQ2dRvQpr+u7PIEpQB7cVxdbFqXVCO1Ejk
         ruUqD3MHQjGFAnfvX5Ls1d4QMwsRMCC1CjBty+TGrl8bks2dQ3zohG3mRB/Vpa9fHQm9
         5ryhW/ERe0mRB+CbhYpN9TzicQSnsISEBwfcedvl8U9T5FxgoAPpEhWTMJdUv23FIuO4
         UU5w==
X-Forwarded-Encrypted: i=1; AJvYcCWwZGc+wdv4d5mcpH4ozF5JcuLKCXMu9JsZZrYTF3FpWLRv2rsnvIUcOBRo0tfDnePbwZnDuG2Fr/3WmF356/4k@lists.infradead.org
X-Gm-Message-State: AOJu0YzPt3MphjQUAcDoedV+ss9cjMpeYik4fbZ2aOSJnOSgLbGEHRKh
	ntA7UJ1TIqk6Yu7M3UvW/iUOlfAErTDo2bZnZ4hlBDonC0iEL68xX0yU
X-Gm-Gg: ASbGnctvjX9BqfjN5mpY1EB50ncAHo5uGbEtwBerOhmKx1z9T+UxX1Z2fvfJcqUIB/q
	MUp4C5QK+v0peMcM1FLUhCakkOEpWCjnqMPqGE3FMtSCkM/wg6zUqt58dcvvCSJQRS2nNH/AjWf
	USIlRIcmjLKQGdViV3tBbsz2+0seCNyZ9tQp9XRcgClVt22gKnC2brtw8hl5ZW20iKQDIZpnivx
	rnPFiSmH0KFgMz7AX9jur85n2NG5otpuVyE+hUPTjRKNXRgwlGsZsgxEx6oDNTQKsTm1jjvd7ml
	szjCZEABrHH6HgJYLkAmzBX8hJi0MihVQzjLmFiegVBUy7bIClY8pMh1Kg0elTa96sBUvxeJU9n
	nfWxJjSK6TzBx+Lt/yvZ9O4D1JoQGI9r1es7Vx+gZPgE6EAXbnKxBFW5YchsV7Mkop952/BFG3b
	SpMUTM
X-Google-Smtp-Source: AGHT+IFmmG7MUY5yB4mZ2FFQqWGfn+1ow8HKXXWlks0nW+FmPuADWQrKCGGjfAyKnyrLWQQf+T1dkg==
X-Received: by 2002:a17:907:7290:b0:b45:a03f:d172 with SMTP id a640c23a62f3a-b50acc2f5bemr2364136766b.57.1760359970930;
        Mon, 13 Oct 2025 05:52:50 -0700 (PDT)
Received: from [192.168.4.55] ([92.120.5.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d95257c8sm920389866b.77.2025.10.13.05.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 05:52:50 -0700 (PDT)
Message-ID: <27b2e692-ecff-483f-bb88-392f6ce87574@gmail.com>
Date: Mon, 13 Oct 2025 15:52:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: clock: imx8ulp: add SIM LPAV clock gate
 ID definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
 <20250804155407.285353-3-laurentiumihalcea111@gmail.com>
 <20250805-natural-vulture-of-glamour-5fac8d@kuoka>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250805-natural-vulture-of-glamour-5fac8d@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_055253_195615_C1437E1B 
X-CRM114-Status: GOOD (  14.40  )
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


On 8/5/2025 10:02 AM, Krzysztof Kozlowski wrote:
> On Mon, Aug 04, 2025 at 11:54:02AM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add ID definitions for the clock gates managed by the SIM LPAV module.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  include/dt-bindings/clock/imx8ulp-clock.h | 7 +++++++
>>  1 file changed, 7 insertions(+)
> This is part of bindings patch.


ACK. Again, sorry for the easily avoidable mistakes.....


>
>
>> diff --git a/include/dt-bindings/clock/imx8ulp-clock.h b/include/dt-bindings/clock/imx8ulp-clock.h
>> index 827404fadf5c..ebebb4831761 100644
>> --- a/include/dt-bindings/clock/imx8ulp-clock.h
>> +++ b/include/dt-bindings/clock/imx8ulp-clock.h
>> @@ -255,4 +255,11 @@
>>  
>>  #define IMX8ULP_CLK_PCC5_END		56
>>  
>> +/* LPAV SIM */
>> +#define IMX8ULP_CLK_SIM_LPAV_HIFI_CORE		0
>> +#define IMX8ULP_CLK_SIM_LPAV_HIFI_PBCLK		1
>> +#define IMX8ULP_CLK_SIM_LPAV_HIFI_PLAT		2
>> +
>> +#define IMX8ULP_CLK_SIM_LPAV_END		3
> Drop. Not a binding (see other discussions for many SoCs why).


these definitions are being used by the clock driver we're introducing here


>
> Best regards,
> Krzysztof
>

