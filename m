Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE60C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 05:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R5GJYlkXT0vSw2Kc0ay2ukzCBmnnFXXk54xXv2Y6mic=; b=UGnQ2jacTZnQxXbsRTBT/YAg5p
	4bHNKMPt/Rr3IpmfePfBcAakfSQMsNOBpcTpj4Kj29TXLcXlSzNT3vXWogCTO6e3F+tSpuuEoM0Oe
	O4/u4atyewwsw5U4UAZQeovNhwrX3IZz58lGQ3hwPcDsCuIN+yy0WWreWiW85u9cW5bPI2zaQRSgd
	dEYrvBhuuRnXh1oj1ko78E37rXK5opEKK/e/05DRHJxP2DHk6sS0xvzGJ5ITwpZHpSURj21dJFYqy
	6vBynt2o4MXV6yVU0cCcYA2/qZVfUtfUp+3qfAa9CGwIlQgzKT896/Ldt7zDnDmDRdb9IVxIMfu+F
	kkM6xK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR25r-00000003OVN-30r2;
	Mon, 16 Jun 2025 05:09:15 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR23d-00000003OKk-2qCU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 05:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750050412; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=R5GJYlkXT0vSw2Kc0ay2ukzCBmnnFXXk54xXv2Y6mic=;
	b=E54Xvh5bPibJbZr36U49mxPDNz6nLF34J3so4uYYyQPR81nu/ZOOYpl+J4K5/849bYnhWmTzfZ6qXkTobPCi0E+Si0j+RdUR4yXcF99DySPu9WpP1XEvse8lzpwfBTkgD4v5f7P7KVUeEmM7z9v4FO6zWCIZW4GxDWvsR2UPTKE=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WdrrnGW_1750050408 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 16 Jun 2025 13:06:49 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: brauner@kernel.org,
	shuah@kernel.org,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: baolin.wang@linux.alibaba.com,
	tianruidong@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	catalin.marinas@arm.com,
	mark.rutland@arm.com
Subject: [RESEND PATCH] selftests/pidfd: align stack to fix SP alignment exception
Date: Mon, 16 Jun 2025 13:06:48 +0800
Message-ID: <20250616050648.58716-1-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_220658_383273_06865CBD 
X-CRM114-Status: GOOD (  12.41  )
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

The pidfd_test fails on the ARM64 platform with the following error:

    Bail out! pidfd_poll check for premature notification on child thread exec test: Failed

When exception-trace is enabled, the kernel logs the details:

    #echo 1 > /proc/sys/debug/exception-trace
    #dmesg | tail -n 20
    [48628.713023] pidfd_test[1082142]: unhandled exception: SP Alignment, ESR 0x000000009a000000, SP/PC alignment exception in pidfd_test[400000+4000]
    [48628.713049] CPU: 21 PID: 1082142 Comm: pidfd_test Kdump: loaded Tainted: G        W   E      6.6.71-3_rc1.al8.aarch64 #1
    [48628.713051] Hardware name: AlibabaCloud AliServer-Xuanwu2.0AM-1UC1P-5B/AS1111MG1, BIOS 1.2.M1.AL.P.157.00 07/29/2023
    [48628.713053] pstate: 60001800 (nZCv daif -PAN -UAO -TCO -DIT +SSBS BTYPE=-c)
    [48628.713055] pc : 0000000000402100
    [48628.713056] lr : 0000ffff98288f9c
    [48628.713056] sp : 0000ffffde49daa8
    [48628.713057] x29: 0000000000000000 x28: 0000000000000000 x27: 0000000000000000
    [48628.713060] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
    [48628.713062] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000400e80
    [48628.713065] x20: 0000000000000000 x19: 0000000000402650 x18: 0000000000000000
    [48628.713067] x17: 00000000004200d8 x16: 0000ffff98288f40 x15: 0000ffffde49b92c
    [48628.713070] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
    [48628.713072] x11: 0000000000001011 x10: 0000000000402100 x9 : 0000000000000010
    [48628.713074] x8 : 00000000000000dc x7 : 3861616239346564 x6 : 000000000000000a
    [48628.713077] x5 : 0000ffffde49daa8 x4 : 000000000000000a x3 : 0000ffffde49daa8
    [48628.713079] x2 : 0000ffffde49dadc x1 : 0000ffffde49daa8 x0 : 0000000000000000

According to ARM ARM D1.3.10.2 SP alignment checking:

> When the SP is used as the base address of a calculation, regardless of
> any offset applied by the instruction, if bits [3:0] of the SP are not
> 0b0000, there is a misaligned SP.

To fix it, align the stack with 16 bytes.

Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 tools/testing/selftests/pidfd/pidfd_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/pidfd/pidfd_test.c b/tools/testing/selftests/pidfd/pidfd_test.c
index c081ae91313a..ec161a7c3ff9 100644
--- a/tools/testing/selftests/pidfd/pidfd_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_test.c
@@ -33,7 +33,7 @@ static bool have_pidfd_send_signal;
 static pid_t pidfd_clone(int flags, int *pidfd, int (*fn)(void *))
 {
 	size_t stack_size = 1024;
-	char *stack[1024] = { 0 };
+	char *stack[1024] __attribute__((aligned(16))) = {0};
 
 #ifdef __ia64__
 	return __clone2(fn, stack, stack_size, flags | SIGCHLD, NULL, pidfd);
-- 
2.39.3


