Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CAAD5E378
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 14:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qKBTf3iQdLB1DZk+dtKgJbMYJgOTJyBTWss+V+NIWlY=; b=YPxJDnd091DesNXBpTX2bF0r57
	J4fEGxm6EbIy3VGTEZ1rniLzhqeRto9Ge5GAFHb62PbzSxioNZm2Tll4XTX+QGoo3abft815SatDF
	/+Itu7cZPI/Ft5tDRAuwHdjFfBhHgGOgpUU8+2q0IUpdA3ylZ99ZZSb8oAlaWj0/EIuxogLDkFkFR
	K4UK3eex8DCD48IPAsCpJ24jFRkBTLA5O8K8o4MIHEqGeXNs010cS86QIcuwYmQKjyqwVgnKkvTPg
	/pb58Pl4fhyKXhfYEhsCWSrKm7UYEezw3rJUm46YWMca6Bh93vWidYO+Kks3I1JceyH096qg38G/w
	tAtMYkXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVW9W-00000005Lkb-38xp;
	Tue, 16 Dec 2025 14:35:50 +0000
Received: from mx-relay188-hz1.antispameurope.com ([94.100.133.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVW9Q-00000005Lk4-0wVo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 14:35:49 +0000
ARC-Authentication-Results: i=1; mx-gate188-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=qKBTf3iQdLB1DZk+dtKgJbMYJgOTJyBTWss+V+NIWlY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765895735;
 b=H6EV4Bu3blq6R4QMMq3tNz8wpY5q4io1gENRAv1wb/sDq5oNkj88GgiFBh/UuW38olNHywSY
 0uGWq0vkqsTVtsgnphmVeY7bgtAZs1+kDxuyba1NOqHQ/0FFsKBfIlxH9x0dvsDa9nMmj0H10JA
 aYoZNuKLOo3YNMgi7Tcjit2PscaeEx7w/BNdX+9t6jJM2MNf42RIAmxDf6M01pXDOp82QskPA+L
 t8laS6xinMCs9L9HTWE3+sdllnI4ZRn5z0dlig0hZCXKIjNxhitLiWp8PZa8b76ePQInQEgFNCo
 sVMaZPT1tbPEBaXPSAnDSlgHd9EDV39sGf4shDaAedCXA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765895735;
 b=EtO4QkB0pBamjfszYjxpTBpLg4DpS7AllyrPBudjci7wu4zylrpECF5qQHZhnfQ53Oyz30SH
 lh/vHXxSHuYH3SgmqiqVGTr7Qz/XTSDiYwD2xI8QzPYEhruM42VDRV3L98XaujzZUSlvjcqOufm
 b4/TvviqCLkQlzjTpYfGCjTLx5UGGfTl+6Xv0CZum59ni1qu7Ks/r4S/d/YTvvWD6NzakHpimVA
 Az6ZOW6ORz+V9wgwIydRAKx0d5QlGGM+SFsKzwqwO9eyzBzWbuzA6y2reLe+FyC++AIQ8ZC/VXN
 34leJdoay4YRiF4NeBuHgo3uZgB4Ab3hB3vg4VaBQcZuQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay188-hz1.antispameurope.com;
 Tue, 16 Dec 2025 15:35:35 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 950FEA4079E;
	Tue, 16 Dec 2025 15:35:24 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ARM: imx_v6_v7_defconfig: Configure CONFIG_SND_SOC_FSL_ASOC_CARD as module
Date: Tue, 16 Dec 2025 15:35:21 +0100
Message-ID: <20251216143522.1064563-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay188-hz1.antispameurope.com with 4dVzx911RSz2Rb2Z
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 03e778ea2bf9a6c2fd2ee577023a1f9e
X-cloud-security: scantime:1.933
DKIM-Signature: a=rsa-sha256;
 bh=qKBTf3iQdLB1DZk+dtKgJbMYJgOTJyBTWss+V+NIWlY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765895735; v=1;
 b=qu7+/tOXk1eveIdx9P0owykvM5euwCr8/OV6z6a7NJkxcXmzXDOHt0j7bd3dWWygaRDFv4K6
 Zmsf2nDeGBct4Y2KAGFfs4OX3MlyTO7CyNwAvTEB+Yamg+q1Olq/OXUimwT+00d7XOl3sH2by9t
 klwnTalhsWWX04FidoSHSFEep0BtRsIBhSr56G87SohWT81EIgSO7cGAW3G3vNZyifZffb/YG4P
 K2qI5ODvU6LjB/So7DyUeLW78N30ZcxZQ3ZweFX197mf91ykQwbE3bkqygueG0Kr7uBBt13pF01
 Iz5vcOjpYv/ImsW0tsG79AOAH3iGcEysY3LJ1Ra2gWwGw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_063544_616781_79E516A9 
X-CRM114-Status: GOOD (  13.00  )
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

This option explicitly selects other options, e.g. SND_SOC_FSL_SAI.
These SAI drivers use DMA which in turn is dependent on CONFIG_IMX_SDMA.
SDMA needs a firmware which is not yet present if the driver is built-in.
Thus build CONFIG_SND_SOC_FSL_ASOC_CARD to avoid useless driver probe
deferrals due to missing DMA channels.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 0d55056c6f821..d75f5d71365a4 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -311,7 +311,7 @@ CONFIG_SND_IMX_SOC=y
 CONFIG_SND_SOC_EUKREA_TLV320=y
 CONFIG_SND_SOC_IMX_ES8328=y
 CONFIG_SND_SOC_IMX_SGTL5000=y
-CONFIG_SND_SOC_FSL_ASOC_CARD=y
+CONFIG_SND_SOC_FSL_ASOC_CARD=m
 CONFIG_SND_SOC_AC97_CODEC=y
 CONFIG_SND_SOC_CS42XX8_I2C=y
 CONFIG_SND_SOC_SPDIF=y
-- 
2.43.0


