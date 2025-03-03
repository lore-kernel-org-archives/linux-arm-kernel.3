Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22B6C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 05:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDRlPmyHtUNZ0yOQY1bkQ2kEbwvsRJ/+HMV3GdLKk6A=; b=c2Djkd6/ppOnoeKQO9w4F2zWDv
	CsZE9xXGADtpHwbe4yCwGC8MN/9y3rN3miHIma+hOl1hYs5Tnbo9X5osJbYYhA30ydrizGzP428ie
	AxWmul5nHsz7ieeIXBYmCvXM3oB7C6CeALEGACwzR+JP1Ht4iRMtaUYEZAQqh20x0WMKLBdk1IwXh
	LLacpB+nDti2In+dHcCAlBLtjM8hvaZlyzjDu1EmFJJL0kIvrjuFpe72ibr9q4KtncUyKNw1wopGy
	M1UxjIWaO9m8xI6ZUlyFGSo93PVDdgElD/897SiZYBB4j0EICtBOpKACarjG9/ZY+51iRfVwJ0qM/
	4MmIFx5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toydP-0000000HHMO-08Ay;
	Mon, 03 Mar 2025 05:46:35 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toyUu-0000000HGPB-2nZN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 05:37:49 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f81a0d0a18so8193496a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 21:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740980267; x=1741585067; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDRlPmyHtUNZ0yOQY1bkQ2kEbwvsRJ/+HMV3GdLKk6A=;
        b=YW408+4T4SOsFZb4pL6IVKybXUQKk+hMLO99woouvGYFQf94YuWPbCxYBWZkPgEoYB
         fkynLacuHxPqn8qTRYEQPTPWclwPcV1DuooKh9qPhRiJPkadkmi5UtpqGp2ApsTtEKJe
         ON+OEPt4KuLE+M0xmh4RL89XvY/gvkuILtN7awlDO1fGj9JMKL9QlA8WyswoYU9bvm8U
         WZo89KPZbDtixoDkeuaWtht2neLFKb6QLezbMhh5ouOGpJSNoi2i7BgjRa29VbAg20j/
         dZm3n09F5qkOnBIEhX4WJ0ieMxF9LY7vFGfzuDEcKG6MsEUTJ0N7RC3b1Dy425WnZlrx
         O5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740980267; x=1741585067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDRlPmyHtUNZ0yOQY1bkQ2kEbwvsRJ/+HMV3GdLKk6A=;
        b=qgRN/Pu/s6sl0g8UOpqnkG/sAgOaTTlP4WwDEzyTG8oEn8QZNMXHuD5Ko+SoK8GXC6
         d0kgbnHjq7aPXzAr1pgH0lK9pwvN2vXV64FX0Oc6MnlJp+jYRIHx3vAtnfG3xQYXDYen
         t3vShaXFnAAYExuz5qKcBuyxFNPhksjQnkHYkqScIl8Ej2MmeOsjDcA2WWbf16h8EpxU
         cmuH9vnWmhVoBWn9fKytmrdEjt+v2bFmH2vpNthMy7NftqHRe7cf3JknKNYw2o4ZJcbw
         Za0SSVol5gnxWTbwUH1uoewVe/q3qPB3Lp9nZ3gys+ZpuoEmscmZ7IRy0CsJmWg93lY+
         BmTw==
X-Forwarded-Encrypted: i=1; AJvYcCVKp2hxk44UMK7U/TOZ7k4BA0TZCF0qpsnAEW/F6VArTkkRPpbDj9MACPzRmSWasgKXtHVs5M87wGY8xgfiiH5O@lists.infradead.org
X-Gm-Message-State: AOJu0YwQz6Q7q0ctHYY1vajrWYYfYzQ+NLZdnAcPZ76rN0LJ6/+9tcHh
	24Da8Mku+OIXRQiOXMuYueFA/IIlqBQH3Bd67ab2QVl1IYCgfIBzVnrZsEmfx2EY7iAumRNA/fK
	5AsoEDPgmvg==
X-Google-Smtp-Source: AGHT+IEyeR4LjO07+giiIXLMHgTNqF3xV9ys5aBY0UaUCNsB7smdHPPbNq89GHq0OP7YKsBN/rIFz4H/QXqJzA==
X-Received: from pjbhl3.prod.google.com ([2002:a17:90b:1343:b0:2fa:2661:76ac])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3ec4:b0:2fa:15ab:4de7 with SMTP id 98e67ed59e1d1-2febab3df8cmr22652320a91.12.1740980267592;
 Sun, 02 Mar 2025 21:37:47 -0800 (PST)
Date: Mon,  3 Mar 2025 05:37:44 +0000
In-Reply-To: <cover.1740978603.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1740978603.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <03ceb882fa759f503b3f4b7f4ff2a5ce69a0eb05.1740978603.git.yepeilin@google.com>
Subject: [PATCH bpf-next v4 05/10] arm64: insn: Add BIT(23) to
 {load,store}_ex's mask
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Alexei Starovoitov <ast@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	David Vernet <void@manifault.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_213748_703874_3C6EA54C 
X-CRM114-Status: GOOD (  11.03  )
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

We are planning to add load-acquire (LDAR{,B,H}) and store-release
(STLR{,B,H}) instructions to insn.{c,h}; add BIT(23) to mask of load_ex
and store_ex to prevent aarch64_insn_is_{load,store}_ex() from returning
false-positives for load-acquire and store-release instructions.

Reference: Arm Architecture Reference Manual (ARM DDI 0487K.a,
           ID032224),

  * C6.2.228 LDXR
  * C6.2.165 LDAXR
  * C6.2.161 LDAR
  * C6.2.393 STXR
  * C6.2.360 STLXR
  * C6.2.353 STLR

Acked-by: Xu Kuohai <xukuohai@huawei.com>
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/arm64/include/asm/insn.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index e390c432f546..2d8316b3abaf 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -351,8 +351,8 @@ __AARCH64_INSN_FUNCS(ldr_imm,	0x3FC00000, 0x39400000)
 __AARCH64_INSN_FUNCS(ldr_lit,	0xBF000000, 0x18000000)
 __AARCH64_INSN_FUNCS(ldrsw_lit,	0xFF000000, 0x98000000)
 __AARCH64_INSN_FUNCS(exclusive,	0x3F800000, 0x08000000)
-__AARCH64_INSN_FUNCS(load_ex,	0x3F400000, 0x08400000)
-__AARCH64_INSN_FUNCS(store_ex,	0x3F400000, 0x08000000)
+__AARCH64_INSN_FUNCS(load_ex,	0x3FC00000, 0x08400000)
+__AARCH64_INSN_FUNCS(store_ex,	0x3FC00000, 0x08000000)
 __AARCH64_INSN_FUNCS(mops,	0x3B200C00, 0x19000400)
 __AARCH64_INSN_FUNCS(stp,	0x7FC00000, 0x29000000)
 __AARCH64_INSN_FUNCS(ldp,	0x7FC00000, 0x29400000)
-- 
2.48.1.711.g2feabab25a-goog


