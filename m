Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F943CDE022
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+4VXmKc8GdqsVqjC4o+a1rY7ncy6Vgm0Q7gfsgW7BY=; b=YwlodhKi8HbsBpuq6Brq+7Bzv9
	Q83clVZCOB/+dVSs2OrKE0RhgUh0AOAN/tz2ybmcZqwMWqTA6sVowcEwS3dSwpDrsikJgIaPZBHsK
	PN1iA8JFU6GMLNVWklO1u0h6PWPu5OOVanj7eeL2/IY5uqSPG+o6vKcf+RSnI9iBt29Go2p13FbW6
	XFE39hRQT14IKKC3ZD0/zy8sZjl3EG54ZObg3+J7zdi8PGNBR4AaU/v4e3K0GJ5xgezqVhicetBxF
	JRTvA/vYdKuRzVxInDagesBYJHNW64vXrzfDRdKzLTtfEVBdWDAs2DXuPFkKABJCPVfVXCN56LyXM
	0dQXvhSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsjg-0000000CBUR-3shT;
	Fri, 14 Nov 2025 12:17:04 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsje-0000000CBTB-2hVx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 12:17:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47755de027eso14331165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 04:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763122620; x=1763727420; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5+4VXmKc8GdqsVqjC4o+a1rY7ncy6Vgm0Q7gfsgW7BY=;
        b=PyN6rJXE8TObbkm3ZkTkwyiKqie5J2qoNnsicbvG95w8sBiLHlA2hFWztuvIIMzyQ+
         Yrk7EqhaQHiQdei3uKhxIDHG3qsEho8Ufm2g5Q7p6OcCnV2yOx2LYZr71PKfd5KWDBRJ
         P+4HEfkMpm5ge+ZkXYSucZbdVcwg/wWXqKZelqgRtrdnXvP4zkq7/xBo36ufUV9f0yLp
         3sxeWpvsqBWrckT4GhzeDX6l9yo+dzzLs790r4+JSNfiOyTISpcEx7wbKIH2R2B/+Fzo
         oYbM20D6Oob1/xsjmqjIcKL4wkze0N3USalTLw3jKbP7ZlrQJT0rZDczX2xDRCeCerTM
         ejFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763122620; x=1763727420;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+4VXmKc8GdqsVqjC4o+a1rY7ncy6Vgm0Q7gfsgW7BY=;
        b=KIDoZEQKli+wgN1XEBF8rlbFBW7XDHQ83NYWg0nreyJcbuo9Ff87Nrb50ZNIORBxxm
         FQZw26Z/tuno8XBBu57QKVROpqx8iFh47KU16wOuKyfcmq6Ure4k2Gf3HiWFq6wl6NWR
         MtTZvfCWkE7rUjU2o0Be24xWL+ecn20unk+lyaRIcfY7JBxC1Dc1nAqabkcbrzSZm/y0
         LK/GnSXFoOBUaETmEAirrF+HpCSigIcZ9MBaxjT1L8oGh968gfgoIPStxYq8JQwaoIzG
         A7QY/rEzyu1oMAv6yWbQGyQGJeyagHh5IsWG8HM1lu825PMD/GEDBO54tO8inHlscRPT
         lOhg==
X-Gm-Message-State: AOJu0Yx1oiKgySWqdvZWtE8aF05W8r1ITv59POC/mW8kihb2elKFEWra
	74hz6cUYtRlzf8BNjEE9N61m8rjo1Glbpz0VS7p9Gr3zIT+bzJfcLRJSRHVHbQXZL7A=
X-Gm-Gg: ASbGncseRQDmrm5707rw/0MsFC03Q9Vv8q+d1MrdwJUU1E/F5qrOpKA/9nwCmgBUsTE
	4ks6uBB0iIFb7pBi+SSvIO2g3R/mq7Dz9PZo6VJcpv018pLfkX02LUDYZ75k1laClGqwjDdstY7
	VpXjpz8w1npw+ZTOFOMf9W/plHZ/SaWBIBVYwHOCv78750ixZUul49i5BlaI1jAUEfdVc+7hfbE
	gv28Sz0sYKg2NV4kpfK5RbZudBZ01f2E+YtmHsOmhW50ZVbg3T5EGlMX/RBoGx/Gvls+/SSun4f
	M4PDcZTRgTChi2K6rWYExUYH14GPHiMnWDz9RhIqTzp3mV9BY5/60kMLa5PXm+7Q84BmV2MFTMs
	MuJGVXeS+yc2lcFMwdVPAzyUzPlV9HFcegSqsqEHAjOPC1COXjC0Jybna3OtGQdDjCo65wJ4Mu/
	nPgdq2dmiC61t9V3T8Vak=
X-Google-Smtp-Source: AGHT+IG7ua9Hd9WJN68PNypvCmNCiC8BHy/cDb9A4Sd0TasdV61HLLe0O8GuCtGCcmhOWbH2k/1f5Q==
X-Received: by 2002:a05:600c:6289:b0:46e:3d41:6001 with SMTP id 5b1f17b1804b1-4778fe8cae9mr29819225e9.34.1763122620367;
        Fri, 14 Nov 2025 04:17:00 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e95327sm138949845e9.12.2025.11.14.04.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 04:16:59 -0800 (PST)
Message-ID: <5d2826ee-ab27-402e-93b9-f0fde31907bc@tuxon.dev>
Date: Fri, 14 Nov 2025 14:16:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: microchip: sama7d65: fix uart fifo size to
 32
To: nicolas.ferre@microchip.com,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ryan Wanner <ryan.wanner@microchip.com>,
 Cristian Birsan <cristian.birsan@microchip.com>, stable@vger.kernel.org
References: <20251114103313.20220-1-nicolas.ferre@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251114103313.20220-1-nicolas.ferre@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_041702_688983_89D6D746 
X-CRM114-Status: UNSURE (   8.38  )
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



On 11/14/25 12:33, nicolas.ferre@microchip.com wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> On some flexcom nodes related to uart, the fifo sizes were wrong: fix
> them to 32 data.  Note that product datasheet is being reviewed to fix
> inconsistency, but this value is validated by product's designers.
> 
> Fixes: 261dcfad1b59 ("ARM: dts: microchip: add sama7d65 SoC DT")
> Fixes: b51e4aea3ecf ("ARM: dts: microchip: sama7d65: Add FLEXCOMs to sama7d65 SoC")
> Cc: <stable@vger.kernel.org> # 6.16+
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Applied to at91-dt, thanks!

