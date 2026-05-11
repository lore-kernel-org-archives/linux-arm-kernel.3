Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EDCCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8qYWnpqKAc3CsGsbqeXYsQ1vhM73dRDkO1eFhyrhzk=; b=t38cfVf8ORumT4GG2Cx2CU735P
	Ew8uGxWqiWV1roux2b9L+4FS44ksYQo65gpk8MqwKD8eK5nrmGUgJ5a6i5+HdMqGsLxq1Nr2tDG2p
	wDkMDMHbAZNIs0f2kmL0B4+tZE0TnUlb6DU9Sek7hXJtCGbf8Q3ahyyEoxnO6tsZdD2P+FVr+3IxS
	DNbeImHPbuZxqsOSTrvOPiRQL6RuI+rfmy7o2L0ncmU7IpqufHznoVb1k2IePlZyIUpOQ0ezFlG7p
	5OKsvmCnNGwt0OAdDnOXJ3Y+fO2yYN9VxXYS9AwvZwQhm1VyJfLwMwWJyFGGCALA6O0Axhnwrdr1u
	hc5Uvirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMpx-0000000Cswn-3X6Y;
	Mon, 11 May 2026 09:22:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMpw-0000000Csvh-2ftc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 09:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=R8qYWnpqKAc3CsGsbqeXYsQ1vhM73dRDkO1eFhyrhzk=; b=Rr51/dV0nGfDe1ITduM8Hi5KH/
	3qWcbWDc+U+kpu+aUTHwpajLG9qnn/S7jEDi5+ZmQ1BAzG5ID7ZB+kWdj/vP8eLcj2TR5NiSFDada
	WUxQE5Pr8w0AiqMM4N+m32WirA6O5PT30a0qflhM7rqZ+CsuwvXIHvvvgVPg3ev5udxGtgB+g5rMR
	wapHaoZPw+9RQB4nBNM4MmahbuwV5BhXjw1FiXmOEhCLxOOUrZZE7o6wCpSntk4q1B9ywM6bIazfo
	ZHmkGg2XAiQrOcWPLLQzzR2izi2Pja+p0qjAd0xNQXAp+qDJjMRpWDXaswELTQqP5pi75kHtk7CfW
	WB1hZVig==;
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMpr-0000000BA2I-3CqG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:22:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=R8qYWnpqKAc3CsGsbqeXYsQ1vhM73dRDkO1eFhyrhzk=;
	b=cSLU3tSzaTZpOMI1rVd0UdYXZkYzYL2r9bx37f9BzctxaTz+30ddsCPJJztNoyqxJGIZrr3ye
	Z7uRHhB+9x54KGYg4VekfON7kNB/uRGwxRlFeo3OITd5sutA/hor6wNFHwqeQvxE8l6OQ5nBFjP
	wK15L5IJ3AIXZTwIWbIx2tg=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gDYvt4QGcz12LKK;
	Mon, 11 May 2026 17:14:50 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 00C654056D;
	Mon, 11 May 2026 17:21:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 May
 2026 17:21:55 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <ruanjinjie@huawei.com>,
	<mark.rutland@arm.com>, <yeoreum.yun@arm.com>, <linusw@kernel.org>,
	<kevin.brodsky@arm.com>, <ldv@strace.io>, <thuth@redhat.com>,
	<james.morse@arm.com>, <song@kernel.org>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <ryan.roberts@arm.com>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v15 04/11] arm64/ptrace: Expand secure_computing() in place
Date: Mon, 11 May 2026 17:20:56 +0800
Message-ID: <20260511092103.1974980-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511092103.1974980-1-ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_102201_260462_3E4028EB 
X-CRM114-Status: GOOD (  12.19  )
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

Refactor syscall_trace_enter() by open-coding the seccomp check
to align with the generic entry framework.

[Background]
The generic entry implementation expands the seccomp check in-place
instead of using the secure_computing() wrapper. It directly tests
SYSCALL_WORK_SECCOMP and calls the underlying __secure_computing()
function to handle syscall filtering.

[Changes]
1. Open-code seccomp check:
   - Instead of calling the secure_computing() wrapper, explicitly check
     the 'flags' parameter for _TIF_SECCOMP.
   - Call __secure_computing() directly if the flag is set.

[Why this matters]
- Aligns the arm64 syscall path with the generic entry implementation,
  simplifying future migration to the generic entry framework.
- No functional changes are intended; seccomp behavior remains identical.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 8d296a07fbf7..ba8cb5ec967b 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2420,8 +2420,11 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	}
 
 	/* Do the secure computing after ptrace; failures should be fast. */
-	if (secure_computing() == -1)
-		return NO_SYSCALL;
+	if (flags & _TIF_SECCOMP) {
+		ret = __secure_computing();
+		if (ret == -1)
+			return NO_SYSCALL;
+	}
 
 	/* Either of the above might have changed the syscall number */
 	syscall = syscall_get_nr(current, regs);
-- 
2.34.1


