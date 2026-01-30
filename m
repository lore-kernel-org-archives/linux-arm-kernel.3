Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F3CD49C65
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 07:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLB8sjSeOChOeJ847YsoxZIIrknXx/zBdsFz+HRbeUE=; b=VJy+52/4dhQhhXeMXi1efr7sQL
	QI2jEx206W+QvX+ScFL1JB/O4cFyBqqaGdY336XmEEtVQFoOCwGROe0i+Mwet5q4GKUQ0XZJZlA6n
	+6RwYy3pRE+jeTWNob3nX/MogdjEsFVmwUAqXx5c3Zi2q8Hxn9SPmGq9sHmJro0bJd9QeanKXtjW6
	pNmhFUxiyggMS/RkDerWxH+Sv6tQEDCaAgKBfMRkKPnivI3UZsOhxQW6Y32JRgy9zCTSEGk0/ReD+
	jLAfeF7z2axTT0tiCuwbpqDIseVk+mxWJttrp5vH3dAhcuZ/bs8M3r2P/nkPAio5l+2pvGt3UgooA
	Cl5XJP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlior-000000018nE-0zFk;
	Fri, 30 Jan 2026 07:21:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlioj-000000018kw-2UCn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 07:21:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47edffe5540so21840945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 23:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769757680; x=1770362480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLB8sjSeOChOeJ847YsoxZIIrknXx/zBdsFz+HRbeUE=;
        b=qXrHe5v90NyHBT3orVbpo/ACoy8rDS63TIMjQROuJnqQyb1TfQJXsauy0WVDoDe/Ne
         2/w6Al2Yjoa6/JekiiXA3xCRiPGwv/00AVmlxqJjePTF5UN0MFGtK6kEOxQhPM7dEP94
         NO1llh8nBVXNiuNOmDVI0fnsuqn3RdD1xH3caAl50thQVS3luw7yd4uq3HHcKYSNEAw3
         WdX9fLf24GvgGlH7E0Is8IHjSAhWWe1iukkcGgDvnPzyVQTdv5e1JJq/AQ+XEWV+/4UA
         nlA3+ciG7DZu6ThWoFCERoiyyP1l/F8JXpYZAt0LMezqXBSOtYNzghVUuD+U7CVmWYKm
         jbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769757680; x=1770362480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLB8sjSeOChOeJ847YsoxZIIrknXx/zBdsFz+HRbeUE=;
        b=Tx8gigITFdYC5nxEa8NkJCogTJCpwlThf6utmSQRvT3FTT0A1Yke5qKav5Dpst7hS/
         KvXvrfMUaMW/r5FDUXEYNOg/4tX5peZpa4VUT+HObGm8v/yM0F3fNPBvV9Eekla2tbva
         smJLTd18WaOolpnpMBXj9+EIe2qXZ8piBJW3RN7Oj8Fft/rkYxlZtsIVAiqKOvwERQN4
         S6Va955VsXaxt6IGqGYLygOQatYkg4OJu63e17yuWNDEAGwQJEYg18hZ/INvUbSrBjCj
         +Zot5FnuTaoyqLPChOvZrDuBsS/N81MYab1P+VAwoUmOT3yYu46Ye0ouhuMub9JTw1MO
         M7cw==
X-Forwarded-Encrypted: i=1; AJvYcCVvjWKgM9NxJ/Fzr7PXbvuFkzYPGdSZ/VrO0IW/YbO7+SisqfOL0EaA1ClI3BQqyOn/7K/iWyNDViSNs82vXB8q@lists.infradead.org
X-Gm-Message-State: AOJu0YyIQEUsVq7ItJMUjlmCdrn0cdPi7Adwfiw9GimZVKCTJa1HmHxW
	tRdxp1qE9RVE6OmR+lTMQ6OJm+lGFqDOrUo4YJPpb5Iv+RiQpi0U87uCEgUsxTyJHnU=
X-Gm-Gg: AZuq6aJx1wRdd/N3JfAq5lO52aaP1fclaWbSrB7ivWYTEWnjew6oe1ZRGzEcml/a5NH
	um0MxiYCYVftw5JzXmjj8qTeuWWjPkLijcizH+a+C4Q1+YeoFbGwbd1IFfn8vj02wedXZ3eBHVo
	rqefV016NXxaQQ4s8qtnBiQ+REFD++hfuxKBHF0vcBDXF/kphndknnNPt7hVelwyoF7ien79FhR
	UKqHp2KNZjz5yD7ipNdhjyZ8gw2MmAp6dUNz7Qa6kiieYIGvOn2O7W8cUuQPXjm6y9Rv2r+8b1r
	QFVo2P9FV6hxMSQ4epH3bZEbyBtygjy0RKPcccdMLRycuvRy4x6t0U8n/4hWfXW8xhN1i1eXqOS
	LPJWTdqCltW0vwU6rexpm7gSRl6I0pf37faQMk2OBR2jdj/gINgV+fXJy26/pFBOd6Z2+ifpeF9
	je+/n0IwtUsbhmROImww==
X-Received: by 2002:a05:6000:1a8d:b0:435:db9b:5883 with SMTP id ffacd0b85a97d-435f3a820f0mr2452805f8f.2.1769757679666;
        Thu, 29 Jan 2026 23:21:19 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132303fsm20672631f8f.36.2026.01.29.23.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 23:21:19 -0800 (PST)
Message-ID: <8c6b0e2b-7209-4030-a415-c68fcf8e94c3@tuxon.dev>
Date: Fri, 30 Jan 2026 09:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/31] clk: at91: clk-audio-pll: add support for
 parent_hw
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <7b75764e380508c6c2c11a405bda60a801e2f494.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <7b75764e380508c6c2c11a405bda60a801e2f494.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_232121_654402_C321F721 
X-CRM114-Status: GOOD (  10.44  )
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
> Add support for parent_hw in audio pll clock drivers.
> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.

Same here as in patch 14/31.

> 
> All the SoC based drivers that rely on clk-audio-pll were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

The rest LGTM. With the patch description adjusted:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


