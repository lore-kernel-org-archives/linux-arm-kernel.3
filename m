Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35876C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xXBMyr3a24w42Hc2gtdgn+BsDN4EYOyghaNbSmA4iw=; b=RCVnOS2G0j2genZtLm8vPB6Dam
	0pVsoxo2VJ5jbwHBarDOGDTi1ikbu/ngfcofVLdmIGTb8maPOWylhAFIYVoeeNe19oVKs8drlC1tU
	kyTKvm9a/DGFzNfg2ofi2S/zIdQYTWwIRCzq6R2JSo9EHxybFdS974CwSr0f7FWCYn5Ghtp1Aiuqo
	fRVMo+CMuOukMulr7CM4sfRfX95Nq2873QLLsulpi/5MYrkz4L86iQm3cEIeREr+S0uO0CboifQvh
	i/Gf75axVEiMzo26FfqTAmhT8AxYV4Z4RGzuXQGsrztlBUXpX88DBm7q27mwCzWy4qSYwJK1fg5dh
	wOSa+9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e8f-0000000BNlr-1qT9;
	Wed, 23 Apr 2025 17:44:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7cyW-0000000B8BJ-22is
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 16:29:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7cyN-0002kv-71; Wed, 23 Apr 2025 18:29:19 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7cyM-001kOA-2j;
	Wed, 23 Apr 2025 18:29:18 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7cyM-00H6e4-2N;
	Wed, 23 Apr 2025 18:29:18 +0200
Date: Wed, 23 Apr 2025 18:29:18 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/3] soc: imx8m: Cleanup with adding
 imx8m_soc_[un]prepare
Message-ID: <20250423162918.en4zmphifvot43dt@pengutronix.de>
References: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
 <20250423-uid-128-v2-1-327c30fe59a9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-uid-128-v2-1-327c30fe59a9@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_092928_524817_C5430BE9 
X-CRM114-Status: UNSURE (   8.64  )
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

On 25-04-23, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> There is a common flow to i.MX8M family, map OCOTP register base and
> enable ocotp clk first before read Unique ID from OCOTP.
> 
> So introduce imx8m_soc_prepare to do ioremap and enable the ocotp clk,
> and introduce imx8m_soc_unprepare to disable the clk and do iounmap.

Wouldn't have gone that far, but the changes lgtm.

> With this patch, no need to spread the ioremap and clk handling in
> each soc_revision hook.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

