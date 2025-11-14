Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1EECDE001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 04:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYITvpqCiW1DtaQqw+zoQjW9fGy8Lts1f9UcjxkD50s=; b=hux5n5a3N/RwDPGu0SniXhSqic
	uLkyngb3CFW+1xVsMlrz1XTIGqdj4ER0dbn0GJD2uWRF3H0we35aIsMXsleMZTN2+AjM7bG7qoa8N
	HxRfvKFwcX4h+qgP1M32CaaEnn+91cm2cY5r5gJrvCpqRnCLhjNVQm+XDU6ensxOQhwywC7KtS0WD
	RyE3WiqMLhbscu1az/fErN5fT4kEzmHALklasCwVOePwFP8zBNatZXxyTyTHukRGcajVbzM4P+pVT
	pHLxarRuEKratla06gQmN1+s2HWBwPjASdZIkC9W29vDq4Pb/QRAn/X2U69hEavb5jmpi7jZ4W7aS
	lXWL2SPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJldH-0000000BYdz-01sa;
	Fri, 14 Nov 2025 04:41:59 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJldE-0000000BYdE-1GOf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 04:41:57 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b994baabfcfso1010335a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 20:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763095315; x=1763700115; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jYITvpqCiW1DtaQqw+zoQjW9fGy8Lts1f9UcjxkD50s=;
        b=T4Hodm4G9H5tf2P9nbHyQn84CiRvvM72h7Xlzupwyxra8Pg78BaLCEICLWZMFepT/1
         4S25zkwYNThN/0r4ECL8j0F4gxK82uojBn+wLpHybdKqRP7m1rR6phPuIPkflnOpHgNT
         nP0vAMpldO2PVGamAd5BaEJlJ2+FUl97oCwXHLQ0YvjsoBFAe/iEWFYw2Mv2YvDI/q3U
         oKJQfBNPAVDbV53VA0DB10TO0cGhhxFN1InFGo9pyvhMjpwBYBpBsKVhall7Pq6U9hic
         1VPEu9VHczJv7mWN5cCRBphBqyZPIMTcjIMSRMlyUJDop00c4COl9XW3+oYv0tNb5Z9Y
         jqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763095315; x=1763700115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYITvpqCiW1DtaQqw+zoQjW9fGy8Lts1f9UcjxkD50s=;
        b=Ie/SukzvOie3xk8GdSc7BBxowPv99N5n+x59RZ1e4JkJuvgv267DeCp5G9uP9UMKZB
         lcwPAlw5qaWJ+Hk0Wi7GerTv5EyKs9PAXgv/j3WCKefbnnqrKtFGqErZnFTD9YZ2cU7A
         qLGQ/Ijij9SIWLbS1b8i8bsxnABO4zvbNrQdXFVvc7QMu/yj0UNZC8Vd4rWumJOc88XN
         v45HPk/cFZZRg8ATefBR2jY8XYWt/23JDno0xN3oQt8iBYGgjdBsVqhEW3TiSO4dZw/W
         kJ3yzF8ARIo+MwcDBsWVnKBmBskwaNtvOqyItZlQIITwZvyXz6hm1tYiiyJrJy4cGmGE
         KtJA==
X-Forwarded-Encrypted: i=1; AJvYcCX1RMheWGNN8KLZQ85n/HWNlB7vfJpeWT8Crl/jA9xHezPJck9wK9ZwjER4rcMuH5uXjRb8s+ozxIY9v/HwZjiW@lists.infradead.org
X-Gm-Message-State: AOJu0YwoPLJoOfYDu3DBLq1hIgbzsKePT+/1WF/S4AdJCNMvKlbZ54u0
	zjfaPpuTU4ska9oQLKXQY0soOSf14fvEKSKvuVdD3Hirtpko9yFTp2AV
X-Gm-Gg: ASbGnctntiDfKstlAO4HUC+GxcC/kQa/emyqH8sZSI1mrTTVv+c/c9htNYfGWdp9Ztw
	1op2IgBucTVUpV/0vtyr+GEbI7VYxxLx8HRYIcs9XMrX/JOkUKCeTzoVLXTgNrE3pE3WwcYAqoq
	+2C2kgX5qOtdbzm6BkbI56ZNJbru5HJsAjov5fe0YRd3qzj5wieMDUGLIigpPSAYHq+5mr5UAeQ
	/7p3RgPxvbrc94A6ZEeKwNLxrWhG8XjfF684DE+7Ls7E5xOI1TH7Dv+7wmRK9QkAY11ipEbRhfv
	FGr8n/SWtsL9LXqy2dsf6wjx9Ql+3NkIbWAS0vCoWIO/Yvz6tsMEZyeDrqkQxdFJOuOEZ6XFw52
	+px272TiNv189xPdY/7kvejxdD0GqdCVK/qDWmX41LEDWGrdUqo5q1BDFwnnGoiLnf7RZtJ53JL
	4mvjY9RkxD
X-Google-Smtp-Source: AGHT+IEYHLOamGM5/rhDQ8pIrx2agy7W4DgZWwY06i1uk7cuxizAxZJhIaEBAx3eQH7DJBOHIqA7NQ==
X-Received: by 2002:a05:7022:5f09:b0:119:e56b:989c with SMTP id a92af1059eb24-11b40f82b10mr512024c88.3.1763095314813;
        Thu, 13 Nov 2025 20:41:54 -0800 (PST)
Received: from geday ([2804:7f2:8082:36cd::1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885cdsm5676123c88.6.2025.11.13.20.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 20:41:53 -0800 (PST)
Date: Fri, 14 Nov 2025 01:41:46 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: =?utf-8?B?5byg54Oo?= <ye.zhang@rock-chips.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-rockchip <linux-rockchip@lists.infradead.org>,
	Simon Glass <sjg@chromium.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Kever Yang <kever.yang@rock-chips.com>,
	Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de
Subject: Re: [PATCH] arm64: dts: rockchip: align bindings to PCIe spec
Message-ID: <aRazCssWVdAOmy7D@geday>
References: <4b5ffcccfef2a61838aa563521672a171acb27b2.1762321976.git.geraldogabriel@gmail.com>
 <ba120577-42da-424d-8102-9d085c1494c8@rock-chips.com>
 <aQsIXcQzeYop6a0B@geday>
 <67b605b0-7046-448a-bc9b-d3ac56333809@rock-chips.com>
 <aQ1c7ZDycxiOIy8Y@geday>
 <d9e257bd-806c-48b4-bb22-f1342e9fc15a@rock-chips.com>
 <aRLEbfsmXnGwyigS@geday>
 <AGsAmwCFJj0ZQ4vKzrqC84rs.3.1762847224180.Hmail.ye.zhang@rock-chips.com>
 <aRQ_R90S8T82th45@geday>
 <aRUvr0UggTYkkCZ_@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRUvr0UggTYkkCZ_@geday>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_204156_346494_E61A7DA1 
X-CRM114-Status: GOOD (  16.99  )
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

On Wed, Nov 12, 2025 at 10:09:15PM -0300, Geraldo Nascimento wrote:
> Hi Ye, Shawn,
> 
> Here's more contained workaround without resorting to clearing DDR to
> INPUT for every GPIO:
> 
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> index ee1822ca01db..1d89131ec6ac 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -315,7 +315,8 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
>  			    PCIE_CLIENT_CONFIG);
>  
>  	msleep(PCIE_T_PVPERL_MS);
> -	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
> +	gpiod_direction_input(rockchip->perst_gpio);
> +	gpiod_direction_output(rockchip->perst_gpio, 1);
>  
>  	msleep(PCIE_RESET_CONFIG_WAIT_MS);
>  
> This results in working PCIe for me, pass initial link training.

Sorry for the inconvenience of more mail, but I'm providing as much
detail as I can.

This hack has been confirmed to work in U-boot also.

diff --git a/drivers/pci/pcie_rockchip.c b/drivers/pci/pcie_rockchip.c
index 19f9e58a640..5702b607ee6 100644
--- a/drivers/pci/pcie_rockchip.c
+++ b/drivers/pci/pcie_rockchip.c
@@ -329,8 +329,10 @@ static int rockchip_pcie_init_port(struct udevice *dev)
 	writel(PCIE_CLIENT_LINK_TRAIN_ENABLE,
 	       priv->apb_base + PCIE_CLIENT_CONFIG);
 
-	if (dm_gpio_is_valid(&priv->ep_gpio))
-		dm_gpio_set_value(&priv->ep_gpio, 1);
+	if (dm_gpio_is_valid(&priv->ep_gpio)) {
+		dm_gpio_set_dir_flags(&priv->ep_gpio, (priv->ep_gpio.flags & ~GPIOD_IS_OUT) | GPIOD_IS_IN);
+		dm_gpio_set_dir_flags(&priv->ep_gpio, (priv->ep_gpio.flags & ~GPIOD_IS_IN) | GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE);
+	}
 
 	ret = readl_poll_sleep_timeout
 			(priv->apb_base + PCIE_CLIENT_BASIC_STATUS1,

So my report suggests this is not specific to Linux and because same
workaround works in U-boot simplified driver model I suggest you check
from your side.

Previously PCIe link training timeout, not working. Now I'm very happy
with working PCIe in Linux and U-boot.

Thanks,
Geraldo Nascimento

