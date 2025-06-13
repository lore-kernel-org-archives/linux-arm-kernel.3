Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9EFC71150
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXUd6lfewKPENm5Aa8Bd/d/D/7UIBoRsbAQtScnCe8M=; b=NgO8x1RUYhBb3V2DM2pnURD6v4
	waNC3BgsZdK4FFE6BOUCyhCORjkvHIQ3LICgOyQHjqj3UAnPHpvewknU6PDsIZFfJz7H+0C7sKmEJ
	SeiX7tZxFLRfywSt12qxPfL85ZB4U0Z3Or4lRvg4GsnNdTIPBXrB5UKg+SbivYLyrH3GBMgwtC4vY
	JZ956wiN4ukJzirX7CnEMC6sbE8zN4J1kiV5XFc6OOhuHR5RiyB2t8u8m/gGVu1qadKumzHbPLq4l
	ckEgVq9wP0ObdBrfjyXyn65XZRMvqvpVo/Ml8TUvv1WpxlzUPH7GkHcQFtM7viUfLJO4Nkuk2LsUn
	Cz6mKPbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9hF-0000000HNfX-1Gzi;
	Fri, 13 Jun 2025 19:04:13 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8n6-0000000HEIq-3grb;
	Fri, 13 Jun 2025 18:06:13 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b2fca9dc5f8so1880313a12.1;
        Fri, 13 Jun 2025 11:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749837972; x=1750442772; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xXUd6lfewKPENm5Aa8Bd/d/D/7UIBoRsbAQtScnCe8M=;
        b=TL8SLiD6mrhtNO9f2Evs/vTwZKTGwrCL4m7eupY7h3DmNHa3g4a162xVVn7iTt1ETI
         w4yItZMROtuDy2+6QNh3lhyZ22CE+iSwca6XwOefYPHNikjEZU2KoenQFo2QIyD8bftS
         XBP19tDtuyWEFm8suKEWJllcg7SuT+PLy1t1OdtzkrkfZrmCdGenqNqZtYC6F6gamIAc
         uXIQxBcE9FcbpFeTQkpRvqbSRvEKfIyCFaDDOK1jMq+4evGEn88YyLcCn5yTSpi0GRtE
         KRHgZNMgnSRbVWcdv5xC5Iov5jEzit7zItln6Dvx3UxEflgpsj5UztW+swbDXXJ2GyGC
         rGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749837972; x=1750442772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXUd6lfewKPENm5Aa8Bd/d/D/7UIBoRsbAQtScnCe8M=;
        b=CkLj3hjw7qTER3JYx7AWNXwDmbOyAepPtoQ52MhHUqo+G7hMdpUahp60+Fe5LweGb5
         B5zn3/rlNJyRYjGnnteY4ZnLUDqkp9F25mITsF7tN0QOPnG0OLWFqcio+Z1A4BSOu66m
         ktln4DcWnmFWZlQdW4l0x8FwR3NVnMSNQ1eE+ecp1O7XPESk9blLpmBpWISlURdb3SGm
         5leLae0R1/QCEPyIOzb6xiJfIJWhHucBnSmMHf1B5S2iV4LEegkiEs6ecTbgKrkSVp+O
         x8zEDajLiM8wnQOhsKVA7KOPfZLCDgwsdyxG7kALwgzPbykVq/uReaoWBk7nEs0kyGpN
         k9PA==
X-Forwarded-Encrypted: i=1; AJvYcCWVbg5BN5yL+MwmbPii0Nv55MZQ8gDPW0tRvu3516hpK1S4c/HM1hzzd5hif0xO0d0roR0FcOdVT1WV@lists.infradead.org, AJvYcCXdHYqabom41W6n/gTC81oFovteIGnE9ye9bWdvgySDbjZQCHleOERxbDk2n3LPyw3LzhjOHECJVcdJWjJQVdtI@lists.infradead.org
X-Gm-Message-State: AOJu0YwF23Ded0kQd0pOY7fsPVARc2UOa8AFh/RLkzSenFwy5UKGxnzT
	9aIXrlLQy++5tIuFm9LcPtIjocV1fgCWyScrHhs7X3xjIHZ+JR2aJpJGHAoYZdGn
X-Gm-Gg: ASbGncvNJ1UQY+m6JXxNOXQA4oUW1r+Rl1YaTtFalQOpp+vpOXmAM+YEG4bK9HliR+0
	Fz5+fohHI7G8lJq8qlsCXtY3vOjWoHT6EB1DP7SAjjjDW3fuTvpKTKuTW0nL9WG6cI7HP1+i552
	e8ouVCEjIgtNNEugEBiGXb1P1qhRlBfThUDecRi7bQXQ/+vxvyPfo3XrgG4nZrY/JyYVD/qvwEW
	AtEBRVgWpQM3Suz+e/ICXb947rEDT6g2lU4L/8xt37h+2LMlkYOxcFuVTMvW5nYKtC72GTkVPnk
	Vks6tMS2A7EQYDiAmS/t/BEQLV5Fa+cYYOfRXYjHeeXL4UyjdtrzGH7IoPx0
X-Google-Smtp-Source: AGHT+IH2DqbuxD4MEb4wwFaAB966G/5kXTTb/l9FTKLx6klqy6VsZe3elDybbPK71Ba9qjzXcLhjZw==
X-Received: by 2002:a05:6a21:99a8:b0:1f5:535c:82dc with SMTP id adf61e73a8af0-21fbd668c44mr392814637.42.1749837971960;
        Fri, 13 Jun 2025 11:06:11 -0700 (PDT)
Received: from geday ([2804:7f2:800b:84a2::dead:c001])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1639f97sm1755775a12.6.2025.06.13.11.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:06:11 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:06:01 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v5 2/4] PCI: rockchip: Set Target Link Speed before
 retraining
Message-ID: <aExoiaPhqXPmv_Oy@geday>
References: <cover.1749833986.git.geraldogabriel@gmail.com>
 <1966f8ddc4a81426b4f1f48c22bea9b4a6e6297c.1749833987.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1966f8ddc4a81426b4f1f48c22bea9b4a6e6297c.1749833987.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_110612_916959_73876F90 
X-CRM114-Status: GOOD (  15.98  )
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

On Fri, Jun 13, 2025 at 02:03:50PM -0300, Geraldo Nascimento wrote:
> Current code may fail Gen2 retraining if Target Link Speed
> is set to 2.5 GT/s in Link Control and Status Register 2.
> Set it to 5.0 GT/s accordingly.
> 
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip-host.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> index 8489d51e01ca..467e3fc377f7 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -341,6 +341,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
>  		 * Enable retrain for gen2. This should be configured only after
>  		 * gen1 finished.
>  		 */
> +		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
> +		status &= ~PCI_EXP_LNKCTL2_TLS;
> +		status |= PCI_EXP_LNKCTL2_TLS_5_0GT;
> +		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
>  		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);

Hi,

I see rockchip_pcie_write() was added twice, in this patch and also in
1/4.

I'll send v6 with correction after I get some reviews.

Thank you,
Geraldo Nascimento

>  		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
>  		status |= PCI_EXP_LNKCTL_RL;
> -- 
> 2.49.0
> 

