Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BC5CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 19:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dUbwGAbnnjrnTYIhityYHAbrTn/q4cPyenaTuTjrLdg=; b=FJT4AmlkJH77AlmUe3xGVy/fPm
	JsqVSideM1j1b4VEBmGI0txKeEo6MpdhPg3PCzBmaKU25UE+SMr6ZlMfFGnF1sN5LRvsH1ehiurdG
	5zG+c2zrzMXbQAsf/miqK+tmwQ0ptzp7i4sHuM3/vUigKCbXDQ2hDuTLPEhT0c4dAcMzwADtdOSHB
	ynZwLFHGl3D0wVLj1Ayc1C3Lqo5lHtlBlPXD9xqw2jM7P0VezmkhD3BQxQHyt5xHJnda7goYI/Oj8
	6g3drJk+Plblo308zPy2qiLkVzZpDgVqLErTyple75mgjt7rKB69gdNj373DUz8SM3Or4r1/3ZW4q
	XV/ZTTEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRxKi-00000002tme-3KGi;
	Tue, 26 May 2026 19:20:56 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRxKd-00000002tlp-3XbJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 19:20:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1779823251; x=1811359251;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dUbwGAbnnjrnTYIhityYHAbrTn/q4cPyenaTuTjrLdg=;
  b=BOLhhdSzD+EEgrgB44nBN6LudDWAUobc3ky3/LJ9rknlj5fO3c8yzFZk
   XRHnhAFNyKrTTeEvN0jzT5bFkI2iKnFn2ag6xOBjIUEljNTbRCIqC6oAn
   fdTPXdPvmkniLxJcSz3sUEK1msQ0B0aHtp2CRcVVJUZkGrPdwQMD6sjPc
   hiqr3fwmE0r0y8xk03iCuQBHT4f/5/QbaD3mF8xppi8WtFX/FsY57oEr1
   B6BzrH+EOrDTzvwvduxgjhE2cpN0TKO56fXwlDvEq9WBh3KX3VdppMO3W
   b4AD0H604RFfQD2MBYlPDwbPAsM0dUJlA5tTxMsXBwtcvZFOk4Vc8McJy
   g==;
X-CSE-ConnectionGUID: khoeNVcrREOEDhcejjvuYg==
X-CSE-MsgGUID: mKqm77QvQw22qtdHiSLDgg==
X-IronPort-AV: E=Sophos;i="6.24,170,1774310400"; 
   d="scan'208";a="20316884"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 19:20:45 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:7544]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.27.115:2525] with esmtp (Farcaster)
 id 53c53370-9a31-4bfa-8c5b-54a1678f5106; Tue, 26 May 2026 19:20:45 +0000 (UTC)
X-Farcaster-Flow-ID: 53c53370-9a31-4bfa-8c5b-54a1678f5106
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 26 May 2026 19:20:44 +0000
Received: from dev-dsk-gyokhan-1b-83b48b3c.eu-west-1.amazon.com (10.13.234.1)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Tue, 26 May 2026 19:20:42 +0000
From: Gyokhan Kochmarla <gyokhan@amazon.de>
To: <stable@vger.kernel.org>, <gregkh@linuxfoundation.org>
CC: <yangfeng@kylinos.cn>, <rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mark.rutland@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<jolsa@kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <bpf@vger.kernel.org>, "Gyokhan
 Kochmarla" <gyokhan@amazon.de>
Subject: [PATCH 6.12] tracing: Fix the bug where bpf_get_stackid returns -EFAULT on the ARM64
Date: Tue, 26 May 2026 19:20:12 +0000
Message-ID: <20260526192012.76223-1-gyokhan@amazon.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Originating-IP: [10.13.234.1]
X-ClientProxiedBy: EX19D033UWA001.ant.amazon.com (10.13.139.103) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_122051_962595_D36144BF 
X-CRM114-Status: GOOD (  13.58  )
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

From: Feng Yang <yangfeng@kylinos.cn>

commit fd2f74f8f3d3c1a524637caf5bead9757fae4332 upstream.

When using bpf_program__attach_kprobe_multi_opts on ARM64 to hook a BPF program
that contains the bpf_get_stackid function, the BPF program fails
to obtain the stack trace and returns -EFAULT.

This is because ftrace_partial_regs omits the configuration of the pstate register,
leaving pstate at the default value of 0. When get_perf_callchain executes,
it uses user_mode(regs) to determine whether it is in kernel mode.
This leads to a misjudgment that the code is in user mode,
so perf_callchain_kernel is not executed and the function returns directly.
As a result, trace->nr becomes 0, and finally -EFAULT is returned.

Therefore, the assignment of the pstate register is added here.

Fixes: b9b55c8912ce ("tracing: Add ftrace_partial_regs() for converting ftrace_regs to pt_regs")
Closes: https://lore.kernel.org/bpf/20250919071902.554223-1-yangfeng59949@163.com/
Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
Tested-by: Jiri Olsa <jolsa@kernel.org>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Gyokhan Kochmarla <gyokhan@amazon.de>
---
 arch/arm64/include/asm/ftrace.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index 10e56522122a..46d4300dd48d 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -145,6 +145,7 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
 	regs->pc = afregs->pc;
 	regs->regs[29] = afregs->fp;
 	regs->regs[30] = afregs->lr;
+	regs->pstate = PSR_MODE_EL1h;
 	return regs;
 }
 
-- 
2.47.3




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


