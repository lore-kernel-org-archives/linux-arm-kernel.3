Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC3DC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2G51TH4mLElw/F5T5m2Lexqflm2ivLfaCfp1lA7D4U=; b=iodJWIbdUII+Wic/keWChVDq0E
	4iDVot0vShAnEvTob3zS6GB1CUIevzkgISLYDgcah7O/Up3PNgScV9CimPLXrn32N4VRTHDuVvBTT
	vIdX5ox/oStkh8psudWxMOmI/JxxLwTu2Q6hTDa5b9Mn8OHGENOgiRxj6uXJ1RqtGbEYagaAE1oxM
	qzYroeNelpHDep27XQLCXWVk0Gctp+uK1grhuPpvjNTD4tv8mLacQrVcJvELOY9nRHrxZmbynXH3R
	/01Ot7NiEwaoux+nFht3tnTSVbTjgCS1IyHf0bzbZGjRaC53SZvm0x3NlAYYZE6uf16pLnEew3CTr
	mCIDnLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURYe-000000092nK-3IUm;
	Wed, 25 Jun 2025 14:57:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUO8z-00000008RnL-1Q59;
	Wed, 25 Jun 2025 11:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/2G51TH4mLElw/F5T5m2Lexqflm2ivLfaCfp1lA7D4U=; b=OtcuGqp8Fn7XlAA0BTYYxgF/TR
	6mtsoy/jEOxsmixA73nF2qy01lo++F3uP2xADTrVq0Z7ipKzsMsC9Zm/ZjtFULj1gj2x8ovG0LT8/
	b06TgGSeOxIr+gpyisa7gUhMW3vX3qsYl9TI1a2UVc4yiKBJJeFBvqVR9MJgEmi4szGlZIpjjm2Qj
	Tl7zl33DA6KtHZPRxU+Wzn4UsM8mLkaXxXk9TWzC/QB4MW/6TRu/kgxSTQ5SmATdA2YdmpzkjycU7
	hkXSh0VH94n7M1zjIh2koSuc1Wl+33dJGoIhPl76t2q12rPS4z1+JZbKQ5+ufFOVSORRNHcxn6tl5
	Mw6Q9y2Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUO8w-00000005oj8-3HrN;
	Wed, 25 Jun 2025 11:18:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B65364B0F8;
	Wed, 25 Jun 2025 11:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFEFC4CEEA;
	Wed, 25 Jun 2025 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850293;
	bh=ynGFjdcNjSc6sRsTsuXQoAEgvgF/ccNZ82PF3o/rowk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MKHGkbpNcCQqSAO3nLNRYXJFMSVUynxv+ueAOjnW3dDZbAHJp4nn+7mG0km6oXAHl
	 ebvnd0Zr+u723V4d07pXU48zI+1lecFSJq8Tbj+43p+/ZPDY4Ol7QZKOSimJ9XKLT7
	 LQYz9ckXor4Fv0G5H4FV+r01aG9RaRCuAnQdF9a3hu61O9R6xkY5N6670aQAhZQfY8
	 f35i6KA0VaNsLhTOeGZpdghIDd1K5Hvdicr3RowGWjhJTwC6KBBrqv9owum63q7Q7N
	 pVWatgm+Alx909RPYmtNaFZkQBwNvt0LyMNelPJAK3MpSeq1P/tvr3QA+W9QkXO4kr
	 fF+cq86F73dLg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uUO8p-009qM2-D6;
	Wed, 25 Jun 2025 12:18:11 +0100
From: Marc Zyngier <maz@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Revert "PCI: ecam: Allow cfg->priv to be pre-populated from the root port device"
Date: Wed, 25 Jun 2025 12:18:06 +0100
Message-Id: <20250625111806.4153773-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250625111806.4153773-1-maz@kernel.org>
References: <20250625111806.4153773-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: bhelgaas@google.com, alyssa@rosenzweig.io, robh@kernel.org, mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org, j@jannau.net, geert+renesas@glider.be, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_121819_060184_A5DF2F35 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

This reverts commit 4900454b4f819e88e9c57ed93542bf9325d7e161.

Now that nobody relies of cfg->priv containing anything useful before
the .init() callback is used, restore the previous behaviour.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/ecam.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pci/ecam.c b/drivers/pci/ecam.c
index 2c5e6446e00ee..260b7de2dbd57 100644
--- a/drivers/pci/ecam.c
+++ b/drivers/pci/ecam.c
@@ -84,8 +84,6 @@ struct pci_config_window *pci_ecam_create(struct device *dev,
 			goto err_exit_iomap;
 	}
 
-	cfg->priv = dev_get_drvdata(dev);
-
 	if (ops->init) {
 		err = ops->init(cfg);
 		if (err)
-- 
2.39.2


