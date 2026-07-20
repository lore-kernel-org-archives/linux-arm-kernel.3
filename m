Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A64AC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUKJxr+1tIy/FI363caVVmoJTRInNyqm1ZI8xlDvLAU=; b=LrGub4ExV0ZHu0RGefHJmulcKt
	m2FArrA2N19oD5ZRemrli39WtDExOPdBpEzaHtY/JQBLo59DuZKbgDNs5Wp32D/6fFcBvfDIBEEzc
	4kVOCJ8dtW4sPblOFHDiHNZy2YNw8+YqkGdT/OkkC4omlKswZzKk5qkGyYpuyJOJe3pNlyrYQ/Rta
	s1hgOOlAGMPv5sKGdA7dNxs82bdS98hpnXkAEBmHEHqLpGoJ7l5mB/c5GP1G8KoeNL3Lbgi+Ku8n5
	qmwwf94Wye8VNKaH2IkBG4HKB+3LMCOgC1nai33KgSJHRXo1wmwk5v6jZmAGxh3dJBKce516Ytuv0
	9JDlt0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljpl-00000006G0R-1Dx0;
	Mon, 20 Jul 2026 08:58:45 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljpj-00000006FyR-0VRa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 08:58:44 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso6264892b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 01:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784537922; x=1785142722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RUKJxr+1tIy/FI363caVVmoJTRInNyqm1ZI8xlDvLAU=;
        b=kcgJNcX4MPEaKum8phnD3iXK7obGARykhjalw18w9ZNLDW6QN7Kh+TUkEv5hJssDB7
         6jG+Pyc9HRYsxumOlr+02Zt8QKcHbdRgCdAUC7GP6t75XUKbfBqhDFh6UaVORhJi2/nI
         3dkWJVeNtd2fmtSoAM5ts+RzVbnnNFHkki2RxhI1Jdz1nE9CmdLq7KXx4u1XdRBIJGs1
         cCo0He846Sbi2TxRG5L+x/m61Cc9/w7dhDBYFPvfoG1R/Mp9wfJ6BGNghN4UZ3YoVXuW
         DpASuHgyb5dVAKDmxrQNaJlPxXy0rqpUQ1EdMYZNwBaXUOW4NpSrnObT+KWdx3csLXU1
         e6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537922; x=1785142722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUKJxr+1tIy/FI363caVVmoJTRInNyqm1ZI8xlDvLAU=;
        b=WKfNmEruVCim5oGuaFoaMc9SVtJXiq0yHproEQij6E+lJyoAm2PfPXsYQ+cLIHXL/k
         o1l0iRIoV5OeYs9+a1aac/ncKx3Z7ExcQ25Rliml00ykLDTTZj8B5MlJBAkLd4bGIQqa
         EOZJ8QSbos7eOd84M2jOaqEpUvIFVFpuYThWefV25XJIjwex1l85pvXEvAuXErRoDvcA
         eaFeSvoAFUMuQB01zM33leqhrosHN5SlXCzIXnaqcj0YG36YPm/87dPbU4+OyoiKoRVN
         85uertq3fYgPAJQTnYy7/vX4b0moM/n8MhSOKrYDuY6NlFlWdkzh0f8TV+GBStUFYoBq
         jsTA==
X-Forwarded-Encrypted: i=1; AHgh+RpfMRNk8l23PlCu8pOCrrydrhYlVpblN6WwVrnoSjwWCj6wHA9FY/Q5xjkbjU9rInqRgkJkBDJ3s8+m0XRS6i2i@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1p5KuMNZ+oEaJh3oxeFwAEaV4d3tAPG0vOjCI9M3Kh5/ZzYE+
	71D42gkE8NQa4500HZpMVigPj82syv/dYJiIbDESYcFopld6kDHS7uG4
X-Gm-Gg: AfdE7ckLKSBnEKxyZPGvub8C9k8gHCN8g/aIAMV13jrsmdhNbFjoUAX8NjowS2QijEy
	5zQTqXVnxeNuBFbdXH06KHAYaoDeaBmdpcM5zsSGf8/QWL4gzQn5acEE5U4JRtp6zbpjrXcsqyq
	95xPyi77FsEOeXQNmSI0wsAD1HMZFwHTTs4cIfuHy7mwkDS+c/LTenutS9GicmPsPce0d5yYHrP
	JbQfL9Rfyq5Ft0kaO3sLtetNSBWHYjPeT+WWcjhqIG3QIUSshwRGAeUjXbn5DL/pAtUu/N/6GXh
	woE73/dW9REnoKXFBQ5Ux3AFQCLd+HdAaIuUVuZ4Q1FKEbQ2u/EpuOUf0VELi2SvFPo7XoJ5a5k
	tZGQGeod4m+qOreOhk7MApqI1JiVe0x0h5qUAW6jqbxkBpS8VkEH6xdzYDR1/3nAaDz4=
X-Received: by 2002:a05:6a00:14d1:b0:848:6c37:cd74 with SMTP id d2e1a72fcca58-84c29288282mr13097826b3a.22.1784537922386;
        Mon, 20 Jul 2026 01:58:42 -0700 (PDT)
Received: from lgs.. ([118.193.39.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc78asm5247901b3a.23.2026.07.20.01.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:58:41 -0700 (PDT)
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
Subject: [PATCH v2 3/3] media: mtk-mdp: unregister VPU watchdog handler
Date: Mon, 20 Jul 2026 16:57:56 +0800
Message-ID: <20260720085756.465667-4-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720085756.465667-1-lgs201920130244@gmail.com>
References: <20260720085756.465667-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_015843_187165_4E1D4965 
X-CRM114-Status: GOOD (  14.28  )
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

mtk_mdp_probe() registers the MDP reset handler with the VPU watchdog
code and passes the MDP device as the private data.

The handler is stored in the VPU device and can outlive the MDP probe or
remove path. If probe fails after the handler has been registered, or if
the MDP device is removed, the watchdog table can retain a pointer to an
MDP object that is about to be released. A later VPU watchdog reset can
then call mtk_mdp_reset_handler() with a stale pointer and dereference
freed memory while queuing the MDP watchdog work.

Unregister the watchdog handler in the probe error path and in the
remove path before dropping the VPU device reference.

Fixes: ee18fc7b0b95 ("media: mtk-mdp: handle vpu_wdt_reg_handler() errors during probe")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 8432833814f3..5ccb7aa925d9 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -221,6 +221,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	return 0;
 
 err_reg_handler:
+	vpu_wdt_unreg_handler(mdp->vpu_dev, VPU_RST_MDP);
 	platform_device_put(mdp->vpu_dev);
 
 err_vpu_get_dev:
@@ -254,6 +255,7 @@ static void mtk_mdp_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+	vpu_wdt_unreg_handler(mdp->vpu_dev, VPU_RST_MDP);
 	platform_device_put(mdp->vpu_dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
-- 
2.43.0


