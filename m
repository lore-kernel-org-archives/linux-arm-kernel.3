Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7688606A339
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VLMNolLI;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=D+/7ANfo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lTgc+hlrMA7SA2m7qbx65V/vbNGlC27/LFtg4t8ezHc=; b=VLMNolLISHIc5lbAEWgAJwrrzw
	Fft/QxucwuyaHgAFXhJTQFyL8HS/IoMvPQWnf7SEtMEtQaZpNJWKnbNwhaVCj6FGfAfYCrfK6QkOv
	B8C2ltrCn3OZTJ75i/Ubn1iKHzjzj2tqDqH2c7mMv3BX2inS2jEy7ih7ydIPBLI0o873cqfRLpvdp
	A9CVt00+oR1beNw3qFHa9tm7I7Eubmf27KAPNSTLQvUXbR0IZQHjcMNUusxykEBu3dcd9Qt1iyMRQ
	3DvyK1Sqsis/NOJzGUyjbStaA1PwlvUC01FA3Bxc/csN9fMcBMOMpIXhyvWujxcm4gF66heJEUwUV
	xP3L/nCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7re-0000000DHeR-43Bk;
	Sat, 31 Oct 2026 12:07:14 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7rd-0000000DHdg-07uX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:07:14 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 5A9A4240029
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:07:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793448430;
	bh=lTgc+hlrMA7SA2m7qbx65V/vbNGlC27/LFtg4t8ezHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=D+/7ANfoPgNWuIBqa5drXTlcwoucEr21uwnxSd5pTTtaCB4rC0+cvdK3Z5Emby1aq
	 VgewqquMXOsd4QUSXT+iNuVrKZO4E7rUOo8j1kJybzU5dlCnsotKo/sAmIxgM1Q6XB
	 QEkUq319pTJ9o0+W2x6d+6P4MAZ3l4INPhJGEGSw7MQUnEqq3BqAiQnciVWtT7j//7
	 H66XtD714TOOHQnoZapBLmi2tSnv/IEyuqzvSobAiz/UafmJMOJM6ZeloHoCGeGoYj
	 gfgmvzenGNIt5mHAHHEWliI+2sCPFjmriJB3GwhLpEzgIioeS5yIMy8BbxLQYaVUWR
	 V5yZXqoOyaBuw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jGxXr2zyTz6txs;
	Sat, 31 Oct 2026 13:07:08 +0100 (CET)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] mmc: mmci: stm32: silent data corruption and HS200 fixes
Date: Sat, 31 Oct 2026 12:07:09 +0000
Message-ID: <20261031120700.42576-1-mateusz.nowicki@posteo.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_050713_215309_E29AA2B5 
X-CRM114-Status: UNSURE (   7.47  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The eMMC of the STM32MP257F-DK in HS200 returned stale data and lost
writes without any error. Patch 1 makes data CRC errors visible to the
core again, patches 2 and 3 remove the causes seen on the DK.

Tested on the STM32MP257F-DK (eMMC in HS200 at 100 and 150 MHz) with a
v7.3-rc6 based kernel whose mmci files match this series. Build tested
on master. Not tested on STM32MP1x.

Mateusz Nowicki (3):
  mmc: mmci: do not count a data CRC error as a complete transfer
  mmc: mmci: stm32: do not use NEGEDGE in HS200 mode
  mmc: mmci: stm32: lock the STM32MP25 delay block again before tuning

 drivers/mmc/host/mmci.c             |  5 +++--
 drivers/mmc/host/mmci_stm32_sdmmc.c | 18 ++++++++++++++++--
 2 files changed, 19 insertions(+), 4 deletions(-)


base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.56.0


