Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1208CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlqWTxvd2nybMb9oOkq3B+WZ2+KSO9DV36s9D60SrZ0=; b=oyq+cPeUzqEWUp8NRH2v+Vcgeu
	S6VPNckkJly2ziuMRYAu7yaZlLdCQ7Suu1vXV5uxgMt1xeKQi0Pq3E3zeVGi955Fbm1iRHZcEdhkY
	EpnrYUFkxHhijsPg6lswWLczUamdKhcLoGnMEW73PnkNWf3iis/6FrurbmjLwD2ynSoQyGRE402Xc
	AP1bqV+b7UQQziYydNMYhynUZmVsau5PHPU1nZI9HeBADEi8Ii/S7RpdD5AMEIO0ywKTP9tU+Uirl
	wPLLF0WpQgrJyRPmW+i96IBboZZCoXXGHj3G/JslUzE8ubA+741HFB+tnUQd1XN8HPz0xN4Bpn/Jx
	9hZUD+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMAz-0000000CkTK-3iOB;
	Tue, 02 Jun 2026 10:16:49 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMAx-0000000CkRi-1I3B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:16:48 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2bf20f6be6bso23755315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 03:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395406; x=1781000206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlqWTxvd2nybMb9oOkq3B+WZ2+KSO9DV36s9D60SrZ0=;
        b=o/xhyL2hXom+YowGp67VwsUwDMCzLXbWKLlWAG0vFG+y/gpbgu4Ur/FmC58/NxjCTC
         0eFwFiyfwgQ3x5scpAJZYJvYs7kpLlei8X5tWi8EcKOtm9l8XU7Vaimprts9yzEvP05L
         CJDhXXmqRxli2cRlsyZhF4nGkq0q0cJAQuPhzpsq2nP78XDV9TQErmswqW3dTKEfYl2b
         UCHulfA6tgBVKljJ3HwMHgBU12NVBwd2muMJlXvp1Lyv3Tnn5YWK3lwCdcv5d9ixvIel
         Cx1krt3efz5cO6FZCUzlPeTFhriRy8sKjbu35K0edUzIzL6YCG6EENGsZs7GGyOqYTkg
         XgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395406; x=1781000206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zlqWTxvd2nybMb9oOkq3B+WZ2+KSO9DV36s9D60SrZ0=;
        b=D5qrYx0tQ6W4tAGXInH8zD4a0CfCgS1GBY7RYC7Q2iT4/doOQI6iK4L+LpCaAIqgVl
         2yLV74OpWIDOKxna/pDqBbcuHaofB1RJEP7/HDjiHxCHTqIoRvV2OkpSDwKd60skaVJT
         P667zqHYMHHW0Z9xy6TW5CPpkBf9YDnj2p4sbzk5l3XKAdFh5xGE+pJyblYp557tlyMv
         +0g2sxpMGcfU00sg6CkPx/jSd38eajwWBYHQuGhEdYjdCmrBDoHwLp9s7GDdwkAPhe+y
         M4yUdbZp3kAAMhjxrjN6hR5j3xPtr9krjNtzKG0npYY8QuQxF6YIwl4KJEC5ool1SWg0
         4vog==
X-Forwarded-Encrypted: i=1; AFNElJ+zvwPY+rjSKH6nQOsBig+xrmERl8XraLqRRve+S9KG9RfLGzVn4fllAcr6Ycnd6J4nFJO/Ayj65sk3qMcThqO8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn3tVpLT4qATPIsHsq3UVcc78KIISW/UvTEsoBal4kV4p2CoKc
	VTVLvKV5Tt9axTtOk58DUa3ILgB+qjZaqWZGs68im89fyKEiNbrfuSUD
X-Gm-Gg: Acq92OHFSSoXeAbhyCDcHGS6XX/jL9xa2cWUckiPhVW2VHpdoZuvEvyvxYJ0GGAO4l8
	2ee0q+rTbLxd+lbQ1wJVzxxLlcDXCYH/BjY+51M9TZ1jR71hZK5XRh5HGDM3pKi+25BYUlnv7Kp
	Nz7AoOlfOM1A5ftoEiUGNVRiVphAoyI4zRgp9QIYo2L64TfnVIWqGO/s8BmHwX93DC4HDdXopim
	elOl4BXEvDxfaESFcgiv54IZTEMGFtiTdHtnk4NQEq2ICzylRKkuDwswVDddMD+RUE5obqIF2ZD
	K2/MAIU5MeY5qY5fgri/FJQpCiNEXZ+s1xmgqcYcMVOHwS6+xVd1E8Ni3t5fyzsy+PiP115ngpS
	HlH7bjdNiv3GsMu+4F7CNatfo4XONsELiSFKH/L03Nhr3B38qcZTld06g6/Bb3mmtyn/SUnBxr6
	1T2SvoReApBbLLQ2C1PHJeJp8Tz87y+OaURXmC9qTWuCNYLCy2jLpZ0m2vIb8U3skp9w1x
X-Received: by 2002:a17:903:1983:b0:2bf:23cf:3e4 with SMTP id d9443c01a7336-2bf367d9da0mr164110925ad.17.1780395406357;
        Tue, 02 Jun 2026 03:16:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:16:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/5] ASoC: rockchip: spdif: Reorder clock enable sequence
Date: Tue,  2 Jun 2026 17:16:05 +0700
Message-ID: <20260602101608.45137-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602101608.45137-1-phucduc.bui@gmail.com>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_031647_349993_28606543 
X-CRM114-Status: GOOD (  14.41  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Enable the 'hclk' bus clock before the 'mclk' controller clock during
runtime resume.
The bus clock provides the register access interface, so enable it before
the controller clock. This also makes the resume sequence the reverse of
the suspend sequence, which keeps the clock ordering consistent.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only. Please help test if you have 
    the relevant Rockchip hardware.
Changes in v2:
  - Clarify in the commit message that the resume sequence becomes the
    reverse of the suspend sequence.

 sound/soc/rockchip/rockchip_spdif.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 581624f2682e..8de5b76cfe79 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -76,16 +76,16 @@ static int rk_spdif_runtime_resume(struct device *dev)
 	struct rk_spdif_dev *spdif = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(spdif->mclk);
+	ret = clk_prepare_enable(spdif->hclk);
 	if (ret) {
-		dev_err(spdif->dev, "mclk clock enable failed %d\n", ret);
+		dev_err(spdif->dev, "hclk clock enable failed %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(spdif->hclk);
+	ret = clk_prepare_enable(spdif->mclk);
 	if (ret) {
-		clk_disable_unprepare(spdif->mclk);
-		dev_err(spdif->dev, "hclk clock enable failed %d\n", ret);
+		clk_disable_unprepare(spdif->hclk);
+		dev_err(spdif->dev, "mclk clock enable failed %d\n", ret);
 		return ret;
 	}
 
-- 
2.43.0


