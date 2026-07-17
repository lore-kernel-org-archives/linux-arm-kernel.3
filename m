Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3924C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyWkM6zopcr2MMl5SvPrurm7WiNsCcjkD9OPElmEF7w=; b=zkbgyfUE4yMMXi7vgr/Y7PgbH0
	JOmKfWf6ayT1nd4M0rRNp9lLDNfaCwdRXpU0afdbVMY0xbke57+E6U7fheLwC4C8nr+HI7fw/FzHx
	jtNwHb+x7Y8ojeWfmNp5YPMHS1lIo/h/WG8YVKygeDgsAM+C+v57y4G4057UMPJ8gUGfFY2ZHrJog
	7ULpL7A0jow6QQoVoxxX2c8lmeAmD2ZjMT/GA8vXoVL5kbMLhWB8Xo1I8qdh+zqweKnb3+0tVKOIP
	b7rbNbsA0XQNlgxF7TuSUIudxcbYuJnYYpFDWNYlk1VUioF2o1WrRsEqoXM2pd51GMmMdPQA9la9k
	EXOotvqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdU4-00000001X4i-16Ja;
	Fri, 17 Jul 2026 07:59:48 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdTw-00000001X03-459p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 07:59:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso5428765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ahdrone.com; s=google; t=1784275179; x=1784879979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yyWkM6zopcr2MMl5SvPrurm7WiNsCcjkD9OPElmEF7w=;
        b=isHvt9KE3xSvwxTjkB0wHl3hGeWTYRyEVy1gUNVkBrUEY1u46HPjIKwkHMPG3DyXv+
         ZL1R3KRPdBg+PkJZh/cK3+ReoUhfz8DE/Aec2Fwc4qTiHzJsKj9mBzBOg0dHG3LC/A4x
         5KJaE+ddXQl37OYnu11HRl3FqsOoymIXqjwWERSB1dFTgkfh8xZvSKm9+S2XndXVLkOR
         XRoeTVwr7i6SrwwdWbZdEof3axjlxrzr5lSR/pmOJt39IENOCwWljRnQLCRoIV884PrN
         0oXOWFo3+4qATB7QhXXIJTlByRwXYanSsZXaDrraKBCfDjqc1b0booTZNIwT539wzE3L
         oEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784275179; x=1784879979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yyWkM6zopcr2MMl5SvPrurm7WiNsCcjkD9OPElmEF7w=;
        b=pTLk5aGCL7q70APIxq+s3iG4R9u/hxvbrN7Bz3AnckcaV+k6c6f983AWFugsU9K/fc
         DcjkGAY/C7TryYJ6Qxy33Zdjjmq3F0FxYFPhNgtcnK1eYRol4lcs4XZzaF9KaaBMDI7t
         MvO6PMkVoo9ukNk6i4tfkPBDIe62wzWwi0OgCcf3e+8fk72RcBeYNntv+PExopNyd58t
         XZh/gM3s+Q+XBxpADg6yfqQHKZ5sLBoxTrrI5xG1Pdi9Zau3qzAi7v0QISK+mdXXwdGr
         TWLjiBYMbDHgEN0/NIkZk6a21tdt6jRxb1cf6aiPfXhafIxvKUwZB2/GP6sSLhUvGcPr
         c18w==
X-Forwarded-Encrypted: i=1; AHgh+Rpo3KtQVyrhJ63mLkLz7c89rnm/CLp+vVPF0K3PL2cG0xYRV/Qr5pMQaN+HpEC0rGevLuotPzBBo/uZsfdSNY+K@lists.infradead.org
X-Gm-Message-State: AOJu0YzlDNw4Uo/eTjdrNOiKMK9Pj3WWt1m/fLSbOP0q1uqDGosSijSa
	Z6SFJqSAxwJU34ZbrrHL7mjkpBSSigP9xi1NbzUk1n1QoXtVsExSoJfLiGEtuvo9q/CpIxtg72s
	saSFmAA==
X-Gm-Gg: AfdE7ckOlqYteTqyf9qYDQ1smS9IPd6ch7D3dzbE1TblON/sFtW+R0wDxgIxNTcHNLU
	Nhm6G04YoZj1HFTXILjo7/x2TuybAfDz/nBGxLTiZwEhjzvuVn9UuAmFigdbC7mClGul5vdeLqA
	edoy4x72xaFcoviM2FmWNlRzWMCfS6pJpYHz8tQ7bWrGdoNpgUZ6nlGcQfsJ+2YZXcJlkt3I+JY
	pJ4U0yEmT8rNNnL8MHBuCULZJr3yqC8c7fHFfMtKyX3yEM2qww57nIQ1U14TKM1o5obOi3gJ7RD
	aUHfiX7brZnkr7DODQNJ3Soy64VZD99rAGsI+JLpTnendJxL35APr/OUdNBO7SYy9+q52XyHCFu
	MCMgu4sCu90aTH5352KRLvEmaBw43BgICeU40A8jJwKO33J07vfG650iLynYs1qcpecOjAdYAhl
	xTV4ZnxhcUMcIAOFaB+gRUbHlFlQ==
X-Received: by 2002:a05:600c:705:b0:495:3b8a:bf11 with SMTP id 5b1f17b1804b1-4954a515217mr10032355e9.26.1784275179062;
        Fri, 17 Jul 2026 00:59:39 -0700 (PDT)
Received: from rikus ([2a01:e0a:edb:6330:cc2f:bd70:58a:fcfb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm31709045e9.4.2026.07.17.00.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:59:38 -0700 (PDT)
From: Hugo VALTIER <hugo@ahdrone.com>
To: Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Hugo VALTIER <hugo@ahdrone.com>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 2/3] pinctrl: rockchip: extract iomux_recalced_routes_init()
Date: Fri, 17 Jul 2026 09:59:15 +0200
Message-ID: <20260717075918.1869879-3-hugo@ahdrone.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717075918.1869879-1-hugo@ahdrone.com>
References: <20260717075918.1869879-1-hugo@ahdrone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_005941_028390_1672ACD5 
X-CRM114-Status: GOOD (  13.74  )
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

Extract the per-bank recalced_mask and route_mask computation out of
rockchip_pinctrl_get_soc_data() into a separate function and call it
from rockchip_pinctrl_probe().
This allows SoC-specific init code to swap the mux tables before
the masks are computed.

No functional change intended.

Signed-off-by: Hugo VALTIER <hugo@ahdrone.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 849e72f1832c..549834501e7f 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -4370,7 +4370,18 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 
 			bank_pins += 8;
 		}
+	}
+
+	return ctrl;
+}
+
+static void iomux_recalced_routes_init(struct rockchip_pinctrl *info)
+{
+	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	struct rockchip_pin_bank *bank = ctrl->pin_banks;
+	int i, j;
 
+	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
 		/* calculate the per-bank recalced_mask */
 		for (j = 0; j < ctrl->niomux_recalced; j++) {
 			int pin = 0;
@@ -4391,8 +4402,6 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 			}
 		}
 	}
-
-	return ctrl;
 }
 
 #define RK3288_GRF_GPIO6C_IOMUX		0x64
@@ -4505,6 +4514,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	/* try to find the optional reference to the ioc1 syscon */
 	info->regmap_ioc1 = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,ioc1");
 
+	iomux_recalced_routes_init(info);
+
 	ret = rockchip_pinctrl_register(pdev, info);
 	if (ret)
 		return ret;
-- 
2.55.0


