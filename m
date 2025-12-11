Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D85BD41C17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 11:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76+TDbdKDRMp4PRu6fUW/cf9BtrBo0WZ3r1olbWyBY8=; b=EorcjCS2KoE0yoUxT4f/6EF46N
	ja9jB6OzvSQ4+ZjuIL6EDbdRicRH8eAQ6QhHzrlB9xC2trZPhwBwlYndMf1g9JH3hZKEDkOpshjIP
	MGkcy55mNKy2cx97rgEGXr01x/dQOf+daAy1tW9uh8uRHyQTH3NLvL1KffoznACg91SWSnv0pdsui
	gPOpA7f5NrBYfBCs5PgkO5w8Sdo4OGm+SsrEXgKqWpXrmtvOjClVLlMeqc68xy8N1KA9QtgK9VgK+
	CnB5DFAleBTWh8/wJAzypiFWTR2lqYDCVUdDefZrKfbeHG4Tt/haWsyL12+bjCWjfzQtgu+8pD+aW
	u+F5tfjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeUl-0000000GWO7-149K;
	Thu, 11 Dec 2025 11:06:03 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeUi-0000000GWNE-20FN;
	Thu, 11 Dec 2025 11:06:01 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1vTeUQ-0000000019P-14kL;
	Thu, 11 Dec 2025 11:05:42 +0000
Date: Thu, 11 Dec 2025 11:05:35 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] net: phy: mediatek: fix nvmem cell reference leak in
 mt798x_phy_calibration
Message-ID: <aTqlf6pUC6uMp3bk@makrotopia.org>
References: <20251211081313.2368460-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211081313.2368460-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_030600_511672_C45BBAE3 
X-CRM114-Status: UNSURE (   8.83  )
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

On Thu, Dec 11, 2025 at 12:13:13PM +0400, Miaoqian Lin wrote:
> When nvmem_cell_read() fails in mt798x_phy_calibration(), the function
> returns without calling nvmem_cell_put(), leaking the cell reference.
> 
> Move nvmem_cell_put() right after nvmem_cell_read() to ensure the cell
> reference is always released regardless of the read result.
> 
> Found via static analysis and code review.
> 
> Fixes: 98c485eaf509 ("net: phy: add driver for MediaTek SoC built-in GE PHYs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

