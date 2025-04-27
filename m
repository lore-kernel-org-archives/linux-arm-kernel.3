Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822A5C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4+/5/aJ00yUVo743NQIajtPIPLeDpfyWDZMv+sSR0I=; b=JZIhFa/mI5SYGQ5937wAhls8sH
	eIeR0IAXkw4pR3ZNdKKZkf7qWgrJI8jJKKu7utEX8LDPbmFPX+xPQobBLoTP3/axa3YWNvm6q1gP8
	bKEDSC3w8Uc6OueB5RrGUCr6IPUR93Kcc3FZRpgT6InCthvuiiojknmt4MR/z8eP13PD55baoWKtH
	2hTSvMA4h+Ez1K1xBg0/7TndlIJN+wyuSqdnBKb4+LxcNiAIQWOrcvjt9LCIrwOVaCOUqHuQBAl9D
	hJ7hk/XyFl7LOKqL9/gFOb/9ig6Uj/4ELs/1Qg4iirmTuJatfE9xGN1W7WNTZ/3j/ms3GhCaTkgy/
	Cu5MjiSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92K1-00000003cS6-3opv;
	Sun, 27 Apr 2025 13:45:29 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92Hv-00000003cCU-20oM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 13:43:20 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac289147833so681962766b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 06:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745761398; x=1746366198; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z4+/5/aJ00yUVo743NQIajtPIPLeDpfyWDZMv+sSR0I=;
        b=L///IVv+rGQY7yisNS1YWH9FgRNByUBkbQk4SaRD8mSg95TBrAvKcwBn3Za7rjSflv
         DStTjkgtxCn5mSU/LNb6zdR/ljWWkEpGceF8CmYGbrPNuTYCov6oszd4mKk3YPUqG8wS
         vGZmMRrlSE3facUU3222Ff6g+pI7unysiKO95zSZj7RmUgdckc9veiyb3LOfx4aAkYi8
         q3U4vuxiyuHC57ar4Gpr+SJrGw/inyj6db6lJstLXJLiVODagMlmmIowImLglsPs01HO
         w1gN94O3F5vPlXiA11T4Y0QS2Cw/ke3bqaLgDQW+TXrciUyWXJIbQYD9q+j6as3AmcC7
         pFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745761398; x=1746366198;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z4+/5/aJ00yUVo743NQIajtPIPLeDpfyWDZMv+sSR0I=;
        b=f+mQgIb6sr24PVC2cme6L/EzOUTw6AjY/dOvhNyl6sit72jjNoT0dbzsozVHi6Jzkf
         NA9GaxzE7SFN/jkPuo4Q9c28Hoyy/HPE8oDSui254Rp0LRhL5ZkJDpYMJ9cZP+JQTQME
         GcIw66TJSr9zUO1IUAqABXWryjewimNDSEbkNgYrts9gMBIBRmSUhgewswxBQtGMicLn
         WjEzWso6N+VNHDTrI7oq2+aBWUoufFQBEb2dOZRU6Deopuc1tqZ4uaxVoY0g6j0y54ft
         SNJNOVLJOcyCx7tAFRf/gx0XkIpoxsksFMWWVYgCE4JSmB1FJl6X+S3EAyGExKBzGiVT
         9UjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW99P1U7VQqqZTzKWn9GPRv/pli8gmOU61xMdg//2xaZ9c/k8/dgEpZe7k6EYiZi720KisSGCdmVBZX9PX19bRP@lists.infradead.org
X-Gm-Message-State: AOJu0YxYeCV2/fXFeijt1TxC5oSag+pDMfCgUYdfr0mvbV10kTP4ECs8
	h+QJmAv70/oyJnbWUkbA3HOHz+p2Sfe0j9jO/6Vws2+D/VqEf3SMoEckjiLG9eY=
X-Gm-Gg: ASbGncubwbnoQBKzhQT5YOlhXyDOT+p3wVEAbTccO6KNmRE9hO4ZCzGRFvGd5Ut6/An
	uT6xUu2A68ti8vuOy0oIj8wK+xHys566oy/6MaT/fEKsZPBFpCh+mK5alFEelxT88PmZ+7j061B
	0yU5z2xrbk+2qccGPD5Jg5Zvhk57SCinvxk9XJzXOWipXjwKYvIUxInNfdbSVaVWNND2PFhFYO3
	nXpngJw4wc8KCEeAIIDDkPXXG40SmKH1jiuhK79SJFCyxvvq7FIvmEhNeN9jwAKKCc6wmY0Z7J/
	h1JYAkZe1Id4jL+zbkIdZnGk96I6+l9BsJeuJxj37UHgds3Q2aOTVx5jfNrq
X-Google-Smtp-Source: AGHT+IGRwUVwOyuzymMCwS+0qn15iMV9FUUdCVvXLMQI1GdB2QpaBU0EsMQ7nsFAnRwnHK8jvuB1mg==
X-Received: by 2002:a17:906:1548:b0:ace:3f00:25f5 with SMTP id a640c23a62f3a-ace848c23f1mr395019466b.2.1745761397537;
        Sun, 27 Apr 2025 06:43:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf82f9sm442101266b.88.2025.04.27.06.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 06:43:16 -0700 (PDT)
Message-ID: <33e56253-32ee-4eff-a7cd-fcf91ca4f37a@tuxon.dev>
Date: Sun, 27 Apr 2025 16:43:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ARM: dts: microchip: sama7d65: Add MCP16502 to
 sama7d65 curiosity
To: Ryan.Wanner@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, onor+dt@kernel.org, alexandre.belloni@bootlin.com
Cc: Nicolas.Ferre@microchip.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
 <60f6b7764227bb42c74404e8ca1388477183b7b5.1743523114.git.Ryan.Wanner@microchip.com>
 <6e52883b-2811-4ac2-9763-5974ca463274@tuxon.dev>
 <af92ffff-f900-4f29-8d26-2516a3c91805@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <af92ffff-f900-4f29-8d26-2516a3c91805@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_064319_523899_BC78E332 
X-CRM114-Status: UNSURE (   9.37  )
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

Hi, Ryan,

On 14.04.2025 18:38, Ryan.Wanner@microchip.com wrote:
>>> +                     vldo2: LDO2 {
>>> +                             regulator-name = "LDO2";
>>> +                             regulator-min-microvolt = <1200000>;
>>> +                             regulator-max-microvolt = <3700000>;
>>> +
>>> +                             regulator-state-standby {
>>> +                                     regulator-suspend-microvolt = <1800000>;
>> I can't find the schematics for this board. Is there a reason for keeping
>> this @1.8V in suspend?
> Sorry this was an error on my part, there is no reason to have this
> @1.8V in suspend mode.

OK, I'll drop it while applying, thank you!

