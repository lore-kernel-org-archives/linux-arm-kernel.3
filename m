Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7345A606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WBj2nJ4m;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=H4gaF3kq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gJc6Vw+f+t179NkK673wH0DPl0vWcqe86Z5EpJ6b2Pg=; b=WBj2nJ4mDp4OLweBBqRGDSy1NZ
	98CzAMSWGk9p5+9QP3xyWC/OEjYPeXfksftU53+b4ylmweSVaOh3iJm53SkDJL9yXbtk6119Z/S/d
	zaFJ7ap/rcW2pqQWhz8QnDzaMTM99+AHJBuxCPyAItGizy+ijDRYynFUYcxepI4SdMgv5MA6co2/i
	ds9jWEQSD18Me24x5TwH8sC2iN3Us59W7nClOPbK64y4yFfP5QzfY9WYBaBs5eMvJYclVE8atrxIC
	qpdT5TuALcOtA+E7DIIyj64xkt/hGuXrTB4GBX7IByl1532LQxbHHlQdSnjq/UV1lJv41rDam7oQ/
	tVSt40VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH4S-0000000BuRW-0zru;
	Fri, 06 Nov 2026 10:21:20 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH4O-0000000BuQm-3SX7;
	Fri, 06 Nov 2026 10:21:18 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AL6f81868854
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:21:09 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AL6f81868854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960470;
	bh=gJc6Vw+f+t179NkK673wH0DPl0vWcqe86Z5EpJ6b2Pg=;
	h=From:To:Cc:Subject:Date;
	b=H4gaF3kqEW31uWchGw9J23gcpiLOH9aisl4OpFNaa48GupXaE21ApN4y4llIUU3YO
	 2hU31zTGvikSXV01/u5dv1sFeSDZQgdOLK06Y7LSX5Ovzorn/rOunt2D8ov4gBZ33i
	 tHbLls+gUAq32350bm0y8xzRNDbqK8zHhEULtyL4=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, hverkuil@kernel.org, mchehab@kernel.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2] media: cec: meson: ao-cec: enable the controller clock at probe
Date: Fri,  6 Nov 2026 11:21:05 +0100
Message-ID: <20261106102105.47244-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_022117_196982_3179130F 
X-CRM114-Status: GOOD (  18.94  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The CEC core calls .adap_log_addr() before .adap_enable(), so the first
register access can happen while the controller is still in power-off
mode (CEC_GEN_CNTL clock field 0). The probe only pulses the reset bit,
leaves the clock field at zero, and does so only after the adapter has
been registered, when the core may already be using it.

On S4 an access to the powered-off controller never completes: it
stalls the AO bus and hard-hangs the SoC. This triggers on every HDMI
unplug, because that invalidates the physical address and makes the
core rewrite the logical address.

Reset the controller and leave its clock running before the adapter is
registered, as .adap_enable() would.

Fixes: 7ec2c0f72cb1 ("media: platform: Add Amlogic Meson AO CEC Controller driver")
Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
Changes in v2:
- Set up the controller before cec_notifier_cec_adap_register() and
  cec_register_adapter(), not after: once registered, the core may call
  .adap_log_addr() straight away (reported by the Sashiko AI review).
- Link to v1: https://lore.kernel.org/r/20261025192046.208710-1-christian.koever-draxl@student.uibk.ac.at

Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

 drivers/media/cec/platform/meson/ao-cec.c | 26 +++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/platform/meson/ao-cec.c b/drivers/media/cec/platform/meson/ao-cec.c
index 2df0d3743077..4c03c829fe86 100644
--- a/drivers/media/cec/platform/meson/ao-cec.c
+++ b/drivers/media/cec/platform/meson/ao-cec.c
@@ -660,6 +660,28 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 
 	device_reset_optional(&pdev->dev);
 
+	/*
+	 * Setup Hardware, before the adapter is registered: from then on the
+	 * CEC core may call .adap_log_addr() at any time.
+	 *
+	 * Leave the controller with its gated clock running. The CEC core
+	 * calls .adap_log_addr() before it ever calls .adap_enable(), so the
+	 * first register access happens while the block would otherwise still
+	 * be in power-off mode (CEC_GEN_CNTL clk field == 0). On Amlogic S4
+	 * that access never completes: it stalls the AO bus and hard-hangs the
+	 * SoC - every CPU stops, IRQs included - which happens on every HDMI
+	 * hot-unplug, because that is what invalidates the CEC physical
+	 * address.
+	 */
+	writel_relaxed(CEC_GEN_CNTL_RESET |
+		       FIELD_PREP(CEC_GEN_CNTL_CLK_CTRL_MASK,
+				  CEC_GEN_CNTL_CLK_ENABLE),
+		       ao_cec->base + CEC_GEN_CNTL_REG);
+	fsleep(100);
+	writel_relaxed(FIELD_PREP(CEC_GEN_CNTL_CLK_CTRL_MASK,
+				  CEC_GEN_CNTL_CLK_ENABLE),
+		       ao_cec->base + CEC_GEN_CNTL_REG);
+
 	ao_cec->pdev = pdev;
 	platform_set_drvdata(pdev, ao_cec);
 
@@ -674,10 +696,6 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto out_probe_notify;
 
-	/* Setup Hardware */
-	writel_relaxed(CEC_GEN_CNTL_RESET,
-		       ao_cec->base + CEC_GEN_CNTL_REG);
-
 	return 0;
 
 out_probe_notify:

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


