Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48736EB3649
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 01:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvu4CKE+k1dKhf/6IPTDYQpL3MikIJGAowExFNxiKNs=; b=jOGcCjFhwB90Gb73OYVc1Tz7Jn
	LefdR3GSDNEgZgYqBsYWavwJ8PFqwJLlSzSzbBwHfbAaAmdW6CPYwlNGaTP1izVaZEgZja3YfBCbF
	jULfk7bFpBUF+f7tUPGnCkEXbyaE285bGCOx8bkU8k/vb5x0Yhb6QZP0LgjW7cfIOW45eOxBgjsQn
	BDxUxozJx1mrsxGK6f2gKN4kbwAgPJuErQ6upX71BX71jJBLMFttgukjo+mzld0yUyQznUJogeIlV
	iTNjr0JXg0S7n5IhhPaDqMB/SmRmGGHRQDpD9bbwhiLGHHWc+opbq5YUnt4KBSQNLjd8etsAc+S+a
	uD2VlqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEEd-0000000EJOe-3xDa;
	Tue, 03 Mar 2026 01:07:39 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEEb-0000000EJLM-0KkU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 01:07:39 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c70ece855e2so2144587a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 17:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772500056; x=1773104856; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mvu4CKE+k1dKhf/6IPTDYQpL3MikIJGAowExFNxiKNs=;
        b=PffRCNbm3Ght3DBDzWLuTlchMXUdWWkh6bkahq7kqj6S5+9r1AYhcD3VNmpR6CACbl
         sw8Chz/pK4e9S3mh/VMS5WeTCILYdFYJxUstjTjiELoocMvlPYF9PI/8khhP6gzSpART
         IpnO2CT68BGFg1uekNfd0UldsTw9isPXM8OvCVAqgI8VXArPUgWYp9hlrkzqxVsQVbUU
         BnoTX+ZX+REuYS8QjupDeEdDCv1FmyiFgxjYfPGx05p+NqRq4nDCtEGlCNQrvLHAmGbF
         NzOUH22Ameg/iQTZtw0Jc+TYGNVPL2LI8ttjN9T1x8GRyXQjYdXaXI6pXgs/3P2mc6fz
         xUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772500056; x=1773104856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvu4CKE+k1dKhf/6IPTDYQpL3MikIJGAowExFNxiKNs=;
        b=bGid6qaq3wuR6Hj0P9ssECuxEJuUtL9fx5TH0F72aPTeBCaTdFo8ko1PTftogBvj16
         UH8SVJLoSj0S98mfzoNCKZSXvYch3NeqDC6cUytwE66Cc6tTJbMPUllo938pbr2RWQgq
         5iU4hg7iqIBr2S1MCJgnPIuwsLtP2I3o5LYbZzqRpVHysOfhivJVOedsJrW3qSuMa6BY
         QHRSIKNflmWXlIpHTbtTXz9SE5LIvXpFwS0EWUl1KN3vZSaLbZaKDAv/VCiLzlVCoyKw
         ghxg7KYxQBItRhFMvSFJZNgxtbBM9G2tyzZ3fNree+hT00ATox/e1O4gvmoCxC7dOAIR
         7Mng==
X-Forwarded-Encrypted: i=1; AJvYcCWnZwPAomxgxkFJy7G1zQ92qmWwAdoCOKZC86HqINkHA2PCcpz4K1ZWrjHhfmpRipnM//aBBC+omRUTdsQEI0vv@lists.infradead.org
X-Gm-Message-State: AOJu0YyX/c6Ff1YieFQZxY43Q3jA5ZuuaZFkDYY4iRJi/mXld1GdU/gB
	VK4Yp4i2LYTsaWP9BCyH1suQU64Vw814JFATuEp991y4kvxpGeCg9Xbt
X-Gm-Gg: ATEYQzw4sxNnAAIZsCTqUWJ3hHj7I1rMPiUUnHpvlLjwBJpD+GLsJ9rxml1CFT9US4+
	WzqmJJI6neE2G8PC4gDb4Me8ocDjHGE+V3LJvHvdtHkFQswA9wHH7IG8VPZjRyhN2PmOygpDRWv
	n1v/qjTETQptnv/h/ARU6zf13bYZ93U+d3S6dtrQAcsZKK5tzuDQXu3ihlWfvhTvGss8xEoeztb
	P+Te2SlieMu6V2Bdjj2fhxquvA8gddlActQaLz2y7vwq9+bbzR4v3zgC+7XLe5dAM5dWVmO9ody
	i2pl1shPKycR41S3x72LN9TorSxWIERvRFxQ0XUQBERyr1ZONcVOLA4t7IlNGE21EOLT96flACq
	wZGz8Hgxgyybadr8d7mmSDFaePnOkicbBP1VnjxAvBCGjYW7L0Us/9GDsqk9zpIzJcVz5S5klRP
	SN7S00qdya4rIa0GBV4UKT4g==
X-Received: by 2002:a17:903:4765:b0:2aa:d2f4:9c11 with SMTP id d9443c01a7336-2ae60c60e17mr3650915ad.5.1772500056123;
        Mon, 02 Mar 2026 17:07:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6fe4f3sm146608315ad.91.2026.03.02.17.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 17:07:35 -0800 (PST)
Date: Tue, 3 Mar 2026 09:07:08 +0800
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
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aaY0KeKuFwM-5wuS@inochi.infowork>
References: <20260227075718.2243818-1-inochiama@gmail.com>
 <20260227075718.2243818-4-inochiama@gmail.com>
 <20260228131845.70421792@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228131845.70421792@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_170737_116237_4CA13ADC 
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

On Sat, Feb 28, 2026 at 01:18:45PM -0800, Jakub Kicinski wrote:
> On Fri, 27 Feb 2026 15:57:17 +0800 Inochi Amaoto wrote:
> > The ethernet controller on Spacemit K3 SoC is Synopsys DesignWare
> > MAC (version 5.40a), with the following special points:
> > 1. The rate of the tx clock line is auto changed when the mac speed
> >    rate is changed, and no need for changing the input tx clock.
> > 2. This controller require a extra syscon device to configure the
> >    interface type, enable wake up interrupt and delay configuration
> >    if needed.
> 
> checkpatch says:
> 
> ERROR: "foo* bar" should be "foo *bar"
> #110: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:45:
> +static int spacemit_dwmac_set_delay(struct spacmit_dwmac* dwmac,
> 
> ERROR: "foo* bar" should be "foo *bar"
> #148: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:83:
> +static int spacemit_dwmac_fix_delay(struct spacmit_dwmac* dwmac,
> 
> WARNING: line length of 99 exceeds 80 columns
> #243: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c:178:
> +	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node, "spacemit,apmu", 2, offset);
> -- 
> pw-bot: cr

Thanks, I have updated a new version.

Regards,
Inochi

