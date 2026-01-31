Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493BAD79769
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhAmn8SRPGYqUEzDqoajMHmU7OlCrx0leJ0L/YZ6tVQ=; b=WGTUH470aDenwnPkDDv2TSdzSw
	uO+sV1Z9vkgbIcIe4TWa8xejkKApbugEZZaqO0G+YlBPySIaKqGYKbCBEqHaTjUB/lhYCDY0mbMaN
	YhqRwxyd2qTD/id1G9aTuQJ+O9cSu2W0aj80FnWIkgi0akJ/Sd+WLMmHs5YdkUxcp0haiTVg2wIyo
	jGmNtwdaXsRxsXpb96Wp/dFkrhGJuY0ECscRjhGbpfgiHSR5aSGhqKve90N9OiGkrDFL9TCFwXvSj
	vVWcaXAdtvWbQLwYevbI0jH2cKTnXliZfPmHafda2cB36YE/jNexybBkEDcJhlvb0Ubh2UqwsnSul
	G39a+zNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8fK-00000002Vpb-0K6U;
	Sat, 31 Jan 2026 10:57:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8fH-00000002VpJ-1JJs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 10:57:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-432755545fcso1913061f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 02:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769857037; x=1770461837; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VhAmn8SRPGYqUEzDqoajMHmU7OlCrx0leJ0L/YZ6tVQ=;
        b=S6LJZt2v2ZAjrHHD5G15iWArYwNIgyhJ6A/6PwoJGIF8DI9F7ZRdJnzWBFM5CpZHre
         NgO/rawDWBrmLXu++SsWHJHyltVVoEzsaFD4wyhJXd+RrMlZr06P1PXAlUFeZMK/77vg
         iwu9lNUi9piGkh+oksMyVmESXJJCegzBYvMkEDKGyJUw/ZXMWvi5CD8FMEvHTAc45a1+
         cxjDPbum8K89a1Jss2Udlj8xjRBuJy6QOruvCDu8w+g5CTA0CXQIP/TCuTDXMmc9T2f/
         lZkLT+XDEzQniQEZomAxKqCA6686g7xWbIdGNHipm5QgN+6iAWw7e0Oc88QJFoAqS250
         b7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769857037; x=1770461837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhAmn8SRPGYqUEzDqoajMHmU7OlCrx0leJ0L/YZ6tVQ=;
        b=VMCcORKMqwPE/I1oO93iLNa0tlPRP6JUi3AdTqDAwEvJDLGE+Mtkn2I0l/14O9i53q
         PyXMou7gzPPJm+1DScpi90l3OX3Be1HCywxwL2DhUCTJwxTa+tfcpztJoe7P5EaN2gae
         /7m9wV3QMXDq4GbROjp59v3U/keEchrxDMWc7M4uZOysQx9JSNO0dM4vRIk2SYJVdBZO
         lJGFrn5VAAzST4u+SIdIJp7VXIbbo8jYcaUMK/KoabLTtYQ/VkGq63M7f3xLrCI5jE7q
         HK+Y3tEk6T9S+TVl0fwN7q4g38pjXq/l0AvKFeVQcm2v87+gojqRwzg2e3ls4ieJk2lv
         fEog==
X-Forwarded-Encrypted: i=1; AJvYcCWV4fw49nV4SXgDrOvZL9W7f0vEGSBt+3GPfEQ1gVuKXdyT+ZV51JiT621ix9bbV/4y96r5Q3f6zcqyuBlvb0qB@lists.infradead.org
X-Gm-Message-State: AOJu0YyiJvrCgtTXjdXVgoiyYgQumiz+psQL/ClwA5BRwPPz/K4RYd9v
	ti60lFLGVqpNX+YWD6W2uqhGtFVNXIqippyYCu8PI66jaMXQFFo/hB2cGeaxc4ZUszM=
X-Gm-Gg: AZuq6aLxT+u52unDTi6QzBe4uFPj1smD/KHVlI4syvQkmc9Ckw82LaXTjvjCfBQG3ra
	jfUNNDKBb92KMCn4DZ8OR7W4fM9KpXuPy1nl+QhD5n5LI/Bv6xMgOjEDTEdZoLDXt+bQQd0ukFS
	yHE53L4Rfx0eRC+hEJAWEiYZ2l4VlkxkBt2yLYFXFewVWWXXYhJS22HCJU3bI1cFAhoNZtnB3LF
	835dhPPri7VSqxRaPTUl8UhfUVHcneK/6/ZeDg4OgFyZG1XaaCK5/dOQPFx8jimLcmabyHqK6CQ
	q4KMWlL4wp6jMdnbK93ZEFpvFrOr5XYAgEQkCZikstvbfy1BU0I3+AUnzHPPA+hUzADyf4Hjivk
	p1hLVvlvbAZqyX8WAS1m/nRegVh5vxeTBgIGCs/mrhgb/x9xRfB3raWOUU+Fu1KI8s8blQQQ38B
	CBOfb7B+GAuiBJud+vOhxSBuUggxMtjMutuMk=
X-Received: by 2002:a05:6000:2310:b0:435:a594:33dd with SMTP id ffacd0b85a97d-435f3aafeb2mr9320664f8f.46.1769857037212;
        Sat, 31 Jan 2026 02:57:17 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10f82aesm31437266f8f.19.2026.01.31.02.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 02:57:16 -0800 (PST)
Message-ID: <1c15207a-b378-4fd0-bc1c-5ffd430dc188@tuxon.dev>
Date: Sat, 31 Jan 2026 12:57:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/31] clk: at91: clk-smd: add support for
 clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <92f9e1fc621d30e9692f2d398372b5a862647d40.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <92f9e1fc621d30e9692f2d398372b5a862647d40.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_025719_380768_A736F2EB 
X-CRM114-Status: UNSURE (   9.80  )
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



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Add support for parent_data in smd clock drivers.
> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-smd were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With the patch description adjusted as mentioned previously:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

