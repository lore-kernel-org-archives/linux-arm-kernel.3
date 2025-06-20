Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D593CC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJwPe4Na7egNR42KB/ME0LulyT8UQ11yNNRgw9O2r5I=; b=EEqcmzl8NKIqQNZvwTUveRY789
	3r+2xqdUOJ4MFy4Y/aL5Ku+xn+80YOTH6wrV/pbhTsV0+A6JXQ2vl2NR9yIkwqppXkhh/cLvDYlHB
	ZNJYfteHspW/habf7K1FCK1B+AUiKIDvQ8rP9FCcdTZ3S59onkjs5UX348YPtJqGr+vUr+UiQTUSU
	hGXkEFQA1yIhwfNlmFJ6S4XxEOCO7L1oup6aLn/ya/PuOrenZShPgyDW5QDqegGk4/opVGo3L/9VF
	YCkphNTh2OvrLjUEN+7T1CR+MPKEpOUypk5lj8l+unuhIh/4f1Mc0nT/SOb2u4+cbelVtxFhEUs0R
	AzpucZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdoK-0000000G0Bp-3OXD;
	Fri, 20 Jun 2025 15:37:48 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdap-0000000FxWi-2TI6;
	Fri, 20 Jun 2025 15:23:52 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b2fd091f826so1565240a12.1;
        Fri, 20 Jun 2025 08:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750433031; x=1751037831; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HJwPe4Na7egNR42KB/ME0LulyT8UQ11yNNRgw9O2r5I=;
        b=B48lLWXLqUlvE5bktEbbVdQqxkdFoayqlewxyIDtvqUo0yaBW6I0h4jRVI8i1tMQdJ
         nNO8XKj9somZnJCjfOthqELqyNNJ7DJSf9OfkpLBext/LVuvq0AZLwcAwzQ3yVc2vAf+
         NtjcKCl80LWimQT/4YuRoC6vxCuLnuNuS11agEeeF1LZgGY0Id30K6ddw2m4y9rVEwnm
         NyxlTHw3jd8kUP3yX3PRjRGdwTorqKKrbNfAsraLxQ2H6WY0JV7ZdOSYP/mxTsvo4L0+
         AQOg/JFXCLY/cwwb0aiMf8jF6SxjnlXQiBJxGOewpVojwbA2I7uvN+YVrgoFWRyh+REb
         dgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750433031; x=1751037831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJwPe4Na7egNR42KB/ME0LulyT8UQ11yNNRgw9O2r5I=;
        b=FnnT2j/tYXPIVlY6nqpZuD4AyM379HNWtwtymn+DUfjf6cPLJIQdUDL8M5h+KBBuXb
         icVMGfEPBbzW55AflAkp/ChnLFIhcDGML1xqBH+cA/YnYwfzFEX5J4KiZ29ugXhTDZsA
         80DCLib9Qim0qjD+eZhaa5jZ2+Gtjlx/bM5IAOK1mRjhLZxxD3XI2AsdJB//gfdT/IWt
         gWk2LAourzLXgqB33tTIEScKKpNS6kin2oov8B+ZWFcbAq+R70Pg8WyPkJUtPaPmQ7ld
         0lVG40u1aYJgt0x/BkANWE2OnfZZ+wxGD2cLMKrBs8pWVu0RcZgbYXcvBBvy49DdsWZR
         c81w==
X-Forwarded-Encrypted: i=1; AJvYcCUmFAaDkRC5Er1cwexfxO74RypFRlxSLitaoSn87Ipy1RN4xlXpBWF6ZUCblnWETyjA265LGtful4/cWj5WugHH@lists.infradead.org, AJvYcCXdALPFYSI3TkerinRv2LZovAcDDmQ3r7BJsYlWVY16js37f6HMghs60FJOVvEwu7Y1ivI1HnykGgwt@lists.infradead.org
X-Gm-Message-State: AOJu0YxgDvWwbWPSRXFUpKIqntGfIYpuOCoRK5V7pV75Yfi8f9JIbo5y
	izDUJLSwxBOpkFycoWw2GlpP/XTQ22V/99qkDuvTYLsrtaHWbsrdy3xX
X-Gm-Gg: ASbGnct5zOPpH5ZOoP10WG8I5LPqDtKx9Y4hh0eg/rKF/WptRDaKP9LKjQ2ATMV2Vkm
	6YX1+JhqrRNwvkdv4sfqfPTtS5sFRVUexntrKFzuNkRqkl8hEZ87eREvyZ5wg8rHOHcDQR3wwFb
	9dH3PpjSotY9ZZvHqhAcbEk3jQZkQHgzQNdEcvtcGhLVSqUgh5Papwdeg3+hJhjKumoDoZJssV+
	yroTvwpLbdh3WoraolYbYWzZd8xf9930BIqb32Gb/+vSfB6G8yTmpMzVb/0UyOsS4grz9q4lr/q
	58tuPu4kvcsuzMKpABNdDz+NXnvZ9lWX5pRPPtXrTJOu+85/Sg==
X-Google-Smtp-Source: AGHT+IHFRRH/nR58cuUa9CJCW89Y1XthgS4quVstWRXVLKvN5X1n1m1ZpPRMW8SNJyW5hNR+qXcUTg==
X-Received: by 2002:a17:90b:54c6:b0:312:dbcd:b94f with SMTP id 98e67ed59e1d1-3159f503790mr4589404a91.11.1750433030516;
        Fri, 20 Jun 2025 08:23:50 -0700 (PDT)
Received: from geday ([2804:7f2:800b:cd3b::dead:c001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e07d027sm1904055a91.43.2025.06.20.08.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:23:49 -0700 (PDT)
Date: Fri, 20 Jun 2025 12:23:42 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v5 4/4] phy: rockchip-pcie: Adjust read mask and write
Message-ID: <aFV8_k4vne-m3Rzh@geday>
References: <cover.1749833986.git.geraldogabriel@gmail.com>
 <7068a941037eca8ef37cc65e8e08a136c7aac924.1749833987.git.geraldogabriel@gmail.com>
 <d52fce68-d01e-4b92-825f-f7408df2ca18@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d52fce68-d01e-4b92-825f-f7408df2ca18@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_082351_632023_3EF9EC01 
X-CRM114-Status: GOOD (  24.26  )
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

On Fri, Jun 20, 2025 at 03:19:06PM +0100, Robin Murphy wrote:
> On 2025-06-13 6:04 pm, Geraldo Nascimento wrote:
> > Section 17.6.10 of the RK3399 TRM "PCIe PIPE PHY registers Description"
> > defines asynchronous strobe TEST_WRITE which should be enabled then
> > disabled and seems to have been copy-pasted as of current. Adjust it.
> 
> FWIW that's a bit hard to make sense of, given that it bears no relation 
> whatsoever to the naming used in the code :/
> 
> (Not least because the mapping of register fields to phy signals here is 
> really a property of GRF_SOC_CON8 rather than the phy itself)

Hi Robin,

will adjust for a better commit message, thank you.

> 
> > While at it, adjust read mask which should be the same as write mask.
> 
> Which write mask? Certainly not PHY_CFG_WR_MASK... However as this 
> definition is unused since 64cdc0360811 ("phy: rockchip-pcie: remove 
> unused phy_rd_cfg function"), I don't see much point in touching it 
> other than to remove it entirely. If it is the case that only the 
> address field is significant for whatever a "read" operation actually 
> means, well then that's just another job for ADDR_MASK (which I guess is 
> what the open-coded business with PHY_CFG_PLL_LOCK is actually doing...)

Oh, I already had agreed on Bjorn's suggestion to drop PHY_CFG_RD_MASK
for good from code, but I appreciate your input too.

Thanks,
Geraldo Nascimento

> 
> Thanks,
> Robin.
> 
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > ---
> >   drivers/phy/rockchip/phy-rockchip-pcie.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
> > index 48bcc7d2b33b..35d2523ee776 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-pcie.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
> > @@ -30,9 +30,9 @@
> >   #define PHY_CFG_ADDR_SHIFT    1
> >   #define PHY_CFG_DATA_MASK     0xf
> >   #define PHY_CFG_ADDR_MASK     0x3f
> > -#define PHY_CFG_RD_MASK       0x3ff
> > +#define PHY_CFG_RD_MASK       0x3f
> >   #define PHY_CFG_WR_ENABLE     1
> > -#define PHY_CFG_WR_DISABLE    1
> > +#define PHY_CFG_WR_DISABLE    0
> >   #define PHY_CFG_WR_SHIFT      0
> >   #define PHY_CFG_WR_MASK       1
> >   #define PHY_CFG_PLL_LOCK      0x10
> 

