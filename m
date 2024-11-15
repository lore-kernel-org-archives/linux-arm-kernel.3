Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A5ED68BCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 17:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNINNbdA0F6hP6eHCYu5y4eAOKcxmjVgS1A+60t/9YU=; b=pBlByfH/nfXs7kCtmBhrg4ASY0
	n7is0H7NztrLmnBnCl5qAjrni6CI+E0TLRxtZBpql2mk8JBouqTC2ZSd3+2dv/RG1j0wlkD02WKv4
	6Yf9YDTDaGOdk77WJ/agI+uBylPl+rfxu9aOMtfF5xSNZey1E2nqhNNfpIP6qF+HcSeIvut5R0Vl5
	l4MI1vW30AhH0lsxGPNDeU8pizNUvo80FZ+bh6tzaCwQdnMyG9Y194aVBGT6j2a3mpILg7EevIJTx
	Eo8sc4mP6bNTQofIb8p+2g3GpoVykxhXkU1ALE+7BGhWx3ncjYYEh4Y/u838kWiuzDez7TZkqo3Dz
	JUUdWuGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzxT-00000003Wdc-0dAM;
	Fri, 15 Nov 2024 17:18:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzwY-00000003WQc-0XE9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 17:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731691032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNINNbdA0F6hP6eHCYu5y4eAOKcxmjVgS1A+60t/9YU=;
	b=ZxrymZ8FHrcZbdfPiw7mDqS58bk2+NjctsEAcu53vllQbaeF7ANlGb7abWXlt//zO2vKZQ
	d5XG3GK1UbJwUWOsfNIkqItdnh4Ix6LP9z4c9r6HEhxS4dBtXpfXfNIXl992nKBn6BLatp
	4wJ/VVDI5/Uj9fiQkg5/vRlsBf70WXQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-rncohbmYNeqNnx9EXmv2Bg-1; Fri, 15 Nov 2024 12:17:10 -0500
X-MC-Unique: rncohbmYNeqNnx9EXmv2Bg-1
X-Mimecast-MFC-AGG-ID: rncohbmYNeqNnx9EXmv2Bg
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4315ad4938fso14412605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 09:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731691029; x=1732295829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNINNbdA0F6hP6eHCYu5y4eAOKcxmjVgS1A+60t/9YU=;
        b=FGqI3dCCg6hNm3tBolxTZm+hF43TPTbz1oPuH24Thka7Tpy8kP313vFKXsb35tbT8z
         OAjb5hgTsNUHYcO/6cillCAJm6+fFep53Z9Lmia5CjPhMrnOnib6FN4soLyrwTvpTNWC
         RaawT/ef2cEzmSjvnKue2FKhxXD5k/vj1yi/C5nIjBIvqZd5FZWAIEY/0HV/rz8ZsfF1
         U9L+rpkldlE45KACrqtg/DbKEfRjzJvY+ITjtJH+zD4H8E/TF0VRkF1XIFo9efEtrlt6
         j3zSn9u1mcP45w/6yKl8tAYRFGk+NPdhNv7ezJjaEkPanPP+OmLoR/T1TQV3FnlZ6gVT
         JnOg==
X-Forwarded-Encrypted: i=1; AJvYcCWK4cYOLVFF7MfDWJSt2OXFi1wWyRbmglOHU/wFLJa6bCwyMXAPJB3AIFpMrRE46ZJT4SoDcGyhjaxrfDZtFwYZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt7qaNSWeggEx2qCOHeG3qgEICZq5hCrnLNvk5O0tfwCSCyeZu
	oqpnAF40pMubinZlT8VWf7lmrgdLtEjSpfd5l3Omu6pUbTSrmeEOzmf6JS+4RFd1Dx2vlSy41GA
	x0G7nOetgrfvi1ytHEYtfJ7rMWKFVZTRzd3pmeJEToeWQT0xoUtXwzEocaZddSVLCI6+So5wq
X-Received: by 2002:a05:6000:1541:b0:382:2976:c26c with SMTP id ffacd0b85a97d-3822976c427mr1615837f8f.31.1731691029632;
        Fri, 15 Nov 2024 09:17:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqsGWeYmupRnbdYRzMnGla3oGhpbGMYhra1dRBEvJ2Cnd/70uqsVI1qXDSJV35YPP52UmDlQ==
X-Received: by 2002:a05:6000:1541:b0:382:2976:c26c with SMTP id ffacd0b85a97d-3822976c427mr1615812f8f.31.1731691029280;
        Fri, 15 Nov 2024 09:17:09 -0800 (PST)
Received: from [192.168.88.24] (146-241-44-112.dyn.eolo.it. [146.241.44.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada2a8bsm4868047f8f.17.2024.11.15.09.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 09:17:08 -0800 (PST)
Message-ID: <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
Date: Fri, 15 Nov 2024 18:17:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read iommu stream id
 from device tree
To: Parker Newman <parker@finest.io>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Parker Newman <pnewman@connecttech.com>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BMlgtorjMeDI0Ax33qVmHbFV256z74vyaoMOYKrR2uM_1731691030
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_091714_236785_9A3CF5C4 
X-CRM114-Status: GOOD (  14.62  )
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

On 11/15/24 17:31, Parker Newman wrote:
> From: Parker Newman <pnewman@connecttech.com>
> 
> Read the iommu stream id from device tree rather than hard coding to mgbe0.
> Fixes kernel panics when using mgbe controllers other than mgbe0.

It's better to include the full Oops backtrace, possibly decoded.

> Tested with Orin AGX 64GB module on Connect Tech Forge carrier board.

Since this looks like a fix, you should include a suitable 'Fixes' tag
here, and specify the 'net' target tree in the subj prefix.

> @@ -241,6 +243,12 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
>  	if (IS_ERR(mgbe->xpcs))
>  		return PTR_ERR(mgbe->xpcs);
> 
> +	/* get controller's stream id from iommu property in device tree */
> +	if (!tegra_dev_iommu_get_stream_id(mgbe->dev, &mgbe->iommu_sid)) {
> +		dev_err(mgbe->dev, "failed to get iommu stream id\n");
> +		return -EINVAL;
> +	}

I *think* it would be better to fallback (possibly with a warning or
notice) to the previous default value when the device tree property is
not available, to avoid regressions.

Thanks,

Paolo


