Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C08EC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/v0V/+AF4oDvIYG7l9ZAc1X2CkAPTP0CArzdqpDOm00=; b=y/VlU31SJEXN2AqqeiXrVTzyGY
	d9qqNsVku5o9vi0xcJyhrpFQDYHbw+GacY3BOPHsW3T051TSYCBCHr2CZIkFLkCfgLkPQy2Dxqjg3
	yVclPnSb0eyflx/Mbj6bd4AwqE5CVdzVIBXqU6topffewUY85XGYLR75L2Ew56GcAJdqAD+vQGm2d
	JjmxfN9FMrQp5iMboA3XaVpHVT8bYa1S/VqDOfX1v70n/KtPn7HN3bfBtS9M5npEVqQQUKT/dsSYE
	iSXoui1rZhJSSaKKF1MNUigpZCyu0PwFd2+UzynADdaFLwxbG+gPPbptSt8qyt1tyqwMPrKwzJjUz
	GI5+/UlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEn7u-0000000CAI8-4AAy;
	Tue, 13 May 2025 10:44:46 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEn3g-0000000C9Kn-097d;
	Tue, 13 May 2025 10:40:28 +0000
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74068f95d9fso5113549b3a.0;
        Tue, 13 May 2025 03:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747132823; x=1747737623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/v0V/+AF4oDvIYG7l9ZAc1X2CkAPTP0CArzdqpDOm00=;
        b=ikggduTwKfigMe29ASE0YglAWkxjrhqmlS0eu+FTwybqw2MBnqaz/+KE1ANN/umYOZ
         B/lJaJeUTsjlMQugfQrLwEQyS0wQClTmGW0EDdAOYYeXNL4eiXaJVvmsRf1Rn37kLUlK
         oq9TpGm+iS7ZTj8fvhgjxMKU1LUXT+qRm3MP6D/XfLEhGPJ0kg2EtZMG89dSZMaz9cxZ
         84GMUpiDELyMPt21vy7YLr/T6csQ9NkymolrEa0X/6ivLLmNLBpP4Uftv3NFw5KQBe4m
         WuZtAnROS7xhn1011aAMEF7JpYrpVnqncSP8Bz7X31P3rLZWTtSecwuWTTsU0/5QJ0/3
         cfzg==
X-Forwarded-Encrypted: i=1; AJvYcCUHk+GjAD3MvKhx9xXSGmB3byItJftOeuBXuujBU3qAZk/p7elAOisBpMqnZfRQeKJ+OkHzwTo5eeT/+UiZMwlK@lists.infradead.org, AJvYcCWETw1IR7HdacMp8Z7RmHBzqW/oR2wK7bta3Px7mgbzJvkWf6s/bDIN5+gz11dY+ui9tQN2hFPuEg9ubV+GL0I=@lists.infradead.org
X-Gm-Message-State: AOJu0YwlToa0/GexOzB8t3M4zxMW0pmrPC5AS8bPOgIzG4Co5Mms778V
	89azl7v01e7AVPvKAw7nB7q+OeKQU4plhSsT/qnFyYjQ8ph1t9CL
X-Gm-Gg: ASbGnctrq/rbNvbnjrl6Cp/0Z4a6Z+9A5w6QjzBhZQ+j0Zhgb7uVOuT6ARdyXnkmTN8
	+lfyws4VQcujaqr1DZKorwpH68qlu0SyTgJqHhBLPtVZKdA2LEY3F/0yKBecxxI5w8CKN/35KLw
	iB7oJoIASqDQN3Ft1PaFA+Yrqbil80RSITpZuZMcaXTzzPCWCJYvg2ZbWfTli/m10YBPHK1FjyO
	O6PQKGuH9yITQcNuuTjv+u2ELVSmiVcOjMqM8A2VXw1oIUMkYyKyuD5vxT2xopJxH6km69JHDTF
	AVSXXblG5+d9eZ18IsFW21X6R/p3aCcbAvJgLnPmZltqVfZPYVLDk19BfZ8q022zb/ZIOSXZx7/
	xtuSCSdywbw==
X-Google-Smtp-Source: AGHT+IGr2aW/45b/yavzWHBWkTHeJduuKUqU4UjeaD90HPWZf++irPva4RTyoiN9IoRRzK60hGo4XQ==
X-Received: by 2002:a05:6a00:480a:b0:742:4545:2d2b with SMTP id d2e1a72fcca58-74245452f5bmr13884832b3a.3.1747132823070;
        Tue, 13 May 2025 03:40:23 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74237704713sm7594134b3a.2.2025.05.13.03.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:40:22 -0700 (PDT)
Date: Tue, 13 May 2025 19:40:20 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Hans Zhang <18255117159@163.com>
Cc: shawn.lin@rock-chips.com, lpieralisi@kernel.org, bhelgaas@google.com,
	heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/4] PCI: rockchip-host: Refactor IRQ handling with info
 arrays
Message-ID: <20250513104020.GC2003346@rocinante>
References: <20250509155402.377923-1-18255117159@163.com>
 <20250509155402.377923-4-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509155402.377923-4-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_034024_076503_05CD0200 
X-CRM114-Status: GOOD (  17.45  )
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

Hello,

Thank you for the patch and the proposed changes.

> Replace repetitive if-conditions for IRQ status checks with structured
> arrays (`pcie_subsys_irq_info` and `pcie_client_irq_info`) and loop-based
> logging. This simplifies maintenance and reduces code duplication.
[...]
> +static const struct rockchip_irq_info pcie_subsys_irq_info[] = {
> +	{ PCIE_CORE_INT_PRFPE,
> +	  "parity error detected while reading from the PNP receive FIFO RAM" },
> +	{ PCIE_CORE_INT_CRFPE,
> +	  "parity error detected while reading from the Completion Receive FIFO RAM" },
> +	{ PCIE_CORE_INT_RRPE,
> +	  "parity error detected while reading from replay buffer RAM" },
> +	{ PCIE_CORE_INT_PRFO, "overflow occurred in the PNP receive FIFO" },
> +	{ PCIE_CORE_INT_CRFO,
> +	  "overflow occurred in the completion receive FIFO" },
> +	{ PCIE_CORE_INT_RT, "replay timer timed out" },
> +	{ PCIE_CORE_INT_RTR,
> +	  "replay timer rolled over after 4 transmissions of the same TLP" },
> +	{ PCIE_CORE_INT_PE, "phy error detected on receive side" },
> +	{ PCIE_CORE_INT_MTR, "malformed TLP received from the link" },
> +	{ PCIE_CORE_INT_UCR, "Unexpected Completion received from the link" },
> +	{ PCIE_CORE_INT_FCE,
> +	  "an error was observed in the flow control advertisements from the other side" },
> +	{ PCIE_CORE_INT_CT, "a request timed out waiting for completion" },
> +	{ PCIE_CORE_INT_UTC, "unmapped TC error" },
> +	{ PCIE_CORE_INT_MMVC, "MSI mask register changes" },
> +};
> +
> +static const struct rockchip_irq_info pcie_client_irq_info[] = {
> +	{ PCIE_CLIENT_INT_LEGACY_DONE, "legacy done" },
> +	{ PCIE_CLIENT_INT_MSG, "message done" },
> +	{ PCIE_CLIENT_INT_HOT_RST, "hot reset" },
> +	{ PCIE_CLIENT_INT_DPA, "dpa" },
> +	{ PCIE_CLIENT_INT_FATAL_ERR, "fatal error" },
> +	{ PCIE_CLIENT_INT_NFATAL_ERR, "Non fatal error" },
> +	{ PCIE_CLIENT_INT_CORR_ERR, "correctable error" },
> +	{ PCIE_CLIENT_INT_PHY, "phy" },
> +};
> +
>  static void rockchip_pcie_enable_bw_int(struct rockchip_pcie *rockchip)
>  {
>  	u32 status;
> @@ -411,47 +450,11 @@ static irqreturn_t rockchip_pcie_subsys_irq_handler(int irq, void *arg)
>  	if (reg & PCIE_CLIENT_INT_LOCAL) {
>  		dev_dbg(dev, "local interrupt received\n");
>  		sub_reg = rockchip_pcie_read(rockchip, PCIE_CORE_INT_STATUS);
> -		if (sub_reg & PCIE_CORE_INT_PRFPE)
> -			dev_dbg(dev, "parity error detected while reading from the PNP receive FIFO RAM\n");
> -
> -		if (sub_reg & PCIE_CORE_INT_CRFPE)
> -			dev_dbg(dev, "parity error detected while reading from the Completion Receive FIFO RAM\n");
> -
> -		if (sub_reg & PCIE_CORE_INT_RRPE)
> -			dev_dbg(dev, "parity error detected while reading from replay buffer RAM\n");
> -
> -		if (sub_reg & PCIE_CORE_INT_PRFO)
> -			dev_dbg(dev, "overflow occurred in the PNP receive FIFO\n");
> -
> -		if (sub_reg & PCIE_CORE_INT_CRFO)
> -			dev_dbg(dev, "overflow occurred in the completion receive FIFO\n");
> -
> -		if (sub_reg & PCIE_CORE_INT_RT)
> -			dev_dbg(dev, "replay timer timed out\n");
> -
> -		if (sub_reg & PCIE_CORE_INT_RTR)
> -			dev_dbg(dev, "replay timer rolled over after 4 transmissions of the same TLP\n");
> -
> -		if (sub_reg & PCIE_CORE_INT_PE)
> -			dev_dbg(dev, "phy error detected on receive side\n");
>  
> -		if (sub_reg & PCIE_CORE_INT_MTR)
> -			dev_dbg(dev, "malformed TLP received from the link\n");
> -
> -		if (sub_reg & PCIE_CORE_INT_UCR)
> -			dev_dbg(dev, "Unexpected Completion received from the link\n");
> -
> -		if (sub_reg & PCIE_CORE_INT_FCE)
> -			dev_dbg(dev, "an error was observed in the flow control advertisements from the other side\n");
> -
> -		if (sub_reg & PCIE_CORE_INT_CT)
> -			dev_dbg(dev, "a request timed out waiting for completion\n");
> -
> -		if (sub_reg & PCIE_CORE_INT_UTC)
> -			dev_dbg(dev, "unmapped TC error\n");
> -
> -		if (sub_reg & PCIE_CORE_INT_MMVC)
> -			dev_dbg(dev, "MSI mask register changes\n");
> +		for (int i = 0; i < ARRAY_SIZE(pcie_subsys_irq_info); i++) {
> +			if (sub_reg & pcie_subsys_irq_info[i].bit)
> +				dev_dbg(dev, "%s\n", pcie_subsys_irq_info[i].msg);
> +		}
>  
>  		rockchip_pcie_write(rockchip, sub_reg, PCIE_CORE_INT_STATUS);
>  	} else if (reg & PCIE_CLIENT_INT_PHY) {
> @@ -473,29 +476,12 @@ static irqreturn_t rockchip_pcie_client_irq_handler(int irq, void *arg)
>  	u32 reg;
>  
>  	reg = rockchip_pcie_read(rockchip, PCIE_CLIENT_INT_STATUS);
> -	if (reg & PCIE_CLIENT_INT_LEGACY_DONE)
> -		dev_dbg(dev, "legacy done interrupt received\n");
> -
> -	if (reg & PCIE_CLIENT_INT_MSG)
> -		dev_dbg(dev, "message done interrupt received\n");
>  
> -	if (reg & PCIE_CLIENT_INT_HOT_RST)
> -		dev_dbg(dev, "hot reset interrupt received\n");
> -
> -	if (reg & PCIE_CLIENT_INT_DPA)
> -		dev_dbg(dev, "dpa interrupt received\n");
> -
> -	if (reg & PCIE_CLIENT_INT_FATAL_ERR)
> -		dev_dbg(dev, "fatal error interrupt received\n");
> -
> -	if (reg & PCIE_CLIENT_INT_NFATAL_ERR)
> -		dev_dbg(dev, "non fatal error interrupt received\n");
> -
> -	if (reg & PCIE_CLIENT_INT_CORR_ERR)
> -		dev_dbg(dev, "correctable error interrupt received\n");
> -
> -	if (reg & PCIE_CLIENT_INT_PHY)
> -		dev_dbg(dev, "phy interrupt received\n");
> +	for (int i = 0; i < ARRAY_SIZE(pcie_client_irq_info); i++) {
> +		if (reg & pcie_client_irq_info[i].bit)
> +			dev_dbg(dev, "%s interrupt received\n",
> +				pcie_client_irq_info[i].msg);

Why do you think that this is better?

Other patches in this series seem sensible, but this one does not stands
out as something that needs to be changed.

Thank you!

	Krzysztof

