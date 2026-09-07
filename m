Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CFEC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnZZQEjTT3ispo9t2Rp3ilMwMqDfcn5R3yYWSok4gBU=; b=0oOYNimU0L6NtI8cNlOnrD4SxG
	zca2vy5w1LY9jnSDQRf8Pfs41zsSn6+V0HfLojRBiuplqmP2AjQiAMkr23TkOI15Zk+pDg0pJ4hzS
	X5BEltrojCl048qG8btln7svskZ5C88dtuhdNkmjxEuuLaQK0TOIScji7A0smtWtDfwSgPO+SAI2e
	tYs1lgpfpNEvO+u1zugqOTnPIkReOHK88FfdJ+UMFOokHhkPLDBB9uZDceZccMS8wSjjWkYikKjxk
	fFXK05xFjWbYSAkho9Lg7zXz+dh7DgwGFMFukBr7XVe3Z9TfO8ypYdsOQsxv3KmyNxASClqDI2T2A
	vCSbxbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Z3i-00000006tfE-2Cfi;
	Mon, 07 Sep 2026 13:06:50 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Z3g-00000006tdr-1LVb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:06:49 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-382ef647e20so3517824a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786407; x=1789391207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YnZZQEjTT3ispo9t2Rp3ilMwMqDfcn5R3yYWSok4gBU=;
        b=m1iw4UoFo9Y/Unc56h4ULpm2PLoIWSHzvzAIfNEIu98KH4nHcTsWjPNPH1H3OJWlH5
         fKb+7GsUUrGxlVKbYt9VtjT0oVKR/2zifv394g9ydjuXaV7fZQS1emBXXmMUTzfQa5uS
         rGqwzEVnOhaZ0useJL+qWkFsac5xZzSATuI5DeEWvgL6mr2oPDeZ0KAHeuNoqR+/FYN1
         5h45eCAoHn1QBs1keRNDpFK6O6DNHbvjbwjS420yfnYuYSLp5CPjvUoWwKeNV9BRrGgS
         0v1QUJQhae1wzPJzaJE2GOF8hpbamBkJdF6YtkQsbwp5830HTTcxwL8UUHwow6UxOsEF
         ffvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786407; x=1789391207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YnZZQEjTT3ispo9t2Rp3ilMwMqDfcn5R3yYWSok4gBU=;
        b=RgUFU9AtQ9cEVTQ5nD65efmC1Q9EaNPAo+4hz+O0BOdkK1xNDrgsA0SgBlbO7Ufzgb
         MWcytBY45jytEuV2bfaCpZ3nPTMtitP+vUCOdt0cnnJH3RRz9qcHb+y6t3K+nAnjrAAe
         ZgwoHRm525666nYGGi0Kcybc9pCwnByzAOej0MIQN9TVw238YJkgziIHDFKUM+KVKlTy
         ZdxnJ7r13pwI35y1fCs1U+prNedHqXMowim9Llqu4d7iidOsy1MuuyeWKYwAEOpNlp6p
         W4/Klu6ehRqDkAM2W/ZTKFHtuDgOrGkiQ9cgKhbmMO2GNsosWKrjgEitgVcXM14Z59lL
         oJtA==
X-Forwarded-Encrypted: i=1; AKwUvBwQUgwNnnCGtkfXKosZetCqPLob/WOdH1VeDPiy7K2EgxC4hNP3vpmuV+JlaNPQ02CwofW9i0iRuv7saKgFrAV5@lists.infradead.org
X-Gm-Message-State: AFuF++mjmWQMKand5Ittq1oX33EqOv5PLQNjfPbD5J3DVN8MynkLCp97
	RKm2UUttpVUJTbAVHrTbzPrJSm1WkXFDe6YFUzyOsH1HbpVoliD4XKI=
X-Gm-Gg: AYBFou0pwziZf78qgmS7xahXszKCyOf0tXNOwT4zXNgXYdxkpTAXS45jyPx0ObNTgN1
	GOHRJWFjAFNBCGenXQs3Pe7UmRu2KEbtSJrWhYa8i87bxNK4Cjn0DpwWgt0Hou7guoTDHvncuXI
	p3oB/pdPT0oPKSpqaIt9WERdEtbHZOFmhFayTnXg1ZcjDnJ56s8jajNS5Iw5FQ1Fk6RrQ0Y9KMv
	TRqUd3HE0jsk0Sq2qr76Z1OCqOOeAighO9NbO+kGVAV7aPM+/CKZxLZ7CP0GUstFMAOG2G0l05F
	g7buuISxupttwp1OCd5VeihANSo4Rr7p+w6R7nYu7z4o39jj+rpQ8KSAsVcece9yB0LM0Xs05qE
	ayqZtbYEseJjlIftFS+WpqQddRGC9fo0MzgbkiDk19Rf4A/6MIeLlUGBzIcZa22xeYYKSiE7t1a
	yUeh8TiSJlP7B02uoapztXvwXSo0ub+IcT1Lsz88Vqn7B92tpK+Sf9aplfv0nB1eIbWhmzwWkw2
	s0NEI50fONsgi5R
X-Received: by 2002:a17:90b:3809:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-39b261014e2mr32056634a91.7.1788786407241;
        Mon, 07 Sep 2026 06:06:47 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07b197a9sm26742398a91.0.2026.09.07.06.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:06:46 -0700 (PDT)
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
	donggeunyoo.kernel@gmail.com
Subject: [PATCH bpf v3 2/2] selftests/bpf: cover the exception callback using its own BPF stack
Date: Mon,  7 Sep 2026 22:06:24 +0900
Message-ID: <20260907130624.611942-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
References: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_060648_363975_E2CA270E 
X-CRM114-Status: GOOD (  13.67  )
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
 .../testing/selftests/bpf/progs/exceptions.c  | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)

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
index c8d716fbd419..91c81971e58c 100644
--- a/tools/testing/selftests/bpf/progs/exceptions.c
+++ b/tools/testing/selftests/bpf/progs/exceptions.c
@@ -212,6 +212,36 @@ int exception_throw_subprog(struct __sk_buff *ctx)
 	return 0;
 }
 
+u64 exception_cb_stack_src = 0x1234;
+
+/*
+ * The address handed to the helper has to be this callback's own stack
+ * slot, not one from a frame that is already gone.
+ */
+__noinline int exception_cb_stack(u64 cookie)
+{
+	volatile u64 val = 0xdead;
+
+	bpf_probe_read_kernel((void *)&val, sizeof(val), &exception_cb_stack_src);
+	return val;
+}
+
+/* Throws from a subprogram that has a stack of its own. */
+__noinline static int throwing_subprog_stack(struct __sk_buff *ctx)
+{
+	volatile u64 pad[4] = {};
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


