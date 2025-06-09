Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D99CC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 22:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0LMCevDXMHdSbreINi9ovgK2lLQA7N+OHtW2WG25EAI=; b=I8gC2i4cLUt2S+pmvxO/afHcDK
	A2UkhZBWZ55EA6nID3RJxFGkgiU9I0H/iZ2ivxWOa5NHJlueXjHPZZAbqo8fXj3zhMEDFAiE4WvRy
	MzEShPLzV7S34gAj3LJSIuWzOJFQ490vj+CDr7erH4Q0dN9Uzxo6O8TLU+YI10Q7Cf02+UCQY1uXW
	n2uAouv4UWZ5vYn+6Nt3zwwtRMPZWNZ+ysOTwKztJdXsk+a0UZDmzapE2VINzo5bYPKyui0XM4R06
	uIT7bGvbAk8SYmzjy4hYd7HvCv5pZPteZUJ+lSPSI4N+8NFs2ESseQXfhi0gT/duRXdExOqOKUGT3
	K+RqDcnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkq4-00000005L06-26mS;
	Mon, 09 Jun 2025 22:19:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOknu-00000005Kfb-1PrD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 22:17:19 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-235e1d4cba0so38316115ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 15:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749507437; x=1750112237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LMCevDXMHdSbreINi9ovgK2lLQA7N+OHtW2WG25EAI=;
        b=XUwjI405qzcsgbyeQ3q5cLPHDxIR4YLnSDnt5WQ6/wTr6sxDjPWPvz2s/3xqd4NzPq
         jgA4WMVZrmVGxPeUICStJqQ0Utdxgzyve1iHaZucJzKQawrv9e84NnQGHSqbcH0R/nvj
         aEXYwGbWxjW8wHWNOOMA/rCefZL6IYDX7/QZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749507437; x=1750112237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LMCevDXMHdSbreINi9ovgK2lLQA7N+OHtW2WG25EAI=;
        b=sNIDtEg2IDEsOe2RC/pSzKHEJoSliExxaVgt09zxbjLVzc2C7ihOYLfJJ1kTcsfAqM
         prm2g/4zeLYKsN9ocdbVNTZpdYiVRqKs4bNlmbYua6uoDkeXawe0GmFqHZwRRBxZacfg
         zAa91WUg110gniYCN6jO0PMgPfA51KVvOG2L9e/khkGEH1Ip3NO/yu4jf8juAQdLerpt
         +BlZ118XJsAllSPrt8mcmJUpbyQohxbROelNRbu8ZKMXgTBLrZC66fzK2OYYeLMvswsG
         XW1eZAMkU/5fApTDc4DKArriz+aq1tk79FLQY5G3q3mGPE8wWZCIFe+cSQ0twGL0JfuX
         2M3g==
X-Forwarded-Encrypted: i=1; AJvYcCVLeTtc1VeLeXKiMSObRuq3aMlsdFrM50kylXUn4CDKuR9n71Z4nqrT9xwqZcOyoQymZ/hZqPbDYoBw91aXUurf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7kU/Xt31Trs2hOSRaTsKY82bQgtdYQAVRwkIo+BHJUy+xUTpk
	uuCKOpqT5kkc83ZgeXhXmPQ2p86Zd6bdXTG1yW6fnPFSwYpF0y5A229pVahPrNH6tw==
X-Gm-Gg: ASbGnctrmOwA320cFM225DR1Ibuxf/wFLHtaCt/vzx2/47PneXsz6xcpnx/vxxcR1k/
	2gcHLm+7jyWljUSvIizc9yJlB9mruqExpJhJkmSkwu/fooNAtbli//GVi+QKevey08HbMfAdcw/
	KrqDKrb4wZo30I62AMnoBtZPiAhyno6gqNahIbwjvItO4wX/s+ScP+EQQviOQ3GEQ3L6AmX1Edm
	sdDCiPTba3xcCCTnn/fVpGpxhroebSDx9PFL8iNpXtmLzZsu3+oKFlgKvuSYW9xn3BMsCvNWe4p
	ABXblRsGUWxBDAGRiBKWZmnQsdAC/458Y5wXaQNA20FZllF2OdW2an1uH8Ax9wlfijelbGkeCRp
	1rNMCtBcJsp2At6nXPv/D+l/tThcHBxsWGtabXlBv2g==
X-Google-Smtp-Source: AGHT+IFUjmcbbkIOR7TTH9wu7tiMbf9RN0Y6LSdxDSg6pkLLd4mf/C1TRHZZ8yuUsvW2madDoeJTXg==
X-Received: by 2002:a17:902:ea0f:b0:234:e0c3:8406 with SMTP id d9443c01a7336-23601cf42b2mr215945945ad.1.1749507437017;
        Mon, 09 Jun 2025 15:17:17 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078d65sm59290415ad.5.2025.06.09.15.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:17:16 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH 0/3] PCI: brcmstb: Include cable-modem SoCs
Date: Mon,  9 Jun 2025 18:17:03 -0400
Message-ID: <20250609221710.10315-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_151718_401068_79FF5DBD 
X-CRM114-Status: UNSURE (   7.40  )
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

At Broadcom, the Cable Modem group and the Settop Box group use the same
PCIe RC driver for multiple chips.  This series adds the CM SoCs to the
compatibility list as well as some CM-specific code.

Jim Quinlan (3):
  dt bindings: PCI: brcmstb: Include cable-modem SoCs
  PCI: brcmstb: Refactor indication of SSC status
  PCI: brcmstb: Enable Broadcom Cable Modem SoCs

 .../bindings/pci/brcm,stb-pcie.yaml           |   4 +
 drivers/pci/controller/pcie-brcmstb.c         | 193 ++++++++++++++----
 2 files changed, 159 insertions(+), 38 deletions(-)


base-commit: cfc4ca8986bb1f6182da6cd7bb57f228590b4643
-- 
2.43.0


