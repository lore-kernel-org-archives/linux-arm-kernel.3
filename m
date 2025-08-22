Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A95ECA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VncA65wqs3Xw1Kli1LmPF8HpRGnNYdKn7A2d63G/g4o=; b=3yX9fG+fhI0abFSOOtIWGheKlr
	UekcDtcIKIi4ShsQteb75HLBsyjAVoz4wLe/oHTIxv7V5o3wpGX8rwuIemoFylORfzRylvZjuWqaj
	D63v5k+wW1NZa66IrIqEwf/x+Pz2qrVnFI5jJ1oy1WHy14OCAiVDFLNYPAP7Tjw2jVbIWcnJN5xFn
	RqQrxBOFNmlrjI8m7e8pWH3qdADXyqbSVcS7PwSkBEq6hSMFseOMnAj9s9/s0znQaPyjLCXjfN6lt
	+8AVT7i8P9x+Nim1/JtoP0YFcSl0FuwpTbe4VglZvzwLLWf2ppFd6brRt6Rzn2Gr2L/EkQgjfXA68
	Q7tfC0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphoU-000000042oZ-1C6Y;
	Sat, 23 Aug 2025 06:33:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTVd-00000002yzS-1kJx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:16:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so18399045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755875811; x=1756480611; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VncA65wqs3Xw1Kli1LmPF8HpRGnNYdKn7A2d63G/g4o=;
        b=Bpmj/9vHsW8PELJSXr+G5vPof90Gw9WZMvZ11+auqRH2yHgeQAh0b34CBu4eVoCzX6
         b0wVQvkgxdjvnPLK8u8RUPkFpGynIKkvRS31kc1CUaqp1ndM5qsRgHV67RNj7zBxZWf+
         ZmjvTACr+OqRLppYWOyzPJU0OCMESkQSsrRH2is6QH2qkgGrMWMp/Zcdgk1onaKHhmF/
         mzl4khS7g/ShGFGVnNtksKm+vhtXumAVEFpdYnc43dDj+xZeSERlcspnWmIdNS0R0IZ9
         EObDKZ61V09zO2UwfMtP18IydDASM92fll9mEAMdXyYk/QaNTG7zhCl5tg+BUYgxOj89
         96CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755875811; x=1756480611;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VncA65wqs3Xw1Kli1LmPF8HpRGnNYdKn7A2d63G/g4o=;
        b=eR9uxtvOwTDbAtwDbCmZy8VZcszdoMP08Lo2A9pIIuaRk08oBlYZz6lcbGCh+J4q+3
         rC4Nr7JCz6Os9KRXV3Rzs7PAwz2BjSoBdg9cWIIxSQ1v/m1Twns1C7hxUqcQqq0pawcT
         ktrDNJqUTF/S46nXap104UlXjSP2Hli+JqBlKfwir/O2bRRIW8mNijcdSnmle/VSuMuQ
         EF10kWegfJNVw0lYKKmz6vzrkYF/gQRoBbOyMf+yCmZjU58UFa3VyfZn7MUPRn7VqQKa
         ol78jCkjNw3ogmMAbMqBQscduhhHlp5D6ySYkr871RqhePQZ8+kZeW16OzN9KZM1a80J
         XiKg==
X-Forwarded-Encrypted: i=1; AJvYcCXBpwr/OIDDfnFPzzFRx6264Jij9ZejBwHuBoc6CgUVtTK35Pw12pY/nZCQn5BRcuaU9peCxipw1x/RsHA1Gf0U@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd5e58t8zqRkeqasNad5EuI2qlZZeS+REzGaf6B28s6l931wRo
	MoHi2iFSHxkm007J2K0lH0bgP+ccj4LY4twFJW6V4gefcmqqWY26aq83JMZNM68NDZU=
X-Gm-Gg: ASbGncu6ZUtWp6G9yi8HCbxrNBIuCjLl/rZUaRviC01iYA7t+8eY9+qOlB9fK+cnn/e
	RarYwpdaeFTuAdR6jqJ+ZdHQjoK/5OE0cxK4VoQDy55zrR43L+KTFpZ6LTm0ZhBT/o0LBrNn2Tr
	cWOEb1JdXc2YTzgCW3sHAzZ9sxhAy8AdhyC+PRViuJeBa51+LHdwElbzHr4PfwhvjBEa4UToWCF
	kFou29QsxMp5oIMHP3TDcyb7jImJM4A4RmkWOifdmrJISY5p+SxgXNSmgy05UzcesMQ6XSjRx0M
	wNBPXp64h7QalnT2b9ukdufElj0aYcVzqaEFsfHYnF/ns6bZs0qH+BxrcIO91gPVP4JZS8ek1N8
	iHbbmh3onQDqU0fhqSVQO6O8F17miqQ==
X-Google-Smtp-Source: AGHT+IHjt+7d5bsv8WuyVg2j/dbfTLKOl+Cjl6jkUNdsWRo33Z0S5ptgeOtzC4H+PPYP3sETkG74wA==
X-Received: by 2002:a05:600c:4715:b0:456:1923:7549 with SMTP id 5b1f17b1804b1-45b517d294dmr25933535e9.26.1755875811111;
        Fri, 22 Aug 2025 08:16:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c6070264fbsm2830727f8f.67.2025.08.22.08.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 08:16:50 -0700 (PDT)
Message-ID: <86694152-3daa-451d-baa0-2d957a00644a@tuxon.dev>
Date: Fri, 22 Aug 2025 18:16:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] net: cadence: macb: Set upper 32bits of DMA ring
 buffer
To: Stanimir Varbanov <svarbanov@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 stable@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20250822093440.53941-2-svarbanov@suse.de>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250822093440.53941-2-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_081653_572381_15819832 
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



On 22.08.2025 12:34, Stanimir Varbanov wrote:
> In case of rx queue reset and 64bit capable hardware, set the upper
> 32bits of DMA ring buffer address.
> 
> Cc: stable@vger.kernel.org # v4.6+
> Fixes: 9ba723b081a2 ("net: macb: remove BUG_ON() and reset the queue to handle RX errors")
> Credits-to: Phil Elwell <phil@raspberrypi.com>
> Credits-to: Jonathan Bell <jonathan@raspberrypi.com>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


