Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140B4C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 10:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aF2mrocG7bz7iUrXefd6O0ncX6mWZLmTLQaTFXHaLZA=; b=XTfIzft7E9r3CJJW2JSEecfPdy
	uKhG/8P+PmkBC5mdkXJf6zfgCH7ASY6afn4g9l9vHhTgLyBTI73fen8antb3zUWUSNm2+vmrmoqmd
	C3n0EmV+m/eZoZV8ncQ1cbR/CTZz5Sze8uFNPw/K9kX0nTfbvEs+bAuX9AVy0Fpmubi+fTfFkBHb9
	tRVXojoGJXsn+n0FqEfw54+Dt7zJCQQLPFGG+lZl4XJl7gR+TKnJHE/gjcEptQnSRIYyohbmJ/nKR
	877+dNI4GyFw5Y3pGuFBiHEY+7oPhc0pvq5unDQeEaLwi1mNXW/PlnGTTyYuvg//i2kb7Qttzg5jb
	FaG4iycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1WC-00000005RSD-0WsM;
	Tue, 25 Mar 2025 10:28:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1UR-00000005Qmn-1idX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 10:26:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCF8543BF7;
	Tue, 25 Mar 2025 10:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E690DC4CEE8;
	Tue, 25 Mar 2025 10:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742898395;
	bh=khvmda81Vor6ELCVCuRt/OG1eU4tA4ZfEAJHXcgitdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E/vhHGyaqwh1rnTLsKJxY99Gn6mvVieJtZJMPvBvbzGB5tcM2b3c614iEVhoyzIRo
	 WlM3lrXldAiHAp1xIloJZ1ZRtwpSO3YTobH0W2lscNBjfAq/vvQibiEoa6E1pnvIeZ
	 rJGIZR61JW7RR/USAyDJZ4aqzA9RKwt7w9d25sqQxPudlg2i39K4TKLryf0X/YZJNr
	 yb9aedZCw11ax+G3UybagMzZLIpQqaWRA/kPr47grZQxmqVMQMs/qGBR8D/B05+yb4
	 y3PwXAL55i2v5HCHF2qg9vcgW6rdXIY4Xb/+biAjnpuN7/eHhOPalEi6n5uvvcO/IL
	 w5z9u+u8eMzZQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tx1UO-00GsRS-Rw;
	Tue, 25 Mar 2025 10:26:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v2 03/13] PCI: ecam: Allow cfg->priv to be pre-populated from the root port device
Date: Tue, 25 Mar 2025 10:26:00 +0000
Message-Id: <20250325102610.2073863-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250325102610.2073863-1-maz@kernel.org>
References: <20250325102610.2073863-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_032635_477050_0E12A619 
X-CRM114-Status: GOOD (  12.24  )
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

In order to decouple ecam config space creation from probing via
pci_host_common_probe(), allow the private pointer to be populated
via the device drvdata pointer.

Crucially, this is set before calling ops->init(), allowing that
particular callback to have access to probe data.

This should have no impact on existing code which ignores the
current value of cfg->priv.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/ecam.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/ecam.c b/drivers/pci/ecam.c
index 260b7de2dbd57..2c5e6446e00ee 100644
--- a/drivers/pci/ecam.c
+++ b/drivers/pci/ecam.c
@@ -84,6 +84,8 @@ struct pci_config_window *pci_ecam_create(struct device *dev,
 			goto err_exit_iomap;
 	}
 
+	cfg->priv = dev_get_drvdata(dev);
+
 	if (ops->init) {
 		err = ops->init(cfg);
 		if (err)
-- 
2.39.2


