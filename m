Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93764C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w6f5zaTCHzRQgmPEKk5TD/UO+zjNwknfFQgnjXHiDpE=; b=AaYCyqv5ZauMIBvKDXlNIy9VG3
	e4S1lvNgwUAdY/EW/khoNMGLsmjYdUJuw6AILzpddDzDv+Wg+gfd1bjX4zaE0oPoTuzE46AvNkjjA
	4zqqJpK638pf3SlL/gyNPpPEOYUn7e4+HAaZ8GvXa9l0Q++Jbz+N7SNk+8n541675jrWzUBqOxaHW
	2ncQcHiR8h3Pd/jTiLNF/6MxKSoSSm3M9zBpxmWcx5wK6/EJjJA5/FrtCesHp+ldxgpO4qXER7qmm
	sXUHRrCRGsgKCDzHh3eMkzhcMje5f+04CwMgWGK8tWBPZCcj9UpZ9IcIONWkJDJ18QaLbOj3UxqlP
	VEOr0uvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xjL-00000008wYv-4BIl;
	Mon, 31 Aug 2026 08:51:04 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xjJ-00000008wY3-1iUV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:51:02 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5b4adcce4b1so3433141e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 01:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788166259; x=1788771059; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w6f5zaTCHzRQgmPEKk5TD/UO+zjNwknfFQgnjXHiDpE=;
        b=A7do94S0e5uydGofuoVkXBoRRTPwsnV+Kw69GWsYneTFBv2v7tYOoi2EEk0qVsT5Yx
         OXkGa7UgaC1DwtiWRzYTkK3Ir1vTcQH+gKYviQ/YVLFnKPZqTjwIa6+tJpCd9XZazCQk
         H1lr4nJUHdHJraroABVqIlJI6B8nPdy1fC9PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166259; x=1788771059;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=w6f5zaTCHzRQgmPEKk5TD/UO+zjNwknfFQgnjXHiDpE=;
        b=fw+1X+YsINy0NacvxRC2A+5qNNez7BVizhAs8XjA/wKkIKN2BjglFoqO6NxcJO+YwW
         u7EUPV7nhfoS7d3F2Qbxxv3U66ZpJDWbl1Xq4QAscuUDxU4l0jtGSTT+ndsOc+7KEwCu
         dYynr/3j1KIU+iHgqD00aHakAeS1ixgDlaguEabBKAYpXXo58MrmUdp3kgNekgKBe6H9
         jZunygZo+NTEy0hl5y9vf/VcqFnNY5O3adFVNCCiAlg8qMRKWHza7MRG2oRfGa+vjcg2
         YilsUx0rcSU3C7MqThQLyl0/0600wtO6ZuP6esR/LnAq2o3nYM8pNXLYx4m63sJnPnji
         c6aA==
X-Forwarded-Encrypted: i=1; AKwUvBwBngc3uUPdJJCzysMHFDtFirCgAmtdtSUeZw7feNSQgS0JS2++DIfVp9jPKKOk1IgXBLq2+epTqeWZZECTOwQR@lists.infradead.org
X-Gm-Message-State: AFuF++mV5JqzVbZ6G22yodL/HL2tg/QE9vSDvtbN1MaCfCHMNzA4Npjt
	3IiQ6/SOGo34oAk5ukn7Twm903VoIpT3cnxyRL40jQdODlK0Wz424cJcRgu8l4o6/Q==
X-Gm-Gg: AYBFou0tFKFwPQYe7DOCGkx86iLgUUyH451cQFE5jPtWP3lj7a2DrKMb63I0+soOQoC
	8lLQ+qsc7x5Dn6SOd4AboIHbLLIPAWBk1CaHXQpzXHqfEpdgzThYAWk+MjixFVMt5V/ic7ukZCp
	yzyMLSkVhiQkkgLPNefwgZEoZ3ZzML8+p2u3T49aEWrXKaqXhIeKlFjpjWo299GRK6agNvsrvCn
	U5IqqC/NjgqnLpHtk1VibkvjeiXcjA60urxNDDjHet7ic2cWfuG4zFDCAPlTXkuzYH6n8hOUQ+E
	bpZA1B5K8EHzAQuXZs/KQOODzabjp4VI7hpmn040YCnwUaPZ235/i0iafUs2IgsoLHfo9MoSgcf
	H+QioXvpfjNXB2I7w9dLVA/N5t2PLVa0j+QC0P+rK5Ne6/g4OmFeWEb7ajuJG4mXR+0haIlr7PG
	J1nKhWngDyWKOhrMidKOv/xkFoEJwV44xHo08XFflncISKbTdDlfyJ9HTF0vSNy1+chmmT4hEAG
	6as9tRS9u/WwhBSjonDyH8vxDPCYv6O9ylbf00=
X-Received: by 2002:a05:6512:31d0:b0:5b5:e092:c3ee with SMTP id 2adb3069b0e04-5b5fa595f40mr922875e87.1.1788166258698;
        Mon, 31 Aug 2026 01:50:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a1cb7dsm1992003e87.78.2026.08.31.01.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:50:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 08:50:56 +0000
Subject: [PATCH] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
X-B4-Tracking: v=1; b=H4sIAG9AlWoC/x3MQQqAIBBA0avErBPUsKSrRETZWEOpoRFBdPek5
 Vv8/0DCSJigLR6IeFGi4DNEWYBZR78gozkbJJc115VgJjgX/GD2bXCnFk3FuEKprJFqUgJyd0S
 0dP/Prn/fD+cuZUBjAAAA
X-Change-ID: 20260831-common_clk_mt8173-05e25fc25b51
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_015101_508844_2BB465C1 
X-CRM114-Status: GOOD (  12.37  )
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

PM_GENERIC_DOMAINS_OF depends on OF, by adding a select to it without
adding a depend on OF, the following warning is triggered:

WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
  Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
  Selected by [y]:
  - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]

This patch explicitly adds a dependency on OF to solve this issue.

Cc: stable@vger.kernel.org
Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index b059d44577f1..ba1ca9c90dbf 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -541,6 +541,7 @@ config COMMON_CLK_MT8173_MFGTOP
 	tristate "Clock and power driver for MediaTek MT8173 mfgtop"
 	depends on COMMON_CLK_MT8173
 	depends on PM
+	depends on OF
 	default COMMON_CLK_MT8173
 	select PM_GENERIC_DOMAINS
 	select PM_GENERIC_DOMAINS_OF

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-common_clk_mt8173-05e25fc25b51

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


