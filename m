Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B5BC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pF6qsVRp/ynTp2yRc9Y/qPH4ccaUnT2tJzJbz05IV1c=; b=EFaTcBK91eWEndIuMc7zUPXMbo
	lnMVpbcdb0x6jVY310LoU2NeIEqv0UKXMxeiVln6fBkgOlE9bEJfUWQyuRgcn3wAUhRtoGirSEsZM
	icpU20W6Mk/xAOwKcwSaGmGDttc2NJgXxqjp5PgtJLnFhtCWrnJ0o9II94o9vQaZkUO1ir+JM3gSy
	N6dyySnCHyA7NNdeQ0hy//BzScR/+rpgI75lUOlxAcYr7HEr1DWCmv5DkTPDvDiSaKPlvbdu1YDS5
	sPs4o5viOFEyaxZQL4+Y7a5YpR4lTZnYlp4k6HGtql+/BmDbJ0kzlU5q2DPTjFq4o+0xcI2i1Y4P4
	+93Vuzcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopPh-00000006Kwx-2n0h;
	Tue, 28 Jul 2026 21:32:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopPg-00000006KwW-2iEx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:32:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E792D40E38;
	Tue, 28 Jul 2026 21:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0310F1F000E9;
	Tue, 28 Jul 2026 21:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785274355;
	bh=pF6qsVRp/ynTp2yRc9Y/qPH4ccaUnT2tJzJbz05IV1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nRQD3VZgBgKkO/5uSFj/C8fT3mHdEYFIDxMtSx+SAEwZ627vDQJ8kT902LIF3/VrI
	 6tEBT/NfZdpoMS+697uakFbh6PDCoJOFQvnWD/d9SFq+pvIx9sRAC7N5elClETWdNx
	 pl1CKQ6aRN7jZp0hjvYFIcjZB32K5cNEz9Bw4GOkKGJ7e/zKF9dpycGWD7PrxGPu7W
	 O95/K1mY+6Xi04dZkimVL1BEcH1efIqD7ELSOx7MgPLhGllMv++Ti9MfnijvdHAlyK
	 KcFt6mQnwq1jDr1fJAZzhkF6CE7OR1/kwfrS1k8UwHWPHMczJjCD/6D5SE8e4nj4h8
	 ZEzryOcjmCvEA==
Date: Tue, 28 Jul 2026 23:32:31 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Liem <liem16213@gmail.com>
Cc: carlos.song@oss.nxp.com, biwen.li@nxp.com, festevam@gmail.com, 
	frank.li@nxp.com, frank.li@oss.nxp.com, imx@lists.linux.dev, kernel@pengutronix.de, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	o.rempel@pengutronix.de, s.hauer@pengutronix.de, stable@vger.kernel.org, wsa@kernel.org
Subject: Re: [PATCH v4 0/2] i2c: imx: Fix slave mode corner issues
Message-ID: <amkftflH9EQ6JDQ4@zenone.zhora.eu>
References: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
 <20260629023829.152651-1-liem16213@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629023829.152651-1-liem16213@gmail.com>
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

Hi Liem,

> Changes in v4:
> - Patch 1: reworked to avoid race with shared IRQ handler, as
>   suggested by Sashiko.
> - Patch 2: unchanged.
> 
> Changes in v3:
> - Split the original patch into two separate patches as suggested by
>   Frank Li.
> - v2: https://lore.kernel.org/imx/
>   20260625160219.55116-1-liem16213@gmail.com/

you were already told not to send the subsequent series as
--in-reply-to.

> Liem (2):
>   i2c: imx: Fix slave registration race and error handling
>   i2c: imx: Cancel hrtimer before clearing slave pointer

merged to i2c/i2c-fixes.

Thanks,
Andi

