Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20336C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/f1+cKU/M6viXrFzxbb0gMnMZp69UChBgNjg7xw4xl4=; b=34QPJbhLRy7p/xY1h2Kqzpgv5G
	mnrUpctcPXGkNagx9LiC9bfYuHLB3D6X+mcm9gMO7XuZ9iqXRnWm1m8zhepxLVbpqCKtoeolsfqYR
	n1lEmqnXHbqpghpK0yY8ouzsshNtwPu0FP8DMB6V9QtCYgFOQqvASXJoNvyO/4LpsJzVHP4KaCvIL
	qhWSojfGAv34jwkcEXfbh6XUIujaDg1wphuoYCe/5+uCgOpLUERzoABhvpfa688eG2UpH5ZRBzMLD
	VnsATNLORAaQUyX+u8kSWEcRI+F7NdgeDhhJvvt7xLakEUfVj+tqYdLdqvL01r8zYKxhtKjphL+yM
	0O3vs5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncHC-00000007DhL-203d;
	Thu, 27 Feb 2025 11:42:02 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbuk-0000000794c-3E9A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 11:18:52 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51RBIWRP1834296
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 27 Feb 2025 05:18:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740655112;
	bh=/f1+cKU/M6viXrFzxbb0gMnMZp69UChBgNjg7xw4xl4=;
	h=From:To:CC:Subject:Date;
	b=p2tATMt1RtiEGIdVk6HVWi8ZIxBw10QYRerhpww1z5+OpM9HR80QDvJ/R68LmKixq
	 6+4f3nGtgXRjcYR62W2OVncfyd/bXvMpYVuVuEzUdmzePiUCHbIH6tCKZuKC9Izb6a
	 zJ+SenFDasTAojf5lNxYCT6FXh36gmsS6ns4D7Po=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51RBIWjN066956;
	Thu, 27 Feb 2025 05:18:32 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Feb 2025 05:18:31 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Feb 2025 05:18:31 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51RBIVTi071024;
	Thu, 27 Feb 2025 05:18:31 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 51RBIUKU027731;
	Thu, 27 Feb 2025 05:18:31 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <ebiggers@google.com>, <javier.carrasco@wolfvision.net>,
        <elinor.montmasson@savoirfairelinux.com>, <biju.das.jz@bp.renesas.com>,
        <quic_tdas@quicinc.com>, <nfraprado@collabora.com>, <arnd@arndb.de>,
        <dmitry.baryshkov@linaro.org>, <krzysztof.kozlowski@linaro.org>,
        <geert+renesas@glider.be>, <quic_bjorande@quicinc.com>,
        <will@kernel.org>, <catalin.marinas@arm.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>,
        <m-malladi@ti.com>, "Ravi
 Gunasekaran" <r-gunasekaran@ti.com>
Subject: [PATCH v3] arm64: defconfig: Enable HSR driver
Date: Thu, 27 Feb 2025 16:48:28 +0530
Message-ID: <20250227111828.1963918-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_031850_901551_843D111B 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Ravi Gunasekaran <r-gunasekaran@ti.com>

HSR is a redundancy protocol that can be realized with any
two port ethernet controller.

Many of TI's K3 SoCs such as AM64x and AM65x support multi port ethernet
controller. So enable HSR driver inorder to support this protocol for
these SoCs.

Currently HSR is supported on AM654x-EVM and AM64xx-EVM.

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
Reviewed-by: MD Danish Anwar <danishanwar@ti.com>
---

v2: https://lore.kernel.org/all/20250226104517.1746190-1-m-malladi@ti.com/

v3-v2:
- Mention which TI SoCs are benefited by this defconfig
- Collected RB tag from MD Danish Anwar <danishanwar@ti.com>

v2-v1:
- Rebase to the latest tip
- Included TI specific maintainers in 'to'

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c3df5120b23d..f3afc0ec68f0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -177,6 +177,7 @@ CONFIG_NET_CLS_FLOWER=m
 CONFIG_NET_CLS_ACT=y
 CONFIG_NET_ACT_GACT=m
 CONFIG_NET_ACT_MIRRED=m
+CONFIG_HSR=m
 CONFIG_NET_ACT_GATE=m
 CONFIG_QRTR_SMD=m
 CONFIG_QRTR_TUN=m

base-commit: 8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
-- 
2.43.0


