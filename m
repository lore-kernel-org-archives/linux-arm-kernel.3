Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D953A606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W5IYXwHo;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=cXwhVmW8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M8r5svHUOM8Y59Gw/fCkU5WvrtoHiBC/aQfKFdM2kxc=; b=W5IYXwHo9ywDGO
	24K+Vos/aLhpTyl7WtCgdH62d1aJlEh+S1BKl+jEqy96+burUgXB1A8z+bYfmSyi7EYxCh2txgH6j
	5yyImrLws22508UqT4VwOuYNEGDGxgWXOSrSOTHUMt3BgxaInj5YoistZgkdDKLY2ujpnSdSCshDC
	gcWBs5vkU5oY4/sKmlDE/MHNowONliq1Umvhcjbb69p2E46iVdr570qzwFEDzwGj0e+KNORMs0JKO
	1VSMudlkstTwdJ1NQg30+dstaHUEO9wW82wDReC/18nSxkP3N7JQ+7zWSQAByy2eRZ4irEjTMPtht
	LwZgo5WkOuyus5fCumbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3kl-00000001JzS-1XLW;
	Sun, 25 Oct 2026 19:19:35 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3kh-00000001Jyj-2CtY;
	Sun, 25 Oct 2026 19:19:33 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJJ1eV514480
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:19:11 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJJ1eV514480
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792955952;
	bh=M8r5svHUOM8Y59Gw/fCkU5WvrtoHiBC/aQfKFdM2kxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cXwhVmW8y6tArl5aWad0YcF5TwCQx8nXbr9US6/nskItq6XqsLREapDVWrdL+Dcog
	 fYa3sB8VLEskFjVvvzIFPBQRCSOEmRTv76A3T+Ir1cpFoVl2QIUGFmggGP3ZUc7Fh2
	 +ck/vYH6QWkBbv/4vVpIAuVXF2psAb6Y7eZl/VWs=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, yu.tu@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 2/2] clk: meson: s4: propagate rate requests through the CEC 32k muxes
Date: Sun, 25 Oct 2026 20:18:52 +0100
Message-ID: <20261025191852.208226-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_121932_188880_65A61B44 
X-CRM114-Status: GOOD (  11.40  )
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

The AO-CEC driver asks its core clock for 32768 Hz. On S4 that request
stops at ceca_32k_sel / cecb_32k_sel: both are muxes without
CLK_SET_RATE_PARENT, so it never reaches the dual divider that can
produce the rate, and probe fails with

  meson-ao-cec fe044000.cec: core clock set rate failed
  meson-ao-cec fe044000.cec: CEC controller registration failed

The equivalent G12A mux, ao_cec_sel, carries the flag, which is why CEC
works there. Add it to both S4 selectors.

The other parent of these muxes is the RTC clock, which must not be
reprogrammed on behalf of CEC, so boards should pin the mux parent to
the dual divider with assigned-clock-parents.

Only the CECA path was tested; CECB is the same defect in the
duplicated block.

Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/clk/meson/s4-peripherals.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 329cd526749e..8e303db6154c 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -407,6 +407,7 @@ static struct clk_regmap s4_ceca_32k_sel = {
 			&s4_rtc_clk.hw
 		},
 		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -514,6 +515,7 @@ static struct clk_regmap s4_cecb_32k_sel = {
 			&s4_rtc_clk.hw
 		},
 		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-- 
2.56.0


