Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DF9C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 04:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9zk12IQhnkJTJ+K/qV+raHe+qCHD85jvglJF14G3nU=; b=vEXFAc9jkNf2LfskPjJDoZW3VV
	4h5ZuLsEsnXCARx7V18CCtJM6G6nbb1srnx+oYKBgQQBRoYx+JlicaVikyUFPnHzyilL3W5XyB8Fh
	sEKSaiiKSl25UZ1GEPaY/E1SE1cK6IhxAe3Yfy7lytFmGPwvALT1JTpu3uPIPgnfzwissQUJrmNlp
	Kzx4sEw3WjOnE3GQxSOJXFiIHTT92PVjDuRmVNDtGd1waT6gbtYAfpZYxXi5/nRzgWFH/WnT6mKSp
	aqhiUHrVrhhVOxzPQT2UMIT8AV4QeQywEzkxugHwIQstcFO9iN/8QM1jLf8m8YoNYnZBioBCr3aYs
	dg9WrpTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC9uX-0000000ADPr-3zer;
	Tue, 06 May 2025 04:28:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC52V-00000008zyL-0Bsu;
	Mon, 05 May 2025 23:16:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1268A49F0C;
	Mon,  5 May 2025 23:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD41C4CEF2;
	Mon,  5 May 2025 23:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486958;
	bh=EJTMie1rf9Xz9wqK3yv4vFTYxyIhJMs6ZZTttzXMxxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qnoqh/2Yd1fIsFJfMvEhY8UROXdYqHbtkkVwtT/unzn3Pz9pf0E6ZAF1gTLVtibFg
	 Uume1WyoWSoGMXN1Ft8nTKJvgLR8QQ2ikHspJSl1UwCT8k3uwp/58LwxIYWKx4v85W
	 XUXBfiItyYYQjCZ+6FvIy9eajQB185AKP9vFyyFzCm3h6tmS7FBKjO2I15JllQtoSI
	 wEr3CtVpmafUe/9cxt6VZ67iViqys5jxeUc93+Ako8ZodsdjAaGkIjSFxqPqoYwf81
	 Vp+3DCTim+aF1D6ETM3LhP3BaxyseheroOUMjTEeIYAP3csMVkb8NCuCq+LCsjRIWe
	 ILV4TXN6+3wkg==
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
	linux-pci@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 079/153] PCI: brcmstb: Expand inbound window size up to 64GB
Date: Mon,  5 May 2025 19:12:06 -0400
Message-Id: <20250505231320.2695319-79-sashal@kernel.org>
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
X-CRM114-CacheID: sfid-20250505_161559_113055_076C4900 
X-CRM114-Status: GOOD (  11.42  )
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
index 6a676bde5e2c6..7121270787899 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -308,8 +308,8 @@ static int brcm_pcie_encode_ibar_size(u64 size)
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


