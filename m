Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F61C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 20:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2MYePhYaic04LK/IFxupvhQuV/aMa/oQq96pCyH2OyI=; b=pT62AFYZzDHgXQZrjZqFGfub4O
	DSuqpRP5HYQ5bnkjspEWg5skKqQsA0CIxbxjU9rZk45/f7VBYx/88IIWxFQYN37h3Bg5JS/VeZZSh
	crpxfFtdufvaPxJ0tPHExSOYqshCHsbAdNMMZ5yvpSHmbrBoi2/BAwdNu8nYKpNOlWHzYLUjYpk2h
	j88NnOQnEINsHZRFVAdFAUHYzceNanOs1QMvAGkZJtKfZfMIrL5EE7oZxhdFq8fzrOdvv9YpxDrOU
	Zz6qSveV3HFrhb3pn2DBqiDzDfjPwVSZkZNxxCVh8e726kQe0Z/CRSLh5IdCy4FrOeXUNo/Re1Pbs
	D5aDNsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpAhm-00000008wcv-0ntM;
	Wed, 29 Jul 2026 20:16:42 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpAhk-00000008wcZ-09OS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 20:16:41 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso66321a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 13:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785356199; x=1785960999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2MYePhYaic04LK/IFxupvhQuV/aMa/oQq96pCyH2OyI=;
        b=geJ34kBM3OexIWcIpHJQ8Plt6AKW5GMn8KqOicZuVwWzRcWQysh5L64nbSSigB+vdj
         cNF7fL9oGBl6SXYfjMMDQKKkI0AhaqPusGA8HodzspGrfStWxV6yoszmNgtNxBugGDEM
         omp8Bq8FuQ5nneMuKX3u54Bs6BMjK3lq+bvOyi3AZ7qxj6YfDi6OtRicG/vZpCMskFRJ
         FvTOBIMDsETWlBlIYhw9H2GHX2pzGGe8QQNxOUVoO/Sz/nliZ7mQc9CWdDyu700wPMBD
         fVctsfVI11PlnxiG6vxhcQ46CczB/tZfASvq97AoH3PHLcrc71ZdTX8E5YEvTj78qT4i
         zR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785356199; x=1785960999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MYePhYaic04LK/IFxupvhQuV/aMa/oQq96pCyH2OyI=;
        b=pDlhRM9jLxxuaciMji7WxSFStqvuhqSc1q+URx0ZBI/NbUjSsmSMhKZdTHzW2qnPiV
         bseWJgnoiZmOpljDJYQIDWFyv3AVrQhhmtZfEMndaZFbDHBWgSDMXAuhjz6TG2LRqU3H
         Tl45jX/EA6Ndt1dsIgYT+l67vLKrlGNjNu4NfeFy6IL5A+LZNU8LR3Pm6uBK6TnpFgwq
         TQHD0pR4Iksj4mEAWnJVUx6V3PyTjzQpG59pbreng1XPk3WMZOcIBPJWzsHU2PWhWd73
         K6XxOj4XUvoYX7w08fm3qYKbUP6RxNHhQwIE01cxtuaQllX8LgzqOUEXM7pBvHpEMNxy
         TgHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIPevRyCVKaHTz+qQ0c6mzsas/TMlnoDzAwfXeEstkoM0IEKR0M+bhHiqkm6VFS8jOAXwVqBgWqQtRXJ/zrZOC@lists.infradead.org
X-Gm-Message-State: AOJu0YyHCcycma3Z8YzQTvN43G3enOj+OJCdEhEJO2+ZA0h/ooWxZlcp
	vxnnk9twkiqWNZaxkF99quGo49WwcNUQQW8S/Qi7YLAHqsI4nX1iXpRb
X-Gm-Gg: AR+sD121zkvcbM6HbQYM/qZy38K5AQQZX7VQf7NF7NhZq513vYn7k8wxc6BARqJiFZJ
	IyMnyCt8Zx7M0+rPl0Vw1v5h/vQt88IHqQcf4xne8QSdaEFiNQZCrCG1BXkEN8it3saqN44ozkc
	q4k9pLV0TMfTYqAmA1VF7/PsNNh+X3Zr/wIfZihjhrvqDyzBTLyAjlGg+XcK419FARur++OJsE0
	ndkj6PA8e8F29Cl/ZgUnQ2rGsP9pgULKgytefqUjEvKarJQ65O52NBmanASEawn/syfKocBmpEK
	jNy/ERoldmLSjjdOwHoVLCQROaQXAoQTOxb3nFZ/rHdj0Nfup7RLe59qs/gFhkLw22/eIW6V03c
	GVB9/ajOvHcrK8IRbIhNLwVSUF7gfNaznjnBieUm+7SGIiYlpJ3m8GUa0mPBLRJ0al5/GxV7bl2
	Jk9eI0w1II2mEHQydvL7pfTLb/aAJHfOfaydEhyQdeJFTQsUuPKvYwwtzuwRolicEqpagjwvsQe
	Z0KYpkVUW2dhm1hFqVuCuef49lir5t4cVopeECQ2zgK15MV
X-Received: by 2002:a05:6a20:cf8e:b0:3c0:b598:4983 with SMTP id adf61e73a8af0-3c8e488dcaemr4000831637.30.1785356199066;
        Wed, 29 Jul 2026 13:16:39 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:60b4:a913:91a7:b883:6046])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b12cdasm14493903eec.1.2026.07.29.13.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 13:16:38 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] irqchip: imx-irqsteer: Call pm_runtime_disable() on remove
Date: Wed, 29 Jul 2026 17:16:34 -0300
Message-ID: <20260729201634.490317-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_131640_254132_83CFD1F2 
X-CRM114-Status: GOOD (  11.13  )
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

imx_irqsteer_probe() enables runtime PM, but imx_irqsteer_remove()
does not disable it.

Consequently, runtime PM remains enabled after unbinding the device,
and rebinding it triggers:

Unbalanced pm_runtime_enable!

Disable runtime PM when removing the device.

Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 87b07f517be3..a695ba31db9a 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -276,6 +276,8 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 	struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
 	int i;
 
+	pm_runtime_disable(&pdev->dev);
+
 	for (i = 0; i < irqsteer_data->irq_count; i++) {
 		if (!irqsteer_data->irq[i])
 			break;
-- 
2.43.0


