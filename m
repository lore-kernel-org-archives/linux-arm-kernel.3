Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AE6C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 15:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDBmOOaGqFS5KRPk2m9tJwpb4/Lkkb9nYmrvQxmDUZM=; b=JXWBxr4k0yZLf+wRe9vFO6Zgkp
	Nzy5KnLG3vOEjJROoQC97QWb269hi23bN8FVGMMNyxBt1xtlUQu9oPvPeYUuGkpDwQmGKN9SOUnbL
	0vL1wdNcK6dARQadzO+DoSGQkKz3MNU6Qz3H9QLf3TC/QnmXkXy9qw1+qa3pytInezM4za0+i6+Q+
	Z9idZU6qFqblCrXg4lh2IB9eQ9mWHfOsxaclDfI0yKCmtxWw7whnd0Wdde+r1L282kyRhbtrU4ttb
	+/NQwfVuiLXKdfoobOKp0DF9OawCxTEwRRiGyDpp73aYznAsKGKWasKi20uvqur7ATMJUOBAQX/6z
	Lcus2jYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBXS-0000000DlKT-1wTV;
	Fri, 28 Mar 2025 15:22:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAtb-0000000DdAT-08z7;
	Fri, 28 Mar 2025 14:41:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B6C25C643F;
	Fri, 28 Mar 2025 14:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61342C4CEEB;
	Fri, 28 Mar 2025 14:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743172877;
	bh=ukkF1hCEQm7wbvZ+4W4weswXt03pl708DLbZGCEkZ5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nVN+T77o0MVlYYptvSQ19rgbdLkuIJf6geemDlEupAakuG8ZVSFTTH2iqfM9mID7F
	 rRusyJ0kBF4Gp5vxfHx/B+MnrKhymbBlMxe9cl9gl8o2LY+TgHZgpKNG12P59iOQvv
	 KqjAE5hOiy5zsCoQY3IMmobvq0yO3WPUnETWfrvL+wL7EKpUG33aWbN0hxiM7SmQW2
	 GZ2EB6DLom0XC+lG8WyEV3Ndk7jbHZOFq2/XUUDGazUm5SH2IlPnG80VGfhKJDnr8+
	 U0AhO31B7LBIKnszEaKnfJ+DuRHYvNKUfXNcYFu/MBuUZYi1Xlwa+TlaEUoPiniQT5
	 t/s2T6nYzONbg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tyAtf-000000007JK-0GTP;
	Fri, 28 Mar 2025 15:41:23 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 3/4] wifi: ath11k: switch to PCI_PWRCTRL_PWRSEQ
Date: Fri, 28 Mar 2025 15:36:45 +0100
Message-ID: <20250328143646.27678-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328143646.27678-1-johan+linaro@kernel.org>
References: <20250328143646.27678-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_074119_192414_843D7D81 
X-CRM114-Status: UNSURE (   9.77  )
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

The PCI_PWRCTRL_PWRSEQ and HAVE_PWRCTRL symbols have been renamed to
reflect the pwrctrl framework name. Switch to the non-deprecated
symbols.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath11k/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 2e935d381b6b..659ef134ef16 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -24,7 +24,7 @@ config ATH11K_PCI
 	select MHI_BUS
 	select QRTR
 	select QRTR_MHI
-	select PCI_PWRCTL_PWRSEQ if HAVE_PWRCTL
+	select PCI_PWRCTRL_PWRSEQ if HAVE_PWRCTRL
 	help
 	  This module adds support for PCIE bus
 
-- 
2.48.1


