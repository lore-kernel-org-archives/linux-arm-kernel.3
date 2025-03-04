Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04E5C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 01:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDRlPmyHtUNZ0yOQY1bkQ2kEbwvsRJ/+HMV3GdLKk6A=; b=W1gXizkZXEdNpRk6DStF+m7y6s
	wrci1mtKABBFKjDIEsQGsgKr91kcd760PD940SYUwvNBKKrVF1pom2OMOBLYuDLy0dYvi5GArePWT
	R9FAlpvw+3/z+P49EPQfDq9CHrq3h59X924c2xDfrgsYwFR3LwLNnVX9+Psxka90RyHZr4IxPfzJC
	HixbaUH+ABvRgR7tGiLcwwyj44r/+jFRYMqOmbS2B5ckotAHqo+wHz4tXxdjzGkSpScNRj/gp65pV
	I3gpJ4Xp3jawhpjkIbgF+c90keMNiizQOcEq/vXpji2w/45jkjz4ai5m8lQOoC3l+//BuChswzMmp
	5oIIyEAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGny-00000002jZl-2L6H;
	Tue, 04 Mar 2025 01:10:42 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGjo-00000002j3o-1jj1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 01:06:25 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2fea1685337so9026174a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 17:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741050383; x=1741655183; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDRlPmyHtUNZ0yOQY1bkQ2kEbwvsRJ/+HMV3GdLKk6A=;
        b=jSSgyqEZWwZPQ8rBDIHphCRGJvoOVaUvPpeAJSwyZN3Y5qod/bCCXmidiwgDR8i51l
         ooVAexialRdThuxIfTZAeoz8izn4dyrS25dfxds3DHhmKqwmam6wZ3Na/0+nAiIIYFw1
         t5leCW6aktJbkSZCInFLHZi3rAERYV/o4I9fuxMiJiQEJZrkXE/jU47Iv7PTJ5+Bsv74
         +UhuJBINPt5ZqNR/wYZM2xUCNHTz4ad/har4kzqiik7NPG33FGj0SPsKmSoa67pYDU8q
         4rPMBaFghUnqA/a2NXWzvaUvot4RDTwZpCM9/v7S/DYWq+WIHUKnl94rmFZiyE1/40nF
         9epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741050383; x=1741655183;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDRlPmyHtUNZ0yOQY1bkQ2kEbwvsRJ/+HMV3GdLKk6A=;
        b=rLiIdGPmnHs3souM1JJ+lAT5kIjmkVXyfaecSxyw9d5+m2pz8TndYOeegfceh15OMP
         RdaYypmdDseWBRkdk1uTUOzF9A+FqMT2cHOWcQQBbh89daRF/CwfIdh8zUBegpSg5Kbj
         LOlJ/c9eFoo7rjsMtOiBUGmeaGM2NPGuembaZLczPo2ETFrLbRz9H4vVOh3VTI6aEK+2
         JFown+P66zYQMD5EiwejcUbTM+mZc0MGKxqFbvu1cJMy1nOlBMQ7nJNsic/ksc//BeuO
         5e4Zfmy5dQ6uKbgUjwWO49qmcYKdCRN4Wi+DWMkY1pceBMzJH2lr0V6Wzg7DuzY2xs91
         4TzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmZxj5Og9s/EfIrtNVsB6q9TJEe1zuzFFCMpEHV0if3JQyBtcQW76rDXj3LY/9UYSCcnDrW14IkGFWEdIM1yeP@lists.infradead.org
X-Gm-Message-State: AOJu0YxJQqFuKHU5i83SxFAsDS5bbbdBHKB+/2TpAqq1Z+aeFIALZNGE
	Zgd5ozL6tZMHCkUdX1t036NFWnAXeYsYrZDNFiKZj0P39qME3SrjSwV0V7bp2ZyxaLaCBf0MM8H
	oyr0Hwd3MjA==
X-Google-Smtp-Source: AGHT+IE/HHlRwMe209CIsa1KC/8Ic0b8hg5Keco1IR+qIcNxW9u+r/PDsuoGYYvMBQpxrGmOC6gLsHe+b7OQUQ==
X-Received: from pgc20.prod.google.com ([2002:a05:6a02:2f94:b0:af2:45cb:9881])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:d8b:b0:1f0:e2b9:d163 with SMTP id adf61e73a8af0-1f339156896mr2073126637.12.1741050382873;
 Mon, 03 Mar 2025 17:06:22 -0800 (PST)
Date: Tue,  4 Mar 2025 01:06:19 +0000
In-Reply-To: <cover.1741049567.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1741049567.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <5a4d2a52b2cc022bf86d0b572789f0b3bc3d5162.1741049567.git.yepeilin@google.com>
Subject: [PATCH bpf-next v6 2/6] arm64: insn: Add BIT(23) to {load,store}_ex's mask
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
X-CRM114-CacheID: sfid-20250303_170624_450318_AB91D6EC 
X-CRM114-Status: GOOD (  11.38  )
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


