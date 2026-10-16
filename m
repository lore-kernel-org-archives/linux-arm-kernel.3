Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62662CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 12:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kA+vTZ/Eeoad9jIjZ1JZy2rB2AcKRzVxwNFQY1s/X5o=; b=d0dJXb2ixtA11HP45NRTOYptDb
	kWS//vsk2X7op55Uvt73S+fTnuLyv6WOxLAHLhm9gqZIk2cL+XtfcRFeKOoaNUiWWqPsRijpDcwWc
	sb6jz3YWcAA63uGygKgiipAbjas4BOGfacjskhAjL4nNbGKveiiTVYnDa3qMeRbtP4lT6zU84abDD
	ls2ngGklmpqCCwv4xxBAHJpvp27g/AMhtaUTW8AfCLk6plwC3vmYygTUhaBxbRm9hcdOgIEtAokvq
	DXxD6HnvThWdXDWpR7danz36Jp0NPkqQ8VuTldsVYhTvrHCDA6KUond62j4RvvBUAJO9XmmLHr8Cf
	Jop/cyHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhQV-00000002y3q-2KyZ;
	Fri, 16 Oct 2026 12:52:47 +0000
Received: from mail-ej2-x08.google.com ([2a00:1450:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhQQ-00000002y1H-1JmC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 12:52:43 +0000
Received: by mail-ej2-x08.google.com with SMTP id a640c23a62f3a-c41346bffc1so11962966b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 05:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155161; x=1792759961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kA+vTZ/Eeoad9jIjZ1JZy2rB2AcKRzVxwNFQY1s/X5o=;
        b=ZiFPTgyYfTOvMcIYWaoeRoD5HTlOWZRoXSEb+0TqYsorpeGCSjN1fzkeXLGz5seixj
         lnNnC5ibRSsbIs44a3CDWBk30Rw2jSrgX3m4Y37MY6dnggLiqQIAe2QmIGPmtanYKJb9
         AXeKmvKnJsoayoI5S3XD7Jrdlti7PSUXN78YN/n2LVrWDhmxKbXqm3p8WBSOAoIcl8+K
         1PHhbkCcC8XNybnKS29VK7VcNBClShTKbZWluw7n0wM5eWGdeMBc8zmADK0edFg3bnTI
         fYs4G8C8W5F6R9ZvTfO9yoNPSV75A14kHAG/L+aDW35EnajyGCIhpROtFDMA6vagvyiA
         xRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155161; x=1792759961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kA+vTZ/Eeoad9jIjZ1JZy2rB2AcKRzVxwNFQY1s/X5o=;
        b=pz0LWWUVi5FlXkHgaXJcagRuzIFHiLS+OeCHn8ay1DWxv8wqukrwiczO1QK5D3QBs2
         YlOLyh7V9i6iXZbdqcbvDOGht7fviUFE5hscczpnmJbpqlUOJQ4hQAoiMk5if/Rp5N5p
         xYhQI/tGYlnOw7DNAVJv16TeDsFDRGowhujsig91BkzgnTfRJq7BEsuPGADBjCDiqjHq
         423n4mi8BF8Ul65x7k23wMrP5XLUDCQQnx7Khytqm93j4w3gejYRA2Vt6ZiRFpugKL42
         QwUEb8vJwR/1wl4S7qo3kMDHLXxVhjbjAQbrmoWdDoC9nTKA6EIYJXj9WH1zqe14qdvW
         9EdQ==
X-Gm-Message-State: AFq9FYLdAmGlMpxTdWL5X9hctw/Rcv6rl2HB8gj7+gA0u7lcSvsYpdyK
	WuhQNvvH309+pTyHNO/QOzu4PbIykk0kP/XFwcFImGy51BGib+0PI39O
X-Gm-Gg: AYBFou2y/QgI5hQAoyPbfMF03t5DPnntLGrPOAGqTyZfP24bYKlxyf0bg6m2ZyPMfd1
	VstRZUeMHfPV5AqTqxWwzG5UHp0+pWfOPvRJJ84sXl7cM+Sm69iXhFRp74mf1S8xTeWUzao5cMJ
	36Mcr2nWOY72p4jAqK5EZpfNA2gET0a/nEDSHCjNOIObB4hM+9g4Cdo8QwcZYWL+BAQPl9RnVOL
	qidDRO5g7dvAxGsC3qxlivJOEOfXiFIzdW/FFPJpwX/WGc/jw2c00DpwF9OClhneoTj6C8nFe4v
	/aATcrf7h7CjVoTSHd7Npz8EQVlWYUw6YNeJLPn2MIskYXO/9KKfM6Gm26D8j93bTeIGWoZDX0B
	DUaacgDATMRxnSyIUdgLdvqBav0i10ucNkAVGkTjGm15gXpnrpRWHZhajSuTSIB8nkBd2fvtTom
	CBsfcoeeQHobW4BPjJcJ7khUycrWsFkzf2+nGphFOb2By4YrFTkalED+DZg/Sok96V7Od3DysoQ
	ZibRDWceaAiYjeKOBz66EB/+hyugdoY8cXD2O31qJ4foK9VBS8oXut77zFAyCJ8NaQuKYQpDCeo
	dLxLzShT0GFfXYsBqedVQ0DURsA=
X-Received: by 2002:a17:907:8687:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c31aa02a1ebmr1954672466b.21.1792155160445;
        Fri, 16 Oct 2026 05:52:40 -0700 (PDT)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32876asm69433966b.10.2026.10.16.05.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:52:39 -0700 (PDT)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v3 1/2] i2c: i2c-xiic: fix clearing of bnb irq
Date: Fri, 16 Oct 2026 14:52:28 +0200
Message-ID: <20261016125229.1798791-2-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016125229.1798791-1-thi.zirnstein@gmail.com>
References: <20261016125229.1798791-1-thi.zirnstein@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_055242_370458_7A3B5685 
X-CRM114-Status: GOOD (  17.57  )
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

Add a function for clearing the bnb bit,
It waits for all preconditions before clearing the bnb bit or times out.

Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 40 ++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index ba560462d451..e68e17bdf0ba 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -233,6 +233,8 @@ static const struct timing_regs timing_reg_values[] = {
 #define XIIC_RESET_MASK             0xAUL

 #define XIIC_PM_TIMEOUT		1000	/* ms */
+/* timeout waiting for bus busy */
+#define XIIC_BB_TIMEOUT_US	1000
 /* timeout waiting for the controller to respond */
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
 /* timeout waiting for the controller finish transfers */
@@ -394,6 +396,30 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	return 0;
 }

+static void xiic_clear_en_bnb(struct xiic_i2c *i2c)
+{
+	u8 sr = 0, isr = 0;
+	int ret;
+
+	isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET);
+	if (!(isr & XIIC_INTR_BNB_MASK)) {
+		xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+		return;
+	}
+
+	ret = read_poll_timeout_atomic(xiic_getreg8, sr,
+			sr & XIIC_SR_BUS_BUSY_MASK, 0, XIIC_BB_TIMEOUT_US, 0,
+			i2c, XIIC_SR_REG_OFFSET);
+
+	if (ret) {
+		dev_err(i2c->dev, "Failed to clear bnb\n");
+		return;
+	}
+
+	xiic_setreg8(i2c, XIIC_IISR_OFFSET, XIIC_INTR_BNB_MASK);
+	xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+}
+
 /**
  * xiic_setclk - Sets the configured clock rate
  * @i2c: Pointer to the xiic device structure
@@ -883,9 +909,6 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	}

 	if (pend & XIIC_INTR_BNB_MASK) {
-		/* IIC bus has transitioned to not busy */
-		clr |= XIIC_INTR_BNB_MASK;
-
 		/* The bus is not busy, disable BusNotBusy interrupt */
 		xiic_irq_dis(i2c, XIIC_INTR_BNB_MASK);

@@ -1030,7 +1053,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)

 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);

-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1097,7 +1120,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)

 	if (i2c->nmsgs == 1)
 		/* very last, enable bus not busy as well */
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);

 	/* the message is tx:ed */
 	i2c->tx_pos = msg->len;
@@ -1181,11 +1204,11 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
 				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK |
 				((i2c->nmsgs > 1 || xiic_tx_space(i2c)) ?
 				XIIC_INTR_TX_HALF_MASK : 0));

 		xiic_fill_tx_fifo(i2c);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1227,8 +1250,9 @@ static void xiic_start_send(struct xiic_i2c *i2c)

 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
-				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK);
+				XIIC_INTR_TX_ERROR_MASK);
+
+		xiic_clear_en_bnb(i2c);
 	}

 	i2c->prev_msg_tx = true;
--
2.43.0


