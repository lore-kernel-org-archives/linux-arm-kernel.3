Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB932C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6QHOFRNJhHhOjARobq8OyaLuqSsqExhlwJCJ5EBtPr8=; b=FCb23b8By57wh1OWT/EXaUcJ38
	ChaebPL+VUjdHrfNgYDD2kdIAGcqCvA9UoSUyRuxonK8Qhe3T/+lQBZbxhI9y+znZEX33pgWtzvFh
	mvjYTsR8wzwsTkUX8/zDIHvgWME/VgZ4lPCtYn57dvqYJE+EGE3Fb+upLrdAPF9eF4QvOiK34VTZv
	zLRrez1kZIcqxmquubYJM2t3C5+PMUUErKSjL/RGdt5nBLsqZHO6ojki3Y02Cmx95G7fMyBMuKSFh
	7nvV+QgvBx/dkuEFbOCGYIE50cRrWRvWqrNkrlgDJZn7WvilW9oOlrLP4CZNWLRUMtc5kdUYYNBer
	Sz66v6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXk-0000000Cqi3-2leX;
	Thu, 03 Jul 2025 23:40:40 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRrt-0000000CeqK-0S3m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 21:53:22 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-236377f00a1so4203315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 14:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751579600; x=1752184400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6QHOFRNJhHhOjARobq8OyaLuqSsqExhlwJCJ5EBtPr8=;
        b=KVBj85WWUWwd+iZimhMlsrZUTigVDo5OMVoxuuQw4G1tHT6AweOTC0WlvGFmpx/817
         lgGCtgSNcDRV9h29go176eX/Hb8bmznAwB8UppLs8rqNrSjgED8KrifzMsekj+p/fr7w
         Y28bQ2oBC7m2xECgcwX0ie7VShSWugODJM9XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579600; x=1752184400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QHOFRNJhHhOjARobq8OyaLuqSsqExhlwJCJ5EBtPr8=;
        b=ISchZoFRdqozhTgZLAYaPNQCCCx9fRf+X+tVVyQZP39UGd5NFGVgD0Pzc0jaTUjjBF
         OQJlkvQpb98s43v5myHXEwysxIWYqsH/kWZBxTC4Xq9HGaSFbXt0hzG8MS2Ksi/ug3nu
         UvpGP1aXCgPS1RRge2YTCEEHYMjxstfR6J26bYDASlNIAmB9dvrbHYrXq1PUp8MD72zD
         ZkPeEoULLgqdtJxrRwwswPyBICwbQael0BrcYeDII91/NmHamjyI3Yvf2HZmy7zLS0nc
         J5itQ60DFgboXsaaSpFKiGp7Q4ar6c2VJ3X58nAA6tzKxxtjSuAmpz6RWiQ1mFjnyAx+
         FIXg==
X-Forwarded-Encrypted: i=1; AJvYcCWAHE4y45WM0/eLpcKRvewr+ff+zTFSPJ86XYGyYz/zEzpq+QAoNAwdtjGPou7dPdiusb1FsRO+KYO32nfuQXrt@lists.infradead.org
X-Gm-Message-State: AOJu0YysU6+L9T/GJqJ/FUqs5Y/SGtGs/MAGW0p7kPINQ9micm6ONW/I
	5Z2N5q3WdOLUPqbfnIsZDKqfrmijk25bED+60F3Uwlf9gNe/T1uFveEk8IogQHv61A==
X-Gm-Gg: ASbGncuUasMIPD90T+B12bN9o/Md8j54e9MwkudkuE5pCRuMzTp6eK1QFR0tcTmfF5F
	CZj+SFSoF7LXb8qBWAEF2XDxCchnPyeT/WDb5e0SCkkmNovWjXenORFET8zXWUb/Jx2QN5KaVvU
	+BeQj53aEYj1CmPy0SIK9FdimR7wuKxbWAL+jwxDQ/N6p3WtwAAqNzhqCeZlkKPzyAPioe8W44q
	njHqn+iw4lphKZhJdtJ/eYtFcwxo5Mytnt/J8r8W+WfMRCxNyw23O2im6XqEBTyePXDGqN2uNqE
	zV1m1Z+KmpItcoht/KcRizHytVTlVL9CH6Cz+bYAhn8X6lIltZVjTkftpHV9GDLYv5fdfhG6P+m
	QVVjbUIo5HVkZVs5Nv4REgsYCqS72eQiJrXd0f3K5bA==
X-Google-Smtp-Source: AGHT+IH1w/Scs51jqqCK2u43ZpgzBf5ux9DORxds0o5CL5IqTPJAJcSzUBzUBTLiAES9RgG+Ppy0jQ==
X-Received: by 2002:a17:902:f641:b0:235:779:ede5 with SMTP id d9443c01a7336-23c86132b70mr3755145ad.40.1751579599657;
        Thu, 03 Jul 2025 14:53:19 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8459b3a0sm4249645ad.219.2025.07.03.14.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:53:19 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/3] PCI: brcmstb: Add 74110a0 SoC configuration
Date: Thu,  3 Jul 2025 17:53:10 -0400
Message-Id: <20250703215314.3971473-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_145321_243542_F48437F9 
X-CRM114-Status: UNSURE (   8.45  )
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

This series enables a new SoC to run with the existing Brcm STB PCIe
driver.  Previous chips all required that an inbound window have a size
that is a power of two; this chip, and next generations chips like it, can
have windows of any reasonable size.

Note: This series must follow the commits of two previous and pending
      series [1,2].

[1] https://lore.kernel.org/linux-pci/20250613220843.698227-1-james.quinlan@broadcom.com/
[2] https://lore.kernel.org/linux-pci/20250609221710.10315-1-james.quinlan@broadcom.com/

Jim Quinlan (3):
  dt-bindings: PCI: brcm,stb-pcie: Add 74110 SoC
  PCI: brcmstb: Acommodate newer SOCs with next-gen PCIe inbound mapping
  PCI: brcmstb: Add 74110a0 SoC configuration details

 .../bindings/pci/brcm,stb-pcie.yaml           |  1 +
 drivers/pci/controller/pcie-brcmstb.c         | 80 ++++++++++++++++++-
 2 files changed, 80 insertions(+), 1 deletion(-)


base-commit: 17bbde2e1716e2ee4b997d476b48ae85c5a47671
prerequisite-patch-id: 82aa80f7ebaa1ee1d48b59bd7f1eb6b21db3c41d
prerequisite-patch-id: e7b6b6e618ee225c9f4892a6078e7b3c4f8b1c73
prerequisite-patch-id: 66cabe0efb02132ce7cf8a849b5bb7f19ab407a2
prerequisite-patch-id: 118fda1b363bc18ef0736f917d1dd5497699156e
prerequisite-patch-id: a48573e6eca090a032c0932ff89f26eae4162db8
-- 
2.34.1


