Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCA8CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 19:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4IpH5LEDaSFvAvPiFPbj5ZjEkRtPbLsUPqVa2w6YN4=; b=Sf3PIH27qXgfbv6FQGZS7ajWEF
	4CmixEKqpBu2U0oa8LWFlRQgFC3JO68w1p6ozFJYBHEdfxcBhwctadWiv+zG1GDGZe/JRCunHp/Ot
	MsogOIXcayKikGs283lsTTgUqCtJpuYwzmDLNKlxbUejr+eB2M3Xj4NYL/D6rC5Kfb2iXgI6dOC9D
	j1WBAwBDfwiUE8TSD+0pWSx3mcETdjlBgluNw0Xvy4EdlecGpXAwgRoapuezzLJUZMLYbHvOngKQy
	TyoAyVYCKbkhOm+bW07d1abD+LJ+zQMHytdYlym9aRD2xM4JowTUtxa28azdAcBlmJkABcFodVlfC
	ZSisVzwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZD1R-0000000EmT8-2cL6;
	Mon, 15 Jun 2026 19:31:01 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZD1L-0000000EmSQ-12iV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 19:30:59 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-137ec563a95so3993060c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781551854; x=1782156654; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w4IpH5LEDaSFvAvPiFPbj5ZjEkRtPbLsUPqVa2w6YN4=;
        b=ojL9TwkyKbAPFg717+JvYGFG3++egrJNgME9vhAPN5Fi8vBJ/sF4fRWmGmtbw9/zoL
         dkPDnDS/iddjqrWD7qE8Mcm4CBqcOZhaAMphTiv6+tC8D1Scs/CUSOSc2e/9aHIluSjP
         JlngjUrX0LWSKMcNfhwKQj01XbFzafDZ60g034I/7ok9/Hz7nF1nVlmAoEq/SXNiIiZh
         +MbbJi9Ci/MIAghfMpAmTi8cWmnnE6tiwMTxtUv6lFsNelCaFVDMzCpmOifMdGh5qRNX
         Pya10DWU5PuyUfl1aul7v1yJJAB3Pf00MzsgzHyxyW8UzP61hf3gv1VKNxB6lnrLUxxI
         oTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781551854; x=1782156654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4IpH5LEDaSFvAvPiFPbj5ZjEkRtPbLsUPqVa2w6YN4=;
        b=IDy7hcU+ZYawPm4PGzUZLzb0n7Ew30+e76vWeMuLxIbt5R7/Q2IehMBsM+DfH1fE/4
         qcJLrsygObfWQl5nB3ELEl6ac84GQbBzrdbWnjLUFZuFsUmZrPv8wxqThbNsf0rj53ug
         uHynao0QfkO5xOadN80EzIEWxYJdX9EU8Bq2km3UaCDyWDLQWABDaKW4He2xxOAsCjhk
         Jk7h65FmigopgeXOlcUu+Qn9a1Wge9U/Qj8Urx62ie8zf1qP7RNQF5ZZs3bb+3hb0xie
         QpjywlTf34Q5trkybVxj/nGjDHRxBA1tOPSW4hMpFaZWz00qYrIg8OBD2cOx7thRZnAk
         hewg==
X-Forwarded-Encrypted: i=1; AFNElJ9iTpsPZCPvBoBtCTZx+fxc2nljttim7b8Z9560JgTZOcpwIZXj2J9IZ2KHMyiaZR9qEN8dBjf8ZRwm+FPMygYa@lists.infradead.org
X-Gm-Message-State: AOJu0YzCUUCG1ypG1UgEozUXPhfVYEOHvLpG5nt5pyQx0m2eNVkHIznb
	Z11OYZCIIhXZVKWPfKaV18JW/2oODxnOySQdfbSNBSof4lbwYtbjh8KT
X-Gm-Gg: Acq92OHTbCsP3RO2BZmukIv+OQjXJCGCuYWKQqNe8ySBeOvkvmVG8NDSAZcXzI9rcu1
	tBQDJCjjePa2tZRyB79FozlTFe8cDLEgZQ4bQpClbM4VbelXg6tAbG7K7nv2oDw94gDsqsQpd6W
	Y+ur5BwLd5mN2xxtxHNHjFL8Kpnv0UUxII895WVUZlyrSS4cd8KOTEeA215qwHgAK/pReGNlFB6
	uQzh0F9mcZ9DUynqwk6O1JeOrODrVqKOFnJOKbGCVmIE0tjsOdErUw78y4RH5e/zXoxCT2s65fY
	2G34Ziwg/rDPKzZgd75rvJAY5DWeXO555YvBoJjcHKxJfNTr+tT28qNLbt9WJ1Wy0qVphDOEyr9
	qPfCkNGZLCOGvoQNUCc/3Vx9HBba6l/JkhDqT8NyV2DVxuZWlxI27nWB4ifblR7dhR8UA7Szn7Q
	Aq+X4V19wQLGSNfpou4XbI
X-Received: by 2002:a05:7022:60e:b0:136:e639:9c22 with SMTP id a92af1059eb24-1386f39567dmr5125138c88.21.1781551853685;
        Mon, 15 Jun 2026 12:30:53 -0700 (PDT)
Received: from geday ([189.115.92.220])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b97570asm10735958c88.12.2026.06.15.12.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 12:30:53 -0700 (PDT)
Date: Mon, 15 Jun 2026 16:30:38 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] PCI: rockchip: drive at 2.5 GT/s, error other
 speeds
Message-ID: <ajBS3tGp0wqLyVq7@geday>
References: <cover.1781207474.git.geraldogabriel@gmail.com>
 <4ac5cd7d2271df375ed6307f5c394247721395d9.1781207474.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ac5cd7d2271df375ed6307f5c394247721395d9.1781207474.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_123055_292421_D3A8401D 
X-CRM114-Status: GOOD (  24.46  )
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

Hi,

On Thu, Jun 11, 2026 at 05:04:22PM -0300, Geraldo Nascimento wrote:
> Configure the core to be driven at 2.5 GT/s Link Speed and ignore
> any other speed with a warning. Also drop the 5.0 GT/s Link Speed
> defines from Rockchip PCIe header.
> 
> The reason is that Shawn Lin from Rockchip has reiterated that there
> may be danger of "catastrophic failure" in using their PCIe with
> 5.0 GT/s speeds.
> 
> While Rockchip has done so informally without issuing a proper errata,
> and the particulars are thus unknown, this may cause data loss or
> worse.
> 
> This change is corroborated by RK3399 official datasheet [1], which
> states maximum link speed for this platform is 2.5 GT/s.
> 
> [1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
> 
> Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC driver")
> Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
> Cc: stable@vger.kernel.org
> Reported-by: Dragan Simic <dsimic@manjaro.org>
> Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip.c | 16 +++++++++-------
>  drivers/pci/controller/pcie-rockchip.h |  3 ---
>  2 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
> index 0f88da3788054..5a2876d7c8547 100644
> --- a/drivers/pci/controller/pcie-rockchip.c
> +++ b/drivers/pci/controller/pcie-rockchip.c
> @@ -66,8 +66,10 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
>  	}
>  
>  	rockchip->link_gen = of_pci_get_max_link_speed(node);
> -	if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
> -		rockchip->link_gen = 2;
> +	if (rockchip->link_gen < 0 || rockchip->link_gen >= 2) {
> +		rockchip->link_gen = 1;
> +		dev_warn(dev, "invalid max-link-speed, limited to 2.5 GT/s\n");
> +	}
>  
>  	for (i = 0; i < ROCKCHIP_NUM_PM_RSTS; i++)
>  		rockchip->pm_rsts[i].id = rockchip_pci_pm_rsts[i];
> @@ -147,12 +149,12 @@ int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
>  		goto err_exit_phy;
>  	}
>  
> +	/* 5.0 GT/s may cause catastrophic failure for this core */
>  	if (rockchip->link_gen == 2)
> -		rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_2,

Sashiko caught unreachable dead code rightfully here. It looks like I
had got it right in v4 and then the fix regressed.

Will address this for v7 after I get more comments.

Thanks,
Geraldo Nascimento

