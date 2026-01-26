Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773FCD1950F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3TQkix31nSO3DE+TASdwKeJFfjpLtAJyrBSqcWBFOg=; b=5G/dtpTMfYXn2WDRcADlHWXtBj
	TNx5U+FnVgJFFYuPOse8n5Ev3412Pw5nmxW+KAvg803FfijBWhS7hhhFM+BeiNmgOT8Asy3zGN62u
	9VU2cgb6j9ScO5vXLrUWTFCw3eHNJaekB7Zey2/JnNdpM4YVkuNLm3S5XwangDFpo4HHso4eXOL1F
	LIZXNM4U16PREqPhGZXFnAUPSKc1m75Jk2RZgHCKmnSzYrsA/Sc5qX6uTkVq3EoWjdGhk6unqYPcl
	fZMURDGAIAz/Da8TopiP98kfxAzk1ItFBXQzrN6Pyl8klN9jrphuZZMlW1Y/nXGR11hKz/AZu/csV
	fSFtIAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQNC-0000000CyLc-25xv;
	Mon, 26 Jan 2026 17:27:34 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQN8-0000000CyIH-2sYo;
	Mon, 26 Jan 2026 17:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z3TQkix31nSO3DE+TASdwKeJFfjpLtAJyrBSqcWBFOg=; b=Aa+srdh1hxQq5hUuV3Z70tR4O5
	uyPG6itTrpsTZyeQjkd8OwA9YtXmXclt4+kgcH/I/oPZLwiMNgzk3lruk+dTuNWDrGX2L5bmd2oD0
	aGXA9IwyOnOjqODiWsCGfAxpSnuN/0TV1jP0hxfKtxiXgs9W4/TXyRE9/rZnOf4ZzAPVhgAU0vfv9
	pKUCat7+igu99bQllzX9H1cP47m0q9jB1KE3e1Q55J3s/S+56RRIXNk+jISNvKFzJijgKdzpbNU2K
	Xri4lmre3qcu80BiSpXV+euB6S9gIkzbcD/KpVEFf9NIDobQePj1fQn9Uqe9aKrCfTK4ACANrbbjc
	mFzeH3kg==;
Received: from [187.36.210.68] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vkQN2-00A8mi-Sz; Mon, 26 Jan 2026 18:27:25 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 26 Jan 2026 14:26:40 -0300
Subject: [PATCH v4 4/6] drm/v3d: Use
 devm_reset_control_get_optional_exclusive()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-v3d-power-management-v4-4-caf2df16d4e2@igalia.com>
References: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
In-Reply-To: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=wdK6PGLiRnlpa9+cq1grUo29qiGFO0rt0+G3UR3/sk4=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpd6PezTPMnqdJN2J08Aj4g5y1GTm7DwuJHX4G4
 7YuZWZ6vHaJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaXej3gAKCRA/8w6Kdoj6
 qtR3B/9DPxAiVF5m7sS05+ODHmpXzitYZMdondUUjtluNCaVIXKkf4/q+IH/L13y2iQKe008u//
 l/2zAUGK2tWAdx3ZaZ1pEuAzwwUl8zD2u7MX/hMYxWI5dWnGMVFecm21/qJy0Wcy3uk/xyhBABU
 iALOf0do9iDzAPiPfaVIBRPrsVh3H+tKr2k3pIbip89Ff9GwtUoq3Fsdhn0gH/2NRtTilBGQQMu
 VCATK/GEXJe4+tUrdDEeJaj18cmIewwF0N4oKpROD1xv093GBLhfW5UolaDUfGhAAj2kpx1el5U
 4g4Co1ltElcyBhzaPX3wuf+LE93RkBaOs1eima4vVMk7OY79
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_092730_742531_CF3751B7 
X-CRM114-Status: UNSURE (   8.64  )
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


