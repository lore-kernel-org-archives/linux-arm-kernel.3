Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B330FC44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 12:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlYQ+J/8rYdsqc6eGhUahr3U27QhOh0SgcXLrXVQ3Qo=; b=ZhczwPG7wuzvifKO+afsflN/p0
	Th3ORsb7DtUTrvU/+RrfyHZTyILmP0NHrzouu8NojwxbM9XeOyd9POka9RT2/o8Z6JHJjVxc/p8b0
	o/hkrsGRZAYs7cgltOVHAtj8aX13ZuoELcpONlpMfnTf4b+hTB3HkjzGF11cDSHm7N+phla44+gh7
	pp5JUQq8Vnk+2KRCK46J1JuLBZ4qTKSfwvsoA+9JMfHXvCOTq+6c0dB3z9qWg2SZNJMh5VS5TWvCT
	f5Fra4HscIwnrWVMyQej2KnE/M3k7lPKTz0tP58YazOwKu4Axyin58KoVPuU2q78amAfiOBg3OSNB
	5paIpoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAdo-00000004wOT-3sLJ;
	Fri, 10 Jul 2026 12:47:40 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAdm-00000004wNi-2gVQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 12:47:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493b1710405so4439415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783687656; x=1784292456; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlYQ+J/8rYdsqc6eGhUahr3U27QhOh0SgcXLrXVQ3Qo=;
        b=QQSsWeKW3Tm8GZTpE6ZkpvkQcVwc0GXsLndp6qdydcaydY584oFC1d55+uDXzX2M+N
         onH3D8DucGidmzOI30RvB1kNS4CHKifemgjakUYzyh78/yQblH64qDPItkdsmeUp2H1G
         JrwEYfv5zv3g4+n4HJFgZFt++YTr4Yc3XP/7brVCkmFBv9dTP64ZjkkIPUJ5SkxvaoIZ
         gMz1j1tVfIa2MYj3TrLZIT3FmeibXjlcbSRv4/ls/SFg6I5oZ3ptqikDKz1TWgzGA/18
         0UuEwwAaRFJBZshehBCwIEn9xj/wmMjIRTuv+LyVV4OseS9VjDNOIzPz43g8j4JLqJUv
         +32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687656; x=1784292456;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlYQ+J/8rYdsqc6eGhUahr3U27QhOh0SgcXLrXVQ3Qo=;
        b=UpwFoEngg/4UYLNmfnVfrIONXP4gM+KNALEGCqz8Z0gq0j57tlstocLkdkm7yTyRNM
         6IM0x2TZogJ9DG3v+7Z61iB1K/1n8PRfIl2uUmO23HCwF7qtuCZbEVTDu9uBGGr/9RlT
         bSJLvDceY+LqhlKs3nMylLfsYA5w+WCnezQuPvokb3MGPWc9m5EKU+cPQ1luNZFaNuk+
         z+AUAvdAQ5RsaImNRXelxToYINXA4gwTx/6ufkyt6+jYjIzavhZTHQ8syUZQm/UBpPen
         6U/ZoM/MPXm9CbKcbA9bl4jUEryWOn5lsQE/sdky2sMoxgn6Pofm7DiF32D2wijsCjkT
         cBYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3WEUkvgCDmAQzdgsxNLY+T7uUvhIyBNqjLs9vUfBqkA08fWp031K52Kr8xJa2BtVjtB5+JG3phnILyxFvajro@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt1StX672sFolhbJyYyTqo0b+0nhQGhM238Ucgl6iriGyGLUSP
	pCcJRswA4rpX2hTfwN2AzcYnrL3O4YIX3VT1gl1JuBvq7EuD76uEa+dQWtIQD+J/1rc=
X-Gm-Gg: AfdE7ckzon38pOCVdCRwdGOCkLChEVb0DJcr4q4fowj9eyBrF5ZEdTySOYtn3iH91YV
	XfPNiQNbIuwy2x4EZ5Rh6PljyYzU0xsBp8oF7D86aEVuBqKy4FUgDVbR7SuPdqAs5N8e5JmFZsb
	+kt34PUASE//bC87d+wQAiOEuJ8neozWpcguF/RoK2ON1+ZuyV7os6eCFCdyHbZGf/Kh9NszMfC
	jtO7tuHf/3suU+VaIUeHiodvW8Ar88R9YPpqu4sBsrtIFhl/axo89FKbsAzRlS4dWFsLcx8sHxU
	N9kcplbiVcu7oPwpr6bM89xjbQXiszPni/2tRl4yn2Pb2unxt9lIFy7K4DuZ1HsfIn2W/xTh4ZX
	UKHMmt3kGXXYpRlSaegMBr4GzgkFURyFqc9g7dwkf4UOAfD/QKBpU9biF65gcVsgOHDwoSM88EA
	0gF7JtWWycvJGSF1k=
X-Received: by 2002:a05:600c:4455:b0:493:bb0e:2832 with SMTP id 5b1f17b1804b1-493e687fb61mr114586355e9.37.1783687656144;
        Fri, 10 Jul 2026 05:47:36 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm3834312f8f.3.2026.07.10.05.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:47:35 -0700 (PDT)
Message-ID: <191ee2b4-d552-49ab-aebb-58da970087a1@baylibre.com>
Date: Fri, 10 Jul 2026 14:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: meson: aiu: Fix resource leak
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>,
 Ethan Tidmore <ethantidmore06@gmail.com>, linux-sound@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Takashi Iwai <tiwai@suse.com>
References: <b955120b-2c32-4b03-9e7f-f236692cfc7b@baylibre.com>
 <76386ed2-b7dc-441a-b9ea-80ab26c54d52@web.de>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <76386ed2-b7dc-441a-b9ea-80ab26c54d52@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_054738_685782_12B70F58 
X-CRM114-Status: GOOD (  12.47  )
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



On 7/10/26 1:27 PM, Markus Elfring wrote:
> …
>>> +++ b/sound/soc/meson/aiu.c
>>> @@ -310,7 +310,7 @@ static int aiu_probe(struct platform_device *pdev)
>>>    					 ARRAY_SIZE(aiu_cpu_dai_drv));
>>>    	if (ret) {
>>>    		dev_err(dev, "Failed to register cpu component\n");
>>> -		return ret;
>>> +		goto err;
>>>    	}
>>>    
>>>    	/* Register the hdmi codec control component */
>>
>> Technically the fix is OK, …
> 
> I doubt it.
> 
> How can a snd_soc_unregister_component(dev) call ever fit to a failed
> snd_soc_register_component() call (according to the presented suggestion)?
> https://elixir.bootlin.com/linux/v7.2-rc1/source/sound/soc/meson/aiu.c#L240-L315

The reply was based on the fact that looking at 
'snd_soc_unregister_component' that's a macro for 
'snd_soc_unregister_component_by_driver'. The latter cycles through all 
registered components and if nothing is found related to the given dev, 
then it results in a no-op.
So calling 'snd_soc_unregister_component' on a failed 
'snd_soc_register_component' looked harmless to me.

What did I miss?

-- 
Valerio


