Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1237606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=toht2Wa4;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=OjAlI7I3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ra9w+zWZgwoCxB8YuqKLO7gy/hnQxYG7gsDPgEiLLpU=; b=toht2Wa4UEJLEE
	30CRUteRW1OUHiHNqqCR1xD1wbxe5ex+BSpD5WwCya4hrHQy+OQcBEpUgQWXN5O6Y0rtCnvLe71fP
	iDPRydPlB7D6fn0yRIwjfYX3+6rgkhDZMZYOjXi02r/ADnXzDjLEpQGoqdFKzTiiLPH4YbpYyhSsL
	1y3doDklQzSIwjoMy30AFZVKeAiQyznqZe2Ar22Sm1Sykj0GS/67Ju2wFs1NslGu+L4b81H3sCIzT
	/Jnn5DKEgxL5ijXUA/3xXnk02DFGDO96xwtRlSnoEF0POrNTsaQq6G2iCxRiql8wHYTlQEpksC/LV
	gRIBNfAlYWOvWvciiZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7rn-0000000DHid-3gZ4;
	Sat, 31 Oct 2026 12:07:23 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7rg-0000000DHf4-3oms
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:07:18 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id C9F8F240029
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:07:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793448434;
	bh=Ra9w+zWZgwoCxB8YuqKLO7gy/hnQxYG7gsDPgEiLLpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=OjAlI7I37GMxg1ZeHT8HQkXDsSmLMMkV7waYDyjYo0Y1HZ9vQYV7H69rlnUF+vtoy
	 87i4JOAjwn0lLHfeyNLLhYYb+oeJvv4XSBQ9RuyVZ5SDqdCrFWfKlSzVC7VhtX1ZMY
	 cz6495e9GBehHoyQQbp7Tcgr0DFXAzWQThSqlNWdXn6Q0oeNvR9uT+4mU3btkyMuHo
	 Q3KdN+9Q7JcBK7jWz3xgB8zNckqh38qIzxTLEh+gWZbPmhtCbjqsknKz2HtVunDUOV
	 r3tLlTt9IBfbKBJH23CDyOmElTtDAcYj373hQrUm3ceEWN6md/AXsCbTdYDxrY2JF+
	 1tskkiQIIUrHQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jGxXx0lm9z6v26;
	Sat, 31 Oct 2026 13:07:13 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Cc: Christophe Kerello <christophe.kerello@foss.st.com>,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Yann Gautier <yann.gautier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 3/3] mmc: mmci: stm32: lock the STM32MP25 delay block again before tuning
Date: Sat, 31 Oct 2026 12:07:14 +0000
Message-ID: <20261031120700.42576-4-mateusz.nowicki@posteo.net>
In-Reply-To: <20261031120700.42576-1-mateusz.nowicki@posteo.net>
References: <20261031120700.42576-1-mateusz.nowicki@posteo.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_050717_103838_9F62854C 
X-CRM114-Status: GOOD (  14.07  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Once locked, the DLL of the delay block follows voltage and temperature
but not a change of the clock frequency. RM0457 requires the DLL to be
disabled and locked again after a frequency switch.

sdmmc_dlyb_mp25_enable() only sets EN, so a DLL left enabled by an
earlier tuning keeps its old lock. On the STM32MP257F-DK eMMC, switching
from DDR52 to HS200 then made the tuning pick a wrong phase in 9 of 18
tries. With this change the phase was correct in all 12 tries.

Clear EN and wait for LOCK to drop before enabling the DLL again.

Fixes: b5c3eb385797 ("mmc: mmci: stm32: add delay block support for STM32MP25")
Cc: stable@vger.kernel.org
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 drivers/mmc/host/mmci_stm32_sdmmc.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index d74efdff6ac2..2310dba75c35 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -541,11 +541,21 @@ static int sdmmc_dlyb_mp15_prepare(struct mmci_host *host)
 static int sdmmc_dlyb_mp25_enable(struct sdmmc_dlyb *dlyb)
 {
 	u32 cr, sr;
+	int ret;
 
+	/*
+	 * The DLL tracks voltage and temperature but not a frequency switch
+	 * (RM0457), start the lock sequence again on the current clock
+	 */
 	cr = readl_relaxed(dlyb->base + SYSCFG_DLYBSD_CR);
-	cr |= DLYBSD_CR_EN;
+	writel_relaxed(cr & ~DLYBSD_CR_EN, dlyb->base + SYSCFG_DLYBSD_CR);
+	ret = readl_relaxed_poll_timeout(dlyb->base + SYSCFG_DLYBSD_SR,
+					 sr, !(sr & DLYBSD_SR_LOCK), 1,
+					 DLYBSD_TIMEOUT_1S_IN_US);
+	if (ret)
+		return ret;
 
-	writel_relaxed(cr, dlyb->base + SYSCFG_DLYBSD_CR);
+	writel_relaxed(cr | DLYBSD_CR_EN, dlyb->base + SYSCFG_DLYBSD_CR);
 
 	return readl_relaxed_poll_timeout(dlyb->base + SYSCFG_DLYBSD_SR,
 					   sr, sr & DLYBSD_SR_LOCK, 1,
-- 
2.56.0


