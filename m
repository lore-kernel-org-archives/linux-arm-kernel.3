Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F548C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0eHZBxWOds1UYdEnuOhccIJeDRWzv84kT8tp0myDIA=; b=TF4H3si0fU33WZkxwuzlKVSQKR
	cIXdWCBU9WWPZJ5x/yCxhJ/AhHMXHOAAcpNMLYDlUTENYO83h64EYe4/5esP2WmOcvn6uoghP+ubE
	5/goj3M/AAsxXfFhmpuJXbqO+t+s3l4KKFqXsdQ+dLyfcrDv9I1L2ygOO/GIEt7sHsXljNxWSDzba
	5FDrdQeSl9bX3I+oImSvHmt4Z2C++POpV3op+o1f0Gr0UjgoZ9y+a75A5hwxMWnMR9SqZlzMaLLIA
	hxzdzua/egCfnfp0qlT1aKICQBQ/XMGKlbrrOyuZmiXiQl0Bnp55rzQ0F7sT6l6xvYu8zeOT8S/2q
	Dez2Ht8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c1o-00000001rsT-25Ja;
	Mon, 21 Sep 2026 11:17:44 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c1l-00000001rnd-1llH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:17:43 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d90ba1d807so34014875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789989458; x=1790594258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0eHZBxWOds1UYdEnuOhccIJeDRWzv84kT8tp0myDIA=;
        b=O2i7bRS6WETbjB0i5ibwEaTMdCNFzHQ/fN5Lsthmtdv3wo5wObWbK/AjZDDaebKBuX
         PTuGdnR1RErY30sz75YcbzcEhnXgToirUKyD+m52Qm3ycnRfEW3Y3lEwqoOPZNagmDjP
         Ci9nWtUG9vK++MjZ9pSpVk1JPU/LR0Ve9ylCUmbfcfOQWWrH8DKfUHHODXSlR/PXkqWB
         Y4vvVMPNH4b1U5eBFm/US8oW6RXsdy/jTKuQp6yT8AVqspEjM4l7q+3GX9q5xeGbTckP
         rdIOeWHjwhlGavwpF67fkQbOEDn2Vh8iFxvdlD8DknLr3+Zkf7HnoYah42lGedvR8cyV
         JcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989458; x=1790594258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0eHZBxWOds1UYdEnuOhccIJeDRWzv84kT8tp0myDIA=;
        b=MT7Drl4TSz0l3MNJNP2vDaflNAeTJ5MbuPJ+S8UPyjSg40Zg9d3mTNYMTWH5e/zRKC
         KeKpY7g0N059AzNrVPsDF4csSe4K0IYUiD7rRM3zLl6xdrKFTJXJcPtsBfs0g3OQ9DfK
         1bryorUwuz9mz1LyEpblo7PBTi2gQ8edx/ZY0QcDDlPV00Y9RrOC+e4vSdW6CTNaeFB2
         GMF9qXwvUeHTJg/iiF5AF1NcRisuE7xLuZQW84omHYr8KL9Ff/3/QPEFTh1cIDlM/RnJ
         MUaxlM7OIhyDH5luOxanX1TcvRaJ2Mm1W/ObpWy9DbG4uAVajT56SLzBOZu89ypRncPG
         YlIA==
X-Forwarded-Encrypted: i=1; AKwUvBxy6tjb3d3l4hKDT1V6hOQsDOaSO6/2XYdgGOwSaNy1zAMXKXCflodH1pxY5YpFFedMo45cfJ/bY6KiIYMAtjD8@lists.infradead.org
X-Gm-Message-State: AFuF++nD3XdwBM7C2UaT8aVxcRqp1ZavSoFqpz6Jowgh/bdsDDE2FTCi
	IUHoean+Hn7ZBxYSY0G/CILtWJq6RQ0sBeTqt7cytnggrMEA0fp8nNiitIab2EuQbmg=
X-Gm-Gg: AYBFou3+W39n+B0RhjYKbsJ6qQQhp2ycjq+piv5BZuLbUPqeuIP0R8Dc44o0EvBtn4L
	DLH1Hu3YTn6OKDdd95s8uTJ7f8wV1Sf99hjffP82q9bAOQ1EK/GmKg2B72nXxCspURcljD6RhPo
	omX071yUDvHnI1os8v09hO0A3B218ZahwtNZViHwOhb3nNYDhwTU8JcVBIAACcrK/mGYHkjuLjl
	vUXiQ+nXv3AfhBwecD3BZtLo+LfM083/K3zZwqaYu64hZZpgzxeMg/CxYgY754Mz5iQdrXCLVk0
	dd5pO9Q8UN86Ipirec4O7kQE0E3UXjE3EH3qDJUkODdAI/Ie5cPCpLyFT2/bS4OVOdwbhj+OM+0
	fAvUgk2XLG+lqmhDzYF3grctmukVOpM/sCZZH4+4wK2bJjrdpwcXHnpBV57NDvqAxMNLYIu2Yuu
	27jqOMEU5/036NBkp5PSMHAv1+RRu3y+jPYP+kgEn5bCZImmk/LH7XAIizzOZ1NJK4BUqPEzV4q
	yOLCIG38KVrNacIjf0boDnm3C2NYCOip65n
X-Received: by 2002:a17:903:2349:b0:2dd:c100:a5de with SMTP id d9443c01a7336-2ddc100a706mr90374885ad.50.1789989457717;
        Mon, 21 Sep 2026 04:17:37 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([240e:694:e20:401::8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba651sm31831125ad.53.2026.09.21.04.17.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 04:17:37 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuanzhu <yuanzhu@bytedance.com>,
	Yicong Yang <yang.yicong@picoheart.com>,
	Susheng Yang <yang.susheng@zte.com.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v10 RESEND 5/9] riscv: mm: avoid enabling interrupts for nofault page faults
Date: Mon, 21 Sep 2026 19:15:02 +0800
Message-ID: <4bc18f96053a7859a3ff33747479b05a9e42a706.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_041741_473347_33B3BDB7 
X-CRM114-Status: GOOD (  14.86  )
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

RISC-V enables interrupts in handle_page_fault() before checking whether
the fault occurred with fault handling disabled. A nofault access from an
atomic context can therefore run tracepoints and open an interrupt window
before reaching the exception-table fixup.

Handle an exception-table entry before entering the generic fault path when
fault handling is disabled. Also keep interrupts disabled until such a
fault has been resolved.

This makes RISC-V consistent with the expectation that an in-atomic
nofault access does not enter the normal fault-handling path. It also
removes one source of re-entry when perf sampling is delivered through an
SBI Supervisor Software Event (SSE).

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/mm/fault.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 04ed6f8acae4..520495420462 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -294,6 +294,13 @@ void handle_page_fault(struct pt_regs *regs)
 	if (kprobe_page_fault(regs, cause))
 		return;
 
+	/*
+	 * Nofault accesses must be resolved through the exception table before
+	 * entering the generic fault path or enabling interrupts.
+	 */
+	if (unlikely(faulthandler_disabled()) && fixup_exception(regs))
+		return;
+
 	if (user_mode(regs))
 		trace_page_fault_user(addr, regs, cause);
 	else
@@ -314,8 +321,8 @@ void handle_page_fault(struct pt_regs *regs)
 		return;
 	}
 
-	/* Enable interrupts if they were enabled in the parent context. */
-	if (!regs_irqs_disabled(regs))
+	/* Do not open an interrupt window before a nofault fixup completes. */
+	if (!regs_irqs_disabled(regs) && !faulthandler_disabled())
 		local_irq_enable();
 
 	/*
-- 
2.50.1 (Apple Git-155)


