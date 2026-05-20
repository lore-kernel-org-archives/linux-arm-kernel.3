Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D55FCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 04:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1cp9Yn3jVfRRV3qM2GkSwh53cV8UThfVVVtOf4pBdTU=; b=zlHsoz0akqYQOwOmi/rCkHhE6/
	15G3j5KduiXBPdxila0FmRVJ5m9xdHlB7u9620/dDKRgM957CEcy7RT3pZQF8VJBaqB8T7sGcY/ZF
	JRgWAdQK4WDwlnswe8VefGdM8MA/qFzQsIytYnIs5tiD/1vpsZD64/g7JMt14J0UQVN0ma4SpzVas
	fpgqTlm1EBjGus3yN//y+/fXHy2QWxSMFPI8c56syE0oDHkOJsIbKnoPE4moM/BkgEug07Zvzmn4G
	xvQcOzdFRk+XBe5mqeN+TB0KMO0UifkiNxqjmrZgm4kejDQEQp9ViQwqaqBqbu3W9jSZZsZxceogq
	m2x/9TYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPYKC-00000003Sf6-2l8f;
	Wed, 20 May 2026 04:14:28 +0000
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPYKA-00000003SeW-0N1z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 04:14:27 +0000
Received: by mail-dy1-x1342.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso1652116eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 21:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779250465; x=1779855265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1cp9Yn3jVfRRV3qM2GkSwh53cV8UThfVVVtOf4pBdTU=;
        b=mE/DDxWIAR+M2vYezGsCa3jVRJyV3RHAzUXcb5y5Ohc0dKTPrJsJ2Y20OWnoWiSLZZ
         vTb/KTr0r7/48v5Jo1ztKNKBbFXrlZRBIf72aNtdN2KvZrm6BXGpiIQTQjtRY8VS1PnJ
         2au+AM3zKeboHNes/BnWA4RKX7sqPlc2Ipu0bgnz3aIDY2/7++ZZO68Gip2RiG9MHml1
         ISNtX+4twkY47lTg4avoEQOu7hHXBTEta93w+ttrpzFxLyypRsHEzLhTaQdMWIxrndqX
         A35eAC1+woDLL0qQYfy1ZimSUe2iaaPNtPKohlVXy7p1ET0akszMDLMdlXwxCARhLfpX
         OGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779250465; x=1779855265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cp9Yn3jVfRRV3qM2GkSwh53cV8UThfVVVtOf4pBdTU=;
        b=KEivU7Sn61nm9dKn+7ovn+f/0YX+WCSlgRCU7L/al5uAd4OorMoWZhr3k/CG4WHd4U
         E0SxyAFUlhwmKve7ZyqPiPYVjWCJ7ZZtoH+yGKuLhnDe49Jz54KFgFLKO1IQ2b1z5LqQ
         La/D6btEsW3FGr8y7XKfgfO3t/airR+SPFhunG+5dO56NxWdT+madvSs6UPuKVpbCwLe
         S1R12/VNqMovEQm5p9i6B4fDDTWD4uYJQkLReR5yML63LUmTI/JfjiFb/ZPOxJT8Zl6b
         3hWRXbWYjyJw/31b/UlacnuBZFjUzTHn1pvd8I7kGJwPfX3C617tQJjNU4p1e7gCEnB0
         eG/A==
X-Gm-Message-State: AOJu0YxHHZ83A7tPy9IeLIu2h4vNNf1NrGduErJD89Vs5qzgKhBNuHRu
	tylvH6wkIDnvBIvu0kOnlVXOdT8udNwWSTad5uWEC2MyBm2NGIzjCrb9R0WK6g+ONZE=
X-Gm-Gg: Acq92OGOs8pNiDybFVE6+PjstVM6gq+C4sPydlYZZSlqU8lr/iJxOI7p8sUOwKgHpv4
	0Z7R+tUtHhZVg70x3RbX9+HO0x7y37pBqVopUqU2TfQL3XJbqK7s9tSrAEI2k/2mEQHoGqlK85w
	HhZoS+OTChpdLcYQeO7+gs0ooKEOaiuyzatupLrUfjFM/1aBzxDs3IlSd0qDfDtGh/8EHsCEYry
	Ylvz7kOkr2NCvpVyR3dMpC9mK0DElbltg2B3bbKWsp3mItD+Efgn07H9Zb/20yPV3wA2vv9tAE5
	8NCYM9Frq9iHUoxcIl+I1pFIRhDhwRRVOt+GoTmQ7134tHlUOe7vRMp8fzDm05Tco4POMctPAAb
	eT9iYjdeYgRrUk9Hl1SDZw9OvsEZm4pMt3aQAhv2V+9hVFvBsUziAxI0Bsf4UjfWhggGL1BsKWG
	XRtLDIaeetxNyddT6cgZSQrjM19ndjodmoXaA71v2MSvF1LzDFxfCHT0JiquR04qfjmuN5b+kNT
	RhTxrX+I07Xd/ethlBX3bBRsqDo9B8WVmRdZsKXehupl2wWi+nQORGB4x/JV4ln7XJ1qUfc/E+9
	kInTbnKrMfYg4DRYUQ==
X-Received: by 2002:a05:7300:aacb:b0:2dd:5641:ef2 with SMTP id 5a478bee46e88-30398642912mr9856502eec.25.1779250464758;
        Tue, 19 May 2026 21:14:24 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e686sm21333638eec.5.2026.05.19.21.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 21:14:24 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ARM: PCI: merge pci_common_init_dev() into pci_common_init()
Date: Tue, 19 May 2026 21:13:38 -0700
Message-ID: <20260520041343.23040-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_211426_137645_1AAB2C19 
X-CRM114-Status: GOOD (  17.74  )
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

pci_common_init() is a compatibility wrapper that simply calls
pci_common_init_dev() with an additional NULL argument. The comment
above it implies that it should be replaced by pci_common_init_dev(),
but that has never happened - there are no callers of
pci_common_init_dev() in the kernel. Make the PCI code more
straightforward by getting rid of the wrapper function and instead
removing the device argument from pci_common_init_dev() and renaming it
to pci_common_init().

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
Changes in v2: Instead of removing pci_common_init() and converting all
callers to use pci_common_init_dev(), simply remove
pci_common_init_dev() and the unused parent parameter in
pcibios_init_hw(). Suggested by Andrew Lunn.

 arch/arm/include/asm/mach/pci.h | 11 +----------
 arch/arm/kernel/bios32.c        |  8 +++-----
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/arm/include/asm/mach/pci.h b/arch/arm/include/asm/mach/pci.h
index ece5283bdaec..83777d8c8e65 100644
--- a/arch/arm/include/asm/mach/pci.h
+++ b/arch/arm/include/asm/mach/pci.h
@@ -50,16 +50,7 @@ struct pci_sys_data {
 /*
  * Call this with your hw_pci struct to initialise the PCI system.
  */
-void pci_common_init_dev(struct device *, struct hw_pci *);
-
-/*
- * Compatibility wrapper for older platforms that do not care about
- * passing the parent device.
- */
-static inline void pci_common_init(struct hw_pci *hw)
-{
-	pci_common_init_dev(NULL, hw);
-}
+void pci_common_init(struct hw_pci *hw);
 
 /*
  * Setup early fixed I/O mapping.
diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
index ac0e890510da..a5d3c31bfa55 100644
--- a/arch/arm/kernel/bios32.c
+++ b/arch/arm/kernel/bios32.c
@@ -424,8 +424,7 @@ static int pcibios_init_resource(int busnr, struct pci_sys_data *sys)
 	return 0;
 }
 
-static void pcibios_init_hw(struct device *parent, struct hw_pci *hw,
-			    struct list_head *head)
+static void pcibios_init_hw(struct hw_pci *hw, struct list_head *head)
 {
 	struct pci_sys_data *sys = NULL;
 	int ret;
@@ -466,7 +465,6 @@ static void pcibios_init_hw(struct device *parent, struct hw_pci *hw,
 			else {
 				list_splice_init(&sys->resources,
 						 &bridge->windows);
-				bridge->dev.parent = parent;
 				bridge->sysdata = sys;
 				bridge->busnr = sys->busnr;
 				bridge->ops = hw->ops;
@@ -492,7 +490,7 @@ static void pcibios_init_hw(struct device *parent, struct hw_pci *hw,
 	}
 }
 
-void pci_common_init_dev(struct device *parent, struct hw_pci *hw)
+void pci_common_init(struct hw_pci *hw)
 {
 	struct pci_sys_data *sys;
 	LIST_HEAD(head);
@@ -500,7 +498,7 @@ void pci_common_init_dev(struct device *parent, struct hw_pci *hw)
 	pci_add_flags(PCI_REASSIGN_ALL_BUS);
 	if (hw->preinit)
 		hw->preinit();
-	pcibios_init_hw(parent, hw, &head);
+	pcibios_init_hw(hw, &head);
 	if (hw->postinit)
 		hw->postinit();
 
-- 
2.43.0


