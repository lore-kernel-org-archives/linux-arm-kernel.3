Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E963C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 04:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8PkKW7vRtgGNskZXdg90qY/7HGDoe0moebBdowOwGY=; b=ldICfMhbDJp6tjSMZF57ugpdgB
	GlQ/IJz9vIkFQ4qYk3cR7zqDZzLExP7DWVNXfh0svBWpgRIW68uxfFoyISjSJ0IYwiMHvxP4dWSFo
	ElS2m3yXgu1HmgnCYZrKle295MZpTZfGA14fOvZA6VUM3k1xhlJbMzYz/h6m+RWdeZfT9kqxJNRNV
	mRW4x67PySc0CIia3jMT+taYt+le29Tot0rUJR7oU1BHWPPDEOrwbvNjWDr1G9pQEvEtVzm9420Ee
	tL08veDXrDKf/wOWKZyRDgmsL4PB3AaoVGuHo+yqWAYiE3c2pGZfKozjkBKWKvzxHp5O9Rc/qhPRU
	m60+avcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC9wh-0000000AE3Q-2Q1e;
	Tue, 06 May 2025 04:30:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC52X-00000009006-27xy;
	Mon, 05 May 2025 23:16:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4C095C5B3D;
	Mon,  5 May 2025 23:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CDDC4CEEF;
	Mon,  5 May 2025 23:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486960;
	bh=4CF8p/SGNJQs7tFPYOJpkOsU0jTsZmmINaE1h/xGbNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g8Z+ssInw1SAV8sN1wCk2eN38pBfzz91IXSDcvRcHAq76fxnRtb36xxbm1wciQJ02
	 WhpmvnaCcpBylpIKmHZaq4bvDCQM0X9N2ggJ+mTVcawA5BY083a1AMGdvU8TlGvKfL
	 S/4bbf4NX4DBLAZCOVQEnzPrfAUkeoGU3VflcbeQhO3jgjHKy/ZkzprFyuRApZWdvX
	 37mH2twf+KveTk5vKRJ+QP4hqWV8ni7TOJnqPy0iL++gxOPpSMpg8v97wjEPFjprIy
	 mWyR0tKsouAde6/kvI60MEGe+cPfRJwhcfvPFW7S6HXWzrlMskhaocUVNrtMPyVS8d
	 0dpSvOVFs/F8A==
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 080/153] PCI: brcmstb: Add a softdep to MIP MSI-X driver
Date: Mon,  5 May 2025 19:12:07 -0400
Message-Id: <20250505231320.2695319-80-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_161601_592275_76A08E0A 
X-CRM114-Status: UNSURE (   8.43  )
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
index 7121270787899..e984b57dd0d89 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1352,3 +1352,4 @@ module_platform_driver(brcm_pcie_driver);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Broadcom STB PCIe RC driver");
 MODULE_AUTHOR("Broadcom");
+MODULE_SOFTDEP("pre: irq_bcm2712_mip");
-- 
2.39.5


