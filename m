Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2804DC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rl5E0UVjy+KHHY0GruFIRH1nxCM5/nCEesXNNBsIatY=; b=1Btvcrzl7wMpIvwA+5NueBa+RN
	4oowyY0fCsIY5bcCIKstyr7WCc4Yd5sirhyucw+LvJrGbn5EtZhZVrUQtzLs032cANMsNEmBbmr5J
	ECKVXMdvrfkVkAUOOBQtD0IbHyOKpxZT4C6kkuoVbivFzpdeYrQPtCSOTtu4SpeRffe+bLw1KVuUF
	5UG5XTpYDF9I4J19bBbm9dPSUOYoejhkV0v5i6y2eemkuI8XEv7s8UqH4xCXVXPVrOjxPXalQ0s9q
	qg7iVY5RlX2KuLmYAsmPUgjT7uM35U0KwbME21yDCGd/5WOm/wQoELWvaSpERQPP97qA3PcyR9tNi
	s7c4wLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfktA-00000004NoF-3Zxo;
	Wed, 05 Feb 2025 19:16:45 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkp8-00000004MhL-13f6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 19:12:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21f169e9595so2614015ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 11:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738782753; x=1739387553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl5E0UVjy+KHHY0GruFIRH1nxCM5/nCEesXNNBsIatY=;
        b=N/QSqxOolX4zcPCRX9nduBMgNiKBDqu7UrshMh/yePtCbL8suWkNSvd5Wgxk9eK5IU
         csRoanT2mZJ+iMO61MtBLxWd6bw97NRsRa/JBPhsNNmzLa0gKFU82n5TxeI88mWad/bf
         2L+Rf+MBcLv/Z5xfPqI2w0nbtyL+Rhy2RDRMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782753; x=1739387553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl5E0UVjy+KHHY0GruFIRH1nxCM5/nCEesXNNBsIatY=;
        b=nTvOuAGjyl7RUxVka0hvXRtBB3Q0YGm5UYvDaG39lNJPgxAMl94Nfyq7WZzUuwYw1J
         cwSKdlIBwzkv86oe/tBFAlRE6XW1p+cmuMCIU6ke76xW9ZOanpSpQY7xQ0nhLekni5j/
         loeUl9tkHcO/ocNHYyRjLtqAi2juPSADt7eZxeKailV4dcu+Q08qI4ltL/CNbOASV2Bp
         ApbML8L1vzZgwA5XoPoNfK+GeOehedOs2mF6RXsJmmOIC8AFbEr5UDxqHwBX1XylOfIl
         1Hqaym6QVs5RKEbPV6Ah4cXUbIsn5267A3oPwSA9OdbW6HmSJXhkXVdVcpi9s26dWAio
         f1BA==
X-Forwarded-Encrypted: i=1; AJvYcCUGywBw0FNBvN9VPAIQFpNwZb8konAv31snBVCvLaBntxbzM86tnmwI1n7OucqDyTOKtVLCTj0OsvRVtnbaVkhz@lists.infradead.org
X-Gm-Message-State: AOJu0YyfN4DyOHp9dJVvckayXXpliXbOxOtqaGBl97H/a6HbNsLPz1Mz
	GG1vScUajuzGnB++izOVtj3mRvBR9hcKZNtNhCaivZLkMLDwYlSW/E2lGlWaBQ==
X-Gm-Gg: ASbGncvue+a9fPfkz3Ovr6KYUoWAQgX2gssClXZwA+KOsk9Rv3is9Rb3VkXWQ/u+WwL
	1ReCVTUnhhGolftXOYaS+FdzIQO45f/bQ+Q4zoNHfFPmJmvwkvk2QaDCaVvRSLW8G37CdSb7POl
	UlabR0EJIVOvSrFUNsS6yEq05lENz9rabYizL5AJtVC2DbnFSD5TnQDWa1Ah8fs3OCBdTBR42ap
	GURLtePQHxWwOmFayBElV4M7woap320RkPsbg7QIJKHiPjKqWAazuB3l/gDi0Ia4mBW1JUb9qFX
	WOHnUFLt3SEgSyLWalAQgrjzLFd7NYKhUUroOYhHzh1D4UTvU3X4DtHa7nP9sTleIEHGEzU=
X-Google-Smtp-Source: AGHT+IGHNDQdUmc+0d+Oa25tolqBbEh64Eprx1WXUEnsJUtgXypSDf+wemV6e9iAiBws6tIO7Kj01Q==
X-Received: by 2002:a05:6a00:3cc3:b0:72d:3c4d:c1ea with SMTP id d2e1a72fcca58-730351017f7mr5551115b3a.7.1738782753270;
        Wed, 05 Feb 2025 11:12:33 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm12670842b3a.151.2025.02.05.11.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:32 -0800 (PST)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 3/6] PCI: brcmstb: Fix potential premature regluator disabling
Date: Wed,  5 Feb 2025 14:12:03 -0500
Message-ID: <20250205191213.29202-4-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205191213.29202-1-james.quinlan@broadcom.com>
References: <20250205191213.29202-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_111234_293833_228AED45 
X-CRM114-Status: GOOD (  14.37  )
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

Our system for enabling and disabling regulators is designed to work
only on the port driver below the root complex.  The conditions to
discriminate for this case should be the same when we are adding or
removing the bus.  Without this change the regulators may be disabled
prematurely when a bus further down the tree is removed.

Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index bf919467cbcd..4f5d751cbdd7 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1441,7 +1441,7 @@ static void brcm_pcie_remove_bus(struct pci_bus *bus)
 	struct subdev_regulators *sr = pcie->sr;
 	struct device *dev = &bus->dev;
 
-	if (!sr)
+	if (!sr || !bus->parent || !pci_is_root_bus(bus->parent))
 		return;
 
 	if (regulator_bulk_disable(sr->num_supplies, sr->supplies))
-- 
2.43.0


