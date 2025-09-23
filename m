Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1387ACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 13:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vdy6JqNhDJaqHVaoAyaX0a3gRBizkC3DPHCz8LDeFwk=; b=PXkFralOre5x33NkGCv4KlyIgD
	EqblNUf4VakcTIKG2fxWWmQ+W9j9SCcIV2pVA78I2q3Q8XsBp6Al4eVUJxnCGNqohyARUdg4jjdNZ
	utXgunJ9wvJtIavQKQOAUVlk9V5GqUfKJvJK3W5W4e2e/EWM6iU9YN/ucIAFFrHwNf6gDuX77eUc2
	1PKKbWR6jNybhSSJi/h8tjJIjVn6s36tDT0AU1HKo3V+nVW76tvaqM20kGslzviTDnElH9Qxol1kw
	yF+YBw6p9oK62Ih+URd4UifhuyM1BW+fvShAONEYl/vPQyxULjEtTsoWPam8zbEGt1GNOUaJVMAoM
	7tLdFDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12q8-0000000DSUD-1yU1;
	Tue, 23 Sep 2025 13:13:52 +0000
Received: from mail-gw02.astralinux.ru ([93.188.205.243])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12q5-0000000DSS2-2xIT;
	Tue, 23 Sep 2025 13:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
	s=mail; t=1758633222;
	bh=LRQzmBa8kkt8wlTndgDV7ugHOqHHHTZMSQVXCNhqLHk=;
	h=From:To:Cc:Subject:Date:From;
	b=EBOqwOt8paXaBGErZhHhM84s9xKpv4sLSQ1tgt+bMJHQilcDY9munQeTy2UuuEpuR
	 b8h5eqtg9dCT5NpzkNEA0h0auuHP/H2zxvnnRnkLflqs3DXWu7wzmec6f16uFad7/D
	 4PKZXM1gokJJ4Qq1Y80gzypLf9jjreJMsImeTZxbZh/BRX0z+nq6IPOoKmOpS81zTu
	 vrz/ukwrj+8+kc/2PD65+jBs38IIcRnQiaHJGdhQ0pLKEu23YzQJoWBt5tM3NqVUfc
	 +8zNiAQJtcpANAhpa+WSUxb/uBIj7mZdvZQXhrnvi+5NBCiFqU61MYDEmZVprWOP3W
	 V5fje/Ghtca5A==
Received: from gca-msk-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw02.astralinux.ru (Postfix) with ESMTP id 0A2201FADA;
	Tue, 23 Sep 2025 16:13:42 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.177.185.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
	Tue, 23 Sep 2025 16:13:40 +0300 (MSK)
Received: from rbta-msk-lt-169874.astralinux.site (rbta-msk-lt-169874.astralinux.ru [10.198.22.153])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4cWL5Z2B5Xz2xBx;
	Tue, 23 Sep 2025 16:13:38 +0300 (MSK)
From: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Brian Masney <bmasney@redhat.com>,
	Eric Anholt <eric@anholt.net>,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] clk: bcm: fix potential int overflow in bcm2835_measure_tcnt_mux
Date: Tue, 23 Sep 2025 16:12:20 +0300
Message-Id: <20250923131219.163463-1-mdmitrichenko@astralinux.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: mdmitrichenko@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 67 0.3.67 f6b3a124585516de4e61e2bf9df040d8947a2fd5, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;astralinux.ru:7.1.1;new-mail.astralinux.ru:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 196520 [Sep 23 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2025/09/23 12:50:00 #27847861
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_061350_260962_91F5B216 
X-CRM114-Status: GOOD (  11.44  )
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

If the value in CM_TCNTCNT is close to 2^24 (24 is the width of
CM_TCNTCNT), then multiplication (count * 1000) will lead to integer
overflow.

Make bcm2835_measure_tcnt_mux return a u64 value instead of an unsigned
long and cast count to u64 before multiplying it by 1000 to avoid
overflow. Also correct the format string at bcm2835_clock_on for showing
debug data, which includes the bcm2835_measure_tcnt_mux call result.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 3f9195811d8d ("clk: bcm2835: Add leaf clock measurement support, disabled by default")
Signed-off-by: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
---
 drivers/clk/bcm/clk-bcm2835.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 02215ea79403..9ffef2b0e820 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -345,7 +345,7 @@ static inline u32 cprman_read(struct bcm2835_cprman *cprman, u32 reg)
 /* Does a cycle of measuring a clock through the TCNT clock, which may
  * source from many other clocks in the system.
  */
-static unsigned long bcm2835_measure_tcnt_mux(struct bcm2835_cprman *cprman,
+static u64 bcm2835_measure_tcnt_mux(struct bcm2835_cprman *cprman,
 					      u32 tcnt_mux)
 {
 	u32 osccount = 19200; /* 1ms */
@@ -394,7 +394,7 @@ static unsigned long bcm2835_measure_tcnt_mux(struct bcm2835_cprman *cprman,
 out:
 	spin_unlock(&cprman->regs_lock);
 
-	return count * 1000;
+	return (u64)count * 1000;
 }
 
 static void bcm2835_debugfs_regset(struct bcm2835_cprman *cprman, u32 base,
@@ -1093,7 +1093,7 @@ static int bcm2835_clock_on(struct clk_hw *hw)
 	 */
 	if (data->tcnt_mux && false) {
 		dev_info(cprman->dev,
-			 "clk %s: rate %ld, measure %ld\n",
+			 "clk %s: rate %ld, measure %llu\n",
 			 data->name,
 			 clk_hw_get_rate(hw),
 			 bcm2835_measure_tcnt_mux(cprman, data->tcnt_mux));
-- 
2.39.2


