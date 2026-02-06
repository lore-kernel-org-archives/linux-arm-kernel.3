Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B2CEE209D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 13:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qMSJm3r9QghaqsOLATICPq8S+PcfLWjkhMCydwvJ6a0=; b=FtVs+zswvFP9F6nVb8XDle8cbZ
	HR3fynxDLvUdGxIK8H6kUZ5LbkDffU+tq+Dw1D9FsjabPtSQQvqeBSmc5qJeumtYgbO+dozrnjrg5
	3UQdVUlw0JdXkniV6vQB8vOdmQLJkggQPN0ih1b9hLms3riY+Iwm4bnFL1ESiBAFx87aXtfSYxaDC
	3DdixQsy2QC3RzP+pgT5SGCCHfe5fhw64jReVR0y9fUHTaONUVV82Qs+kv+xDj+vhoVP0Xc/hBoYV
	ymBJ4wKmthvwgfJqleorRFnRZGPoLaOo4WcwEi8Wwn+Msy/BdHWVUzZUc8NOz1hVLpUWGdCvQMKTe
	nIcxqY+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLU0-0000000BKss-3Qz8;
	Fri, 06 Feb 2026 13:02:48 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLTy-0000000BKsR-1QhC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 13:02:47 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770382961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qMSJm3r9QghaqsOLATICPq8S+PcfLWjkhMCydwvJ6a0=;
	b=kgALjKzwuaFs+uVbmz5ktfLmKj1T86SzNiP+L4+huOrjYFx05ZK9NIfsf+cyZLpteOCUac
	SNw+8vl8HRnEpd8c3kNgdvCeQhhY70zWNX17bfwhL8W3GP8EHLXGeCnEMcRyEp5Q+UjVPV
	9CvgRftllhdaMBL6a1lOicU8YOCLraFU+VI5FbuhzHLsKsmeFahnaR7m/myf1X5OvhOVse
	QaQqqw2iIIxJapVTXCK5ZAqIRL6Ov9uFp2lHxcBWiTkVzj/s3KvkfosRT53dQP0O1kPCsA
	fWTgS9tz+Ch/2WLkfQQaytgxbw2lnwKCdP/Nv/1QNx1JpIgTjhdH1ReSzRVR6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770382961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qMSJm3r9QghaqsOLATICPq8S+PcfLWjkhMCydwvJ6a0=;
	b=2JtHN8C12cuuMCKVnHfL1P9yfxGYvomBX7Ze0oZ5uL/sYh8y76IAr06+TFIWkM4wuTc52y
	csTd5F3xxjkj+iCg==
Date: Fri, 06 Feb 2026 14:02:38 +0100
Subject: [PATCH v2] ARM: Implement ARCH_HAS_CC_CAN_LINK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260206-cc-can-link-arm-v2-1-290cbf369fb6@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNzQrCMBCEX6Xs2ZUkhPpz8j2khzXd2kVNZVNLp
 eTdjQVPHr8Z5psFEqtwgmO1gPIkSYZYwG0qCD3FK6O0hcEZVxtrHIaAgSLeJd6Q9IGeOXTUOjL
 soayeyp3Mq/HcFO4ljYO+14PJftOf6/DnmixavOz8nh0R1VSfSvUadYgyb1uGJuf8AXOxLo2yA
 AAA
X-Change-ID: 20260102-cc-can-link-arm-4eecfad2a0e4
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770382960; l=1768;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=K0U9s1d9SAUAqd8e+w8kJvCum5qTFHSd7IwJFwm3VRM=;
 b=wzWwwQZ4H1aptd55kehWA0ChSnUrfXpCqZwXEEKGpya4F5ak1ELXWW0zW4bFYUIN4gSqdIY8T
 LY+HisbnYmaDcEJnPU9FiTxn88/le13yQqztP3kvXoCuuMY97eOhUxZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_050246_518666_885D24E8 
X-CRM114-Status: UNSURE (   7.60  )
X-CRM114-Notice: Please train this message.
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

The generic CC_CAN_LINK detection does not handle different byte orders.
This may lead to userprogs which are not actually runnable on the target
kernel.

Use architecture-specific logic supporting byte orders instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Handle BE8 vs BE32 platforms
- Link to v1: https://lore.kernel.org/r/20260109-cc-can-link-arm-v1-1-b748e2aaa6a6@linutronix.de
---
 arch/arm/Kconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fa83c040ee2d..d5cb85d82dad 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -6,6 +6,7 @@ config ARM
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE if HAVE_KRETPROBES && FRAME_POINTER && !ARM_UNWIND
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CACHE_LINE_SIZE if OF
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
 	select ARCH_HAS_CURRENT_STACK_POINTER
@@ -1715,6 +1716,18 @@ config KERNEL_MODE_NEON
 
 endmenu
 
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-mlittle-endian) if CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-mbig-endian -mbe8) if CPU_ENDIAN_BE8
+	default $(cc_can_link_user,-mbig-endian -mbe32) if CPU_ENDIAN_BE32
+
+config ARCH_USERFLAGS
+	string
+	default "-mlittle-endian" if CPU_LITTLE_ENDIAN
+	default "-mbig-endian -mbe8" if CPU_ENDIAN_BE8
+	default "-mbig-endian -mbe32" if CPU_ENDIAN_BE32
+
 menu "Power management options"
 
 source "kernel/power/Kconfig"

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260102-cc-can-link-arm-4eecfad2a0e4

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


