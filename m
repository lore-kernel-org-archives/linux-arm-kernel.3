Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C308C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrLz/BgMOWZJw3Q53MMnd8sHfRljAQMBGTN2LAcpT4M=; b=c8JY78FnGQJKti
	B3xPn7+Er6AxwG49g95P24MT38zE+QGFmbH83i2m0P8uSPqN/6jIG1xcKYifxGbWqbk5o+We7+Gka
	KgcRR7uxLEPwvftYIQX6QZb9MMqvUXODwrEXELx8xeLLiWfGpgTu7qmwfg1pVZC5+ZjrGmOoILpjm
	eD38o7sbxRJ6a/Nhy9sKJHpHM0aS2pr/xvWcdbhFyscg+iMmFx/NNcaNx1ckFq1+CwU94G29BRFln
	5YYWT0j5MSA3Sg05eWhR2FhuCWyqEK/edsRcLG3Gel8M1GutGTTXUgTFBzMOP9DG39JPGRtHiXggX
	1A7dZJEmzbsjmbg2TuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVp-000000099mR-3Znl;
	Mon, 13 Jul 2026 12:11:53 +0000
Received: from mail-pg1-f173.google.com ([209.85.215.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVf-000000099eK-3xbn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:11:48 +0000
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso1791414a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944703; x=1784549503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrLz/BgMOWZJw3Q53MMnd8sHfRljAQMBGTN2LAcpT4M=;
        b=LmrenXCs5d56nlLZkozg9Dskgo3tdDv6/0QUr6nwKKWmt2zvEUMghuFMDEyAiOUXff
         BDTU+0aMIIbB0dgk9yddKGI8O7vGmwtghTGFo3p7PLOlKZxoh8g4qab1HTpdtNzlsQr5
         ppgOKl6T7w2iIVD14BiLMIkQGpz5XDbI9sKfFDNEz+/iImnRoY7YL+V8L2zwNl7rNp9k
         37jWc4atMYWBx7GkhWR/zC5ClSt1k1BU3y/9rt2B69NJDhPAU8OBxY1yOkhkF8YiWl/d
         7r7r0Hn2+a7RiMzvnyIli2KT3CHqFEy867W4OZAawT2Ss9voqTu7hu+Z+G0FUWfMPuJ2
         zWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944703; x=1784549503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xrLz/BgMOWZJw3Q53MMnd8sHfRljAQMBGTN2LAcpT4M=;
        b=qa6nt/3GbFnltOs4zdmpHcfiZYmjUfkXFbKO44BsqIuFeUOgCl6aP2f5A+QpJ55WCt
         cvUwZDx0ptLuCJK3am5Af1KYOX4s/42QPnxxm7IBrVQYbRRPjayUE4jiMuwF46I2fcEc
         g8ipQLgSz4Q00Nsa786vfIKS/tpPNLl6TAi0QsI8vDlkMXbFcm2GCiIq4eoGa5DWzOi4
         YAHM8+WlnfbCE1SJ02hNXfBKuaLTxG9WYnYoK9vUOv9d0tDrDoK6qO6E0LkR0ix+RZHX
         bQgauvdqWg6ZW0sVlA2DPzfYU7UqN3UGKIUJmm56QqgtB5N/l5njy2bvRB/RuTlaKtTs
         +YRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0tyrPBhwQ01CNvbYnlnMSYOXJF7c/xP9IkPsrH6QnzpIowQ1+hpeKbOrWbbogY1rGXhPOb7UcLeU8JVmkhz6B@lists.infradead.org
X-Gm-Message-State: AOJu0YxWagmgrjUEJ5zI3AELtfnozhbjU62zDc+jWIu9A4IdbXB9U7tF
	1T7mCbYaKDDff65gzpta6ZoLQ1+FLMo9v6YbRz4U+ocKGIG8KBJ+YhGw
X-Gm-Gg: AfdE7ckJmDMiovW8hy+9TFx+Ya5zcht+hh9GXOq4pep34Ae+mq1M7EY/iUT6VGvmcYE
	IIXifkLVK5ObNtqQAKjaoRHh10/s6dsjNdFPLYKDk4n35xluifx5AfgcPHtABS9AY0Ab6nrQLgp
	fj2n9ZBUKvi1s8sRkkfMhnOWhvjkUX3Pa6LHuKsB+gsce+EAoh2zz7SIU5XPM3aqt1yik99J9Q8
	b0Qjf3yW/FyMx9psurztifH4xhv3m6ZKDBNb22yYmUvnf2xFSco1bsqpxWxlRObbXsmT0lGnuFA
	I7r5OdRQWp0PrMbKns3iCkVWfOX+K/BbcDtIo4QmRZu4WH4MtLCFXEzWIHcnB2E8lozvDgU1cBu
	9IrfzRx7pExF6HdE01YiFybcpTHTXeYb3OQhi6U6ggQg28zuy+M3/bMBulGkAhIMkn5npGL5qT9
	CCdE4cbe769A==
X-Received: by 2002:a05:6a20:da1a:b0:3c0:9c18:d5a5 with SMTP id adf61e73a8af0-3c111073a84mr9971121637.66.1783944702870;
        Mon, 13 Jul 2026 05:11:42 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:42 -0700 (PDT)
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
Subject: [PATCH v7 16/19] media: meson: vdec: Configure DMA mask and segment size in probe
Date: Mon, 13 Jul 2026 17:37:11 +0530
Message-ID: <20260713120840.17427-17-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051144_005648_897D8B40 
X-CRM114-Status: GOOD (  15.22  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The vdec probe routine does not set explicit DMA constraints, leaving the
driver completely dependent on platform bus default values. This lack of
explicit layout initialization can lead to allocation failures, restricted
address space mappings, or broken contiguous buffer handling on
architectures with restrictive DMA layers.

Address these platform constraints with the following changes during driver
initialization:
1. Enforce a 32-bit coherent DMA allocation window by invoking
   dma_set_mask_and_coherent() with a DMA_BIT_MASK(32) argument.
2. Maximize the contiguous allocation segment boundary constraint to
   UINT_MAX using the vb2_dma_contig_set_max_seg_size() configuration
   helper.

This guarantees that large, contiguous video frame allocation requests
work reliably and explicitly aligns the memory management paths with
standard Linux kernel DMA management paradigms.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index ac86a9c4febff..d33cbebc4453b 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1186,6 +1186,16 @@ static int vdec_probe(struct platform_device *pdev)
 	if (IS_ERR(core->canvas))
 		return PTR_ERR(core->canvas);
 
+	/* Enforce strict 32-bit DMA limit to match hardware capabilities */
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set 32-bit DMA mask\n");
+
+	ret = vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to set DMA max segment size\n");
+
 	of_id = of_match_node(vdec_dt_match, dev->of_node);
 	core->platform = of_id->data;
 
-- 
2.50.1


