Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D47F60A3803
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rU32nHBf;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=AYYgThW8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3QOSvIP5kH3TW/P9LSpPXkVX5tKHksdBlAOsewQ+L/U=; b=rU32nHBfgWGew2
	AOEurQVjCbQOI2CnQNNLnMrqhisjpJR11BaOHpKpQ3pQ5d+HTMXFHB3bAH2Jg8oXoPHpFfRK+jI+z
	637/6fjabIDmgDdzWI1cLRfXZf/3kV1vqUb4ZTdTrBlT6LIYS1PMpmqO3Hmn6Cc1fvz7oVTl/m3Qw
	Fghpcm0rAewh3+qRg1MEBIlcR8je59pAmOzbnsr3S0ZgRBl1gK6FkBVR6BqR3QTX/NHFLITFzYEgE
	vmdZuFr1F1M4RqIA/tW8S97J875DGGoWzQ9yfZxsYkHiuZpsBMIPsLdX2jjlK6PVeYFIJ8pYYAcpq
	ts9YUDe5AcArtOXecRyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3oh-00000001MNL-1Mps;
	Sun, 25 Oct 2026 19:23:39 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3ob-00000001MGW-33tl;
	Sun, 25 Oct 2026 19:23:36 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJNLM4517824
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:23:26 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJNLM4517824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956207;
	bh=3QOSvIP5kH3TW/P9LSpPXkVX5tKHksdBlAOsewQ+L/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AYYgThW88D9XesaIb7XJlWRn+xspAo5OxjyYlUtH+L1FDuOzji8Y6zPN7354uMBB7
	 Mb2FpQmAIyD/DrcnVgY40xuMYAj7KXCD+uCvVhDYNkZjsIxqKghxLt+gOx3GFI2aqe
	 SInv28GCZLLj8FAGluS6KU4mowbviekjapbWsB/E=
From: christian.koever-draxl@student.uibk.ac.at
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 2/2] media: rc: meson-ir: allow the receiver to wake the system
Date: Sun, 25 Oct 2026 20:23:19 +0100
Message-ID: <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122334_158180_CD8A07F9 
X-CRM114-Status: GOOD (  15.57  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The suspend callback switches the decoder off, so nothing is left to
notice the remote and the receiver can never wake the system.

When the device is a wakeup source, keep the decoder running and arm
its interrupt as a wake interrupt instead. Boards without the
wakeup-source property keep the existing behaviour.

Tested on an S905W2 board: suspend to RAM, the power key on the remote
resumes it.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/media/rc/meson-ir.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 272ebb0d97c8..6b5b5f71a1b4 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -165,6 +165,7 @@ struct meson_ir {
 	const struct meson_ir_param *param;
 	struct regmap	*reg;
 	struct rc_dev	*rc;
+	int		irq;
 	spinlock_t	lock;
 };
 
@@ -475,6 +476,8 @@ static int meson_ir_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	ir->irq = irq;
+
 	if (ir->param->support_hw_decoder)
 		ir->rc = devm_rc_allocate_device(&pdev->dev,
 						 RC_DRIVER_SCANCODE);
@@ -523,6 +526,8 @@ static int meson_ir_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	device_init_wakeup(dev, of_property_read_bool(node, "wakeup-source"));
+
 	dev_info(dev, "receiver initialized\n");
 
 	return 0;
@@ -571,6 +576,9 @@ static __maybe_unused int meson_ir_resume(struct device *dev)
 {
 	struct meson_ir *ir = dev_get_drvdata(dev);
 
+	if (device_may_wakeup(dev))
+		disable_irq_wake(ir->irq);
+
 	if (ir->param->support_hw_decoder)
 		meson_ir_hw_decoder_init(ir->rc, &ir->rc->enabled_protocols);
 	else
@@ -584,6 +592,15 @@ static __maybe_unused int meson_ir_suspend(struct device *dev)
 	struct meson_ir *ir = dev_get_drvdata(dev);
 	unsigned long flags;
 
+	/*
+	 * Leave the receiver running when it is meant to wake the system up,
+	 * otherwise there is nothing left to notice the remote.
+	 */
+	if (device_may_wakeup(dev)) {
+		enable_irq_wake(ir->irq);
+		return 0;
+	}
+
 	spin_lock_irqsave(&ir->lock, flags);
 	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
 	spin_unlock_irqrestore(&ir->lock, flags);
-- 
2.56.0


