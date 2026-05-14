Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACF0CD4846
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 03:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ztl0NP5ADTctQZXKpyeHpvvektz2Ccm1tuu9zAHmuZI=; b=NIkSBiRqgonRLo2K3qkxdiyGtc
	u8Y77AlTejUuY0A3nORHGXoDqh4fy/fGWiR3ikNtFoDgCRqir36vNEDX+CMF9UeQp+QmX6xHsBldi
	Z1nmNOVB8Pwe3yrOvjlPjfjrdCEWDJl/DzFVnlIHVxXSZklCUjnswL3q0/txPEh0PvzNDhrkzKcb/
	EhcBtvIBFIR4EQPY9eRN5p5d6jzKsE9ZMfwff87If8SdMB/pMn1CDFENrvQcofzcfHyzspfdbHqhA
	sG+nYyTHWwpL/NC5+g//ubQGKx3/uNKXl0+8TjU9S38ctyR5ZJszp/4SsWORVhCORY0X2c6dOk/2C
	RNSDMU9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNMvm-00000004TLH-2mbD;
	Thu, 14 May 2026 03:40:14 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNMvk-00000004TKm-1Nzz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 03:40:13 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8c92737a8d3so2513596d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 20:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778730011; x=1779334811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztl0NP5ADTctQZXKpyeHpvvektz2Ccm1tuu9zAHmuZI=;
        b=jTU23n7db9Z890r1lvUSTLxVVyKqKXrITO31cQ1sE/nSHlBs6rz1T2UqXH8hDvPUc2
         DpdzrEOm43ctY3Yu+0Jmy9Dffb7LNR2dWd/5jnYukNBzrcuOPfFzaYWri6m3EwsJMX25
         wzWh5sWwcUFs7OznLpYgfbcjhG8eHPFcxf01nRvjFfkOHcOPSydBtuBNEzP3BhwOU5Jq
         MKhnipHyFuKrNMv4a+z7TBkMR50tc1la9NW+BZF35WV/cTtO+iiKDzp/3qknBhkHgGse
         cP3QzYHhQWQfFh+sUtl9F59Vxyn0K6/89Wqa4XzXHTGgUmpqZ8oTnLwiIB8zLvodIGTY
         J/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778730011; x=1779334811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztl0NP5ADTctQZXKpyeHpvvektz2Ccm1tuu9zAHmuZI=;
        b=LcsG4q+2zZUHavPYBx017AH9mhSBv3rHATQLvmbCg5qHMfvlhH9xyFICEro4fZ3oH6
         jgIunw19OGENZ9WygFJMRSPamTNlkhYaqrRWmfYAW5hmAvi5BbHT2U7DzVSTfyFuGQj+
         sBbZhxXPBJxvH2PoZNRSSncHSP9Pfg+kJbKKlc0gFrW8TOTLomyZAWmtoM/nUgjBj8IH
         Tre8vI8gd2GforH6A1/I05LSBZ8CiJhPvV799AKMvejaIBbZYutSY7ZVuqW5cUSZNgLE
         VfCAUHiX5iiwv/4hhQ2R9kChsXBAezhsLQgjdP68HEXGB8Bq0cDGYcxG9BH+ZZNxac/m
         gKWg==
X-Forwarded-Encrypted: i=1; AFNElJ+Xkc/FMfYwtO+93YecQagy0QVboOMqzMfOm5FtfMcrQQQ83gzN9Zgob4BbXzN6sPFTDAe5djzySCzkoY7zSZB8@lists.infradead.org
X-Gm-Message-State: AOJu0YzBTcUhxM4QpG7JZzsG4nK7y7Qa8FPAUwC5+nvAmYZ+b1xdFIkN
	TKYnxo6s+BcDsUnPNNFP1BpqkK5AryjmAl+lj2iS5gTbDJOR4vZk298c
X-Gm-Gg: Acq92OHBv7OmrXsiJukx1VdaqD29OUgHO0keqGz9nZCnVnLjchGDld/GVfrhCMlxtgi
	j0ODds00hQO9Vzx1OOde/s8G9YfbLGjjYW/NSwdbIL95+Q8o8s0SJk/7COF7KbRrgqfMxEhEUxT
	Wwtb71nIuR55jfKx0ocWZW+52sMhymsrugqvRB/xcp38l8ag2txTf+P1dgIDG7kMuc2wNhyyGv8
	+rShd+SGgR14f42ji8+hC2cRKgvqP7sHXYE5XDqlanDDS8Si5vgMQz52CCUAzsdhVr9Va4HBigL
	M9H9yqp9PO2c8hlSQv5DSftyIiUng2fKTy4AKBNkULbQhICJPxd5pcdvnXaua+0BLb4nhepC7Ri
	XGR7KxdsngqCwi71ZGkZPNtWtTD4VrjIF0xS5+gmYzwYaBa6OdG5rN3bCb5uWpA1kUDy+SDrXrF
	fOuM3i1DoKmvsBELXEj0jKSMW3sylA5p6jcG9fMPgv
X-Received: by 2002:a05:6214:4a8e:b0:8ac:a744:7789 with SMTP id 6a1803df08f44-8c7dc84847cmr106181756d6.5.1778730010655;
        Wed, 13 May 2026 20:40:10 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c908d1bb46sm13200896d6.11.2026.05.13.20.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:40:10 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: imx3: Fix CCM node reference leak
Date: Wed, 13 May 2026 23:40:04 -0400
Message-ID: <20260514034004.689829-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_204012_375620_38107153 
X-CRM114-Status: GOOD (  11.62  )
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

of_find_compatible_node() returns a referenced device node. The i.MX31
and i.MX35 early init paths use the node to map the CCM registers with
of_iomap(), but never drop the node reference.

Release the node after the mapping is created.

Fixes: 2cf98d12958c ("ARM: imx3: Retrieve the CCM base address from devicetree")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-imx/mm-imx3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-imx/mm-imx3.c b/arch/arm/mach-imx/mm-imx3.c
index 0788c5cc7f9e..9b0b014d7fe2 100644
--- a/arch/arm/mach-imx/mm-imx3.c
+++ b/arch/arm/mach-imx/mm-imx3.c
@@ -106,6 +106,7 @@ void __init imx31_init_early(void)
 	arm_pm_idle = imx31_idle;
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx31-ccm");
 	mx3_ccm_base = of_iomap(np, 0);
+	of_node_put(np);
 	BUG_ON(!mx3_ccm_base);
 }
 #endif /* ifdef CONFIG_SOC_IMX31 */
@@ -143,6 +144,7 @@ void __init imx35_init_early(void)
 	arch_ioremap_caller = imx3_ioremap_caller;
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx35-ccm");
 	mx3_ccm_base = of_iomap(np, 0);
+	of_node_put(np);
 	BUG_ON(!mx3_ccm_base);
 }
 #endif /* ifdef CONFIG_SOC_IMX35 */
-- 
2.43.0


