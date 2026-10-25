Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD1A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DcV/Fzh7;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=fmtS+6Dn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=75Y6P3mxr5SFh4Kr/TaY5+EyHwuhs2vmH3vTMgy6sd0=; b=DcV/Fzh7+aqGbmFZ2CzduOmPwq
	pQ8IOBuYLGYpGpYgwu/S9ekh62jQEPoQUXe5jlEIBIpjcMp/xQvb42JNs3aJvQlXz36N8Kt3x0j4x
	hqBRiCralUCJ1XDIov8G8JotZCfrhhxMG4EoG3wbgBTNBb3NzBog9VdRUy7yRdmtHERN2gVc84iFF
	0FpZ/c51Ga7vuJTTE+sWIRRn7+MfhzCmWIcKHOPmhczmwrK+cnHKXpDgOm/E1zLX2W6KYfyDYC+kg
	9VCRuG5lRw+NFB4/Zy5fpRE7bPn/8QbuQJiamWl2ORslTkXHDYcZNaAPqJ43/2ubOzZLx/UrqeQ7u
	faJFJH7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3mA-00000001KOD-0Zi3;
	Sun, 25 Oct 2026 19:21:02 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3m7-00000001KNM-1iOG;
	Sun, 25 Oct 2026 19:21:00 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJKmsL515844
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:20:52 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJKmsL515844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956052;
	bh=75Y6P3mxr5SFh4Kr/TaY5+EyHwuhs2vmH3vTMgy6sd0=;
	h=From:To:Cc:Subject:Date;
	b=fmtS+6DnQnxdLoC9LXUAPC6Bg1qkXx+UyFJenZYDVVjWZqIywInzr3jKJbpf14NGo
	 106vHdwuGOgQYVjgW54nW/xlh9wJkVzGgJ5W1QszLR18EsmU1L9zuA3nllLcP3hRpb
	 LwbvOLIJZZ+8OuYd6AWZYminhro6O6XsMaLbnt/E=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, hverkuil@kernel.org, mchehab@kernel.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH] media: cec: meson: ao-cec: enable the controller clock at probe
Date: Sun, 25 Oct 2026 20:20:46 +0100
Message-ID: <20261025192046.208710-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122059_778614_0D508FC3 
X-CRM114-Status: GOOD (  16.34  )
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

The CEC core calls .adap_log_addr() before .adap_enable(), so the first
register access can happen while the controller is still in power-off
mode (CEC_GEN_CNTL clock field 0). The probe only pulses the reset bit
and leaves the clock field at zero.

On S4 an access to the powered-off controller never completes: it
stalls the AO bus and hard-hangs the SoC. This triggers on every HDMI
unplug, because that invalidates the physical address and makes the
core rewrite the logical address.

Leave the controller with its clock running after the reset at probe,
as .adap_enable() would.

Fixes: 7ec2c0f72cb1 ("media: platform: Add Amlogic Meson AO CEC Controller driver")
Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
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

 drivers/media/cec/platform/meson/ao-cec.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/platform/meson/ao-cec.c b/drivers/media/cec/platform/meson/ao-cec.c
index 2df0d3743077..dd4d91d7b927 100644
--- a/drivers/media/cec/platform/meson/ao-cec.c
+++ b/drivers/media/cec/platform/meson/ao-cec.c
@@ -674,8 +674,25 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto out_probe_notify;
 
-	/* Setup Hardware */
-	writel_relaxed(CEC_GEN_CNTL_RESET,
+	/*
+	 * Setup Hardware.
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
 		       ao_cec->base + CEC_GEN_CNTL_REG);
 
 	return 0;

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


