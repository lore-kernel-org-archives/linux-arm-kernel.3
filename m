Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D91FF8E4B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 07:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CyUOOCVHhcafAepl3vLASavyzTR7QmR3C8wwgf4j/ms=; b=bjgZd4DooB/VsCLkcM4z+9GKvK
	Ciw0pHFpQMHJD8NPAGfippnhjMFv0305ZONKKubrA65N5MPxgbNw+vngO51yg30krjFr7OZ1DHfMf
	WvFqUqKRzbQgbozHw5s/ZytU57IiQuZl6fb3dRIi7QnR6vwD1znvEcfJbtVTf4uTGVqRUNY1tuO8J
	pO72ysmAuUUBd3Y85SDIhH4Y9jcYW47pTRUX4aa8vAJVzotRP5F3yfoSCvXCHzbXSnMc1o/RDliJ0
	c+TXV+D3fSsjGmm9jAoMwmA/QMT1k/Eo4XWZZuaoOZQjg3CmrJVOjArLl0yIlV18IerVctKYHUIqu
	KG6nxakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDddO-00000003aOV-1e8p;
	Fri, 17 Apr 2026 07:29:02 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDddJ-00000003aO8-1Wnm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 07:29:01 +0000
Received: from localhost.localdomain (unknown [111.196.245.116])
	by APP-05 (Coremail) with SMTP id zQCowABn9gkr4eFpn77XDQ--.24145S2;
	Fri, 17 Apr 2026 15:28:44 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Russell King <linux@armlinux.org.uk>,
	Jiri Bohac <jbohac@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] ARM: setup: NUL-terminate the fpe emulator type
Date: Fri, 17 Apr 2026 15:28:41 +0800
Message-ID: <20260417072841.88838-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABn9gkr4eFpn77XDQ--.24145S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF48JFy7Ar43Cr4DXr4xZwb_yoWDXFgEqr
	93t34DGw10v3WIvFW7tw43ZryxKa1UWF1vgr93Kw47Arn8Xr15u3s5ZF9aywn3Wrs7Kr9a
	vw4DGFWagr10gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUejjgDUUUU
X-Originating-IP: [111.196.245.116]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_002858_818773_F964C91E 
X-CRM114-Status: GOOD (  10.89  )
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

fpe_setup() copies up to 8 bytes from the boot command line into the
fixed fpe_type[8] buffer with memcpy() and leaves the array without a
terminating NUL when the parameter is exactly 8 bytes long.

fpe_init() later compares that buffer against "nwfpe" with strcmp(),
which can read past the end of fpe_type.

Use strscpy() so the boot parameter stays NUL-terminated before it is
used as a C string.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arm/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 0bfd66c7ada0..c07bc6a380c5 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -69,7 +69,7 @@ char fpe_type[8];
 
 static int __init fpe_setup(char *line)
 {
-	memcpy(fpe_type, line, 8);
+	strscpy(fpe_type, line, sizeof(fpe_type));
 	return 1;
 }
 
-- 
2.50.1 (Apple Git-155)


