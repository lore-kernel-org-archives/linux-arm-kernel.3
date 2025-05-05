Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B462C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 23:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91x8GYY6fmo2qlqrmXSkMWjMEPlsJitwlgz1vyKgFMc=; b=mv5kX6eo/4M1q6RG6sWLPkBTYh
	1bxbHd8w8OcQF2YrCxOzvYvEbTmFieTnkcKm1mUrBu4t8v2LpYVRroEjFzrjWWFDQ6DdZGm85kYYk
	pzY1SlpbfW6E4nCzt3Kg4JpbXTNmghmCL4/HnAkG90jmG6vGXf3a0AKZFmO+HuKcAq7CM3geIhkcL
	OlGpbXTFdsTGbvnz/X/gKQzsPeTNHJOlvzAOz6cN0wLOoQVixn1PoNjNVzTe/pQzxR6r12JEgd+Gz
	FCBS5rbzftiow1i605/ubp9e7eGQMJ1xc4vUT1av6RsHhzfX4big+HbnjJKOkDnWdIu7yxSVe/RZm
	IF7Yv+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5Sc-000000097M3-16N5;
	Mon, 05 May 2025 23:42:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4GD-00000008kvX-1K5t;
	Mon, 05 May 2025 22:26:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 02E93A4CD20;
	Mon,  5 May 2025 22:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A493AC4CEEE;
	Mon,  5 May 2025 22:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483964;
	bh=oWo5y1RaFIe1LD0KY9udUqxhUFVnrrcknEQyAbOi8pE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kx0qi3MKKGU02G4NZKnD83DCbGCWByvNO73B85uJMUmJCAhbo14+LYnQfF8FHPxo1
	 kL6E4xBLzDXosf5LeVlsxjZQLyr1oQkpMbUbItKiJsOfkn56sHgCwm+E6fbMr/1Th2
	 YYCo9emnnQX+xzwWBj40FlEPe4GsM1f0BUZslOYZtb/2AerPZxbci6gZeqGucwJ/kl
	 JNXfrx9hvhfeBncpopvmXlOaaus3bBo1nZSj8a8Wr62dL2d98J1yZoLQVpQzdArk8d
	 kwVcSh7lu2JKKhPZEhWa08FWQnSR386FaFg/GOdOLyG34IOc9EHHUDrrWOcGE4wWNx
	 S7sL69sKXyK6g==
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
Subject: [PATCH AUTOSEL 6.14 294/642] PCI: brcmstb: Add a softdep to MIP MSI-X driver
Date: Mon,  5 May 2025 18:08:30 -0400
Message-Id: <20250505221419.2672473-294-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_152605_423411_B0F06D69 
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
index ff217a0b80ad3..bae226c779a50 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1947,3 +1947,4 @@ module_platform_driver(brcm_pcie_driver);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Broadcom STB PCIe RC driver");
 MODULE_AUTHOR("Broadcom");
+MODULE_SOFTDEP("pre: irq_bcm2712_mip");
-- 
2.39.5


