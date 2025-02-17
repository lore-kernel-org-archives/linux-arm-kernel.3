Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27546C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FjCy/ZffARgeuZcf1GFTdyg+YmqrhzszPwnoHjKDmPE=; b=t84K0oKXcF+S2UB9LKllZVB/qe
	XeW9UczRHOmDmtgP6rCLLiwV/I+E+Ixt1OWwX/tWItY1CPKCKB1OLqJxDLNpRCB/0L+42JGkdeQ/2
	ETpiC041yqKyIdWWyV+lyoGcqXqcpF2lmdB2W1mnwrGe0DUbTWdMQIYc7+Ewz+E8Os8Ur7r3WB2nY
	alT789sqZOlVLmjEtbSoZ1/sYSXi9O2JSHNtPKAzf/EZNq3vhTFkI+r4gKN5W2uI8gcN34y27QzZ9
	dVcopwXyqfJNrZQIkF7aTQWl2ZFs8kv6pvQXIAOn6Q4Ybdv+tojDeb3FC0Ee2EGqs052OLFcXLQRp
	yvoCPLEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4kL-00000005QN2-1FVy;
	Mon, 17 Feb 2025 17:17:29 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3WT-00000005AyQ-3WDn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:59:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22101839807so49818725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 07:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739807944; x=1740412744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FjCy/ZffARgeuZcf1GFTdyg+YmqrhzszPwnoHjKDmPE=;
        b=PwYGDnOAFCju7gtf/oLgZ7+cR1tjMbDKsREgdEy2YADldFY8eNCp4JjN6bHOueaZWm
         BJMfc+0Fefl3ngXMMrojM1nVhFvbqt6WHYESaj8FiReBctyehr7Gz2PVKD8dfoF3Zjb1
         YQhKpkDBjRjGRZN2+wrjQZ/O9mqAWatpqo/cp2KsWdDUUroU4bWGhll/kM916/I1ctCS
         CX4OqeOUDwUgXuwqKDh+EgxiHlxfeZB4PyN3lc1AD3diu1oVaSDTjmtxARhgsXE+zv7U
         +R+yCMn8osFgXd6VUaBsGK0PdsRi7/+v+mgH5STS3j6ZLtbYkSG4Qq8a96ZbEuuxbZu/
         85zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739807944; x=1740412744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjCy/ZffARgeuZcf1GFTdyg+YmqrhzszPwnoHjKDmPE=;
        b=lbosE5LlCy5Kune5J9sa5bSeFPHKbjssjtCpX0X9lijKXT/0PqtG90IK0wW4Kbhk0/
         1WipBXGRkgEhNUMen/9AyNHiG+yG+sswZDul9l/VdEWBM1ZF5jx66OYHLyqW0GeXbwmA
         thmtPeZbTudWjkG4O29xG+z64zTQ7gSf5gorRsI9Sk1gUcsUOzTrkcY/DPb5Ql8AZaPD
         hxP5IJZ66tPQDh4WWRlcUhxpI4pOFlJvCJfvlXcQHl28fZGVOvgqA8vKeqswkR01FLCE
         fjiwFrCkWQwcIiMo1W21//tYHkwiLPYIkraYTz7Ae6DMaZlNET69Y0P1OlIz2AwtPy7i
         mysA==
X-Forwarded-Encrypted: i=1; AJvYcCXwR6K2fcaPzVqLMPdzhsgaf+1OhSIgZSwtK2V2W/1xvqGGk5SyYZbtVF75Wygg5Lk9CNLEkiOmvDjnzHtj9Sq2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6ckBe7/zoMz5VGnEJaxrnPSKDMaIE3a24K5pWPxxK/NSO/XxG
	XBBPkB85F+8UATCeqnvwshagKT+2/rautyIyXGmC0pa3kB4AMTMc
X-Gm-Gg: ASbGncsva+1M4ytfLKx529uQhoHY1QufSSSSlecw9bljb0wvgsXWE+OqKKTrBDgq60h
	/l9+er6gvcD/XLxMby/rZn3YZ38v1zsy+UFwaNcNKzaYMqUUrSrAvfp+KQd2MRSh6PzbcRhH0hS
	7kEj0UpDq5fo3xPNGTnMG04doaAY2t5YZvIGMquBjLtPXzyPYZUP5xr+B2GP/ENnS2ssQj1F7Cn
	F9TyM2OWLlAbBkZaItupBPMxbvRlM0gq+pQGCjk2zkWAAnqa+wEY0xwxbCVsI9KqakB0F7lgBwH
	uYNVnfqyFdq95gKIBi4o
X-Google-Smtp-Source: AGHT+IHXyootXyMJ7WqJlzjvmqadmtDWJcQg4Y1jgPTTSE29jnJtzuRXNyecLpmO6L5BqF58tIKC/w==
X-Received: by 2002:a17:903:22c7:b0:216:3e87:c9fc with SMTP id d9443c01a7336-22103efc0d3mr183904045ad.5.1739807944475;
        Mon, 17 Feb 2025 07:59:04 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55858d6sm72826895ad.223.2025.02.17.07.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 07:59:03 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	visitorckw@gmail.com,
	lkp@intel.com,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next v2] net: stmmac: Use str_enabled_disabled() helper
Date: Mon, 17 Feb 2025 23:58:33 +0800
Message-ID: <20250217155833.3105775-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_075905_887665_972F51F1 
X-CRM114-Status: GOOD (  11.56  )
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

As kernel test robot reported, the following warning occurs:

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:582:6-8: opportunity for str_enabled_disabled(on)

Replace ternary (condition ? "enabled" : "disabled") with
str_enabled_disabled() from string_choices.h to improve readability,
maintain uniform string usage, and reduce binary size through linker
deduplication.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502111616.xnebdSv1-lkp@intel.com/
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 96bcda0856ec..3efee70f46b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/ethtool.h>
 #include <linux/io.h>
+#include <linux/string_choices.h>
 #include "stmmac.h"
 #include "stmmac_pcs.h"
 #include "stmmac_ptp.h"
@@ -633,7 +634,7 @@ int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
 		}
 
 		netdev_dbg(priv->dev, "Auxiliary Snapshot %s.\n",
-			   on ? "enabled" : "disabled");
+			   str_enabled_disabled(on));
 		writel(tcr_val, ptpaddr + PTP_TCR);
 
 		/* wait for auxts fifo clear to finish */
-- 
2.43.0


