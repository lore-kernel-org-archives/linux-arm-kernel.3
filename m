Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B282C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 19:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuCA5OMqgALuEAxLsCpNRECi3es/sBRCGgKqyk3kQIw=; b=s4hZNs2nxViabO1vmOHKkLb6tH
	cIt1AuijpmC6txWqqnpXz8riSRjmhAtqL6DYtbVq9L4wkHhaa5DwzFElTwciXc+bDuOfQeHf581ge
	v2XSeRAkGIIS4zAGw4048/Ie0/RvBZ2+Vv1HDhF8Vpr81Vdelww+HYGMvmmttBzGff0O6tcUZcQ5p
	a2/ZxjAMxzr8gy6T39clnwdOXoqfmUGgfV6f14VbKj42Va3UnnSXlEdlvAvDBKYkDKbpI8ya/SZ1U
	i+A6oI8aRgSaYBJO99ZnojzXNqtSVK6poRzRZ1Q14JExBlcxVQSPOi7XTxb590W1V8TEW/AZ4+wAu
	Ut5Tbltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucUDI-0000000B0UY-3iyT;
	Thu, 17 Jul 2025 19:24:16 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucU62-0000000Aywo-0Jfk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 19:16:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso846084f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752779804; x=1753384604; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VuCA5OMqgALuEAxLsCpNRECi3es/sBRCGgKqyk3kQIw=;
        b=L335qAsPnyVX81pZ9PKvhQz5x/SSCdV0FOuzkEIUMUwMR8zCzHbtORO+qmqmc+LAZV
         1Bi+4y1ABh+Ny2qSJNuRroCclAdl6DPlzq5JRwJqzwfinyO7BUS1uz3OvlUxpSFhpvth
         d+evIy3vTjo2NcQIM1giaj4ddlQOpiU8V3IXB/dsDO0PPc4xVd4nAJ46hqCBQvmvV2z0
         FXmotdNFeyK8kA+InBuRRHbsPaXjuKmps0jwWgbXOsFRkvlche7s7wfnDrxeX16u88G7
         s5gQs5faNpXncNXTol46XMvHoXoaLck7mazJysN0qQpYqpTOz4byVI1ZaCkH7fSJIQtu
         z1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752779804; x=1753384604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VuCA5OMqgALuEAxLsCpNRECi3es/sBRCGgKqyk3kQIw=;
        b=Zd2UP9gIOyGndZmtw57+P93Yg402qznzMrFtzcxwbbwWdwzOuucGATIWzBS6mKRNaN
         wJKGXQg3rlZihg6Gd2DJnZnznctmgtiXCK8XxUO5HNQ0RhzcgqmhsnmVxLzV/Pvbyjhm
         bNISfx9S1hcpC8WCu1ToZkHQa/6ZpBMTS4jHuNZNacwR+nt8DTniFwABEBHi7It6+ydl
         VGVfGjL6v8FkRn3bZg2BoKKEoMK+htlMEpU97jTx9GQQfVfF5M67igli5w8HQ7nWRjHY
         z6WAaop/0V+tMW0U7adHm6MaGwCd8upl+dPdNHqtKqEJnjJKi9UqyQLTk53Z901h5paj
         nzWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVUZQJ61wN1fos7yWlXWSNpbdGscPPO62nuT05QOpNpYfqlXxC8SXiHFIAvl2v1reNakPCL7xxPgTPTwRTwiRX@lists.infradead.org
X-Gm-Message-State: AOJu0YwfycITDIUaSJdXMYfBfNOUvR3WRtZnY/58ehQ6HRPPxS2ze7pG
	IwWB0JN4hO7t5A5xIJaNGYKkL43qoNQBZbxzlq6KL/Xwgm5A9wlMVK4A
X-Gm-Gg: ASbGncsGc5nS3iGjf43ZQpmUQYDDVsMGXWoNaOXqj8RX+AunphK2FEpqQxuS1TNF8Wn
	e9Z2VjTZc5I5L7W0X3OAzy5rucCwn9e9aC1kWmLQdis/lq/jZhZW/8pk+t2mz4xFigZD24wxq80
	zuayGJX8P1ry+z7GjloQL7IrBy4mMzZB4QjdbuN7o7KAY2T5J21j+XVddMRRYQAjRZA0TcAIWyw
	ERS2DAklSCjKO1DK8+KMf8eu7PAX5DfdC+82UQqT2cCjOjQ4Hy04qAIhI+BZsEkwU61wyv+uoNf
	Hg4KC9ZJojN0iL2ctVnq2SrlwmPaeyXooDIqB6bIvsFTXoajSmjotGIF8Y44JRoURFq/d+0qgf7
	VELzxs/N+DDXUAvzv76ysSJlqQEnyoQYc
X-Google-Smtp-Source: AGHT+IGnGahGt2U5htIhFXVjft18mH3zp4ADziGMeoajJetWxt5b3F2yGd4T5BahFpHifeth3xCKfw==
X-Received: by 2002:a05:6000:642:b0:3b6:1630:9204 with SMTP id ffacd0b85a97d-3b616309230mr2341095f8f.19.1752779804161;
        Thu, 17 Jul 2025 12:16:44 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e14d07sm21680436f8f.66.2025.07.17.12.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 12:16:43 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Thu, 17 Jul 2025 21:15:33 +0200
Subject: [PATCH 2/4] drm/sti: make use of drm_of_component_probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-sti-rework-v1-2-46d516fb1ebb@gmail.com>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
In-Reply-To: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=Ay3UjBLijGxD3y8KzxOLm+Clcmu+dKkj0LPDEulYkuo=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoeUwYtZuxKSsScyK2pzLf8SqC21JbxA2n0N390
 OV4UO/qtsmJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHlMGAAKCRDnIYpo1BLC
 tSl+D/45xwrv2JRM2TfersBnFNba4wWf/30fpVnO86yL3QTGzpnTmJ+8TEqSd7aeAnTVhtUmFfq
 YwnwcYjn8wII3X/ehq4g54mVqxtGDNgpAK0+D/vPKmY8PbATXjbnuU0VB25VRDho/Yq8r4fV+Cw
 sA2IbkZzfQMKdU3Jy8VuxXymjWmmD9DztwVI+c9C1j8Rhyu6M1BDmxTxRXNRih5NtJILNYNN302
 82ltvcFZYAbtg1l/sirhPFyqXwCZG02w8gDGifjjehLKOFAVTGr/weWs5fIeQ7sUvJiVnAm+JCW
 DsnOv18XbPzwQKQU4imRG4BNE6EnzPb1CeWGuSQYTHYpE/iUGjFQxO4WbkW07iKDft6usDu4buY
 HPTGrVuuiCjCcinCeMIVbMkuOD671Dy7R69FrO2Mvkiycqmp/2rPlxhD4G1eUOriS8qg81Lkg6B
 4a8eYX9dH5kv5boL6CbyzVIfPBQ2hHIIjXczmSqAIWSTB/x1zqRXlNqpmbQLLIrC4+BSf/8uyW5
 jq3X63ev8G8kFPfRAwzGH4KbP+DoLZtbfCPyVb1b9Dftf2GMmJSrKtxPcojKwiwGYVYimCx4mAX
 4Rpc11seryt3l+RF/kWJBHZ7DNGJBwKktL7a7GcKf1YDaOOZVqwAC2PBM6xPtELSvErm624w2bW
 tkLZ1e5Ec7B4GGg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_121646_126129_F8D00AC4 
X-CRM114-Status: GOOD (  12.81  )
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

Enhance the probing sequence by using the ports property of the
display-subsystem node.

That done, it becomes possible to handle the display-substem node
outside of the soc node within the device-tree and not have each IP
blocks as children of the display-subsystem node.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/gpu/drm/sti/sti_drv.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 42f21ab91957b38cb9aef012b6ee7f4ae1683edf..9d6a7c8fa0759c0b6fedf87169b18cff3684be46 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -231,9 +231,6 @@ static const struct component_master_ops sti_ops = {
 static int sti_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
-	struct device_node *child_np;
-	struct component_match *match = NULL;
 	int ret;
 
 	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
@@ -242,15 +239,7 @@ static int sti_platform_probe(struct platform_device *pdev)
 
 	devm_of_platform_populate(dev);
 
-	child_np = of_get_next_available_child(node, NULL);
-
-	while (child_np) {
-		drm_of_component_match_add(dev, &match, component_compare_of,
-					   child_np);
-		child_np = of_get_next_available_child(node, child_np);
-	}
-
-	return component_master_add_with_match(dev, &sti_ops, match);
+	return drm_of_component_probe(dev, component_compare_of, &sti_ops);
 }
 
 static void sti_platform_remove(struct platform_device *pdev)

-- 
2.50.1


