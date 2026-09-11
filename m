Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCE7C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rotk05yu0Xd3HMjEskHty3X9+grsIXwKqieBRwiJJGY=; b=dK2QeB+fTcIsuz+R1Dw87r194W
	iHxdQuDiHpWK5zLLe9vOV3qekHE6ZI8tLhJ62gnC8LVtDprJwbbfvQ452IYpAFCeN8OOiP5UJPQ1U
	5/2gI4cUfhZoYc1CvL2fB6jmSagcjRryfL0iR7zGLiNmdCVi30Ry1K41rWKhAZJ2UDs01cqSupi8B
	zwfiGVcU/f6gXEnuNtnlaYLp+oozbn7FtyHIORI+CqXA/fX8yDNfjSzzonxbB91dTunMAu85WCH7U
	zq8vlyi7sfgS0W8Z36VOHAOz9l2Rcfw3aP9h0eCKD0o5W6GRF2xIzk3IUxcvCMCxmNROX+vqwAYmu
	Dsp32HSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ami-00000000Mkr-0sW9;
	Fri, 11 Sep 2026 23:35:56 +0000
Received: from mail-pl1-x662.google.com ([2607:f8b0:4864:20::662])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Amd-00000000Mhg-1YSV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 23:35:55 +0000
Received: by mail-pl1-x662.google.com with SMTP id d9443c01a7336-2db710396ffso23218025ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169750; x=1789774550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rotk05yu0Xd3HMjEskHty3X9+grsIXwKqieBRwiJJGY=;
        b=nKSps7ljIRl2iyaE2iVur6J/rCwUlqDQ/ENIHbmkYXlItGCcyBceW/2Y6hIj9vc2kc
         Ex4jC+IdAVHGDLBBhBhGmusJh02jYBy8MfX3Mi6JLPr0S/CN4wO9N222re4OkGh2hO65
         TQ/h+w6I5LQ1Gn+O7fjSxKUtpuc2IRmQbKPyJ/fIny6IVItjRAJo8Oq/LLBSMw9/6RXI
         7Hl0AdEe8J0lpQgE8YbmXFxD5kZvHbjcFAcjwZ/bstNfhOU4IYAJ+LokX0S1nvSHO0cV
         IAjIBNaG7K/Iw7pC2jcrzmLxVIgHbaUHCsUHtPofKWi3nfAz7D3MMqMgBeiK5tOvHHnu
         p57Q==
X-Gm-Message-State: AFuF++kbQahr6h83R5AbAeNRW+bGa+aYeEqZ6BKksy4eUdqGD9cfcVsO
	DZCBJStOCb3N0W6A6TW4/gNtvWdbNlrwhX5YwdW8NEtv8hBiRqQEjdUDLVbxAxTD4kJiGGo2vfe
	mlVMtuZpZUSG9w4eoxxPXbXEkqut8oDky9epS7qrHWOxfCdGsf7mF5nZbVPMkuOU3DtB1YiZ90J
	zYSHVjk3JRNqiaUBmFplQ7ZzNqQW0KtCCEvdTQVUlhLL2tTRVJ+8SC3FxZtBUfMln5SQNyfDbfm
	OZPC/lwgzPPOWI6A2bwrZ8OVP+HKOM=
X-Gm-Gg: AYBFou1oXFJn+mFDpnH1U+axq2hdj7mqFUn0Sw6cMKY8pX5iCCCs/QadibXSYd8Mgkn
	YugTKXR5bKheNJW9qijagUx/uH2xdWygHLzlITUgNMM2cqQbSWPXeCUY6nYKsQIN+2FdO7AKkf0
	Ue3lj45E5AiJLrI1nw+mBh9Zrm3IfRots0qfaC0faka+Mvs9eZOh6NPhaY2hdobGT+AuHWfdvOg
	S6c4EAMq3HwXepm3di140OSI+SmjZfIcwEJbUBNBJR+IxVbX4oPySNLgM4o69olorm6M4GaeyAa
	HG8VlnaG2FMKWrufVtOQd7dBliOKgt3SCIGs/hglDWMiK3oYX0vP0NgMrpVZpVrQhnTdzjDJDqI
	SnJywEqQ+qTZhvR/fHzTAHw61kE/fs7LYgI81mkCfwNodffbNE/7r4b+K3N/6xCvRKHDb4xeVhS
	7fuT68G4fM7q43/gBmKKhAGJ8xSRA6Ow7n1vrv
X-Received: by 2002:a17:90b:35c7:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-39d97eeba04mr5842948a91.6.1789169749646;
        Fri, 11 Sep 2026 16:35:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39d994bf7d4sm2174162a91.7.2026.09.11.16.35.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:35:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91054f537f9so36980236d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169747; x=1789774547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rotk05yu0Xd3HMjEskHty3X9+grsIXwKqieBRwiJJGY=;
        b=Gh4TF6RfYFRVrY0+hwLyf89Luv0LgIW3xwAMMkfAXVIiP9XL3NEMVOGcXYqixQgOmE
         YsUVXDy7SHYnUWIkAgV4OSp7wPLI6IreB6vRRiLlKcejsWh8+ONw5zls/ssvUAED4WuC
         CyPAM+wpC5C2eGHCF+uTVtpEa797aGl0sCad4=
X-Received: by 2002:a05:6214:40e:b0:910:6686:1542 with SMTP id 6a1803df08f44-9120289fbdfmr146241196d6.8.1789169746831;
        Fri, 11 Sep 2026 16:35:46 -0700 (PDT)
X-Received: by 2002:a05:6214:40e:b0:910:6686:1542 with SMTP id 6a1803df08f44-9120289fbdfmr146240876d6.8.1789169746357;
        Fri, 11 Sep 2026 16:35:46 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:45 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	Rob Herring <robh@kernel.org>
Subject: [PATCH 00/13] PCI: brcmstb: Stop using chip numbers for conditions
Date: Fri, 11 Sep 2026 19:35:25 -0400
Message-Id: <20260911233541.1650895-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_163551_473258_7585FDB8 
X-CRM114-Status: UNSURE (   9.37  )
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

Much of the brcmstb PCIe driver code does (essentially) this:

        if (pcie->chip == 0x1234 || pcie->chip == 0x5678) {
                /* ... */
        }

when it should instead do this:

        if (behavior_xyz(pcie)) {
                /* ... */
        }

This series does the above.  In addition, some other minor improvements are
added in the hopes of making the code more readable.

Jim Quinlan (13):
  PCI: brcmstb: Remove redundant const specifier for struct fields
  PCI: brcmstb: Use flags u32 instead of bools
  PCI: brcmstb: Add Broadcom quirks macro
  PCI: brcmstb: Declare and assign quirk OB_WIN_32BIT_ADDR
  PCI: brcmstb: Declare and assign quirk OB_WIN_MAXSZ_128MB
  PCI: brcmstb: Declare and assign flag IS_BMIPS
  PCI: brcmstb: Declare and assign quirk 32BIT_PCI_OPS
  PCI: brcmstb: Declare and assign quirk NO_RGR1_TIMER
  PCI: brcmstb: Declare and assign quirk EARLY_PERST_ASSERT
  PCI: brcmstb: Declare and assign quirk PERST_PCIE_REV_CUTOFF
  PCI: brcmstb: Put max_burst_size setting in cfg_data
  PCI: brcmstb: Use order-0 indexing for inbound BAR window array
  PCI: brcmstb: Split up complicated function into two variants

 drivers/pci/controller/pcie-brcmstb.c | 267 +++++++++++++++-----------
 1 file changed, 158 insertions(+), 109 deletions(-)


base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
-- 
2.34.1


