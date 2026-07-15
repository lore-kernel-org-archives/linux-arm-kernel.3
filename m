Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F094C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 00:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51zK9CQAvxuMhMqwfTMeRUV9N2ZjY5sEn4e6pxRjvmM=; b=oAMmTiL6N67S1tjFyozeKEB9u7
	XXI75oZ9xGKlQ+ByvAIQG69X+bhV15y3mB4glzqWBa+3KNnv/7IrlVzA8BUjAa2ucYYI8c4+UsFqC
	HUVMdPkg0XXz3/OhjE5ERG4+cpBiQ2pm2ZW03NojmNhmavsmJQ/R9Xi2sByqf1HUEBv27nb4Dk/y+
	F4tBnhxC92HZzq+W2niWRWXa19X0NF3MYG4i3mX9m1xwLHjwJHGPax7+TwWDZ53M1H5HUplCG5wmy
	nRFx5TntQXHCat488W/OPhDerbj2nrLh/k8a14hiyV9RXy1SIwHjjm8h0zEwhgREhP4OlOtJYA7s/
	nqCaOgFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnuX-0000000DWTU-2Cyn;
	Wed, 15 Jul 2026 00:55:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnuU-0000000DWT5-34bY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 00:55:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so44258425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784076937; x=1784681737; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51zK9CQAvxuMhMqwfTMeRUV9N2ZjY5sEn4e6pxRjvmM=;
        b=QpLFkjU7h8qMr3/eLom8QDXQEAkRMhhMFFZPJYU9dU6vnwPTjnjtAtMJua+g8fu4By
         7L7lkVtYSSwcSLgt8HqYbrkmE1/HTE+YcNbcz+P9nKnB70yrL//cjuLVUGpXIMlngJzo
         laAVpms+9p8AFdZS1C7PY/FhFwOVQM/uFVdx/95wYzkSxwPfcyB6lBdKuF0k/IKyMCIO
         m1SRXVW0RGE1NjYQSBc7Q+JC1rH+onplU78X4QD93ziV7Uail7Lo4Ph+LRF3DCnqWxHM
         nCTV8aiDinqjrGQy/afHzWMIIsunmqFp9IaJ1e6gi0l9MMbgKO61okoMh62qVOSHHhlu
         HsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784076937; x=1784681737;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51zK9CQAvxuMhMqwfTMeRUV9N2ZjY5sEn4e6pxRjvmM=;
        b=WRzYit8fm12y6w14Rg6QPh4opKXmizhUSiN4KpjAAhHm18D0DThHmVGbdBvJZHtuu0
         Mf9rZADExW4iNV8tkT3HkLr+yzf8p/EKYGn0kznGQWz6d+TH/i1rGsbm6l9C1y6louZO
         ZtkUgvfVUHqTCQ2BSo4X3z//MUaJharQyKOEkdXYpbiWXW7rl5CR5g1NXG1OzIVlHl+Z
         YXIBf/UxU3mvQLg8idgwAzHMNbaFQTIwKc+DtLZDG6Apjn/Z7PugBBgnJCuFlbRjpXJY
         dPpuHHJF1P+lJQJM/kDZOvshqh/2MRTn/CrUtJlpk7+qyHwk2mTnipjJlD1mhM16s59M
         0EqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rov5R5CRKQydSvHD89ZDtgAJ2VnZszd7ihoWYoRqbkKds/Qh0JTZrwqCtp3C+V3yS1LlA0v+/GeWMVa8Cjc9bS2@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu98NL2L3K85b3Ajjn09A1e6byB0u10xMt9ZV5HQWI8Po0UbDF
	5glL77veNXF63hj23jCd16W3WEpItY8RrozMrGEUQe+iWBKu5AmFdMEU
X-Gm-Gg: AfdE7cl+LQ/4mY9pPE4esenA7lv+wakxIDDBnamTrBsQP0IP3SPCG9ShTGMPwgA1WJT
	4Jb6VFkliow7/eg/neavfLwOwZKxWzwaONDBGiVEupfgxY+HWMHRf0T4WBM57644gzDtIloo32u
	cz2sZrf4G3GB7NjRNxwP9KGKYUh3IYLg5QS3y59K18fnUivvsIc/RTj58Gnnx3FNuATdFbUkPyN
	D0Gd7RY6UBXuCCUJjZrVBAeYmnjL6DF/JfEVgIdx3SRUjKiGVcqFxDMr67UJq29C9gr5PpQpK6e
	QlFlW0gfTx9iZrC3lKHg4FkpCAYrWEv6YqwNMXF8zd0xESxKhfyfXGQX3iSbhHZYTc6cTP+7suJ
	wczFD+zwoXrgCLt+Q2ZIBP3ADR/GiJbYUI7CTerOl7eNzPMRGvZMkWG9vsqJs/uPicFXmWHQGjc
	NZpc39v3IVTfhgSQLYz6Tme1RflTvbMqGRYsD3BpvVbsjqt7SCxNOTSk3osxEImvbx
X-Received: by 2002:a17:903:2411:b0:2ca:53e1:b915 with SMTP id d9443c01a7336-2cef11ca8e3mr49241575ad.14.1784076937182;
        Tue, 14 Jul 2026 17:55:37 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb86bsm125057185ad.11.2026.07.14.17.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 17:55:36 -0700 (PDT)
Message-ID: <a883910f-b4c6-4ba3-b286-081dfc772f7a@gmail.com>
Date: Wed, 15 Jul 2026 08:55:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
 <20260713081127.115197-3-cwweng.linux@gmail.com> <alYqhghiVxVW2vQu@monoceros>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <alYqhghiVxVW2vQu@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_175538_781243_6C2FB4B8 
X-CRM114-Status: UNSURE (   7.18  )
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

Hi Uwe,

Thank you for the review.

 > Please rely on <linux/platform_device.h> to provide of_device_id and
 > drop the include for <linux/mod_devicetable.h>.

Will do. I will drop the explicit linux/mod_devicetable.h include in the
next revision and rely on linux/platform_device.h instead.

Best regards,
Chi-Wen

