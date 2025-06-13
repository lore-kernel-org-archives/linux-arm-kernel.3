Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132AFC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 20:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeqoJN1VtlXAfshyNe71l2zrQUFvyNq6mFSXz5PurIE=; b=wicdeqodjlDMIx34cE6Jq8wcXq
	USH4cjiYSQ6MBa4bT/Dn6/Iu1MVV2DIYxSvT2rYtte815jGcCAvcb246aDW4EsOmxPPPUXV0G74q1
	ZIarbtZLxvzGcZ7llZ7l7JKA0QsvV0wW4FsRaOoxmZpQaP7wTyye9/8Hiy7dDkycEICm6OwOF0sR6
	bMJjMi0lVvgzdGMQDcYPnGkN7R2KBS1aMYjTLILRJ8Ugh13I8l2w6Zr2Qk4TxhU+L7RAtoDTmIHaF
	CirQTvyMJDjfauHhKXMcr4vWjd61MEH1yx9fPT/RFzOfowPK6amdSwe2JAAVk6WEVhI1py6YAjve6
	SL/lNZjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQB7L-0000000HaPs-2gaL;
	Fri, 13 Jun 2025 20:35:15 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQB5A-0000000HZwS-1W4d;
	Fri, 13 Jun 2025 20:33:01 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b2f0faeb994so2831082a12.0;
        Fri, 13 Jun 2025 13:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749846779; x=1750451579; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MeqoJN1VtlXAfshyNe71l2zrQUFvyNq6mFSXz5PurIE=;
        b=ho3g5wFyPW4d99EV2KcjtPFhmXIByVc7VUqTF7RvHRHKuHp1Is8ETcfCJlZx0vbCjW
         RBi5j7UgDKiI/zDoj+n9804NdZia+wbuORJHZ9QkmiECNYXBiF18saKPP6MbYlXHzAsh
         dtDPT9WZkbvAqnJDIZznaURolCI6qqa+V9lReNBPBoHuilyZruXzURsZrYds2SFORNF5
         4Sa4lYloOOAd43+jCqmSeZYtiBAFLbW7OB5t1Vg6N+lBHYs8bkwFC6tZUUnkj8n39xxf
         kqcDmd6MTeVS4Lh8B9pdB/Z6vTex8QMp4PKWxPg3/82Ay3QbVM5qLqklgmwBaevMhAtt
         VHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749846779; x=1750451579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeqoJN1VtlXAfshyNe71l2zrQUFvyNq6mFSXz5PurIE=;
        b=srNIpo5TfoU8dIqW7mBpcCPatSQ3O95e1vj/dm+gR/PxIhXmaQ3qGhDn3Z/KwtCoAl
         9IEZnJpxcfsAYA7RhbJTnFx9g8TuF2KZMMr2IUnJHCboakfVafK35fBZ9/+/2GzcY9Yw
         JYpdRjjyI4XAscWrgo1kPgKwFpzxUlgPUlnW6LfV66/8+QCt4opHISJci5++1oIDfYbP
         vSV75GwBVqdAKWhPc3pDL2/FtbQLxdtHEg9TrZf+5wMC2zS0nPQKLs3yymnioWRLGQHe
         AzxDJp+NStNo/3+2fyOiYDo9SZfga9eA3ek8/15Xu3fyw3xW4CfeRPr10WqwDRSnm3aQ
         ql7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVE4SSxy5sybz9kXE52SGq8pb+o0kUVVIc0MhhN3T+o1rD/eJWOXHX4HShIb3q7ou6paJzUsX2oNu7X@lists.infradead.org, AJvYcCWu5Wi7OQxxNaWoO5xqIRJk3KLygkbNE9AKMN0B7Yp7MDLOCnEwczNpnxSufscSrpSI9tkGUKAsyhdtNlWbcA2x@lists.infradead.org
X-Gm-Message-State: AOJu0YzUTuLQKCr06uRXhyvBMF15/XAIoydjb9nCLZt7Iw9/yEQS9Bgi
	Lg2Aeq0/SRSISuPNpAfu15zFibtvFkKHQNAkelD9c2pIJp9tfIytMF8Y
X-Gm-Gg: ASbGncv3rRZR5LhdlLIMcMhlmUEgl4ePwyLRClHYGmOH8pUjqhBZxHQ2qfNmocOO0rA
	zDpbUt4xgP8Tln6ao+vkeGA5F60eoP2zdqms0Oarlh4zH7wCel/8mkzdBUXPxjPmCKBcX/JgErS
	/hr6JRPLcrANydYnSEAZhB9WYoEGWCZoi3tPtqgsZ/NEoOlQd035pZdhLAMHDBeI415o9ul1Ak/
	chc3OhZrfYOMY1wk3j30fwNk5NBmBWUlrq6uYvXtp49aA4YYOnG7/lOboz/o10VZTc07PqewUNN
	GPRvFGX9QA/0F4i13nXumcN0Fqgs7O6K9+xT6Sseggab5wwBGg==
X-Google-Smtp-Source: AGHT+IF94BUUijNOoyBUX4URz+4YXCZAGHiqdCm6FPEJcMyBQe0H9exqeo272TTJAvxI2G2WRqOyNQ==
X-Received: by 2002:a17:90b:582f:b0:313:bf67:b354 with SMTP id 98e67ed59e1d1-313f1b87a40mr1776345a91.0.1749846779495;
        Fri, 13 Jun 2025 13:32:59 -0700 (PDT)
Received: from geday ([2804:7f2:800b:84a2::dead:c001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c5fd7esm3812515a91.37.2025.06.13.13.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 13:32:58 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:32:52 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND RFC PATCH v4 5/5] phy: rockchip-pcie: Adjust read mask
 and write
Message-ID: <aEyK9BcyZq1qiNQD@geday>
References: <b32c8e4e0e36c03ae72bff13926d8bdd9131c838.1749827015.git.geraldogabriel@gmail.com>
 <20250613202056.GA974155@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613202056.GA974155@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_133300_403298_C003278D 
X-CRM114-Status: GOOD (  15.46  )
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

On Fri, Jun 13, 2025 at 03:20:56PM -0500, Bjorn Helgaas wrote:
> On Fri, Jun 13, 2025 at 12:06:28PM -0300, Geraldo Nascimento wrote:
> > Section 17.6.10 of the RK3399 TRM "PCIe PIPE PHY registers Description"
> > defines asynchronous strobe TEST_WRITE which should be enabled then
> > disabled and seems to have been copy-pasted as of current. Adjust it.
> > While at it, adjust read mask which should be the same as write mask.
> 
> Not a PCI patch, but "adjust" doesn't tell us what's happening.
> 
> From reading the patch, I assume that since PHY_CFG_WR_ENABLE and
> PHY_CFG_WR_DISABLE were both defined to be 1, this code:
> 
>         regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_conf,
>                      HIWORD_UPDATE(PHY_CFG_WR_DISABLE,
>                                    PHY_CFG_WR_MASK,
>                                    PHY_CFG_WR_SHIFT));
> 
> actually left something *enabled* when it meant to disable it.
> 
> Maybe the subject/commit log could say something about actually
> disabling whatever this is instead of leaving it enabled?
> 
> PHY_CFG_RD_MASK appears unused, so maybe it should be just removed.

Your line of reasoning is correct regarding the TEST_WRITE async strobe
register, and there's a picture of the flow in Section 17.5.3
(PCIe PHY Configuration) of the RK3399 TRM, Part 2.

I'll make sure to be more clear in the commit message.

Regarding PHY_CFG_RD_MASK, yes, it is unused AFAICT and can be removed.
It's leftover from BSP where the debugging function phy_rd_cfg exists.

Thanks,
Geraldo Nascimento

