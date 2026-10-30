Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756AD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 21:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BEGZsRpQ;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=CWx+wXNf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qJLnpzBdDvSSAoILaAVEaPeTNJiYyTIY+1V0RNSuyBI=; b=BEGZsRpQRyTPVlasUAgGP+GdoA
	zCEGW8TG9mUhbZtz44jWnf2kHo0xaf6fEcU6BS59ECUg3qNAVxgyH65FC14IgEwa9onpDsWIXchhM
	PnCB5uA7aFa+NRNhZomEg+YVwlOsQyBzBubYlK0n1LKI2BGJgv4O/vclOrp0xxeVc3fqR8UNK3pKq
	vSth1VZ6vD9ag+h9FiMdyIwhZ+0qG4PUqB6EW9Mbsq14dfhcEozxDKFYW8H5Ihg7iupKSe71gEzFb
	rVwZjXaNltD9NjC02LxAXg8JAnqSIdPFveTi40Qc5HOYbvOB4Zd+mHhE+rINpkuNuSTS5tY5yHGz2
	9WF/D90g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMuYb-0000000CeAZ-2tbp;
	Fri, 30 Oct 2026 21:54:41 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMuYY-0000000CeAB-2z3o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 21:54:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D4EA10C09B;
	Fri, 30 Oct 2026 22:54:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793397271; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=qJLnpzBdDvSSAoILaAVEaPeTNJiYyTIY+1V0RNSuyBI=;
	b=CWx+wXNfQf9XQkAogInTZgRusncfRZFc34fhAEwItQl9pzzNdNeOPxiieTbvhqmYI4XhIf
	rt53hkH4UFsl4hnkeYHOF1T5Lq4W21AeC218bpr8ua887h3G2mlWypdVyY6tthwEp6+Eem
	ogS9w87RPIh58KmF7Htfd82VwGez2C+kF0qmtqKkv2lkMQQaGxqztkjxFYDRxsB/+gm/VW
	gcNDd0/jjCR/SUhK/ir+JajpAFI+jjQKLMNOCjrpHc/vtiJeavY+7/K4qth3g43FPaVkYj
	kt8hMeKO1wfFgCF5j/IxYTy9lHzmWJ37P0/Mlip8CSL2XuSjXezFcm3oZZfR5A==
From: Marek Vasut <marex@nabladev.com>
To: linux-mmc@vger.kernel.org
Cc: Christophe Kerello <christophe.kerello@foss.st.com>,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] mmc: mmci: stm32: handle mmc power up
Date: Fri, 30 Oct 2026 22:53:38 +0100
Message-ID: <20261030215427.488298-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_145438_986378_EF66C4C0 
X-CRM114-Status: GOOD (  11.12  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christophe Kerello <christophe.kerello@foss.st.com>

Manage MMC POWER UP state like MMC POWER OFF state. In case of low
power use cases, it will avoid random initialization timeout. This
fixes a failure to switch DDR52 eMMC to 8 bit mode due to -EILSEQ
returned from mmc_get_ext_csd() in mmc_compare_ext_csds() called
from mmc_select_bus_width() after Standby1 suspend/resume cycle.

Fixes: 46b723dd867d ("mmc: mmci: add stm32 sdmmc variant")
Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
Marek: Update commit message
---
 drivers/mmc/host/mmci_stm32_sdmmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index 9dc51859c2e51..659a5040729e9 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -368,7 +368,8 @@ static void mmci_sdmmc_set_pwrreg(struct mmci_host *host, unsigned int pwr)
 	if (dlyb && dlyb->ops->set_input_ck)
 		dlyb->ops->set_input_ck(dlyb);
 
-	if (ios.power_mode == MMC_POWER_OFF) {
+	if (ios.power_mode == MMC_POWER_OFF ||
+	    ios.power_mode == MMC_POWER_UP) {
 		/* Only a reset could power-off sdmmc */
 		reset_control_assert(host->rst);
 		udelay(2);
-- 
2.53.0


