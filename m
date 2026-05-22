Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0CECD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpTRVpTeX+hV9MNqRwUwe9uS8o/vhYTuVInOTNLeRpk=; b=H6L9NX7sSMs90VlMfTf8zqYBWM
	GsGmExu0F5lvuSnDAomrRrAPWtKPWJ3VMrnBpIEe6yEevzVprpDoGZLHwpN9cLRo2EfNCJW4i7CQp
	KR8+Y5p23FU0LGjdrGDrP5WeM6LpdMLzQVUzsoYVuVnWkhmn02kMnVqEkcM7vA8gJFdjkLrDfBLPK
	bIKwDdRMfQdkRleUsjK82/me5l8hs6OZ5w38ilezD31WqdS8ZJWNTKZCDkxQmR8km84UFzMlSgqOr
	SNSR3bwW1uVjFMWK2VkCKdw7NaovWVOzquqQdYVvWGA+HB7sskGRubKqM1+q6m2c7WNu5dsmHNyNq
	qtj3Iq2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSff-0000000BQ53-1RXi;
	Fri, 22 May 2026 16:24:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSfb-0000000BQ3N-2HHb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 16:24:21 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43d734223e4so4993155f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779467057; x=1780071857; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpTRVpTeX+hV9MNqRwUwe9uS8o/vhYTuVInOTNLeRpk=;
        b=VMsbi8up8tU692iB8Apd7GK5tGzAGbtwSvrIHqnXQ1kxwKHuNr8AdF/ZNNd+VMVjHx
         5Dc968QdRgQIJZ1f0/R4yHd05ZmSReErp9Y3jMSzofibNwggfIafW0MUf2VBpXZB/YO+
         EcXHb89V6fNQYuxvu39XlJYOsW/yTBCjJu5K4bdmkg+VvBxozutx7nXPF/UhSerzMLyK
         JydVcERxpfWl5wwK4P/LpHcZpdZUBLFWCfEzUJUCoolEg5/pTtC1uPcnYCGGXeEbfZeB
         /LKriOyUPk9+2+8wkzYHd0PkbDLzYVVjvi99H2TIsbrL1570js0abGjzEexKX8byNlY1
         sIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779467057; x=1780071857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpTRVpTeX+hV9MNqRwUwe9uS8o/vhYTuVInOTNLeRpk=;
        b=MocnExlph775I/l8CwNY9/Tk6Qsv3jFCP3wT5V4SYYWQsTnk4U7XjZN72o02Kpx72C
         6+s1gngP5LExX7lOl9TVmHIeVCyaS+0CkROsHtROipiUWQs23fplvcUfZb69AqnfLbF3
         PNlmBwsQpnI53YsjH222BOssrP3sKOpkN51KV+TUzOnHIN8useM4NJhX0O3DBleMZ0X9
         JuNwLcusJ81EpB55AQrxl1Txz+ELijS4g1EqTAn7wWlit1D6jrZv5+GdRDmRhfEF78tw
         AlSwrY4UvtJhhpj1lOyllGAtaz7HkG8NYiK7tiqZj3bwyyibQSJC2sq223Au/eDMu8cp
         d+IA==
X-Forwarded-Encrypted: i=1; AFNElJ8GWuBLCu3I7CwMY31knhN6NsOJG5BOkV+F3ZuQukB9DIniVklCsk5vuJk9LABBzEOcwzfHNUwhBENmK6oX/DsL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7I2Gw4UP8A2mcb78ypRTIzEjF0V+YrjUc7PzUWOA2lTaPxTUf
	ig+7euIPA9RVYOVB9bQ6YqHND2vPtLfrNBnp/T/ADy1CE3PQ5o2O1kYGTmsRK9sPDZA=
X-Gm-Gg: Acq92OFt7NSfyytFumbwO+VfbsIU1ShGXGX4L1L58tEKBJmdguCjFdZWMJFt6fIfsaS
	msXWMdB+q6z7ulAQnlevxqBilzYg75ULKvMOnJNIMbaPcKpH4hQBiJROWcbj/Vl2OGd0xICzMYb
	NKU2tzuHFjtWzP9Hxda2bzyX4Yi3n9NCXcOMgHlmPFIDZbG8OoWwD+YmRBSY9qAUQErJQAVWd4F
	BPslceAUvaLCk4Go5yaqphvxjrWXTiCAqU6i+mLuW9NhOLWWfnsGp55JD2l6YZDvYI9yZlnwfAU
	dpu0nOnW643wv2eWhPMzu3d4cgAQozH2l68Lf7Vq5qYnJs2pqGWksBWMsn9MN4FVDw4moWbCA+E
	fTW0Bn5OQDvKpwtG+2ywMZBrzNxSNPhUnaUpvrzqLHGb4ldG+ksnhxVF1lwUtB0OK8QzkCRuECy
	tMzg7fXVekjrwuXMl3GFAkOdRvCw==
X-Received: by 2002:a05:6000:1889:b0:45e:8edc:dacc with SMTP id ffacd0b85a97d-45ea31ce398mr13404994f8f.27.1779467057126;
        Fri, 22 May 2026 09:24:17 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9dd03sm5868666f8f.7.2026.05.22.09.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 09:24:16 -0700 (PDT)
Message-ID: <891be10c-99f1-45b7-bd31-ec5080cfc780@baylibre.com>
Date: Fri, 22 May 2026 18:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S
 output data
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
 <20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
 <758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_092419_912275_10A2A1D0 
X-CRM114-Status: GOOD (  14.28  )
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


On 5/22/26 01:15, Mark Brown wrote:
> On Fri, May 15, 2026 at 05:10:40PM +0200, Valerio Setti wrote:
>> Create a new DAPM widget for "I2S formatter" and place it on the path
>> between FIFO and output DAI interface. Remove I2S output formatting code
>> from aiu-encoder-i2s since it's now implemented from aiu-formatter-i2s.
> 
> This series, it looks like this specific patch, is breaking pcm-test on
> my libretech Le Potato board, the clocking looks to be seriously messed
> up.  I'm getting:
> 
> [...]
> 
> Full log:
> 
>     https://lava.sirena.org.uk/scheduler/job/2786342#L1934
> 
> The prior patches seem to test fine, it's this one that seems to
> introduce the issue.

Thanks a lot for the heads up and please apologize for the problem.
I wasn't aware of these testing tools so I based my testing on playing 
with userspace alsa tools on the physical board that I have.

I will take a look at it ASAP and send a properly tested v2.

-- 
Valerio


