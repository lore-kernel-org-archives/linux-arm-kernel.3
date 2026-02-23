Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA09FEC1105
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 16:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsX5I8ekieUXCqSFWWV9OWjKFqWSLur0ZuBiwFVR/2E=; b=yA8Xryzf1KSau5DsFwBBSySssR
	xC4gKK/wmhcIQvyuqw8eCUU/2XOtuaJ10jxLp5jTjYdoFgu6JYtK3s0bfdi5A3EQxcPIRmwgHz+g7
	7XcUlThuH+/E6Rkk6cKuozLTn/5HHWaFO4rSVStM/7VLxnGOzRzxi+vuHiKVYmpzYY0caNktk73FK
	d8TLutjZsUgeIlYkhjaQlQwBhtihQ5SKMNBgjXARd0SArcxlXNTaTKTAECJC12U8QG8VyXqcjNxxf
	c7xRLRxdKGJTTLoKiQbf2NxIM3mLwpX1iajvkOFOixEzuG7v4sj5Z1kPJWZ/5ELHdrbkP8m3vJUO7
	tpgLMowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYlu-00000000g3a-0pgE;
	Mon, 23 Feb 2026 16:26:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYlm-00000000fuU-2OSI
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Feb 2026 16:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GsX5I8ekieUXCqSFWWV9OWjKFqWSLur0ZuBiwFVR/2E=; b=nP4IMWcchX4HeUMyfgz/CoXXbm
	ZL7vFSLCa09weF/hW6RxCouDullmBx+QvxY8pT50gFBAieSd17pSphWlI6AKUVZJ9UZ5LDQHojpK+
	HYkX5LYmn8z6M+hoD2TqhxcutVx1DGQVSXgrbKLgPzyWwwekKn/mjCSdIw/W1ISBDpz7rSbCoZFYU
	dK1cDXOUG6gMFH2JzXkSU+baVIsrpeQVAtpl202fNMEOW7n2udZLFFzp3RT+jpG7f8HR08m4JpRvM
	lFfvk8Ke+R1SlSeN5pAfN2ykUGMjHt2KiOrxWNLB0yxdRWCVnRvnEQAnSr7OPK3sQZOASTgkePp90
	jTF/DQNw==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYlj-00000005TBg-22vq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 16:26:49 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4358fb60802so3329147f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 08:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771864005; x=1772468805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsX5I8ekieUXCqSFWWV9OWjKFqWSLur0ZuBiwFVR/2E=;
        b=jzJW0dZQtBnnOvqGWM7pM6b4kzMOdHbpK+FGaGgvk0KuiL/vk5nHWXc0tf+BJIFE2V
         8FiyFA1vpXJo7cS8C/DbCosKaM5tli1YNUwd3YMzKqjk4m3unqM3uXp4oT25Dtw6aUt7
         9NdynY7bfCsp0zKIUz6LtmWesqAiWT1HHhNkhviMqBUUkHTIAmf4aJhmYZsjuYm73WcH
         qo2A6+wYTGoRy2HGjuSAnSqPfskcNGTY5Uhwtxrbs+1UP4nk0lA0Hu922QT9EEmGs96R
         QAVF33gRNVh77s6A36r/Sh9UBjUMJ4MVA7V86M/AJLtCD78esOsPgLbR5juNmkfMyQHl
         ETTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864005; x=1772468805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GsX5I8ekieUXCqSFWWV9OWjKFqWSLur0ZuBiwFVR/2E=;
        b=fGvh/xJrmVsMsKdsmvnh4IbzbIOlEqQ1h5JLA+mIBzzWhKSHvuVg8gzDq4erMJZij9
         oGqFPIGEWnXdE4TXbvEXEErPFe6BRKJa4VKX9vcOAHrr+mSw7E57mMRXJXf8Tj9kZh3n
         lA3VS1L31VfuHOtPDrF5sW2XnP7Qz6aFmUpq59gmtFEwf9oXzkB+jHRlOvL8I3OUZ8Uo
         QuA5wfXH6dVluTe1WlZITf3Dh+XHcDgd9AAnT6OjXMNz6J3uot0Uj7qO+PXdeV9toFHI
         hIpyGUkJGD7VxQShJM6HqXMAL1zgJyjRBjG4+e3s0zy99/+oVZsbk4E6XOCanXpU6UTv
         mpiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL/v4LWqyYOlC6WiEKfy+DKAN8NszdbfKJ39XopkIgqjMvLn53Bk+NRL1niAfKqVHiUSJe9H2awBYD/WBQ64JJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+Dsh/td4mnjG5qI0e8Afx9IJOt2NiUTdK86P0pHLF5BJ07pHb
	ppMwUzniXFkW+1ojJXBOMZYqqLU2KvAJn4dDO7sD1i0G2lK/doLyZH4y
X-Gm-Gg: ATEYQzyUH3o7T/VLRBnhmJCpsGCOVjKahk7CHdEt9AoirnWjYyMRMIMjFuZ0VTx3ZiY
	03+1C2ujkkjGUJYxBUsiK9Rywwl9DjMmf3c+3U9KQpv5xEcOcBcQn5STBIe2/UQYfCTym//Nz3i
	fZEo+rPezJUn2bzCjSczNURyF0qN0n4KsP8QtA7B//EefZYWlEkRD3JYVsHOWLdrlFQtG5ItGxK
	OLkvz3k5F/smTTe0Z8tk+Z87yfJ7Op5LIfU7N0ApzjzQQW/U79tRRYsGmO6KOPZcZuVicPGp3rF
	Or2h8XJHiH8yXp5+Y2YKiqX4kn4IFeRuH0/gEYups3ut805LCa9w/HPIrcjQX1h+FybBuAjipVV
	82RdTHh3Kt3TDMit4XyhkBaCd2Yxqvsbx409WMgaUbTnrQYGfNb157TWgmixyapqnfkmiFG7jDC
	iyrTZwB7+asglZHhgAr10=
X-Received: by 2002:a5d:5886:0:b0:435:92c6:d556 with SMTP id ffacd0b85a97d-4396ffc46bfmr17665504f8f.16.1771864005236;
        Mon, 23 Feb 2026 08:26:45 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d5463dsm19120357f8f.34.2026.02.23.08.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 08:26:44 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3 5/6] drm/mediatek: dsi: Add compatible for mt8167-dsi
Date: Mon, 23 Feb 2026 16:22:49 +0000
Message-ID: <2fbf179c03c61f527e2583f9df4f97f6aaf3297a.1771863641.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771863641.git.l.scorcia@gmail.com>
References: <cover.1771863641.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_162647_700398_DBBA072E 
X-CRM114-Status: GOOD (  11.50  )
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
mt2701. Device tree documentation is already present upstream.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index af4871de9e4c..ad10e86b161d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1301,6 +1301,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 
 static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt2701-dsi", .data = &mt2701_dsi_driver_data },
+	{ .compatible = "mediatek,mt8167-dsi", .data = &mt2701_dsi_driver_data },
 	{ .compatible = "mediatek,mt8173-dsi", .data = &mt8173_dsi_driver_data },
 	{ .compatible = "mediatek,mt8183-dsi", .data = &mt8183_dsi_driver_data },
 	{ .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
-- 
2.43.0


