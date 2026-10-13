Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738DBCA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 02:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S/CQGMpBuy/7FJjcfHtn4Lxv99je/uyA1AfUbEVnRss=; b=KgWiUjOCiUBtSx1yeumVHrfXG+
	sWlsahYSx9Msqaj4/VLte8SU2SlPaxIKELo2Gdh1k9OXwhC0xW9j/WAbMAppX0TceHYJSEIYhnhXy
	cPdyP9wsWXJJvbGpynQQeO49FpHHDn5IWkgS8VEU0q0nA21k6gl+v5xVslAO9ewfxwimYI2PMERtB
	DflzI/g14fZXa5T7T+cB18UNOyu8hJ3m5ifVjMN4n+IAVDIgGh8QzRNunucHHB8kNUQ8inW14FeMI
	3FaEHaYn5/yz5Fpqhu5Pa7Q2USzzoHJl7fGxCFy7wsxnX8kz3SBTvzdMbTYqyfQOGuq6NREikTz5B
	oZMI6j+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSYh-0000000BpqP-2zhC;
	Tue, 13 Oct 2026 02:48:07 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSYf-0000000Bpq3-2EC3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 02:48:06 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-88bd2b44f3aso1065824b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 19:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791859684; x=1792464484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/CQGMpBuy/7FJjcfHtn4Lxv99je/uyA1AfUbEVnRss=;
        b=Rn2w6DLmOW7X3yt2T5KQUdGKB5Pf0IByPxY/HSaUqvnCVEI2u1Ys+tWkR3I1hCfN0Z
         zRyFidSbRm6RHdxT7Lqn7uaeva1EEcOaIGP8dGNk5lzJa0UAmq889lYtvv4jy6VgPJ3t
         1FL4OkvDvWLl/wgrBOEcziqQ1gSBjvkkRj4o3WJGSgmjjHoT+vdas9uaoDt3/kiZOB4m
         oxcdt37qiu8zhRh838B2xrAxBwOq8EOWDT9U7m9l7h2dfbc/0GkCWHwGcqC/0uC3Q5/m
         DIuzv4m0F4H0p7a1gQZfadle/8A1O1fIGb+EOr17rzFq0RtHdFB9ldJscHYLKcPPNaTY
         o12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791859684; x=1792464484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/CQGMpBuy/7FJjcfHtn4Lxv99je/uyA1AfUbEVnRss=;
        b=bHxteOWdzJh8NGDWzi/+SYdtcnh+HsvDaPxaZJiuDXC1KlbOTy2i3TDxsKekjsjBm4
         ng8GBTSkHorw7GSGmHnUZX9sOsA7dXa57xoXIlCDgjQ4Skx4RoIGKZz47vtivpDD+p6u
         mdJSyUwSOvRvWsTxrCVlqLt73XmYWM30rp7+n/m9LVhMG5BOQ/go7/tdcg1pZuWv14Ya
         8aZZaeaRNIepITrn2rcIqXuw2pyEHtGHLiU4gEV8GdBrkrSp22W91oNgwIfRUobl576G
         RzP3vqAS66U4hi+aGd/f5aTzlzsKhcU0P7C82hyCvWGKVpR4YGWfkINRp0d2yPK7g88A
         0fNA==
X-Forwarded-Encrypted: i=1; AKwUvByg7lOXK1MrP8on69rVqv+neEwblQ4SE2P7Ou0/uGBog0F7ZB4ZZR1dP+8VCUFpIde1KRbmBu9UEebhz1E7BLqh@lists.infradead.org
X-Gm-Message-State: AFq9FYJIiHMM+mYgIRDnai5Npeumb5dZwlKjVjxWTjg66HfpW5LHQJQE
	ln+Q0s4XdJa9kQ5IODvZI9k5hs2AT4N7Ru3HcC5/i8sQtZcwiPINMqsW
X-Gm-Gg: AYBFou18O8kPDwfVSsfG4UKRmn/DPPQGCL3doNLmF+nKzKwVvbPGceVnpd0od8maQ57
	a2cJLa3r8AVvE9yAd6CtNszKIsm8QbX+hmpPsg+GUwxEUBfP3PMZKsZG5dRtOaIV6UN2RK3WZC0
	S+ibcXN1CPDZKqiuBhVE+vjCqvSvW3o4DgPaaq09HwJAkDIXPr9B+nohbegCnuO93Q0ugIMnkn8
	QoqgHo+F3uLUUGVrILq3pEQ6iOOspk0YX2FFzqiHr8cWJs5I21NOYbhzAvfn1Xg3Dm1fV591D1c
	9hbzZ0crjE9e7aZxWyRl7Lt1BQelmLYBMxr+yAAxC1qzPv88nMRakd2P5V1oDmp9TfWBHUoPhh/
	R7gkFrPqpyqbXBlh6LZTfL6Cmjt8/cgHUJQ43nUBbKXpo0drNAjZOi9U27biLjX/YBhKLktKEuh
	xsCp8awErSqKSiW7AJqRRdHipjXUIb4KSOl9vU8G8y4dNUSSfbI1TkmLAoFLdzlKYowzNDRPqKM
	mD/CfPZSZo=
X-Received: by 2002:a05:6a00:951a:b0:882:2b16:c314 with SMTP id d2e1a72fcca58-897c7cd1127mr9507515b3a.52.1791859684155;
        Mon, 12 Oct 2026 19:48:04 -0700 (PDT)
Received: from online.mioffice.cn ([2408:8607:1b00:8:5e2a:b6c:f432:a6f3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c42b4549sm4466018b3a.44.2026.10.12.19.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:48:03 -0700 (PDT)
From: Pengfei Zhang <zhangfeionline@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
	EricChan <chenchuangyu@xiaomi.com>,
	Simon Horman <horms@kernel.org>,
	zhangpengfei16@xiaomi.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: stmmac: xgmac: do not treat TBU as a TX event
Date: Tue, 13 Oct 2026 10:47:47 +0800
Message-ID: <20261013024747.2688984-1-zhangfeionline@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_194805_574089_7F362315 
X-CRM114-Status: GOOD (  15.84  )
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

Commit 8d07a7930434 ("net: stmmac: xgmac: Do not enable TBU interrupt")
removed TBUE from the default DMA interrupt mask, but did not remove the
TBU check from dwxgmac2_dma_interrupt().

TBU is set whenever a TX channel runs out of descriptors. Since TBUE is
not enabled and only enabled bits are cleared, the TBU status bit is
never cleared. As a result, TBU stays set on every idle TX channel,
regardless of whether there is any TX traffic.

With a shared interrupt, stmmac_dma_interrupt() checks all channels,
so every interrupt from any source schedules TX NAPI on every idle TX
channel.

Only use TI to trigger TX processing.

Fixes: 8d07a7930434 ("net: stmmac: xgmac: Do not enable TBU interrupt")
Signed-off-by: Pengfei Zhang <zhangfeionline@gmail.com>
---
Tested on a board with 8 RX/TX DMA channels behind one shared
interrupt. A peer sends 10k UDP packets/s to the board and the board
sends nothing back, so there should be almost no TX work. Every idle
channel reads DMA_CH_STATUS 0x4 (TBU only).

Per second, averaged over 10 s:

                       before    after
  hw interrupts          9071     8580
  tx_normal_irq_n       72572        1
  tx_clean             ~73000        9

- hw interrupts: the shared interrupt line, from /proc/interrupts.
  Unchanged, the RX watchdog sets the rate.
- tx_normal_irq_n (ethtool -S): how often dwxgmac2_dma_interrupt()
  returned handle_tx. Before the fix every interrupt reports it for
  all 8 channels.
- tx_clean (ethtool -S): stmmac_tx_clean() runs, i.e. TX NAPI polls.
  Each spurious handle_tx schedules one. What is left after the fix
  is real TX and the TX coalesce timer. The "before" value is from a
  separate run with the same setup.

No packet loss before or after.

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index ff83858ebc..0a6e82a155 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -346,7 +346,7 @@ static int dwxgmac2_dma_interrupt(struct stmmac_priv *priv,
 		u64_stats_update_end(&stats->syncp);
 		ret |= handle_rx;
 	}
-	if (likely(intr_status & (XGMAC_TI | XGMAC_TBU))) {
+	if (likely(intr_status & XGMAC_TI)) {
 		u64_stats_update_begin(&stats->syncp);
 		u64_stats_inc(&stats->tx_normal_irq_n[chan]);
 		u64_stats_update_end(&stats->syncp);
-- 
2.54.0


