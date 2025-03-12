Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E386CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 06:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y9A+GMGKN+/gUY1pm2Jf9qbSfuZPHc1NStiINtfiC4E=; b=DXKgvqCXOSv2WYBlsiKuZNYNjV
	iFEk1Mt/Xra3qH4JnKeDAsplBgWR/felLnl3mTOt+hjcQnBTxCtt5gYELsn0eaENbH/Yij5r8CVKF
	PCzwLiqIohIRJsRGt5VTHxPE6r04ZAlarwIxmPGy/GPMYX8dplBqsV6m/7aY8qCT/OaQNCP+JBCA5
	KkHRfb3dwi/TJlhJLsXEP3Qr2X82/65AoZZk0Jq+OfWhC+0QaO8nAHzA2WySJa2IALg3gmVcf+IyU
	KYWmyPPVkmMvYG+s3PcZhooh0MRrBuTSiSWupuM+Iw531dSsfIG+zx7orCwnjnfvpL9sOjxMo/Kuu
	F/Q1PH2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsFpD-00000007cbS-184p;
	Wed, 12 Mar 2025 06:44:19 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsFnY-00000007c63-35t5;
	Wed, 12 Mar 2025 06:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=Y9A+G
	MGKN+/gUY1pm2Jf9qbSfuZPHc1NStiINtfiC4E=; b=otuhekoTwyJx+JqzGhknl
	/Iv7vVn5kEHxqjM52cwGzgtak+d431j79xyTzrismLDKslKWhSqlTn2MS2U1hNdE
	qYnxFLnpq1cDQLlFlXm4MJdqJO0UwhXd99Z+zVxZQ1jYNzw8O+d2KEc0SbRiX7Qc
	nMcy8ciC2LTSJWZfaSDNak=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wAnro3MLNFnNsQBSQ--.34149S2;
	Wed, 12 Mar 2025 14:42:23 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	piotr.oniszczuk@gmail.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: vop2: Fix interface enable/mux setting of DP1 on rk3588
Date: Wed, 12 Mar 2025 14:42:10 +0800
Message-ID: <20250312064218.524143-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAnro3MLNFnNsQBSQ--.34149S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw1rKFyDJrWUWr1DGFWfKrg_yoW8JFW7pr
	s0yryYqrWkKrWjvF1fGF4Fyr4SkanFkayIka1fKa9xGa48tr1kGr98Ja1kAry7Xr17ZFyj
	krZIyrW3uFW2yFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbwIDUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hYOXmfRJTn62wAAsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_234237_161516_BF497942 
X-CRM114-Status: UNSURE (   8.69  )
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

From: Andy Yan <andy.yan@rock-chips.com>

This is a copy-paste error, which affects DP1 usage.

Fixes: 328e6885996c ("drm/rockchip: vop2: Add platform specific callback")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index a8b1ebfc5af5..de2da4f4e434 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1753,9 +1753,9 @@ static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32
 		dip |= FIELD_PREP(RK3588_DSP_IF_POL__DP0_PIN_POL, polflags);
 		break;
 	case ROCKCHIP_VOP2_EP_DP1:
-		die &= ~RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX;
-		die |= RK3588_SYS_DSP_INFACE_EN_MIPI1 |
-			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX, vp->id);
+		die &= ~RK3588_SYS_DSP_INFACE_EN_DP1_MUX;
+		die |= RK3588_SYS_DSP_INFACE_EN_DP1 |
+			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_DP1_MUX, vp->id);
 		dip &= ~RK3588_DSP_IF_POL__DP1_PIN_POL;
 		dip |= FIELD_PREP(RK3588_DSP_IF_POL__DP1_PIN_POL, polflags);
 		break;
-- 
2.34.1


