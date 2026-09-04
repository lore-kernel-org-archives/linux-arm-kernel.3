Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000FCC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 07:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6cTYhMb2zRw6Y8e+XQksOjoym37tvoa/7IkI38NMAM=; b=q9Hn0w145GWh6kYcYkh3xu8MAJ
	X3eEPh7aJJaIG0JyIfMxAb1BB9XgyZAa0vM/bAvQHXB4+aqSdX5Wz1aWBfx9lOkCrBnzyEhsUfFeZ
	vHzFVwGrZXFDomMPu07T+dhh2SQ6Yu0gSqkFQl0buT46ZwIlj5zR3d3w8rkQKkqR5PnO3Nr3AoTNX
	ME+0hzugC6kc8uKLxHAkIUqStwMBRKxn63ztr1zNZ/v2Mh+GtZzaIz1azu5Q1wqWof67gXFc3kAAH
	pLWzJ3awLROd7preWRwJWhRmWbIJUsnYmInVt8EtBkUayrb+Y7lXFJMQ8nHFllCeWY07SgE9XbJf5
	iPabStkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Nwi-00000001Den-1eCi;
	Fri, 04 Sep 2026 07:02:44 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Nwg-00000001DeJ-46P7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 07:02:44 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso603222b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 00:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788505362; x=1789110162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q6cTYhMb2zRw6Y8e+XQksOjoym37tvoa/7IkI38NMAM=;
        b=IgK28zrYuJ1uaCNvCor9NwQHNZ7ShG4YsRC+kcKLMWA0QCfBGtkgbiXJ1zFGOQpeFd
         +oDH/Dk5qu9hXU24n7GaK5pocuvn29PlgoLZPDXbtr8F0ep2mBlthNH/oaXrLV7Ni0Ya
         5oM8i0LEFmhrOxjkfXLJmdUtxFt9p099R3hcPON5xPyWc2lPdXKOrYBHSUYEDviQQqBd
         Tw5jJtGe5+BB7tiEWvfQ6EEqYxu6AgXW2hX6/gUBoiuICnUKTD2ZHvUVDoGZteOsNmQZ
         aA0Xd7kf9f60fYJXnggCkfe2Egrm9dY4dWdyaMvppDR9x8jnT0SrcNAenRSwAJHzWT18
         UY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788505362; x=1789110162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q6cTYhMb2zRw6Y8e+XQksOjoym37tvoa/7IkI38NMAM=;
        b=No578LGUURwWmyuvtmUcMwTxwqsxOoN+2oTrwaUc+U/wFZkjb5ElTgUkfqA+QZnmoH
         HIhO5wpg/8Gj3Z1AxMhaenm9teLEycxPo9JJOHsTDtVhr5dqgZGpswtWMf/H599i/xvM
         RV0JNairEBooDn+wHKCf6WhEbUBIyyXyNhdMgfkF5fhPCkbhiqE+ZtMVYE3wic9VjSb1
         RPSbCM37EQOlPYDjIwEAro9cDAq9yPJr0XJ/MyvaAu66ac/JrFoerr2DQq7VqMjm753B
         eoRKOm/C1MYsGDeD62uBBgu/4pKvojuS8Qq9bqgsFQLOWPT23J93cLa4yefmJU1iIsxX
         z84g==
X-Forwarded-Encrypted: i=1; AKwUvByfoiGwg9SNcvyaS2U7Lk3+iln9hZXSL2lcrNdd6rLBgXMVh5UGz5Am6oYMIBbe26oso6plz/KHNPPimZa4qR1D@lists.infradead.org
X-Gm-Message-State: AFuF++mXOghSMBnASJFele/ba4kw4Lo2Si40BKEVfj9I7pLa94faxe+U
	CTV+w0F6gWwwLt5o4CaWEQ1x58asSaA15XbcKu+Cl2FDl3DJ362C/XQ=
X-Gm-Gg: AYBFou1HkGS3ebfQMqX1/aPlFhhQa3TZ0qBvKHNy9FPyOh9Nv2Go/KFC1kpvuNp6iCP
	Z92wZTdMcrGYJV8qPTqCKCsScRYFT6CGdz6juAcUddecD/3szGwF12tBRNQSIj75e1akBa41gZb
	TMsphjzXs5tFxRzsguTlfHUDN5UutLJUsrED27+e95rCkfPUcu53oNO3HqsGjHCsSEh/E1YBfhO
	cOsXIC4tSrdYbEz42XRa5z2jPC15GeWghInfRHUsv/AgyBTDK6zCGIHTE0hM/YjGEafn/eQlEcu
	J6ENbvbnqtC0291KPvjgx9FFi9arkURKKw4pivnRfT7lyR7OrkMGzMhA3dCEOPVlGeKKOYwCSOD
	TxXVtktAnYraokLF1q1Ml5ZFPMBjbYbL8++smOBTYK4x/6ajf4oUssnEnu4vQgzJ3LBG+vws0Ky
	EZbUjbCwxpwS01E3AEsw/VhV8dREKTumeaYN6CHlrV/EIQZ40gpBLbsqooTHu/AO4phfQITr8nE
	dsXSpjAaKCFNA==
X-Received: by 2002:a05:6a00:3d51:b0:857:72f8:dca7 with SMTP id d2e1a72fcca58-8619c8845f8mr2621172b3a.13.1788505362292;
        Fri, 04 Sep 2026 00:02:42 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615273e3a0sm755511b3a.23.2026.09.04.00.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:02:41 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Yonghong Song <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xu Kuohai <xukuohai@huawei.com>,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [PATCH bpf 2/2] selftests/bpf: cover the exception callback using its own BPF stack
Date: Fri,  4 Sep 2026 16:02:10 +0900
Message-ID: <20260904070210.4163193-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904070210.4163193-1-donggeunyoo.kernel@gmail.com>
References: <20260904070210.4163193-1-donggeunyoo.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_000243_022687_4EDBF048 
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

The existing exception tests do not reach a callback that materializes
BPF_REG_FP into a register. They either throw from the main program,
where BPF_REG_FP already holds the value the callback needs, or use a
callback whose only stack accesses are frame pointer relative, which the
arm64 JIT rewrites to be stack pointer relative.

Add a test that throws from a subprogram using its own BPF stack, with a
callback that hands the address of a local variable to
bpf_probe_read_kernel(). The helper and the callback have to name the
same slot for the value read back to be the one the helper stored.

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 .../selftests/bpf/prog_tests/exceptions.c     |  1 +
 .../testing/selftests/bpf/progs/exceptions.c  | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/exceptions.c b/tools/testing/selftests/bpf/prog_tests/exceptions.c
index 3588d6f97fd4..639866ce09a9 100644
--- a/tools/testing/selftests/bpf/prog_tests/exceptions.c
+++ b/tools/testing/selftests/bpf/prog_tests/exceptions.c
@@ -55,6 +55,7 @@ static void test_exceptions_success(void)
 	RUN_SUCCESS(exception_ext, 0);
 	RUN_SUCCESS(exception_ext_mod_cb_runtime, 35);
 	RUN_SUCCESS(exception_throw_subprog, 1);
+	RUN_SUCCESS(exception_throw_subprog_stack_cb, 0x1234);
 	RUN_SUCCESS(exception_assert_nz_gfunc, 1);
 	RUN_SUCCESS(exception_assert_zero_gfunc, 1);
 	RUN_SUCCESS(exception_assert_neg_gfunc, 1);
diff --git a/tools/testing/selftests/bpf/progs/exceptions.c b/tools/testing/selftests/bpf/progs/exceptions.c
index c8d716fbd419..cac4e082139a 100644
--- a/tools/testing/selftests/bpf/progs/exceptions.c
+++ b/tools/testing/selftests/bpf/progs/exceptions.c
@@ -212,6 +212,35 @@ int exception_throw_subprog(struct __sk_buff *ctx)
 	return 0;
 }
 
+__u64 exception_cb_stack_src = 0x1234;
+
+/* The address handed to the helper has to be this callback's own stack
+ * slot, not one from a frame that is already gone.
+ */
+__noinline int exception_cb_stack(u64 cookie)
+{
+	volatile __u64 val = 0xdead;
+
+	bpf_probe_read_kernel((void *)&val, sizeof(val), &exception_cb_stack_src);
+	return val;
+}
+
+/* Throws from a subprogram that has a stack of its own. */
+__noinline static int throwing_subprog_stack(struct __sk_buff *ctx)
+{
+	volatile __u64 pad[4] = {};
+
+	bpf_throw(pad[0]);
+	return 0;
+}
+
+SEC("tc")
+__exception_cb(exception_cb_stack)
+int exception_throw_subprog_stack_cb(struct __sk_buff *ctx)
+{
+	return throwing_subprog_stack(ctx);
+}
+
 __noinline int assert_nz_gfunc(u64 c)
 {
 	volatile u64 cookie = c;
-- 
2.53.0


