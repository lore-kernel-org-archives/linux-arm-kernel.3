Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F068BD2ED12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEeKRKNgnXmWzaKf1C0tW6uj5QVjxVimCmm99Tj3C3c=; b=DscVZbVR/zRXpjngKTxwhxJwO5
	BrGVo8nC8fezV9X9Enk04wDiLulaPDkJhjcExTCjQhBjSWd4U8JDZ6FfGzObQLBNFmws3neaonjM2
	YmU/fhxRYI86qzr0rl9qc4DVfRieXMk8smBcqbQVeCezkmXCFHn6a5lVdHI4iaoqhOK1uvyY9vgKD
	TDCkybdKmg+YPDZlzbS++RP+tO2WxCCb8ALDXaICXuihU6r+hU+v+3xVSah18Ps/nmSzKVsrW3cCg
	9pcUemoiQ9zNaGrlMQFn7wtW/cIksd6u69QHPHabk34OfqQsWYBOuJOP/B3cIi5nwSlwJN0+TmF3v
	mNbvobiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA9J-00000003jzI-0dxA;
	Tue, 20 Jan 2026 11:43:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA9H-00000003jye-40z6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 11:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KEeKRKNgnXmWzaKf1C0tW6uj5QVjxVimCmm99Tj3C3c=; b=ZCL2PQo7BewN3kxU6Ecbfm1Kt0
	uXJ3UIMIEcBE6ayFiSdnNCyIuVwErB8wg4lvjgVuPI8EeKZjgdyjn30QgfEQdTjVdcU8G6HUWFE9+
	HUYH/TAcAvwJfrnto+C0witi9n7R2YkpW64dd7cqMtFd8tuqw+GnruuweTxErybPITx5ieuWQT0mY
	tcxVenxFsjWvFza1ezj2E0bIB/Yf7mydhvgJcMadHVMeVbbXMmFV92NdyCXvNl59ZehcO0sguPVo7
	4C8rd0JrwUPYGuIt87KNtaIet+VjlUKwwa5+b81ILFDVBNO8z761OFn6ZbpS5BCMjppqk49tKtvP3
	AKmQj9ig==;
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA9F-0000000DwV7-0JA4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 11:43:50 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2b4520f6b32so7078898eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 03:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768909427; x=1769514227; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KEeKRKNgnXmWzaKf1C0tW6uj5QVjxVimCmm99Tj3C3c=;
        b=BSu6p4mjdlcsWWdOSDQLnPsLqmVfGrUnA19ir1bTwRlcRurS7AYLyAwCxZhZtPgBG7
         qI6xzonWAOof60mlIcllsXpRzhSGq60bIldqnolPTdSDhmtYDG7ymdjtvAgXLgVKJq9C
         BjeTALdZ5znaFdZmtnzrl/LLrPuyfGISZw1PYAzgzp8TANvqHQwvnQFkRuOQNaB1Anrr
         KkM3wFpAVNPe+TRtFArRt9jNLJHyep1gG5gd3bDyQpAB36Ojh+B0AY9CNtxS4A8pX6GM
         JTsXhzrckXUIF1O4Uot6zlKhqiuaAjs5GbS0aKULAb1HV+2b/ccWvZ5jLPVAyAHvHrm8
         YlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909427; x=1769514227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEeKRKNgnXmWzaKf1C0tW6uj5QVjxVimCmm99Tj3C3c=;
        b=dKK/pTeEDSf2xqN4ePEsSj59HoAG7ft0PaN/chfGyt9wXKO5ccMwoS0+dpbUt3AI5P
         Al9yRhfF2IvhmhVhZ9grFHZTruOLsw32zw2mxWBM9etxZMydpu30vrK4fBvDj/rW6FPR
         3tnNEtz/6dXl/J0gbEjeCVrw4179a7Frse8HyMaGEJz2oF52nnLfCrCuLZrB4/WoTOPr
         9NZ7j5Ap+5SxY2AhHqbKciYQTl2ngo5FvoCm11PYbO1VLe3NN1jYLQtgsxT6VeZaRJeS
         LSsKgyWGngYKmb5HzIKQaJFZz8jBoy3lM7vPqjoSquBLIBEomS2neUpfCM3LUHTbxw0X
         cECw==
X-Forwarded-Encrypted: i=1; AJvYcCVl2BFjz1CbCIn3Olg9+oVBf8YZH/bHCBTEz/PnCUCSg0FT2FL/4Dj0Nrh52BPlPMOZ2MeLXijISg30431ooX1U@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo7KDG2cyjFInxD6OiKtInlUgTF8K6odK6WM261tsVt1ILtGf1
	fC2gfZM5sotspFSQaA1X3DE4IWyDljatxRV0CHKnx01CnkWuXyHechFW
X-Gm-Gg: AZuq6aI/03dYHLmkd4dMSWSUPw7holmarIenZ0v/hqz8xEATtJXqWs4qZg+f5SH9U9O
	LNeIkj4sepjspsNWxel4e/HzGPvmvryTQ7LDsJkcBpmMk3/zag43mvwK9OGVdCjIDoONNH+bvRc
	Zd2HOlnAIubBbHz82Tt+QQfMPAQDlDVDkzzASTNl7LlOiWDN2o7w91O+dAOXrfBANe18LJFscSg
	LZIdaypHOojrnUa4wZ6Pfsm8e6Nb70XwdjNsIJPlb9lzq4D8l8gqncD6qhMlAQ2z62gS/KA/D/j
	GGdQtOzLubgPzIAYpSe8MZAaDciuVyTyYqNraO9IqyjPsiNCrNFrd5w/IPgqIlEPrGel/ked1Gw
	MBPNsnOb1QKxqP4AHS4nlZ9+TqVNMv+bxUl3i3Q8m7kI0NzQc0aA9rfaPdv1kccU1eL0HiAlDnC
	59CV/RLiBfEw==
X-Received: by 2002:a05:7301:2b05:b0:2b0:5929:4d1f with SMTP id 5a478bee46e88-2b6fd7add4emr884545eec.33.1768909426655;
        Tue, 20 Jan 2026 03:43:46 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b34c11dasm18506224eec.2.2026.01.20.03.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:43:46 -0800 (PST)
Date: Tue, 20 Jan 2026 19:43:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Yao Zi <me@ziyao.cc>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Yao Zi <ziyao@disroot.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aW9p9By1ZW5i4iWw@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <aW9jbqBSgkiLLw8r@pie>
 <aW9m8YOVO1ClIQOd@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW9m8YOVO1ClIQOd@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_114349_278788_1D484F1F 
X-CRM114-Status: GOOD (  21.20  )
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

On Tue, Jan 20, 2026 at 11:28:49AM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 20, 2026 at 11:13:50AM +0000, Yao Zi wrote:
> > On Tue, Jan 20, 2026 at 12:36:08PM +0800, Inochi Amaoto wrote:
> > > +static int spacemit_dwmac_probe(struct platform_device *pdev)
> > > +{
> > 
> > ...
> > 
> > > +	of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps", &tx_delay);
> > > +	of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps", &rx_delay);
> > 
> > According to of.h, of_property_read_u32, which in turn calls
> > of_property_read_u32_array, could fail with -ENODATA if there's no value
> > associated with the property. Should the case be handled?
> 
> You cut too much. This had:
> 
> 	unsigned int tx_delay = 0;
> 	unsigned int rx_delay = 0;
> 
> at the start of the function.
> 
> of_property_read_u32_array() says:
> 
>  * @out_values: pointer to return value, modified only if return value is 0.
> 
> and of_property_read_u32() passes &tx_delay or &rx_delay to this. Thus,
> if any error occurs, these will be zero. In other words, a missing
> property is equivalent to setting these to zero, which is entirely
> reasonable.
> 
> However, "unsigned int" _may_ be type equivalent to "u32", but really
> these should be "u32" if of_property_read_u32_array() is used.
> 

Good catch! I always treat "unsigned int" to "u32" implictly, I will 
change to u32 for as an precise type.

Regards,
Inochi

