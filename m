Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986A8106FD66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 02:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9hCuzuHEN/sMOidNnhHLkJz/g4iSobaxo8mhYZkdNU=; b=NLGFHMg2xyI4SDpsjRRVfHFjDK
	q/QNTaEEs2pII/H0ezhPkO1d6197o26P2NYQG5cIPm2I6RgHyfTODoDIssRylrE5tvyHWkxOT3IlB
	ariptHibQIhN1b5o8yWkaCM82qRSYjCqcOF2G/ehHccqPbc6PQH9jaeWIBPL5z3Hjf85zGKwPb5//
	mQeV4/Euf0guZoMSwtDev40e65Fd+TQh48rlKRJnB4QOr3VTXeKsz8NXG1j7PV1UT6WHlyBXdZQo/
	4o4y7vwZJnkqkrPbYb/kRY3giZUPjlEyi43IjaXqogbVgNvSolcZUSmhZdYtJyV2678nHfidsfAdS
	FU/lLYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sVD-0000000GHGX-3C1V;
	Fri, 13 Mar 2026 02:43:51 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sVA-0000000GHFE-0y29
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 02:43:50 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-506251815a3so14877281cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773369826; x=1773974626; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9hCuzuHEN/sMOidNnhHLkJz/g4iSobaxo8mhYZkdNU=;
        b=b+7czi3vmOhXwpsN0OjQGCunBmsqIMIL0Yxxw2l4uhS8hhZWHEaek2gpbLxUvsnMTs
         mqJLL/LakbsZoDeOCg1IxpjhigzPEeN6ei3NqdKE2y6aKDX1RvrRh9MPLxWpCbAvn/JZ
         9JCl4uUHgJti1VUlKj1adYZ8axAy9zNCLRL0JXgaYDsZhu2ug35CrgcN5YMfcPiQc9YU
         mlm8tWSH8Px/VcZf5ER3iuVZlsoe+Iy2Lw8siINd7Ejv2J7pSwW/4xaEa63ZIOBqqK9A
         oI3eUK7XwGU6pz1owto46w2dvmuVu87qkfjCF3nftuCZnGvAMM8nOb21xKWETmdR3NN5
         6mYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773369826; x=1773974626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9hCuzuHEN/sMOidNnhHLkJz/g4iSobaxo8mhYZkdNU=;
        b=Akz4IjSgEnXUMXJMvHqE2IGFKCE0NWu3ekbF7HY99IguFNsjqyqH2TnsayVw9JYNyM
         KYcwMHdQeS2O9jdwCHzOs67Lzmzn3sGiqRJQwOUXQdczIuaMK5L+EbyFw8a8DJYeJ3Nx
         /P0OZugi2BJVQnacyrLY+rd56tH6QuWO4IV7cnoiW4J3qU3ohLLx4ODAMPxz4mTNnPTJ
         wS09Ej9nvvIbJJcYcq6uoeWuXqUArceBOEm3ONg/TBPHH+pH7o6L+eCT17z+4u1xJkuH
         QLuH5BtL83LG+8bsoFN3KR/5kgblEuh8R2vSpw5A0ZxxhmVyuMDy4dr/xGCFH6vX9POA
         Cjqg==
X-Forwarded-Encrypted: i=1; AJvYcCVQYqXd1q16C2+/vnnJaqaAMl+aglFoPZvYkrYClNY/AHRluaT8hrWzzscYyuD63PjVWSlcK5NCrEOPxSETsqsD@lists.infradead.org
X-Gm-Message-State: AOJu0YyXe+lmf/hGVGZ+74ACv1oIeODFWcx5a61EgZiVH54Lu5xIB2ey
	5SV9SjdXrTrDql8zF0xRu5adlT2ccTArn7PNGbr6UE3PHBhfAGXQCVD/
X-Gm-Gg: ATEYQzySlo8jKsVBzZ5ieSfqZTe/9FO5w96+bmK7pqZ+TTZ/Hf5Nk+ZPU4LCdki8CAH
	isSA3wo+PXIlcQzfTQpmBCmbMDPO1nH8xM/HQ7uu0SaSn/vyuG5gYHaucK93ybV9djqgvi82omZ
	4eUTYRA4T/6ORkuMkBmUtcZcBrvAacspGZKTLfC2oH8PE5NeP/O4NN5y5SQVjg+CQWIdISTAqf6
	da6z2/v2HHxC04VfX+y+2Vm9eo9wk5dXdHGCj3QlNYTKCi6P897yf+xEARq21VBZ0Bo0tcV+gNy
	aGldK9ZuPfJsdSgtXV98h7lAWAF89NhQAjd8hE1nqzzkPLV53qJeE75fbwPsgfLJafQiu9ZsIwo
	hFQq1pkfKiO+W4txiHEDm95V8Ubl7a0ZZRFJER7EbcMwmXEhtOKmwIrb94jS+jjaJZ1LP1ZqYqQ
	rattyKtXrhOPTuPpY85v+m43A=
X-Received: by 2002:ac8:5fcb:0:b0:509:329e:bd5 with SMTP id d75a77b69052e-50957b909c8mr24981181cf.3.1773369825770;
        Thu, 12 Mar 2026 19:43:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a0ea844sm53518871cf.17.2026.03.12.19.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 19:43:45 -0700 (PDT)
Date: Fri, 13 Mar 2026 10:43:05 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yao Zi <me@ziyao.cc>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v9 3/4] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <abN5Xn5GCa_UqCbO@inochi.infowork>
References: <20260312012232.373713-1-inochiama@gmail.com>
 <20260312012232.373713-4-inochiama@gmail.com>
 <20260312193801.61c30de4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312193801.61c30de4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_194348_323383_6CEB71A4 
X-CRM114-Status: GOOD (  15.33  )
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

On Thu, Mar 12, 2026 at 07:38:01PM -0700, Jakub Kicinski wrote:
> Some nit picks only to be addressed in case the AI complaint on patch 1
> is legit..
> 
> On Thu, 12 Mar 2026 09:22:25 +0800 Inochi Amaoto wrote:
> > +config DWMAC_SPACEMIT
> > +	tristate "Spacemit dwmac support"
> > +	depends on OF && (ARCH_SPACEMIT || COMPILE_TEST)
> > +	select MFD_SYSCON
> > +	default m if ARCH_SPACEMIT
> 
> I know other STMMAC sub-drivers do it but isn't the defconfig for 
> the platform the right place to add this sort of default?
> 
> > +	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
> > +						    "spacemit,apmu", 2,
> > +						    offset);
> > +	if (IS_ERR(apmu))
> > +		return dev_err_probe(dev, PTR_ERR(apmu),
> > +				"Failed to get apmu regmap\n");
> 
> looks mis-aligned 

Yes, that's true. I will fix this.

Regards,
Inochi

