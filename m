Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4643FC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uS1F9ctkBfA7METnPIIJqxJfRYVuvu+3kOoBHHUnNAM=; b=gpjRWFU+51HvYAnGEyTVpTFANJ
	z5glPON5LbwVA892Y5PQw8mIpma2w7Gr519qMm3Fg7Gm8Jb1quFn/ir2WjSTh5g7GWKDSVGNaGcCj
	kUFGM7CDKUT1APK8j3C+qDFnLZs060CNmgoeyp7urXhSDvRdKfMgIi4MJtJwiKUl1Rh2dllUZyw0m
	c8Whk7hYmmc+QrPnv4NlYmD3hxJ9xejCx7fimKd9l99vvoCuKt3WRy5Bg/qnkfxBTFsbx2ApmrkZS
	ATyZgZsvIp92tdbqd7+CRA4TAM++D159Kt/RDCtlrM6bNpmoTjGtYEH30VtCU/GaevMZOdGRq9Ip4
	zAbWberw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6TG-00000009Mug-1JfH;
	Tue, 06 May 2025 00:47:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4UE-00000008pRO-1xiX;
	Mon, 05 May 2025 22:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B07343E57;
	Mon,  5 May 2025 22:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0BEC4CEE4;
	Mon,  5 May 2025 22:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484834;
	bh=KIgy7Ibl/ZmptAPTdNDHWeodw8H4ZjskznkbvsrWrJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pueKcerevEWNPUUbFI8Fo0PIcExpqVxNRggpBDBHDLOjuYnkljavmdI1tvrP3GmCA
	 rewbwgUFVahXsUad7OiQiK4it+7fWgotWEO998nJd1E9YMXBd+6UgwYHOVmNucAQH5
	 ibraaj3ntTBJZofQbWEmVC4LE/9EE/QULIgqjLcunn+uApctEJcRwDbRb+nrEqkUsx
	 PV9O+bjLK/fZ2jinZ3827PnWC9AAiWzY7ouzVRGVV6nkI3x1OhcEiKsvBiOLKmSyC4
	 wPQbbLzfbDJ9h7UpFWSMNZpQTvYTPNzhyFzitj+mm1VIUam4WBfV4PjEKnflXi3NLZ
	 jjLvGdzvfoNtQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	rafael@kernel.org,
	matthias.bgg@gmail.com,
	jpanis@baylibre.com,
	npitre@baylibre.com,
	colin.i.king@gmail.com,
	u.kleine-koenig@baylibre.com,
	wenst@chromium.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 037/486] thermal/drivers/mediatek/lvts: Start sensor interrupts disabled
Date: Mon,  5 May 2025 18:31:53 -0400
Message-Id: <20250505223922.2682012-37-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154034_528446_DC82F6B3 
X-CRM114-Status: GOOD (  10.45  )
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

From: Nícolas F. R. A. Prado <nfraprado@collabora.com>

[ Upstream commit 2738fb3ec6838a10d2c4ce65cefdb3b90b11bd61 ]

Interrupts are enabled per sensor in lvts_update_irq_mask() as needed,
there's no point in enabling all of them during initialization. Change
the MONINT register initial value so all sensor interrupts start
disabled.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Link: https://lore.kernel.org/r/20250113-mt8192-lvts-filtered-suspend-fix-v2-4-07a25200c7c6@collabora.com
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/thermal/mediatek/lvts_thermal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 4b3225377e8f8..3295b27ab70d2 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -65,7 +65,6 @@
 #define LVTS_HW_FILTER				0x0
 #define LVTS_TSSEL_CONF				0x13121110
 #define LVTS_CALSCALE_CONF			0x300
-#define LVTS_MONINT_CONF			0x0300318C
 
 #define LVTS_MONINT_OFFSET_SENSOR0		0xC
 #define LVTS_MONINT_OFFSET_SENSOR1		0x180
@@ -929,7 +928,7 @@ static int lvts_irq_init(struct lvts_ctrl *lvts_ctrl)
 	 * The LVTS_MONINT register layout is the same as the LVTS_MONINTSTS
 	 * register, except we set the bits to enable the interrupt.
 	 */
-	writel(LVTS_MONINT_CONF, LVTS_MONINT(lvts_ctrl->base));
+	writel(0, LVTS_MONINT(lvts_ctrl->base));
 
 	return 0;
 }
-- 
2.39.5


