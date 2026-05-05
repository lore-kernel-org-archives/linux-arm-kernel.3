Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6D8CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 21:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJBvhYuyv/JdwansPLGJPjqYXoVeTZUEnpdVBNEj1Pw=; b=tiY5ey3q1l5TLBCuCAE720PhB3
	Kyv/xslqOdFupWIzXSBKZzmHkQZmAlwkcS4pwsC5D2HJvI5OnEBok9NFeCoRjeS/+DW3/pjuZkWOR
	t+6piUplgZ9BcfCeCtzYfvPX0VAP/xrjByclwvIPRPo0dBT1aSYd/TrdQiG1JrsUuygiMRgZ5lwgO
	oRBtK3PLmvurnoFsLH90RUrfdI4FIfsk+hdQ36X7RqL+iGGXtlk3lZ0Ue3DfSY/Emh5awEkqmW6Ev
	Kg1YvYAbgTOK69dtwydkXtxgCoe/xTF3S5npJ7GrsIxIRNU18FIGBlZ4LiHThhL5nuMC1hWHhGKUa
	btUoZ8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNbC-0000000HZSA-2cnE;
	Tue, 05 May 2026 21:46:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNb9-0000000HZNt-0Z1K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 21:46:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so36488495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 14:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017593; x=1778622393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJBvhYuyv/JdwansPLGJPjqYXoVeTZUEnpdVBNEj1Pw=;
        b=VW3LpwDBCQ/m8JMcOLhIPj5pBodt+Fnp9dDMI3hg+ykCbMwW/WTb2y/5hviHHle80v
         jm8JQk4L917kvZYYHFWqUs+g0+TPrmHlhCVSuPP+AjeU3zp/b7SHQMqISRS00XWRU3Mi
         DWT/rwGxLST+RhMfczZg3wqf95kGS42Mljk99a/gP68CUTsrjqPWiXZ/Nf9aRkKHCJ0v
         O5hGqNbgOHQ+IjDpnEUKSUDJQ3MjpElVB59U/5ZNSQoikaV9CX2l76N5r/ij+JTgabl3
         cVkp/cYVlXMuuvhJoWyyXDa0RX0x4lK+SnAVYE9iCc81pxZjcZM0AzeRpjjLz9q7q1Om
         znKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017593; x=1778622393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IJBvhYuyv/JdwansPLGJPjqYXoVeTZUEnpdVBNEj1Pw=;
        b=impoffJp3BoZBkoX25LWIEo0FuY9ujQ3zMSTHDh/7nZ8TW0BdXqE/yijmYCtJNJzqG
         pAl8hX0SwnEhtzXF0BAi8u3Qf2zIeyU15txrf/1Dqzw+HjQ0X3gyJgj54fkzOBlTZ5iO
         1jqase6EFS9K2HBOCOz1kLVn8wu3+raODkq4Oiu0oI5qM+L4BWGenleBJfJRwXUVmyQJ
         NyLLG5DdRYC5D0/IeYBCMduXi+L84Pkdf5BDBzPJvOm+ae2vry+YxL88Pqy9hBybdNjU
         l+Q8U5e03l2Qu8cLkR7bm9++X+wutN8YbOICn9LKm1gkzJyKTGfsqE/U6u+VUmk/2HFg
         oSxw==
X-Forwarded-Encrypted: i=1; AFNElJ8QF1UoBJ2s/WuokHP7SowsUIRT7BkR10BaB2wX8ixmjqEzATf8v+kK6hNz+kFgElG+DX/aaG0KKxv6zZAW1wt5@lists.infradead.org
X-Gm-Message-State: AOJu0YxtzWO2gzT8lCuswWCN2Z91iQNPYvNVYrgzIiW1bBqM9q/ZcYJc
	Mmxfys0eGtlJtiMqgGPjUI2HiIJTtCoBFki0WeG8xrRTz8RiYGi7LfHI
X-Gm-Gg: AeBDietrXOk7K8sVWff0HOhLrBHdSCLC4Hpktemb0Cbwg2noWQZ+o8oJO+Lo6IX4aS0
	EVSYc1+XUpVGhA/zsFiswm/MWlAA2wFyqgNlJNZ0tiBsQyGDw5tCc3RQ7TlpekiLyZM4oRSJl7Z
	CvituSd2fYWvQx2eQ8sQINYIK+IeQYPPN6gwgqRYYdLI3djQYb2K0uhnf7fEEndDRsLfa6ahdaZ
	p/+QYo2vUY7XPGi86vYcqsRff+jlNO/+QJ15kgvAcNzL5azzSBP9XsxT91rlBILhUoSOuxoKSqm
	d74/2thq5YDmMR1XRL3ewOLBRfRlBHqeaMwT1AKB09q0/nuaBH/dpfaGYwlSMsXGsLbSk/vrx8E
	G2XF5LvI1j2EdzzBb/kn0Rm2M+47wzQMIVinTVGmnyrvhv4Myh2Q39tPHpK0k2yw+3lziei7xjD
	hzuHs/xxDBx6zL78xFo0CNrigTBhYyLw==
X-Received: by 2002:a05:600c:45c6:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-48e521e6090mr12630715e9.14.1778017593036;
        Tue, 05 May 2026 14:46:33 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a824f9f0dsm411556165e9.15.2026.05.05.14.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:32 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/2] drm/mediatek: dsi: Add compatible for mt8167-dsi
Date: Tue,  5 May 2026 22:45:00 +0100
Message-ID: <20260505214541.333657-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505214541.333657-1-l.scorcia@gmail.com>
References: <20260505214541.333657-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_144635_193494_2F6BE841 
X-CRM114-Status: GOOD (  14.21  )
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

The mt8167 DSI controller is fully compatible with the one found in
mt2701. Unfortunately the device tree has a dedicated compatible for
mt8167 since 2022 and it cannot be changed with a fallback nor removed at
this point. The only way to get the device to work is to add the
compatible to the driver.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5aa71fcdcfab..167e33fef025 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1305,6 +1305,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 
 static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt2701-dsi", .data = &mt2701_dsi_driver_data },
+	{ .compatible = "mediatek,mt8167-dsi", .data = &mt2701_dsi_driver_data },
 	{ .compatible = "mediatek,mt8173-dsi", .data = &mt8173_dsi_driver_data },
 	{ .compatible = "mediatek,mt8183-dsi", .data = &mt8183_dsi_driver_data },
 	{ .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
-- 
2.43.0


