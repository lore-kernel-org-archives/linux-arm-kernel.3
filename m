Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3AEC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaWeptwFmFTl0/+px3iUuNOqsj2l9uRyZ2IShzveQVA=; b=k34PxO20qE7uSBgKGxCE6iJthA
	wrkI+YWXpCFD0s9FLcBHJHRQyYPI2uiIOz/Ub07VdhfkAEg9QO7w7TE6PCb37ugqiyDWNir+F/trB
	yiLe/R6Vp6yIFtUv4oPuzfbyyunyoZqBv+4+/lkdPemn9e4PSBxlL92m032MZXiGnam4UL8M9qAAB
	64ccFlQgOz/2XiiGiWJx9Hj9tbz120nPX5Kxta78V/AswS3MRGAOgo4LsFz0miDvDNZpsXGJkrJo2
	s9KhtTexZ20NZ9O941WI3mYu4/OugKasTLRSPAIACyJ9YfqVjshrKtoPHRkJKt4uE0+gQk2cv/qoY
	4fg7KA0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGfX-00000009jB6-3NS7;
	Fri, 25 Jul 2025 11:32:55 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufG8y-00000009eQe-359I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:59:17 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bpPwC6pBLz6L56g;
	Fri, 25 Jul 2025 18:57:31 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3805F140159;
	Fri, 25 Jul 2025 18:59:11 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 25 Jul
 2025 12:59:10 +0200
Date: Fri, 25 Jul 2025 11:59:08 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: =?ISO-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, "Gabriel Fernandez"
	<gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Le
 Goffic <legoffic.clement@gmail.com>, Julius Werner <jwerner@chromium.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 12/19] perf: stm32: introduce DDRPERFM driver
Message-ID: <20250725115908.000074d7@huawei.com>
In-Reply-To: <20250725115655.00002304@huawei.com>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
	<20250722-ddrperfm-upstream-v3-12-7b7a4f3dc8a0@foss.st.com>
	<20250725115655.00002304@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_035916_919288_64E391A9 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

> > +
> > +	platform_set_drvdata(pdev, pmu);
> > +	pmu->dev = &pdev->dev;
> > +
> > +	pmu->cfg = device_get_match_data(pmu->dev);
> > +
> > +	pmu->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> > +	if (IS_ERR(pmu->membase))
> > +		return PTR_ERR(pmu->membase);
> > +
> > +	if (of_property_present(pmu->dev->of_node, "access-controllers")) {
> > +		ret = stm32_firewall_get_firewall(pmu->dev->of_node, &firewall, 1);  
> 
> Jiri is busy driving dev_fwnode() thorugh to get rid of all the directly references
> to of_node.  Probably better to use that here from the start.
> 
Need more coffee. Ignore this one, you still need an of_node here.

> 
> > +		if (ret)
> > +			return dev_err_probe(pmu->dev, ret, "Failed to get firewall\n");
> > +		ret = stm32_firewall_grant_access_by_id(&firewall, firewall.firewall_id);
> > +		if (ret)
> > +			return dev_err_probe(pmu->dev, ret, "Failed to grant access\n");
> > +	}
> > +

