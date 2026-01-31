Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF247D7976C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZemSK0/0LuKdd+h8/xFopjdq8nFilP6S5QwqNfMT2g=; b=MhSkE+D9L4Mn6K/NXNNFSwEdF1
	y/hd1AehkSMsdxrYmHRjPT2b1UZYB5/Tkwy7YVcq4m6mS9P/UN9UP7eSPMapmq7QOciGMH9xmkNQg
	gTPGLEbaDmVHUM/p6zBp71EvM0u9CrEsetNK9iT2Hs2ilpqJtSA/CaLYPU7ZXKH272E3FC0e9tvpG
	KX0JGp9koeM9nsFE4b9hhB0o+ISZodbQStQQiA7fMFGd0xNYqRmPUUbBe2/nO2lv3oAgJW6UGS7Wa
	NtBs+ro+UZw771umzBqPLr7jwpcPxB5iaivMwW94SQHFCCs3M25flFQbGsH6u1D7EisoinrQQmKAt
	8X/4/JIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBwI-00000002hRT-2cH9;
	Sat, 31 Jan 2026 14:27:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBwF-00000002hQu-2twP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 14:27:05 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso27609745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 06:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769869622; x=1770474422; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IZemSK0/0LuKdd+h8/xFopjdq8nFilP6S5QwqNfMT2g=;
        b=T1O0ufx5I8rgtrIXx+MjLsnSwPxZvS2qZpARxS4CgrnNsHisk0Zj0GP4zsm3Ogbsju
         NgkbLY4JLrEX6qVO8ctqoBQYuZo1m3rXMoDMdfn73+T5KjFco0/YoItD7BNP7cT+hn4m
         lEhUF036MOyPA4M4c26TmA0g9pwbM/SQtVeLi3MmjJu3csdQoQFBlLN9ygO7LbnD/tO8
         5wAXV3GmPbLNKX/fIBovea/BbQVXhPk7F97m0rVrvXqdADqHMEM26TO+JsbRbQYMCayU
         yEsjK3atcuSWQnJaVNHSzc9e51oaI1j42F/vSA5wCfSCCsUimQS6t2KmF+va1mIB2XeJ
         9/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769869622; x=1770474422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZemSK0/0LuKdd+h8/xFopjdq8nFilP6S5QwqNfMT2g=;
        b=Vxan+Z+B7fucL3hIqpQEOTvzPd4A7lDg5brV6IxDTTmA81dsRH6FGNzzipKhSKYNEj
         ehvAghooZZsU6V/hNAXQTJ0rg1iztWPXhCCgAspGz479WWv8IY14hC5yrlPfqZqW2cPb
         2JBS+ZjC+871IGv6l4FspstE2Wr7z+OockkiheRRu9kw/5Zm+t9w8SWkXfvM7uRnlF67
         kjH+4PMgyBqzlJKrlV2uyOd50g24D87H0oyUGkUgP+SUfo6fFx3l/wT7nCJRCQNPddTv
         lOrW0I779KQxwcNf1J+Z7Ua05WSo+rxewgN/9hX3hDnqk8VzZ/mWpNcEmfDx4Wi3JA0J
         /WrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw2BGsCYqTkiepgUR4SlTz1mUbAVhpHykwmpKOZoP0VMJ+1QHZ0ypSyQR3M67rbWuRfhUGoWXP1vMLU1Tg6Kc7@lists.infradead.org
X-Gm-Message-State: AOJu0YzpnONw5dqzg2l5X8Kr8hrKgIFGpHObdbjCQFAvMdp8FeTbvIcX
	blc285YDHU2UjeYHtfFyhxhTbN1iKwUYJ2I4qbmCfl6aOeZqPyhfcIIKnfK2xkSy18I=
X-Gm-Gg: AZuq6aLoEuxAKoLwB9gxNqEdYQGu5Ido6Bd9flWZpEMTPoJ37RtWULtVBUkRaqciBsp
	mDbG4T98YA2fQfaxcClm468X4HYCmnVolFlAeZmua/MkycTFpZcnMP0TGMWjtuGQpJxF9U94MwL
	saKCWt7BAC251ghFywS0Wb4FQoVG5ES3KcMZrCd3BeJGy7UrL1/8ODFy/dI1j6pkMUJ14pQl2PB
	G3KY++wNUkwjiNqy86uiZWV9eE+b2AibLhYd1gCyQHINN/dnDBiYMomaO5/i9xsYiNtAR7O37Wr
	TklUy7LPwZcaIIGlVXrV968vAFjLwx3qd0jK8hAFoFcjbtAfUuBSIxUf/tIgtwLiTOL9SF3hffb
	C50iM21/WmwxRrylG41NbBLQK9BOBsxkO3cTafhHibTbLW6SgGDeKt01bVztk60AtDVS1NjTPFV
	WnUfLLswHXRrKXR409DA==
X-Received: by 2002:a05:600c:6088:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-482db45bc1bmr73362655e9.10.1769869621777;
        Sat, 31 Jan 2026 06:27:01 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e267aad1sm39377375e9.15.2026.01.31.06.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:27:01 -0800 (PST)
Message-ID: <ea33dd99-02f3-47fd-ba78-b1988b4d3911@tuxon.dev>
Date: Sat, 31 Jan 2026 16:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/31] clk: at91: pmc: Move macro to header file
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <ab320688cf0f527089254eeb242acbb87569c509.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ab320688cf0f527089254eeb242acbb87569c509.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_062703_744434_7A77682A 
X-CRM114-Status: UNSURE (   6.25  )
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



On 1/16/26 22:06, ryan.wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Move this macro to the header file as it is used by more than one driver

Please specify which macro.

> file.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

With that addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

