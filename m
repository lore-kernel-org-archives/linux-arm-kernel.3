Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31229C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mAGs7Tqn+j+GhX5JzN5hfymRTeUjhr+a1EtjFFeVz1o=; b=bnyVabMh7QHOBqTzxLVDY6lBd+
	99q5fpOpPzMmZM+QA1KcqXUMmLAcO+8GUSpbzeki2l9QjRK50RIlI3lVFGBbMB6OQSMQ0wuqZBmvp
	vfEZ8xdvcgoL6ryIC5zNqQTzZYRuFEffclgtsx4kC9NY+hDbNMit5ry98MASsZ98kZKateWL/wkel
	NAbY0bkiljy/CC6IwcbqFvR0HiaYTeA7YVx9Y/hCPr0817MpToaCJJ08F6P1NQ1j7HR38Suuywxkp
	GYs59YsHIu80OLlvJJdt88fBc9kkm1+S8rcuepwOTWccKlX0/qaYIM/+0B3ajjhWIYsgTkiIwB0RF
	/GM5PYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8m2-00000001ZBZ-49HY;
	Thu, 22 May 2025 16:28:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8W0-00000001Xda-134Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 16:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF90162A45;
	Thu, 22 May 2025 16:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D626C4CEE4;
	Thu, 22 May 2025 16:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747930287;
	bh=JEfH3x55bskJhV3y2mrEzMyulGhfZQeDOuhnI2p0a6g=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=TsqCeWt4Z5jpzoA9XrSdgkEWWeJChz14BXRa4W3a+NfpsL+dco2AmMLp8o7dbZJN9
	 uijjEp32I9PMHFDXcBTwoP2YLDoamxf6Pddcg1vxRz+T87xTo0dcR5DjNqTNds9+0W
	 sDY37BVcpkOFv70jjtF5/7Y/y8DvKu5kj96tawRkkDGrk8E5vx4rJLzR5srx1viZ1x
	 6iOmyZ0EUlqu3p7eWopo+i8T90ZSaCRqrqAkZnCkqhj9DmCn5eXbJ3bQhBqSNbvf6x
	 F6KMgsr6T6pbUncEMum9Gdb/o4IR9PEiepKZpxKbnkyChTpzLzOsghDgJjwWCIpIsN
	 Oa3Fpnai6MU3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222F6C54E65;
	Thu, 22 May 2025 16:11:27 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 22 May 2025 11:11:24 -0500
Subject: [PATCH] ARM: tegra: Use io memcpy to write to iram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKtML2gC/x2MQQqAMAzAviI9W9CKIn5FPNTZbUWcsokI4t8dH
 kNIHkgSVRIMxQNRLk26hwx1WYDxHJygLpmBKmqrlgg3Nh5PcZFx5cQBLc9Llo2lroecHVGs3v9
 ynN73A1jjFBdiAAAA
X-Change-ID: 20250522-mach-tegra-kasan-fabd0253f268
To: Russell King <linux@armlinux.org.uk>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747930286; l=1106;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=hU2Yl0x61OcdReq0QPOKVTLdxOPyeKujmiktaOo9ip0=;
 b=+CjK5VVg+heemutBNUgW5ZgTFi1GM58YOUfxw5ahL0xfg7exDr03GfcypGLgflQH1UbQahdYf
 mcrxHC7m+mzAOsRFSKYDE1V/wZ1CtL+lOYdb9zBf6HZy+SnO69xWWEV
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
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
Reply-To: webgeek1234@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Aaron Kling <webgeek1234@gmail.com>

Kasan crashes the kernel trying to check boundaries when using the
normal memcpy.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Change-Id: I27714f45aa6aea6a7bee048f706b14b8c7535164
---
 arch/arm/mach-tegra/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
index d5c805adf7a82b938bebd8941eae974cf6bcdbe3..ea706fac63587a393a17fe0f1c2ad69d6e5c14f2 100644
--- a/arch/arm/mach-tegra/reset.c
+++ b/arch/arm/mach-tegra/reset.c
@@ -63,7 +63,7 @@ static void __init tegra_cpu_reset_handler_enable(void)
 	BUG_ON(is_enabled);
 	BUG_ON(tegra_cpu_reset_handler_size > TEGRA_IRAM_RESET_HANDLER_SIZE);
 
-	memcpy(iram_base, (void *)__tegra_cpu_reset_handler_start,
+	memcpy_toio(iram_base, (void *)__tegra_cpu_reset_handler_start,
 			tegra_cpu_reset_handler_size);
 
 	err = call_firmware_op(set_cpu_boot_addr, 0, reset_address);

---
base-commit: d608703fcdd9e9538f6c7a0fcf98bf79b1375b60
change-id: 20250522-mach-tegra-kasan-fabd0253f268

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



