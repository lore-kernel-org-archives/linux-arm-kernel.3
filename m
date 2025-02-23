Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F05C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EGpteKkKO5lNSPCicYif8sBx0HN06bRRtVSVBOGESw=; b=DKEaEGiTdekTFyOgvQez2XmwSM
	29674VN7MOGc36Io113Y8wCf9UDF7hE7kStnsCqSwWflg0CSjdGL2lgU9tt2kcRFzER9fGsdMSlal
	6yYvOm9zFU1cSnDVsZJw7lr6ZpBiL7uHrmJf0QAAfanbe0j7pJ0mhh1SyLVLwCNxLgPAwsU9RJE2A
	LSkwJQqoGYv51NdBDNMzzK+zTYvfZ2argDIA3NDFLlE6FLIf7Le31l+tUPxVDfE1rI60M/oVKA/lM
	lljlFSLVb7Njn8NU4wMqQk3KDFAOSIr7S9AifeTRCsuZVWoBNdpWIvM2FDQ6V4ryumDHlqebo0UBz
	uMGtS7QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmFKf-0000000BSjo-1ZTX;
	Sun, 23 Feb 2025 16:59:57 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmFJ7-0000000BSee-3k2D
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 16:58:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-220e6028214so77210185ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 08:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329901; x=1740934701; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9EGpteKkKO5lNSPCicYif8sBx0HN06bRRtVSVBOGESw=;
        b=S9vJzG0+uiYKbkwZ4TGe+Onv9Xi2BF5VOBiaM2q7upW7MWLeEfQ6cIins6aixKet7W
         wPBgtTHMA8tGUbX3+H6tNQl8a/D/zH0ph0OAd5Mso312jj3GZk33d8d86yvCd+OAG1Fi
         RIu+b3ZiDUY9hkztpd0BDmjI1EWphtqHcNBpAV9tku2Rdbju2cM4BfVLse6BIvzaRNJW
         wscb5jKaoqP4zglo54WmKm2Os6ltOmloNVprbT7SmdlY9sS3SXrSqUg2fz1Sin25gA8b
         Ga7X5P9XbC33vjTQdE1S2gI+2K0J3/ReH/EihoU1ZwvODnqntfOP6mI+Lo/46A8nN7ap
         mKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329901; x=1740934701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9EGpteKkKO5lNSPCicYif8sBx0HN06bRRtVSVBOGESw=;
        b=LlDFeEAqfmDfh0tkLLrFmiwc5dV7rPcbnS4Pfpp4vmxg3kMMLyEMMbczMphnyNk6jb
         vV6lDSiOYrd0lH8A3sPI8+m12iW7yAv8fVz4ChRRW69lsy3yIdyU5adHYnC9/8v8z4Uz
         WslibyR2Vr/ifzRcAXwnxh8b/IKzWvsvxslYtrhnzwbDGL/It+MI+5VIlpY01vEIBRam
         bFZY8s5Jeth6In8GM54PIN7MHNHrzzl7eO41oNvJgDNXICfWW3NK9gNhs02Xt72uCpt5
         qv+kjpgeR8Wdlp/kigc61s+wl103CTa50YhOLLZUByyq86Zt6IDyQ/OiLX/ofQh9Cfdj
         vo4w==
X-Forwarded-Encrypted: i=1; AJvYcCXGaYl8T09uaOeWmz+l4SXR+Wmm/sWKzQ4Te9vnINmZv5tBpkI5PHXvUnYukC4c5IwIjkvr4EOyJUlQTOL0AhHW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1wPfRFpWqwE1q2Y55PaIUukXLqp4rKH5GwDn8kb0Lv8Hninqz
	cHNMAnaRZMwRZ/DLSfh6Stn1c3BAuO7YAcKWeT76psApUx2gk/Ir
X-Gm-Gg: ASbGncsxb3vFJjM4z6qyXipCLz0K3fgvrBBt3oRaapEDVfnetJEc+zLGRdoPlMmWMvm
	YH2zZ8MaYCKWqKRH+ROhc3MzoEJOhi+/ni4Fq4RN62DDhlK8cw6nwJO0infFRxn870EQR0eJyb6
	k+OnkUdiLPvJClZSUcYRPQdq6DRNY6xtbraEXbYm7BdlvSTPKTCjFBnT0GOlA654YhV6IeAre0G
	7IK32iprAniEMUpBRYuRtydRRoevVxb7Kjmix+AsRWY8ZroZYzVCNhn6qmxYkF/IMfOSS7AJuSo
	HL1rcMMVLmC6ZRVkwwoi3Jws8BUEYD2RU+oqJEdRoVrvQbxPU7o1mIvBHH1FFOnzm1W3sq1VcjP
	ErQ==
X-Google-Smtp-Source: AGHT+IHXAZ25HkqqX80WIfqWOaMr/ZBt00AQsjCyROwdSk9sUPpO/FNT5YIIgbZSuGIbUxzZe9RKhA==
X-Received: by 2002:a17:90b:2792:b0:2f4:465d:5c94 with SMTP id 98e67ed59e1d1-2fce78a33cfmr18547518a91.11.1740329900750;
        Sun, 23 Feb 2025 08:58:20 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:ba1:8069:4a70:1a15:7c01? ([2600:8802:b00:ba1:8069:4a70:1a15:7c01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb07a2a8sm4823011a91.34.2025.02.23.08.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 08:58:19 -0800 (PST)
Message-ID: <fb23aeaf-4e24-484c-a0ee-56781892fdda@gmail.com>
Date: Sun, 23 Feb 2025 08:58:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: bcm2711: PL011 UARTs are actually r1p5
To: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Andrea della Porta <andrea.porta@suse.com>
References: <20250223125614.3592-1-wahrenst@gmx.net>
 <20250223125614.3592-2-wahrenst@gmx.net>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20250223125614.3592-2-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_085821_936667_C960C04E 
X-CRM114-Status: UNSURE (   8.97  )
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



On 23/02/2025 04:56, Stefan Wahren wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> The ARM PL011 UART instances in BCM2711 are r1p5 spec, which means they
> have 32-entry FIFOs. The correct periphid value for this is 0x00341011.
> Thanks to N Buchwitz for pointing this out.

Should not that require warrant a Reported-by here?

> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Some people might consider this to be a bug fix, mind adding a Fixes tag?

Thanks!
-- 
Florian


