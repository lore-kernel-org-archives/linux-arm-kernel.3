Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A454C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 08:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOfUy+CQo+u3Sm5zMP7PbJnZMmWfXxmWUpfU0u6aASk=; b=qLLaBh3/IP93mSaRcL6Hwj/jg1
	2GWb6jjRLFtlJweOQ25FcZYv1ZxS3V20uux7nMZxEfczYT/nV1DPzzUkG4WyUlyFTxgmz5OX0g1gj
	M/m2j9DRgMUQwl6HX54ieCa+zaC3ocF72Z4FyC6oJ+NIWktYwnP58/CCDXnA8viatcJTEu8ZOf5za
	JU1ND2zcBZ9KnHKJfc2Cf7w41UngfLjc8X0Pf385jY9GJc35yfTSJ6vT+Urz/dAgFGo2PZwTQKzZK
	8mV7sxd0gi2iwbek8GFA7e3yjGTkq0ksoac0iugE+JIQ6ou7SlK907gDf1H2FXQ7PcUVoTVGeBbRA
	0snrogcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljpV-00000006Frg-3wPA;
	Mon, 20 Jul 2026 08:58:29 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljpR-00000006FqF-114a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 08:58:26 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8487088510aso9952769b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 01:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784537904; x=1785142704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cOfUy+CQo+u3Sm5zMP7PbJnZMmWfXxmWUpfU0u6aASk=;
        b=rIRRfAjmvXwTpzzvbVEC8/NyfIH0x8mlXEa15R1T331bbvBaeLHN5i/8S5v7j00J4s
         nd3ykslIwRhuidIbf+zHjTbyezrf/ftt7cXjzB/wEuSLbeC9B6BhPPaIBP+Ips/i2Lqg
         qf+DsnOA4ZTraqMBuMMp6CupEKDYoC2nYsCHOK5jowi7m7ZiTK5THcdj6PlJ0fOuaKlS
         tQPTJ2+jJJetSWjee/0Hs6L0RHiIi+t5aYZ67Uh94aXc0L03HbJfKh49Vo8jSSadJ/pY
         P8lFOyJ9IlIAbYErKkwVWFjYfgYq4foF3xBgqre2CTDpg7BxCsRUqgGryHU2zVsH1tbo
         7zNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537904; x=1785142704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cOfUy+CQo+u3Sm5zMP7PbJnZMmWfXxmWUpfU0u6aASk=;
        b=cpH21p6tRqAPlyw1CBJUx1q9N4HidwfBsvQhRVCpWz1S2Y5uPi8N3TkBUoXCprJNvI
         gi4sPxpBZD2TIwuIo/xBFf1szkcDj5PoOtK9+TZIuhozV7OqxAz7enQSm55VAt6mQfWD
         sXF+XNyQGZ89XG1jrWH2eofMs5E77JCNdHJ5CY6pzohVOHL8yyUBgHJz0Bt7lghly8Ll
         xz9b2n9z2kCnVrjwvTl4vumfhgY0FXeEl5+b1/cKxsN45ox7R96qAoOykTZUcyqRFTVL
         NK2x0x45NQtlsXzdEMqSr02qv5Z0vbgEoL+trY9E6rZnhFcxni+10B/sH6aZzQu9aR5Z
         x1bQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvtH3l+lov+0BhdpOa6Bzt8G9p57a7dAv9VOpDYzsmZoPCKktJKb/O65JwsFi//ZRWkjxu1Bq/9So365j0c5s2@lists.infradead.org
X-Gm-Message-State: AOJu0YzrZXzOWJFg5VwqJvoV+pBaeD4sAbiHve4/as6dr6K2JKVxuheE
	49vEphidQ+oRqCI/8jqb22Vm1oMTod3tXe6JBw87PZkMl3snMgqIN+Yv
X-Gm-Gg: AfdE7cm1yV7PmAnOez3KUd0Xd+nOcMO1GNo/61wj8dmdBkxV83GhCeq3BKypS4uMTs8
	KmtpEVNzYsgAorhMq1LMn8GE2RzCh1LEhTafe/Pf6ga6wJA+RJRaf+gsEQvjgXB1fXWn2LVGhLD
	/ObD0+roubU+FOXNTVau/XwJ2LrO09dE/4RxWzRkEARLq/nu67zAkp0y+eEIcLlNemQZ7gGspRB
	Qmzx125Qfz9X+M63jAXXqSv6kV49+tKOo8rol8B0nKmgg1OQYv2nektY9dbGBOLqkQ3VCQ5u8jz
	9Ut8dMR1oXN2naMUg5VloWCk7yynEqe4mVkyANJiriEDWUb+w8ay9sExue6cCw8R8cNLny7dU58
	1ivnIDhY3I0nudHeiuuEqPDX+vO73edLvK7RSRxdAtA7jNY8CIgn+dzPWajC425l5QOk=
X-Received: by 2002:a05:6a00:1888:b0:845:e740:8ba6 with SMTP id d2e1a72fcca58-84c294d43e9mr13050873b3a.43.1784537904420;
        Mon, 20 Jul 2026 01:58:24 -0700 (PDT)
Received: from lgs.. ([118.193.39.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc78asm5247901b3a.23.2026.07.20.01.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:58:23 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fei Shao <fshao@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Eizan Miyamoto <eizan@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/3] media: mediatek: vpu: add watchdog handler unregister helper
Date: Mon, 20 Jul 2026 16:57:54 +0800
Message-ID: <20260720085756.465667-2-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720085756.465667-1-lgs201920130244@gmail.com>
References: <20260720085756.465667-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_015825_314247_D6F0830E 
X-CRM114-Status: GOOD (  12.75  )
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

VPU clients register watchdog reset handlers with private data owned by
the client device. The VPU driver currently provides no way to clear a
handler when client initialization fails or when the client device is
removed.

Add vpu_wdt_unreg_handler() to clear the reset callback and its private
data while holding the VPU mutex. This allows clients to remove stale
watchdog entries before releasing their device references.

Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 14 ++++++++++++++
 drivers/media/platform/mediatek/vpu/mtk_vpu.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..a2b937095248 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -437,6 +437,20 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(vpu_wdt_reg_handler);
 
+void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
+{
+	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
+
+	if (!vpu || id >= VPU_RST_MAX)
+		return;
+
+	mutex_lock(&vpu->vpu_mutex);
+	vpu->wdt.handler[id].reset_func = NULL;
+	vpu->wdt.handler[id].priv = NULL;
+	mutex_unlock(&vpu->vpu_mutex);
+}
+EXPORT_SYMBOL_GPL(vpu_wdt_unreg_handler);
+
 unsigned int vpu_get_vdec_hw_capa(struct platform_device *pdev)
 {
 	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
index 3951547e9ec5..2ccb481a04cf 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
@@ -141,6 +141,8 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
 			void vpu_wdt_reset_func(void *priv),
 			void *priv, enum rst_id id);
 
+void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id);
+
 /**
  * vpu_get_vdec_hw_capa - get video decoder hardware capability
  *
-- 
2.43.0


