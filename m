Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028CAFEE4C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 06:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XgpapaZ4IPlQzIQie+kDwiyyYWRn0Es81wyIFnsZpqk=; b=q/DbOWVMO0xyqyRa1ECUsDmW37
	rL4nxXufIF8HIxA5e8y+uIugTc85Ebt/Hx0+tKLDAmGSRd+iFoLwn/PzYcpkvCYFleyqVxQc6H+uF
	yvP11s21KhZrvSsaskGeWey4oYc/YC30W6ZXkuegRAWX6EvGa9QI5zhcsiDIRMnK/bfPUgnDrQMss
	Bv2s5zCxFIE4OdljpXSvRgxenOTgOCYAMfC7hSL7gNJtN5Hk+Maxzgkt9sgXPsZTLhqr5qxs2g1E0
	Cimu35F+WHq5PHJ4mIOUOrz1twOHFN5b2VRfpctWFpHUSZllFDrc+1+B8m4zGPO97qmFUdJ0kZVxw
	rc4lw1Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDkL-00000009XwM-0rOw;
	Sat, 28 Feb 2026 06:24:13 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDkJ-00000009XvW-0kCY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 06:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XgpapaZ4IPlQzIQie+kDwiyyYWRn0Es81wyIFnsZpqk=; b=aiQ6ppZSdYBjcAz8Z6Ioc5XmxY
	3gJW5MijU6OPOgJFjKzsMto3Tvr5eKPIr7OsYcgXTSrA3g25RhswhCo5jbGwnOGxemtPXibq/6OPV
	Hklr8OdVp4GERawl70gqtTQLifszb8twXRGsB8dAKRnOw3e0aMZQd8bvk07lnPMvi3aBx72QCHM/N
	di9CGPRv6yPj71is00RzqAaF+jCj0AhNXHxSNp7wP1Dn/mCf8oyLfGYxGygRV8nu6+96fwnq8nbsB
	FgiOKt9uKV5ymc3qMe3Tsri7x1VW4I45zpeDTh0Bf8gtZE6+g6d68v0xlFNBamgvFSz13fGaR2Fkh
	SqnQWw9g==;
Received: from [122.175.9.182] (port=18844 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vwDjW-0000000B4Yw-098B;
	Sat, 28 Feb 2026 01:23:22 -0500
From: Parvathi Pudi <parvathi@couthit.com>
To: nm@ti.com,
	vigneshr@ti.com,
	linux@armlinux.org.uk,
	ardb@kernel.org,
	ebiggers@kernel.org,
	arnd@arndb.de,
	geert+renesas@glider.be,
	parvathi@couthit.com,
	tiwai@suse.de,
	kory.maincent@bootlin.com,
	dmitry.baryshkov@oss.qualcomm.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	twoerner@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
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
Subject: [PATCH] arm: multi_v7_defconfig: Enable CONFIG_BRIDGE and CONFIG_DP83848_PHY for TI AM57x, AM437x and AM335x
Date: Sat, 28 Feb 2026 11:51:05 +0530
Message-ID: <20260228062109.250794-1-parvathi@couthit.com>
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
X-CRM114-CacheID: sfid-20260227_222411_304916_E3BBC115 
X-CRM114-Status: UNSURE (   3.83  )
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

Enable CONFIG_BRIDGE in multi_v7_defconfig as a module.
This is to support STP/RSTP Switch mode using PRU-ICSS
on TI SoCs.

Enable CONFIG_DP83848_PHY in multi_v7_defconfig since
TI TLK10X PHY is used in TI SoCs and the support for
TLK10X is available in DP83848.

Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f75d75cf91c8..f0a2971fb57f 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -281,6 +281,8 @@ CONFIG_TI_KEYSTONE_NETCP=y
 CONFIG_TI_KEYSTONE_NETCP_ETHSS=y
 CONFIG_TI_PRUSS=m
 CONFIG_TI_PRUETH=m
+CONFIG_BRIDGE=m
+CONFIG_DP83848_PHY=m
 CONFIG_XILINX_EMACLITE=y
 CONFIG_SFP=m
 CONFIG_BROADCOM_PHY=y
-- 
2.43.0


