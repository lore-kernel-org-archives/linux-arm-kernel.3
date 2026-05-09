Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA18CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 02:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7rx5oAgzTfQrxNSItVjPyuKjULjUzEucljH1SJ8cUBc=; b=C4ty4V4h5NwCtKm2N1cNZh2p//
	tijWxehKqVIg5XxBezZlD7/N2Je6twX8z0l+8F+puHScJTD34DLTfONYXVqP4IY2ogmguJuCDwcTn
	4LnRBcSpZc6r6NTseOr/SAZF9dITPllYYYLToPbwMCjFz01ZhDIAl7XhBPTOaqykI2ya7YXFD7MYE
	coqefmq2DPhJc5Td83Sh4nnOzX0U2MUzYH+6UvvMq0jDFYspPU/+Kuldhl5v7YaXezEx9LYw+Max7
	DkvlwPUM/uexJBRb97w656h3kNFppjjdkZkYUIgVKluVqKkc/Ww9aD7QWzd2SGedjuUOM/wgMpvre
	N997anKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXIA-00000007z8I-1JvY;
	Sat, 09 May 2026 02:19:46 +0000
Received: from mail-dy1-x1344.google.com ([2607:f8b0:4864:20::1344])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXI8-00000007z7l-1oDz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 02:19:45 +0000
Received: by mail-dy1-x1344.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso1812449eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 19:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778293183; x=1778897983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rx5oAgzTfQrxNSItVjPyuKjULjUzEucljH1SJ8cUBc=;
        b=kXyX7PNPAGDpLhZaoRVjAIZKO9IoeZR+1hvTTu1THK89kMQQC0BQFNQMLGU8NTcakk
         V7t7VoSwkCe6CHsbFzf02GDTIksldgHezEsv117ETu+xNg14zbPo0UVoZfGiZBSa+sGf
         6Y9Rsiv8OhE9QvI/vsA7pBVROKwLQAkiXyjGjdbc31k01laRe78EWXNS2SLu12c/NX++
         sNLOQ0xyYhK12DtM+jXEKVXFaiWu9afo/u4snJUzV3LDbiMvd3V9K/tZBT8QeNxJvNTv
         dJ0JnCUIsxmqI3X2/xmHSwuNl10MoQDRSvGlkg6t/RWQMOk03c7oCj0jvo/vgcyBD/+j
         651g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778293183; x=1778897983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rx5oAgzTfQrxNSItVjPyuKjULjUzEucljH1SJ8cUBc=;
        b=cpkNOoGIiylw/BTFkO3uCWeNIFL7pnQr+Q3IGxirD+Ae9s3tTorMiDkRAh2D9Nsgmv
         5CvCfMjTmC/Pbmm6Js/MLnCdH7w9ShJMRQnRwmVEBfgHSXY1cgZQdP4uosaW8K64IZWV
         CBkZsodce+FkC8P6MuRRJQhV5ub7ve7ulHps0bERP9mL9FxUcdp2b/X4W1V01Gqb3Tn2
         DqjCtuSqlR5CCiEr+ZgEGU1bRbWb509EcO/pagYj0lUIfRy0MIS1OPV6rV3dxaDVuowT
         BNa7RVIahMTUsT1EaHNxLARm1J3a24Pi0+xnzUTxP4xeOcs9lIzg+7FyHA62tneKaElE
         TQSA==
X-Gm-Message-State: AOJu0YywhbB4b1Aopev09RnY/pxvth9Ndy8kBjsKqhgj2zcdh5fGzIyj
	tQGDQsZRyVjzHWDHjmfOV8JRjSVtdgilozWZaL/hk+fMcvzEoRqgFvMPDyD59dmzA2Y=
X-Gm-Gg: Acq92OFMIVmVcXcFcXr0MUf7VSFAAY3QgD7LhkHYEWjBZkNK69QsGqh9FRPOjG3xTNS
	fcBhl4fHfGJMDuCJ0dsiL5LWb08lPi0e04O4yB97QqcqhjdsSyX+RK2UvAC30vbaDr4lkvi7+Vq
	PiloGq2/9rlMrNfj37Q6Vej/1aQ3LRmnMIHkUTZvZjuz51xjPyN4FadqFWYeHAjijpqwVaRdXLn
	xtGsJRdoVlikYFZzCUgDgUgOWoNrOpWqIkZsZmkrb/C4bUWoKBdLMaZIVqJZYlmrF/i+IyQXy71
	IMEeVt0FajCeui0kcP0qOI2KEaCWyXtmpeWYJEIH9KH2lr073pJ+acLi/BQI49Bbhp0/y0wqoH5
	WSNF7VnDcI2zQ1ln+wdcMHegaKBSnDfnLkllN+21sMp2M/N57kow4YhqItCRHBU/ITkeVs1E4Ia
	Yb/D6d0u+wat3BAv6Ikg4OkH8fyhgCmxbpVivJm8z+tDGwlntk4YxKLEtOAfQk90r1a0kNlsbnT
	L0StLW/Ix7DE2P7ECkhtrGCZ+epxrCDo+i0G/+AzJZTclmRvSmD6NeeS+BRgDxAcISfyUpgvCaM
	JBidTT0eg2bJHGMtzA==
X-Received: by 2002:a05:693c:2c11:b0:2df:7b88:a1b0 with SMTP id 5a478bee46e88-2fb4bdffa79mr234663eec.27.1778293183198;
        Fri, 08 May 2026 19:19:43 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8860c7accsm4775298eec.8.2026.05.08.19.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:19:42 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	stable@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH] arm: orion5x: correct machine ID check in mss2_pci_init() to use DT
Date: Fri,  8 May 2026 19:19:34 -0700
Message-ID: <20260509021935.36898-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_191944_502920_3256E9EC 
X-CRM114-Status: GOOD (  15.84  )
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

The mss2_pci_init() function contains a check for the ARM machine ID
via the machine_is_mss2() macro. This check is incorrect because the
machine concerned now supports only FDT booting, which does not use
machine IDs, and therefore it will always fail. The machine was
converted to FDT booting in commit fbf04d814d0a ("ARM: orion5x: convert
Maxtor Shared Storage II to the Device Tree"). To resolve this issue,
use of_machine_is_compatible() instead.

Fixes: fbf04d814d0a ("ARM: orion5x: convert Maxtor Shared Storage II to the Device Tree")
Cc: stable@vger.kernel.org
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/mach-orion5x/board-mss2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-orion5x/board-mss2.c b/arch/arm/mach-orion5x/board-mss2.c
index 9e3d69891d2f..322ae29d05aa 100644
--- a/arch/arm/mach-orion5x/board-mss2.c
+++ b/arch/arm/mach-orion5x/board-mss2.c
@@ -10,7 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/pci.h>
 #include <linux/irq.h>
-#include <asm/mach-types.h>
+#include <linux/of.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/pci.h>
 #include "orion5x.h"
@@ -47,7 +47,7 @@ static struct hw_pci mss2_pci __initdata = {
 
 static int __init mss2_pci_init(void)
 {
-	if (machine_is_mss2())
+	if (of_machine_is_compatible("maxtor,shared-storage-2"))
 		pci_common_init(&mss2_pci);
 
 	return 0;
-- 
2.43.0


