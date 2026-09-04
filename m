Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5C0C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 07:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVyebJSrPANro9+ZzIJ5GUMECycDoWkIReTgM/W+/mE=; b=bNR5Fy3pkq3Pp2yd9JqWqSHrPw
	IWbPgx1bTGByWT8VpG34l7TszP9LFkXjU3zsAf6Lyc4lDU1ifNsUZNzIOhkZh63ST9fYBNfnoi0oD
	LcruStOMCnIV8emnCp4BLjhKZAhbdVeJcFkWjY9OsGHNSKk4xos+5n+4AYSd8bmZvrmFa5aEGxE5N
	Fe+5MKofIZnYDP4yTSrxOt4fhKS8tyrxiOlM8rPNWGI0alRwFFYTP/H3BhJQ/ByhgX5TPd4+v78bq
	uxZnthln/7VHRZLFIZ3bLcgX3cqQkKiZYynJn4uNn5Y8SrQdDx7Ow17tozoN1Xv7Ba2KXVHu1aPAx
	PV3k+unA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Nwc-00000001Dcd-0z1C;
	Fri, 04 Sep 2026 07:02:38 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NwZ-00000001DbY-1v7F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 07:02:36 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8556ec44e9aso624244b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 00:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788505355; x=1789110155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVyebJSrPANro9+ZzIJ5GUMECycDoWkIReTgM/W+/mE=;
        b=PjbHgWXWAUNEQA1FtGeYL6vm4+JNKXEsYGD1YZdw8/1iOg8W3JSw+XfnFqrQAdKqHp
         JrjGE+4tY1CBXf2qJSKkwUi4JZ594LIAH5tbt+KDMsw/JToGgiDL06K+j+t6f15WxOxO
         164sl2tiHEORJrHqA0NIU6CPWXtWrXHttk6LigfXfYTrAZSVxlNlfHE6cLgLiIxA+s7V
         TYBmuuwHpZQTJsnhwF8J2tGyvrS5Jyj2cLUk664hzdrf0ByLMdZeuHqST3P1K6325qaz
         zQWPa09n62OoYLfpNf+onDgatb5UmDoxjw/g1yVC+nqi9bdbNNfGMnuNE8piSLICJKuC
         nUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788505355; x=1789110155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVyebJSrPANro9+ZzIJ5GUMECycDoWkIReTgM/W+/mE=;
        b=GzaxdU8Ehoqu4bFx8NOJ7tL/3CbgpKp3lxVRL3BXo3a5ey62CwJVOavXfvMu51qwgj
         6/oD63SHLbD/xICmpv/IOKr3YDrHDDHgi6acqSwlVkUJHyd5O4+CVqYWgqEFj7OrRdO1
         8GnL51DgIs3tBPQFbt/oduyKG6dM0SVAc3ZwGmTmHWfQBRb+xoZE4HehVkNl+3Oo+hVP
         pxZak/U88ts/P+6MEFx1UB27lRFn3O1QdTOxdNRZNXI9jRQzMyxky0no4YH1x1tfwrMY
         gqCOIaO1wavV1a6s3E/jQcNfA2hK4DnkdfjQ/vUksB+3uEHv/rcXvhxxKNAqGSUm8pBC
         Aw+A==
X-Forwarded-Encrypted: i=1; AKwUvBxEQ8SCOVnR1oZf9ca8t5PxouzqklnDH5Q+jHhQNTgHd3z8Myvv30focVsUdJUtpNRh9gIw/oESGnPS2mJ+6G2U@lists.infradead.org
X-Gm-Message-State: AFuF++l9yeZNNrcnEsdrWbrPdoDi8qUSZ/cCv7jWxL6CVI2Rs7Zukv54
	zp7OV21JpHYcLZCIQnvbrWvdQMyROjBPwEpINPa9VBACW7HbGARKAdL/cQDsEfJe+w8o
X-Gm-Gg: AYBFou1AR5AALBQ7u0Ym91WUBPp9XezgHKpmqK0t/7BycR+/6kU0mrsJJAkWRbimGxw
	bF+j6BSd/21OEwjxjtYSUPtlLbpSx62KJYMeyxHgL520tLC+Zu7zP12Xv+F0ew4/n2JoogyBQyn
	UkSimQz537QMPuTOiIGNONivrsQLuqlqtbK/0XsqOYUF6/FrNYkR21Clt2adg4w1h1zV6djprZj
	koVDTJBqRB9TgCZuSps+Hz9sXkHrOW2/poiqEtIN/td4dsql1Zz7x7r0Ca28sMXR1KlvGDVoA4a
	xSNA3WuBEJ+gAapTA0YSuKYuHYj8t4ZeYKFs1xlPGGMLV4lDZBtpRBe4NMkjRNmBqOh/miwZtUX
	aeXWmVLCMUoxxP3D19QDJXuzXb7NHbwHBH0PlL3ejlsWsyyw5V5mDzYE4P6X6G8HKjgjJWts4Ph
	UYFgdyt5UnnEbTcCS7vZAozgO8dk0/4MT33IeMJlWwPNr3UUWU+z0X8HfaWACULNONjZ53H48tG
	LZyB/f4c+T547lO8Afjyh6A
X-Received: by 2002:a05:6a00:9518:b0:857:72ba:ff0e with SMTP id d2e1a72fcca58-8616b667c51mr5437819b3a.22.1788505354389;
        Fri, 04 Sep 2026 00:02:34 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615273e3a0sm755511b3a.23.2026.09.04.00.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:02:33 -0700 (PDT)
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
Subject: [PATCH bpf 1/2] bpf, arm64: set up the frame pointer for the exception callback
Date: Fri,  4 Sep 2026 16:02:09 +0900
Message-ID: <20260904070210.4163193-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904070210.4163193-1-donggeunyoo.kernel@gmail.com>
References: <20260904070210.4163193-1-donggeunyoo.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_000235_624391_DE60DE27 
X-CRM114-Status: GOOD (  16.49  )
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


