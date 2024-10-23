Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39431CDDE49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gInd/ZT940rkLW7Hy40LZDK1j6KO9dt/iHtLEkODb20=; b=HresmaR8MpyLRb2HtjUYvcXPwt
	5wJ/h5TLk4t5Q8c6a+3irDYe2CKSoC2BQ3ax+FUkuIhDBjYfxGT3uvbF0Cf70QThPc0Fs0qtuk2lH
	MXubhxqXN2p6SK49IpYzv+TNwAfH1nASqOJrx1SkDkb2jkcP0Y3e72OP1ymchriVHZwcT5NqrWPVC
	xWtCjl5kAmfv4L7Ju64YxB33J7AnLD9+od9Fq8U7NU76sX8drtRsb9rRvLTWbv+humkd/qCiBPV5+
	Qo3wGADU+oH/KacN700Jp9b8G8/ZtFN1kBEzhA2euwBQNUpfiYFJX8kkrGP6t8QO1VUxboNgJ9isQ
	Vs/fYHcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YEZ-0000000DvFh-1oIm;
	Wed, 23 Oct 2024 10:04:55 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Y3V-0000000DsL7-2oAl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:53:31 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a998a5ca499so819505466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729677207; x=1730282007; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gInd/ZT940rkLW7Hy40LZDK1j6KO9dt/iHtLEkODb20=;
        b=eSsqGqmoXPstpUItbXgD37GXyvrUUQh5ndvuHIAhpucU7RVyITNltQv9NzBayj2oRb
         6ZFY2oXhKMm2SisamTnrnBM3EWuzoKCCsxmYWlTkSG6uZcWDPUBwtZvcNmcOEofuiTaM
         favrNHg3eq+xSeYTEagwi4jSMqdxGJV7IQnGT6A6EfyOygaJ9JLX1odMGehEfI6n6vQS
         3ItWa797XS1X+Yci4C59IXF5Ayc8PLi2KS+QWJ72qo+HoF0tqf6JLwwtzRCaZtTKvNkF
         yqLP1dka3yFO00XMreKJNlbE+xbxbb+mFRK0Ov4FzSaY4WKFTZzxGmV5yhN9t0s9GG2B
         hggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729677207; x=1730282007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gInd/ZT940rkLW7Hy40LZDK1j6KO9dt/iHtLEkODb20=;
        b=tobvMwuQlgjAAYIMAy0edVu8nXwtZmwjF+QCTpq/6TVkJdeuklMVH1KLtqrn0dnc4W
         /huS/tCEbWE7oDi9QbE498iQvky3tb1uwBPpFWbn9lnUi+73eXI0PmC8F9rWMKVdoAtu
         Q73KiHJHNQS88ndkcDMHulODMULGmNTOXxU6VEIknpwWbKHfonB71i9THRfpkSAThxLR
         YF5DwVQczAKbbv7EesS4SNoUFirGxiPk9QAcFBzXXpk8xIlvQk7S2dtakGWc1A9UdMsY
         oCa0L9oVomeSXCbFP4768qdhFNL0TpUAJNvE4aixsK3yGVf+1vTeFhFj7uAb7yYxcI9z
         iVOA==
X-Forwarded-Encrypted: i=1; AJvYcCVF24BAXkfYguBan2N4dS4dB181BkUy22SXCyYMb3iZwzlHTiSEDa1t1BFfFLgAHXeZOQrxKiWa/gOcdI8BZlu0@lists.infradead.org
X-Gm-Message-State: AOJu0YwmnMD6g6uNS4PvDZNUTTPwnLioSJiqFGz9U0bE/Dg6+mi6+bEQ
	zsT7Hf9wR8/7tlDt3KLWiSIeKAVq0RUNbmOWxAxsBz6TgBZ18POu5xNMOgBhF2U=
X-Google-Smtp-Source: AGHT+IGnIcL4a6Oer+hli449mELxDsnl6sHLLPt8fFrKySfMkHOlwqZ5FX2E1aHNIaTA/KyOnahWYQ==
X-Received: by 2002:a17:907:9411:b0:a99:762f:b298 with SMTP id a640c23a62f3a-a9abf94de80mr193476066b.41.1729677207496;
        Wed, 23 Oct 2024 02:53:27 -0700 (PDT)
Received: from [192.168.0.157] ([82.76.204.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d62b8sm453063466b.25.2024.10.23.02.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 02:53:27 -0700 (PDT)
Message-ID: <2941d65e-8fb4-4d5a-be4b-283de2cb3274@linaro.org>
Date: Wed, 23 Oct 2024 10:53:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: add exynos acpm driver
To: Krzysztof Kozlowski <krzk@kernel.org>, jassisinghbrar@gmail.com
Cc: alim.akhtar@samsung.com, mst@redhat.com, javierm@redhat.com,
 tzimmermann@suse.de, bartosz.golaszewski@linaro.org,
 luzmaximilian@gmail.com, sudeep.holla@arm.com, conor.dooley@microchip.com,
 bjorn@rivosinc.com, ulf.hansson@linaro.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, marcan@marcan.st, neal@gompa.dev,
 alyssa@rosenzweig.io, broonie@kernel.org, andre.draszik@linaro.org,
 willmcvicker@google.com, peter.griffin@linaro.org, kernel-team@android.com,
 vincent.guittot@linaro.org, daniel.lezcano@linaro.org
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-3-tudor.ambarus@linaro.org>
 <955530a5-ef88-4ed1-94cf-fcd48fd248b2@kernel.org>
 <d41ee8f6-9a2c-4e33-844a-e71224692133@linaro.org>
 <1ece02e6-bf78-443a-8143-a54e94dd744c@kernel.org>
 <d91109a1-532a-4b95-ad4c-3b9cf8e3dbbb@linaro.org>
 <1e76bc70-21a6-4ac7-99ea-30a7ccf387bb@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <1e76bc70-21a6-4ac7-99ea-30a7ccf387bb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_025329_751440_2653C6F8 
X-CRM114-Status: GOOD (  10.45  )
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



On 10/23/24 10:00 AM, Krzysztof Kozlowski wrote:
>>>>> I also cannot find any piece of code setting several of above, e.g. tx_base
>>>> I'm not writing any SRAM configuration fields, these fields are used to
>>>> read/retrive the channel parameters from SRAM.
>>> I meany tx_base is always 0. Where is this property set? Ever?
>> It's not zero. My assumption is it is set in the acpm firmware, but I
> Where is any assignment to this member?

In probe() you'll see that exynos_acpm->shmem is a pointer in SRAM to a
struct exynos_acpm_shmem __iomem *shmem;

Then in:

static int exynos_acpm_chans_init()
{
	struct exynos_acpm_shmem_chan __iomem *shmem_chans, *shmem_chan;
	struct exynos_acpm_shmem __iomem *shmem = exynos_acpm->shmem;
	...

	shmem_chans = exynos_acpm_get_iomem_addr(exynos_acpm->sram_base,
						 &shmem->chans);
	...
}

shmem->chans is not initialized (or tx_base). I'm using its address in
SRAM (&shmem->chans) which I then read it with readl_relaxed().

I guess one can do the same using offsetof:
shmem_chans = readl_realaxed(shmem + offsetof(struct exynos_acpm_shmem,
					      chans));

Thanks,
ta

