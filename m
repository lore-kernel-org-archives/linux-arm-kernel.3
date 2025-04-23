Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935ABC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 09:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WgvWtre4TVJu4abfOj2tsJSftrHxJ/AAw6dT3bLtEKM=; b=eWNZGwi+1Wx+Hxo1mr5SGFj4C4
	IHRcjKWNgJGA+RibStG1SWOL732xj5zUN59+6aR4VPHdznVoNlgDlkh7HhTrkRKIOf/RElGsJX8iI
	DoFfEyJMC2Ze2AJKFVr9dU0UHdF3HmntzmskCyWSMhQkH/GU9xDk4+iCuCTlxCKbr4S4emcgsi0/E
	XOO+bgHtkjazzASUD7H4CUvkI8YJUIW+M1ha4XEN2PfNGeFaE51V+lMpCj9mGYlr6Whxn3Fcm5+XS
	uOpm5KgyJyW1JellQCPVXCO2BiAwHskm1JoJ7YOHXv25y0rHEfaTru902Ra/tYLZ8wm5U7Xa31Sxo
	zRuIZxoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WnM-0000000A4fy-0vXG;
	Wed, 23 Apr 2025 09:53:32 +0000
Received: from smtp-fw-2101.amazon.com ([72.21.196.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Vn4-00000009p0M-2GDG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 08:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1745398151; x=1776934151;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WgvWtre4TVJu4abfOj2tsJSftrHxJ/AAw6dT3bLtEKM=;
  b=AJLqtDFQKH0+rMkBSC8wveLIBvEcbPFr0AUejEAgTj8sGTluPVXn+I5E
   N8l1eCwGu4hXIsrUS58tVCP89+84gsG3qdu+el6whsBwPKaEBytoznldO
   STvBbGUMbmF0WuKTm8tbFfl3GzmWQ6YjdpwV6MLLp2HUFIRAESe61zTm9
   k=;
X-IronPort-AV: E=Sophos;i="6.15,233,1739836800"; 
   d="scan'208";a="485479226"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 08:49:06 +0000
Received: from EX19MTAEUB002.ant.amazon.com [10.0.17.79:25335]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.19.73:2525] with esmtp (Farcaster)
 id fc92da43-f71c-4df5-b171-aeeacb675f07; Wed, 23 Apr 2025 08:49:04 +0000 (UTC)
X-Farcaster-Flow-ID: fc92da43-f71c-4df5-b171-aeeacb675f07
Received: from EX19D029EUC001.ant.amazon.com (10.252.61.252) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 23 Apr 2025 08:49:02 +0000
Received: from dev-dsk-bsz-1b-e2c65f5d.eu-west-1.amazon.com (10.13.227.240) by
 EX19D029EUC001.ant.amazon.com (10.252.61.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 23 Apr 2025 08:49:00 +0000
From: Bartosz Szczepanek <bsz@amazon.de>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <nh-open-source@amazon.com>, Bartosz Szczepanek <bsz@amazon.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: Extend pr_crit message on invalid FDT
Date: Wed, 23 Apr 2025 08:48:51 +0000
Message-ID: <20250423084851.26449-1-bsz@amazon.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.13.227.240]
X-ClientProxiedBy: EX19D038UWC004.ant.amazon.com (10.13.139.229) To
 EX19D029EUC001.ant.amazon.com (10.252.61.252)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_014910_739549_C3CDA700 
X-CRM114-Status: GOOD (  11.49  )
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

Log size in addition to physical and virtual addresses. It has potential
to be helpful when DTB exceeds the 2 MB limit.

Initialize size to 0 to print out sane value if fixmap_remap_fdt fails
without setting the size.

Signed-off-by: Bartosz Szczepanek <bsz@amazon.de>
---
 arch/arm64/kernel/setup.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 85104587f849..77c7926a4df6 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -169,7 +169,7 @@ static void __init smp_build_mpidr_hash(void)
 
 static void __init setup_machine_fdt(phys_addr_t dt_phys)
 {
-	int size;
+	int size = 0;
 	void *dt_virt = fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL);
 	const char *name;
 
@@ -182,10 +182,10 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
 	 */
 	if (!early_init_dt_scan(dt_virt, dt_phys)) {
 		pr_crit("\n"
-			"Error: invalid device tree blob at physical address %pa (virtual address 0x%px)\n"
-			"The dtb must be 8-byte aligned and must not exceed 2 MB in size\n"
-			"\nPlease check your bootloader.",
-			&dt_phys, dt_virt);
+			"Error: invalid device tree blob: PA=%pa, VA=%px, size=%d bytes\n"
+			"The dtb must be 8-byte aligned and must not exceed 2 MB in size.\n"
+			"\nPlease check your bootloader.\n",
+			&dt_phys, dt_virt, size);
 
 		/*
 		 * Note that in this _really_ early stage we cannot even BUG()
-- 
2.47.1


