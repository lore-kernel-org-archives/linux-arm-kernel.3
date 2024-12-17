Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E79E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 17:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MlT5awTGC4sIGCGXK5OnleS50Xtdr2YFtm48iJlzRFw=; b=XdGUNqSRMpg0H1lsR/kfBLMEIR
	vuBk6+rWBWEYN0QTyDn8wsrqAr5KPROMHRpgq6CfqXL/tMnQAjqwyXxlIYL/jxw1hLYxMgxdmQX+3
	XQ1pfgYXfqZbObQoSNx9hFD45MGAawBPz7ePiIbXq9b6221Bs5Fk4L5Z+EyXfVx7CLaQpZ/TTqoMi
	kPAD/qfMyVx11yna9XhQq/4WkkSqy/deoHJXSxpvFNxCsNZWf8bKDIMq7nZ1WZhrHq+d1KbjfEO7o
	MW752Xbj+uokfn7WFVtdILK+adDRn/BethKapiJaFAiPjQhgB4lS0jyli8vzZENKSdqoUCzi8XXu0
	/v0xvFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbR7-0000000ELrL-3U9W;
	Tue, 17 Dec 2024 17:32:45 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbNV-0000000EL1A-3XuM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 17:29:02 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa6b4cc7270so746605766b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 09:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734456540; x=1735061340; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MlT5awTGC4sIGCGXK5OnleS50Xtdr2YFtm48iJlzRFw=;
        b=THCR9JPpmDQQQ+ZCUtN3XCVafqMaC83rx7Wo6IZKJZW0nr4CPwYZNCQ070xJhoOA/h
         50gsacJdqSnVTEiACv0xcdgh8QjQ5x8fkCq8Vh907KrodiDhr8GgERvnK5PwM4iFeB9L
         Tz5aHvg00dy4GCOHUUs0NLQ/jdyKa5HHl44PsmoiYbNYf2TKJvJIr14yMB+r/Ivhv8qh
         D1N5cDfvvZjlveayAIK626ED3TxtCrFTBjRZFCY0aBAptsLr8dZoFsy81bPS3hwr6Lkq
         zy2r6nrF3ST+nfXyYqznXjmAg7Q1q3hUR87ifzQvy24mS1o34wunc6W42xowVEYiA5JE
         xRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734456540; x=1735061340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MlT5awTGC4sIGCGXK5OnleS50Xtdr2YFtm48iJlzRFw=;
        b=wdesP21QtuBqoxCFnUbODyH4V8DWaD6iXBdhk9a4Pj1NjqebkwRXOTAd+xNz5kZgsv
         3tluBg5CzCZgRUK7AsDUGPuOMF2iXN6RCmAkHm/toYQHZyCFkZ9IAQgi29aZP1K1cD8k
         pDOShYswGY4I3wkGWMLK8q8Dz2fKozgfmqhyFifpVCKyAUWxyBx6lEDBmCsLxBO32JKk
         zn4owS3W/uMymgaEFwaA4pM/mslUFlQVE6xwNLWOZqUt3cj4S7rPKJhJ1jjyqbJsqZnf
         PhYQ3jo6jcqrHrhTUs0FXxlPh/7AFmFpG1MT2lYk8pYUSWPZWw2Hn9UkTUJ5CWWYfZxl
         HaQw==
X-Forwarded-Encrypted: i=1; AJvYcCW5+AB4RBx7zgaoQmaM+SXZUDGCtuJxbGQyC+IBxchDlxmd14kX+YBHHYDSU+aSKpm82doVsmwM8OTLi1tXX1YT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywley8ZR2o1b17YdWRV7l/pHojBKApqg2XQ68dN22s8fSS7/rIo
	uudcMDK7DPJLv2Xpx9n2P+oI7lMf3uKyLaFDJHtUEb/ZBLjFO/ew
X-Gm-Gg: ASbGncvf8QOh0J/o1GILrNjIj3JpkB0lrRWCNThXWtJDnrwlZa20xd9Gx08wPYoH9Ku
	r9PAEbT2jR7TKz2P6w50ZMro/E+X7Vp2upbB8Q3Cx+osadnIcuVSlDYETTtmQCHooNTTsocsgUC
	7yOSWwHmDYBkC8f0yoqd2XmaE70/OWtitZNgRibr9cnmbgd0MHIKx4UK4fh0zPYBXoGXYhbW9yk
	huzwGnTj/Pi2NC2TAT0gsxhL1mh2xi6I6CsFZaFqTLktS8LDkLg96d2QGH/t2jJBnZm
X-Google-Smtp-Source: AGHT+IHcp4XwIgo7xvt+0VSkrN3JB/JHOT9tNE7pzGU72V3oIVzWhQPJqUgLapq6hxpKnsF49TOc+A==
X-Received: by 2002:a05:6402:27d4:b0:5d0:d91d:c197 with SMTP id 4fb4d7f45d1cf-5d63c3db906mr42364362a12.27.1734456539501;
        Tue, 17 Dec 2024 09:28:59 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96359831sm463073966b.95.2024.12.17.09.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 09:28:59 -0800 (PST)
Message-ID: <9d7b9ee1-9b45-4892-826b-e2802adff990@gmail.com>
Date: Tue, 17 Dec 2024 19:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: samsung: Add a driver for Samsung SPEEDY host
 controller
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Maksym Holovach <nergzd@nergzd723.xyz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
 <20241212-speedy-v1-2-544ad7bcfb6a@gmail.com>
 <3c067b26-cfe8-4939-afce-5c8753767715@wanadoo.fr>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <3c067b26-cfe8-4939-afce-5c8753767715@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_092901_884894_078250D6 
X-CRM114-Status: GOOD (  21.02  )
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

Hi Christophe,

On 12/14/24 5:52 PM, Christophe JAILLET wrote:
> Le 12/12/2024 à 22:09, Markuss Broks a écrit :
>> Add a driver for Samsung SPEEDY serial bus host controller.
>> SPEEDY is a proprietary 1 wire serial bus used by Samsung
>> in various devices (usually mobile), like Samsung Galaxy
>> phones. It is usually used for connecting PMIC or various
>> other peripherals, like audio codecs or RF components.
>>
>> This bus can address at most 1MiB (4 bit device address,
>> 8 bit registers per device, 8 bit wide registers:
>> 256*256*16 = 1MiB of address space.
>
> ...
>
>> +static int _speedy_read(struct speedy_controller *speedy, u32 reg, 
>> u32 addr, u32 *val)
>> +{
>> +    int ret;
>> +    u32 cmd, int_ctl, int_status;
>> +
>> +    mutex_lock(&speedy->io_lock);
>
> All error handling paths fail to release the mutex.
> guard(mutex) would help here.

True, I didn't know that such a thing existed, thanks for the tip! :)


>
>> +
>> +    ret = speedy_fifo_reset(speedy);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_set_bits(speedy->map, SPEEDY_FIFO_CTRL,
>> +                  SPEEDY_RX_LENGTH(1) | SPEEDY_TX_LENGTH(1));
>> +    if (ret)
>> +        return ret;
>> +
>> +    cmd = SPEEDY_ACCESS_RANDOM | SPEEDY_DIRECTION_READ |
>> +          SPEEDY_DEVICE(reg) | SPEEDY_ADDRESS(addr);
>> +
>> +    int_ctl = SPEEDY_TRANSFER_DONE_EN | SPEEDY_FIFO_RX_ALMOST_FULL_EN |
>> +          SPEEDY_RX_FIFO_INT_TRAILER_EN | SPEEDY_RX_MODEBIT_ERR_EN |
>> +          SPEEDY_RX_GLITCH_ERR_EN | SPEEDY_RX_ENDBIT_ERR_EN |
>> +          SPEEDY_REMOTE_RESET_REQ_EN;
>> +
>> +    ret = speedy_int_clear(speedy);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_write(speedy->map, SPEEDY_INT_ENABLE, int_ctl);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_write(speedy->map, SPEEDY_CMD, cmd);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Wait for xfer done */
>> +    ret = regmap_read_poll_timeout(speedy->map, SPEEDY_INT_STATUS, 
>> int_status,
>> +                       int_status & SPEEDY_TRANSFER_DONE, 5000, 50000);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_read(speedy->map, SPEEDY_RX_DATA, val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = speedy_int_clear(speedy);
>> +
>> +    mutex_unlock(&speedy->io_lock);
>> +
>> +    return ret;
>> +}
>
> ...
>
>> +static int _speedy_write(struct speedy_controller *speedy, u32 reg, 
>> u32 addr, u32 val)
>> +{
>> +    int ret;
>> +    u32 cmd, int_ctl, int_status;
>> +
>> +    mutex_lock(&speedy->io_lock);
>> +
>> +    ret = speedy_fifo_reset(speedy);
>> +    if (ret)
>> +        return ret;
>
> All error handling paths fail to release the mutex.
> guard(mutex) would help here.
>
>> +
>> +    ret = regmap_set_bits(speedy->map, SPEEDY_FIFO_CTRL,
>> +                  SPEEDY_RX_LENGTH(1) | SPEEDY_TX_LENGTH(1));
>> +    if (ret)
>> +        return ret;
>> +
>> +    cmd = SPEEDY_ACCESS_RANDOM | SPEEDY_DIRECTION_WRITE |
>> +          SPEEDY_DEVICE(reg) | SPEEDY_ADDRESS(addr);
>> +
>> +    int_ctl = (SPEEDY_TRANSFER_DONE_EN |
>> +           SPEEDY_FIFO_TX_ALMOST_EMPTY_EN |
>> +           SPEEDY_TX_LINE_BUSY_ERR_EN |
>> +           SPEEDY_TX_STOPBIT_ERR_EN |
>> +           SPEEDY_REMOTE_RESET_REQ_EN);
>> +
>> +    ret = speedy_int_clear(speedy);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_write(speedy->map, SPEEDY_INT_ENABLE, int_ctl);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_write(speedy->map, SPEEDY_CMD, cmd);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_write(speedy->map, SPEEDY_TX_DATA, val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Wait for xfer done */
>> +    ret = regmap_read_poll_timeout(speedy->map, SPEEDY_INT_STATUS, 
>> int_status,
>> +                       int_status & SPEEDY_TRANSFER_DONE, 5000, 50000);
>> +    if (ret)
>> +        return ret;
>> +
>> +    speedy_int_clear(speedy);
>> +
>> +    mutex_unlock(&speedy->io_lock);
>> +
>> +    return 0;
>> +}
>
> ...
>
>> +/**
>> + * speedy_get_by_phandle() - internal get speedy device handle
>> + * @np:    pointer to OF device node of device
>> + *
>> + * Return: 0 on success, -errno otherwise
>
> On success, a handle is returned, not 0.
>
>> + */
>> +static const struct speedy_device *speedy_get_device(struct 
>> device_node *np)
>> +{
> ...
>
>> +out:
>> +    of_node_put(speedy_np);
>> +    return handle;
>> +}
>
> ...
>
>> +static int speedy_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct speedy_controller *speedy;
>> +    void __iomem *mem;
>> +    int ret;
>> +
>> +    speedy = devm_kzalloc(dev, sizeof(struct speedy_controller), 
>> GFP_KERNEL);
>> +    if (!speedy)
>> +        return -ENOMEM;
>> +
>> +    platform_set_drvdata(pdev, speedy);
>> +    speedy->pdev = pdev;
>> +
>> +    mutex_init(&speedy->io_lock);
>> +
>> +    mem = devm_platform_ioremap_resource(pdev, 0);
>> +    if (IS_ERR(mem))
>> +        return dev_err_probe(dev, PTR_ERR(mem), "Failed to ioremap 
>> memory\n");
>> +
>> +    speedy->map = devm_regmap_init_mmio(dev, mem, &speedy_map_cfg);
>> +    if (IS_ERR(speedy->map))
>> +        return dev_err_probe(dev, PTR_ERR(speedy->map), "Failed to 
>> init the regmap\n");
>> +
>> +    /* Clear any interrupt status remaining */
>> +    ret = speedy_int_clear(speedy);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Reset the controller */
>> +    ret = regmap_set_bits(speedy->map, SPEEDY_CTRL, SPEEDY_SW_RST);
>> +    if (ret)
>> +        return ret;
>> +
>> +    msleep(20);
>> +
>> +    /* Enable the hw */
>> +    ret = regmap_set_bits(speedy->map, SPEEDY_CTRL, SPEEDY_ENABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    msleep(20);
>> +
>> +    /* Probe child devices */
>> +    ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, dev);
>> +    if (ret)
>> +        dev_err(dev, "Failed to populate child devices: %d\n", ret);
>
> Could be dev_err_probe() as well, at least for consistency.


I agree, will fix in the next revision.


>
>> +
>> +    return ret;
>> +}
>
> ...
>
> CJ


- Markuss


