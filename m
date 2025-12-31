Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E763EE6428
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 12:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=doIBT3kveDHefqqmJXIbpBpDJYXHZZ9gY6YG0CQ1W1s=; b=sztRgAhjCQvCZEIeNvO8GOvWUD
	gbk0KDKRATR/Ma6DQw/PLwxdpxsHeBfPWC+dsqWZulvE9G/BUiLI/oVV9hLRO+GZqyJN8zGW0duRQ
	w4gtrsXxL/BryeyI6e9Ao2M47GF+/qrgovC2BHcRGLEbIz+kIigZ2N42LnIxzsQtOz+r40BzDqOCP
	qxlITJAz0649EMOaHAGnmxXnMII8iIL33gFrteQ5aid+eD5OEWc30pzfc2WMkgS4FrP8SIpgOk2FX
	yIm4iVnafbuDq7qde1ygbQOrJRjhsz6jdq/3y9zCNf05E2iG6xG9f63LrKoE+JW3T7+P/no5VN0Fh
	otUI0YdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavZ0-00000005zOM-0Bq6;
	Wed, 31 Dec 2025 12:44:30 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavYw-00000005zNz-1ysW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 12:44:28 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7c75b829eb6so6840483a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 04:44:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767185065; x=1767789865;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doIBT3kveDHefqqmJXIbpBpDJYXHZZ9gY6YG0CQ1W1s=;
        b=Cv7eIf5CFvDGn2geQyEhWgAMBe/MKjZLQJlgLDwQW/1vB+QmUDLyDV4BLNmcyzb0jn
         D4hLH6fwBBrjYMQ/QMrucnlV8bPwZt+tLbma8yLuF43V+8Qxo1ivoOy+imviB6Zfqkek
         MODm/mOjSULBfV9m7Hr3S7zJ4nPB3GzVZO7Lb+9S/hTFOGgI9mNy3JfEMrWAxAslG4RS
         d6J8ILdYzDffqOSOVutAzWmT1/aLHm7JGgFAHYgl4WFe90VsU0tP3gIi59hPWQpafSpP
         cNzFe6RlQ1aCQYKxvdEdHS2sfrieEZNakxiS8VE10Rm82GJNx4467MZMbdGsxxCOQirZ
         iWCQ==
X-Gm-Message-State: AOJu0Yxc4uKpsbWG7njecvK4om/ukvJc21icIBHDxePrHo59tqLo4SYS
	9tPxw9Z3+zeF5CHpmPc/gH4tpUHfn92Ey6d/BcX+h95pvidSXVKiVu7z
X-Gm-Gg: AY/fxX5RgC6xOu7V9ju2jX6vwwamvuusl7qycWcFFTIGoUgAkcKcxuCZLiilhgDxoJc
	CRNptUHLf25vfTMQMEo+hyw8YaEVCK6SuqOtKoox6kUPjKHzheLg7uOXsaXdAzBRJhnDCXp3exf
	X67G6OGFd8eOHTXi3+XF966Xav9BZ7x7YFUWd/8E/eLJy7CLYd8KKuUEeyw528x9RBUPUjpKQ5D
	uDueJdvVgtRAzBRaMEjm+IOG/tCnq/dg3ADZmS+JhnpsaEh9ryGG3+2pDGQvMCo7MV4jMf8ar+L
	lc+yo/wTU2L7h7UL8W23UsEzZadKh+LKmaWptznldFTLtioROiRb+jIxO3ogUZOSOkRQs55F6M1
	+L8fn5XgLGy4/EGhyRR++GNRBG0P86S54v+llRua0yVluO9Ck6DSPbeavkFDy2bZiqeng3LhjBh
	Ozo1fysyMu1g==
X-Google-Smtp-Source: AGHT+IFVj7a9FUlEf5NH6KpIT/kaUw0oiLWglRHiOzK9tALgQw37NwF6rJUHBW5v0Oj+IkC3OkEsQw==
X-Received: by 2002:a05:6830:3154:b0:7c1:12c5:334e with SMTP id 46e09a7af769-7cc66a023c7mr23119448a34.17.1767185065067;
        Wed, 31 Dec 2025 04:44:25 -0800 (PST)
Received: from localhost ([2a03:2880:10ff::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667d6b04sm24557658a34.16.2025.12.31.04.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 04:44:24 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Wed, 31 Dec 2025 04:44:05 -0800
Subject: [PATCH] arm64/mm: Fix annotated branch unbootable kernel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-annotated-v1-1-9db1c0d03062@debian.org>
X-B4-Tracking: v=1; b=H4sIAJUaVWkC/yXMwQqEIBQF0F953HVCKhH4KzEL01e9FjaoxUD07
 0O1PJtzonAWLnB0IvMhRbYER7ohhMWnmZVEOIJpTaeN1cqntFVfOaq+i2wna0PsRzSEb+ZJfs8
 1fF6XfVw51DvAdf0Be9PcO20AAAA=
X-Change-ID: 20251231-annotated-75de3f33cd7b
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Laura Abbott <labbott@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, puranjay@kernel.org, 
 usamaarif642@gmail.com, kernel-team@meta.com, stable@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769; i=leitao@debian.org;
 h=from:subject:message-id; bh=rtQ9YOzpTI1rtYAALDX3LhmxVAFBXeE/3oqvYKuAQ8c=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpVRqoMlyZ1wZ3Pzr1vXtCo85272KEY4xVGFmrE
 b2oMh6CVkmJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaVUaqAAKCRA1o5Of/Hh3
 bQZwEACnPfBsC/ChcFSyk6SAwxKoOvb1ERUF80rfaNxXBJiaA1VgbqM7C/wBw+YbXrQmhzVqY/e
 zB/ndUjEg1Qw/f1EkWqLpRYykPjwyQ/nZsHL8RUh+lvvsu2vH83B4FgCIL991+rvhDFZW75ecWY
 Wx27xdC7xpaYRNPR/lCGRyKw9GRdkZybGZhUqed7Tu0UwVGNJkdEonPSWzsyXQhxdAKqPkaTXwP
 yI+5HdfEAuA8nCB56AYgRaMxUUmY+Gg0JtwVD5CS/lsrFAcsngfXp0I0h2TMFDOYF1Hlwo5ZZ/z
 w8qA3nMwS0murcRCerIFfvy/jgPPx+OW9JE1WcwbAEDqZjXSQ/Po0ENzua7Nu8JciG9+Xf46Ikv
 xH/PK9ICIZQsNLJszbbllCh6smeoREyPb7MLH7utDd9lbPy0K7ALIeJJJOM77UoSBmIX3yJlEl8
 8FLJGGRpDH2/y2YbFkzWthRAgG9qFm3dVwpY8HtXJsFRnxAb2lQW3w99ahtwb5b+WzXzGXSaks4
 csHXIdZitAVmfvtZvoZc2hJ9fpfI2ggf5vrK2Z+gT7SN4VIA6agvZWESHTh3BpTcabZIWqPxwIl
 7GUbaPEl3NeaOpCjDiB438p2p4W5UwQstGYeLrTvFjKj8PLdWHg5liU52jhLlKSvVXXC2iAk+iL
 +BJxQOoAcO2C7tA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_044426_542892_9CB59667 
X-CRM114-Status: GOOD (  12.23  )
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

The arm64 kernel doesn't boot with annotated branches
(PROFILE_ANNOTATED_BRANCHES) enabled and CONFIG_DEBUG_VIRTUAL together.

Bisecting it, I found that disabling branch profiling in arch/arm64/mm
solved the problem. Narrowing down a bit further, I found that
physaddr.c is the file that needs to have branch profiling disabled to
get the machine to boot.

I suspect that it might invoke some ftrace helper very early in the boot
process and ftrace is still not enabled(!?).

Disable branch profiling for physaddr.o to allow booting an arm64
machine with CONFIG_PROFILE_ANNOTATED_BRANCHES and
CONFIG_DEBUG_VIRTUAL together.

Cc: stable@vger.kernel.org
Fixes: ec6d06efb0bac ("arm64: Add support for CONFIG_DEBUG_VIRTUAL")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
Another approach is to disable profiling on all arch/arm64 code, similarly to
x86, where DISABLE_BRANCH_PROFILING is called for all arch/x86 code. See
commit 2cbb20b008dba ("tracing: Disable branch profiling in noinstr
code").
---
 arch/arm64/mm/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index c26489cf96cd..8bfe2451ea26 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -14,5 +14,10 @@ obj-$(CONFIG_ARM64_MTE)		+= mteswap.o
 obj-$(CONFIG_ARM64_GCS)		+= gcs.o
 KASAN_SANITIZE_physaddr.o	+= n
 
+# Branch profiling isn't noinstr-safe
+ifdef CONFIG_TRACE_BRANCH_PROFILING
+CFLAGS_physaddr.o += -DDISABLE_BRANCH_PROFILING
+endif
+
 obj-$(CONFIG_KASAN)		+= kasan_init.o
 KASAN_SANITIZE_kasan_init.o	:= n

---
base-commit: c8ebd433459bcbf068682b09544e830acd7ed222
change-id: 20251231-annotated-75de3f33cd7b

Best regards,
--  
Breno Leitao <leitao@debian.org>


