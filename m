Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80D9C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1V86HpOLxakzYBDCKfK7gkII/Pa1+jG6NYJT5usyJ6Q=; b=GBYnM6LWPrFxWPOhJ44d4kwv7R
	UpQg1eONknEVxs0ZFFdg3WEMM1XcqbKywuZnWrXYX63lznQwAjMkuN3au/ZwgkGt7BAqX5NFJYu5Q
	5LUI1b8ynMF0VZYxeQ1Bk646dTRpJ0AfnXEbOzMwv8khh2O7iUbr8Fcyj1/oSpoCBY+Du7jNsPQmP
	icOFi8C6vT4fKuM9L7ZGhRVFHaVm7jxFKcml1F9YbPPCQwiFGGTarDiFXSiJ3ML1B4v5crvcuN8kS
	gDa/OmpIY1SqugBt2X67CGObEQFroVQ0RBteM0EVsI1adnbLoHCBQZuHVLzFA48obgJRnuXbSPBfu
	dHykeebA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnk15-00000008hyb-2fOh;
	Thu, 27 Feb 2025 19:57:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjwc-00000008hMz-0IOs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 19:53:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 751985C5771;
	Thu, 27 Feb 2025 19:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14510C4FF0C;
	Thu, 27 Feb 2025 19:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740685550;
	bh=ZXCrKOq4STAxpn0LbqL3XX+FU8M05shAqCoEyXVf51c=;
	h=From:To:Cc:Subject:Date:From;
	b=NEuqgdWkYFoBCCqxldonqLYcPxKv9sZv8t8kW4ywOwltwMJwLwDUuOdWpYMiTmGAY
	 76pN2jBy4lwiRma0WXn2O4u7Su5hVJ2g8VFnmeQgUYOBj3f0RcH+Zl2OLalokyvcMS
	 V39hJFKeJi98vs2l3e49Dk2AQTcgMHXVC0vw4oORGEwwrvcO1uFeubVG+gIFx1LZst
	 9IC/K+5QkL6SSZtmcyuz2KAg69DYT5d+MKWVnAemN+cek9l4SG0SEql5zrwWivciPx
	 qVaH3gcX0BS+X7di5rWVjIOfjmVJ1VyQI7dQ5lSdZeAYxgNhBAv0pXMkXlIfIm3Abh
	 Y7AwH0ik/OPxg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tnjpL-008o1r-S4;
	Thu, 27 Feb 2025 19:45:47 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: [PATCH] xhci: Restrict USB4 tunnel detection for USB3 devices to Intel hosts
Date: Thu, 27 Feb 2025 19:45:29 +0000
Message-Id: <20250227194529.2288718-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, mathias.nyman@linux.intel.com, gregkh@linuxfoundation.org, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_115318_186369_DE26595E 
X-CRM114-Status: GOOD (  13.92  )
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

When adding support for USB3-over-USB4 tunnelling detection, a check
for an Intel-specific capability was added. This capability, which
goes by ID 206, is used without any check that we are actually
dealing with an Intel host.

As it turns out, the Cadence XHCI controller *also* exposes an
extended capability numbered 206 (for unknown purposes), but of
course doesn't have the Intel-specific registers that the tunnelling
code is trying to access. Fun follows.

The core of the problems is that the tunnelling code blindly uses
vendor-specific capabilities without any check (the Intel-provided
documentation I have at hand indicates that 192-255 are indeed
vendor-specific).

Restrict the detection code to Intel HW for real, preventing any
further explosion on my (non-Intel) HW.

Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org
Fixes: 948ce83fbb7df ("xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/usb/host/xhci-hub.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 9693464c05204..69c278b64084b 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/unaligned.h>
 #include <linux/bitfield.h>
+#include <linux/pci.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -770,9 +771,16 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
 enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
 						struct xhci_port *port)
 {
+	struct usb_hcd *hcd;
 	void __iomem *base;
 	u32 offset;
 
+	/* Don't try and probe this capability for non-Intel hosts */
+	hcd = xhci_to_hcd(xhci);
+	if (!dev_is_pci(hcd->self.controller) ||
+	    to_pci_dev(hcd->self.controller)->vendor != PCI_VENDOR_ID_INTEL)
+		return USB_LINK_UNKNOWN;
+
 	base = &xhci->cap_regs->hc_capbase;
 	offset = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_INTEL_SPR_SHADOW);
 
-- 
2.39.2


