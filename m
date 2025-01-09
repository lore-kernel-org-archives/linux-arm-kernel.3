Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF21CE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0z9juEC+YEqySrxS6PPDAc02oimlrf77ef6rngsd1Bw=; b=wegEh3c7vE+n22iOWUXInpP/MM
	drGsiORtl6q/8+DFoL+UaL9rMa8k1t3lvXpJjMFzp692dlFClqu4rOpCawMz3K/KhUQfO6jMghwFy
	1ssjjHNXSEvTg8PdnQ8HxMEalySfPPn17rbg+g/IpCpwryoFiTS+df3JC+4bxHoUzwVM30AgGqhgK
	fbEnYwv28VGH9E1vkhBUXG5KY7xwURowXBD4AKcfhcubMk1jBkUi0GLjGpes06F/X6BZqZKrEYReu
	07Ur/qW1fNLAlJVDn9OewXh871qBk0zc08MTU19PIQ8feKDp3oDwWN/b2AlmCVI+KbKjhSHr1yE3R
	tfqNlXKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoeh-0000000BJZ7-3nIB;
	Thu, 09 Jan 2025 09:16:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoWA-0000000BHFq-0jM0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 09:07:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso4050615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 01:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736413672; x=1737018472; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0z9juEC+YEqySrxS6PPDAc02oimlrf77ef6rngsd1Bw=;
        b=eD21JdRdBnzDDrN42EPFImePFE/uvOBSOJjPXpysoTqA/agbTXnPbS1IZp0TM1xOV/
         7+dArjDfXEV7JxuqZ/hOqQfl1jAGQEqSoOizmCyZxy1NByVBBiLJzF1rwCBGiB7JjmRB
         R/vnvB/l+ZE6y2HJeck+KavY6zW9flp28Y/dHv9Kb7XN8+eHqtRBwCtGFQNIvgWRponb
         bGHzLqL3VLE4Kt7aowDsWLGIl6aKWDOeUu0t+VKMMuU3kN+NBaewbNBO8Zc4aQVmduqN
         /G6yV+AoFaXp1qOQrPIn0FIZ2lauxOOF/Ltn6BUryvXtPwXbnyN+wfMmwosYNnuCx80N
         IDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413672; x=1737018472;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0z9juEC+YEqySrxS6PPDAc02oimlrf77ef6rngsd1Bw=;
        b=SZuXEmzK8Zp9i0eQVcDYmx8tqJBTC5yfMI1N1WwxQ7h0MfjvIK4k409oZ5FSClL1rU
         0l9l0tHjT/itKey9CsaCJre7Td60ymENSdFlK8eJSGMKTyTPvOeQnOn20bgiHivgGW4U
         aAwrZ/GngZpNLaGMz8IKaQpGPm+A90WpKLvwI0YlS+KcBV4qo1oTis/yGBgIgLZ53+xH
         sS4LNt5SnwyAbpiB0LZsqhUUrR9pce9H8F/KTUgnSL7AIUT90aMfcZBceFIBwMtFTvXx
         f9px5iyKyJ/oDkgxPb5rt+dnv6gUOji6+84CYUuO1Q5ydiMulKCpajCWNplu0vYBdpLI
         vzsg==
X-Forwarded-Encrypted: i=1; AJvYcCUWD1BD8dHMOoewVhBQe03Gcpkv3CAw9JQZVBZafMLxjFGSNArJu+mP/V0e1/DyBQ+c2qtcmz3K7QVmSJ/LrVSw@lists.infradead.org
X-Gm-Message-State: AOJu0YwoOYTuQnFABNkTzLZO+TsB0qvX3VQIPUs57bbVt0F3s2VEiZHb
	2tUfFdxf2YdfRF/rZuscX5edDvL3NmuUsYJqFTOVwLDWiTXV8dJUQunxle+IsN8=
X-Gm-Gg: ASbGncs+tvUY/A0cpmUEFFUrFYFWEn9nmgnjojtTG012EwjtZEaEFfP5cHpfomR1Kv3
	cRfhR25alQmG10o162vrfddWYyqtTW5QxH0318AoWXalzE60yn/rksQbTSZ5ERPCZnPtgPCQlIr
	s9xiNkb5rKQPHnppGC1I0SeENbKVCPAogn0/l/NfG7YP/uFP2braaTz22rWz/9M6JwFwhnckAKI
	h8PXjFP+SEVgdQNDdCMojWxXGRWvpIyCSJnI9WbiUBXaBlE4DqICt4cn7aTw6MPzw==
X-Google-Smtp-Source: AGHT+IFhZW5aT/6BOpkdWIdluaAhlNSbsykRP/2gidEWNKCALvd4CcTnaBDhpgLuYHgx1FqVxmhfAA==
X-Received: by 2002:a05:600c:444a:b0:434:fe3c:c662 with SMTP id 5b1f17b1804b1-436e9d7b99cmr10865985e9.12.1736413672521;
        Thu, 09 Jan 2025 01:07:52 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38f0eesm1242682f8f.61.2025.01.09.01.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 01:07:52 -0800 (PST)
Message-ID: <680b0818-5a0a-4a98-825e-3d4dff0244bf@tuxon.dev>
Date: Thu, 9 Jan 2025 11:07:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add support for SAMA7D65
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
References: <20250107160850.120537-1-Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250107160850.120537-1-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_010754_215486_9487EAAA 
X-CRM114-Status: UNSURE (   6.82  )
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



On 07.01.2025 18:07, Ryan.Wanner@microchip.com wrote:
> Romain Sioen (2):
>   dt-bindings: ARM: at91: Document Microchip SAMA7D65 Curiosity

It was already applied from the previous version.

>   ARM: dts: microchip: add support for sama7d65_curiosity board

Applied to at91-dt, thanks!

> 
> Ryan Wanner (1):
>   ARM: dts: microchip: add sama7d65 SoC DT

Applied to at91-dt, thanks!


BTW, if I'm not wrong you lost the MFD patch on this version.

