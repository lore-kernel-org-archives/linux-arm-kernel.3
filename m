Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC1ED58065
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 11:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMIy+2ZGZlYbGjuPDyKFDMT/8RFkHAkPW/l+lHB1Ssg=; b=DuJjJiHmd+93YrM0scnEMp9pdK
	kDP7exU4B5/4ZjDADg8QFxdQ1pYTTCjZ1mhlwLz3FyTBMCElt/ICqT/msyOKPy9usuOYh1uKFMlWD
	xUvkv0RweObrzvUgSWbaVTuFpAgjD2wSW/a81J9s+Zx3/KTMFiL5NCGqfWhvLFrBaqfyGvhAoKgrT
	q2aADEvz7QXLZ1suI9Z3LD/AaBR2xURo7BMU1/ab9Cdfm0bSAxxA9cZ9AFUS7iOxF511spqDHTp1E
	TaBbLRCOAK1AYNnopkxVcfwnkwtK+AAOTPiR12l0FlfgrSHdMy34aF1a/i9JMRR1dUWdFFpJ1pLkq
	wI3sQG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXLA-00000007u5x-2ErB;
	Mon, 25 Nov 2024 11:33:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXKC-00000007ty9-3j1h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 11:32:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43497839b80so12379965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 03:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732534335; x=1733139135; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QMIy+2ZGZlYbGjuPDyKFDMT/8RFkHAkPW/l+lHB1Ssg=;
        b=nqI+xPhtKhWBQjEroY4RClBhDefNQgmN83W0In6n++hBLxm8LpifQHfRVp41emC6Jw
         JmoDysGczJV3PbByYYVAL41fCF7X7KY+PnIA3p9Xc/ZB/9dy/AeXzkxKMZtE+Fddkmzu
         iobe/O+gFzuAzYgFEitQMJ+nKFTkyjuIz5C7qIkxCFH6CiDE49SLrUGrOriQZstIyaXI
         HtUTJk9Yl8WVBuOOhfZM3DafqkhfKSUzqHtrVe5Xz5puHfL+arE7KSyog+FuW7Ero9rd
         TcNiiOdA8O8C07ESMR60RpHp/XnVrbE+f8QD4+MF4y8jKxBWVhThWNrjxY6JamNK+UBQ
         HZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732534335; x=1733139135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMIy+2ZGZlYbGjuPDyKFDMT/8RFkHAkPW/l+lHB1Ssg=;
        b=cFBPUhBfVW47Tfxtc0DJxRW3Ba5hdLjKssI8m2oiwu3eLoBseqPkiDQ2jqywYJEbVF
         WnqAeLziIW9B4D2BeDrWzKv/mlPMDOjWC+p6T16iRjG+aXXMVdx0FBe/njBNGpuCH7wd
         SXVI0bIsma1aFMpCiFb87gISsYKbfbMbEZ22VDhN2uqZT8dm4vRydQfJ0Uua3PAam+KP
         dl/cTdCOAd9MCRmZCk7mojR+V0FiGhqraKaxXqs2uQ2gOW5SsO33c858FEPynVio+12k
         oAh6Be9BJ7MWwU0gUTXp0qVyX0bSy9i3tpVtDWfSSmdrEFr3sEBtm1zWv14MjcSpxwWS
         izDA==
X-Forwarded-Encrypted: i=1; AJvYcCUY2SikOP+Dp2nWhoBw5mnlPQ8rWrVZYIygKgq0UnFg/pBZU9CR3jj72S5boscbUPoFXosvEkdttDMvVt83CmuW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz1YQumw8U7teEdBiwAErDbVJiWN3EDy6iwEoqJo6MEEfkFr7i
	es7+3r4Rbo5dsljfQUN/osVZbL4uTSxkkx4Ht6p8FLO9KPk9z5oCFv0hM6zSEU9Sz2ZvqnO0E3B
	C3Hg=
X-Gm-Gg: ASbGnctIw/oouo2jJlPNNxwjRlVH1+vBvZFgkGiDISGSyhgIRa7WnNIK95fbo5rYp+a
	/Yn2OSjG31SYz2/BRZVQwaumLpKW5ltr9cjSzUBYdPZpPFX06oYTeaf7gbymH9dEkrCYKA2P6MN
	u76ejRpIn5/ZHsmteGuCIadc+HNpWIydTqjbE6jXo2eqz3WnoCYbqWCPT0iNDWeSsBvZQcQPQ6V
	ZCLTE0CzekQaA/0ofsNMMLNhh3TZb7i3HK3akx0cWa2MiPUOyBmbog7Myo6KSGW0Jd0uoODvXVP
	eCslBdhWVZXinw==
X-Google-Smtp-Source: AGHT+IFS+7K0lEJaKeykwcJTAWzQZ4yXS8JJlRIPKoQmKX+XT9czJ5uZIfuXu4QgSvNX8SY83S/kkw==
X-Received: by 2002:a7b:c7da:0:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-4349499a073mr49405845e9.25.1732534335055;
        Mon, 25 Nov 2024 03:32:15 -0800 (PST)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3dfasm10487119f8f.76.2024.11.25.03.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 03:32:14 -0800 (PST)
Message-ID: <dad2ecb7-e624-49c2-a7d5-0ff53b6a1686@baylibre.com>
Date: Mon, 25 Nov 2024 12:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
To: Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Nicolas Belin <nbelin@baylibre.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
 <ZykbMlshvlwCaeGJ@smile.fi.intel.com>
 <d7bf7863-fd24-4f8e-8cd0-d84867a997bb@sirena.org.uk>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <d7bf7863-fd24-4f8e-8cd0-d84867a997bb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_033216_928653_FC7F808F 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

Hello Andy.

Actually, after test it, "linux/of_gpio.h" isn't needed at all anymore.

That mean all added include in this patch aren't required.


On 04/11/2024 22:12, Mark Brown wrote:
> On Mon, Nov 04, 2024 at 09:06:26PM +0200, Andy Shevchenko wrote:
>> On Thu, Oct 31, 2024 at 12:27:25PM +0200, Andy Shevchenko wrote:
>>> Update header inclusions to follow IWYU (Include What You Use)
>>> principle.
> 
>> Hmm... I think we are waiting for somebody to Ack / review this change?
> 
> Yes.

-- 
Regards,
Alexandre

