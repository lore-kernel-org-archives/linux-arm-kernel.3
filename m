Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7AAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzXFqoXqPeZGihvup/K1NfREk7G96+/CIyQ/UfFxcFQ=; b=r2uUZy/1zw7EjK
	hHiueB8E1PVwBtkCi119aRfaQ6V8rYig3Mh417ZLBA04d40n6yzkLlV9WkDAGN/1VSlZBlk8dodl9
	g3KpWB4pYPLXMaYhABESzV9vv+xTPqpudPkN9Sn9JPCkTFArg5ila4sv+M+ljrUHM6XqiVXS/30Ba
	/P6qkPjx1W0QFTFwCeovBeJmRDLGo4jMCwEANczRLH3RPaAT0lM5ZA5tXk5XepIrj5T9+8vrSGl+u
	HewvK8pWnzDUm2MzY95n66T80OYh8GJJz+XgMpHLpmLwwn1ZTV+d+TZisDpAa+NJsEbwMJyX8fVRI
	BaZ5OqlAxdNgD/LxFB+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUm2o-00000001BOP-20rK;
	Mon, 06 Jan 2025 12:17:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlow-000000017sj-1dbC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:02:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43637977fa4so14305235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 04:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736164976; x=1736769776; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LzXFqoXqPeZGihvup/K1NfREk7G96+/CIyQ/UfFxcFQ=;
        b=gzJKJgxmcKFwMysbKqAhFYOfGsiheH7MCX3T1Ut3TQ5zj2Pn/DadPUIC9KEeb0Dwlu
         J1aEgK5sKTiA5m/sTevZOzhjb0LEfFj7CB8szxJlPJy1vz0lfqvUq5fH26leXLMxJEBh
         RAWEDdZVULkeUiU4CWi8Mo4UeAz8Ax1gM8npxaxPoVQZCozTHkiDsYFyTjFWfYdncdCU
         tkq4FoAt8Ptp/brpePpoBbZ+fMlNqRD7mqEoG0z4+B9euWmxr3RXS9G6iG3YD+EMN7nr
         cCyo6LuUAqW+u5mcv4epm3By0GjcnjVIaj4kF7gMGrpPSDrar9+s7kyloacRSztw5Dzt
         RYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736164976; x=1736769776;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzXFqoXqPeZGihvup/K1NfREk7G96+/CIyQ/UfFxcFQ=;
        b=Vuhm327KozG6ukerrWARc79EOpzj7BCYhBzLYW4Kfe9aAMVZ/BaH0Or1G5oRDgiikT
         iSYHO7hxvqX3I2Np7JPqn+nquBPgmT+mLv+QU7aOrDGZ5yb9KpI3ipNlHiIdg40wGLdO
         OGHUGGyKEYyAhktdLqdQHKQPUPGkPfpAKbCEx910JYkgksJ9JlrLyzvA/6EWaLPQcbWq
         NPuMttjiCtwx4Nx0etgby5Qt9T1PKE5KyeJHsoKfB2vC1jRN6B6Lwd+NiNZeKCzsBcSl
         sy5RJW8OV4Zgo9iAwl/keG0ISOFEuE7zsP2RWJbjdfU9zz0Op9UD3nlY0Abdb/46PN2C
         oHvA==
X-Forwarded-Encrypted: i=1; AJvYcCVTUvsVv0HZMPFRLLkTD0SghWd/obdFfXefk6Rs/rUCSfF/A8ZASyhC+htApb7p/grdoCwIoF+ViKZMOS7en4av@lists.infradead.org
X-Gm-Message-State: AOJu0YxTTBTrYzh7hUfJYxAfJDOz4hwA4i8EZMQq5i5TJ3CMlEkh4W+Q
	ZEzmjigIfl2oTHvPaLG6VyKMvQJIGiwyOzkCpPZKWGDQqeidmgnu0bXd4DVf66k=
X-Gm-Gg: ASbGncuOH4j7dEWKUDjDVVHoXuJ/Cwbx8um1u81W0dgwzSxcjaCJZkbjjmu6VfAWqop
	kBqs3arzE2CKUw2jAeUGI68/RTghNagGd1x5Jfx6P21jjbt1/vmsJXJ8WNHa3zAY/shEw2UZqow
	WIDVW6INNMGOdbBGgExfk1g0jsFOC5WrW7/0qM1p5gBnGSMVu2v2N8PeGvxbLjVEVIeBoUv3dO/
	1p4aS6a1alXDWXbfwee5WAq8nslOjdmRP3kqkHpxHeGjGZlC08jPciy3+EksJCy35AFNkJLM3vr
X-Google-Smtp-Source: AGHT+IEGX8sgAfoexYfQwZ1bi3fe5bj/JteQLkwvpGCJUzk+i386H+5bqXijrus4rgkiGH6AiTmalA==
X-Received: by 2002:a05:600c:1d07:b0:434:f335:aa0d with SMTP id 5b1f17b1804b1-43668547269mr207373935e9.2.1736164976458;
        Mon, 06 Jan 2025 04:02:56 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acabbsm47372769f8f.93.2025.01.06.04.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 04:02:55 -0800 (PST)
Message-ID: <236ec8fe-b562-4242-a1db-48d1744f9d51@linaro.org>
Date: Mon, 6 Jan 2025 13:02:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] spi: cs42l43: Make handling missing spk-id GPIOs
 explicit
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
 <20250104205437.184782-3-krzysztof.kozlowski@linaro.org>
 <Z3u/PNryXkda7GyO@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z3u/PNryXkda7GyO@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_040258_464605_4ED7B19D 
X-CRM114-Status: GOOD (  18.17  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-spi@vger.kernel.org, patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 06/01/2025 12:32, Charles Keepax wrote:
> On Sat, Jan 04, 2025 at 09:54:36PM +0100, Krzysztof Kozlowski wrote:
>> gpiod_get_array_optional() for spk-id GPIOs can return NULL, if they are
>> missing, so do not pass the value to PTR_ERR but instead explicitly
>> treat NULL as acceptable condition.  The old code was correct, but
>> misleading because PTR_ERR usually is used on errors.
>>
>> Reported by Smatch:
>>   drivers/spi/spi-cs42l43.c:241 cs42l43_get_speaker_id_gpios() warn: passing zero to 'PTR_ERR'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/spi/spi-cs42l43.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-cs42l43.c b/drivers/spi/spi-cs42l43.c
>> index ceefc253c549..90180662c4c2 100644
>> --- a/drivers/spi/spi-cs42l43.c
>> +++ b/drivers/spi/spi-cs42l43.c
>> @@ -237,7 +237,9 @@ static int cs42l43_get_speaker_id_gpios(struct cs42l43_spi *priv, int *result)
>>  	int i, ret;
>>  
>>  	descs = gpiod_get_array_optional(priv->dev, "spk-id", GPIOD_IN);
>> -	if (IS_ERR_OR_NULL(descs))
>> +	if (!descs)
>> +		return 0;
>> +	else if (IS_ERR_OR_NULL(descs))
> 
> Should switch to using just IS_ERR() if adding an explicit case
> for the NULL. Otherwise looks good to me.
Yes, of course. I'll fix it in v2.

Best regards,
Krzysztof

