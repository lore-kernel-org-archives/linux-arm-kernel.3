Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FD1E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 20:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GplsYPFeQZhA8hmi85G1RnmgDSDJoeTllgjYVKEvqno=; b=cSyM63FYowCQbKND92i7cSRE/r
	HGe34taYiCmmVKZHZz2VC22/ChxEFfrSddjJcn0jGpCPS4B0zjmiGq8gef/usgQ800OGkTrXQsyu/
	3xDtkNzCxm7nTSqXgmU5Lw1x21V33W8qVHVS3A4YYN0b/VZqzQ1TkB1H2dVrw8E56wcbLDdqKr/SP
	pijS68MgjCyuqgcgs/SPG9XuLli4w87HZENz3fCsmDckcFphQ6Rk4R9u5L8JShfvZmtuEzb3ryWv7
	Iy9ChE8tJ5oIPBR8tKyxeucCzocSmUqrAL76FxYYEeTO8+Gf2PzvZYAGKhuzoHBYaeP9M4vDubHrI
	VgXl46wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsoRD-0000000AOjM-3BDL;
	Wed, 18 Feb 2026 20:46:23 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsoRA-0000000AOhT-42I4;
	Wed, 18 Feb 2026 20:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GplsYPFeQZhA8hmi85G1RnmgDSDJoeTllgjYVKEvqno=; b=BGf6hzfpDysJGAUWiZ8A6IdSnj
	acCd5GSh0ktXU0OUy9MRDKRGX435P9xPCI0XSG3cSLPuNqTW53pZPEbuYjVpDpbWtnrctYfGKcSvO
	dCKRauWeyudTZSFg5cKvhjGJn6LqJkhF6Eat/BaOnHmzRM49gllAwwVLSs6Ye8NOcjmxKl/4CmqmW
	MC4W10683kTK3TC9DX6jOWeu58Km1NWs1DJadz8gDkP5uJb6w2Ckn6x7/w6xOI1Vnru3JqN/ABUpZ
	IKGzAwFsm2YTObiszt+lqxJAY6NlSYl/tArszVHlGcwSn2cRdAFNaBZo/IdiTqveGl5kkGqnRDiQY
	XJyhRt3Q==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vsoR7-002Czn-7h; Wed, 18 Feb 2026 21:46:17 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 18 Feb 2026 17:45:02 -0300
Subject: [PATCH v6 4/6] drm/v3d: Use
 devm_reset_control_get_optional_exclusive()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260218-v3d-power-management-v6-4-40683fd39865@igalia.com>
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
In-Reply-To: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=zKvkw8v9FF0PR1wEseEBbs4PTvLJNPiF9dMfrp3ZWEM=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpliT5sB3ZFCy2Lj4e/GrDRBgthB3BEgWndbO0n
 jdPHvYUChiJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaZYk+QAKCRA/8w6Kdoj6
 qlQ7CADGHZJHeQuSZ78/7NCV7q9u0Tc2ub+HmD0DtIz9YgfmgXw8KGT43tP2HAFEqIrmlugucyB
 zP73c74UPQK1Umo5VB+K6phUIGEgQZeEh5SdE8Bk558nptcMbtpd60OLq4vN2WU4EKhdhHjicvK
 7OU4lwpxFkUAtd3Z7IcXicAVa076/D1o3ccd42eS5529LKtteQIKFnQGdcnkjlcEOoArNpYmNB1
 3xkjfs2OlHAhuSI8tqttO5TkpdNhOYofMtt/hZnEQgdMtIm0OFB+stLsW1HRsONipc/4uZpyzxI
 q4J3q8PvY82l9zcZpTkj8d3kBwir1/H8MSqVcJcHYr+U/ET4
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_124620_999881_6F81D4F2 
X-CRM114-Status: UNSURE (   8.48  )
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

Simplify optional reset handling by using the function
devm_reset_control_get_optional_exclusive().

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 8de4f151a5c02cbf970e72933d1a275968088357..257f2fefbdb6f8736411de8965919f1728844a6a 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -398,18 +398,17 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 
 	v3d_perfmon_init(v3d);
 
-	v3d->reset = devm_reset_control_get_exclusive(dev, NULL);
+	v3d->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(v3d->reset)) {
-		ret = PTR_ERR(v3d->reset);
+		ret = dev_err_probe(dev, PTR_ERR(v3d->reset),
+				    "Failed to get reset control\n");
+		goto clk_disable;
+	}
 
-		if (ret == -EPROBE_DEFER)
-			goto clk_disable;
-
-		v3d->reset = NULL;
+	if (!v3d->reset) {
 		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
 		if (ret) {
-			dev_err(dev,
-				"Failed to get reset control or bridge regs\n");
+			dev_err(dev, "Failed to get bridge registers\n");
 			goto clk_disable;
 		}
 	}

-- 
2.52.0


