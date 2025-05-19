Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E919C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 21:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KW0yAMOAIqjFl9cGDGs3+T7UDeIXOIxNCF1pf/JkjJM=; b=eWTEwC8MZVgxljC4mWrqUQAfoe
	CD8EoXBELfs28Qlfw4QaMeklobnnJjMT8f3OUuFeVFdhURmAVf02S9abF4oTQVMQEVtY2YlhP/1Ln
	IKr4ETm4srpNs7LGJ0cLep2qGKmq3zVO7nyeXSjsj4L5ohpMqjaD2PGQHwwKZm2sKm3hbUNU165Ud
	QTgXdCAddAqe96n6jwDYcUG2yfPdQlKXEs0YUelU0A5TZEwJc42j2et4zNOHZXZMP5bFQO1pPI4Kw
	0/mwGwEDAfS4iMKLN+eDPOwKHtPOz47+5GVvr+nGZdVdV1L4L+XVWvi6Z2P/TXntpJ/X0NYCAqr4L
	+yAFZtJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Eo-0000000Abwx-1K3p;
	Mon, 19 May 2025 21:41:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7xU-0000000AWWv-0cnQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 21:23:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3D024A508;
	Mon, 19 May 2025 21:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1305C4CEE4;
	Mon, 19 May 2025 21:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747689819;
	bh=WKN0tIyIVZDMFS27vKYjeDiZINzeS4GUB+3+CuoWzKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F5J2sLgK3mNyC5t74W2OB91lcRC/5VHsjc5SBk0zX8Nxqnk3UU+6viaJjcymyTohb
	 qadoJCPE65SuxmQC8DsH7fmcSwxbikpcRTGpGosiTAzU/TjuOuJ0C3b7N1dSkw0bbe
	 +02KDqUdkFP4j+SC4bplIP9zqjVjVtz7ezYokSGNULzVoQtiNRNtaw9tazng3+tyJg
	 m4tF9gqH3p5xRGePeb7njg26PZTrzv4ZsgUActTqwGbComzdTxF9EKBQiHZSbFDRPf
	 Xd5bHVKRpx+2bMf36vLn3U9erTf/5Lk/RMuEiR1DsK84a4Wprg3zbaRJ/tPGkRQvJt
	 oLujhyRUC8SiQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alessandro Grassi <alessandro.grassi@mailbox.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mripard@kernel.org,
	wens@csie.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 5/5] spi: spi-sun4i: fix early activation
Date: Mon, 19 May 2025 17:23:31 -0400
Message-Id: <20250519212331.1986865-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519212331.1986865-1-sashal@kernel.org>
References: <20250519212331.1986865-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.293
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_142340_208441_0B2B7353 
X-CRM114-Status: GOOD (  13.33  )
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

From: Alessandro Grassi <alessandro.grassi@mailbox.org>

[ Upstream commit fb98bd0a13de2c9d96cb5c00c81b5ca118ac9d71 ]

The SPI interface is activated before the CPOL setting is applied. In
that moment, the clock idles high and CS goes low. After a short delay,
CPOL and other settings are applied, which may cause the clock to change
state and idle low. This transition is not part of a clock cycle, and it
can confuse the receiving device.

To prevent this unexpected transition, activate the interface while CPOL
and the other settings are being applied.

Signed-off-by: Alessandro Grassi <alessandro.grassi@mailbox.org>
Link: https://patch.msgid.link/20250502095520.13825-1-alessandro.grassi@mailbox.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-sun4i.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
index cbfac6596fad5..2bdac65789b62 100644
--- a/drivers/spi/spi-sun4i.c
+++ b/drivers/spi/spi-sun4i.c
@@ -263,6 +263,9 @@ static int sun4i_spi_transfer_one(struct spi_master *master,
 	else
 		reg |= SUN4I_CTL_DHB;
 
+	/* Now that the settings are correct, enable the interface */
+	reg |= SUN4I_CTL_ENABLE;
+
 	sun4i_spi_write(sspi, SUN4I_CTL_REG, reg);
 
 	/* Ensure that we have a parent clock fast enough */
@@ -403,7 +406,7 @@ static int sun4i_spi_runtime_resume(struct device *dev)
 	}
 
 	sun4i_spi_write(sspi, SUN4I_CTL_REG,
-			SUN4I_CTL_ENABLE | SUN4I_CTL_MASTER | SUN4I_CTL_TP);
+			SUN4I_CTL_MASTER | SUN4I_CTL_TP);
 
 	return 0;
 
-- 
2.39.5


