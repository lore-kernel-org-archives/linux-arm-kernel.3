Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E23C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+UGCoWBioAMtXtHm8CAvoMnBqRSxIPHa7kTP4Y78/Mo=; b=HbFfdKiq1l8VWva2U19NL5f7zP
	k7c7Rm7V6tBE8gD/5jFYQGqIQFlwYnhhQ7rEqvNOY1HN0rpfpTW/K2ERFG0RbYelVc8IqFw3kLhyC
	gHk+MaYhBvrEHaFH4gQR4Na93yDr8l0wJSsLJ7jAANX7CReL0NzR4qu5ici2+zQvmXXx9wWVO7WUs
	YlC9fwrXcNdpOkv18s9p8ayxFQ3elZeLmRXxwwVi2SbEpwNz+1tcAY+SQ1b6rVAFAGgfNHuY4OGcg
	b9L9aul2q7Mx23S0eot32VQs/sIvRQ0Po2yNc7AbJJwe5rQJ4sUqI/lWx4fx97tTGHJqTpeDP1VDm
	OTlPeUUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnG32-00000003ZQa-3ku9;
	Wed, 26 Feb 2025 11:57:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEo3-00000003KM5-3ptU;
	Wed, 26 Feb 2025 10:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+UGCoWBioAMtXtHm8CAvoMnBqRSxIPHa7kTP4Y78/Mo=; b=IrpValUloRiJKw2SB7N7epThrt
	NFi6BJUBdQ3Hz94ktQ/QHyU68jQGRFTdFYwxj+2PYDd/yk0OAqlAdi9LIZuXI8qxgCUlLnUv4CHWL
	MDxra/vNufGVI3auC0oWJL1B0s+XyEqkVtZAXW6araCSdRkI3OCmHg0ryH6a5Bpo45XIQpDmiXFOR
	60UTsCGPRb5lBUd3uDM9U4kas0T2a+00RZjpFxC7QeT5FGaGCH6nnl8OBWbwpU1n9Cotaw9oUHc5v
	h85IiB31Q4A/aKXm23WdlS8yanUqPg0dxJhf4Y//fNbdi46/WKWKVwhEZHs/PdZXetjhOLMyXo39/
	b51fq44g==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnEo2-0006aJ-GC; Wed, 26 Feb 2025 11:38:22 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: heiko@sntech.de,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	sebastian.reichel@collabora.com,
	christophe.jaillet@wanadoo.fr
Subject: [PATCH v2 0/2] phy: rockchip: usbdp: improve typec orientation handling
Date: Wed, 26 Feb 2025 11:38:08 +0100
Message-ID: <20250226103810.3746018-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_023824_032255_FE3311C5 
X-CRM114-Status: UNSURE (   9.43  )
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

Reinit the phy if it's already running when a type-orientation
event happens.

changes in v2:
- fix an error I made when splitting into code-move + re-init
  function should still return 0 after first patch
- use rk_udphy_init() instead of disable + setup combo
  We don't need to disable + reenable clocks

Heiko Stuebner (2):
  phy: rockchip: usbdp: move type-orientation-switch further down
  phy: rockchip: usbdp: re-init the phy on orientation-change

 drivers/phy/rockchip/phy-rockchip-usbdp.c | 171 +++++++++++-----------
 1 file changed, 88 insertions(+), 83 deletions(-)

-- 
2.47.2


