Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9569C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 22:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vh/JtGXJq1ScSanttjAc4pgnb9sqVVMcQN566gVE5Cg=; b=jKAZ31wZPWXgzTnwHkm5+HsZrW
	cbaJlxBKS2a0sTQgsE3IIxLXuJoAAvyhxui64KVe2f2d9MK6Ahw9y4qY18Xni2WQMBXdD5AeIQQ+L
	xUHsqoeucs4UXaZdcl2b+Hqi43uNqzsDYWCNPDuRQINZ7680xJpA7qCB1i7lL3zgHttHqs09bJwpI
	VS/Zk2jwmIxIkvK9d97Qavq79jHjYibLDcsK9OzEnhkRRo7z1UGEGhF4rzFIl0qnOB2V35bm0L7j/
	sshH7AtrqFgfPX58FP5NQZBxVL73j3eFGDvOGm+pYoLkAlqwBT72Uy3lRwQ2XLN4i65ipB90R6Mca
	OK0L5CNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOksD-00000005LAB-3BI2;
	Mon, 09 Jun 2025 22:21:45 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOknx-00000005KgZ-11xX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 22:17:22 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so4456666a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 15:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749507440; x=1750112240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh/JtGXJq1ScSanttjAc4pgnb9sqVVMcQN566gVE5Cg=;
        b=hYdUwBvcCcmXeNQUnJHdODuV9UDo0sXG77X1yqUydJLNmVJ5BJlw3crKtVgeyor6KA
         ObxksunGaSFf9m1X5zlaW+xt8hMr6PWKEkknpoNuaGJtaWrf5Na1TPf/8T2qFwHuCqOH
         h4l60hIi4wzjUBTfIxLyuj028fBTPCbCB8ewk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749507440; x=1750112240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh/JtGXJq1ScSanttjAc4pgnb9sqVVMcQN566gVE5Cg=;
        b=Jt9jZrRi0DhaQXfUG9rM12L+IRI6Sv0asA6l4e1PxCqgxTAUFAehO62jb/XpkB2bdh
         KfAr/1qwQT4FPlfnaFTRdL5WXLrJuRdBnVUsNdkNtaDFIcPclMdwFnIEgjjHusy2Igg9
         cCzTXcMJgFvQ4YcmP+PnDHnnFqcL1Yr6rG4mVav6oRRCLLtQOkhMMuyZoCaVhy+m894d
         H9pBnEmRzMnk706u+rCZnynu4W2c6iN53IMgV6Sc/s9HtykApYOJyBLK6ZzC7X26eJyW
         gvB62lPQHmZRR03Pn4itjBNffmrsdZas2hMjSUj/P2rXVx4ChetOZTp7pott2/0anVsc
         +YTA==
X-Forwarded-Encrypted: i=1; AJvYcCVzOsVVF3Wm+kx9sJJIbnoPZaBq4gDQdenSmJ83fP4TbwTZL2JQhmftdwkly+4uuTogXBzl4JOp7+3gEbJ/S1Yv@lists.infradead.org
X-Gm-Message-State: AOJu0YyIbEeaP5Ao/iVszlXo0pO0ZCXQiLHxmsjoDX5EI+QBw628dxxg
	x1aPsGQ4nJ/GJlmmaPT2Hfw2e43U7KscqDm75QpbQHd6z4P96NXk2s7BEZlrVnABoA==
X-Gm-Gg: ASbGncs+cNR7462es1VV8doZ/trgTElbAZirfK0KcniFl6xVTBlvV87FVU3XAMSZu/H
	CC1PO0JfiBpSFb3zqxxnDg82WtKzcHzeQKBkCpVdamPMq8hAWtgihROF4tDoYjgCpi8km0s4ztz
	rM2zRl2kl1Y341PGVBHKT/kDlwiTSqG48UNJ1dD7Yi20qISC5Kh4mJOriInIwktB03ZCPP2I5Q7
	P1snfpZ3LoI7oCi+rgdzk6nkZpz/YZ3xIm1sNEHgu5oLF3Tj9GsN0x7PTEVwL+FSFozUxff2FH8
	mCKVofLgaID449J2UzdozZVppu+4Yhy4CoR9D5fcZbWrORsDr865XWwmByuH7VzlDCthw+6i3sZ
	DH6GUm4+8yy/kqIuzatN25PgDD8r15GrcIxZUqhXdJg==
X-Google-Smtp-Source: AGHT+IGu+nDuRxQ9N/1g/F5ZQ5bigX27pmvAno5gKj+c/t7BgQSFCAow3ysCS4pqkXEmCzwSGjxbww==
X-Received: by 2002:a17:90b:3c8b:b0:311:f99e:7f4a with SMTP id 98e67ed59e1d1-313476822a8mr16779583a91.26.1749507440399;
        Mon, 09 Jun 2025 15:17:20 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078d65sm59290415ad.5.2025.06.09.15.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:17:19 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] dt bindings: PCI: brcmstb: Include cable-modem SoCs
Date: Mon,  9 Jun 2025 18:17:04 -0400
Message-ID: <20250609221710.10315-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609221710.10315-1-james.quinlan@broadcom.com>
References: <20250609221710.10315-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_151721_288829_99E934E3 
X-CRM114-Status: UNSURE (   8.83  )
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

Add four Broadcom Cable Modem SoCs to the compatibility list.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
index c4f9674e8695..5a7b0ed9464d 100644
--- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
@@ -15,6 +15,9 @@ properties:
       - enum:
           - brcm,bcm2711-pcie # The Raspberry Pi 4
           - brcm,bcm2712-pcie # Raspberry Pi 5
+          - brcm,bcm3162-pcie # Broadcom DOCSIS 4.0 CMTS w/ 64b ARM
+          - brcm,bcm3390-pcie # Broadcom DOCSIS 3.1 CM w/ 32b ARM
+          - brcm,bcm3392-pcie # Broadcom DOCSIS 3.1 CM w/ 64b ARM
           - brcm,bcm4908-pcie
           - brcm,bcm7211-pcie # Broadcom STB version of RPi4
           - brcm,bcm7216-pcie # Broadcom 7216 Arm
@@ -23,6 +26,7 @@ properties:
           - brcm,bcm7435-pcie # Broadcom 7435 MIPs
           - brcm,bcm7445-pcie # Broadcom 7445 Arm
           - brcm,bcm7712-pcie # Broadcom STB sibling of Rpi 5
+          - brcm,bcm33940-pcie # Broadcom DOCSIS 4.0 CM w/ 64b ARM
 
   reg:
     maxItems: 1
-- 
2.43.0


