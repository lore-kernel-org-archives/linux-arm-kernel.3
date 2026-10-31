Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18CA606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o3iU7r47;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=dMplOwLY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jyk3rgi6eH2uBTITUiOecFzmCK/Ol922slxYpE+PPRs=; b=o3iU7r47TR/KIa
	e7hWM6aJsrQsWpWHv7fGdwB3DVYvNcY3ZpMyYxCjt3ooglb92ote/bzH+iiriTxSdm+gzv4URM6P8
	3uW1vYVHUfwsTfMc9DEgujfNIClWB/SkI/Dqi1yAyxfmhLdl8C3+xB3aJkSP7ufs5kdKHTxEsibYB
	23/tjsDa2p/Dkd0nGPbkrLknmwSvrIU8bNBlq5eDJoWzQ7ayMCAH8bBxLcBUtbHNdJXYMKkRWeXY7
	zqcn5bqd22EvzscDtdf4bHi37b8VBw+wIlfYnlOTQ0QjA+0PuX5z1wpbowDdjuZgu0xoNTfLl+WlA
	d5fztuJTAy8jeCCmZaeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7rn-0000000DHiJ-39xz;
	Sat, 31 Oct 2026 12:07:23 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7rf-0000000DHdv-1Iv9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:07:16 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 55591240126
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:07:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793448433;
	bh=jyk3rgi6eH2uBTITUiOecFzmCK/Ol922slxYpE+PPRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=dMplOwLY0aDJxLldmkgQcF+xhl9AGuLGcEQamfFFe4Y5i5Il9SE0PX128i4v/oUt3
	 89JYyQjemRG79JHTl7kpwn965bn5mVrr+FTLhwbkJzJPnJf9SaK6mX7whWon5q6CpV
	 P/3FbNxLvfjLLB3tZkKVJWdVFc/LlxKL5DmXzvmYooSd1N+afa7nqQvGDWhiIPhBZB
	 tbUOFvxFdlbM1yYCvgGMx0Lu38/CuCkeSw+bIMF02SlbboZ7gkPl0QRK3k8xadBAa0
	 6mbkLG7XpqHnlwoC2uU0zKnieWK6wHvls/5ZDPPuoCygkbT51oGSW5JddYMv9gQb7+
	 9BhKrVEa+/Djg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jGxXv3CL4z6v1f;
	Sat, 31 Oct 2026 13:07:11 +0100 (CET)
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
Subject: [PATCH 2/3] mmc: mmci: stm32: do not use NEGEDGE in HS200 mode
Date: Sat, 31 Oct 2026 12:07:12 +0000
Message-ID: <20261031120700.42576-3-mateusz.nowicki@posteo.net>
In-Reply-To: <20261031120700.42576-1-mateusz.nowicki@posteo.net>
References: <20261031120700.42576-1-mateusz.nowicki@posteo.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_050715_496167_9C8D425E 
X-CRM114-Status: GOOD (  13.32  )
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

RM0457 marks NEGEDGE as not applicable in HS200. With a clock divider it
corrupts multi-block writes: on the STM32MP257F-DK (st,neg-edge, 200 MHz
kernel clock, HS200 at 100 MHz) written data read back different. The
same writes are correct without NEGEDGE.

Fixes: 36240ef8665b ("mmc: mmci: add hs200 support for stm32 sdmmc")
Cc: stable@vger.kernel.org
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
RM0457 describes HS200 only without a divider. If HS200 through a
divider should not be used at all, the alternatives for the DK are:

- Drop mmc-hs200-1_8v from the DK device tree. DDR52 is tested and only
  about 5% slower than HS200 at 100 MHz (read/write 78/66 MiB/s against
  82/68 MiB/s).
- Drop st,neg-edge from the DK device tree. This also changes DDR52,
  which was not tested without NEGEDGE.
- Set the SDMMC2 kernel clock to 150 MHz in the firmware (OP-TEE). HS200
  then runs without a divider (tested, 119/86 MiB/s).

Which way is preferred?

 drivers/mmc/host/mmci_stm32_sdmmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index 9dc51859c2e5..d74efdff6ac2 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -342,6 +342,10 @@ static void mmci_sdmmc_set_clkreg(struct mmci_host *host, unsigned int desired)
 	clk |= host->clk_reg_add;
 	clk |= ddr;
 
+	/* NEGEDGE is not applicable in HS200 (RM0457), with a divider it corrupts writes */
+	if (host->mmc->ios.timing == MMC_TIMING_MMC_HS200)
+		clk &= ~MCI_STM32_CLK_NEGEDGE;
+
 	if (host->mmc->ios.timing >= MMC_TIMING_UHS_SDR50)
 		clk |= MCI_STM32_CLK_BUSSPEED;
 
-- 
2.56.0


