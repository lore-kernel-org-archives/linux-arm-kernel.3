Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EC0C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=riOSU4dH10zq3tO5Dx537AG40XCcFzKoLCwwWkJ2TP8=; b=t5OeXTY5LX+yYiV07CrMh2PDXK
	J6IhJIbOlvL+p0InY+QEaYTuupqKEqUEFJpx8ke8gzxpepre4XA4tBIRIfQHIQoJQ2VNY21bVG/ZJ
	N+MyK28yVbBcsPSRLM79Qxg9s4hjPzVYuTaLXqLeOFNzZbfEuV9Q4cktISydzXGuc6IXkPifpSppX
	yZIaCiwYhg7m3s0H65W5N1VIcsacRZmOGcABkKyJ7YtiJMWWboK2m3ZOEWM0uWh9eY9A+hyW71Swa
	/Ed3MpSF+nuvPUSVR2Gg+90bTliP0bOjhIEbV5L/5fhlD3N3fNLPZ7v0zvd+gGgYxtBACHKUOojc8
	ekWKBVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Z3V-00000006taI-1OtR;
	Mon, 07 Sep 2026 13:06:37 +0000
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Z3T-00000006tZe-0Vgy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:06:36 +0000
Received: by mail-pj2-x05.google.com with SMTP id d9443c01a7336-2d6f230d1easo783555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786394; x=1789391194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=riOSU4dH10zq3tO5Dx537AG40XCcFzKoLCwwWkJ2TP8=;
        b=ip/GQ8UaeuzLtsyBhGriiurX89xXfLGU714Sqh2FxaGSqMoR0YwIOfBYR0qCYfWYbW
         zEnyfUpusW26WKzE6rSut34785T/Sp1Abj4DVEcIvmKxOwp9q5J+mSUA5BhPfr4BO6uZ
         8DgWh65nEXAXUig6nik6CKkdCa1Vb+B51uMWfIkqnn35mJ7/9YBrfIHohiCzTIQ3zywi
         7ZUIzmbLxZHyhmiiGRlE6boRIg5ELEDXgczEup5/WDx78Ati5X1NtOHf0G2BBlIBoZa+
         FLKeJqK4RWG9PKaY6EzHsPHw6ZQLZF/9kGHkEQUYDM6/XK4akyW4l2uOKq0Tkp+GkKJO
         fTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786394; x=1789391194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riOSU4dH10zq3tO5Dx537AG40XCcFzKoLCwwWkJ2TP8=;
        b=kK5F4/n1dZ9pksWr2q8S6Wmt+MQqda/y0zYbLmg2/v9YCK1oG3PdAo+S12JxnX+Z4E
         dMEu8XRKEVhvVR5wI20CzkND2RipSNHTLyPwJFV+fROq7sbQBl2YGriXXlOWYL9K07i3
         Z5tVDLLfCzrecMY74X2EjPTYFW1ZdqQMuQtOLB6v/Gyuc1+k+TCboeLVm+62rK4cYOnI
         XFWuzGPvOjzaOZoCxq23K2Pgh7Uad+qN1QESS3A1QaX9JMzGasY8zlfupHh3UiW49tdr
         mOS9WXHOioKarCxW/nsM8VnFZxnO4u1A/xRpHYkpdeaJiNawKEw/D3zfUE3o2voFeucZ
         GpKA==
X-Forwarded-Encrypted: i=1; AKwUvBzjkqr6+09/1ratZ7ddjFZ9mtSrIjFyIJl/gMin2ZYZ3N/cClW5mn0PGgX1scmVU2NYwoLEBoyw3zE5vwwFYCzl@lists.infradead.org
X-Gm-Message-State: AFuF++k1qv+J7Y0ihr3OWf42GWSA+QPZiybRZrk7+muS0d5+QCK9kR0+
	j2HAgXn9vobBYyUZj9lxm5phJ7gshH+xK9V3gaP+wjq9WZbgFcqPeUI=
X-Gm-Gg: AYBFou2pPIbxj+QgBqYrqjlbUjMYJY20y8fC5MiPScl5KfkqCBNl+VujPdyaJKwiAsz
	PPg3mxZXa73ms/TdVTPHYZZ+Eb83k9y4paaAHZYsvLauXnEwvfMpZqFwGDZZyw9uGEbdB0ikfQO
	Id7mQQoasFBpYlxupUl8B/r08M/qK3pCkUyaGE+Upyb1i32bDQoWK0gCXMhfqlQR8P87/V8mbg+
	177UtNEmUWxFog6XeQuWFuHCpY0biNflvQTdguKkYWiGjoR0Z40Gs70gQElJmL3+rdE94uDSd1l
	mHX7b3HziN62pZHzTWp7jvU2N0CZVfMDGvkd1RuEHM/2TX2XzVzqZQMRbmrKS4vir57QGu3ZDsg
	E33FjyJgKF5XxiYtTNaiQq8XQ/K/vVHuZuswWULoF4PFYsn9SiWPAHDdr7mXYzf8rUUTT3L9pu8
	OEs2s+jT91fuoai56dbqfV+e9Zjo/vpZbGQqsFr8kWwsObRGGJopvZ1TKLXrxv21ibMNunzYBSp
	sK639SzgnFJbGETvwxVZnYZdEc=
X-Received: by 2002:a17:90b:4b83:b0:398:9bd3:d6d2 with SMTP id 98e67ed59e1d1-39b8bec8c1fmr661379a91.12.1788786394289;
        Mon, 07 Sep 2026 06:06:34 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07b197a9sm26742398a91.0.2026.09.07.06.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:06:33 -0700 (PDT)
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
Subject: [PATCH bpf v3 0/2] bpf, arm64: fix the exception callback's frame pointer
Date: Mon,  7 Sep 2026 22:06:22 +0900
Message-ID: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_060635_160848_C8F03D6B 
X-CRM114-Status: GOOD (  13.75  )
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

The arm64 JIT does not set BPF_REG_FP in the prologue of an exception
callback, so the callback runs with whatever x25 held when bpf_throw()
was called. A callback that materializes the register, for instance to
pass the address of a local variable to a helper, then works on the
frame of the subprogram that threw.

Patch 1 sets ctx->fp_used on that path, the same fix commit b114fcee766d
("bpf, arm64: Fix fp initialization for exception boundary") made for
the exception boundary. Patch 2 adds a selftest that reaches the case.

Tested on aarch64 under QEMU with vmtest.sh, on the base below. Without
patch 1 the new test panics the kernel, because the address handed to
the helper lands on the helper's own saved return address:

  pc : 0x1234
  lr : 0x1234
  Call trace:
   0x1234 (P)
   bpf_test_run+0x188/0x3e0
   bpf_prog_test_run_skb+0x47c/0x998
   __sys_bpf+0xbdc/0xdd8
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

0x1234 is the value the callback reads, so the helper wrote it over its
own return address. With patch 1 applied the whole group passes:

  #117/11  exceptions/exception_throw_subprog_stack_cb:OK
  #117     exceptions:OK
  Summary: 1/118 PASSED, 0 SKIPPED, 0/0 FAILED

Not tested on other architectures.

v1: https://lore.kernel.org/bpf/20260904070210.4163193-1-donggeunyoo.kernel@gmail.com/
v2: https://lore.kernel.org/bpf/20260907054235.473103-1-donggeunyoo.kernel@gmail.com/

v2 -> v3:
 - patch 2: use the standard multi-line comment style
 - patch 1: no change, added the Acked-by

Nothing compiled changed, so the numbers above are still v2's.

v1 -> v2:
 - rebase onto bpf/master; CI could not apply v1
 - spell the three new declarations u64 rather than __u64, to match the
   rest of progs/exceptions.c
 - no change to patch 1

Donggeun Yoo (2):
  bpf, arm64: set up the frame pointer for the exception callback
  selftests/bpf: cover the exception callback using its own BPF stack

 arch/arm64/net/bpf_jit_comp.c                 |  2 ++
 .../selftests/bpf/prog_tests/exceptions.c     |  1 +
 .../testing/selftests/bpf/progs/exceptions.c  | 30 +++++++++++++++++++
 3 files changed, 33 insertions(+)


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.53.0


