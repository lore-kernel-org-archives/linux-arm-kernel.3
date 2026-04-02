Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107E5D3942D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Cc:To:Subject:
	Date:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UYAwkG0AeFdu6OORQnVUY2nqIYslSypwpd3ijYca4XA=; b=L+Dk5E+Y+wN6RTsoRwBm/c8ojb
	9+yOFOg34BECW8LzY0MXVJdU2/MevXne51UqrO1WAZPPD0IfFUAVGQWoGcLBLSQSC62a4vgAov9g8
	x90tHateYDh7Yl5RPnou9Zf76FMKdYc3eOtdg1qHLr8WIQnMx3vHi+A1bGqlUbW+YJh5mv+amtZnx
	c/asb8NPAiGKsC5HJF3z3dEPzJPZNN9d2TQ2iihlUqInLufC4iRrUoDnUZKPCoVloAH/Hwa5uKVZk
	Szf+FoobLR4mtw3ve88mnXWUTWrBPkY7klEhsI9tMpf7qPIXCOBU/1VO+8YdgagNAvvSbPewpEmm+
	gyjXW7Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ihy-00000000FTU-05mC;
	Thu, 02 Apr 2026 14:07:42 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ihu-00000000FRJ-2mHa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:07:41 +0000
Received: from hppdeMacBook-Pro.local (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowADX+eAfeM5p4C+rDA--.22193S3;
	Thu, 02 Apr 2026 22:07:32 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Thu, 2 Apr 2026 21:50:37 +0800
Subject: [PATCH] ARM: setup: NUL-terminate the fpe= emulator type
To: linux-arm-kernel@lists.infradead.org
Cc: jbohac@suse.cz, akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 pengpeng@iscas.ac.cn
Message-ID: <177513885235.95485.11195348639348945216@iscas.ac.cn>
X-CM-TRANSID: rQCowADX+eAfeM5p4C+rDA--.22193S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4rCw13ArWxWF17CryfWFg_yoW8Jw1xpa
	9093Z8trs8ury7Ja4UAr1IvF98Jws7try2grW293yvyF12qr92q39Y9F1a9w1v9rW293Wj
	9a4ftrsxAayUArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
	Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUU038UUUUUU==
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_070739_082394_C8410EC6 
X-CRM114-Status: UNSURE (   9.30  )
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

fpe_setup() copies the boot-time fpe= value into fpe_type[8] with a
raw 8-byte memcpy(). The NWFPE path later checks that value with
strcmp() to decide whether to install the emulator.

If the command line provides an 8-byte fpe= value, fpe_type is left
without a trailing NUL and strcmp() reads past the end of the array.

Store the option with strscpy() and leave room for the terminator.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arm/kernel/setup.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 0bfd66c7ada0..815a53a8584d 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -24,6 +24,7 @@
 #include <linux/interrupt.h>
 #include <linux/smp.h>
 #include <linux/proc_fs.h>
+#include <linux/string.h>
 #include <linux/memblock.h>
 #include <linux/bug.h>
 #include <linux/compiler.h>
@@ -65,11 +66,11 @@
 
 
 #if defined(CONFIG_FPE_NWFPE) || defined(CONFIG_FPE_FASTFPE)
-char fpe_type[8];
+char fpe_type[9];
 
 static int __init fpe_setup(char *line)
 {
-	memcpy(fpe_type, line, 8);
+	strscpy(fpe_type, line, sizeof(fpe_type));
 	return 1;
 }
 
-- 
2.50.1 (Apple Git-155)


