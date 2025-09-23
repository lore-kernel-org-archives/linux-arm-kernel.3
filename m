Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D2BCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 19:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlIfyIuKUfu0Giv/t2LPO4IvsJ2XIyV5+eVLug5OMo8=; b=zPOJj+Yc6z53QdfyoxfECeObLn
	gxY9RmMPop/2+91qFq1cV3yUK/MecGzLXJKm7fK2h74nziYx2ZCThFU4qHMkv7Bs+Lx90k5SU0zZu
	HQjGctzRu8OTUYz0iTM2D35/3iYOtPwQUvmSO0H4g68E0NWlFU7SXnF23UO/GXEgKt79/kGDaQeFZ
	aTM02yPX6VFirEqhNmzMbYLT3cvqxJb+4B587g31P8Qes65dFDwk7J5a/dAiLfdMEKUSlLB869LWf
	Z3ssJo1d0Sj94tQoEL/2Z7mO8LVymDPLLhKeQhnoBTwF3VTiyIzv7KZ1UG26odMs4dB3tjlGGF26d
	0itcVW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18MZ-0000000Ecqs-0jGx;
	Tue, 23 Sep 2025 19:07:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18MY-0000000EcqE-2OSm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 23 Sep 2025 19:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rlIfyIuKUfu0Giv/t2LPO4IvsJ2XIyV5+eVLug5OMo8=; b=Kh64Yv4Nyg7JXs6ecNdg/zGcWY
	fYgD86V6bUE+83z0++Wd8DxO2h+eiGX68DRTASPTdN9F+TdmdWrEuOE2kP48iZmD+z0F2rYtAg9iF
	lPAeTT4IA+iRmZlT4j9wpKTO68tWTTRGYneyBvRfQfJxpRqS+vMKqUIDRefMucF6bMJf4Cnl9RjHQ
	dKX+BTImybVdVqduh162rylVUtf/YPe0eeykViVkFC/cwX3mUG+HmrHeNrVso54pkXX0pRGtaXOjw
	zgmRQtEkQvY4pI0EQio6hzLwkxG8Q0ChZOA47BU8SaLR10sMkLdvhrPOZD/IejG+XjHrozURlsy8c
	Dy7RmP1Q==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18MG-00000008Y6l-2GmF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 19:07:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46dfd711172so19964755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 12:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758654441; x=1759259241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlIfyIuKUfu0Giv/t2LPO4IvsJ2XIyV5+eVLug5OMo8=;
        b=maCh6nqOOuVKVD10GTgQlFn+HvNcZ2u+8TTNZR24nh1Ey8FEf3qH9V0sU7zmG5kDRB
         SAsQMG1g6/Bh5UZlC9QcNFb6d/tDBDLQjOX7nOw3cGbW78+qKb13jfRwz7+n5zUG237q
         r2w1sXKBglcpibhK2eKNsSdbSwRjWpy+fClemexX/Mc95H5OtCEvhyaCK4LsOYSkaMEi
         Ad6UZqg1GHk/hf9TAK4Cs3Y+FSRvwju/ta3Fs1A8SV7Ss2OitnO8OKknGSJWkTt1/h/K
         jhnsjHDBOEe5mVSz0qW6j7rukJrVoFbVWErZ+azxN/qqCwdz8CtDEWoOe32lUMWZEDqq
         JXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654441; x=1759259241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlIfyIuKUfu0Giv/t2LPO4IvsJ2XIyV5+eVLug5OMo8=;
        b=eQPJS78283ylmSpRk8ehH7M/xerJUrm2lozSMBOxpLJU3aQCYvmRS67xJQxqPasg5O
         EiKfuv+8p1GYcCkBNBGXBWj7XUGgN5Z6ppdx4asB4MNRbBUiH27mskZcZVwqLSC78tak
         u4UeNy7ScK4HoXJxeOSZfszMAdPeqGeWkIwDolUDNuprzysEqJjOL2X2rLI/cfr7KPaL
         u9RIFfcRB6hXGbyMp8gyjVO2MsBLI+LLlGXSvwTgPc4NF95x60nMkIPvBOwOKoCkT93k
         PxATkUapaF8mhAmp9r3hAIcJdXqm5CcxNtDMqM3qCiG7LCeXOUejfX1Tyh1R2Xnw3Bi9
         FNRg==
X-Forwarded-Encrypted: i=1; AJvYcCVTFcBO156YpOarAEd40WiJSeFFlsymg2G795TOMlxF3kNdobM1z5B0JdHph7lmiQjI0nWyL8nRqwlPIvXeUSO5@lists.infradead.org
X-Gm-Message-State: AOJu0YzLA49JTwZZEVjNLROi7/76xdS+kMznzJ9NSV11mx3TPT6ZgDvK
	Az4c5+4gtacXKNLA0DV+sqXIXAd1ucA5z6pHPEI7tc+u1M0e14uFDd1n
X-Gm-Gg: ASbGnct/AqrPANhy87bZ+U0F8zct0WstIobDqjL8Wjrov3ljk/WPjcT1sM0cvTnc2MK
	OvRFtjRHfh/to3Pzce38uM7E7Iso5OiMVM1N5+O99orht0rVqLyK8tCVuZWn2Q7419+sotXtYaa
	dQf1dCDbkg0Q7A+9Q9H+7n+L8sOD3uMDaZnHA1SnThKmhBBfFkSRWrcxa702rTT2s+NHs+9cggP
	XdilGTUlfgIvWE1c3YXT0ScWcEhAg9iHl6+05SCCY7m2Gsuo3q0zUg5jyxWgPOA5lh/9bYNWJhD
	9Q/bG+30qii+jLkJMlrAOBDly6w1kVRLuNyBxao31z+xGJVyle3AgJVXEzrZZkoVNmI0ojs0+Kp
	tAdkltwX+RNj+dwVgSusZBxuitF91Nl0Yp64VpnKGZs2NiGfqSi15dMg4XV2BU80zfD/hhxk=
X-Google-Smtp-Source: AGHT+IFoxRtCJp+VI5Tw8FmClZ4lUAsWofpK0fvdL3jcvd8nDXAM5pqPxbH7pHIHEhBDKvkDPaydXg==
X-Received: by 2002:a05:600c:45d4:b0:46e:1b89:77f1 with SMTP id 5b1f17b1804b1-46e1d98004emr43610015e9.9.1758654440543;
        Tue, 23 Sep 2025 12:07:20 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-464f0d8a2bfsm265240915e9.2.2025.09.23.12.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:07:20 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/2] PCI: mediatek-gen3: add support for Airoha AN7583 SoC
Date: Tue, 23 Sep 2025 21:07:00 +0200
Message-ID: <20250923190711.23304-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923190711.23304-1-ansuelsmth@gmail.com>
References: <20250923190711.23304-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_200730_743220_E69887D1 
X-CRM114-Status: GOOD (  13.68  )
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

Add support for Airoha AN7583 SoC that implement the same logic of
Airoha EN7581 with the only difference that only 1 PCIe line is
supported (for GEN3).

A dedicated compatible is defined with the pdata struct with the 1 reset
line.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Fix alphabetical order

 drivers/pci/controller/pcie-mediatek-gen3.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 75ddb8bee168..6e68ed75b564 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1360,7 +1360,17 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
 	.flags = SKIP_PCIE_RSTB,
 };
 
+static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_an7583 = {
+	.power_up = mtk_pcie_en7581_power_up,
+	.phy_resets = {
+		.id[0] = "phy-lane0",
+		.num_resets = 1,
+	},
+	.flags = SKIP_PCIE_RSTB,
+};
+
 static const struct of_device_id mtk_pcie_of_match[] = {
+	{ .compatible = "airoha,an7583-pcie-gen3", .data = &mtk_pcie_soc_an7583 },
 	{ .compatible = "airoha,en7581-pcie", .data = &mtk_pcie_soc_en7581 },
 	{ .compatible = "mediatek,mt8192-pcie", .data = &mtk_pcie_soc_mt8192 },
 	{ .compatible = "mediatek,mt8196-pcie", .data = &mtk_pcie_soc_mt8196 },
-- 
2.51.0


