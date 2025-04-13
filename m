Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA3EC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 17:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvXB1Wjux2MAoUVYX6W6dWHZg8CiYEv8//Po5T1hVMY=; b=EsBvYDL8oYRoC5/MXHbKBOJG+A
	iqaqsazCk0Irt1ZunwOJ243IpFTLAr9WALnayx0AbYK38NPGrtoRc0N4W1RJ7jFtx2yVjvhc2JK0X
	qh3zI5k4f9j5HAo7agsZmzp6SQtmxqIbMyHV8tUCKRVy++IbAhNC4+lQRSDRKNZfyu6pRipKpNY4w
	67YOS9obqvWuZpefDA1Y8AS6/KXvsuslvf9C4ogCYH1W+JTdFN8Ke7K4cKrgd7bh17QXO//C30fFq
	DVoJKwAgAy0mRQ1Zqy8DxxEwwAG10UKpfZ4vJIQBIXWRE8KwRhbJARwqnTQ+yq2bolAwteEMP4/4E
	38ClKong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40zu-0000000HR6D-0YEu;
	Sun, 13 Apr 2025 17:19:58 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40xE-0000000HQqC-02na
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 17:17:13 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-225477548e1so33278055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564631; x=1745169431; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvXB1Wjux2MAoUVYX6W6dWHZg8CiYEv8//Po5T1hVMY=;
        b=NdBIuRMZ0JpOFwIaKbDhEPmBsPrkx1K8eBEqncdIQQthoFncDzVtdQHGQpnjWFLMn8
         zwQDXtmEfxo0lsTTWmKJs7doGu60HpQScqEKpVeEvpfOQoAzcRoaHpt4PQ29TFv77LkP
         9QNEv9kAiTEKApmBtkX4honYSYJKR4a8wO8yAhgRJTwsREeIcVgtrTJP3vaCHxNcVplu
         h3tXeR9zppieciw1hontSUPjVMvD4j8aEtnQtWSDV2p0pPm8eUQGrXf4UNhLtpUpl4bq
         LJfN3wzVWlunbO+4J1McHkHN0+nY3mc8vBIphatsTvRbvLG85PWTJrZnsuUn528jTxbN
         Il6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564631; x=1745169431;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fvXB1Wjux2MAoUVYX6W6dWHZg8CiYEv8//Po5T1hVMY=;
        b=iJmC/XGi/KdY9wUSlGWYet5/E0hl5aC30PlVpOhM+UbDI+7+QXWTWdJUsFLdG/GyCA
         MzWxDqPjb7VvgqyYxJHg+F5GwscMVi1Fz5M4TE2UAKXv4nXdighiEsM3/E/n89Kr91E+
         vYQLYupgNGciu5hrRjQW9nRlSQY3W05E/8TSVOr5PkbWBe+Ijh9zk3HlP37nw12MnrrQ
         1cQfLcfmMVei5xVvjjB4bWtUt37InPTA07FRxdajayPP9dPbhCY3qZz5gOLObRMAjeEO
         6FDs76iIIirIHXf4VpEdRZSgNnXfNLGTunjFVORfnwW4XWlqHerfv0Hd3xjaW4aWTU+w
         KNkQ==
X-Gm-Message-State: AOJu0YxFU4XSN7M6qW89at1Nn6PcYj7dAHcWf96n7x1WtGAB8CGw+rmC
	A1NXtozTVJkYez16XMqZOaiVUQSDlnlpiT0Fxr6iW9Wofi3+0HbM221NAllYEA==
X-Gm-Gg: ASbGncsGSDzpciXMl982R23DmjWkBkrjPylZJv5J/08qxYH0U8zLZrJ9OWpWeY0ahAk
	r0E0WVU2Sf2hIzNQCeRPuZDJsyfLZVx8zAeRe83PSj6gpDW0GPSvzI5YKGuxiM3S6wiWp6ZfSGC
	rGZGpLX0KvmWC7hDIu3Fx2o17F8aJIVNXS1zQjBGOEFiyhlPwaKsYXYmr8G2b2AdjCVDZ1iVLvD
	4gaUVrz+gyzATKBcviJHeMaBYTwPi9MZV0Mk7Ml1u/2YvGEuPDQr86dtNlyPeLNcuXmOMw5aIdJ
	8m4JQFVFGbFZt823ec6CVS6d5Yaqda5Uw8n75zFAtzkp/8d8D+a/
X-Google-Smtp-Source: AGHT+IEtOLc2J65A5BztfZy5lJCUWgfZuua8Ed0F/wWmVQ49XJn2NKHTr6y3ixbdHzeiNIvZR7HI/w==
X-Received: by 2002:a17:902:e5c9:b0:21f:1549:a563 with SMTP id d9443c01a7336-22bea4954bfmr127432855ad.2.1744564630883;
        Sun, 13 Apr 2025 10:17:10 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97228sm84677405ad.128.2025.04.13.10.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:17:10 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:47:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 10/13] PCI: apple: Drop poll for
 CORE_RC_PHYIF_STAT_REFCLK
Message-ID: <rzrouiqucgtdpapcqwf6pbdrbsrxeii6khx3h2q26etu3772tb@qxxdjuv5uias>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-11-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-11-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_101712_049944_4A5D649E 
X-CRM114-Status: GOOD (  18.74  )
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

On Tue, Apr 01, 2025 at 10:17:10AM +0100, Marc Zyngier wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> This is checking a core refclk in per-port setup which doesn't make a
> lot of sense, and the bootloader needs to have gone through this anyway.
> 
> It doesn't work on T602x, so just drop it across the board.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 94c49611b74df..c00ec0781fabc 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -475,12 +475,6 @@ static int apple_pcie_setup_refclk(struct apple_pcie *pcie,
>  	u32 stat;
>  	int res;
>  
> -	res = readl_relaxed_poll_timeout(pcie->base + CORE_RC_PHYIF_STAT, stat,
> -					 stat & CORE_RC_PHYIF_STAT_REFCLK,
> -					 100, 50000);
> -	if (res < 0)
> -		return res;
> -
>  	rmw_set(PHY_LANE_CTL_CFGACC, port->phy + PHY_LANE_CTL);
>  	rmw_set(PHY_LANE_CFG_REFCLK0REQ, port->phy + PHY_LANE_CFG);
>  
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

