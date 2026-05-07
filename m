Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095E8CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7qaFTHBmkkuSGDzljSoHWFOZmyX9pOWhWxjW4yGFJ0=; b=Ili00b8PkDOOtpb2EFlSQyfs4p
	t5A7Uy6qtDkhhEthwCTWFksib3VIWnEJxpp7BLy7PeFpS0+ejhMfB8wR/AnfnkVFBw4H9k4+65HXM
	BrmWO24+zr2ArvAaK7wBmcPqHEnknPMJdx3gUnps8TrrqjeLpjb1g9/BFzZHoRgqj26GjNJevlt2L
	WUASAqS7AzFhi1gm3/0TUMmmtGPlL8WqcrkSiBLvU1R1bZIZTcM+72557hGpK9gAee0PpriL8eVXD
	no0UIph51tMnPY4Mh436LriFh1MwqR6VobzxcZ92u+yNno3vvc2Zs1sY472cyNQuP0XrVbIrjCbBi
	4wmFlffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1E3-00000004HkC-0lyM;
	Thu, 07 May 2026 16:05:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1E1-00000004Hjs-1KGE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 16:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A8D16057A;
	Thu,  7 May 2026 16:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66663C2BCC4;
	Thu,  7 May 2026 16:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778169920;
	bh=PjiuOCfQhhHUvzf8Uf9+2t04GxEw19A/aaBiN0wxIgU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m/Qb/ZrFZeOIrKmB5azSqQPPJ0IYaVU1yfajUHAsL7P9NvA52ohkKg6aXahZh3lwv
	 TbYqYMTX4hlG+1YpqQPH8JdhJj7sClc010xKHdBSHGBiVA5l93lQlDF9xCaa5Lh2x8
	 TaGe/rmDkhCG9ojuhbNGG1XwAYi0QGQiBM88s8eDMcGwwpyVOeFZD0QkVRkl6h5jP1
	 Qo0wpAuMjriqA3HqC3mbjl0NrmuSL+rSjuNSwFWdHKmfEHy1DWmQtcv+b2gs6jEdRT
	 /JePvg2TnCiR/zU9hdftYvCiswy/e3z78w7YxYWDYCL7nyp86HlBG12qf1If6910Y+
	 tYAYnJzJU64ow==
Date: Thu, 7 May 2026 09:05:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
 <UNGLinuxDriver@microchip.com>, "Sebastian Andrzej Siewior"
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Bjarni Jonasson
 <bjarni.jonasson@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, <kees@kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH net v2 2/4] net: sparx5: fix sleep in atomic context in
 MAC table access
Message-ID: <20260507090518.47b64fef@kernel.org>
In-Reply-To: <20260506-misc-fixes-sparx5-lan969x-v2-2-fb236aa96908@microchip.com>
References: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
	<20260506-misc-fixes-sparx5-lan969x-v2-2-fb236aa96908@microchip.com>
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

On Wed, 6 May 2026 09:25:37 +0200 Daniel Machon wrote:
> sparx5_set_rx_mode() runs with netif_addr_lock_bh held and iterates
> dev->mc via __dev_mc_sync(), which per address calls sparx5_mc_sync() /
> sparx5_mc_unsync() -> sparx5_mact_learn() / sparx5_mact_forget().  These
> take sparx5->lock, a mutex, and then poll the MAC access command
> register with readx_poll_timeout(). A mutex may block, which is not
> allowed from atomic context.
> 
> Convert the driver to the new .ndo_set_rx_mode_async callback introduced
> in commit 3554b4345d85 ("net: introduce ndo_set_rx_mode_async and
> netdev_rx_mode_work"). The async callback is invoked from process
> context, so the mutex and sleeping completion poll can remain.

Sashiko points out that the switchdev handlers are currently racy,
but I think that's orthogonal.

