Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86EE606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ddgYNGb2;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=FPRPiAoC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VZCgXEGk8gn25schLnnYeMptMnn1cMJhy1WitpRraNA=; b=ddgYNGb21n9EAT
	jCns2CwGvvKYStHlp4ZBU/hyYUPTVbRjYm0DQMdmFhK92Zu34HlDbWSsScz9FBbtd4ltNUrU/Tep/
	6RfhSzjqfU3AAVPeaPbz5t//XUujQfZGp3HRo68bkkZrfxaGmlqM9Lqc2uZ3z/EfNozlhK86OBcL9
	vSc4+rMaXfXLAga30QvmaVmrJ7bTT0wub1J8kcVomeYb66eQtIsuV7KhQja4b4TvzgHyHzDrS2vlI
	XLgmKBdZ4bnB4VBUQI1uEktWMdV3JVcAF3USxOtrhFjz2gdep+Yg7cLVsZcmNzovM71sW0BQcssTz
	V86NJL0AaSx36VzPH0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3mS-00000001KY7-11c3;
	Sun, 25 Oct 2026 19:21:20 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3mN-00000001KRn-19UG;
	Sun, 25 Oct 2026 19:21:16 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJL1Gv515970
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:21:08 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJL1Gv515970
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956068;
	bh=VZCgXEGk8gn25schLnnYeMptMnn1cMJhy1WitpRraNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FPRPiAoCzBC0ddZb05Ox6Fz/koxRK8hNOj7ZmWMpMpuuWJJXb7hczGOsFWMGm84ry
	 Iqn8LNjmYpyHsih7cgwah5EzjUGccxiQUHaQ8TWxl+/dk8uLsA/pwpDaPZRPcwd+1a
	 tZoqbTpylLIa/EYPHjaSi3rfWcHWJ3jAYkDvutyY=
From: christian.koever-draxl@student.uibk.ac.at
To: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 2/2] mmc: meson-gx: allow the core clock phase to be set from DT
Date: Sun, 25 Oct 2026 20:20:59 +0100
Message-ID: <20261025192059.208792-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192059.208792-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192059.208792-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122115_774751_5791BB99 
X-CRM114-Status: GOOD (  11.84  )
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

The core phase is hardcoded to 180 degrees. On an S905W2 board the SD
card fails with CRC errors (-EILSEQ) right after switching to high
speed at 50 MHz.

Sweeping the core phase on the live controller showed that 270 degrees
works on that slot, as the vendor kernel's init_core_phase setting
does. With it the card runs at 50 MHz: 21.7 MB/s sequential read,
6.3 MB/s write, data verified by checksum.

Read the optional amlogic,core-phase-degrees property and keep 180
degrees as the default.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/mmc/host/meson-gx-mmc.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3..42c855248675 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -425,12 +425,25 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	int i, ret = 0;
 	const char *mux_parent_names[MUX_CLK_NUM_PARENTS];
 	const char *clk_parent[1];
-	u32 clk_reg;
+	u32 clk_reg, core_phase = 180;
+
+	/*
+	 * 180 degrees suits most boards, but some only sample reliably at
+	 * high speed with another core phase (the vendor trees carry this as
+	 * "init_core_phase"). The field is in 90 degree steps.
+	 */
+	device_property_read_u32(host->dev, "amlogic,core-phase-degrees",
+				 &core_phase);
+	if (core_phase % 90 || core_phase > 270) {
+		dev_warn(host->dev, "invalid amlogic,core-phase-degrees %u, using 180\n",
+			 core_phase);
+		core_phase = 180;
+	}
 
 	/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
 	clk_reg = CLK_ALWAYS_ON(host);
 	clk_reg |= CLK_DIV_MASK;
-	clk_reg |= FIELD_PREP(CLK_CORE_PHASE_MASK, CLK_PHASE_180);
+	clk_reg |= FIELD_PREP(CLK_CORE_PHASE_MASK, core_phase / 90);
 	clk_reg |= FIELD_PREP(CLK_TX_PHASE_MASK, CLK_PHASE_0);
 	clk_reg |= FIELD_PREP(CLK_RX_PHASE_MASK, CLK_PHASE_0);
 	if (host->mmc->caps & MMC_CAP_SDIO_IRQ)
-- 
2.56.0


