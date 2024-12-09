Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F90E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2nQWBQmIKoC4QJEfJ78OOQrAzQPhXGv/+rsDTlwFiI=; b=Ufu7/Z5I4+5mSML8Hpez2SlvzO
	8FJO2Q1t4NRD3jnWzsJKhX5fZhaMb7xtzaUE2qLxaev7SAVRYr4FToFB8x6HIVl5AnHXnBmg5C4z9
	N8pXHn3R7BrE3o4LOEt/ynK2OFM3+9G5a1OPWoBoRnOKpHs7uyAkh1ZjOJjbVjs/3DriHjgYZxOnW
	jH6VePBdARrWk85EaXQygvDdOrS8MQRk3pASuWx/qUhS2LrW7qAmwiHbvqjhdiL0/oo2WF56LGsH6
	ChxABx8Cn4yXMxe9Li7nkPdY2h1d9Mjy2kmUyH8gps7FPNYX5J3bvQDg5MScAKrNp5YIwN95AiU1x
	ZFWMtmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKe4L-000000083M7-2IRr;
	Mon, 09 Dec 2024 13:45:01 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcu1-00000007gdo-1IY4;
	Mon, 09 Dec 2024 12:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=N2nQW
	BQmIKoC4QJEfJ78OOQrAzQPhXGv/+rsDTlwFiI=; b=ZOuhLhj5ZKetAookr9rZa
	1+4eMaLfDAo+pBgOFnAcMoGz9FVPTBskmTqiA250e3M9uLLCUouj0umzJ/sxhOyT
	pmkvxfmn7Ldi9UXvkjzyqUx7XTqB5QajIVxMC02KuvNxQi32KuDpAx4Upq8t2ByB
	yqWcxEuHPUqAk/7V+jfe4k=
Received: from ProDesk.. (unknown [58.22.7.114])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3Woe44lZnubZICA--.5849S11;
	Mon, 09 Dec 2024 20:29:57 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	s.hauer@pengutronix.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 06/18] drm/rockchip: vop2: Setup delay cycle for Esmart2/3
Date: Mon,  9 Dec 2024 20:29:19 +0800
Message-ID: <20241209122943.2781431-10-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209122943.2781431-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD3Woe44lZnubZICA--.5849S11
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFy8AFW3ZFW3uw48GF4xXrb_yoWkGwc_Ka
	y7WF98GF1kuFn0q3WUCayfGrW2k3Z29F4I9FyDtF98ZF93A3sYya4Iyr1UXF15CF4fCF1v
	93W0q3W3CF13GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0ahF3UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g6wXmdW3S-w5QABsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043017_679674_8199B613 
X-CRM114-Status: UNSURE (   8.27  )
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

Each layer needs to set the correct delay cycle to display properly
without unexpected offset on screen.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 8b9ca046eeeb..d7ddeec27c7d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2703,9 +2703,11 @@ static void vop2_setup_dly_for_windows(struct vop2 *vop2)
 			sdly |= FIELD_PREP(RK3568_SMART_DLY_NUM__ESMART1, dly);
 			break;
 		case ROCKCHIP_VOP2_SMART0:
+		case ROCKCHIP_VOP2_ESMART2:
 			sdly |= FIELD_PREP(RK3568_SMART_DLY_NUM__SMART0, dly);
 			break;
 		case ROCKCHIP_VOP2_SMART1:
+		case ROCKCHIP_VOP2_ESMART3:
 			sdly |= FIELD_PREP(RK3568_SMART_DLY_NUM__SMART1, dly);
 			break;
 		}
-- 
2.34.1


