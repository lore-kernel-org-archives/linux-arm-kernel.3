Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844BCC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sab3PBZsYV+Qg8JG/2ark+p+RM4PexQTwQc3BCtUEOQ=; b=zdvapHcd7Oh4szEiEX4Q1TMfTQ
	fLiDxgUZ6Z5syy7WNFb4kmHyz6x6+EI/OeH1DLsu8uMpTc8YGKeGqogOroIRLqTpPcV9jbu/i3tAY
	AOiHt3pMm4XKqyCJkRLTGbbSG1yglpCgafJbnv1klVJPymKXf8MWZYFd1JQ4YP4fwiZvoWtnjilVz
	oavLZagotzCDkLu+j61ulgLEIfMU0sH6JkpmnWV8B+hhXbrvluXDTMu+5bCDptlFR7CNieuDz8ZWC
	M6FQm6lPL3FJhO6kxotNnM/F/TY2qfXIUHvpqjU5WK50/+JKZfbOI4JCW+YRKpEffZsA2Ap6RvRmb
	oQXBeVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpX0-000000039Yy-40zv;
	Mon, 07 Jul 2025 17:21:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp2I-000000033tM-1J9Y;
	Mon, 07 Jul 2025 16:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=Sab3PBZsYV+Qg8JG/2ark+p+RM4PexQTwQc3BCtUEOQ=; b=rblIXFToZUEfu3MV05/8H8SEQF
	bYqLZZeXf7U1nmiPSumzkIidH3TEM89H9qDFc5mRLV8/3T0VJn3UPBBk8qmmR0CSZt5lyqQSTpfzY
	EKAshbgRKHRsEIfnvv1DJX9zOoYcXLFVb0F26SuTIcqPJCRSVcQBjsLglVVkI/6wY2ATTGswflbBD
	97lRqb3sCXs2RUXOVeeYKAZ4Ihrw4ESCnJyVLpJC7Cw9kNIKzDHJUBaITGHPJRLqfj/jiGvfaTih4
	sI/AFWak2UsTXo/s7Z3lGt7LYHdH4Su8vcUaBwYclo/GZJqrmn4bRWw4ortlYD9CkWTz1oE4loYy7
	eaqaf+5w==;
Received: from i53875bf5.versanet.de ([83.135.91.245] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYp1p-0004yl-JE; Mon, 07 Jul 2025 18:49:17 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	andyshrk@163.com,
	nicolas.frattaroli@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 01/13] drm/panel: ilitek-ili9881c: turn off power-supply when init fails
Date: Mon,  7 Jul 2025 18:48:54 +0200
Message-ID: <20250707164906.1445288-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_094946_350266_9F53F478 
X-CRM114-Status: GOOD (  12.61  )
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

The prepare function turns on the power-supply regulator first, when
preparing the display. But in an error case, just returns the error
code, but does not power off the regulator again, fix that.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 28cd7560e5db..d7a17dca2a9c 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -1292,7 +1292,7 @@ static int ili9881c_prepare(struct drm_panel *panel)
 						      instr->arg.cmd.data);
 
 		if (ret)
-			return ret;
+			goto disable_power;
 	}
 
 	ret = ili9881c_switch_page(ctx, 0);
@@ -1304,18 +1304,22 @@ static int ili9881c_prepare(struct drm_panel *panel)
 					 &ctx->address_mode,
 					 sizeof(ctx->address_mode));
 		if (ret < 0)
-			return ret;
+			goto disable_power;
 	}
 
 	ret = mipi_dsi_dcs_set_tear_on(ctx->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	if (ret)
-		return ret;
+		goto disable_power;
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(ctx->dsi);
 	if (ret)
-		return ret;
+		goto disable_power;
 
 	return 0;
+
+disable_power:
+	regulator_disable(ctx->power);
+	return ret;
 }
 
 static int ili9881c_enable(struct drm_panel *panel)
-- 
2.47.2


