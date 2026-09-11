Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2C5C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0eHZBxWOds1UYdEnuOhccIJeDRWzv84kT8tp0myDIA=; b=KTp8m33L6rlfbygG6nE2mqIPLA
	PmxzS2k3db3QZCGa6lkyYS7XfFYEerfgR4OwAeNdvVirfNfNoi+Q9Jrk5cs4s/Yxyly8raby3tWU2
	EXrkCwDxiyWHUodqYwKDhAtPNncAtvkT4q2AiwiK8icJSWCCNOk7kvr3XCJ1I/z+OJPXOm5Yt9/6E
	iPR4VVrGy7Ioyc5a4rddoG0x0bOkcakkKcPu/rhlHoSXQT0GGjDku4TIqCEEI5ARBfe7XjmffnAJh
	AS0hDGfekNaqv6oWVzN2L+o53VSPSem1+ZFKGCRHBY37hFosSbs4EgjR+WZ3vnMxoZh6t3iUb5MNl
	e+EmTBcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50By-0000000GbNJ-2OQ4;
	Fri, 11 Sep 2026 12:17:18 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50Bt-0000000GbJM-2iao
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:17:17 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so605000a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 05:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789129033; x=1789733833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0eHZBxWOds1UYdEnuOhccIJeDRWzv84kT8tp0myDIA=;
        b=KEdsDunTd4FJ3YtKk3jS1xGccwJ94vhpSIMbjVslPd9qKVwhR1fulHqBV3thuc4VZm
         4yZPGT8Ago4TJsS6/Wo3r1xBguZQQtYUAYwxR0sLmSyE+GEM/Ul4YT9HDL/tUyufHnlU
         Nl3hop35ODb0lmHV3wAp0U7O/0YEMI5vQ69CiMLTEmCPysvB2q/PdmffUJO9LJc56fC+
         +MOleLZu3F4hTPz4+Vzmn8IhFzczOAytdWNpGSmOajquUQEOMzk/XzRvDtD7dbTayOlC
         bUVNmsoy9iWNhXA4uwC0FljSi6llNZGpUA82MyiaQe47oWEP+91aoJcD2duvwVGOX2zk
         Ol/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129033; x=1789733833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0eHZBxWOds1UYdEnuOhccIJeDRWzv84kT8tp0myDIA=;
        b=NUqiw5xCiFuSQ1HCm5sDhre5TYjI7vZKk8u9S3/uAzme4RYLOJeGcXnxF0h7I9OI/1
         qgCb8WrAoMMnWcmgBaOLmpxN6vc7ciXva3Hubb26tM+zr5JPJj4iFc/RR+0tqekKFy6y
         BS7AeVymOyfiNUgeumM/Cp604t/kvczsElqRrjy+7D4xvNAH1h5mNoWeb5MId1EiEUQb
         bWBeT6gaxSiMT9yqt0UNO1OBitIvI+/W3KiZ0HOMR290YIvDBYuAsMT9HQP1ErgWH/9o
         M7Oc4mPXNwE9Kcl5DeczkRSOboyPxoTuaRooh9LYFW1EbAgnr6ZQmcX1o8GJghISid1G
         oXlg==
X-Forwarded-Encrypted: i=1; AKwUvBxgk1d7bkc8O/H4EPsT0h2NW1gEhqTmRbxc8Yc1G8rHaSGedXad45Aw3ygbWoVhkzNXDPj2sGtCB2FvgciyqHwa@lists.infradead.org
X-Gm-Message-State: AFuF++kTSixcnF/GsrXzSbL8KVp6cW4ctW6MoabMSIsQXZSNc9QJavYK
	0uImcm+vqM7bb5zoEBYLD9k/1FOn1N/GjnmFHgfD3i9xVnTWG57DE0lGPJ/eHy9dJYs=
X-Gm-Gg: AYBFou1qkDrYPhP8/rqBAAUFUcl8SmclUpxOTJk2/IVykkyClEV+iEKlLCEX27vMckm
	kBf7Uw00xY1iiz+JvuFg2MSp0Cc3luvD5uXcrFSnpLjLO7DP97WADeUBOivwPzHJZpN5f0Cuqho
	bOahT5kmII/V72FWfaTri/QeQAeyML9NUb8VjTI58+eTo5GIeegVGKTPro8HSWv6anUCSj8s/XU
	0iLbfc/hHWRRRfzro0n9jMURYRrrEDmlBryyCXXgxJb7ixaj6M9e1DiiAapXVli7FXhIL0fcOkC
	wdYLdUeIbvX9a8sslWbIL0wRV9X8Jpy9x/0tTcDjuCgWuSLl1wgw6SqJkWLj3DLrxI+dkTISN2I
	i6WpPJUdqh+QPtLLJbcbDvN6BeTV17TRHHdwYD8Ijo0uViH0o4DMV4Q4XpJpoSGtnSzOqCvwjhL
	EN/HaoPv8wJXnsF6WxLzXjbPlXYuPn/Rh5iOiTKB23PcW37z5vUpNbdPNVLfTO/RxqQnF4HnjL9
	zkpP51xkhC31w2zlI3SNVT/FA3ZsU2C/iXnxOcjtoJU4O/6sF1i
X-Received: by 2002:a17:90b:270e:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39d9c1fe880mr7597131a91.17.1789129032846;
        Fri, 11 Sep 2026 05:17:12 -0700 (PDT)
Received: from FJ7FR2JRQ3 ([2409:8a28:f48:3091:908c:b537:572a:4db0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm3178278eec.8.2026.09.11.05.16.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 05:17:12 -0700 (PDT)
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
Subject: [PATCH v10 5/9] riscv: mm: avoid enabling interrupts for nofault page faults
Date: Fri, 11 Sep 2026 20:14:52 +0800
Message-ID: <20260911121456.33223-6-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_051713_702429_E5BBABF5 
X-CRM114-Status: GOOD (  14.42  )
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


