Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCFCD75BCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 07:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDdn0M+k8yyKr2FkBT1Y8LYWzdJLNp3idrs1OmCygfk=; b=PvX7pkTXSum19p2hmZM6NZzW3q
	MjvaIitPAPmwLgd8+P89/C68yAPCf5BqmvcpGwnGMCBs7rNJ2u5k8nPxQ45Y6lZbG64RGv+jswmPl
	pR7qfiVuWltHOx89bPgJQVyII75G3M8wH2UET/yMurOst43KKrj+fqzyKVZZhKF7KDEQn48rKHKKH
	dgP4CIbdRniQ0gSMYIx6Dx32R8N1vqbr6P6mtGrw23+zCrnCjRAe+AYuDZtUlxh2KByoY8yURO6i6
	eG1OeJvIbiJOAU02dN3UkB687ypMrEqhwvAcMoyLzdlHuCgVURHm6/zZDDHTcXv4wJ1mPV+GwzNTV
	9rT1ZYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE1uC-0000000H1tg-1OIs;
	Thu, 21 Nov 2024 07:47:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE1tE-0000000H1mX-1VD5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 07:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732175169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDdn0M+k8yyKr2FkBT1Y8LYWzdJLNp3idrs1OmCygfk=;
	b=I49OEa1XckFPID6Ga4F9gLu1zYvy9HJi+JFsNclmXsNAyoMbjFUt1jX2Iv/D9hse3IiBmm
	hzHv+3QrMSw4zmT1kDxvXQ1ghirwaUP2URDBPdYUCxNjGqFfyXsDLyGacTbUleU4BdyO5c
	mwXeqY57w8+4o1EOgF9uH4ki7D5ijfw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-bMhJR6eiOx6ZqEKBl4ON1A-1; Thu, 21 Nov 2024 02:45:26 -0500
X-MC-Unique: bMhJR6eiOx6ZqEKBl4ON1A-1
X-Mimecast-MFC-AGG-ID: bMhJR6eiOx6ZqEKBl4ON1A
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-382412f3e62so301883f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 23:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732175125; x=1732779925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QDdn0M+k8yyKr2FkBT1Y8LYWzdJLNp3idrs1OmCygfk=;
        b=DiL9nKgpps6qLuwn6nbqsqX/7wx5b5kBHox1oc0cWQymtaFDKntJGJjPwqWy7qaJHG
         tn1OPVX6HhrfuNh96nSd+dMbBzSgcKfmE6gYz4HywTbo60BVNfCK+kHVJf+XleTzeiiw
         YWlu+e/aj7kc6wtRJ+eUW9W7t6i92eXdqyG9uxvFtLd4e6rQvuu8c3NEPtj1x7JkZv1/
         s46uU88OpqEukK9alCDu6udvqf9/znivc84RzcILSYj2jBBg6M6eSkHyTLLk43IVdZhE
         kfzZN35fKp3nsYgSKlj1kXfO50dKsoy4jUsG/t4R868/0ManHFH42/cKeHnHpIdJyZZ3
         +sdw==
X-Forwarded-Encrypted: i=1; AJvYcCXLSa0+w6JwkKsUrBrh5MfiwudmhyYrGGH5IR2lLtA/JpswdZ20hddwqqkoLP21OarFjaGZQLRGpDXqdEtP64ka@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1rUv0vfTtkif2o8ACJySjEbupEeKa74+oQAVkvQMdHln4Vkkj
	OktzZ1db88J8lYFieQpux/6QPROd5yXewTgV0zWl0CmrAj0ee1BNBXrVzplT5WtDHFqXTjl940e
	PcO/TaCrFk/QocgcJzW6wkIVyzFl3uGTgHzzWmMKUETWxcWznt/Vk5qMfsruTJiEC8nsqxa1A
X-Received: by 2002:a05:6000:796:b0:382:6d2:2aa9 with SMTP id ffacd0b85a97d-38254b14c09mr4474162f8f.37.1732175124859;
        Wed, 20 Nov 2024 23:45:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENjccaFYv9DnUII4IHVDnz1NtdHN+oocHRHWQvgpwzqO3y5Gm8BoZsAyaTjYXow73ws0CY0g==
X-Received: by 2002:a05:6000:796:b0:382:6d2:2aa9 with SMTP id ffacd0b85a97d-38254b14c09mr4474144f8f.37.1732175124527;
        Wed, 20 Nov 2024 23:45:24 -0800 (PST)
Received: from [192.168.88.24] (146-241-6-75.dyn.eolo.it. [146.241.6.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b4634c9fsm45793895e9.34.2024.11.20.23.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 23:45:24 -0800 (PST)
Message-ID: <d6794550-07f2-46df-aa4f-c728b06d50bd@redhat.com>
Date: Thu, 21 Nov 2024 08:45:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/16] net: stmmac: platform: Fix PTP clock rate
 reading
To: jan.petrous@oss.nxp.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-16-7dcc90fcffef@oss.nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-16-7dcc90fcffef@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8uQGy-K5Ux1FnqFJP7BJpF2UiDHsllSGOvGsHeth034_1732175125
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_234612_483697_E3480E0E 
X-CRM114-Status: GOOD (  12.36  )
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

On 11/19/24 16:00, Jan Petrous (OSS) wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The stmmac driver supports many vendors SoCs using Synopsys-licensed
> Ethernet controller IP. Most of these vendors reuse the stmmac_platform
> codebase, which has a potential PTP clock initialization issue.
> The PTP clock rate reading might require ungating what is not provided.
> 
> Fix the PTP clock initialization by enabling it immediately.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Side, process-related note: it would be great if you could trim the
patch series below 16 (currently off-by-one):

https://elixir.bootlin.com/linux/v6.11.8/source/Documentation/process/maintainer-netdev.rst#L14

This patch looks like an independent fix, possibly worth the 'net' tree.
If so, please submit this patch separately, including a suitable fixes
tag and including the 'net' keyword in the patch subj prefix.

Thanks,

Paolo


