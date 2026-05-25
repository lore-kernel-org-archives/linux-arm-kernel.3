Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC699CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 02:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xaqNcv4CXQk4smv0jZmLI0c3iL1j6I7cH/uwpHLe1Gk=; b=V25nwGnlArXnqO/TpWjzBKxfiZ
	tPSaRjUWinEl8DWa/37KVNF/6sPguQFBmgxIZvVSjtr+IExfl6ncI34mYjQW45J5L01ebw/GUvtzQ
	9kFNdo0sBalPIbKZqWbfwg3ypDaoQA23ZJ9J8280yQwI2jKI40wgnA8ABH2nLSGC+2ic6doN12m8L
	E2bWoFdEJt50ICF/gVM5cHI08JLtioVigjKfvQGq1vI5Zl6GNEsLoszEaU/mct+/pHAuIOnKn2/+a
	sU5BiHVXJ/RckR0Z2DzQLBwISuxMAzbTk8anuVnlKhD7I0OwYCKPPsRkIZ5a0iuzX+gljvs9k0zsY
	MT/CgurQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRL61-0000000G7Wj-48zr;
	Mon, 25 May 2026 02:31:13 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRL5z-0000000G7WB-2m1u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 02:31:12 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8acb856a674so113047436d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 19:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779676269; x=1780281069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xaqNcv4CXQk4smv0jZmLI0c3iL1j6I7cH/uwpHLe1Gk=;
        b=k4JDlHts6i/whvXsCh9Js41STBF6croP8nbkE0ngxV6wM4CGO6DVUyczwk21BR6a7i
         M40VBXld9G+bzBZj/TIQZwsg8wQQqBxk4dQK6S35LOdwHPj+HTN4Gc8xmENElQMavCrG
         iZ7IHXtfeJwFNB8uZZcXGUdAwMIjT73MYx5cA93LfKSd8N34qEyXprH7HF+dfTdI+N2q
         Ps9TajQ/mBhyQD9ObGBZItorJtrEbmeiIbSG2e0/4FkjS2PKLas/mjmFg1FUOsq0bW6d
         xL8PXIomT9plrRISR2pVL0o2Y9nsqye4824GHOQ4RBC8A6jYMflzGRxBODzvHnqgUz/d
         nUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779676269; x=1780281069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaqNcv4CXQk4smv0jZmLI0c3iL1j6I7cH/uwpHLe1Gk=;
        b=ab7Lj3x3lWPEsndu7wkCM+cR/VLga4CAtR23qvb3hnnCG54/jeX5WvzCPHZoVMlBFq
         5QxdcSG5C7FrH7u7fNOoXWmMMn1EcZvZQk5xTnwOmpp8xpiLsbldFqSws7zgjlR8ErHj
         zLndskc5aJqC7G1smJtNtNO+SWBQgJ02DkrZQIQhlGDnjY4RZmIUtb3XVffgMxej+f+B
         v1FarbdjsNtuDKweEHmwr1F7Pvg09W7+K86vxE73MU+73zvtshonVi2+ThhVFTSlKkIs
         q0urP6iQ3bE/zdtdSwTagoLnHvcvJEoUKS47YkysG6MqPcR2wLPsK6eRfnZ1joPWgkSb
         L3tA==
X-Gm-Message-State: AOJu0YzVY3kXOJSD7xcKEQ2NDNgziqDch/H11lF3l0gl5KXYT6AndOxZ
	NR4+tUfioCIoJNw59SHJTR6jbdHKti8Mm4NvmW2XfJdnM8z4sY7z3ZAcA0Buy7ZP/wY=
X-Gm-Gg: Acq92OFr4lmoMTGVRFhc2stH6wVR+783hUROdJkxgpf1s9m4a0rXDgLIenxqFWADRNp
	aZ7O9J8GXVCmuzzZD7Y9Gd2FVwnnuR+/ZLAW2SUeklEj2jhv7lOUWP5bRboEQv0dir4h9vzN03i
	uxOyAH75i5K1EKkqU3G+ftdkoQ4NuCVQ3fQ/lGUh5NbVWOlQRNWln8upb+KEdBSoss90khvr68r
	tEVL3mFhHoe/7BZfKnb+WlQ4MlqRejHrg35bNqvxeM5RieQc9B0yHlhR6o2w8BHGYsP0hWmuCxs
	E+YHq1VcmV0CNPKa4Bvmj6lD3kgVpSFqnpjtzRtx5zkeRo/5YfIC2oYvvW+MpXFI6HejzqUAEKP
	1bTITeK04JHJGsTxJJ1U2McpAdy+7gIKMvlGG7HiKEN7v6pYt+L/5/NIdjtAc0EFMYdnYgGl83h
	QBIajCTMKYlQFOL5Pt0RvOJ6/OkgpVIQtaz+Qbuis/
X-Received: by 2002:a05:6214:242b:b0:8ca:10cc:aa44 with SMTP id 6a1803df08f44-8cc6e356819mr235419686d6.3.1779676269161;
        Sun, 24 May 2026 19:31:09 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc81316d44sm97267086d6.42.2026.05.24.19.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 19:31:08 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: socfpga: Fix OF node refcount leak in SMP setup
Date: Sun, 24 May 2026 22:31:01 -0400
Message-ID: <20260525023101.1329892-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_193111_707484_E5F5C276 
X-CRM114-Status: GOOD (  10.82  )
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

socfpga_smp_prepare_cpus() looks up the Cortex-A9 SCU node with
of_find_compatible_node(), which returns a node reference that must be
released with of_node_put().

The function maps the SCU registers and then returns without dropping
that reference, leaking the node on both the success path and the
of_iomap() failure path.

Drop the reference once the mapping attempt is complete. The returned
MMIO mapping does not depend on keeping the device node reference held.

Fixes: 122694a0c712 ("ARM: socfpga: use of_iomap to map the SCU")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-socfpga/platsmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-socfpga/platsmp.c b/arch/arm/mach-socfpga/platsmp.c
index 201191cf68f3..349e6c54518e 100644
--- a/arch/arm/mach-socfpga/platsmp.c
+++ b/arch/arm/mach-socfpga/platsmp.c
@@ -78,6 +78,7 @@ static void __init socfpga_smp_prepare_cpus(unsigned int max_cpus)
 	}
 
 	socfpga_scu_base_addr = of_iomap(np, 0);
+	of_node_put(np);
 	if (!socfpga_scu_base_addr)
 		return;
 	scu_enable(socfpga_scu_base_addr);
-- 
2.43.0


