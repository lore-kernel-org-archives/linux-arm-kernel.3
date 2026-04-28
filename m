Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52444FF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jE1t2E2anlw2zLaOIG8ncGkA66f5ejckm9+DlKNzizA=; b=tFa0ZZNV5BvRhh0w19GxpMma2B
	onOxffMEb2gmWmi6LeCgYXGg2unjoD26ol3dP49vDQBeHoHtvOK8kC1dJmxCqNfYZmrM+VCHgRLse
	ZaArECg7Q12amJxj0MWqDfVmTmEEG6ITljcfSnL7DBQVsT51clFeB2zld88eGNA3ulL9GSCWC82a7
	jb42gaH0eB3z2OzZRUMtDX9jRA4uxkJeQsCQCtUj3dbJZdCUV5Ttn9J+23JgwYHf8MtQoKYqn4nyP
	0zOfd2bIbRsP6cSYbK396sPU3RzwgGP7NNZqbsJKq0jj7tdaFpTbzFfyzDx171dz0pnNJIzlNeu1K
	h4hZzx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeAB-00000000v1E-0yXp;
	Tue, 28 Apr 2026 08:51:27 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeA7-00000000uz2-3G0e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jE1t2E2anlw2zLaOIG8ncGkA66f5ejckm9+DlKNzizA=; b=PTmqT9m6oeGSeeX4oNTzcG/l2a
	gD4/lsxQ3MwCtARIwsvSrewev6H7sjwbC/Gq3tV7OtylAxJSZe4FSI8ZtnnCauz4evHMwhOeTU4My
	FmtnmATd3ObF2aygMZ2VskYU18GNS17v8vTUnOIQD1ddlgO/DScx40LSrMMmjTAhtAEvMl7R2HaeN
	KomA/w6hRw47j51gJe8TjV87Iqt1oYfxX0ls7L3t7MN++96qVg4chYHq2q7QJb9BmqqPfn9wxxzYE
	U/c4SxdBNXRzKPJfeMlxtg+mQ5GhqIgVD4CWa6tvTQolV6Xijitx0ZCG4gt7SfptxYxmeZoyAZihY
	Yg13Dn2A==;
Received: from [115.246.246.98] (port=49202 helo=cypher.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1wHe9K-0000000Gi1m-3yU8;
	Tue, 28 Apr 2026 04:50:35 -0400
From: Parvathi Pudi <parvathi@couthit.com>
To: nm@ti.com,
	vigneshr@ti.com,
	linux@armlinux.org.uk,
	ardb@kernel.org,
	ebiggers@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	khilman@baylibre.com,
	arnd@arndb.de,
	geert+renesas@glider.be,
	parvathi@couthit.com,
	tiwai@suse.de,
	kory.maincent@bootlin.com,
	andreas@kemnade.info,
	dmitry.baryshkov@oss.qualcomm.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	twoerner@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pratheesh@ti.com,
	j-rameshbabu@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	danishanwar@ti.com,
	m-malladi@ti.com,
	krishna@couthit.com,
	mohan@couthit.com,
	pmohan@couthit.com,
	basharath@couthit.com
Subject: [PATCH v4] arm: multi_v7_defconfig: Enable BRIDGE and DP83848_PHY for TI AM57xx, AM437x and AM335x
Date: Tue, 28 Apr 2026 14:17:31 +0530
Message-ID: <20260428085003.3023464-1-parvathi@couthit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.couthit.com: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_015123_862946_BFE24B49 
X-CRM114-Status: UNSURE (   7.00  )
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

This patch enables BRIDGE and DP83848_PHY as kernel modules for AM57xx,
AM437x and AM335x SoCs. BRIDGE is to support STP/RSTP Switch mode using
PRU-ICSS which got recently merged and DP83848 PHY driver to support
TI TLK10X PHY.

Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
---
Changes from v3 to v4:
*) No changes were made, only the version was updated.
*) Rebased the series on latest linux-next.

Changes from v2 to v3 :
*) No changes were made, only the version was updated.
*) Rebased the series on latest linux-next.

Changes from v1 to v2 :
*) Addressed  Krzysztof's comments on this patch.
*) Rebased the series on latest linux-next.

 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index bcc9aabc1202..13362286b111 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -149,6 +149,7 @@ CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_MIP6=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_BRIDGE=m
 CONFIG_NET_DSA=m
 CONFIG_QRTR=m
 CONFIG_QRTR_SMD=m
@@ -288,6 +289,7 @@ CONFIG_ICPLUS_PHY=y
 CONFIG_MARVELL_PHY=y
 CONFIG_AT803X_PHY=y
 CONFIG_ROCKCHIP_PHY=y
+CONFIG_DP83848_PHY=m
 CONFIG_DP83867_PHY=y
 CONFIG_CAN_AT91=m
 CONFIG_CAN_FLEXCAN=m
-- 
2.43.0


