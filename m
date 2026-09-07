Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3676DC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 05:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLA6m2ZV0veg8WJCdKpkBRm0szwwq2AWMNzI7Yue3NA=; b=K7b91j/Nn41tu/YkYq0rfg8L+F
	WaXpXa+2sH8woNE0SPVstCGMfd4uo8FQYL3yno2wcNjtQuuZUHvc9IdMAN2+EWQFTbGkMKfchLvmd
	M1fIsk3UMUHCJHmzCK0nG9DIsp5hecLqs8XhCW0u2yCnujtDRNbZYfoeX2loi/p9h4wtl45z1SmAE
	eczKgE66u9hjLfwzAVow1lyw5bQw9SO/DOak9FoNCutDT64ruBQ6nhsJzv7hvhWw+qoS0ukDxqjDs
	/8ohGmy6+Ft4RQp44zK4J97hmPaLt1/ZuHUocfJEXabSYm4/ukqiwV4YKC9yxvqsBSlQMJQoltxOR
	ufC095Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3S8D-00000005x5E-3EoE;
	Mon, 07 Sep 2026 05:43:01 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3S89-00000005x46-3Tzd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 05:43:00 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d715f4a587so45468575ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 22:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788759777; x=1789364577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLA6m2ZV0veg8WJCdKpkBRm0szwwq2AWMNzI7Yue3NA=;
        b=mQqTLPksgCEn4vQW/LynyN8Tj5SqQp12Z72YBhINs7NLeI2kjSo4ARvJNh89RFrh/8
         92U8zp2+Q1MPUpCMAGW3Qzy2yfJ6J00yfgaV09hHTKalEegL09pMM1wNq8TCBOgMK+8N
         85c2MSAScWbgjGQnYcAX0zwFMa/I1xWPd2eX2nZzdkUa4HhHXlph1XXwov+NDAe3usRf
         jQ5FbZ2Pr/WebGMS1yxt/4+9friQd75Sc0VPRLLoXxOMvUjnlQiEs+puZTM/+pb3C72P
         PNPv5x/5D3jC22hC4QxFsjP2j+VmRycC5iPGfWmemW0TdtKJoMEk7AFNvhIxyXUyv1zF
         bcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759777; x=1789364577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLA6m2ZV0veg8WJCdKpkBRm0szwwq2AWMNzI7Yue3NA=;
        b=YGowr68ith4T6Jpj6V+TW6DMJOsT7Mm0PXfodoQPOJGBQ18WNP3kIYp+YQfzLSTXjW
         Oirwj829ANzASwjFWtXxG2Dw4ANqh1Vn0sDR+iM4LZhCZJ9XUi91djEe1nk7NgMZBAqq
         RGWsMTr62ETh5D8iKC8OeQhIS9hCMOO5miwU0+qMe5GpsUOyxs3sVz5UJ3oo7z0tHlef
         V+T15yr4h1bLei5MfOMG0HnCXLgvqirXi0Svx9XkkAZc20sgzW3j98ediHv0t0gzftk2
         eg5e36DUx+h5vRP7sVnfoMzjqB0YW3f9vFYSAr4eudRC0b+XJ/D64lGL4enJD04H8Ee1
         cHwg==
X-Forwarded-Encrypted: i=1; AKwUvByAvpiAKu/ZkIQNFmFqTerUvRLYG6Do2IMFy1MHwo7e5406sfx10MsxTf4PmKjXFObV8j9xwgJAcBtCA856zlMl@lists.infradead.org
X-Gm-Message-State: AFuF++m4RU7ptyYvvmDVY+vceeBF+vTJnSiNkXS06nbbb7Lc7ulyESYe
	SOHu9ZeKAfI0mKYa4EVyrJbbfdxY5ccP7EyWfPpL1gNc9kWXnWeAJi4=
X-Gm-Gg: AYBFou3eznpg9LEtrZcM/XhV6goTlSIkuWqIuEqSmbAic0/Jmec0EP8nx6pxxXCBt8N
	y3bgHn4RO3ADNArLu7uxtWMazGC3oQ4vsG7R2ZcqvHbs3Un4HXgMsfUJapTOiIF1gUPvGJadf9D
	tCobECrzhCJ1SDRpCcXXym/BeRZJvH4l+RjbC6BOyR2j8ryLlkv+IveGpgzYPIM0SlIUyhMvbOQ
	/k7/kz3gM9rDnipqubszziSlECTs8Chlw8XR0XvLGGCwZBsCTiBgJvPmLPlj1q1sR/ZQkqROmU3
	lMgs30OtN7+XprRGhGsa9kaJBabSLQxnEkf2DXWCd14QdOu+8VqM0KwaEXWQJJt5sLoMbftKy09
	UKBrMwakTBM9FCqN6SQlEQfvtRhyKNQQCdvLQwmhDFPU6h3U04eJ/zQmbWJ8kjwOxkFJEbBtS0y
	wV0mOlgA0hazCvXzyA+MEK+q3KOY29mzl3srq1wS0Rl1Nw27UaGDdpJg2y11+o4CbKFAc4+m5Pi
	N9SY6u6AXdgzlYJ
X-Received: by 2002:a17:903:19cc:b0:2d7:1cee:3682 with SMTP id d9443c01a7336-2db125cd39dmr342177905ad.5.1788759777012;
        Sun, 06 Sep 2026 22:42:57 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1483dbddsm39107695ad.12.2026.09.06.22.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:42:56 -0700 (PDT)
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
Subject: [PATCH bpf v2 2/2] selftests/bpf: cover the exception callback using its own BPF stack
Date: Mon,  7 Sep 2026 14:42:35 +0900
Message-ID: <20260907054235.473103-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907054235.473103-1-donggeunyoo.kernel@gmail.com>
References: <20260907054235.473103-1-donggeunyoo.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_224259_510286_BB995F5E 
X-CRM114-Status: GOOD (  13.36  )
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
index c8d716fbd419..2b01b45cef06 100644
--- a/tools/testing/selftests/bpf/progs/exceptions.c
+++ b/tools/testing/selftests/bpf/progs/exceptions.c
@@ -212,6 +212,35 @@ int exception_throw_subprog(struct __sk_buff *ctx)
 	return 0;
 }
 
+u64 exception_cb_stack_src = 0x1234;
+
+/* The address handed to the helper has to be this callback's own stack
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


