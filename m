Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C12CD232C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 07:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Djq69/IfpNbi13Trd00do8aZArSzaG1DXJ4ggAQuZj8=; b=VN6hC621iZtufnUoHvSyLz+tsj
	OZt/3eDwCsVylrHcEAvPuMX5NEBPejU7ficKlM8AvZam9MoXHraZNkdvWiTItbfePSNL3it3oouLV
	95fLKakV6am5QkW5jxpWcvw3kxYCPfTkO44ocwjmamTCfbQkSHuIgAMLjU9fOYDYFjrVzJUWzUkL7
	DGTO5oq3rfnUMJNBj7sNyczqoCmqdSu24f4Fxme7BxJF+e6vLdbFzA3bpNeC+kEFGPyoUtfjHwjZ4
	bY20FoOBwq+SMiM5LlnVXdvC8AnMcVGZysKnOXGi2ekKEZoNJuN/gWSs2BXQiXopz7tqvTLFYijCZ
	Mnt6aleQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6Vy-00000001eVX-017i;
	Fri, 09 Jan 2026 07:02:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6Vv-00000001eUr-32XS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 07:02:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4775895d69cso19464875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 23:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767942146; x=1768546946; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Djq69/IfpNbi13Trd00do8aZArSzaG1DXJ4ggAQuZj8=;
        b=SMYpnr0mNiCFgOLYELUHnnth5FEDVJS4UcHdQxHjViuYhxunv60OwfzVb/BZhKX48y
         EoX776PBaAiY+zzFVVSJhrQxrPWfNhPR41sDuj+PAShpsItfpxbcFAYsdHNDarx/LFN0
         6/OkbP3/5nA3SEaODHlQydT/Q5s2QKCylLSv+y/UqXuCA0W0G+zo2Vzbz1qXncLpnaeO
         xxbMcMDIEAuiXYEurvoVEX+HNwlxZZ5f0UVXKeucZ3GE2QJ7UXNQscwGA78Xn4tWMW8i
         97/MqdK0JE+IheM+xF7t6jro22kukt6pMQHd8Ksxu7FpM33iztChovsRKs8TId7nSbB3
         OxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767942146; x=1768546946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Djq69/IfpNbi13Trd00do8aZArSzaG1DXJ4ggAQuZj8=;
        b=sCGQZgZzcQ4DVGOyvT10wjUC0ItIrSHVBfAONUPOVnGq5wvprsUWenzq4iuYlLjAgo
         rOben6lpTYri3vcA6PViaH4iRUrvfIuUOnFWILOCw953c3dxoK1KrT5bdeH3vH5GyqQ1
         bz9N42g/cmawnLhgodUGsKyYb9iY+RhMNXn86f70EMqZm90C4KC0oyi52A9SPmIZ/Cxb
         /SzG9AXHkL0YyYCwQa3r5p12Ip5vC1QctMZc8qgHoX0dwTTJc7C6SCtSq5JhSeG/YXmq
         XKc0AoTOam+oEyEG6D+QyasMK1EAQrUkQzA5JVlZtSi+IiY1YrXfGTT4xuw3jmDn2a+x
         2UdA==
X-Forwarded-Encrypted: i=1; AJvYcCWLJFnPeeA5wPRVzxJQTI8tQtsxVyLjbXJle7ro4PlSUnTsxoiMOLmYAYXzGr+ueTZHtl0nBubKmrTmJMYfVp0C@lists.infradead.org
X-Gm-Message-State: AOJu0YxP+IepmBjXYibhLVhIlzLP6EWpc0AXHa+49Cmcs0+h3I9jEjEv
	jbmxuwDaqcftG2ykGtPj1+dCsHq8g793XkEi7+BuwTe+FaQbNbw3TwiSFlANfxL87kA=
X-Gm-Gg: AY/fxX4/+IAUA4qXc1iOJQ5fCzE3EsVKPHA7dhrLxbhQ+xvH/O7rMh6YUCYoaXtIucZ
	Zy4OY2F3juoGmj9MFmKntOQMoyMCQhonJdBgx+GoVEqE73iyGmgdifOfLKZwiWUvwzwbTkr2VXi
	YnrajIqk5EfLpnzy4bkB+nnbNA/43icRKnK5MAY2ziPZco69hc8rtY6ah1FzTI9goW8YACjXFfJ
	sPetG5iNy2641esk5cSC6PdKMqjO42o4HjMg8dYCFYzxT2lmqJc+giU0NxorhZzjWQDlPDrEzaO
	LFQ6owo343zgv33ssVCVqCj20s60eFXvUa6qBB/XYQ9AxHi4K3a9z5JNrdBq3pDt12Viyqos4Vo
	zLn57vZzIHxOaBaiVk2w9nWq/mOUVoCtodynE0bXeSMwmjKdwzJaRKj7bF64VNZ6M8HltM1fo7p
	B3qkj2ITBIZaf/Z54c7w==
X-Google-Smtp-Source: AGHT+IHqrCO4ACOl8IeS4zYYIPt3TSbstyJpnkZyJxTMBnFPv8IiqMVaH2HLdD1YiIdV/bwDrk6+hw==
X-Received: by 2002:a05:600d:6445:20b0:479:3a86:dc1d with SMTP id 5b1f17b1804b1-47d8e4a3c68mr29109845e9.37.1767942145246;
        Thu, 08 Jan 2026 23:02:25 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f65d9f0sm199580095e9.12.2026.01.08.23.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 23:02:24 -0800 (PST)
Message-ID: <cf06243e-71e6-4157-aa5f-cf3951721c0a@tuxon.dev>
Date: Fri, 9 Jan 2026 09:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] ARM: add support for pcb8385
To: Horatiu Vultur <horatiu.vultur@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, wsa+renesas@sang-engineering.com,
 romain.sioen@microchip.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251208083545.3642168-1-horatiu.vultur@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251208083545.3642168-1-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_230227_894555_6971CA54 
X-CRM114-Status: UNSURE (   6.49  )
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



On 12/8/25 10:35, Horatiu Vultur wrote:
> Horatiu Vultur (2):
>    dt-bindings: arm: at91: add lan966 pcb8385 board
>    ARM: dts: Add support for pcb8385

Applied to at91-dt, thanks!

