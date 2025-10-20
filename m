Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D415BCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PufIutwJX/MUqRq87e43IN62sjFrJG1C0t3fcKqtI5s=; b=D6jJYkCWaYaSHMi/0oQVGG0jX2
	kKDakHwIoeOs6eWwGIo5m7Dw9Siv88fFy6xXxpQ+SfEcfYAMRcl87DrgzKEJPFKT2Uh1BqcVu744f
	ZEcPJRztFuDoDNLN92iHDlJkcihPa+0tRH4pktcix6/MQbinsP5BTZfb4LPKoF67SHLQCyhcS6cvV
	QfFUsNacbQd95mhhos+enDrNWZovBj1V9OcBoQqdOuN6WaWEYp1W+ORYaFIkGnmeS2WwDvA+yHkRW
	kGhohtK1EVItsz88czHiDYSMvXfgPQYa78QpcMiBTESTRmMyizyJcHYt0TLwsgnGMhipViRRkGmXm
	2x71sxyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnaN-0000000Cy8r-04oy;
	Mon, 20 Oct 2025 10:57:55 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnaK-0000000Cy6y-2lJ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 10:57:53 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so789620466b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 03:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760957870; x=1761562670; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PufIutwJX/MUqRq87e43IN62sjFrJG1C0t3fcKqtI5s=;
        b=ZXkuKJJnBELiZ4Hz+bagip4fXEnYo+LZtiOdiak+hsvuSLhy3UzbyiryBruC5pRTZ+
         uemWq+kIIwDocGjEcFtk0HGW1ikVNy4sGtUqeNu06J/OTxsSldeLu33cFRtppgw1RpzS
         AQSLmsuxjPCJmPmM3oxt4bz+gLiz22hgXjsM2JvnzL03+4A6WNbyUTHisVr7iYTw4Vj8
         bdg+TI0h1r4LzP7jCKlR5As8HRRvBqA2TKgik2ikfWy28EVt0agb7y7LyKs5BRBpJy4d
         twmXFpQDgoInxERgv0Pp51N4GSQMJsKRi49VWs9RG3DcAluqE7YABZQ62NGogmgy0yX0
         2vKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760957870; x=1761562670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PufIutwJX/MUqRq87e43IN62sjFrJG1C0t3fcKqtI5s=;
        b=mNXtuKrg9o92fTU6SkECDvBR6KpvqotCLoRJOcXifHSWrsSBIDmT/PwY0QfSBSXFo4
         ANlIAruboSFRyBtgEjsB5bBzmg9jdAkV0CoZdWvgVy6QuNrQrvd/9UYSH4nuWt0ayQU3
         J5cXdFlv7ehHHMsdxPFuX7gdr3+FdyXeGvS1o93m6sRsNohfzYh9kaBz7WT/q9PjTi4y
         UUqaeHctI+htUvb+8Fjinwc48npXoaQma9phqKZ7M67Ywq1SAJnHEvwzPuoAMEXHR5rK
         6gcxqZNep9WtSsR9INQmX2jSDUVqACxFHUnoi1SNq2g8NP0ozyiA3OlpRQ1Dmdmouxf1
         jKRg==
X-Forwarded-Encrypted: i=1; AJvYcCV8pPP3FpbOW/ByPhmJ+/q/01w4AsNEUVw816gqiBG4goMgQoS3EK1UiaQFH7bInYFenNdryG6NEnIh57JgrAh8@lists.infradead.org
X-Gm-Message-State: AOJu0YwIruUlR8Di9pSU6t8X1U67htdWkEqnTN13GNwEK3ZYppz/Leny
	nb+8FBVGyn7UEY5OFxJnSNewzP3iBMfvAyolTOYM9xYbUJ+v4IEinwhW
X-Gm-Gg: ASbGncsQnJb4V4ed6wghZk1HPj9KGf/kzIQd0QJ9JfkGC+TwD2J+rz6AvcNte4OE0ek
	WRP7lojyphJfcIcIsD4cAw/TFGFonROp6AZ4bg27LoWMITgS9MYmyH67FRDOq4LODfTLODcV3yC
	5zAZd7OhLg4og4g3jBtHvLgyYT4YkM3xSxBffnE6rx1fMtrxM1sonyve8vakT3WI9uTDKx0WOBB
	YOGpgxOn117xZlfPjgcTxeyoU5axTFu5xTdtiEjn8gFaLibtkDCtdqLFW/CEWeZNHjCT5O1ALXL
	wa6oJ9xD2VIy/xKz0v1DevPbBWK/eK7NCZSe6Ytrs4zD+J4e/wvjMjMRJqpPL1LJOD2VC9aUGXp
	GycInmcmGV/PXzywOO5JCGzsRl3VKf+H1tS1e32jsLy1jzTAxe3NlkbvYJTzIpqtWLrYUOUCrHo
	dU45TY25MSwnBTuFjzrF4Jv4CdPVqNkVHastTa+bYXi8Y=
X-Google-Smtp-Source: AGHT+IEGNGRqyCA4oo2Whj2ekIc3ahNm9oAu93O5XQjpUk9MWXWOqPcdHqIk3lFTx8TLeoPA3wFzBw==
X-Received: by 2002:a17:907:2687:b0:b57:78fa:db46 with SMTP id a640c23a62f3a-b64764d7dabmr1614004666b.43.1760957870288;
        Mon, 20 Oct 2025 03:57:50 -0700 (PDT)
Received: from [10.25.213.231] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7e984f2sm749179166b.13.2025.10.20.03.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 03:57:49 -0700 (PDT)
Message-ID: <26f1b9ef-2e90-476c-8f95-6bae08f69eb1@gmail.com>
Date: Mon, 20 Oct 2025 03:57:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] reset: imx8mp-audiomix: Fix bad mask values
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
 <aPJSk2spnihEEkas@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPJSk2spnihEEkas@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_035752_716300_E9030DE1 
X-CRM114-Status: GOOD (  19.19  )
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


On 10/17/2025 7:28 AM, Frank Li wrote:
> On Fri, Oct 17, 2025 at 04:20:18AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
>> "memory map", the definition of the EARC control register shows that the
>> EARC controller software reset is controlled via bit 0, while the EARC PHY
>> software reset is controlled via bit 1.
>>
>> This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MASK
>> and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values would
>> imply that the EARC controller software reset is controlled via bit 1 and
>> the EARC PHY software reset is controlled via bit 2. Fix them.
>>
>> Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more reset bits")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Just curious, why previous version can work?


good question. I assume this was never tested so I don't think the question

of this working in previous versions or not is applicable here. I also looked for

the usages of these macros in the DTS and there seems to be no consumer.


I discovered the issue while testing the patches from this series. As for testing,

I used a dummy consumer driver/node and manually checked the register values

after each reset assert/de-assert operation.


>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index 6b357adfe646..eceb37ff5dc5 100644
>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>> @@ -14,8 +14,8 @@
>>  #include <linux/reset-controller.h>
>>
>>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
>> -#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
>> -#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
>> +#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
>> +#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
>>
>>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
>>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
>> --
>> 2.43.0
>>

