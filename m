Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A15C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 10:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSz/sPDiC/QZeGr/GNB1mzbdmiKfZk2fho7AI9XSSzk=; b=MgUJssOIXHAAdb1D89wU/1jnwq
	BVoiZTWOVVx8ZZfRKvSLioNUrQ1DzSxaOchBG19NrgMW25u65EupOJJ2tWTS+U0rwk60XgD/hxw11
	mJbUBvGR93NYYRjQJ0T4pGcZoU0mF9xjSDBxNRjeRbRx03SLfzXv1H23g2X1vNfOmUPBDwU0JHy9V
	AtJ8S6/QMoNMnqiXuxL5n/o+EpJ+BPnnlBR4HcvQf1149YRfPGw6FBoq5UjRFE76R/Tuf43/fepHK
	omeu0ZKKWrVUY5SMrXkl6ZsD2ZE/l4D+lxzLY1uo2MnSqxqg1IwFKHFa0AVPRmEF0jljrxTvOxd95
	oc2nTsCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBtDL-000000074Ip-0YDE;
	Mon, 05 May 2025 10:38:23 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBtBM-0000000743t-16JK;
	Mon, 05 May 2025 10:36:21 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7c59e7039eeso631254885a.2;
        Mon, 05 May 2025 03:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746441378; x=1747046178; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qSz/sPDiC/QZeGr/GNB1mzbdmiKfZk2fho7AI9XSSzk=;
        b=jtklDDh0rIQAvoXxvkNzEqAVnrnUIoSssc3/Fug3lgssfBq5exULn+oEchhJKWZY1F
         IV1g5QS5yh2waLJ7/q7bUUqS0Fo648rVOtkjWgbA/3+mga8Et+Ia9pxJoR0zCVK6Os9I
         5xmTQbIjNLFR0QRdHack88VGpzE27oGQHhKSkrSFr5l43gC+FrgYeqqkCzcZimQrNhJl
         HpihIB8lDBIpw061F1z6JfkyswdFmr9WoQnjMF8tDsVGmjd+EsTcPoaMB246t0mSMV/r
         jI4hFGxXG+HPNWfKzab2SZM6SNrLglGRWc6aH5qVZEoxPrIA+RWSPMZh4otJ+gVlr87v
         mGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746441378; x=1747046178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSz/sPDiC/QZeGr/GNB1mzbdmiKfZk2fho7AI9XSSzk=;
        b=kpx/YYYDUUGSqyQbnAJ9MyYJgKC2zcxmXARVT/yyvqlwVu4R5yvtG/dwdAjYT6+Qgh
         Q+Rl02dn7+TDBv4mhQ3UPEBeCWW58mAfLQi7yA1igdwrvarpvFbLuiSabO323PiUpF2a
         AMpDVxstJHD1+8/HDHuCcxC1CC6fDKuhQuCfET+7Cpq9bajoNDJNgD5rvgU2ceC2GNW2
         9ZpJVunBiQ02sCOoaN1AuLI1Ap62O3QuGBqVbLWlJxilcXswGhj8AIjYUumbPn3FUAtb
         zi59iE4FhAV36+7Jep4yEKTuF6/xLldY7qVg+H7UCyn/jn5bMPIQZ2lLaNvOxovqugWn
         O9nw==
X-Forwarded-Encrypted: i=1; AJvYcCUOqeX/YIUibLoDXTgmgiHohbcpoArJ6oRcRQ3RrPyUzOHJhT/LuwBAQ3R8SmUWEAA66sGrDVYYWgbF/UyFuW8=@lists.infradead.org, AJvYcCX5DBzKzCXJmRfv1fEmOR1I8FfOwn9PmS26nW5/QGPmsGWSYOg5Xhh+wPXb8oG8UComz+y2Nfr23teF+XqXaFRz@lists.infradead.org
X-Gm-Message-State: AOJu0YyEIh9RGTV+x4H7kJmCz33ChQCdcx+c2CCxmIMOXJpq+1Te8alw
	CCYlRx1vgzv6RMOuh6X8U3i9+1vOY6CfXGlweFVhhPNbHewOM/yN
X-Gm-Gg: ASbGnctFLloDdvruE7jtimRDFQryJ8RkQYRZajIheB+n+8SQalHjj+hy49uTlD8k+DU
	AXFhByF0O0T0/3G+Su+oaObodUzfQBBQch3vQ+OThNWxAzkGm+wS0byRT16jWeUYJfq3MihOaT2
	rv6XLco9VA0mOKRZRf5yda95N/7YG0zr40fh1tJlwAR/XC9TAsnABqjrUdLHGXmg+82rI3WBcFo
	H/I06I91pHsWqbAaodWYpGT6BAQ0+/pnLr29TtdbdpGTytzxr+p09dXlMXDKeabRvuXw00/2Lta
	+/QztZmwoqaGMrUno8cQ7J1Ke+ofqLQQesPai5ZQ7ZwdhWosNCnJm/tV/AS4+g==
X-Google-Smtp-Source: AGHT+IEGFiuPwtx5+ptQcYP4WqG3qE0Q0U8qKthDrzIQB+NTFScSCy2F+JLC1iCLj7ayC8SQku10Bg==
X-Received: by 2002:a05:620a:8006:b0:7c7:c6e6:bd3d with SMTP id af79cd13be357-7cae3b18d4emr1074489985a.58.1746441378556;
        Mon, 05 May 2025 03:36:18 -0700 (PDT)
Received: from [192.168.21.149] ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad242b6dfsm548847085a.68.2025.05.05.03.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 03:36:18 -0700 (PDT)
Message-ID: <1a403393-e317-4a1b-a151-fa668c6278f9@gmail.com>
Date: Mon, 5 May 2025 06:36:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jonas Karlman <jonas@kwiboo.se>, heiko@sntech.de, robh@kernel.org,
 conor+dt@kernel.org, detlev.casanova@collabora.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
 <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>
 <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
 <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>
 <b50c68bd-9b15-412a-ac00-1df25601edd9@lunn.ch>
 <46cbdabd-b0ed-4c9b-9f01-4d2d8eceac24@gmail.com>
 <13407dae-4c73-48a9-846e-92f08449bc4d@lunn.ch>
Content-Language: en-US
From: John Clark <inindev@gmail.com>
In-Reply-To: <13407dae-4c73-48a9-846e-92f08449bc4d@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_033620_303912_376E7812 
X-CRM114-Status: GOOD (  19.35  )
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

On 5/4/25 8:45 PM, Andrew Lunn wrote:
>>> What PHY is it? Are you using the correct PHY driver for it, or
>>> genphy?
>>>
>> MAE0621A-Q3C
>> http://www.maxio-tech.com/product/12928/12929/12930/12931.html
> 
> Mainline does not have a PHY driver for this. So nothing is
> controlling the delays in the PHY. So what you have above works by
> luck, and is likely to break once there is a PHY driver. So i suggest
> you drop the Ethernet nodes for the moment.
> 
> There does appear to be a PHY driver here:
> 
> https://github.com/CoreELEC/linux-amlogic/blob/5.15.153_202501/drivers/net/phy/maxio.c
> 
> but it has a number of things wrong with it. You might want to search
> around and see if there are any cleaner versions around, or if anybody
> is working on upstreaming a driver for this PHY.
> 
> 	Andrew
 >

Hi Andrew,
Thank you for your valuable feedback and for pointing me toward 
investigating the PHY configuration further. After digging deeper into 
the MAE0621A-Q3C PHY (PHY ID 0x7b744412), I now understand why it 
performs reliably: the generic PHY driver relies on the GMAC to set 
RGMII delays (tx_delay=0x20, rx_delay=0x10), enabling a stable 1Gbps 
link for gmac0 in rgmii-rxid mode, while rgmii-id failed in my tests due 
to the driver’s lack of internal delay configuration. Given the critical 
role of networking for development, I’d like to retain the GMAC nodes in 
v3 using this setup, but I’d greatly appreciate your approval on whether 
the generic PHY driver is suitable in rgmii-rxid mode for now. I’m eager 
to explore a Maxio-specific driver for mainline compatibility and would 
be grateful for any guidance on existing upstreaming efforts for this PHY.

Best regards,
John


