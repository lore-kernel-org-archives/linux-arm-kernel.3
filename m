Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3481CC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 18:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TZZuyrKf50eYXDMR9/RtxPhzJQSYHI855hdGibW04Pg=; b=hmP9qJxDVov6MECLSBFUaWHIw1
	iWprTBaVOz0EQvtkPF4hUwNINeJ11vvJeXW9YmMeSB8EhSjdk1a1do+i8vFwtMiC/YSLiljsBTZnK
	X7j2QJoo5nKlNtnYjQRbL0VyRU0usfmU99P8uM9KLG/KZUOqvZITtP1kyLRpUzkodXGjyVkx81ZHQ
	V9fn2TG93rmCMZkDs8fLP9vrZV0+lBCiHGKmRR7lyWvUoP/eSBEQ/m0t3uTc172T4oPbDNby1yGmy
	Fbtcvhre4gW7up3QbeiKsT0b6+h0rAnwoy5V4RHnxYAIegwYHW8BnKdMGASKmpdlmNo3+6tb4xTV4
	SlD3aq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56Iu-0000000HTZv-20mH;
	Fri, 11 Sep 2026 18:48:52 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56Ir-0000000HTZR-416s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 18:48:51 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-52ff0b7c98aso14531071cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 11:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789152528; x=1789757328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZZuyrKf50eYXDMR9/RtxPhzJQSYHI855hdGibW04Pg=;
        b=sXyDO0dGrXNZl1IgX3CH4o8S6xbuKdlGUpp0a5BKJav2L5vndvOVApOyixFQXVfs0O
         5SAN7JVm3832j1vhI/tWmPpAczfr8bk+5rjtF3W5IkiSQYcVg1APKCAwJGXJUD9eDnaP
         BZcitBdtazIscK0ry0MuUcalnXt4Q/kLiC8yoxhmYDZBqAE0xF0i+NZkINfrfDaou1QC
         3H84pDg2hp0pUcmhjZ2dU4QvlaqTYIHsOiN2ZxHfg5TtxH8AZ7dADJYQvGZivd2saN07
         okwntdgDyHIH9ojAZKQdtJq2gBMFLpMijOs4JagQmELkgoIqINMHl/8HF/dGbnGHyHHW
         CJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789152528; x=1789757328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZZuyrKf50eYXDMR9/RtxPhzJQSYHI855hdGibW04Pg=;
        b=ktM5wG7azV88tqbsZ5i2jXwp5bqiw321f3bytW09bz291qdvVNSa4C8dkKfLvw5gr5
         6ZZR++cJCWMpWXTzKl2Tgk+60cXsVRZiPWsuxZkCo90wNsudf+cnPSGYAESZgAOxKA4n
         hS6vmzvmaMauVnio1wrcUlCjf1zhZB56MGd0tv/HHYX5o1cNSytLT/Tq0iPXdqYQg05k
         UKcQrqIoCBoIHlYsqwmwFG4JThnkl0zZblGHDrer+MG6nP/q9/HZGeqgXll7XLGHjXdK
         n8Qukol31QTOgvhjn/VMH+H9USerujXzrq+zXnV06l2N1/O+yA0soIu8ViWdgjv/n/9h
         /dTg==
X-Forwarded-Encrypted: i=1; AKwUvBywQqXm/uZ5L+DVJiIWe14pzigz8Q2ZBcZhEXERvwYns7uKSnIqOoWm1HH4DPBAHVfdLiKhhpZiII9oJokXy+SR@lists.infradead.org
X-Gm-Message-State: AFuF++n10fK8Bp7skxqJeG8Ga78jlIslAUodUl9GxpyuPipGEqlZ/4gO
	7aFSIstO3ScnK1KfrAR5PoC/YNp6zP0nPQmyRfLsLbzwqJKDMhAezaY=
X-Gm-Gg: AYBFou0cUFxYwmwWEXU+ASSVpif3fndKIGjzmSZzkN9mYKqozXIRorCfk5ojMaJdc/R
	HH/j89ZD9aASxrcwxKv2zVYoGbzECwNGrKjv1z3YDrgJZZKHDRYwLhqkRZVNIUdwNMxu7fDP5gS
	8Pyy5TxYQt8QHY3OLtknhSOiT8Hup18zR6MfWEBFPI6244cdieUSHAMwv/KN2wClNez6lrdYA7k
	AYKewtuZjO7+2gRdG/tU/YKWwRfRHlaXxXvRk1ageZn4AZ0PkuA/+/gHbcmZh3fwGX+hDahI2ON
	6pAjBEfEc+JAI1F4nEj5z/osW+oi7g7vl8faeNnuHjdNaHlZq0R2faO/llOtW/j+z4HNEcOoOdQ
	CYUJTbnJt0IcvA3c7HvKPFpj9PuH9XFhv/ndenMzBNZIql4OhQM0ohL9vvn5M5Q/RwqsJG01x09
	8sbCPglKE8X83W5a2Fnm358BeiDDR/lt0VNeZu4x7AepWg6Gb04ZFv1t/KoNaNBD5XeSUnoQVqQ
	6enYUy4R0vCzlVYe6wgezVuTR13Mo2KTZQEGhVghHcAonLRsRSyWANSepNOrqCvbW8VzEREspap
	/PS0EmSbTdRiTD98XczaRP/UEFsRUMQrkR0=
X-Received: by 2002:a05:622a:4006:b0:530:b2e4:d598 with SMTP id d75a77b69052e-530c8754c05mr79942701cf.51.1789152528459;
        Fri, 11 Sep 2026 11:48:48 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d389esm26707086d6.42.2026.09.11.11.48.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 11:48:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] dmaengine: stm32-dma3: disable the active clock on removal
Date: Fri, 11 Sep 2026 14:48:41 -0400
Message-ID: <20260911184841.34222-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_114850_002649_5CA34884 
X-CRM114-Status: GOOD (  13.66  )
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

Probe enables the controller clock and runtime suspend disables it.
The remove callback only disables runtime PM, which does not itself
invoke runtime suspend. If the controller is still active, its clock
prepare and enable references therefore remain held after removal.

Remove the OF DMA provider and disable runtime PM, then release the
channel IRQs before disabling the clock. The IRQ handler reads controller
registers, so wait for it to finish rather than leaving IRQ release to
the managed cleanup that runs after remove returns.

Disable the clock only if the device is not already suspended, then mark
it suspended. This avoids a second clock disable for a runtime-suspended
device and also covers CONFIG_PM=n.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/dma/stm32/stm32-dma3.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index 4724e7fa0008e177160d085172cb89d6bc483c4f..b4d68be5a46b8aa1751dd32234d42f6e6b470335 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1926,7 +1926,21 @@ static int stm32_dma3_probe(struct platform_device *pdev)
 
 static void stm32_dma3_remove(struct platform_device *pdev)
 {
+	struct stm32_dma3_ddata *ddata = platform_get_drvdata(pdev);
+	struct dma_chan *c;
+
+	of_dma_controller_free(pdev->dev.of_node);
 	pm_runtime_disable(&pdev->dev);
+
+	list_for_each_entry(c, &ddata->dma_dev.channels, device_node) {
+		struct stm32_dma3_chan *chan = to_stm32_dma3_chan(c);
+
+		devm_free_irq(&pdev->dev, chan->irq, chan);
+	}
+
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		clk_disable_unprepare(ddata->clk);
+	pm_runtime_set_suspended(&pdev->dev);
 }
 
 static int stm32_dma3_runtime_suspend(struct device *dev)
-- 
2.53.0

