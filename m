Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9788ACD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gn6KVcQqqwpDjyvuwkRjE231Xsgcb7/5TEFaLWl5LFs=; b=OwE4KgMS2bne24XPHbXfHL0oRU
	xi86DZ49HK8UdQyAFeQ4i/Q9k2b9WCV3aGxdIWZRuCqhQH3R8BW7x6jYHpsZHdbUZOF7aYdzuYFHQ
	The6lG3CvnPySsNMYz9VZ3x5TeBKHNsGMoIvkX4g/DHATgG3GFhnhJYKNDuWqjqHPRAVkFHz0eSu9
	kzOlh4oxokcjdkCcNHn3i2r5srSgknlTHNe8trDOYRtr0y/MKVCOLzNUAPOk70KLhnfGeo5z9OlDM
	9pWaHeC1FH/LNZnIc5FZfTlv1PK7WItaFAJmC7a4HyEvcHgxlsSTRab+tHuGh9Vi32Ew/by600AI3
	uuK+dOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVS2R-00000000UkH-398C;
	Fri, 05 Jun 2026 10:44:31 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVS2O-00000000Ujg-2ahH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 10:44:29 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso1265989f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 03:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780656266; x=1781261066; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gn6KVcQqqwpDjyvuwkRjE231Xsgcb7/5TEFaLWl5LFs=;
        b=Pif48cc7naK8l1VU1QtyJcG6wYpszdHnG8lzFnfKY7CJxZaqMmlkE2eHJFSsu7Uo55
         4kIqVEd1GG2eBVfMK+xd7R8XsqCro19fU93YJm8GtZ4y0OQUTofuDtENbxl0PNORKjl1
         QJVeCkPFFbT2QP6cVRHp16rfT0iJKIdsn+UNOGPeak4RaGv1YG693hTJ5ozO//LuDKUb
         zomVxKvPV6uhX5HkTGaulssf9owikJtKBN2oX1WvYrMAZzfNbWh4F+XccB2hp0kduTdX
         fKNIVoTA/ofe61fgtmbXyxL81+zOPvz3HeYNVLwrV66NtmB6eVVGyh/EAIt58jTd4XcH
         QBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780656266; x=1781261066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gn6KVcQqqwpDjyvuwkRjE231Xsgcb7/5TEFaLWl5LFs=;
        b=oR3UUwq3Nh9R41DHas2nDB9Niti1PRiCEmx1OGVjSKvYNPdRxq/5NhgSt5C3RMkKI8
         DB8ImdNzswUlHxeMBhsEQ4smzaHuwRt8JXylE9wHbVB/QipXQND1l2Q4WmwE28iPxoci
         Jg/ApB6xkzv2sWRtjSC1oPXiQfUnkItYcqkzBViGIP0ChPTc+X0ptb33D1CbElEZjeeb
         WdGG7kxx8hpLLsUzNQ8u2ftw7nO/9rMV3uMv9AuPR9J++D/psrHygO+f8R/AWieTbS08
         YVSctiT4Ztc09PVVaCfb4QypGHjzm5hiWBpkoZNdrdVohvOV81IREF4yoDtJldx97jOJ
         EQeg==
X-Forwarded-Encrypted: i=1; AFNElJ83LybAuoYjSCGl4k6ZvUbmWQWAnpC8MiZ8hZktjjE6EUBO3RbneXy6Vn5cU1tns8cNfdHXq1FJ4vmRftmC9pdv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz47M+ptN06fzd0RuYGfkPQuK/9z6sJW35pVhHyVb/CPs5eISCQ
	4T+LWJYs27g+huzTsOWqkUdg8nZNs6ACzkwjO0nUFbW7tE4CwbJyUr5e
X-Gm-Gg: Acq92OGwJAP25JcqXQGLPhW/slH8rmeGYWZQbFSA7nl2Bz6pkyFanq0YS4AVPmW2PGt
	jOzrTq2N6DxXKush2qeII8LK2uVRAKFgX+FGOjVd+Qn9Uy6Zdx+KSMpEL6MRvdJYBEVV2AAJ+7h
	WiVxnXQQEsvHOd5t7euGIHjKI2D8MU/eWq2gmTBWxs935FgaqHXqr8ckqll4klPfjACJ7aHDSX2
	3oqNqKflVEw9QZca9LU9Cj9OLP0lbRHX7v5oVAqZYkUC7sFhRTxeSN13/9v3GzaQKsHAOYFktiH
	AD1vQsGCac2HXdUap1IJzmOHMg2ATWc8xMIH6DaulLCmRdkW21xyqvfrzs+IYYxLxycI6t2c5KA
	JRAVcTUFALmu+b2riS98pzrfUEwlmLG6Ej8KgoDDGmQTDEE+Ui4lNqNlkCmoqBV+UxmX6M3TpB8
	aE7LHphkNHQ4OTD6Ry+X/rhkNF42fpP6VufCbacGTabxPkwRHSHVTWPbSNnI/t2z4lKQ==
X-Received: by 2002:adf:e00f:0:20b0:45f:f142:d55c with SMTP id ffacd0b85a97d-4603063a8ffmr3523153f8f.22.1780656266046;
        Fri, 05 Jun 2026 03:44:26 -0700 (PDT)
Received: from [10.25.213.68] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm25066376f8f.9.2026.06.05.03.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:44:25 -0700 (PDT)
Message-ID: <cf7b4c03-e1f4-4439-8077-2f8677bb2cea@gmail.com>
Date: Fri, 5 Jun 2026 03:44:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: dma: fsl-edma: add dma-channel-mask
 property description
To: Joy Zou <joy.zou@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
 <20260211-b4-imx95-v2x-v4-1-10852754b267@nxp.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260211-b4-imx95-v2x-v4-1-10852754b267@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_034428_692069_02C2351F 
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



On 2/11/2026 1:28 AM, Joy Zou wrote:
> Add documentation for the dma-channel-mask property in the fsl-edma
> binding. This property uses an inverted bit definition: bit value 0
> indicates the channel is available, while bit value 1 indicates
> unavailable.
> 
> That was already used widely for i.MX8, i.MX9. Correcting the definition
> will break backward compatibility. This reversal only impacts the eDMA
> dts node and driver, and doesn't impact DMA consumer. Therefore,
> keep the inverted definition.
> 
> Also add a note at the top of the binding to highlight this inverted
> definition to prevent confusion.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
Hi,

I believe this patch hasn't been picked up yet even though it's been ACK'd by one of the
DT binding maintainers.

Frank Li, can you please take it into your tree?


Thanks,
Laurentiu

