Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D71C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0YpADwP/mkKyGO+EKdZI2bBLv0b75u6CTO5qSfwEOn4=; b=FC9HsNvLMLyad/4vxF6heOD4uo
	9N5toZYFO0HPMKbPtrNGwR7uIZRNB3MfQok79wf8E9RhCjd6ZjCGCjphA5UW7AXJWsrAf93rUIAih
	yRchjmlUnhwXIo2BdC9DNwhSuiLlEJQHNkFBHBud30J6XNEtZPDp8Ya4VTF4NaDpLEr5Chd+X0VQd
	QgosdMMci9XWpCgZO1g+t+2phfWyUm8oj41HIReDnmM2uMYSGYf48qe+rot0el1q7Yr4SoYxySwk5
	/5PHV+VtFNVtRH0iARRRSYA2Ar/o+emt0HtQwazJxbSds9VekYDZnLomWjeTD/6bT5iVUZO1KRy1J
	16G7wTQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TEZ-000000064Mo-3jOQ;
	Mon, 07 Sep 2026 06:53:39 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TEW-000000064LF-0nLi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:53:39 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so2485906a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764015; x=1789368815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0YpADwP/mkKyGO+EKdZI2bBLv0b75u6CTO5qSfwEOn4=;
        b=PsH2DVrf4yLxVUH/J/UgJ5mxKmOl6ujVzTXA0Zgv3DM9PIs9QDOdZxrMo92XprdNq9
         kiI2stOs1lcPpbYuqKQPYUA7nfyZy1Ky2+r9Ej33vdvIRSnsDATrkrHmUnodivF7WLos
         5BEghFcgpuov6UylGAG97SUxg0mJVk1xdswPLFlDs85litINGz4nSAElG6GjUmI0/gUa
         PiEj14fuDf50soUyXShynPTx5pmk5YGDtzfxZ4ou0YYSMh6HqgPgo4xzE++1O32Rr0Lj
         kjZtyWNwWfaO6BiAsO4uzydvq+3/svvl7gdsWr1OR9+q9yefS/9Ix1djlJZkhJEK8Vov
         5faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764015; x=1789368815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YpADwP/mkKyGO+EKdZI2bBLv0b75u6CTO5qSfwEOn4=;
        b=tWrz3mhii6PEv5/t1jzdVV+fqm3V8iOBqO03dv3xI+pdut0dRKc3jffTrMiC0XDXp8
         lkkpsWt0sNeCdZ12/HewrvEMq6gTz5z98XGxpkadPY5tYWkjj487oBlVZVhkElES8RYc
         d775Sw421yzfz/zM8bsgARC6PL7Vs8CvTrZ/+kOqdLmAAyBKnNCkt/JBwGpJtAb58amA
         AaM0TUWDF8OimBFvVo8vSW6vqlMek36GKDQG99hvn8HoZwxwQztoMg/NewuKC1Bn1BvS
         h6KM6sJU8hf4hJ2jO5w+PlmavVVDHan2OZ4JONDECyPfpKgWXKBUHexoKujXSM5P3Tm0
         c1LQ==
X-Forwarded-Encrypted: i=1; AKwUvByobgzN6E3Jkchaw452J66NgHUb5iDWIvzJVlvPfpGh3bmK+IU3EdQSD9t0FRSgyR57oCiHJBYL2n00wQRXp6VI@lists.infradead.org
X-Gm-Message-State: AFuF++m4lb8G/1gmSHt+rfcC7rvtiv5RbJ02XfnBA1BgzcACobO9sCGL
	hGNUCbp00bQNYBnS6mpFQixSaDvzqszyq2ZnIq+2ekyz4O3Sa80kH3X5
X-Gm-Gg: AYBFou2iI1JOPYrk5TMVNbeMB3EqB5zF1yTGFGpM2H2IXIm75GJeSrgkzTv5cYtBy9Z
	PlUi3Mdv5iml6I8WAdPPZPypDDivWJOxTYq+NswPCWx2Sw1wmHIBK+yYp/MnoDlolXea+lT0UNk
	gcFTS4sZ4j2UFCzUiw+uB0Q59jy54vu4uMZhCcpSSoX4mC71YQLu1atiOlWljtOL3T1YyReOLH4
	hRe6EFiXo0jXwukceaUPYYDR7O0lmsQs3KQdVsAOjubeH/aLD6CXt4lNQswQ0FgkUBQ3O1svm/D
	9uDvaMX89KPikGepxZB7wxQoiRtvkw3Uk9nsgMl5YIFrK8x9dCMSqsxSuFxw1ubUMrGKaBQBT3z
	Ayk3LZi4fV7xVB2XprxkMSLJKmkU6fRH66Kfd2XlgyIRArsi9UC2+B9b4/DPBAwB+R5aBImDT70
	C8a1x/9aAFj2Kx0JQ51kP9Pa8t1iSR3n2ypOXqdyzKEcyLPLtm1BJsnMSjFGujYJzQSMl+OYCDJ
	CoBBoqUf6Q2kQ==
X-Received: by 2002:a05:6a20:e607:b0:3d3:ae0f:5267 with SMTP id adf61e73a8af0-3da3a152a11mr33125804637.19.1788764015179;
        Sun, 06 Sep 2026 23:53:35 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm24822574eec.12.2026.09.06.23.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:53:34 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 02/14] irqchip: fix typos in comments
Date: Mon,  7 Sep 2026 12:23:28 +0530
Message-ID: <20260907065328.32009-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_235336_234259_26C9D659 
X-CRM114-Status: GOOD (  15.64  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/irqchip/irq-mtk-cirq.c    | 2 +-
 drivers/irqchip/irq-sifive-plic.c | 2 +-
 drivers/irqchip/irq-vic.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 914d1d639fe3..d30c34ce0f56 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -247,7 +247,7 @@ static int mtk_cirq_suspend(void *data)
 		writel_relaxed(mask, reg);
 	}
 
-	/* set edge_only mode, record edge-triggerd interrupts */
+	/* set edge_only mode, record edge-triggered interrupts */
 	/* enable cirq */
 	reg = mtk_cirq_reg(cirq_data, CIRQ_CONTROL);
 	value = readl_relaxed(reg);
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b0dac104814..a7cddadddf40 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -452,7 +452,7 @@ static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler, void __iome
 		return 0;
 
 	/*
-	 * Interrupts delievered to hardware still become pending, but only
+	 * Interrupts delivered to hardware still become pending, but only
 	 * interrupts that are both pending and enabled can be claimed.
 	 * Clearing the enable bit for all interrupts but the first pending
 	 * one avoids a hardware bug that occurs during read from the claim
diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index e38104c5064e..607e3284f700 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -478,7 +478,7 @@ static void __init __vic_init(void __iomem *base, int parent_irq, int irq_start,
 /**
  * vic_init() - initialise a vectored interrupt controller
  * @base: iomem base address
- * @irq_start: starting interrupt number, must be muliple of 32
+ * @irq_start: starting interrupt number, must be multiple of 32
  * @vic_sources: bitmask of interrupt sources to allow
  * @resume_sources: bitmask of interrupt sources to allow for resume
  */

