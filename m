Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06411CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 05:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DoIjC7EcejB2ioPzHuqTAbp7uokmahiy0Pm6Nq6N6q0=; b=qYTIpji0CWxZA+YoTDF9wY3AhX
	DcX3OJNa0L7dEi7L7GzrF1MaSwfnPJ5LOSoYV/Qh//v/By2ImYM8TYSGXyXPdBtRg8gB7shXGgA6w
	m6n2U6T7eqpVYaMSCcYZq2V15u1IRM/7RUn8nIEteJVLIZS/t+bnhEA2PAwMLOw9mKfYRPGdY2huu
	eg0Rfm2KYUGCEiMINsOD4NX54lr9rV7X+wXkRpSt9HWb4p2GhI61vxmo0pbCWR/ZW5p94i+byYVsM
	evA5ExdyH4fwrom6uxxBKfH/SvigUC+cmRLIr3ttkB+RCvxcUMvQfJFv64G9ozeqk9UjO/A9RlBaM
	CHtS3E9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8OY-00000009fib-40D3;
	Mon, 12 Oct 2026 05:16:18 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8OU-00000009fiH-0srC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 05:16:15 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-53397554beaso17207641cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 22:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791782173; x=1792386973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DoIjC7EcejB2ioPzHuqTAbp7uokmahiy0Pm6Nq6N6q0=;
        b=tE4xW0CttIlS/SWUp5hBYGxIdnFgAaWNXU81/zQebfFGZ4XBiqiI236xuk+Z1StqO6
         l6qr8KiHykG/44qzVDqkSQs4MgAbXcUs6wQ4WWu12mKXJmMT2hL3+TCTyHM3DZwvXQkI
         hW28DAewLLwdEYrDuB/y98dI7D31mH26iZTt2pK0ImuNkFIkYeN9xY2ybnMYD1J++kVM
         pp4GUtpzUmEWD3VIabUqLoV53iuekhMuE8edZKrm1baSN4fGgzKMtHRvOARXCbh4xd1K
         NpxGBuKCNB/TL4mb3/yqcb1nRRXwjT7ASJ22V8ArXCXXSKwwaAqCoCqpjhh3w6/sx9vs
         IP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791782173; x=1792386973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DoIjC7EcejB2ioPzHuqTAbp7uokmahiy0Pm6Nq6N6q0=;
        b=qNstpv+bhP9YIveQeV1pB7ikXTiOm7gGbWWTF/lqcDT2dwpGiFHLq94c+EOFgfYGzh
         bUCcrMBWvHtahm0toOLilDAg5DvBW/pX6wb6Ika6JiH6MznALQcpiVqlFPTk3pcmgotu
         mCqNP17bCQc7halZ/RQJjxd4cQEmza9m2OK9eC0CN7s+04NKPBmuoyEG/HB+PKC4/Xxw
         ScXAsJx4Mt8JjHjGHJwztywxeTB+3Pl1qGMRdB75Ry5LyExcSIVjGzBRBpnZbBi3Z2Cq
         m/vnidOhMIr3N2nZ1/ImhSUBLbJvR0+3A5dKmFnVkso7WA1Jdz0lI8O+qZlWoCJb9HuT
         zGLg==
X-Forwarded-Encrypted: i=1; AKwUvBxr/U3H2+RjipYX2V9RkWK0cFwhJShRFLiPDQkkVRzdII1cBK41eeLOTBmU9N8f1gpdAqdr3CdWwtVyB1JFTfXe@lists.infradead.org
X-Gm-Message-State: AFq9FYKIqn/n1exdZ83uJBwSvVF492uB0hK4qPELtghpYZE5G9XK+REA
	pOKqJZyzl2PVqaTQP/cFVqF6F9d0HfQLcpBTNRcDDmd1mzQJd00PIdU=
X-Gm-Gg: AYBFou2DD9Bgv+C+V/b2N/4iX/9aASs+K6me5IFPAslEgDiSUP/ETiq4WxJEjK9YACD
	Ep1r/FWjT5Maay2iQ92hazN+0FjvaVsW+BGVOIysyUdi5cOHD8ta9XKFl1DPJP4GRv4ocxYYidm
	5gzt7xj8r5R+i17zBffcDIHnNi0Dt0By3OSaFhY8mqSHwChNNOUUXMN4QNXHM+FoWSYeGrzI140
	rE3wTFENu86PKF2EO4fpoF3XeYmOUM1J8pPiig0NToHz+CGDAUNL9CwyoBucj8f/HXdTAo+OZEf
	ubYqV/WjEj33q2UzZB65Zb5AnQ7E+sMoNRwJpaRTL0TT32lrBXIMWiNn7YgUd9xJbPSxjPXA/3B
	XjOFjibahFIgVP2kzZYDxXV5+ySBCOoLC7A6GXvk3/gs6UjcMmHcnyK2PxJt5iu0UnoGVEOcQBr
	2bKNt63oSHLAcp0bqSeYYN5AM9NK9C4Mml46LfG8SrAyxPGiss82WNb/YU3AIzuzzm5WlpQhTg5
	y2x+ZTKVoKca+UBrbS7Jy11YnOE+1wdu1k3JY2daPcZO43gKkiFXUXNXrDc+kinCu27VglkPGPb
	2EcS3CVvhZAjPasJki2yaRTV/DBFd/AAB6XB5E4=
X-Received: by 2002:a05:622a:2486:b0:533:8f97:9362 with SMTP id d75a77b69052e-5359fdd0ba0mr136390851cf.49.1791782172836;
        Sun, 11 Oct 2026 22:16:12 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550184adsm86514996d6.9.2026.10.11.22.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:16:10 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] i2c: stm32f7: close SMBus alert work before removing ARA
Date: Mon, 12 Oct 2026 01:16:08 -0400
Message-ID: <20261012051608.177145-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_221614_286436_41A2605A 
X-CRM114-Status: GOOD (  15.63  )
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

Clearing ALERTEN does not join a handler that already observed ALERT.
It can enqueue work after the ARA client has cancelled work and freed
its backing state.

Exclude transfers and join both controller IRQs before detaching the
alert pointer. Check that pointer before queuing ARA work, and handle
single-line controllers without disabling the same IRQ twice.

Resume the controller before masking and clearing ALERT. On resume
failure, skip MMIO while pointer detachment still closes the producer.
Restore IRQs and release the bus lock before unregistering ARA so its
worker can finish an I2C transfer.

This issue was found by static analysis.

Fixes: c8062d11e20c ("i2c: stm32f7: add SMBus-Alert support")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 44 +++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 6bd281a9ef72..9b8f378afe3b 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -331,6 +331,8 @@ struct stm32f7_i2c_alert {
  * @dnf_dt: value of digital filter requested via dt
  * @dnf: value of digital filter to apply
  * @alert: SMBus alert specific data
+ * @irq_event: interrupt for events
+ * @irq_error: interrupt for errors, or irq_event for single-line controllers
  * @atomic: boolean indicating that current transfer is atomic
  */
 struct stm32f7_i2c_dev {
@@ -364,6 +366,8 @@ struct stm32f7_i2c_dev {
 	u32 dnf_dt;
 	u32 dnf;
 	struct stm32f7_i2c_alert *alert;
+	int irq_event;
+	int irq_error;
 	bool atomic;
 };
 
@@ -1534,9 +1538,12 @@ static irqreturn_t stm32f7_i2c_handle_isr_errs(struct stm32f7_i2c_dev *i2c_dev,
 	}
 
 	if (status & STM32F7_I2C_ISR_ALERT) {
+		struct stm32f7_i2c_alert *alert = READ_ONCE(i2c_dev->alert);
+
 		dev_dbg(dev, "SMBus alert received\n");
 		writel_relaxed(STM32F7_I2C_ICR_ALERTCF, base + STM32F7_I2C_ICR);
-		i2c_handle_smbus_alert(i2c_dev->alert->ara);
+		if (alert)
+			i2c_handle_smbus_alert(alert->ara);
 		return IRQ_HANDLED;
 	}
 
@@ -2116,13 +2123,39 @@ static void stm32f7_i2c_disable_smbus_alert(struct stm32f7_i2c_dev *i2c_dev)
 {
 	struct stm32f7_i2c_alert *alert = i2c_dev->alert;
 	void __iomem *base = i2c_dev->base;
+	int ret;
+
+	if (!alert)
+		return;
+
+	ret = pm_runtime_resume_and_get(i2c_dev->dev);
+	if (ret < 0)
+		dev_warn(i2c_dev->dev, "Failed to resume for SMBus alert shutdown: %d\n", ret);
+
+	/* Exclude transfers and both interrupt handlers while detaching ARA. */
+	i2c_lock_bus(&i2c_dev->adap, I2C_LOCK_ROOT_ADAPTER);
+	disable_irq(i2c_dev->irq_event);
+	if (i2c_dev->irq_error != i2c_dev->irq_event)
+		disable_irq(i2c_dev->irq_error);
 
-	if (alert) {
-		/* Disable SMBus Alert */
+	/* Keep late or pending ALERT flags from queuing work on the old ARA. */
+	WRITE_ONCE(i2c_dev->alert, NULL);
+	if (ret >= 0) {
 		stm32f7_i2c_clr_bits(base + STM32F7_I2C_CR1,
 				     STM32F7_I2C_CR1_ALERTEN);
-		i2c_unregister_device(alert->ara);
+		writel_relaxed(STM32F7_I2C_ICR_ALERTCF, base + STM32F7_I2C_ICR);
+		readl(base + STM32F7_I2C_ISR);
 	}
+
+	if (i2c_dev->irq_error != i2c_dev->irq_event)
+		enable_irq(i2c_dev->irq_error);
+	enable_irq(i2c_dev->irq_event);
+	i2c_unlock_bus(&i2c_dev->adap, I2C_LOCK_ROOT_ADAPTER);
+
+	/* The alert worker may need a transfer before its removal completes. */
+	i2c_unregister_device(alert->ara);
+	if (ret >= 0)
+		pm_runtime_put_autosuspend(i2c_dev->dev);
 }
 
 static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
@@ -2178,6 +2211,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	irq_event = platform_get_irq(pdev, 0);
 	if (irq_event < 0)
 		return irq_event;
+	i2c_dev->irq_event = irq_event;
+	i2c_dev->irq_error = irq_event;
 
 	i2c_dev->wakeup_src = of_property_read_bool(pdev->dev.of_node,
 						    "wakeup-source");
@@ -2210,6 +2245,7 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 		irq_error = platform_get_irq(pdev, 1);
 		if (irq_error < 0)
 			return irq_error;
+		i2c_dev->irq_error = irq_error;
 
 		ret = devm_request_threaded_irq(&pdev->dev, irq_error,
 						NULL,

