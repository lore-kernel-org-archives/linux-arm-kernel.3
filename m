Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8EF606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 04:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nna/3A46;
	dkim=pass header.d=bren.win header.i=@bren.win header.a=ed25519-sha256 header.s=v1-ed25519-20260901 header.b=Kjo8Smie;
	dkim=pass (2048-bit key, unprotected) header.d=bren.win header.i=@bren.win header.a=rsa-sha256 header.s=v1-rsa-20260901 header.b=iLm4m1DP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DOqKVI6/U3QL5LYFpBxo025cnPh8REghaHnxKILgPgU=; b=Nna/3A46FanpaHOWc1svJOkFsh
	bClG8ktdpEWmZNU2AFXKrXSgO3sZ1FnyzWu14nMf+abP4wA53FPx3gd0eKfg7YsDFnpSecFgfIX/6
	J8TjZoa6+ifyr3gopYbU1POG63kiq58ngrQTlGvlBHKNifnpjfLaiZaUNGmSkcs9ly4rldzC83M4l
	/odi6gRNLoYma93rrbZgbioHfdnrosb3YXC+bP2tPd1dJyGKmOEigS1ykFZ73WJHKP/9qvA49XCuZ
	wzZ0Lk67mPY6NYeTYOSceQRbRmwffwK1XQpx0F7g6e3nTpSEGjI3zkEc3XvbqpBrqdPUm7sSQdBTq
	9XlDUXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHUE-00000008ILo-36Wj;
	Thu, 29 Oct 2026 04:11:34 +0000
Received: from mx1.bren.win ([51.81.56.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHUB-00000008ILN-0gNG;
	Thu, 29 Oct 2026 04:11:33 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=bren.win; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1793247075; bh=DOqKVI6/U3QL5LYFpBxo025
	cnPh8REghaHnxKILgPgU=; b=Kjo8Smiet/vmG/GU93JVZHHKS1Nghkqacjw6RU4aSLTOyvBbyE
	0HBb41hbIk5zDsnPb9zqw3+wmZpm3iRm6eAg==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=bren.win; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1793247075; bh=DOqKVI6/U3QL5LYFpBxo025
	cnPh8REghaHnxKILgPgU=; b=iLm4m1DPX21ijS0LWg9yNs3/tfHMUJMqjF8IQFJqbGYWnGeUuK
	xBF4tBoZb3EfWfFOx4591BKM+H9oqkyXiTrhx2mOu9COhyx4eB9fYKthfQn+MQwSS8xfb5vYrQL
	QXHoHiyMCqEoSTWSsdvPhIpdobuRyJPSMBscVNrTd/tTsXeqkMxD0qjUAIsgkz/knwK2eDfVcZk
	Dfju5GWQO1dfodlBX6YLo8vhGhT1PAdLnptIaClsYrVwEw5JYV8g9W3OKRUFyCzC4OErQHPOKp4
	MnWMYzUI6s6rnG/tadThRZwG6y3rRVAE3zY0jgO1cTpDCvF8ws9B/zpvFy/+PzmTnWw==;
From: "Brendon C." <bren@bren.win>
To: linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Shiji Yang <yangshiji66@outlook.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] clk: mediatek: mt7981: swap MSDC and MSDC_HCK gate parents
Date: Wed, 28 Oct 2026 23:10:41 -0500
Message-ID: <20261029041041.3367084-1-bren@bren.win>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_211131_735331_65900097 
X-CRM114-Status: GOOD (  14.61  )
X-Spam-Score: -2.1 (--)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MT7981B datasheet specifies the storage interface as "eMMC v4.5 @52
MHz 3.3V". MediaTek's SDK and U-Boot device trees give the MSDC
controller CK_TOP_EMMC_208M as its "source" clock (max-frequency 52 MHz
= 208/4) and CK_TOP_EMMC_400M as its "hclk", taken from topckgen
directly, with the infracfg gate only as "source_cg". The mainline
device tree takes both from the infracfg gates instead, and their
parents are the other way round: CLK_INFRA_MSDC_CK from emmc_400m,
CLK_INFRA_MSDC_HCK_CK from emmc_208m.

mtk-sd derives its divider, the reported actual_clock and its data
timeouts from the source rate, so with a device tree asking for 26 MHz
it programs CKDIV=4 and believes the bus runs at 25 MHz while the real
bus clock is 13 MHz, and every clock-derived timeout is sized for a bus
twice as fast as the real one.

On a GL.iNet GL-X3000 (Samsung 8GTF4R eMMC, 8-bit, 3.3 V, HS) this shows
up as msdc_track_cmd_data write data errors (host->error=0x4) on
roughly every 40 MB written, escalating under sustained multi-segment
writes to exhausted retries, "I/O error, dev mmcblk0", lost page writes
and a stopped f2fs overlay. Raw direct reads top out at 11 MB/s where
the vendor kernel reaches 23 MB/s on the same card.

Swap the two parents to match the vendor device trees. With the same
device tree the bus then runs at a real 26 MHz, reads reach 23 MB/s,
and four rounds of a 1.4 GB mixed direct/buffered write stress complete
with zero retries and zero I/O errors, matching the vendor firmware.
hclk's rate is only read for the CQE idle timer, which no MT7981 device
tree enables.

Fixes: 813c3b53b55b ("clk: mediatek: add MT7981 clock support")
Cc: stable@vger.kernel.org
Suggested-by: Shiji Yang <yangshiji66@outlook.com>
Signed-off-by: Brendon C. <bren@bren.win>
---
v3:
- also move CLK_INFRA_MSDC_HCK_CK to emmc_400m, matching the vendor
  device trees' hclk (suggested by Shiji Yang)
- correct the claim that the SDK kernel parents the gate from emmc_208m:
  its gate has mainline's parents, and its device tree takes the rates
  from topckgen directly
- v2: https://lore.kernel.org/all/20261017194308.1541507-1-bren@bren.win/

v2:
- add Fixes: and Cc: stable so the fix reaches 6.12
- v1: https://lore.kernel.org/all/20261017190729.1369302-1-bren@bren.win/

 drivers/clk/mediatek/clk-mt7981-infracfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7981-infracfg.c b/drivers/clk/mediatek/clk-mt7981-infracfg.c
--- a/drivers/clk/mediatek/clk-mt7981-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7981-infracfg.c
@@ -157,8 +157,8 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA1(CLK_INFRA_SPI1_HCK_CK, "infra_spi1_hck", "infra_66m_mck",
 		    14),
 	GATE_INFRA1(CLK_INFRA_FRTC_CK, "infra_frtc", "cb_rtc_32k", 15),
-	GATE_INFRA1(CLK_INFRA_MSDC_CK, "infra_msdc", "emmc_400m", 16),
-	GATE_INFRA1(CLK_INFRA_MSDC_HCK_CK, "infra_msdc_hck", "emmc_208m", 17),
+	GATE_INFRA1(CLK_INFRA_MSDC_CK, "infra_msdc", "emmc_208m", 16),
+	GATE_INFRA1(CLK_INFRA_MSDC_HCK_CK, "infra_msdc_hck", "emmc_400m", 17),
 	GATE_INFRA1(CLK_INFRA_MSDC_133M_CK, "infra_msdc_133m", "sysaxi", 18),
 	GATE_INFRA1(CLK_INFRA_MSDC_66M_CK, "infra_msdc_66m", "sysaxi", 19),
 	GATE_INFRA1(CLK_INFRA_ADC_26M_CK, "infra_adc_26m", "infra_adc_frc", 20),

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.55.0

