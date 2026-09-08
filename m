Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D533C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 18:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LV0nGy7Prgird+t9YLnwanXWuEc7A0E5cLswUODru1c=; b=GRL/lPtrWGHVkyZj9vE5jrZJ88
	eln8CLnddXYsT5mQrZmVmcUQ8ejQ07vhmUh8cu+oYiWdEmcxqcvcE9LmDh7b+BbnAgr809GfLaWSw
	gAa8I3X9JlLmmTkOFwH+sQEUbJe4B3rlbE9G8pv26VftQwCgAo1kMYJpLHSmx/jRciCWa1B4s64/2
	9HtTJ6v3HFc71wxdyrCQl7md2EWT6rNbTDqTkf2YEhF8Tp4VMIzhvO0w2RG8ybKMtmEZoeOTOdHZr
	l12/rTEpkUhkDzlVcN97Fqs3uWvt8nfalzpqbLWmj6rvU5dPE8i9asLynp2+bhBrWlVCj75BhBUhn
	MVeAbu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zsH-00000009sEe-3wyN;
	Tue, 08 Sep 2026 17:44:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zs6-00000009rzf-1tVL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso47686145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889476; x=1789494276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LV0nGy7Prgird+t9YLnwanXWuEc7A0E5cLswUODru1c=;
        b=DV5DZKRKwSOH1BvraVuBcH6Q7iv+9KD7iAKrkXGJ0od8yBMQBTpDSFElZe3ut5yMK4
         cjY5f/qQDEnIvHLl/CTJoON+mp591fIOWlzYLV15If3SXJP2iFMmCRWICePFladHdTym
         Eq40XngbWpxcETwrDAmqpB9fzA3zLLqTceFyYFnfElAs9lDhevTgDeKC+Kt6vfTgyVNe
         5aAZfN3hXOHBu3Shn/R8vy5uP5IQBA994u2M+GblFR+imfN//khv/e3oB7JJpUV4dq+k
         YlO5Bda0MqdYgQzKTEcxObLpD0fQbCt7Kdk02vdV61v59bnehD6ZL8vIFCwV+M296PUt
         W+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889476; x=1789494276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LV0nGy7Prgird+t9YLnwanXWuEc7A0E5cLswUODru1c=;
        b=SmfX0+/0jT7R81Pj2qCWRoPx5XpswqylBQq31JuVONxiJbJgQGyOB9fNLAtcfBJFaT
         8Pc8q+vVq2ODTWf9md1kx5WhLC4rtlaBnmj5lWNpVyyZnUUplJ4QvQ7ciAEsaOsmwO+S
         1gvipdv2/PqWVXFDfJBsP5hnwyupcpm/Eb6WTHJ17FLbC3JgCI61ys7XOGrShNU5mb38
         sLlub8zzSJkwC9xDyIyfzGGLPCRKrdvWVBHEM+58I1NtoUJvZB4nNs6yv12BNmtaFq15
         K3NF/TsQ9NLP2wKzVKh7SNvZuKS1kEIdRp8CnZanIEalmBULNxU2n9AQ8L8aw6jWfeOw
         uTQA==
X-Forwarded-Encrypted: i=1; AKwUvBy3tsKxquS1ZSG2AnQaxKv9NRkRWciGLlu/w6eVe4Iao/OTL5BfmsKtr9g0PY5j7aOc4WoXhzpKZ5ORhFo2bZ9M@lists.infradead.org
X-Gm-Message-State: AFuF++lk+a4hRrpqxucFy4lpnopzdAU3DrWke3h1Dl553DAI+twug2IW
	pnE1jlpZnjqM+x1Do5ZpXZq94QdhiJ/ShNW0JhQPzp8IgflC1z+lLlNl
X-Gm-Gg: AYBFou3VXfs/V65mGnmecMBbU+CB20VsEcegDi7Txy73qMba35fF249Su9JR7yw/kbZ
	yETrJ1LDKddc2usyrEuya6IHqWnxlP0tFRQ+CZ8E5FL7xYpsy0eSRbIjG/ijFc+QtVWcHXJZoqx
	7WxClsW31/MosxBf+NObu0VdGmixonSaclY9jpHqWA9zU8Np0Q1ndEk5pkt8QpubMrWUy742qj/
	9Npy2rDI5xgPSP0h3ucjlkVxpMoGcRpb/vcflhxW3zEdRs5YrySUhO6UXQWRj4RqcUP2xI92Fws
	KYIDLyL0Z2Z2iyxYUF4eJt8ebqjVBizjNuflSBK8DySYWrxyRMt9JU+x26ifNk84lGcySpURBYn
	0tjA7KEliE8qwbiiOhmKnvm9UI7VBophbSx+M0uQPZN+DwABBOk+ek12NAG8cGXwbbpl5oCx/Kt
	1G30+1EsSqCF9TicF4/DRXcnoUeuKoKvy6dRAeEQix4Rq4Ap6XlffW2+2q
X-Received: by 2002:a05:600c:190b:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-49cfa20cd63mr290493175e9.20.1788889476492;
        Tue, 08 Sep 2026 10:44:36 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:36 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 6/8] dt-bindings: reset: Add mmsys reset ids for mt8167
Date: Tue,  8 Sep 2026 19:38:33 +0200
Message-ID: <20260908174259.9009-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104438_947942_9489F23C 
X-CRM114-Status: GOOD (  13.77  )
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

According to the SoC data sheet mt8167 has 28 mmsys resets. Add the IDs
that can be used in device trees to identify subsystem resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dt-bindings/reset/mediatek,mt8167-mmsys.h | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-mmsys.h

diff --git a/include/dt-bindings/reset/mediatek,mt8167-mmsys.h b/include/dt-bindings/reset/mediatek,mt8167-mmsys.h
new file mode 100644
index 000000000000..b21f67b3b55c
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8167-mmsys.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_
+#define _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_
+
+/* MMSYS reset IDs */
+#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
+#define MT8167_MMSYS_SW0_RST_B_SMI_LARB0	1
+#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
+#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
+#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
+#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
+#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
+#define MT8167_MMSYS_SW0_RST_B_FAKE_ENG		9
+#define MT8167_MMSYS_SW0_RST_B_MUTEX		10
+#define MT8167_MMSYS_SW0_RST_B_DISP_OVL0	11
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA0	12
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA1	13
+#define MT8167_MMSYS_SW0_RST_B_DISP_WDMA0	14
+#define MT8167_MMSYS_SW0_RST_B_DISP_COLOR	15
+#define MT8167_MMSYS_SW0_RST_B_DISP_CCORR	16
+#define MT8167_MMSYS_SW0_RST_B_DISP_AAL		17
+#define MT8167_MMSYS_SW0_RST_B_DISP_GAMMA	18
+#define MT8167_MMSYS_SW0_RST_B_DISP_DITHER	19
+#define MT8167_MMSYS_SW0_RST_B_DISP_UFOE	20
+#define MT8167_MMSYS_SW0_RST_B_DISP_PWM		21
+#define MT8167_MMSYS_SW0_RST_B_DSI0		22
+#define MT8167_MMSYS_SW0_RST_B_DPI0		23
+#define MT8167_MMSYS_SW0_RST_B_MIPI_TX_CONFIG	24
+#define MT8167_MMSYS_SW1_RST_B_LVDS_ENCODER	25
+#define MT8167_MMSYS_SW1_RST_B_DPI1		26
+#define MT8167_MMSYS_SW1_RST_B_HDMI		27
+
+#endif  /* _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_ */
-- 
2.43.0


