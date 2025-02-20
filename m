Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F981C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vi69fi8DpFTd/RNozd1wgX4NhzxErJ/nkr6IYJg5tZI=; b=LCT6Ihx7eGGg8t5OKPoAtM4FIQ
	LqOnnLpWVtZLMZv1Ze0W6reScrVkXS0/uzziyg4VT/6Iu72xgdYC5mDcb3KUbnGUSKms3cow9fAiY
	ukTcc6XME5BmOSb+6y2mt6+2F4+mKD7SvNcby2xYTToNUApa/M3VlhH8qDLiavwQRtI+wVpiQfbU6
	3/RL/ENwpWJCgNsZ3dunZZ3LPhcVuW9qurWTQoFBpdxHyQsrMvHfuVnPIDpOGDIMJA2oUciGOU9l+
	D1vx1yeD72EQALdq+Soqr62SvvMeegiZK8nR1kSDdYaD2zogPJauvRlTJr+2/+3cWNscdqZc9QFXr
	6IUD8U7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2QK-0000000HV3R-0jdk;
	Thu, 20 Feb 2025 09:00:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2Op-0000000HUjG-2UYz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 08:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740041953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vi69fi8DpFTd/RNozd1wgX4NhzxErJ/nkr6IYJg5tZI=;
	b=YPLqnOPQxjtbUmrqHf6OIWH4m+Cli+6n5WeOu3RiHgDxuAf2ZR4Mqf/KvqBcMr37sbrcxW
	o+EywCwnVGi3qMQbXQTwnWrSB2zMtvGtae+RFymeM3qk2tE6H9kMuzVDHaOJNIYyWi3oCa
	Zbl12CLTAVxg6wYQv9UV7iRjJlYr7AQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-3LmjzcztM9elNfVWqCw0Kg-1; Thu, 20 Feb 2025 03:59:12 -0500
X-MC-Unique: 3LmjzcztM9elNfVWqCw0Kg-1
X-Mimecast-MFC-AGG-ID: 3LmjzcztM9elNfVWqCw0Kg_1740041951
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38f20b530dfso569508f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 00:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740041951; x=1740646751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vi69fi8DpFTd/RNozd1wgX4NhzxErJ/nkr6IYJg5tZI=;
        b=g29fO+8eL4Z2jwSLpDYXv3xWF26+USbmUqcJORWg5N0ALuBmL0gRUsABds+oiGG1yr
         HLclOUG320XCnaBHeB1djibmWUXpJRFSymRSa+eLl5FqWwBTs2DZa2XMCLGkfmAeirS2
         bY65BbhCq1jc8Dfv+9GhxhwULgRFRCSZh9kjt8XyV+dWPUxfyqJVhSiNTT/S71CD1i08
         2XHIBxo/E9heNgVSSwecsRFU36XQ0zSoOjbIOtUAYaDhLFGjgRVMl6aj3lOGomjtx4as
         wJFqqBiP+9+qL5Sp43zcbURjYwL1DQj7OiisIwwSZTSJSwVX4Vwzucfo1d3gomVqVejZ
         lqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO8HD67oc30r6w/cXRMg7ofbfocKdyGKVWUXAkHcMk5HTunJbI+wy9Z7gQ3oxggTiPpb/mpXvkONyH38GFX9qp@lists.infradead.org
X-Gm-Message-State: AOJu0YypZ8jI5VtAGdpSlAcopIW/yGGAX0DPKbgVpn0Vklt4zjuygO8H
	bZ6XG1Q7m6/FxXCvw44IIM0mR9WBCDtenk17x0RqZyyvmfcZjJJZkn/TGe/TVUB8ishUq7PRNNO
	8n3b7xolqM0/vZFm3aoyaBYgyp99D4OFJL1zWeRvpU/EVPCNKa119C5kd7XkItoZmLkCc1oda
X-Gm-Gg: ASbGncsiNFomG+fuAEac2V9KkVYhXk0ECO47Y8O2czennDq0pbJqqJ+x8HzZJktyAQa
	mnttrfJjDNmyONI5cwtkNYqaNDpZ8QL+T/m9SO47UB/GRxwxJKkFnj8i6E8n6486fViatuH2i7k
	7kei2ouDMC4tB+0qT1ZfW0v/gCZlUYstoKkLQrtoGBx4Tw5d8HzRmP9irsoVZnpebu1JGSrHqeP
	iJsdU06AAo47U3zTGTSvy/rtiCOgLCuIKRYNAUIPe97mi81FcOXTb34MUzxMbax8SSt+jsXo4lb
	z0nGfWjyXW//VJePPfk0UxGiAA9nZWLN8ns=
X-Received: by 2002:a05:6000:8c:b0:38f:2cec:f3df with SMTP id ffacd0b85a97d-38f33f44f80mr15027983f8f.24.1740041950841;
        Thu, 20 Feb 2025 00:59:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI9cLg9zTTlh2PcmYGIgTxMmZCopbpnVJC7SeH7bbA6kcEpvNnjuVI80LLj0zkozJx/pc/eQ==
X-Received: by 2002:a05:6000:8c:b0:38f:2cec:f3df with SMTP id ffacd0b85a97d-38f33f44f80mr15027962f8f.24.1740041950468;
        Thu, 20 Feb 2025 00:59:10 -0800 (PST)
Received: from [192.168.88.253] (146-241-89-107.dyn.eolo.it. [146.241.89.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915719sm20217153f8f.60.2025.02.20.00.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 00:59:10 -0800 (PST)
Message-ID: <2dba7bb6-23bb-4e05-b126-b147769ad1be@redhat.com>
Date: Thu, 20 Feb 2025 09:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] stmmac: Replace deprecated PCI functions
To: Philipp Stanner <phasta@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Yanteng Si <si.yanteng@linux.dev>,
 Huacai Chen <chenhuacai@kernel.org>, Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>
References: <20250218132120.124038-2-phasta@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250218132120.124038-2-phasta@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hBfMhSwKD0Jy5nsxRcSkRXbUEuTabzuxD66zq1wRGd0_1740041951
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_005915_720638_36085EDA 
X-CRM114-Status: GOOD (  12.77  )
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

On 2/18/25 2:21 PM, Philipp Stanner wrote:
> @@ -520,9 +522,9 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>  {
>  	struct plat_stmmacenet_data *plat;
>  	struct stmmac_pci_info *info;
> -	struct stmmac_resources res;
> +	struct stmmac_resources res = {};

I'm sorry for nit picking, but please respect the reverse christmas
tree above - what is relevant is the full line lenght.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> index 352b01678c22..9d45af70d8a2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> @@ -155,7 +155,7 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
>  {
>  	struct stmmac_pci_info *info = (struct stmmac_pci_info *)id->driver_data;
>  	struct plat_stmmacenet_data *plat;
> -	struct stmmac_resources res;
> +	struct stmmac_resources res = {};
>  	int i;
>  	int ret;

Even more nit-picking: since you are touching this code chunck, could
you please fix the variables declaration order above?

Also, please add the target tree in the subj prefix, in this case
'net-next'.

Thanks!

Paolo


