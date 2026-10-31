Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6979E606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xwapaSOR;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=UijhQ10l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SHiodlaN/47Q9sQElac/FcGmKIxlHSOhqHHn7r3qETE=; b=xwapaSORGfs8MB
	KPDAgHBHbL8RBUF6F7Ws94AvFrEaNX2QJIWvv+yFhmsr4tYyc9k4zXGKc4Sag8avackuEjRBfKp3g
	Br/NNZGf9UmBGbvrDz/gIUqX1/3tlA7EWy3WeQ5I49gYn/A+SqAqqeaOvfPY+CEh64Iwya1/HyO9g
	v3n+hc5C3d5JcbmcJ+tab6pGu00gNCwSFpc7sWfsivPM4EzwRjzUuwS4CwU7JRhE2gDPukQ41Mxxk
	1t07daK6EcRbkbfH+lEKJOxy23+bY4SnsgYVo6AoZbTigPBh7xC9Wp6Cj2xZjuwJqU8czcMDjwb2a
	oL7SdRc2BSH6XPlxIQ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7rn-0000000DHhY-0coA;
	Sat, 31 Oct 2026 12:07:23 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7re-0000000DHdh-1UFz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:07:15 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id EAF0B240126
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:07:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793448431;
	bh=SHiodlaN/47Q9sQElac/FcGmKIxlHSOhqHHn7r3qETE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=UijhQ10laMoUf4LsQw+gAJUuE8i27pdC3giLUsej6UjDnfT125vfP1vv3HjTDzdti
	 zj4a7jZ/bQ4PnAnLZnE1kmq5RO58mluNbVDzE2c3bhWQfkJ919VQ7ZjhJ1m5yyK6XM
	 JuXcm+Ue1QTvaI6XFUqCdvC7sspZDHBOG/gNKYMqhVZ8iwe0jRginrPN3Pe2meYdRs
	 AfD+mnXou47bdRWYB9OnvNI6bg7Yccqa/pynJW5Wy77/qyt65iYnODsCGLnQFtDmFO
	 mXOKBSvS3C8D6TUqrIIZDsLbrgMuu+jBqTdKQApwyOrMryY86acXYszwH6Vr5N6M7b
	 8JCNMmCJmLa+w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jGxXt00Ntz6v1B;
	Sat, 31 Oct 2026 13:07:09 +0100 (CET)
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
Subject: [PATCH 1/3] mmc: mmci: do not count a data CRC error as a complete transfer
Date: Sat, 31 Oct 2026 12:07:11 +0000
Message-ID: <20261031120700.42576-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20261031120700.42576-1-mateusz.nowicki@posteo.net>
References: <20261031120700.42576-1-mateusz.nowicki@posteo.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_050714_546364_A032FC77 
X-CRM114-Status: GOOD (  12.07  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,T_SPF_TEMPERROR autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With datacnt_useless (STM32 variants) success is 0 on a data error and
a CRC error subtracts one from it. bytes_xfered becomes 0xfffffe00 and
mmc_blk completes the whole request as successful, although the
controller stopped at the failing block. Reads return stale data and
writes are lost without any error.

Tested on the STM32MP257F-DK eMMC in HS200 with a forced bad tuning:
without this change 5 of 14 reads returned zeros, with it all 10 reads
were correct.

Fixes: b79220b3e0af ("mmc: mmci: add variant property to not read datacnt")
Cc: stable@vger.kernel.org
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 drivers/mmc/host/mmci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 416bdb184ed4..10eb0439fc52 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1422,8 +1422,9 @@ mmci_data_irq(struct mmci_host *host, struct mmc_data *data,
 		dev_dbg(mmc_dev(host->mmc), "MCI ERROR IRQ, status 0x%08x at 0x%08x\n",
 			status_err, success);
 		if (status_err & MCI_DATACRCFAIL) {
-			/* Last block was not successful */
-			success -= 1;
+			/* Last block was not successful, nothing counted when DATACNT is useless */
+			if (success)
+				success -= 1;
 			data->error = -EILSEQ;
 		} else if (status_err & MCI_DATATIMEOUT) {
 			data->error = -ETIMEDOUT;
-- 
2.56.0


