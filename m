Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C91FE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 21:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecMY+qe6V2ZZwm4eOG11+5a28KrQW4B2FtTiZbt4gz8=; b=W/vnbgy8ys2H6Kvh2HWLS/bSoc
	+seRMvMzj9TndDdZGsdp0RBOS26U9RGVZ2BRDBuSzOCeEPK+aUEC2P5Tn/FtBwVsNbpm56kMWESut
	u0bfKDUgUory8o4Pcy0D3JB0BIqxfi7DmMyJW+eOLV5RDf38SXJTVPvsMOR1iiBqvf5RlShUD/Sa4
	vcEGcz08yXwUVvqg6DkYfScpbFNtqAInzBoFpng+Ppo4+ujXPZ4FDL31tsSsbFqFOeGIg4jIXIMFQ
	oekHblERZRExUcuk2ckPVSE9vwqk2pT7yzUvH7Xt8ECOX5DdVOsPU2oYKLeJBK17UjVr2E3r9Go5q
	0mRp1Baw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVHUg-00000006Mpu-1UPf;
	Tue, 07 Jan 2025 21:52:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVHTU-00000006Mjl-1ISw;
	Tue, 07 Jan 2025 21:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BAE5AA41496;
	Tue,  7 Jan 2025 21:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B86C4CED6;
	Tue,  7 Jan 2025 21:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736286655;
	bh=TsCpx7aKGUcwB6mW8YLBLjC9e8pZ6xstkV3qO1nZsG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lvYfmm0kNt473KUEQpk9r7jj5m1XOUbMX1J0ej8kCZO/3PcWsvZbvaBKbYYwy3FB7
	 H4W2BvEjbEpsgcGB03DkO1p5RqcM1SutTFfAGnrkDN22CO5WFonk0HceIg+UH4nXW+
	 Bb/VuXarWE2h5W7ky21Twnc5c8dsfIdPN1NR9IexGhcUyq1lrPOXzCuC1LHtdmsGe1
	 3gMSvnZxAnQIciXUTlNm303nBwm9Jw4OWHAiwd8gQkCLTz0bhWYC/DAb/lsfWgw5hu
	 JRM99JVcAkpreyL8gcN8DqSzievz5Kl/i1A6BQy2JAY7M4GdXMQ4ZDIXJxTSzBUtcb
	 LEE0RN3JTCK1g==
Date: Tue, 7 Jan 2025 22:50:51 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zoie Lin <zoie.lin@mediatek.com>
Cc: Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, teddy.chen@mediatek.com
Subject: Re: [PATCH v3 1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <puotk7kms35fh3mgmsg24uxwadmcqjfr5iuijr2zknezcg7dtg@zlbrphpd6jn5>
References: <20250103143250.1521287-1-zoie.lin@mediatek.com>
 <20250103143250.1521287-2-zoie.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103143250.1521287-2-zoie.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_135056_417261_47019AB0 
X-CRM114-Status: GOOD (  16.57  )
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

Hi Zoie,

On Fri, Jan 03, 2025 at 10:32:34PM +0800, Zoie Lin wrote:
> This commit introduces support for runtime PM operations in
> the I2C driver, enabling runtime suspend and resume functionality.

Please, don't start the commit log with "This patch...", please
use the informative form.

> Although in the most platforms, the bus power of i2c are always

/the//
/are/is/

> on, some platforms disable the i2c bus power in order to meet
> low power request.
> 
> This implementation includes bus regulator control to facilitate
> proper handling of the bus power based on platform requirements.
> 
> Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>

...

> +static int mtk_i2c_runtime_resume(struct device *dev)
> +{
> +	int ret = 0;

initialization is not needed.

> +	struct mtk_i2c *i2c = dev_get_drvdata(dev);
> +
> +	if (i2c->adap.bus_regulator) {
> +		ret = regulator_enable(i2c->adap.bus_regulator);
> +		if (ret) {
> +			dev_err(dev, "enable regulator failed!\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	if (ret) {
> +		if (i2c->adap.bus_regulator)
> +			regulator_disable(i2c->adap.bus_regulator);
> +		return ret;

no need to return here...

> +	}

... you can remove the brackets...

> +	return 0;

... return ret;

Andi

> +}

