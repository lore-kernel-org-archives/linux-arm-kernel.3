Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E28EC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 01:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=493ZPMKc7CVoQ5vLmzCynAdIb8jssCGmTqekQLIOUmc=; b=0yRhdD6APcxZGZLgYNt9N8uRcN
	d1fcDE9ZY+J93fxiNaJSIJOrR/CbgfnZjOr8yKPhY2RlJVi1NG0aMSJPJA20G0a1VndBQkDvkzVTF
	p2JuMoqSAKml0p+1k0YMPrkkmwKERkF3UPjqlPzlNelnWFCCBTeQYx8DiJBYty0cx179ELqmgp3+f
	dSoYN6Z4akO+hOyKxEx54vZCjY85pfO9ITC+U92xT3B9qL2E8cOnmUbX6mIIe+6V4kEtKNxd3Hfow
	sfI9Hhn0IRZDu4xl9RRFc1e4BcGCFnNpBdoguNAEe0/Bd9etyJJjimFFefpqQ1tg8vuc5HT1rhpNZ
	ZZGKIDKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWKm-00000004Adp-01YG;
	Tue, 28 Jul 2026 01:10:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWKk-00000004Adf-33xN;
	Tue, 28 Jul 2026 01:10:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CEC3D6013A;
	Tue, 28 Jul 2026 01:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD29B1F000E9;
	Tue, 28 Jul 2026 01:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785201013;
	bh=493ZPMKc7CVoQ5vLmzCynAdIb8jssCGmTqekQLIOUmc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=F1fc74TAXXucSCsrm/m3/uM6tXC+diNSMFCDJ3lgUnr2j1P+hr2E3OmAcq5DoLgIi
	 DrX5ZQZt4rBjDrC9s4p21FE9W0DOrD1eZ4hIvOH8z7ay9HbbnA/3QanVdrE9ITOtlm
	 xZtKVeJA15ayrX9AJ1i9O19Y/Va6CWRC+d24B5zOyoMfbJpf/Dt2FTiCNIKbdQe9Vl
	 nE4KiVfrnUx++ERbiTWZBKlTaU2wDYoCHsKUiZHuXnf6UmvYwrZrY7KIFqvhfb0kMG
	 XBc6PpFtj5vhU5G1VrIs94qxCrbyvGglbY5CHj9Wt6G3SiEe5kPDTo7UNSiwJP/xNE
	 +HfU4Vtk3cFfg==
Date: Mon, 27 Jul 2026 18:10:12 -0700
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
 <skhan@linuxfoundation.org>, Robert Yu <robert_yu@compal.com>, Jeff Chang
 <Jeff_Chang@compal.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 3/7] net: wwan: t9xx: Add control DMA interface
Message-ID: <20260727181012.69e06bf6@kernel.org>
In-Reply-To: <20260723-t9xx_driver_v1-v5-3-b27afb99ccbb@compal.com>
References: <20260723-t9xx_driver_v1-v5-0-b27afb99ccbb@compal.com>
	<20260723-t9xx_driver_v1-v5-3-b27afb99ccbb@compal.com>
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

On Thu, 23 Jul 2026 16:34:28 +0800 Jack Wu via B4 Relay wrote:
> Cross Layer Direct Memory Access(CLDMA) is the hardware
> interface used by the control plane and designated to
> translate data between the host and the device. It supports
> 8 hardware queues for the device AP and modem respectively.

each commit has to build cleanly with W=1 C=1, please:

drivers/net/wwan/t9xx/pcie/mtk_cldma_drv_m9xx.c:34:22: warning: symbol 'mtk_cldma_regs_m9xx' was not declared. Should it be static?
drivers/net/wwan/t9xx/pcie/mtk_cldma_drv_m9xx.c:167:22: warning: symbol 'cldma_drv_ops_m9xx' was not declared. Should it be static?
-- 
pw-bot: cr

