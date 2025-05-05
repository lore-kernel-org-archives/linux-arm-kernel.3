Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B65C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 03:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GRalZHzvNJnJ4vNf7yJWT1qLOEOF4E/N4N9JNiWeuI=; b=iUqAqe6msQ1Wswak0S+LruXfIY
	UzR4gzF2Q5HW60u6C7ekuO1lmOqFZAJSt3NAAzNu3xZSsmSWvHodioXXvRp5aYeX5c8TecQHS48vZ
	Bo1qmcKKr7EW0z2wHs3jTFblGdgOOPvzA+8YAkWU6+eqD7EDmQHU3XiMR7ROOn+Oixf3vWIElhLrC
	SK86R3vNFDx2qJYB6Al3CaT5UtyGg5wzQRk43wa2X5SyupJAHBNXH/+hAuHK/POKE40MEggjjlmbq
	OYiRvqjR2Ktabwc5tEL4/EXVOvmnHT38DF6fwGQ085gfbc1JdKIMas1XOcne/Jc18jCttixOqNYxK
	TlFP+yTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC9OF-0000000A5k8-1Npi;
	Tue, 06 May 2025 03:54:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4wh-00000008yJ0-2ok5;
	Mon, 05 May 2025 23:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 162F8629C3;
	Mon,  5 May 2025 23:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8992C4CEEE;
	Mon,  5 May 2025 23:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486598;
	bh=U/kOHmzvB1lzBJaKYAzAlXmLijrDTnh5CcoN3Fexe8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N35ARArWXN+yKccfi47qZobfsgQnG35azhNNeeTo9i+Mf7M1CwHrtPZy0xmGohRWG
	 ZFSlQ/MIPcnwPGTgQ27M8ly5sGZXOg1x0suSKjaFOKbCHkMODGnH4ancxrqXsRyU4S
	 TAoUW66obO71spbH1SEKUtG84TKeFI1EFD3YOhReD2CscFezxgoPoJk18FBxVAnkFF
	 2GcvWJIe3vfVY021hED/XglBAn7o2nOhHIOiB9BWuvseuV4ufrjumJkHTnxwDoEZik
	 nTbbzMowZLzlHiIPTUp9zuoVVO2RTO/SdxuauUdUZ5j7CHvpcNBGMTb4j6oCJnfDNT
	 WLJb27mEigTSg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stanimir Varbanov <svarbanov@suse.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <james.quinlan@broadcom.com>,
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
Subject: [PATCH AUTOSEL 6.1 110/212] PCI: brcmstb: Expand inbound window size up to 64GB
Date: Mon,  5 May 2025 19:04:42 -0400
Message-Id: <20250505230624.2692522-110-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
Content-Transfer-Encoding: 8bit
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

[ Upstream commit 25a98c727015638baffcfa236e3f37b70cedcf87 ]

The BCM2712 memory map can support up to 64GB of system memory, thus
expand the inbound window size in calculation helper function.

The change is safe for the currently supported SoCs that have smaller
inbound window sizes.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Jim Quinlan <james.quinlan@broadcom.com>
Tested-by: Ivan T. Ivanov <iivanov@suse.de>
Link: https://lore.kernel.org/r/20250224083559.47645-7-svarbanov@suse.de
[kwilczynski: commit log]
Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/controller/pcie-brcmstb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 425db793080d4..fe37bd28761a8 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -281,8 +281,8 @@ static int brcm_pcie_encode_ibar_size(u64 size)
 	if (log2_in >= 12 && log2_in <= 15)
 		/* Covers 4KB to 32KB (inclusive) */
 		return (log2_in - 12) + 0x1c;
-	else if (log2_in >= 16 && log2_in <= 35)
-		/* Covers 64KB to 32GB, (inclusive) */
+	else if (log2_in >= 16 && log2_in <= 36)
+		/* Covers 64KB to 64GB, (inclusive) */
 		return log2_in - 15;
 	/* Something is awry so disable */
 	return 0;
-- 
2.39.5


