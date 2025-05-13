Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7E2C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 17:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwNHHFkKkpugnXsLzIFZqwmrlvXoDWAFqw7h4dczRBU=; b=n4LcW2FnHm6CXXCuWY3xO7MwYv
	Wv84TlMCBwjMq9N3VLqP2g7fWQ34ZlIAvxTrJn6tzq82iQrW9qc+644umi+W9OEsydC9OkMVTRkXz
	CmbOu2nh9AAo9b6J5lrHhlc2A+wU+rmr+7nuway+JdZ40PCVBQB51WfytcCZUqL3Y8zBqE7B6F4NO
	6yGJnuWLKgwmBRDgkuKCd40+ul22w+sHu+/RugSL+gjcHccTvKeAws1gPkOzcz+k3u/77xQCeM4Vf
	R+4EGZ/0aDHq5/x8KksSqnlsWir+ZAaBTLkniRkgWynu0wDtEKn+MoDeXF6wnZugHO3rxxnm9dutQ
	N3n7hxOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtW8-0000000D6u4-1dG0;
	Tue, 13 May 2025 17:34:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtQe-0000000D5dD-0Svv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:28:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AE3D629FB;
	Tue, 13 May 2025 17:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A5AC4AF0C;
	Tue, 13 May 2025 17:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747157311;
	bh=5BoSY6I4E3zhXcU/3IAaz838Ni4OzdDS8jPXJzV6qg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dm8fnhbb1HXn9Xj7HTUoE8BQAcuWlp0sNhyErxY9mHhVVE0lAMWqRBK5LDrxmjB0W
	 BS5PshtG6OQFNM0XU9LNbzNgGHixp9rMcaBz1q/oJGMJSGReYcm8NwfdtY1/I6M4C7
	 m+hnhYBkHPddwowLFrZ9QmEsoGOvnPZsTG1FXaVfc4DHU/lC6x5dNiYAWVTvfbk3hw
	 rILWiC4xmuFJ/brRqRagFPQKNRidwiQITQfBJnwg3Vzvwwf9d3yF8zKNZN0Gd4Gdj8
	 /StB4Cng0CwOX8TfoNfXeSYyA1ch6cQ0tTg1iWwdj10ajEWztRiu18loLqYfddn4Uv
	 dXn5Kn/l5w7XQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEtQb-00EbRz-7F;
	Tue, 13 May 2025 18:28:29 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Toan Le <toan@os.amperecomputing.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 6/9] irqchip/msi-lib: Honour the MSI_FLAG_NO_AFFINITY flag
Date: Tue, 13 May 2025 18:28:16 +0100
Message-Id: <20250513172819.2216709-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250513172819.2216709-1-maz@kernel.org>
References: <20250513172819.2216709-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, tglx@linutronix.de, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, toan@os.amperecomputing.com, alyssa@rosenzweig.io, thierry.reding@gmail.com, jonathanh@nvidia.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Bad MSI implementations multiplex MSIs onto a single downstream
interrupt, meaning they have no concept of individual affinity.

The old MSI code did a reasonable job at this by honouring the
MSI_FLAG_NO_AFFINITY, but the new shiny device MSI code doesn't.

Teach it about the sad reality of existing hardware.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-msi-lib.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index 2a61c06c4da07..246c30205af40 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -105,8 +105,13 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 	 * MSI message into the hardware which is the whole purpose of the
 	 * device MSI domain aside of mask/unmask which is provided e.g. by
 	 * PCI/MSI device domains.
+	 *
+	 * The exception to the rule is when the underlying domain
+	 * tells you that affinity is not a thing -- for example when
+	 * everything is muxed behind a single interrupt.
 	 */
-	chip->irq_set_affinity = msi_domain_set_affinity;
+	if (!chip->irq_set_affinity && !(info->flags & MSI_FLAG_NO_AFFINITY))
+		chip->irq_set_affinity = msi_domain_set_affinity;
 	return true;
 }
 EXPORT_SYMBOL_GPL(msi_lib_init_dev_msi_info);
-- 
2.39.2


