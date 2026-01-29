Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69FFD3566B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 05:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8g9KEFgIunZ7yiXqViIpFdBxgRp+JqqJxqb5IUpSZk=; b=QhmBMennSaAOKyH3Tc/xNm0hwc
	xBAOQ27mt9MTurC/OgvpEfASS+zqdyx08Af3fyi4/wPes4mn7kk5fP14QZFaCtooX2FrYje7Sihmc
	wxQajkF5ork2Gti1cZtW6eDl3b6kk/MUuKcnRO5qK7PWWJrFlR7ckm5Y20jQN156xSlwCwugvEPQF
	Y2rk3BYUWZBEvzwlMrRErzgGsvA63REzUQd8PQ1FsAB3M5EVz8g8nE5rTVwwTBjMpYRsjs8ie4Qrh
	5PItVUWWuFGWGAfS3Jj0QXvTESL9U6gTx0DpYSkQb/pFtTSGK9hMoxEj521JMXJB3HXQjZtcx/ZXL
	nlgYVgHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKIG-0000000HFq6-1yHW;
	Thu, 29 Jan 2026 05:10:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKIB-0000000HFpJ-2zvp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 05:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D987F60125;
	Thu, 29 Jan 2026 05:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B6BC2BC86;
	Thu, 29 Jan 2026 05:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769663406;
	bh=V1WyJa/+x8maDd98PLvupLgjlQf1OoyhIzqUlPtgYLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BpQ3X6zk+gL1Wx50TzMtcI76mAAf8Ah6EKpXtVSXOwRjvoWd0AabiiReG8cf1v+W7
	 jIYPzKrRPw3KeFWEnpgYZMNDAe6aRyiQMx0142Lcg2zAijkEvpaigl+3NETebFCusz
	 Xy3ZD3WRI8ba0Qdw23s+ONgYj8frRub+x76ImHnqFHb633GdDwI7y3QD8D3a5K8W4k
	 l3pdQMEEKCDxqkMIlpFh0G3gDaej/eEKJEgZ/+Xncd/jg+WdgWNvys2vLWTGu154fN
	 9p47BG3C8Zbu39hTXfBj53lXo9glNR9aSkoWUrysIdleeLCGjJOYGAntQx2za44CGd
	 JtVa66b5mWTpQ==
From: Jakub Kicinski <kuba@kernel.org>
To: jan.petrous@oss.nxp.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	edumazet@google.com,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andrew+netdev@lunn.ch,
	mbrugger@suse.com,
	davem@davemloft.net,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	s32@nxp.com,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	s.hauer@pengutronix.de,
	conor+dt@kernel.org,
	chester62515@gmail.com,
	festevam@gmail.com,
	mcoquelin.stm32@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	devicetree@vger.kernel.org,
	alexandre.torgue@foss.st.com
Subject: Re: [v4,4/4] stmmac: s32: enable support for Multi-IRQ mode
Date: Wed, 28 Jan 2026 21:10:04 -0800
Message-ID: <20260129051004.375682-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128-dwmac_multi_irq-v4-4-82fa34fcf2f2@oss.nxp.com>
References: <20260128-dwmac_multi_irq-v4-4-82fa34fcf2f2@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
stmmac: s32: enable support for Multi-IRQ mode

Enables Multi-IRQ mode for the S32 GMAC driver when per-queue IRQs
are present and more than one RX queue is configured.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> index 5a485ee98fa7..37a5b7b46973 100644

[ ... ]

> @@ -149,6 +149,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
>  	plat->core_type = DWMAC_CORE_GMAC4;
>  	plat->pmt = 1;
>  	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
> +
> +	/* Check for multi-IRQ config. Assumption: symetrical rx/tx queues */
                                                   ^^^^^^^^^^

This isn't a bug, but "symetrical" should be "symmetrical".

