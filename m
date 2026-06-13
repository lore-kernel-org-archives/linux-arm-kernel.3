Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF49CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 12:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBEHkzqVLw482vGdz5GT4uuKqoZ91h8lkYDukdrN6Gk=; b=bTxTDbfWagnfwcGEqhjW+0Q4ec
	OhSuE+a8tz5WS+Nx5qGdiUoqo8MWhglLp7aYURoAlcjQ7MPQHeLK6ZNzGtD9et4KWodjbem5OyUHT
	UkDLvaZCnO1tgRCe5rcEHA2KU4EsEMX387/PqxpuHYq3enm59xBXo4sSkyJoTqkRSjMkz9uuOL0bM
	4iF97TSXi96hATPA7ILZi+l7Ims+fZaOF8di2eTarn3YRmmH01mfr0ddWoKrpfhHeCt89JqjxKHDX
	Uz0vNjLEipzlTBtelVhJcgJrYQ88856jD00De9fjMKCTzrYe8YfFS+i95RAwr1294gmnD3nHfMtTk
	/8HO3d5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYMAe-0000000CDck-0nkF;
	Sat, 13 Jun 2026 11:05:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYMAc-0000000CDc0-1759
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 11:04:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490b9318997so13078025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 04:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781348696; x=1781953496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBEHkzqVLw482vGdz5GT4uuKqoZ91h8lkYDukdrN6Gk=;
        b=AD64WDj8jSsX/ZVa6yfFTQcln7zn8a2YKqozn5gJeM1x9M62CFDgXAEsQKdZhj7cfE
         UGmv08aDl/r8U0lz+EUzHaU8EYRaEAy45yhckeTSPuBlejA9Zbgxe03CiG5UyEbNXlyi
         0Bz7Ke/4w6rGu5XvqWpXsGTJo4IH9Pa+oudFQA25G9kqlIyia8e64rII8jn74ordJs8G
         63xowiJ1wQ7a9K3xXBS8JX9FdH18nUQ1OarB1+UKum5cya6xXADjyj3e56qvoC7fpqdc
         g6hYLQNdcpUecaXaxuR49ASjD8NC7SnIHYPm65YP52dG0sEZlDXG13h0aVJkr9ant+V4
         r5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781348696; x=1781953496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nBEHkzqVLw482vGdz5GT4uuKqoZ91h8lkYDukdrN6Gk=;
        b=CMlleeWjhgTHiiwv/jCDPT2GliVZCD/d8AEBb5n6I1iueN6kzQWKoHOFMFXPyZYXVT
         Of9Gg2YILUs1eLgKULW0Gg3Wz4jTCz5Zv903lUX1ZEaiXoGzDzGX0DHPJeSTt1t0fqdV
         59ckv3rultNYWz2bhq5jjuL1hoyl8d+pGR+EtR45+/RJGESGfNTSy3M5rRPgUXj0oLMM
         +Viu7K+6TqLbcufjMSZ77JmxENq/vWwRxe3WV8Ouhnvifkos0ZXHgVcY57dBVun/jQMH
         NI2kQ3ENZzWnAfnr4zReFIYaOXqzGX1dBoxS3X9F3y70Nc5sm6b5QYM7E1ho5Q5a6h6H
         fiGg==
X-Forwarded-Encrypted: i=1; AFNElJ/TxGIdeAOTN7pkTSs47rBVJWNLLjEoCh5LunqQw1ag3zwiSJj4P6XUXll3Tp4Y20jGRd0NYdbLV041sZcRSAtK@lists.infradead.org
X-Gm-Message-State: AOJu0YwdqQBf89ZrMvjcRisQvR/souVhQcCT8y8kjd4rT8NAqQUYjDcJ
	sfVo/PZFhFHYiEomUF4/pnzMfqSvxeEnLkB4ldOPTjFqnZiBMWi+pHV3
X-Gm-Gg: Acq92OE3UhtKDcZc3wwcv+Y+2Qc6/EG0BwwywMbievHpIkuw8XlW8JwnV2GsQXnLgh6
	UE4yy35hX3Su1TP9tKOEr7JKhkOXRshiO5hL4aAgd6EXEwcUhBEDae1LqMK/BdhEVKWEvYgf4HQ
	tA0YyUKAMWXc3ycqP/Yeog8QV6Rq08IPY5qYy0H3NiSXjXQ4DRmINsii2cO0pdBeH0tR5JxtqWq
	mDYWZk5Fap6dKtmcGFyVxbSGEgzuD6VddGIjnvOhOEXgG/+TvYnmuyU2WH2N8XftM0orNGrVjmn
	bXcpQA5Ph0+/04AH3OwKlHkTLZ5Y9F9IJ0Uw8Pz7nynhtWiafu2o20D5ck8h9Eq4cn60W4SKgl5
	PRTV0oUC751OUQMSzZhHUwIXcfygWCzmnwT+Ku4tmLzxoABV8NR1pvuCZLyDSoYq0Wp4OfgRIZ2
	C9fx9zWqjUbEbBkQOu32pDwFpOm3HSynAHp9jmA5/dwtHh
X-Received: by 2002:a7b:c8ca:0:b0:490:6237:521d with SMTP id 5b1f17b1804b1-49220092e7dmr27202205e9.13.1781348696232;
        Sat, 13 Jun 2026 04:04:56 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49220310a58sm75036335e9.4.2026.06.13.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 04:04:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>,
 Lukas Schmid <lukas.schmid@netcube.li>
Cc: Lukas Schmid <lukas.schmid@netcube.li>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/3] ARM: dts: sunxi: add support for NetCube Systems OpenNMC
 (dobermann)
Date: Sat, 13 Jun 2026 13:04:54 +0200
Message-ID: <sTX6E5Y2SsWfe6WORpTiCA@gmail.com>
In-Reply-To: <20260606205452.2386930-4-lukas.schmid@netcube.li>
References: <20260606205452.2386930-1-lukas.schmid@netcube.li>
 <20260606205452.2386930-4-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_040458_309922_0AC8CEC9 
X-CRM114-Status: UNSURE (   9.99  )
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

Dne sobota, 6. junij 2026 ob 22:54:43 Srednjeevropski poletni =C4=8Das je L=
ukas Schmid napisal(a):
> NetCube Systems OpenNMC is an open replacement for APC SmartSlot Manageme=
nt
> Cards. It is based on the Nagami System-on-Module. It breaks out the
> following interfaces:
>=20
> - 10/100 Mbps Ethernet
> - USB Type-C OTG using a TUSB320 (usb0)
> - USB Type-C Console Port using a CH340 (uart3)
> - USB Type-A Host with internal CH334 USB-Hub (usb1)
> - MicroSD Slot with Card-Detect (mmc0)
> - WiFi/Bluetooth using the modules built-in ESP32
> - SmartSlot serial interface (uart4)
> - DS3232 RTC with CR1220 Battery Backup
> - Extension connector providing SPI,I2C,USB,CAN,UART for future use.
>=20
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>

DT Check passes, so:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



