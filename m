Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741C1C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 16:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/K9MxRsql9amfZrPwnvhPaTBmIPizK5/r7qz1hO1Po0=; b=TkUKoj0FqoTSD1Day5q4ApnVsi
	etkmLfXCiHPFtqBFSHLVjs8hEKjDuqbWSd8kJGCPXoyJlmaWJn1Y9MfoP5L/rFM7ofbZajjIq1P1t
	VRo2Hnu/cRz6rEwcl07YTkt/qQJfQlPQZEAXuwPY6/QT3aUD/KTzZY1TqUTeKKZPKqC2pR7I+A6US
	8Zz2mhH8KedYWBZzEraCQkFQpPu6EVRwgA97ZEnmkvqE56Ww2dxY/LLrB35y6UqwKJowTPKbNqbsn
	AB8bVzUbXrcsqWbN0PW72yNl2wpzoMzqsxzun3YiuMOjA29bVMznPFO/Bnm8gv2teHOmy/OAlXfL7
	6k8Y1NzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul9KH-00000005nns-4B96;
	Sun, 10 Aug 2025 16:55:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul9Hl-00000005naj-2x8T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 16:52:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B79BA55B9A;
	Sun, 10 Aug 2025 16:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D183C4CEEB;
	Sun, 10 Aug 2025 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754844760;
	bh=MnCNRV8NseshZqcVAz5rGV17eUoHutGZV/rur5kVCQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hDFNhDnms2v51fTMJ5USIwCG6bq12Gxj4lYpsQEw0XYsXdiNFLhgGi0m4w7wQ/zkO
	 E6+Tjv5txIVNCjErjL9Z/AS4Srb2Nl7irt5s7QzKNwk0xkiRPpg6WiAeg0n9RYIylx
	 j3uxeh9r6sda7MimlK6tehtPJ9Wg2s+PGW5InKWlfoHjYCAWJuLgBEdvE5oOheNbOV
	 bUE/SMeURmlKXk8uJp70Y+2/b1shODWSLU1phVDHhXhhnUj/XPWMs5n1DOrOQEYsch
	 veYwrhY7rX5O6ZrKGl1MebrwF4vyWXrmLEVs9QvTcg8ai62ZNKAyBp6lrxk1sSLupB
	 MzIbM9zzlbALg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Elad Nachman <enachman@marvell.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sasha Levin <sashal@kernel.org>,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16] irqchip/mvebu-gicp: Clear pending interrupts on init
Date: Sun, 10 Aug 2025 12:51:55 -0400
Message-Id: <20250810165158.1888206-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250810165158.1888206-1-sashal@kernel.org>
References: <20250810165158.1888206-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_095241_876238_BDDECDB9 
X-CRM114-Status: GOOD (  18.12  )
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

From: Elad Nachman <enachman@marvell.com>

[ Upstream commit 3c3d7dbab2c70a4bca47634d564bf659351c05ca ]

When a kexec'ed kernel boots up, there might be stale unhandled interrupts
pending in the interrupt controller. These are delivered as spurious
interrupts once the boot CPU enables interrupts.

Clear all pending interrupts when the driver is initialized to prevent
these spurious interrupts from locking the CPU in an endless loop.

Signed-off-by: Elad Nachman <enachman@marvell.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/all/20250803102548.669682-2-enachman@marvell.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees. Here's my
extensive analysis:

## Reasons for Backporting:

### 1. **Fixes a Real Bug Affecting Users**
The commit addresses a concrete issue where stale, unhandled interrupts
from before a kexec can cause spurious interrupts that lock the CPU in
an endless loop. This is a serious functionality bug that can prevent
systems from booting properly after kexec.

### 2. **Small and Contained Fix**
The change is minimal and surgical:
- Only adds 9 lines of functional code
- The fix is self-contained within the probe function
- Simply clears pending interrupts by writing to the
  GICP_CLRSPI_NSR_OFFSET register for all 64 possible interrupts
- Uses standard kernel APIs (ioremap/iounmap)

### 3. **Low Risk of Regression**
- The clearing operation only happens once during driver initialization
- If ioremap fails, it's handled gracefully with an error message but
  doesn't fail the probe
- The clearing loop writes to a register specifically designed for
  clearing interrupts (GICP_CLRSPI_NSR_OFFSET)
- This is a write-only operation that doesn't affect normal interrupt
  handling flow

### 4. **Follows Established Pattern**
Similar fixes for spurious/pending interrupts have been backported in
other interrupt controllers:
- commit 28e89cdac648 ("irqchip/renesas-rzv2h: Prevent TINT spurious
  interrupt") - marked with Cc: stable@vger.kernel.org
- commit 853a6030303f ("irqchip/renesas-rzg2l: Prevent spurious
  interrupts when setting trigger type")

### 5. **Critical for Kexec Functionality**
Kexec is an important feature for:
- Crash dump collection (kdump)
- Fast reboot scenarios
- System recovery
This fix ensures these use cases work reliably on Marvell platforms
using the GICP interrupt controller.

### 6. **No Architectural Changes**
The fix doesn't introduce:
- New features or capabilities
- Changes to existing APIs or interfaces
- Modifications to interrupt handling logic
- Any structural changes to the driver

### 7. **Clear Problem Statement**
The commit message clearly describes:
- The problem scenario (kexec with pending interrupts)
- The symptom (CPU locked in endless loop)
- The solution (clear all pending interrupts on init)

## Code Analysis:

The added code (lines 240-247 in the patched version):
```c
base = ioremap(gicp->res->start, gicp->res->end - gicp->res->start);
if (IS_ERR(base)) {
    dev_err(&pdev->dev, "ioremap() failed. Unable to clear pending
interrupts.\n");
} else {
    for (i = 0; i < 64; i++)
        writel(i, base + GICP_CLRSPI_NSR_OFFSET);
    iounmap(base);
}
```

This is a defensive programming approach that ensures system stability
without affecting normal operation, making it an ideal candidate for
stable backport.

 drivers/irqchip/irq-mvebu-gicp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
index d3232d6d8dce..fd85c845e015 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -177,6 +177,7 @@ static int mvebu_gicp_probe(struct platform_device *pdev)
 		.ops	= &gicp_domain_ops,
 	};
 	struct mvebu_gicp *gicp;
+	void __iomem *base;
 	int ret, i;
 
 	gicp = devm_kzalloc(&pdev->dev, sizeof(*gicp), GFP_KERNEL);
@@ -236,6 +237,15 @@ static int mvebu_gicp_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	base = ioremap(gicp->res->start, gicp->res->end - gicp->res->start);
+	if (IS_ERR(base)) {
+		dev_err(&pdev->dev, "ioremap() failed. Unable to clear pending interrupts.\n");
+	} else {
+		for (i = 0; i < 64; i++)
+			writel(i, base + GICP_CLRSPI_NSR_OFFSET);
+		iounmap(base);
+	}
+
 	return msi_create_parent_irq_domain(&info, &gicp_msi_parent_ops) ? 0 : -ENOMEM;
 }
 
-- 
2.39.5


