Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D92C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8Fc1y4+RwjniJfgwRtIk0X9ABaeOzCopsCGLc1zspc=; b=MlpkmM16t4MCp/
	hcb6FQnTz00mw9sWKGS0S40Bpl4pUu5PlJ2bM288HXj7x0HhmehSxkWI2dbEcyF8VXXzQ73ZlmXMp
	xWdorxXi3glmznNUWjVWUkSZHaf36sajpDh0kfrxDQ95xl85NcSmbSEFH88mp4jey+z2NAsq+ew5E
	GYb28bDG0nsjvZYQch4NDg9eOO2nhHT2ygNBCj5RFlZqBCAESyxKNapdt9MylLVO6mqFgXyNuKvkh
	3+K/HguS4QA4ACloynwRXlTeTv2q6z3xLgagbaSFEgipzJ5uehYADsOW1T2ak0LNO3i0rIwiiBZnS
	A59k9m0m/ODTukdyBp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVu-000000099rt-0stG;
	Mon, 13 Jul 2026 12:11:58 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVq-000000099nJ-2gwj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:11:56 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1491843a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944714; x=1784549514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8Fc1y4+RwjniJfgwRtIk0X9ABaeOzCopsCGLc1zspc=;
        b=rvNokHJ8Bz7eQ9RmUjwI8b5USuvEtLGZnHLUEPixzAt6/3GFiC+iHkshbz4T4DIahw
         yePW1F3D3vAMcW2bE+52HOgHvCBxSxOceaQ8fEX2+l7rG2ZO6DnHtGRKQaSV4aYyifHx
         0YeXxtxjQowHvsimXx5Jze4/R/2mHuIo1TOaTUtJsQ5Mla2zvNw1JfFyh5nqfwNyP2LT
         H1fBCjNNGfuPItpevk30KwzBH7tfxllRI7VRMc22Q3mPFC//e6FyCFF6dbkhXLfw1l5F
         Q6ouwCMux4+rv5FNTnrLizvQT5nBFJa2K12nKEyPMN/YquXkyCxOPsqDpAdoYqho1fdR
         CcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944714; x=1784549514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M8Fc1y4+RwjniJfgwRtIk0X9ABaeOzCopsCGLc1zspc=;
        b=fBxkHkKBnEXQmeEIWLE9sx6Yz57HA3fvnierkOcp+A2XSScHzO73VgLvcgkmasFd1Y
         AzXxx7F6555JKZNz/b9iHp2wdeP7D7ocgI95MZ6m2QXlZCB9FNqksdl3ASIeRDkP1YDV
         BsotfCRH1sSCCsjFlD+nYLCGlDMJ15HsuluqlQndx6Bx4vZG3PVmoZwDKSr6TPTi54DU
         hbCzR9WqCmx3R1qON3P2TYsHk8e2eCSXicwlSBXk76n3gxvBYiKE2LQWkPm/M/85pc4E
         PiQO82/cINlxPG1MK8SAqElxCn2C1gq4TM/LUQWToOxmpQ+BfzDfvtYJoWVi3CnrkIr3
         Vjww==
X-Forwarded-Encrypted: i=1; AHgh+RqQoRS3Yo0vj+3Q2x6wR1hQhy5UxtVY0aadtKXbU7gbvUm91BVBSVq6r2O94aQhXCGj482kEeGFOxoG3JDbBG/l@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1QNTUDdoWfLoSYPanhVzA7dwQp8h9Sma2AGks5W/5OB+qkRjE
	bUV+/gTa72PsD6sYiX2pO5Zs1WipQ6GHTmDINTziSMT1DbR7xMsyjTv1
X-Gm-Gg: AfdE7cnwqvBipDP09ANwnDXW5X4nvSV9Hx4TqudcGLHeLwvhqQ7tFqJrMIZ33VLmsm8
	vF/8ZggFQTwMz4S0XbSP+5AwmfN2J8OtUNFNagrsfOdnzIsozf9HWsFxAxpAM1BGdCd8bHLoMfN
	xl1W9jEVnH3A9AyhYy8OuAUSx3TRl7OJxxe38/sqiNIbQ90BLL8r4JrWBVFH0mr0tcybnr/uki9
	dKNAub1Mc4mTv8ZjxZS8LY79xZzfuba1XII3LBsP8xhTp70KwK0v949iVrOF7kaeX1KXidB+TDi
	7EYGRHXH60HNo8iQeq2McobzMG0eInJo3QF5pKPqjYNhCaIrj7CNcQUNS2HBRMIxuvi/BQWB0SE
	dU0d7xnefVfjLdDjRpTMu+1A2pC9o6ZK5aBvSjRADarSNEH3palUADw+Tkzb9hHYincqSYORWm6
	qXrplwEDrFBQ==
X-Received: by 2002:a17:90b:4c51:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-38dc7607589mr7644160a91.0.1783944713757;
        Mon, 13 Jul 2026 05:11:53 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:53 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v7 17/19] media: meson: canvas: Fix Use-After-Free by linking canvas provider device
Date: Mon, 13 Jul 2026 17:37:12 +0530
Message-ID: <20260713120840.17427-18-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051154_689638_F76D8EDD 
X-CRM114-Status: GOOD (  17.66  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The vdec driver retrieves a canvas instance using meson_canvas_get() and
stores the raw pointer in core->canvas. However, the helper drops the
provider device reference via put_device() right before returning. Because
no formal device relationship is established, an unbind of the canvas
provider driver triggers a Use-After-Free (UAF) bug when the video decoder
subsequently attempts to access that memory block.

Fix this lifecycle hazard by enhancing meson_canvas_get() to establish a
formal managed device link between the consumer device and the underlying
canvas platform device. Using DL_FLAG_AUTOREMOVE_CONSUMER ensures the
dependency link is automatically torn down when the consumer driver
unbinds.

Additionally, handle missing link conditions using dev_err_probe() to
clean up upstream error diagnostics, and ensure the canvas platform device
reference count is dropped safely along the uninitialized driver data
path.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260530111022.9C6D71F00893@smtp.kernel.org
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/soc/amlogic/meson-canvas.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
index 79681afea8c61..5102a491bf778 100644
--- a/drivers/soc/amlogic/meson-canvas.c
+++ b/drivers/soc/amlogic/meson-canvas.c
@@ -54,6 +54,7 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
 	struct device_node *canvas_node;
 	struct platform_device *canvas_pdev;
 	struct meson_canvas *canvas;
+	struct device_link *link;
 
 	canvas_node = of_parse_phandle(dev->of_node, "amlogic,canvas", 0);
 	if (!canvas_node)
@@ -70,9 +71,18 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
 	 * current state, this driver probe cannot return -EPROBE_DEFER
 	 */
 	canvas = dev_get_drvdata(&canvas_pdev->dev);
-	put_device(&canvas_pdev->dev);
-	if (!canvas)
+	if (!canvas) {
+		put_device(&canvas_pdev->dev);
 		return ERR_PTR(-EINVAL);
+	}
+
+	/* Establish device link to prevent Use-After-Free */
+	link = device_link_add(dev, &canvas_pdev->dev,
+			       DL_FLAG_AUTOREMOVE_CONSUMER);
+	put_device(&canvas_pdev->dev);
+	if (!link)
+		return ERR_PTR(dev_err_probe(dev, -EINVAL,
+				     "Failed to create device link canvas\n"));
 
 	return canvas;
 }
-- 
2.50.1


