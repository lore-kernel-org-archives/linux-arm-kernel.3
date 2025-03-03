Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F515C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 06:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mRORuk1lZoTaQ72m0hDUrhIZjvt/8jV8y2hi7nR1rH4=; b=04FtS1d7Oe1WVNh4ReqwZs3hxM
	ZMADpVjzmhHSv0775R0kUldJZPtn8VtYsuMu0ltuDvhLuJRzTVyt4R/OwH8Kabw1IZbReZ4ZMxPLo
	RXbVWZk4WRqmnmXcmrghfV1mjGiBTc/XGn5JnVGDtnPuC8mGvSzsxpChqsT5ZY842kiyRMnuh2WlC
	P8m2Cz9eN4YVf1yce84kZNcwx9QWbN0J4I+TJxqT/dIwNnGNnpAy6XbAFhZSE5VIerbryF26P/xd0
	Y8+uU+pgzsWXb+6Ee6ggVm1vY4fJQTB+BHwhmj2FDGYEgnABL0Liqxv9zSiJPzO+aRWucOO9yypfu
	ftoum8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tozjr-0000000HMo7-2jPv;
	Mon, 03 Mar 2025 06:57:19 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toziJ-0000000HMU2-0Utp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 06:55:44 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-2fea47bcb51so8112467a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 22:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740984942; x=1741589742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mRORuk1lZoTaQ72m0hDUrhIZjvt/8jV8y2hi7nR1rH4=;
        b=j3FPoFu4j5kLNIBgm3yW55lRREtgztnIOcu3EFlK52OHXHCIZXxGEHjJcfOSaB6i9z
         zcpjRlXGl9kRqrXThesgIspR7fpoRNzbqkLby8qFeZn/xuwQ0GY2gxdlHS4uIY6HflJj
         f9ZLzsDz0s5Qs3MqkZDP1x1oG263a91gipcVOw+zKLkTabn87BLLIFF4NF8RTLcjnCH8
         /5gfFR2SGW8OOsVmWl8hP4QO+zdyTZ1bFq+zX6Kf+hILmK3Izvo7Zs127vTF0L5ehYAg
         oW6rYqxvDNQKHdYIMAquwoYlXVMtiqdXcflfaL9YufLjGn5uv3owRmzE1+eXQPset3t0
         ttXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740984942; x=1741589742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRORuk1lZoTaQ72m0hDUrhIZjvt/8jV8y2hi7nR1rH4=;
        b=P7Ym/bxZBd1N1s3m/uvVAKVXkgNT5OGBWIqjqd32TvTn8fzFPUz6Tjv/D87A6KFnNb
         gGDnXmXx+nOXgB/ICGe23Rz94j5+WTKRdo3Ec1YJPqwOdDT3YreMCCS3yuf60lqhkOsv
         uROeSffDTh+32qKWi8bBHVJp+xiSaAv3JDnryAPjhgTtl/lgodPE5J12oDHAEqB9DMSs
         6ttZjoZdmWAHwOm7FQx35VUtBxEp0F1hJj+YGmioFDLbIH0yceN+5eE/zcaMA7H6BR7S
         Qv2B1Vet5ATaD7Y3eB/AtpEk6yP/31YXI7Vn05EnaA130BKA0NKAe0oo5Zw301Gt9/ad
         cSyw==
X-Forwarded-Encrypted: i=1; AJvYcCVYH+LVoHTQOQS9aKVO9HvVRYad4lVx3jhJX+FGYXlPvWZEN1VGtgY4bic2RUYWgITn2OYFJ5A6z1/Dso2iSX/V@lists.infradead.org
X-Gm-Message-State: AOJu0YybSTUDSCwVaxqYKqZddAynIHJlTrXadXzEmWs+3qbUgITNeRGJ
	h7flLmDnucrtb+GvFg+mWAeB2bN1IS63h/ApOIn0Dx/Pkl9PYBa3
X-Gm-Gg: ASbGncsqEEJ/ROVLZLvFqTkoCRIqR8lDJGkke0q/ksP1M3mwraw73A7KoX0bsTs5oDd
	HSeqDJ5B6NvW/rhnjz+cRPj6aVd3+doSlFze1bG840biob89hTdzlCpfX5shGDBK1gqzR6FSCCQ
	rgGJ5U6A9/bOLuFKnF2M8pv2enZV8Tdu3VgknYeYCAlYknkAvuPbHbEoZ4GXp2jY2eui1NftS6q
	R1dnPmrTgp8ZVW/8gF39dA5iIR3XWfGJAUiCYc9L3Bn+av/1Cfd7Jb3x3fTt4IOBUNakWlVq/DI
	UEcDZEi2M5vpvigeO7c34EIUbnsGTbiFoYc5F35yGhvabtEIcWcAftPQ069hSg==
X-Google-Smtp-Source: AGHT+IHkrQ6QYFMj0geZ0tfgbyR4QorZaQfQ/7JtrPSfKkhKbt8kMcBnshigR2/4fvzZe6e2RxKkcw==
X-Received: by 2002:a17:90b:3ec9:b0:2fa:17dd:6afa with SMTP id 98e67ed59e1d1-2febab78721mr21988807a91.17.1740984941579;
        Sun, 02 Mar 2025 22:55:41 -0800 (PST)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6769ad2sm8139575a91.11.2025.03.02.22.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 22:55:41 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: peterz@infradead.org,
	rostedt@goodmis.org,
	mark.rutland@arm.com,
	alexei.starovoitov@gmail.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mhiramat@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	jolsa@kernel.org,
	davem@davemloft.net,
	dsahern@kernel.org,
	mathieu.desnoyers@efficios.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	samitolvanen@google.com,
	kees@kernel.org,
	dongml2@chinatelecom.cn,
	akpm@linux-foundation.org,
	riel@surriel.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next v3 0/4] per-function storage support
Date: Mon,  3 Mar 2025 14:53:41 +0800
Message-Id: <20250303065345.229298-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_225543_164006_78AFFA0C 
X-CRM114-Status: GOOD (  17.69  )
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

For now, there isn't a way to set and get per-function metadata with
a low overhead, which is not convenient for some situations. Take
BPF trampoline for example, we need to create a trampoline for each
kernel function, as we have to store some information of the function
to the trampoline, such as BPF progs, function arg count, etc. The
performance overhead and memory consumption can be higher to create
these trampolines. With the supporting of per-function metadata storage,
we can store these information to the metadata, and create a global BPF
trampoline for all the kernel functions. In the global trampoline, we
get the information that we need from the function metadata through the
ip (function address) with almost no overhead.

Another beneficiary can be ftrace. For now, all the kernel functions that
are enabled by dynamic ftrace will be added to a filter hash if there are
more than one callbacks. And hash lookup will happen when the traced
functions are called, which has an impact on the performance, see
__ftrace_ops_list_func() -> ftrace_ops_test(). With the per-function
metadata supporting, we can store the information that if the callback is
enabled on the kernel function to the metadata.

In the 1st patch, we factor out FINEIBT_INSN_OFFSET and CFI_INSN_OFFSET to
make fineibt works on the kernel function is 32-bytes aligned.

In the 2nd patch, we implement the per-function metadata storage by
storing the index of the metadata to the function padding space.

In the 3rd and 4th patch, we implement the per-function metadata storage
for x86 and arm64. And in the feature, we can support more arch.

Changes since V2:
- split the patch into a series.
- considering the effect to cfi and fineibt and introduce the 1st patch.

Changes since V1:
- add supporting for arm64
- split out arch relevant code
- refactor the commit log

Menglong Dong (4):
  x86/ibt: factor out cfi and fineibt offset
  add per-function metadata storage support
  x86: implement per-function metadata storage for x86
  arm64: implement per-function metadata storage for arm64

 arch/arm64/Kconfig              |  15 ++
 arch/arm64/Makefile             |  23 ++-
 arch/arm64/include/asm/ftrace.h |  34 +++++
 arch/arm64/kernel/ftrace.c      |  13 +-
 arch/x86/Kconfig                |  16 +++
 arch/x86/include/asm/cfi.h      |  12 +-
 arch/x86/include/asm/ftrace.h   |  54 ++++++++
 arch/x86/kernel/alternative.c   |  27 +++-
 arch/x86/net/bpf_jit_comp.c     |  22 +--
 include/linux/kfunc_md.h        |  25 ++++
 kernel/Makefile                 |   1 +
 kernel/trace/Makefile           |   1 +
 kernel/trace/kfunc_md.c         | 239 ++++++++++++++++++++++++++++++++
 13 files changed, 456 insertions(+), 26 deletions(-)
 create mode 100644 include/linux/kfunc_md.h
 create mode 100644 kernel/trace/kfunc_md.c

-- 
2.39.5


