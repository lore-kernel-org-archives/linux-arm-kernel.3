Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD40606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=07HpDdRI;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=rhS2nRx4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=unrFjlsjJKQ+CAxsdDw8UmfmI2hhUuRrRoO90qx5ffY=; b=07HpDdRIJI/kQvYLaZR7jImv9w
	dR2zx/UteiV2m4AvVPtWhs2Ud8cdCgC4rUavrLLEAu9nkTjhtSSmkzL1OjdMjpyzrOaJQli1xFugd
	lfdBmrt48fDrb2wk0Jkk7oO99YkCnXVp9hxCVIZtGE/zeqxwX6F7v2QwFa+iOo/cv26YjbOjjeIhi
	hjrIgbSNAcvCfri1qqZV4P+FPFZdht0HzKj3SwPPjJtGmK9oI2Cc3GolvdDoIzk3xh3hqynlrIG7P
	j2i5+DXc0fuPubbcujSj+bhkWv17E6a9OYYuPh8/W8lDIlz3AfPfvKR1aYg9b2QP1RQLPQykU8eM0
	RQtRKJvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2F-0000000BtCk-2yXu;
	Fri, 06 Nov 2026 10:19:03 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2A-0000000BtBE-2lB1;
	Fri, 06 Nov 2026 10:19:01 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AIUcj1863214
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:18:33 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AIUcj1863214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960314;
	bh=unrFjlsjJKQ+CAxsdDw8UmfmI2hhUuRrRoO90qx5ffY=;
	h=From:To:Cc:Subject:Date;
	b=rhS2nRx4GSMAraR5KqqIklHPeFISqe3zTmC67jloL28JDxNwMRydfN1TAoXFL0F18
	 v7FsMjpcQ6O6ZeWR7SEQ71af9N5USjbceKxleo2/GgP0eM+gomiYknfhwUHuOrDrev
	 ZkoT641kzB4RwFY/ndAxw5mPWYN39qnxUEiYWeBQ=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, yu.tu@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2] clk: meson: s4: keep the PWM clocks off vid_pll
Date: Fri,  6 Nov 2026 11:18:27 +0100
Message-ID: <20261106101827.46467-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021859_486437_DB9716FE 
X-CRM114-Status: GOOD (  17.53  )
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

vid_pll is dedicated to the video path and is reprogrammed on display
mode changes, so it should not be offered to the PWM devices, even
though the hardware allows it. On an S905W2 board PWM channels ended up
on it, which broke the PWM CPU regulator and the 32.768 kHz clock of the
SDIO wifi chip.

Drop vid_pll from the PWM parents and keep the remaining inputs on their
register values with a mux table.

Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
Changes in v2:
- Rewrote the commit message (Jerome): no claims about how the PWM
  driver picks its parent, only that vid_pll belongs to the video path
  and should not be offered to the PWM devices.
- Dropped "clk: meson: s4: propagate rate requests through the CEC 32k
  muxes": the 32768 Hz rate is now set with assigned-clock-rates in the
  DT next to the parents (Jerome), so the series is down to this patch.
- Link to v1: https://lore.kernel.org/r/20261025191852.208226-2-christian.koever-draxl@student.uibk.ac.at

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

 drivers/clk/meson/s4-peripherals.c | 34 +++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index ba41fcd90588..e5e5ff979efd 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -2588,51 +2588,61 @@ static struct clk_regmap s4_spicc0_en = {
 	},
 };
 
-/* PWM Clock */
+/*
+ * PWM Clock
+ *
+ * vid_pll (mux input 1) is left out: it belongs to the video path and is
+ * reprogrammed on display mode changes.
+ */
+static u32 s4_pwm_parents_table[] = { 0, 2, 3 };
+
 static const struct clk_parent_data s4_pwm_parents[] = {
 	{ .fw_name = "xtal", },
-	{ .hw = &s4_vid_pll.hw },
 	{ .fw_name = "fclk_div4", },
 	{ .fw_name = "fclk_div3", },
 };
 
-static S4_COMP_SEL(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 9, 0x3, s4_pwm_parents);
+#define S4_PWM_SEL(_name, _reg, _shift) \
+	MESON_COMP_SEL(s4_, _name, _reg, _shift, 0x3, s4_pwm_parents, \
+		       s4_pwm_parents_table, 0, 0)
+
+static S4_PWM_SEL(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 9);
 static S4_COMP_DIV(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 0, 8);
 static S4_COMP_GATE(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 8);
 
-static S4_COMP_SEL(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 25);
 static S4_COMP_DIV(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 16, 8);
 static S4_COMP_GATE(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 24);
 
-static S4_COMP_SEL(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 9);
 static S4_COMP_DIV(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 0, 8);
 static S4_COMP_GATE(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 8);
 
-static S4_COMP_SEL(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 25);
 static S4_COMP_DIV(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 16, 8);
 static S4_COMP_GATE(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 24);
 
-static S4_COMP_SEL(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 9);
 static S4_COMP_DIV(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 0, 8);
 static S4_COMP_GATE(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 8);
 
-static S4_COMP_SEL(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 25);
 static S4_COMP_DIV(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 16, 8);
 static S4_COMP_GATE(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 24);
 
-static S4_COMP_SEL(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 9);
 static S4_COMP_DIV(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 0, 8);
 static S4_COMP_GATE(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 8);
 
-static S4_COMP_SEL(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 25);
 static S4_COMP_DIV(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 16, 8);
 static S4_COMP_GATE(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 24);
 
-static S4_COMP_SEL(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 9);
 static S4_COMP_DIV(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 0, 8);
 static S4_COMP_GATE(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 8);
 
-static S4_COMP_SEL(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 25);
 static S4_COMP_DIV(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 16, 8);
 static S4_COMP_GATE(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 24);
 

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


