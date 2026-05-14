Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF84BCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 15:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nchV8R8N22csolYEW3nDc6UaflBfzUU8x9AMzJq3tI=; b=EaqENrkUc/fWFc2lcy7wtW1nGD
	w/9VDeJ7J0XZttM/hR0xl90YrJdyJ9E9f3yvH4ipmDPCXMJAWqtw6SCjWUBVUS61rMDhps6AiN2bi
	wjGeGJQdZiF88Ak83ekj9OO1GDsGYUcdL3Z3ahuTkr+UYBVy5eQOE0PnYUZ+Z9fRHeXXyJpks9DRq
	BIF3QxUznUh/53IKE+dSEHgCgcf4FMr2lsYQxyKVhVtSP5m48YFv8mgqYIcfwljS2X5JjQRBZuz6Y
	YuTWe++Ax6prLnTZ4xaPJyfbPXqBxcCIrddiQ0FoNCzsYZVCvhK7RkUTtKCGvtp6XY8RecWF3Mayq
	aayZG1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXiH-00000005r6y-0ItI;
	Thu, 14 May 2026 15:11:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXi1-00000005qpo-2HPJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 15:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3nchV8R8N22csolYEW3nDc6UaflBfzUU8x9AMzJq3tI=; b=a+ZGxJub+lr+Y9NYjdUFDBJMnd
	rGXMgd87K4Dw5r3b8bw2626Ix3F5KlscK+q8ZzCmcDyAY1xE24izp9D3acMNYq12PM86nZ5j2Vs5x
	YiXmMHsnjRq3PZQLnn2mmm5GZde4znsSCPg9CsIF1rtVvqmEZNENqKAPmTuG+g8Cgn8cKQZMNUPrg
	+95G1IVd1FS1150Dtix4EYbE3HtPWrkuZ/BmrkyHbLCYAKhnUXPYro1s4OOWYF999sOuAOSNxV/Pn
	3ey7mM6NBOTB7NBbnDxAQ5pQWn3sOGWhjN7RadzfzMnsmzYx9OthGuEbz1JmWjyEkNV/uO+fEfQbb
	gA+Ja83Q==;
Received: from smtp1.tecnico.ulisboa.pt ([193.136.128.21])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXhy-00000003DwF-1RKy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 15:10:44 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 23F826000222;
	Thu, 14 May 2026 15:47:30 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id sxCi7LopkDkE; Thu, 14 May 2026 15:47:28 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id CA6DD6000874;
	Thu, 14 May 2026 15:47:27 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1778770047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3nchV8R8N22csolYEW3nDc6UaflBfzUU8x9AMzJq3tI=;
	b=gE8zolpZ0jFP/V+8YUQmRf1aiyMqsehtQwKOFK7fjV5RZs5Iy7hyGU4FphdQ+BCgUh9UKV
	h+unP8ghKACIgHzSA8YlDzkn77fE5xMR7oHlyipv7AcxB8ogRuuDVwMQt4BUUbk+gseB6w
	V2I9pKH9SQmgnumCAZnWOBEYn2d5/399/l4P5WTHUnm9T47SvRmC7YqdOJWidqrdNVvphJ
	ZWn5UiqrK5Mus3HJh9jAPBCZKlSevaQv5dyFuNnSu5MVBPo1HZASCqhOjxpPqNDFOVjjBg
	oaipoYV3vSXDc+JIkrLu4AIA8FLBB6M+7w/31T7+Nb36RRlF9W4MpBLx/wZC7w==
Received: from [192.168.1.94] (2a02-842a-00d7-bd01-2527-ff0d-f555-b6e4.rev.sfr.net [IPv6:2a02:842a:d7:bd01:2527:ff0d:f555:b6e4])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 38D3636026F;
	Thu, 14 May 2026 15:47:27 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 14 May 2026 16:47:19 +0200
Subject: [PATCH 1/4] firmware: psci: switch SYSTEM_OFF to sys-off handler
 API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-smaug-poweroff-v1-1-30f9a4688966@tecnico.ulisboa.pt>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
In-Reply-To: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778770045; l=1612;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=iKpL2tZGcpfwQZn6rSsZghYOqthAeTURsDvaVuWlul0=;
 b=mNBKOD3xIOPmaNUJzRwUDmwi+ef8RxjYEkH65pN2enlXmtGLq/ohk+C7tlJmJshxf6TssnUdH
 L9T+3cgibpBDek2qNCbgwB06mtebC9EY88A4hyJNq0xhVTznAkJ6Cna
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_161042_761189_DA77FE50 
X-CRM114-Status: GOOD (  13.09  )
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

Replace the legacy pm_power_off hook with the generic sys-off
handler infrastructure.

Convert psci_sys_poweroff() to the sys-off callback prototype and
register it through register_sys_off_handler() with firmware
priority. This removes the direct dependency on pm_power_off and
drops the now-unused <linux/pm.h> include.

This aligns the PSCI poweroff path with the modern system-off
framework used by other firmware and platform drivers.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/firmware/psci/psci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 38ca190d4a22..d6e9721d11e5 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -13,7 +13,6 @@
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <linux/of.h>
-#include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/psci.h>
 #include <linux/reboot.h>
@@ -329,9 +328,11 @@ static struct notifier_block psci_sys_reset_nb = {
 	.priority = 129,
 };
 
-static void psci_sys_poweroff(void)
+static int psci_sys_poweroff(struct sys_off_data *data)
 {
 	invoke_psci_fn(PSCI_0_2_FN_SYSTEM_OFF, 0, 0, 0);
+
+	return NOTIFY_DONE;
 }
 
 #ifdef CONFIG_HIBERNATION
@@ -671,7 +672,8 @@ static void __init psci_0_2_set_functions(void)
 
 	register_restart_handler(&psci_sys_reset_nb);
 
-	pm_power_off = psci_sys_poweroff;
+	register_sys_off_handler(SYS_OFF_MODE_POWER_OFF, SYS_OFF_PRIO_FIRMWARE,
+				 psci_sys_poweroff, NULL);
 }
 
 /*

-- 
2.54.0


