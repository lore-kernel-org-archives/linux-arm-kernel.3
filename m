Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CCFD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k6Xceg2OD/lxCrNfx6j5iuRJOA2fkoLkdUN/b0QbNS4=; b=xP/NJ7bsEJoRzzg0cjqQwx6KwK
	Z/cu9PnY5vH2g6uHuBCa2a8zDZOJkDIzbOtLB0WVlJr3m3/ZNgEMfs1d6J2+uKOvPfXlS+R9Rxyi5
	1Fl/rAfIiaLzdv/5OXbt6IOZRlEFw+F6luBXmojCPxMJY4JjwrWpSW6cOlRKerVN8vb0SI5bREmUK
	7mps8HzLxqEbyL+OurZfgFhOuX65rjFVIp8wKTj380l5Op5BaN9tZ4QerXtyg6DJaqwQbxYVgXGUz
	FGiKoAeNdwVzM/xT/Rpp1C5pfBTk2fYfaSrVNORrVBpbofO4XWyS/Dug025aQ1cboHBeAx9GtiggP
	aiDdhsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA3U-00000003j4s-2ffj;
	Tue, 20 Jan 2026 11:37:52 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA3S-00000003j3l-2EOO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 11:37:51 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-81e7477828bso2880790b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 03:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768909069; x=1769513869; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k6Xceg2OD/lxCrNfx6j5iuRJOA2fkoLkdUN/b0QbNS4=;
        b=muw2rRJYhIl3qQQocTngi8n0TThojt5VvKHJHOOqikIw2RNEeNnKrMLBOYhMpUjI6T
         t1uWz+LbzfnQtq/WwSvw0vVTPqKxCCu6khr1kAAxhId8Ch2AkZBaE/tQAwpcKQ7z2/b/
         cfI6nIOF2GMgvakjCWwdj5e9Uczkg58r3aDtCaLBVbpgiBKVgesID/pBlfXAv60Fi2v/
         mjFBU+nM9q6c7cj1aRPwTlGZgAUI6WOU1rQGBMUVi+Kr3edRrVk5I5INsaOwFjD10RXM
         r8bpWeFn9MBWjXh4tnKRIdJytN2GLpNHDl3/i5fYukkvP6cZNSaB2Ioi1hyHvNM+Bb7g
         qNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909069; x=1769513869;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6Xceg2OD/lxCrNfx6j5iuRJOA2fkoLkdUN/b0QbNS4=;
        b=gfVp1q+ZNatc2LtYYhZ4vbqknC4O3DUp2yYt7d2rro3JQDOd9UDjgrJyfWP5Og5iuc
         SzuXM1qgNYzlwfTXVIiAPtCeOIgAlM4GFAKY5NyUGf0Ky68iC5v/QR9ybvyznteKc8lq
         r+C37UapcgPH33rmYogy8zLqAe3UauLmNdf0KreDGh1bf1J7p4QIRmVN+wg2hIphibfO
         xJW5vOvR4rptrheRB4bQp8eZz5BejkflfE8Tt7wOXqcPmmEHmo1LytsrlsZcZ/QgHDrD
         LKzLB7DeKSJ6GLqQKhy5l5oud9FgU34fS6Gvui9eBzYXM4zXP9Zs4RVnpMtv/62zZk9Q
         ACXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCxWRvoDLKLuLdVEkQLq4lldEHf5/cZ3NX8nDsf8Pp7X9+nzX9xT0UfQOXSTDU2GBt2FzoqoBUNc67AW+jemOb@lists.infradead.org
X-Gm-Message-State: AOJu0YwP+vUb2oFoDh7qdahAqeNXZYfCQL/SD0ya4CjaCqCH7KjHbY0J
	FY8Czf2z3TW8MboHnKC9SPTKahmpcf5VQdUZjMjyPBDw+NPiO5Yesabo
X-Gm-Gg: AY/fxX5Y+Y45LcK3GDme3LiSHSc93GkM8zpHJ2a9RomkI/jNBWo6weCpkD8YQ2fCJDQ
	JFvacJi5JfvFCo/pyhyaZhPiZxquoca1ranszATgxzY3/CmRTpZM7p5rZXYcAr5t1nj1Yx4uwGA
	Bkc42KJMz7KCZfhqHr4BCrA93uUY8xIl9bnFYkyC0kEycvOtdRptDwwfZTg9mcea21Af6F3nZCK
	IvyfDamADZcW/E7v30Kt7CilBpwSGZXvmn+Hsu5OUUelwZb7d9OSOs6hRifHdVqaESKAVihA+CI
	3U984LxfMXHUSBUOb/cq5clqEFy55U1/Z0dCrTxzlaAt4cRgDi/Sluyet6RQ24YlQeNPQpfOjaO
	MAY7xWBkMjZqvwsHgzdCll5lWQjM0qvKnh3VoJBW1pfa8F7g9mVAnnBhztXbj87wlqTgd7j7Bbd
	c+MiOAnyfQQeqBIKS+R7WP1A2G7g==
X-Received: by 2002:a05:6a00:929c:b0:81e:4a9e:f809 with SMTP id d2e1a72fcca58-81f8efbbe25mr13964911b3a.2.1768909069116;
        Tue, 20 Jan 2026 03:37:49 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:9fa0:1400:5c26:1419])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf264b9csm11462134a12.15.2026.01.20.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:37:48 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 20 Jan 2026 12:36:59 +0100
Subject: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
X-B4-Tracking: v=1; b=H4sIANpob2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMD3dyS7JTiTF0jy1STZAuTVPMkYwsloOKCotS0zAqwQdGxtbUAlxA
 E9VgAAAA=
X-Change-ID: 20260120-mtkdsi-29e4c84e7b38
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768909063; l=2852;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=ETsLcSZWKB9eq3Cr6keAewRWPWzheGP6F9hf6pabzj8=;
 b=vFf5Qdlbwe4FiGiI83Db84ydmZAaWLQ3TMiZXuLTGwCAwsOUAzY4UJTj0cTS0qPmPPd3VjN5F
 RL5WhoIxZDkAMo+KcW2ej0+SI1Sze9wVe2bNPa23aYLM49ontoyVwcq
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_033750_575239_E3B2D3C4 
X-CRM114-Status: GOOD (  14.68  )
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

Some bridges, such as the TI SN65DSI83, require the HS clock to be
running in order to lock its PLL during its own pre-enable function.

Without this change, the bridge gives the following error:
sn65dsi83 14-002c: failed to lock PLL, ret=-110
sn65dsi83 14-002c: Unexpected link status 0x01
sn65dsi83 14-002c: reset the pipe

Move the necessary functions from enable to pre-enable.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Tested on Tungsten510 module with sn65dsi83 + tm070jdhg30 panel.

Left mtk_dsi_set_mode() as part of the enable function to mimic what is
done in the Samsung DSIM driver which is known to be working the TI
bridge.
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 0e2bcd5f67b7..b560245d1be9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -672,6 +672,21 @@ static s32 mtk_dsi_switch_to_cmd_mode(struct mtk_dsi *dsi, u8 irq_flag, u32 t)
 	}
 }
 
+static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
+{
+	if (!dsi->lanes_ready) {
+		dsi->lanes_ready = true;
+		mtk_dsi_rxtx_control(dsi);
+		usleep_range(30, 100);
+		mtk_dsi_reset_dphy(dsi);
+		mtk_dsi_clk_ulp_mode_leave(dsi);
+		mtk_dsi_lane0_ulp_mode_leave(dsi);
+		mtk_dsi_clk_hs_mode(dsi, 0);
+		usleep_range(1000, 3000);
+		/* The reaction time after pulling up the mipi signal for dsi_rx */
+	}
+}
+
 static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 {
 	struct device *dev = dsi->host.dev;
@@ -724,6 +739,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_set_vm_cmd(dsi);
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
+	mtk_dsi_lane_ready(dsi);
+	mtk_dsi_clk_hs_mode(dsi, 1);
 
 	return 0;
 err_disable_engine_clk:
@@ -769,30 +786,12 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	dsi->lanes_ready = false;
 }
 
-static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
-{
-	if (!dsi->lanes_ready) {
-		dsi->lanes_ready = true;
-		mtk_dsi_rxtx_control(dsi);
-		usleep_range(30, 100);
-		mtk_dsi_reset_dphy(dsi);
-		mtk_dsi_clk_ulp_mode_leave(dsi);
-		mtk_dsi_lane0_ulp_mode_leave(dsi);
-		mtk_dsi_clk_hs_mode(dsi, 0);
-		usleep_range(1000, 3000);
-		/* The reaction time after pulling up the mipi signal for dsi_rx */
-	}
-}
-
 static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 {
 	if (dsi->enabled)
 		return;
 
-	mtk_dsi_lane_ready(dsi);
 	mtk_dsi_set_mode(dsi);
-	mtk_dsi_clk_hs_mode(dsi, 1);
-
 	mtk_dsi_start(dsi);
 
 	dsi->enabled = true;

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260120-mtkdsi-29e4c84e7b38

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>


