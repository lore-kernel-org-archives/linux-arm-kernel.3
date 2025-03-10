Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC078C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sWDRwWoRdNhoRB0y9hERNCky7r+xUDq97SjfCdwVrk=; b=nKQ1rOJvwrK94SMEOssmV+YBGv
	ynnKcwNhsqqL8iSjBsjpovOWObPjC7Jo4QTujQAJKi+QrljSHnlbiPXyfSn3DyzKcG5sYImtGDz1t
	dWk9wbKs06WNn3wf5rb3h94Xi8MMyk1srRUdKs4c44FCa5iouK3nGTCxfFx31RFlQTs7sRGduZLAY
	zYmwY1jP8pQHYDojll6DO0qH7B464uldOyUvr+Eyi5edkkDuJQDy5t2yyGx6bRw4Q0od4YXIhm92i
	Aey9cVp+3GmCOeJGXbrzEeYxMheJG6IruD607Ct1kDxmU62M3E1CkpEP+o+owS2+lZdhz8czbUqs7
	U7dfRSwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treXq-000000032ps-3aWR;
	Mon, 10 Mar 2025 14:55:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcd0-00000002gys-0ARe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:53:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3913fdd0120so840437f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741611184; x=1742215984; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0sWDRwWoRdNhoRB0y9hERNCky7r+xUDq97SjfCdwVrk=;
        b=Y9cDsScS0fYpDxYGgopw6ELBUxNkNwOzZkKCog93IQM9I5+bjgDVcLQtm04nPn4Hvz
         xvFrvkFXFgBZTAcYuYcZOAOIEAs4xyDymStb/y/iL5Bs98mOJcPKGD70w6LeN1J/BqSE
         PvrgPtfmdeqHpbx5fx4KoRdTPwyUPnNj54oaEaZRhN4UVgMMTuwJzh1iJobaF6TS1cCf
         /rqkptrciXn1H8awNK/vxPqTNqaqyZIWqUVKpIt36i6tqoaPoumIFQAb9M/BHvMlMSel
         hwykbejLuo0Jd0YE1UZ8QX0mPAe8x+wuXZZp5WHVB0hBx/eFubVfkV1rkP55Fdo/7zGT
         kjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741611184; x=1742215984;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0sWDRwWoRdNhoRB0y9hERNCky7r+xUDq97SjfCdwVrk=;
        b=Y8wh+hPn3T4YodKtU37mVxyNyPp/4qg3IUQ+JzorExQuiwQvcTltLaKoe6tt7GXQu7
         O+c65gcVRa+DoQmIAo//9OScAj/212RUaidcv5NtJ5+p1SNQBizWi8IO34PuyEMe/DUa
         k79OLkWzDnVx7Al0eVKqnt0nrPs/dzLVgZb0lCc6qlYXpUIYZJ0CpmeTmeMbJSTmw7m0
         rhpG3jJc1sOngPTnDTqA+PzDl2JH3tEpgegSffkkMjKNC8Ap3juqduSqjwD0naOzPnzr
         ltVJb+1op7SWA230cIkiaTJTC+YHnzutaZxImLoLHCmhcntxz3wmuuZOIpefZkQjLuCb
         FO8w==
X-Forwarded-Encrypted: i=1; AJvYcCVLGilk5Zx9o3u5s8BkEciUkESeH0B9xMLOTSwz94CrnnwaK/7x1vrffHBTuP3d19rOUmtI1QS63fJ0F1Q1jRvl@lists.infradead.org
X-Gm-Message-State: AOJu0YyXLWYlsgQsMqVZAUknvQO0w8+0KdE0e98KH2Wk/zASmLIPr0hB
	LNb2poi/KtZlxcfoP7x6+VENZBKR1xDwbM8t0Q4utC6o9dQkmQXY
X-Gm-Gg: ASbGnculcOvPtwVqXKRFu2Tya7iW5vTeiMJAT5GW2slZaRKeklnkfbZG0cwX7LYWm/A
	xok4Seo8UmDLREYvnaa7O/DP4Tr0H96GFjvbW2gL0iA6oOtkrS2Zzr/hiQPj+c4UyXfNHTPuXvy
	UHyDh48SmD1MDdLfJPsln1WLsReAvP3SMTotdonclMwX2BwPAtVDecB6tRz3MRgYBGXEJtsKEke
	LoKRufwgMPRA3p1bGBZQuplAHyxQrLp4Xwf1MM6KxFfGAW3jBwcAB6t1D80z/eG4F32pKMOshZ4
	VzvY71sHpUit2l83mNd6ZxqWsdJPxkQJ7QX/lwXh6O/JiNFiNXZBAtcv0hrM5Q==
X-Google-Smtp-Source: AGHT+IFXHPnb5VsbdVssO26dYn3ROjMGlquFXlpHNlrLpPV4oHZpx61k7zyc+Kw7eGGnGWzsoTXBrQ==
X-Received: by 2002:a05:6000:144d:b0:391:2e58:f085 with SMTP id ffacd0b85a97d-39132dab192mr8031238f8f.54.1741611183673;
        Mon, 10 Mar 2025 05:53:03 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0195bfsm14704645f8f.48.2025.03.10.05.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 05:53:02 -0700 (PDT)
Message-ID: <a678823b-de37-461f-991f-fe8b3a7e7c40@gmail.com>
Date: Mon, 10 Mar 2025 14:52:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/24] dt-bindings: media: i2c: max96714: make
 i2c-gate conditional on compatible
To: Rob Herring <robh@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Julien Massot <julien.massot@collabora.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Taniya Das <quic_tdas@quicinc.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Eric Biggers <ebiggers@google.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ross Burton <ross.burton@arm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>, Zhi Mao <zhi.mao@mediatek.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Ihor Matushchak <ihor.matushchak@foobox.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250308183410.3013996-1-demonsingur@gmail.com>
 <20250308183410.3013996-10-demonsingur@gmail.com>
 <20250310123207.GA3853920-robh@kernel.org>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20250310123207.GA3853920-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_055306_082120_256F7FD4 
X-CRM114-Status: GOOD (  19.11  )
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



On 3/10/25 2:32 PM, Rob Herring wrote:
> On Sat, Mar 08, 2025 at 08:33:38PM +0200, Cosmin Tanislav wrote:
>> Devices to be added in following patches don't use I2C gate.
>>
>> Make this property conditional on the compatible strings.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   .../bindings/media/i2c/maxim,max96714.yaml    | 21 ++++++++++++-------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
>> index 2f453189338f..d0a2aaf7df9c 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
>> @@ -84,14 +84,6 @@ properties:
>>       required:
>>         - port@1
>>   
>> -  i2c-gate:
>> -    $ref: /schemas/i2c/i2c-gate.yaml
>> -    unevaluatedProperties: false
>> -    description:
>> -      The MAX96714 will pass through and forward the I2C requests from the
>> -      incoming I2C bus over the GMSL2 link. Therefore it supports an i2c-gate
>> -      subnode to configure a serializer.
>> -
>>     port0-poc-supply:
>>       description: Regulator providing Power over Coax for the GMSL port
>>   
>> @@ -101,6 +93,19 @@ required:
>>     - ports
>>   
>>   additionalProperties: false
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - maxim,max96714
>> +              - maxim,max96714f
>> +    then:
>> +      properties:
>> +        i2c-gate:
> 
> Leave the original definition, invert the 'if', and here you just need:
> 
> i2c-gate: false
> 

Hi Rob.

Thanks for your comments.

After noticing that my dt-schema validation scripts are failing (because
of the jsonschema version incompatibility), I fixed them and then fixed
all the issues and sent a V2 where I introduce a separate file for these
bindings since they all have a different number of ports compared to the
max96714 one.

So the V1 of these patches have been superseded.

>> +          $ref: /schemas/i2c/i2c-gate.yaml
>> +          unevaluatedProperties: false
>>   
>>   examples:
>>     - |
>> -- 
>> 2.48.1
>>


