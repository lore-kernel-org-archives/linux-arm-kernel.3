Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D29CA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lue1Gn/YzHi7kMNALH1V2f/8WOdV/JJuWqq2ltHsSx4=; b=csv0QUpR14Bdu/0ihPeHhiVzZi
	kihaYCOauSyxQVFZkj5gHDysaiUq5ZYOalZF/S26ArFr5fHRrg+VA92dvC2MRYkJXPCm9i17sEgFE
	8Ef2Dnoidm2PF9nHP5byDHURxGvkjvxIBrxaWtlQrSpaPb7JqLUWlTzzZv3kL1F5gvifCzjKaNy8z
	b1c184FYFtB0GwvOh+uRkLlFCARSFtkqQBudVDPaRYuItlWk69APMWZrruXKtO+MQSCXQ2OY4Eb4T
	+CmVmAYDWs7eLf8o9bSQ8NaKp1PPagA9CikErzc40zeNqOco913A4iOK9hHYChWRABLK0Epin9ANC
	zB+MrTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrNM-00000005iRB-31c7;
	Wed, 30 Sep 2026 10:17:24 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrN5-00000005iJ2-2cEY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:17:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Lue1Gn/YzHi7kMNALH1V2f/8WOdV/JJuWqq2ltHsSx4=;
	b=i2TQxvFtnncFaWY0xQwBYGfdWOil6u+owbSgED0WSrVfSQynjSyLW7/HCp6uFoI8KCjljclW5
	Uk3ihPp2zMfu91moTHCRBjmYDl6BfHMVlHvFqqlu6btrRF4s7YiUJkaaGQTZ3WMQduv45IfEKWl
	zqRijvIiL3cmCEJE9dDPMAY=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hvrJ43dQxzKm9J;
	Wed, 30 Sep 2026 18:04:52 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9109840572;
	Wed, 30 Sep 2026 18:17:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:17:04 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<tglx@kernel.org>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v20 14/15] arm64: Inline el0_svc_common()
Date: Wed, 30 Sep 2026 18:18:04 +0800
Message-ID: <20260930101805.1770358-15-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930101805.1770358-1-ruanjinjie@huawei.com>
References: <20260930101805.1770358-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_031707_983989_B5C184C5 
X-CRM114-Status: GOOD (  13.03  )
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

After converting arm64 to Generic Entry framework, the compiler no longer
inlines el0_svc_common() into its caller do_el0_svc(). This introduces
a small but measurable overhead in the critical system call path.

Manually forcing el0_svc_common() to be inlined restores the
performance. Benchmarking with perf bench syscall basic on a
Kunpeng 920 platform (based on v6.19-rc1) shows a ~1% performance
uplift.

Inlining this function reduces function prologue/epilogue overhead
and allows for better compiler optimization in the hot system call
dispatch path.

| Metric     | W/O this patch | With this patch | Change    |
| ---------- | -------------- | --------------- | --------- |
| Total time | 2.195 [sec]    | 2.171 [sec]     |  ↓1.1%   |
| usecs/op   | 0.219575       | 0.217192        |  ↓1.1%   |
| ops/sec    | 4,554,260      | 4,604,225       |  ↑1.1%    |

Two side effects of the inlining are worth noting:

- Syscall-path stack usage grows slightly.  do_el0_svc() now has a
  single 112-byte frame and 13 calls, where previously a 16-byte frame
  called a 48-byte el0_svc_common(); that is +48 bytes of stack on the
  syscall path.  lkdtm's KSTACK_ERASE confirms the 48-byte delta at
  runtime.

- The inlined code, together with the __always_inline generic
  entry/exit helpers, lands in .noinstr.text.  arm64 does not have
  objtool noinstr validation like x86, so this was checked directly on
  the built image: there are no __mcount_loc entries inside
  .noinstr.text, and the inlined syscall code calls no ftrace or
  sanitizer instrumentation.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 4a13108defb0..2535cae9413d 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -55,8 +55,8 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
 	syscall_set_return_value(current, regs, 0, ret);
 }
 
-static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
-			   const syscall_fn_t syscall_table[])
+static __always_inline void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
+					   const syscall_fn_t syscall_table[])
 {
 	unsigned long flags = read_thread_flags();
 	unsigned long work;
-- 
2.34.1


