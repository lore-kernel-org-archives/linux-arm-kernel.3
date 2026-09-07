Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F39AC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 05:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tAu5fxgyZ26sDg3uDkdewTDvba5N+Y2xWOAnHoqr7Vc=; b=T5fJ+oLywI22J0s5R8dCW4HeMN
	UEAgSZTBGvVtwSMx6GrWPs0KxLBl6aqshhSn41X4Y0gk9n7a4ZJoX5beF6VXUkC8UKnsPHFmHDHln
	/7bNLNG7+uOw6ddQeKZUcZuwGsWHx7Agi0Vscik7KPy5nUa2NRJUdqsLT4f30UK+sPy8cGPBURzwK
	n9UjVHsnh47rBnF1fj0oL9r0DjDZ31ucwNdA8QMDTfkc8A6MfWZ/l5xtD9E1Da4BTFTH3Tcp86WYM
	usEkfHQZmRGNsGfukvx4V9v46dw5VuOW/h2Cj5D/N+B73RT7la8IZYIcB44DnblJ+1LZgcT0EwhlF
	VCwo42mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3S83-00000005x1i-2POD;
	Mon, 07 Sep 2026 05:42:51 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3S7z-00000005x0e-2c9O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 05:42:49 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d53197d8b5so27221045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 22:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788759764; x=1789364564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAu5fxgyZ26sDg3uDkdewTDvba5N+Y2xWOAnHoqr7Vc=;
        b=j6AjHJsqWZ2PG6kVLatAYgZt+P7DwTXdiHLAkh0/c+sLGNKDbxKtAC0fsE25KfuLbl
         TD18k2D2jzqCsqQ0Gep0gT7bf+/aS87IVMsrTW7l4/O3pClgvq1DJxATT5aKjh1WE9A9
         RJ68CqDmruFqG4+qwYEDwBMu8mrLGD6lR95JnT2MKwGHOMbL0b8zj9xGZK63xAt0mZCX
         Wf81PeOiBq52X89CvJdygJpEcqFQ+a+XIwxEsbjUJ+4fF59UIw8qUsixgsCGrtgGm8u4
         oGgAjyX5C/ToqRnmGquVBPUSpWK7fTmCTGkQNM+vv8s+LaQZlfzgl226gzaEAAwpzGLK
         vClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759764; x=1789364564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAu5fxgyZ26sDg3uDkdewTDvba5N+Y2xWOAnHoqr7Vc=;
        b=GPDXGfHdXiMRRqwVOd3LkrhZlHHW65rzeQTIj+Y7TWnIyQrrnOqZLktq8CtUTPASby
         rl/zhV9gW3wU17puT735JD50+cxt1Ujw21X7tyFMXbAlTT/UvqzNhGQHNwOJcr9LddJG
         NYxyXJld7xr/fyag43Mf+rCK0wiiR9vU+vE9m083n6uJKHQSJRvAux0nj/0YLogIjFS8
         XFE8rzxssxRtLrl6Rn6EN6btu+P/rXLVfNZiRb+RBLdqo2kUIHG4c1xQs1RFpmEfqYrS
         NPzcl+L7C48XPeULaYInF8JJSDdHTGs+2fKfzUUva/EiLyQdlcGDqigdqq3fZZ4wpDcr
         fLFg==
X-Forwarded-Encrypted: i=1; AKwUvBxHU2Ov5ZQpJSPfyQEuphq75hd+5M+x/qhh1bOnZ8JDJgLRtcLQRp0DhW9FTGYszamvmwbhAxRrjhFeStdZoI7u@lists.infradead.org
X-Gm-Message-State: AFuF++m4eUu1tUXHVRUyQohGnhu8OnU6XijWYo2joP3iWeCtUqDWseyC
	lBY9EUvmIWvnJ28iCbd4db4qo3C5LbCtUf9n637tCK/SOj7KuHEGNec=
X-Gm-Gg: AYBFou27oSs47/i0M06SI6fKHfMC/Lw/bOJ98UD970ZyYN30/PKTdBJD9oCBNOYt1F4
	kmexUamId0p7Od1wMikPO1otkhWc4ijByG+Ab0v7xIF8icvSZD1QVkYHYrbOZIUhCcwF6quDacS
	aZ23LvngDMf4bKjm3KU73mI8l6aZCpD6Dp2JGaHuteGpzupx/RaAph+LEueQgPzt4b2h1BB20iE
	SHt0e4PvM16BY/pd2JiWwN891ikfApR4UaKkILKvzmYUpsA95uH3Q1n9nXJJqLxVpEMcjPGFace
	pgzYDI1jR0Bj8ShiogvbM7Y+EaiLTRjkF+HESssnCV+2GzuxbRMqBNP/x+m69Dy6FSOfSP56aYn
	Q3QRtL7uazZKqbkKSiwkHH9l+peZHKHMNRVXxU/8HiHZBIIK5pbiXYytFnAfpqEapK25BEK6O2o
	xHfPilALu1talERb/52lduZ2NkCLcPDDJeqZfsC91XVZBcnb2+oS/ziiTZ58QPinlxA/gs1q/hG
	cW9oDofWv5qKR8d
X-Received: by 2002:a17:903:1a8c:b0:2d8:d4d1:313d with SMTP id d9443c01a7336-2db1267bc0emr293026495ad.20.1788759764353;
        Sun, 06 Sep 2026 22:42:44 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1483dbddsm39107695ad.12.2026.09.06.22.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:42:43 -0700 (PDT)
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
Subject: [PATCH bpf v2 0/2] bpf, arm64: fix the exception callback's frame pointer
Date: Mon,  7 Sep 2026 14:42:33 +0900
Message-ID: <20260907054235.473103-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_224247_691840_DCC2E8BB 
X-CRM114-Status: GOOD (  13.22  )
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
 .../testing/selftests/bpf/progs/exceptions.c  | 29 +++++++++++++++++++
 3 files changed, 32 insertions(+)


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.53.0


