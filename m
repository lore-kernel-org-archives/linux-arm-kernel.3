Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44EAC282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 07:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtMGM041I5kro2RjmWShV9CPsEst/OCLnATvQUnwaLQ=; b=d1Fw4XOcFWv/eeK8J8AJMa5bFr
	eislwRb6/toN3b7g9zrH6gMHgq5bk94irriXb5MuypFpZ6l5byzeEdBBV/Uc1S6i5QNjzCNFWZxbD
	pmqtalzRARbllen7iMu+bwNXc0YlFiwNRG4EsK9X21pLthGs7Vsto5o/TskfkVEaTcYAJfEc6ea64
	sIjW1RW+Pv2XnylnKLkF4cLkENA72+c7yiHQZdZZhyYo4uWsVKK898UVIPREcaiG4Fl3VryL50WG4
	wjMZOsXeJS2wGVjnad3RlYR6U0vuWJRVo1x06PVkYp83WLXBL3fIPbwOsL3yvm+l7p8h9xSCQQecS
	sQDXJvkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpj23-00000007Dzi-3nac;
	Wed, 05 Mar 2025 07:19:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpj0S-00000007Dos-24Gc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 07:17:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 208895C662B;
	Wed,  5 Mar 2025 07:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A394DC4CEE8;
	Wed,  5 Mar 2025 07:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741159047;
	bh=Yy85xq8NIgFIUxeo+qTOi/d7W9oIiEseG9gB1XAQxeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUiAhT7qJHIBOlUA9LQIqE7zQPWhNsl3vdLD8qp/zR2d+AQgbUNdX/HpsePBWObEK
	 1UhdBPAet5nW/Xquhte+SwXcZjcRMIN2S9EgmhpMGFrjFgjY3eLhqTSk07idrXo3aW
	 l7BoyPnkrf5wIYCPl/fh/JrW/XG3ruf+IOKj0ziBI7mwH2BumfjIZwE5kUCBL4NqeG
	 JX2BDaMIyXwSwPTDm+q70J3eF1TRgxw7soxYxgU3d767Bu5sN/nWO03p79pPVgEYzF
	 dRCNceR2+imFbmYxQfVluGzhcJpD9hIK3FC+qcCAwuYN255LVSet1Ir4VFs6XA3kPu
	 f9i9If8u8VUvg==
Date: Wed, 5 Mar 2025 08:17:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@ew.tq-group.com, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 3/6] pmdomain: imx93-blk-ctrl: Scan subnodes and bind
 drivers to them
Message-ID: <20250305-keen-shaggy-bullfinch-fc77fd@krzk-bin>
References: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
 <20250304154929.1785200-4-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304154929.1785200-4-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_231728_576590_8171984F 
X-CRM114-Status: GOOD (  10.32  )
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

On Tue, Mar 04, 2025 at 04:49:22PM +0100, Alexander Stein wrote:
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> @@ -297,8 +298,14 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
>  
>  	dev_set_drvdata(dev, bc);
>  
> +	ret = devm_of_platform_populate(dev);

This means in remove() you will depopulate in different order than error
path (e.g. after genpd removal). This is rather unexpected - remove()
should be cleaning up in exactly reversed order of probe. Not sure if it
can lead to any issues, but usual recommendation is that you either use
devm() or not.

Best regards,
Krzysztof


