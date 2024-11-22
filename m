Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBECE69191
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 20:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KdfcoTAixo+mlxOpXRifnZy9GhI+cyrUE3VMtPIwmvg=; b=bi/Tolg5Hv1V994Ws2vRFBvLlY
	Lvn6WOcy/f3ukspThL/eqMinR8diKYF7+xsYqUQaV2GjwLbgigQzUIlp5rtGLM1im+UjqMQC3J74A
	+hQocjyavFGFT64Hb0R341HUOXgYsE9zX68w/IHF/zrXn08aF8+LdItkLv8HG5GBFSEgVT0hQdB+7
	fTHwN4ZTj+aTBXbwYqlIhCg/rh9vVZd6DhB798E3G296NExovqPsN7c1JQ66SQD696D51Z5rSYKLX
	sWzTDEkqFoDwPKchXP6E7KQ7KvW7mSUzQc7NC7D397H2Ne0r8iY7azutwGp06gXhEhokBeRg6XI7Q
	pf7VT9zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEaYV-00000003Iwk-2hHb;
	Fri, 22 Nov 2024 20:47:07 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEaXX-00000003IpG-3k0T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 20:46:09 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4609d8874b1so16524181cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 12:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732308366; x=1732913166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KdfcoTAixo+mlxOpXRifnZy9GhI+cyrUE3VMtPIwmvg=;
        b=euzpiL3AeNnSJIt8R0m5CbJsXi3BDp+Yt2+3we89A4+tbfCtSwD1EkJiTi7cypdWc+
         WeYqguDFGK6Pbg9rmIyLB+jzR00EPbWN7bjHjSS4tVD8xv9tn34gtFxQUdpCo/oJ5845
         GAokK2EE4xFCUdP5iGQAqtBAqtENxwVt2FZqFcCX26dCWp5kGeqRr2IUWEb1fsGNwMWX
         5U6A+T5ZxOnwm7gR9r4MrHe+OobFl8kIuKuoQelPzd1m3UVfPkiyzveFNRdwehAEzkZ3
         /jVb7r9IprZcdwO5ByqnUdtlpQVuX0n3iigJzPhIlvYAYyD+eUpXkzqh2GIWv4fIcWZ6
         v/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732308366; x=1732913166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdfcoTAixo+mlxOpXRifnZy9GhI+cyrUE3VMtPIwmvg=;
        b=X+3Q8aGETlGXNuKc9MqwW7neucDE79ZHGD4g0XgCN9lnwsCbyiowq2RYa3XbP50BZ4
         tJ2qg6jK5acDcsXC4fScVQCc3pyR6tpHLMlxhtrNIA4n72ysdc+A64jI2ax+AkvLykn9
         N1Po0nZDiBb0iQSQNUOQjct6bT0DuiOO3u3gxkDBPvKouU2u7gk/9WD2B9bbmZM/ZdsZ
         0YqWcJ3gbzVWNuRwf+An/a+C0o8D1al09bzaarhTYmRR6KB+l6c7jJlBg17eTukPaB1L
         AAJISJB8L46wjrPpGAQAWL8d27p0uWDhvgrZdPbbncLAevb0Oxhu5wEZi/QDCNYkUG4u
         pjHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd1tkWgFT3VuF8j36TPsCLJFetoMd9gR3Jg7sgEVw0mISf+zJ2i1J1OQYr9yNgiRxbIpDlqbW47kfq9GMu4qm2@lists.infradead.org
X-Gm-Message-State: AOJu0YxsvqS3YUjVuvjRoT3dXD0Vaxv0miuGPHGKvDN+5JEr4vc4B2D0
	0TixrUlGleae4OIlH+BN57SlEpfB4/MPFyTn+RgdmgKWHdd7d0dQ
X-Gm-Gg: ASbGncu5Ywci7wcg6/DEBpI9Zqk/fyqr9ibpNa2XilR6T/LIuvF2lc7oNmkw9vw+mqW
	WeZeBMZYzZCtqPN5WcAVs8TQCfQKrs5YXaWeQ6VOMj584jlSIvU+2of8J7JkddOjf98gARk0WN8
	RTn5tpZlVJ8qv/SKtQ2cQzQnyt4GJKbOUAPLnrdMr+Fb5voQ5GgK/ZmBbTL+yzy2W8G1WgFbEBk
	CN4kbRrFYdUMIRxXtkJmBKvlqiwbH2GEta/eCrYN3sGwWZNfdXWBrVkOyiY6x9fPqBBXr0q
X-Google-Smtp-Source: AGHT+IEDZRkTO5+DQwSrlRCcw21oaJiFGCJZnGNbrmx62J2fNbuC3IdPrM/AFVV8d9sqgagVOv+RJg==
X-Received: by 2002:ac8:7d92:0:b0:45d:9525:42ff with SMTP id d75a77b69052e-4653d632068mr45585081cf.54.1732308366553;
        Fri, 22 Nov 2024 12:46:06 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c3ed111sm16082051cf.20.2024.11.22.12.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 12:46:06 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: mchehab@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	hverkuil@xs4all.nl,
	u.kleine-koenig@baylibre.com,
	neil.armstrong@linaro.org,
	andrzejtp2010@gmail.com,
	dillon.minfei@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] media: platform: stm32: Add check for clk_enable()
Date: Fri, 22 Nov 2024 20:46:03 +0000
Message-Id: <20241122204603.44419-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_124607_926940_E2E5E426 
X-CRM114-Status: GOOD (  10.12  )
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

Add check for the return value of clk_enable() to gurantee the success.

Fixes: 002e8f0d5927 ("media: stm32-dma2d: STM32 DMA2D driver")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/media/platform/st/stm32/dma2d/dma2d.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index b6c8400fb92d..48fa781aab06 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -490,7 +490,8 @@ static void device_run(void *prv)
 	dst->sequence = frm_cap->sequence++;
 	v4l2_m2m_buf_copy_metadata(src, dst, true);
 
-	clk_enable(dev->gate);
+	if (clk_enable(dev->gate))
+		goto end;
 
 	dma2d_config_fg(dev, frm_out,
 			vb2_dma_contig_plane_dma_addr(&src->vb2_buf, 0));
-- 
2.25.1


