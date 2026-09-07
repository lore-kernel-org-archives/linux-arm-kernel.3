Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87302C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 05:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVyebJSrPANro9+ZzIJ5GUMECycDoWkIReTgM/W+/mE=; b=wZLXpnzJPgbFcpdjv+ZHk7Vh+r
	XZZbIn1QsYTn/ctgh6Y1CwLJzNxOdcWbxqOiBAUaxtkNmHhxpxM21JpxB0OiQI6D4bre+c6DZOJ77
	echtGG3tsm48r1v2hxMJVsC5rNgsEgvvWjLoNK6RM8+TzIsLeqq1fR1zn6oPeq86Inj9MCffqX2NW
	fMJAnxGSZ0Lcc51yYcCldtKob1lsqu0kqT/5MRB/7JWT7ZLSzxEAWx3IQG+cUrAZni3w+K+EH6ciJ
	DW7X2XLKUAtVVIXqWlTJ7Q1jbj1j+EE4D3VAMG2gEJeSxdE+NHuerKbqEH1X5vkwQDb2GmQNqTpEL
	sQrRDU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3S87-00000005x3M-2r87;
	Mon, 07 Sep 2026 05:42:55 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3S83-00000005x1V-37Pg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 05:42:52 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2db18e5cb56so27966615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 22:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788759771; x=1789364571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVyebJSrPANro9+ZzIJ5GUMECycDoWkIReTgM/W+/mE=;
        b=DGYgz879wLI+NIUnRk12uIel/sQozuICbk7LnA60CAvddy1VeUbpXX4QNZ022nC31C
         ff53zuZCaf5yb7+FI9I2EgdFhbVjOF7m1TqO05LnHhOwSXyGn1bVHSARlQOT6FXhTELQ
         F+Uzp4YHJaC8e/JV0c36j1HGRwgCiDluOYe6xDbwL6Y6TWm/IoCD8S8CD9jMQrPruSkt
         nrlUZISjYuwy2IfDEpRaynYOAOWPZKsxX7HJo9POyGq7vWFezfwUSvs7UgtV/VCKn7z7
         yDgoV6Tdzb2IellLVL9F0tPCbTWq72qfFTBBRAh+oAXROSAWE7qtQE1+88Hc3V8tnkhi
         n1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759771; x=1789364571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVyebJSrPANro9+ZzIJ5GUMECycDoWkIReTgM/W+/mE=;
        b=Y09Jmd7U3lPy8vf2F39tON2eI8djfrya2N1HF83Z6lesvQR9soLyM3NcYhvifOpxU9
         EFEnyMu+j7KZTkCLWbTlR6zylcHLM+eorJPvJETg92XDhVv2aimd49rhrP/1VK7GGsaH
         LYhyVu3d7Od0w8zo7B+wuERe5BLcFC7A0fmjiRBYHvHyXxBnTjB971whnVum23+chz0j
         eAqG9I43jp+NZsCPLnBm19eXUDCR0oCbpWSs2BhFMLe17bmN1ytlFUuzC0bXHo3KYD5Q
         uh4XiTDjlMfe9tg4G0nMMMtAcga0F/t1rGOQp2XFJFiay3YJI82oa4YegFOOSf1O6zzL
         TvJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMvvP+V8RP5MpN6x976o/99zPHI+GBpqygN/iW7Imjy1sY7N4PWhKrxvxi38dWRvL5HrBI0MgXaL9/XM9UTvB3@lists.infradead.org
X-Gm-Message-State: AFuF++lheAVwbEveeQOrU0gdU9idJ0l0Gm9FOsc5dYG1j2fAiayxVTWI
	CJqA7tsjZbl1bK4mgNWALnkwIudVlDMpx7NQOpFoBrj9Fd1SsnFVvYQ=
X-Gm-Gg: AYBFou2+3PT4Bt2Fa3nEUB19U5jiFpqL52ICAm/41gJICfJ0Iey8KFqs0xRv3fSm6fY
	6nakGRUtpfwZkZxDENF74rdGrhpyAjLY0JO5GCJj3jzNNNcFBfsui9+VZ7xgZlBE/lJVCSJLYcm
	SufvhEiYfBboNvlJh6+SOpB68sP+1BG1bj5kHWkU/blrmgi86y13FGktOJQixIsXndBRKZn43cj
	OWDBeo1STND1aENpQhtNo6JCBOqbgzOAyUuYI1tMeGrD+Vf4ieli1quPBMXeXQhsyB5Uycnij8B
	iTYGIyKc+F6obtPuCAJA225ON+yfJ0MkVmKGGEjQhMV3wBhwQMj1rReCnCFEKmx5PduEyMedC1F
	t0MUDlJWAOi3U7Elx0vV0aS7oMkGL6/fHlY9FOXG/YX4Sb9KI0qGn/e26h7dImS6OnwzV/EPHQs
	GwClhD6rbj9ryFFgrYvwGq0i3G4YRjj/AKuKIm8OPpTmj225NM6hVniuunW2cPCa32kw54yutsK
	gXJQ/Ydlcs2IFR4
X-Received: by 2002:a17:902:d587:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2db1265add0mr308117045ad.7.1788759770837;
        Sun, 06 Sep 2026 22:42:50 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1483dbddsm39107695ad.12.2026.09.06.22.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:42:50 -0700 (PDT)
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
Subject: [PATCH bpf v2 1/2] bpf, arm64: set up the frame pointer for the exception callback
Date: Mon,  7 Sep 2026 14:42:34 +0900
Message-ID: <20260907054235.473103-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907054235.473103-1-donggeunyoo.kernel@gmail.com>
References: <20260907054235.473103-1-donggeunyoo.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_224251_784910_D54174F0 
X-CRM114-Status: GOOD (  16.38  )
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


