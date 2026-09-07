Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5094C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SxQC1ayWQCOsksETTmVt8rx2S1MTrrOl76Pd3OeUuw=; b=ZzfrM+S60S1YHYlMrpYdINzsWM
	/FU5MSNlN1/OyxPbb7GvsNmBJsA7sq+k/cE/3P3D1PANWwjMbayl0pnxI45uUdQADaRWXXmDx0nt1
	F9FxXkqL/F48txRIFp7uZTBIOB+mfwotgmQIbOBY77KzMv3rv//UQ3QXnPWmRR0lkFpmJzesFkvFb
	jVgWySab167hw3jLx0L5oT0+iBTfP3bOsrBQIf8yIrqfm2mmnJ7OtYyXOXfltwsHXpnnckzfZLtQU
	Qiof14A3ZhzOGAVJ3ziur71PLtpb8RLnn9BcFNE19hOuro8iHLDYhoBFGVcG7ikpiZq2TioWzoFEs
	+HTcmbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Z3c-00000006tca-1nub;
	Mon, 07 Sep 2026 13:06:44 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Z3Z-00000006tbv-31qL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:06:42 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-39682983a0fso3787232a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786401; x=1789391201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SxQC1ayWQCOsksETTmVt8rx2S1MTrrOl76Pd3OeUuw=;
        b=og6xtFHMsI5mPL/GTz5LHNBvw4gAEVylx/J/9calUmdblUaLHRodpw9rrZlUwgD9Li
         DPEDtKs5hDaysdQHsSSci6iecG4Qy/63NVMDmy+RscifEMYf+fw1hnGQSaNwo2IvdDmB
         HDnPSp3sNASMFs9Gowj7LSUy4oPaiSthZn881HbHYnB/W3+EK/OTjYA+nrISuarA+nmi
         /32fhhsFYf1YOBIbSFIa7XLksHpnAD8Lqkl0aUxv0yLftSAaqYH3zm//tdZY4Wb4N8Z3
         KDg0lPZQ/aZL0ZOqrmp6HuZJZZ6IR5i+69NmkuaJ4UQ5/9gVS5HX9zle7B0vV00z2WVC
         DKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786401; x=1789391201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6SxQC1ayWQCOsksETTmVt8rx2S1MTrrOl76Pd3OeUuw=;
        b=M9licFXRO4l3wOFjhhWFozNl3nQ+kulcedlHlG70cRszUoH0uQ46cFKpBS1+4WziYO
         WxpRuxJG3yUVGWYHJQC6SykRdgaIHSY44kK0IWyD80VJwPWEig+vuJSCrnvEJ1DyR2Xy
         xmNJmAS+hTOAZ8nB1iSmm9AdrBUtXgPhwy/OD/VEw1vTODly3XxCiTwtx4sVofa72GS6
         /kAF7fi+sWn5a4NBzp26ar6B47crmC2Qf9mnSj83OFjE4phqYXbHKqaAPuI2C7owptNL
         LmZpVOla0TYqtwacQqug/KLTT9qebaq4pOZ7R/Q5nhmpuSFRiddDW6qi4ewK8Nnq4zNd
         oR2A==
X-Forwarded-Encrypted: i=1; AKwUvBzew+GOAbFpEx8r1RiAvHpt9jQWR4ogAK/9nviBIZ5wtSdQFUzRHWnWRoas1O/DzRjANbaOYFMnNWJzmmJ8aBtv@lists.infradead.org
X-Gm-Message-State: AFuF++mH4ygO0lf5gaIaSuOaibpL7t+eDKfOuWXNDSosNzpGmJRyrIKv
	0Qzib+zucxdxhkUBEnzZnGxTEq/we4dk8PgvKVTUBRfxwK8fjZLCnN4=
X-Gm-Gg: AYBFou21ZSe7slaWkuok+EuBEFcH/X+CX9/B3aDN/72ZYXcrchPmEQDh4J/wAxEV/Mu
	mrXDhg5HCdqABUh1VgWz8+ZS1NTLPe/4BqWkElXKuakp7S7v6b/1MFM3gVBbbq+F2bM+KvXoXLK
	EeREW5ButBw3pAhScXlOVzn1pJfWbtsmeqfr22Yzsf8iDwC6wDC48b++FXg4mz4gkNhBrzZoz7t
	NVPlQ5WsdZKOGA398IqhR3vKyqBTinHfM+M3oWx2/C5AMMR1PZJUaReBfsdiRGuz5E5Qbdb8657
	GkLxNJZmVNvz5+u5QLMZwUgZ22LuxbRIO4jEi5Ppou22eDyEPCONx7l1nQblMCk+I2+mf+TodHY
	D4wQSg0AWM8Bdp9T9fdDuy1yJSnEx/UkeaahMGSTAQIfKl1wqZUgRt4/USmG0nS0HR8ye9chENL
	ehUZbHfYN4DSNfYbwOMZJJGrreomzUxV5acz/oLhLzSoZiTHyNzo4Cqn6JEIeO1N9vgtYaFYE+L
	L4M7x5FDixGfFnU
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr33674550a91.23.1788786400789;
        Mon, 07 Sep 2026 06:06:40 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07b197a9sm26742398a91.0.2026.09.07.06.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:06:40 -0700 (PDT)
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
Subject: [PATCH bpf v3 1/2] bpf, arm64: set up the frame pointer for the exception callback
Date: Mon,  7 Sep 2026 22:06:23 +0900
Message-ID: <20260907130624.611942-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
References: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_060641_764567_76E5C424 
X-CRM114-Status: GOOD (  16.70  )
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

A program acting as exception boundary saves all callee-saved registers,
so build_prologue() takes the exception_cb path and never calls
push_callee_regs(). That is the only place find_used_callee_regs() runs,
and with it the only place ctx->fp_used is set, so the callback prologue
does not emit the

  mov x25, sp

that points BPF_REG_FP at the frame the callback runs on. x25 keeps
whatever it held when bpf_throw() was called. If the throw came from a
subprogram that uses its own BPF stack, that is the subprogram's frame
pointer, and since the subprogram never returns it never restores x25
either.

Stack accesses through BPF_REG_FP are rewritten to be stack pointer
relative, so those still land in the callback's own frame. Materializing
the register does not: a callback that passes the address of a local
variable to a helper hands over an address in the dead subprogram's
frame. That address is below the callback's stack pointer by then, and
the helper's own call chain covers it, so the helper can write over its
own return address. 0x1234 below is the value the helper was asked to
store:

  pc : 0x1234
  lr : 0x1234
  Call trace:
   0x1234 (P)
   bpf_test_run+0x188/0x3e0
   bpf_prog_test_run_skb+0x47c/0x998
   __sys_bpf+0xbdc/0xdd8
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

Set ctx->fp_used on the exception callback path so that the existing code
further down sets x25 from the stack pointer. The epilogue restores it
from the main program's save area along with the other callee-saved
registers, as it already does. x86 sets the frame pointer for the
callback from the argument it is passed, and powerpc computes it from
the stack pointer.

Fixes: 5d4fa9ec5643 ("bpf, arm64: Avoid blindly saving/restoring all callee-saved registers")
Acked-by: Xu Kuohai <xukuohai@huawei.com>
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 arch/arm64/net/bpf_jit_comp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index c18e005a41db..c5f55d6161fe 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -600,6 +600,8 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
 		 * 12 registers are on the stack
 		 */
 		emit(A64_SUB_I(1, A64_SP, A64_FP, 96), ctx);
+		/* The callback may use its own BPF stack, set up fp for it. */
+		ctx->fp_used = true;
 	}
 
 	/* Stack must be multiples of 16B */
-- 
2.53.0


