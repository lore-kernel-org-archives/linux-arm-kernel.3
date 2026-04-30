Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC253CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WjD0kC6+dcELtAggZvaT6DveIWiQZcxznowXMAejDSU=; b=3PSqqvQIJbksTKl9WI6q9vd6Rv
	6atWCZnACT0DYUgnT+Im+ZudAX3WD0uEJD0LIiZPASOFCp8JlOwYb+UIr6dXqTig+1K5bEaVmMEHl
	Z+NdIbCCE1lcyoyeEi6perIzvNFCDzHy1ofo5X1eP4ptfNGzq3KatpUz0+o/JfAos/IlWhDi0W2xy
	q0kXKk0G7o6ND4d+M+BLaeprn2TVzOFgzSLjKtfhcd1AASUGz3g80ZtMIbdN48il8k1s6XPEFjIji
	rWcgBstFe7svTPtjwSluaf7LKde4rdx2/eZ170w481bgMcozWADWW4Yrz+V5H1kXFGjI8/cPZkH+Z
	rmYEqUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIN3u-0000000532C-2XPR;
	Thu, 30 Apr 2026 08:47:58 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIN3r-0000000531K-2fy5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 08:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1777538875; x=1809074875;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WjD0kC6+dcELtAggZvaT6DveIWiQZcxznowXMAejDSU=;
  b=ZQxqmUYCIeOlWyZgK+PlUIxIcDMYUGtzBW27rtc9qElvwM8khqpjiWur
   9WpKCyFmF2rea4JYvFenbIpTeVsDcdXX7IVyrfO5pUk0dKvIiF6oKI9yh
   kRGdPoUIP1BuEGHTs85fRsZeE5l77yVTn9RgxLSV8xbDJJHkC1j8AcITE
   YSStYahUFc9/LH4nNL4unom33MjO9JuUigRemoyzgzc3GdWd7rqSauMl3
   n13BoX39aW8Ivj98jrjvbiaLJqRHgBV93vixGI2f3mEPWbDqwKqeZn9KG
   KFe0LT/MlUXQu3kDbmOUIxYyvyR3HF5qDO2ReYLslzmiYo6Kl5po0ekrd
   w==;
X-CSE-ConnectionGUID: f5soIZoJQVeKmpkWK1DwuA==
X-CSE-MsgGUID: cRhMOhH3Th+HDrpv96s3mw==
X-IronPort-AV: E=Sophos;i="6.23,207,1770595200"; 
   d="scan'208";a="18531112"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 08:47:49 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:31918]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.37.224:2525] with esmtp (Farcaster)
 id 7c9c0932-350f-4824-8472-2ce86044d51c; Thu, 30 Apr 2026 08:47:48 +0000 (UTC)
X-Farcaster-Flow-ID: 7c9c0932-350f-4824-8472-2ce86044d51c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Thu, 30 Apr 2026 08:47:48 +0000
Received: from dev-dsk-dssauerw-1b-2c5f429c.eu-west-1.amazon.com
 (10.13.238.31) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Thu, 30 Apr 2026
 08:47:47 +0000
From: David Sauerwein <dssauerw@amazon.de>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<nh-open-source@amazon.com>, David Sauerwein <dssauerw@amazon.de>
Subject: [PATCH] arm64: Fix garbled logs caused by race between multiple stack traces
Date: Thu, 30 Apr 2026 08:47:38 +0000
Message-ID: <20260430084738.73909-1-dssauerw@amazon.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Originating-IP: [10.13.238.31]
X-ClientProxiedBy: EX19D046UWA001.ant.amazon.com (10.13.139.112) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_014755_764264_21D4EF1B 
X-CRM114-Status: GOOD (  13.17  )
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

When multiple stack traces are printed at the same time, the lines that
contain register values may get split into multiple separate lines.
Some stray empty lines may appear as well.

[ 2013.814455] ------------[ cut here ]------------
[ 2013.814455] ------------[ cut here ]------------
[ 2013.814459] WARNING: CPU: 12 PID: 626 at src/arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3860 mark_page_dirty_in_slot+0x5c/0xd8
[ 2013.814457] WARNING: CPU: 3 PID: 620 at src/arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3860 mark_page_dirty_in_slot+0x5c/0xd8
[...]
[ 2013.814483] x29: ffff8000873b3b10
[ 2013.814484] x29: ffff800083fd3b10
[ 2013.814484]  x28: ffff00001d71e300 x27: 0000000000000001
[ 2013.814486] x26: ffff800080c63b80 x25: ffff800080c63000
[ 2013.814487]  x28: ffff00001d71a100 x27: 0000000000000001
[ 2013.814488]  x24: 0000000000401b14
[ 2013.814489]
[ 2013.814489] x26: ffff800080f5bb80 x25: ffff800080f5b000
[ 2013.814491]
[ 2013.814491] x23: ffff0000117b2000 x22: ffff00001e22bd88 x21: 0000ff9cc1b14000
[ 2013.814493]  x24: 0000000000402230
[ 2013.814494]
[ 2013.814495] x20: ffff800080c63000
[ 2013.814495] x23: ffff00001d916f00
[ 2013.814496]  x19: 0000000000000000 x18: ffff8000808c1660
[ 2013.814497] x17: 0000000000000000
[...]

(Example observed on v6.6 based kernel)

This happens because __show_regs uses pr_cont. The two threads printing
the traces race when printing partial register lines.

While the lines of the stack traces may still interleave, the individual
lines printing up to 3 register values should not be split. To fix this,
buffer the output and print all registers in a single printk instead of
using pr_cont.

Assisted-by: Kiro:claude-opus-4.6
Signed-off-by: David Sauerwein <dssauerw@amazon.de>
---
 arch/arm64/kernel/process.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 033643cd4e5ed..27779539e3b4f 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -235,12 +235,22 @@ void __show_regs(struct pt_regs *regs)
 	i = top_reg;
 
 	while (i >= 0) {
-		printk("x%-2d: %016llx", i, regs->regs[i]);
+		/*
+		 * Buffer is big enough to hold the output for 3 register
+		 * plus some extra.
+		 */
+		char buf[80];
+		int len;
+
+		len = scnprintf(buf, sizeof(buf), "x%-2d: %016llx",
+				i, regs->regs[i]);
 
 		while (i-- % 3)
-			pr_cont(" x%-2d: %016llx", i, regs->regs[i]);
+			len += scnprintf(buf + len, sizeof(buf) - len,
+					 " x%-2d: %016llx",
+					 i, regs->regs[i]);
 
-		pr_cont("\n");
+		printk("%s\n", buf);
 	}
 }
 
-- 
2.47.3




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


