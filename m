Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94794CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 19:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a24JwIPc+tBBg820eesT0m8iwbS1J/efZ6fiBKYnR3s=; b=qldFgaEYJ/7y46X8EGVr9tkayK
	aqU4OK0wejNX43ADK1ins5tled9E151gAOtMq1VvQJe2I2MfaOdhNfuwgZ3FqOouhaN+zygoWeBvM
	VRX/5zhLr4vmhNHMBgS5BAeZMVvW5UWma+aHw+OSNmxhFGOzPpwVSYIE4hoOawqHTYLD6hgoYTr7z
	4dJCa0zPjz/AjVIBtFsKObkLjhxXloofYl85GDghOb+xoWzqm7nZ7jFNcHfxuwyDd9fCBkWnn8SLi
	VG3Comx46oajYPOCknSu3oqih+gFv5b3uV4ocCtn45/qRm7ewEh6wAF3OLIgS/vkT38+gCDLtgaf9
	j6+8CI7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uucDd-00000004CT0-3CyV;
	Fri, 05 Sep 2025 19:35:33 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZAh-000000033x8-2aav
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 16:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1757089219; bh=a24JwIPc+tBBg820eesT0m8iwbS1J/efZ6fiBKYnR3s=;
 b=Zxf5cdclawCDKSY8o+uex2GUWym8fYf0g68BCBtUusLMBEBZ97pUaXo9KrnRcC+3/tVNbMAcG
 pufMGTHlCDUvJA5qkDoNGwcNvgsaEd3fyxSVwD6/fxQbxAgeXA9hIqbTVYjTEoaiIgbvgmLlYzj
 EAc2qq2a5V1lDdlaFROL8h69WK0/vFmoZWrjSUbiHmgyakEm3AYuVl0laRNzVD4mPRuFmuwr8Ei
 eka4+Z+xfDAo3V255uXlMCX7PXaBB4z8DklZVimCbik+9xKZoqY9fMsmW/Buf2WvPSXs6rFqXPR
 +gsC7ahLxAYh86fWIDuQKRWY3kE80V2pE6xNPTf3k3TQ==
X-Forward-Email-ID: 68bb0dbc90d039a4fd84d62f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.13
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 4/7] media: rkvdec: Add RK3288 variant
Date: Fri,  5 Sep 2025 16:19:22 +0000
Message-ID: <20250905161942.3759717-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905161942.3759717-1-jonas@kwiboo.se>
References: <20250905161942.3759717-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_092019_691389_A03FFD39 
X-CRM114-Status: GOOD (  10.83  )
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

From: Alex Bee <knaerzche@gmail.com>

Add a RK3288 variant, a version of the Rockchip VDEC IP that only
support HEVC decoding.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- Add num_regs field
- Collect r-b tag

Changes in v2:
- No change
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 088ddfadf995..f8cbc7bcfa15 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1221,6 +1221,11 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+static const struct rkvdec_variant rk3288_rkvdec_variant = {
+	.num_regs = 68,
+	.capabilities = RKVDEC_CAPABILITY_HEVC,
+};
+
 static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.num_regs = 78,
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
@@ -1229,6 +1234,10 @@ static const struct rkvdec_variant rk3399_rkvdec_variant = {
 };
 
 static const struct of_device_id of_rkvdec_match[] = {
+	{
+		.compatible = "rockchip,rk3288-vdec",
+		.data = &rk3288_rkvdec_variant,
+	},
 	{
 		.compatible = "rockchip,rk3399-vdec",
 		.data = &rk3399_rkvdec_variant,
-- 
2.51.0


