Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B21CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmX4lyPBoT875wjHWdcqUov5fV8rK+s5knvWif8YRXo=; b=0EgpJ/BNILXhentFyPNuFNiIMR
	PDNE5J0AHrX9HR+bEpr9kFWUeweeKE2bIoUWJi/4iFTEYvP+5/JFIDYuq73+Hfqx1hrqVFTudR46R
	J6xaycXhnF9NL9kRbY97tnXT7hTBva8+116tiINHLgQ7PlYFLVAWp6n6CI/EsMCu89ZTaK406/JW7
	TcOWD5bdUOXB6R160Wpr3ad/ynt/FHQK5tD+ckoRxzNNnPUI0C//TGPFv+aXErawwDvnjEFktHA4W
	SfbfOaVXLfB8LJMb6nIRfb+sK5EhibfFlqonozHdzBZN/ItJyXXF6709qTuVspJANNKtqPArYXm1u
	VgExnHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqB-0000000AK8A-0iXg;
	Mon, 03 Nov 2025 16:55:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq4-0000000AJwv-112A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A9A143BB2;
	Mon,  3 Nov 2025 16:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCC2C4CEE7;
	Mon,  3 Nov 2025 16:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188927;
	bh=/GSt2XVw5TKgrkgRLW7hTqPErYsbM430CGm8iWI4aZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S9VpH4Tc1GofJU3nn5WlkM6DwqZoHs1qLob6kjcmmwB1GyBjdNn8fPbxU4NPFuadv
	 NOL217IqwR7cC7uucW+SF6HOmB7ZiF777dDm5ysQP3U++141I3mSPpIGBWlsUm19U1
	 5NNepzgr+7sF1ZB0EeQV30+9lrSCQUUVpT+MdY2qo5/x4U0cdUM3SSQqSt0lg5V8Jh
	 /hK8eKhpeOkzM8A/4TTshOwpFODQMFav2nQMIL5fb2BO7z5xLg4sixLNiLsn2c06f4
	 lu5on9tR0Llh3M0xj6nc6VZ6/xecQApqc/HC+ED3EbZVluCsWrHhklaqoZlJiDnzGm
	 fuhleDjZrloZA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq0-000000021VN-3l0L;
	Mon, 03 Nov 2025 16:55:24 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 01/33] irqchip/gic: Add missing GICH_HCR control bits
Date: Mon,  3 Nov 2025 16:54:45 +0000
Message-ID: <20251103165517.2960148-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103165517.2960148-1-maz@kernel.org>
References: <20251103165517.2960148-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_085528_312370_5E6F3244 
X-CRM114-Status: UNSURE (   9.17  )
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

The GICH_HCR description is missing a bunch of additional control
bits for the maintenance interrupt. Add them.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/irqchip/arm-gic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/irqchip/arm-gic.h b/include/linux/irqchip/arm-gic.h
index 2223f95079ce8..d45fa19f9e470 100644
--- a/include/linux/irqchip/arm-gic.h
+++ b/include/linux/irqchip/arm-gic.h
@@ -86,7 +86,13 @@
 
 #define GICH_HCR_EN			(1 << 0)
 #define GICH_HCR_UIE			(1 << 1)
+#define GICH_HCR_LRENPIE		(1 << 2)
 #define GICH_HCR_NPIE			(1 << 3)
+#define GICH_HCR_VGrp0EIE		(1 << 4)
+#define GICH_HCR_VGrp0DIE		(1 << 5)
+#define GICH_HCR_VGrp1EIE		(1 << 6)
+#define GICH_HCR_VGrp1DIE		(1 << 7)
+#define GICH_HCR_EOICOUNT		GENMASK(31, 27)
 
 #define GICH_LR_VIRTUALID		(0x3ff << 0)
 #define GICH_LR_PHYSID_CPUID_SHIFT	(10)
-- 
2.47.3


