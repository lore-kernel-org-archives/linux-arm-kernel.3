Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69561D6552C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWpbY7DH1oS0V7oTyi6QaUWxk7HDaeuV22LJGXTHRzw=; b=W3SH/oYCRqDRvmRmiKZcbG1pX7
	tLEp7TrvpRwFAKzGWCi6pAE93mgythlEeZRFYx3JGZiEz6RuCvd9Mcatlg8WVhXQHCE0UO09iHd3m
	TeQt6kBg7OHOjBTG17tTxpxUfeTH758512p8vZAaFDitxMwfq31zb/UO2jMUtQb1Fk7AXxvxK8Jgt
	Cn+OOButBwLmceHXHTtmBc9AEE3eEZ4JZz82Qg9TQPS+jS8bv9O8xdAbR3Sd+vmZ6gC2CzGLsFqZw
	Pj5toiviHXmHDZNwz/VnVJSkdhmKIPUJUvT2NCBK4I8299Y3j+y6dZ3ysTzrrDl3DFANye87jhqKS
	m0OK/Hhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoKx-00000006UUM-3wNy;
	Wed, 17 Dec 2025 10:00:51 +0000
Received: from mail-m49214.qiye.163.com ([45.254.49.214])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoKs-00000006UQK-0nGe;
	Wed, 17 Dec 2025 10:00:48 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d942d69e;
	Wed, 17 Dec 2025 18:00:41 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	jani.nikula@intel.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v8 17/18] drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing in analogix_dp_unbind()
Date: Wed, 17 Dec 2025 17:59:11 +0800
Message-Id: <20251217095912.3109103-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217095912.3109103-1-damon.ding@rock-chips.com>
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217095912.3109103-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b2bc1362403a3kunm23626673a4401
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGklMSFZOGElDSR4YGEoYGRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=f4OSfB+72ecafuIxlss4J/K4WksOrYObzW7Ur1FmhebNA/b9EdFBR1s83NAnpxVYdP2wCDMY93hnVMt33ZrOiO0/1384E2Nzg52WmUrd9pKWLSlsZyR+WmXlH659b72ISlqIhXrCNVthR5nSkTuAJTMClUTYIcRHR4wHRO3b4u4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=UWpbY7DH1oS0V7oTyi6QaUWxk7HDaeuV22LJGXTHRzw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_020047_477773_E4E8F42E 
X-CRM114-Status: UNSURE (   7.09  )
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

The analogix_dp_unbind() should be balanced with analogix_dp_bind().
There are no bridge enabling and panel preparing in analogix_dp_bind(),
so it should be reasonable to remove the bridge disabing and panel
unpreparing in analogix_dp_unbind().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index a6c5601e16ff..7e3e9d4f4ea2 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1526,10 +1526,6 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
 
 void analogix_dp_unbind(struct analogix_dp_device *dp)
 {
-	analogix_dp_bridge_disable(&dp->bridge);
-
-	drm_panel_unprepare(dp->plat_data->panel);
-
 	drm_dp_aux_unregister(&dp->aux);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
-- 
2.34.1


