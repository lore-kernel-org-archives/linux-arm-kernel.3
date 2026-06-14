Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8C4CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 00:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMdBuFq+Egdpf4xXaVRlDiUSnmhKuXX5amo2pNZUkl4=; b=erOjqFyQH3mU7Lan5pHobNtcEZ
	DuMHM7IR9DjntomegqKSIKzIObnoIbnr6ioM2+kJb7862u660kMm9Lja6Nry0+M8wnM3w2opY36JC
	t1Gw7aYvlEor8+7TkqkJIglZyjzT+leJlrLQUekatQy1WBgFhMW5H/bKUSGv/S6ISJw1EJAiZU09L
	uKq4hSwRGUn9/IVr4TaWEjOa+22Qki2rNSezaCPOcy+MuLLTNMtds8VuDZYGA64obJRMrIzS6jfIs
	bSlgS1wLNrf/XFjPND1oBJWcCigUttiHWdHdcGu9AK4ul9awm6Jl9J3zzTvJ5Oe8a8sEExH3zihLh
	5uQYVTFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYYk2-0000000Cdld-2FjG;
	Sun, 14 Jun 2026 00:30:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYYk1-0000000CdlT-3NhP;
	Sun, 14 Jun 2026 00:30:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BAC3E6008A;
	Sun, 14 Jun 2026 00:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366EF1F000E9;
	Sun, 14 Jun 2026 00:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781397020;
	bh=ZMdBuFq+Egdpf4xXaVRlDiUSnmhKuXX5amo2pNZUkl4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EcBer6RItrC/+oVd2Kax1LWzKvX0vH4X3tM0z0tnln1N3DLGFMKoWYR6a5/toDx7j
	 PqKUHlaRmKC3H77fwIQP9zSaaEPkocTEk3DZ9UijYzkkAwXcBGnfUtGGwJUwOZ9+gn
	 xwXGnxn4mOjkl0tQSvMh/hq5KSBweQvHmb1yp8NYS/fH1dz5Xsv6uHoERtHmIyb5h5
	 N+/aB/ElIyEUZJTpIObPWuYDZFpX71nofGT0gt94yJ67TueuTj8CIKoqptC96vuEE2
	 wUEZ9ktrZLSvyERFy8Yo6O1DI85bWRaLfmtVQvmmwUazcxAnZCJzCovLrJV/tKnPSi
	 XuVbHfaK/B/3w==
Date: Sat, 13 Jun 2026 17:30:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Cc: jackbb_wu@compal.com, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg
 <johannes@sipsolutions.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, Minano Tseng
 <Minano.tseng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Simon
 Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/7] net: wwan: t9xx: Add control DMA interface
Message-ID: <20260613173018.7a0581f1@kernel.org>
In-Reply-To: <20260610-t9xx_driver_v1-v2-3-c65addf23b3f@compal.com>
References: <20260610-t9xx_driver_v1-v2-0-c65addf23b3f@compal.com>
	<20260610-t9xx_driver_v1-v2-3-c65addf23b3f@compal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 10 Jun 2026 18:41:06 +0800 Jack Wu via B4 Relay wrote:
> From: Jack Wu <jackbb_wu@compal.com>
> 
> Cross Layer Direct Memory Access(CLDMA) is the hardware
> interface used by the control plane and designated to
> translate data between the host and the device. It supports
> 8 hardware queues for the device AP and modem respectively.

Transient build warnings:

+../drivers/net/wwan/t9xx/pcie/mtk_pci_drv_m9xx.c:52:30: warning: symbol 'mtk_dev_cfg_0900' was not declared. Should it be static?
+../drivers/net/wwan/t9xx/pcie/mtk_ctrl_cfg_m9xx.c:19:22: warning: symbol 'mtk_ctrl_info_m9xx' was not declared. Should it be static?
+../drivers/net/wwan/t9xx/pcie/mtk_cldma_drv_m9xx.c:33:22: warning: symbol 'mtk_cldma_regs_m9xx' was not declared. Should it be static?
+../drivers/net/wwan/t9xx/pcie/mtk_cldma_drv_m9xx.c:166:22: warning: symbol 'cldma_drv_ops_m9xx' was not declared. Should it be static?

please also see all the AI code comments at:
https://sashiko.dev/#/patchset/20260610-t9xx_driver_v1-v2-3-c65addf23b3f@compal.com
-- 
pw-bot: cr

