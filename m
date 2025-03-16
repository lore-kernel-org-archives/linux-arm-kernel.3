Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDE4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFS019JG0RFjz5io9ra87jX+S2pDR+I2Zduhbgoaa20=; b=NpA15wZ37SRVtJQkn1vU0ad01U
	5NxA3o+z4oJ5MqvBFEVny0eIBit0NPcUC14PdOi+B2yyiNP2iUHCOXyVhmxhwZP6/iMOwma+lGX1c
	7iJXDFRIdZsjfMD02u/EfdL5W7iVsUOhsjm1aTXZgX/gnoo0DeAv/CReRHymdUy+mYqLv1QTb+MWW
	vZfppniFBf416QzGj+/3wWAHozE2Ha/kfDPEfe0lei4UWhAIL+zx9c8KViNQ8OUR29TQsl9vBzGiV
	bzRo9wabO+FBR/wMSnhFI1wVPfjzaaipWTTzrSnXD31l/wHN/+kZFmVul3EogyMQXYbgSAB7iusUp
	j77szcpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfje-0000000HGVW-0iAa;
	Sun, 16 Mar 2025 04:36:26 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfGI-0000000HCLm-2h36
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:06:08 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso6727445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097965; x=1742702765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFS019JG0RFjz5io9ra87jX+S2pDR+I2Zduhbgoaa20=;
        b=FAx9zTK52Y/63/B4jkg8hZrn2dXcNVUeR345KM4a7eF8R1dUhTyUYwhy5dOvtruVj3
         ywaBJiCsscLyU0j5gT1ru/B6K8n9l6LEcdXKi6tiSCsVqKfvR7tPNn3Jk9cegwduWsdk
         j9OqSSxrVXMmN0psDZ+GvP+fPYtGbZWYVPyf+40kWhCwhy3hZstkp1ZKCtme+ll9quFx
         eQ+qc49EEZSW0jcQ13nVoZj54oRys5xcahzmTRr/DHLXey4aaRv11/aSnf89IYSsYVyR
         U6cV4ilmSFDym/A2KG0g7VqPoCtwL3136WfpROonC1S8rklwkaF4nGrUz6eRl7RvQOXz
         g5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097965; x=1742702765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFS019JG0RFjz5io9ra87jX+S2pDR+I2Zduhbgoaa20=;
        b=D4MhQMsksmDexy5J+rtdFpAPYWO0gI8p4Unmc8J76x4KnieiPEF9I2KZJxCYP18Ve/
         1RCJSZHlpoPV2yWrLGqcMBOH/ulLRouWBAknPf0qdLSpDvohbQ6dPqA9/29gmb0ILqpq
         bYMxGJUoaA/rw5tKUEJXKqJPrIu/ktu47rPqmvtRWH5g2mI28gOmFxq6nreZbY0lSZG1
         gMjaGyX8KlFcJqAMHJILmUviX8sbz8KeZ5ztxLC/kxd+zwHzooVcikpSTVPVkN3IaaVm
         K4+oB/DBxSCLlHPSOnfrb054TpNKPPMw+1co7Ii+kpoEuUHGbDU/p3lB5BoBSe5oCcCU
         XUvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKcbFoDBlbeGB58fxyRkEITbWzYTY29kvM7bTUpNr/qc63FdyGaPC+mGlxTd31o7eaKQr5t1hUAWb/ExNbboEq@lists.infradead.org
X-Gm-Message-State: AOJu0YxgR3gDMzGuROYtDi/mlaxOkSytwP5D/gxx/lr+wHq0H+edUt9M
	Af1TvyFJbLQrcJ0+tT2Nl2DX8ndv66lbxHDzopir4/OtDn6giJcB
X-Gm-Gg: ASbGncvt09SPx1De4qAi3lb0JiNC9SYroiyoV2dk4/cS69VPPlWe7xc/CLWC6kOc9FB
	U5Q+C+YqdlhlqJ0AOTAj+0d6jcDVhnpjvgu0Xjd5a/rniPTQHIMG4QtmK7bQryPK7Cm06v0v+An
	z1ifUBCVMs2WNvEejtMwwG+SjYOhJSGyMr4OJ4MaLav9V9QnM/seqzQC29WqaTIl4TiCHY4lrPX
	6TNDA8pzPstSE9GWLrotUAZYwdMQ/Noe1AjEsVNqux38XoNKHAHyYcsSTS0IS9Y0e+U2BXGMLuU
	eODwRdgs+4MqpiETTPEzF2ov87Hq5Fvbpg==
X-Google-Smtp-Source: AGHT+IHBIpDn5I6oDUPVr9V5ItvG6mUgYbh8JUY0xjPJvkMd3lQIrG6tia0tYndOnZLCB6ubQR+rjQ==
X-Received: by 2002:a05:600c:56c5:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-43d1ef4b074mr78421855e9.8.1742097965220;
        Sat, 15 Mar 2025 21:06:05 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:1::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d2010e618sm67780255e9.40.2025.03.15.21.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:06:04 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kkd@meta.com,
	kernel-team@meta.com
Subject: [PATCH bpf-next v4 17/25] rqspinlock: Add entry to Makefile, MAINTAINERS
Date: Sat, 15 Mar 2025 21:05:33 -0700
Message-ID: <20250316040541.108729-18-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1896; h=from:subject; bh=TAwmD3mE9IWzqTEdxgzO+SkBgGc9QW4lOFTMCWQX6XQ=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3dm8uyglj3VmEv2htJ2FLhnf1JsYuPf2RZsbxU w2qldUiJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3QAKCRBM4MiGSL8RytukD/ 9AxDBzDg2jelKivmQxOWC/3ddLF46czI6LpjRZJqkS8CF+Rtgtq1ntcZfd3DwB1YlWNi59wKsFGBnJ dvHyPQHl0wf8x/+YSIKnWOfRTtXXm7HO9EOcusWDuo7nYRoA6dOki8cc0dHPcr7GEZguYUvNkT0I48 RiCeb9ouXdF+9R7dZDI+htv3iB6XrR4vhmfLw+DsE6xSAwFvvJafz+GmaF+szclNho4RF6EOzxUl+s 9fggq12ESIsqk1CtgtcCSL6XBKYoZejR5xun8ldsowdPo5VU+FkBaYLjflcljs+9humS8ea8kzLQdP tBQO13yb3uzxTs0rzzQ5/m2QAPHnV4C/XBS1o7/1f/CZhhWnZfWCaezDqmj0DFHBrWFw2t2BYMKyOt pEej2vsoOJjeV8O2P9XN9/Iu3qJeRZnrOSzeuVMQefuxjD1W0fZFj6Xwgp1NI5FVcn/7XfvNSAOiu/ DO6EIdHh69dWmTxrN+gImrK3Wzp51GSrlSwfasmj7JZIFiKeByLszlkhWluDw0sXtGBsmACfkKy+sM T3FsOfpMqz/WkgyhFoHDnsNMix7+9iuhgQVHa+2cRw3AIbEwsgvPZpdR/BwhcqlQHmSCPw7fcEmu1a biNUSz51QbPHYHW/PBBsMPvZawZXKGycs82Q07EQPrq2bm8G4sFtEpjZMzyA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210606_688882_F0862DFE 
X-CRM114-Status: GOOD (  13.35  )
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

Ensure that the rqspinlock code is only built when the BPF subsystem is
compiled in. Depending on queued spinlock support, we may or may not end
up building the queued spinlock slowpath, and instead fallback to the
test-and-set implementation. Also add entries to MAINTAINERS file.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 MAINTAINERS                | 2 ++
 include/asm-generic/Kbuild | 1 +
 kernel/bpf/Makefile        | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3864d473f52f..c545cd149cd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4297,6 +4297,8 @@ F:	include/uapi/linux/filter.h
 F:	kernel/bpf/
 F:	kernel/trace/bpf_trace.c
 F:	lib/buildid.c
+F:	arch/*/include/asm/rqspinlock.h
+F:	include/asm-generic/rqspinlock.h
 F:	lib/test_bpf.c
 F:	net/bpf/
 F:	net/core/filter.c
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 1b43c3a77012..8675b7b4ad23 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -45,6 +45,7 @@ mandatory-y += pci.h
 mandatory-y += percpu.h
 mandatory-y += pgalloc.h
 mandatory-y += preempt.h
+mandatory-y += rqspinlock.h
 mandatory-y += runtime-const.h
 mandatory-y += rwonce.h
 mandatory-y += sections.h
diff --git a/kernel/bpf/Makefile b/kernel/bpf/Makefile
index 410028633621..70502f038b92 100644
--- a/kernel/bpf/Makefile
+++ b/kernel/bpf/Makefile
@@ -14,7 +14,7 @@ obj-$(CONFIG_BPF_SYSCALL) += bpf_local_storage.o bpf_task_storage.o
 obj-${CONFIG_BPF_LSM}	  += bpf_inode_storage.o
 obj-$(CONFIG_BPF_SYSCALL) += disasm.o mprog.o
 obj-$(CONFIG_BPF_JIT) += trampoline.o
-obj-$(CONFIG_BPF_SYSCALL) += btf.o memalloc.o
+obj-$(CONFIG_BPF_SYSCALL) += btf.o memalloc.o rqspinlock.o
 ifeq ($(CONFIG_MMU)$(CONFIG_64BIT),yy)
 obj-$(CONFIG_BPF_SYSCALL) += arena.o range_tree.o
 endif
-- 
2.47.1


