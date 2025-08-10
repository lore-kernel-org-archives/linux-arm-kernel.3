Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AC7C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omailk5J82FETW0CF3chBXgq8BxD9mp50Z7b28u4AKs=; b=ur5kkXVgH0RslXSGPA7G+QSDt1
	0AUKGpYeyQFfmW3ZClZNHiYtx7xo9FgzC0ik+7CNfl9RRt4lQ1N5rKkbE+2unPD31pmfEo8F9exid
	e3VnATi0X+j7V/Gi4Kz5WZo2ydWgydTMyB7qH0KKWf7wAMtGj1pwypIT7g5vNlACfAlijVo496d2y
	83y8WknSUtZD5ZB1DtJ+jT+qS3ceOvVR1kWAUwlUf554wyyrLY21yTUlSagGvOJIdwkocSTSYC4Td
	dlDWm162HKxVSjl6FgOYDDNZUG7vKnciXqGb+7GGLAW6jBhBa+ZQJOLktaouCQO+99XQKKw0mBzWa
	nttS5pZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEWq-000000066nk-2PRw;
	Sun, 10 Aug 2025 22:28:36 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEOp-000000066AK-1jXd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 22:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1754864419; bh=omailk5J82FETW0CF3chBXgq8BxD9mp50Z7b28u4AKs=;
 b=LQ1okNTugNRqfv1pddjAzVR2Ee4DnaTNHu7x2LLfMmrA1BCfiyxuMZDb54ERLkEgDU9QdYEty
 jvD0X2DUNY7foE8x1acdNUiajvqOh17ex81/1xHqYgpzJJmWk4OK7ELigSb/MoIFSQe0sZKjEWY
 WWsQbqJqVb9kiILvyxugfgoBG/8/hpPtJNDOGZbi9Jlc8rJE+OcrEmBoujr8PZEN54y9lW7Gta1
 epXS1ZXHs7Zcg6NAusGjjnd5g8Pq8RsjUbie0VIJq6t+M1KuNEeaWw9CopgJtccDeCOdowfmCG2
 C8XfvXcDfaRa44LlFjmdjs6HYIY18cH5Q4qnigUGf3vA==
X-Forward-Email-ID: 68990e66797ab8962779243f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.4
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
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 4/7] media: rkvdec: Add RK3288 variant
Date: Sun, 10 Aug 2025 21:24:34 +0000
Message-ID: <20250810212454.3237486-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810212454.3237486-1-jonas@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_152019_499775_5EABC90B 
X-CRM114-Status: GOOD (  11.16  )
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
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 56807122720e..c20e046205fe 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1222,6 +1222,10 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+static const struct rkvdec_variant rk3288_rkvdec_variant = {
+	.capabilities = RKVDEC_CAPABILITY_HEVC,
+};
+
 static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
 			RKVDEC_CAPABILITY_H264 |
@@ -1229,6 +1233,10 @@ static const struct rkvdec_variant rk3399_rkvdec_variant = {
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
2.50.1


