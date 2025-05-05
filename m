Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A46EC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 04:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zeUpQ8OWyCfkrBY2DlfY+GtovybX1zR5K1c3uDionJw=; b=5FKjal5Oz/qMnILK0abPvAiHDh
	AuWB7PvN+wbqU/qF6fdAX/q1TJxfKTPlOFBdi9XTtp1a0n7PcPYwz1Z1XW0kJpPg4bRPVFmIuVjMK
	EzD6DLZ8mOvBrG3IpuVMqfhNHKq1GNTZCVRnRO/Nr2SdIMZ1hhy0+auKL6WDSuOtOPVB7trnsi04p
	6o1VnjjNNB0DsDscBE0f9og07RKcOOVtfjDt02uC3s2/2V1cK01feC+B9BnovxCvBxyVmUUhaVtnR
	hmFQSwbAdJEQlYvU4ggyMXFPoaWQFAQSO1PHpaahj7T7sa9isQVKa6aAss4ZjVVZOKGk6cANUxTjQ
	OlnNPLgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCAEl-0000000AI82-1nV6;
	Tue, 06 May 2025 04:48:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC56Y-000000091B5-0hBz;
	Mon, 05 May 2025 23:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DCB9EA4D3EC;
	Mon,  5 May 2025 23:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84861C4CEF2;
	Mon,  5 May 2025 23:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487209;
	bh=ENgbqkBgGMa5Coy1KnyAD6orBWru8MWNRBgdgyZkbhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iqmWeQFx35XWQUmQmo8mn0s5l6ZuuRCWuXXtiFGKb5H0IIhdDMHWej37V6QJbLqD3
	 mBt5epxgvqiKMfXb/XMJox5Oo7UBp7TKUMiZR8bhxm+3bwoo6dcTZfEWsCHeDXKxE9
	 UzJ1TZliidGTlM9WWWkExE/1Ol8dy3ues3+Y/H8wWltuiEbngABiDZFQpxXhKD15RG
	 BOZjGizW4Loh/O1hF9ZWlAEqtEABIz6JRTVv9UJi3msRcTXcZZPNZ9nwx23nANv9VJ
	 C8Kq13so5pWZ+zb/8HcPycYKSNnyrGH4/WzfFgmaqhujqyFfSEYxZbPwwSdrZTxFjX
	 PdYVAHiOtHhPg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stanimir Varbanov <svarbanov@suse.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jim2101024@gmail.com,
	nsaenz@kernel.org,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 058/114] PCI: brcmstb: Add a softdep to MIP MSI-X driver
Date: Mon,  5 May 2025 19:17:21 -0400
Message-Id: <20250505231817.2697367-58-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231817.2697367-1-sashal@kernel.org>
References: <20250505231817.2697367-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_162010_267418_83FB4F3C 
X-CRM114-Status: UNSURE (   8.41  )
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

From: Stanimir Varbanov <svarbanov@suse.de>

[ Upstream commit 2294059118c550464dd8906286324d90c33b152b ]

Then the brcmstb PCIe driver and MIP MSI-X interrupt controller
drivers are built as modules there could be a race in probing.

To avoid this, add a softdep to MIP driver to guarantee that
MIP driver will be load first.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Ivan T. Ivanov <iivanov@suse.de>
Link: https://lore.kernel.org/r/20250224083559.47645-5-svarbanov@suse.de
[kwilczynski: commit log]
Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/controller/pcie-brcmstb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 2fc4fe23e6bbf..85be07e8b418a 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1326,3 +1326,4 @@ module_platform_driver(brcm_pcie_driver);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Broadcom STB PCIe RC driver");
 MODULE_AUTHOR("Broadcom");
+MODULE_SOFTDEP("pre: irq_bcm2712_mip");
-- 
2.39.5


