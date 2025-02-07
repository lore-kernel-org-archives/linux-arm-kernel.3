Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2178AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yopLqhfx9FBzsjoQTq5VQnotD7AE589toKqt2dLQW/g=; b=BHH6CuIVRFnEjEb6a9vqqGLvZS
	8OrtiHL3NHj/VN+q/R+Y7MGCcfoBvxnrmIT1hpjIvqh1ECr0yGmGefiKc/QH0yFx9zrHWBZau/otM
	kl5HE+aBHE0LG4ywMI3c0H64M4HCujd/oh9+ElSZ+OPnE21C2MuHcJOJK8HzHoEYInqik+EZtKzKU
	tT/c25jtS5TFZ8NukOLLm90cumJhje5VfcMNsy/UEP6r+V3oyDPnYJSxjyxQVwgKyeDaUtCs+lNyY
	XuPv8iY7AaqeaXiCtawhjiGpqZ+aMrshOD2Hi4v2HvFZDWi1N2cKmiDhGhgGDV2R+30wrmUfBZBjH
	7FhcGnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDrx-000000082at-3ro9;
	Fri, 07 Feb 2025 02:13:25 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDkt-000000081YQ-3dCl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:06:08 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2fa166cf693so3103542a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738893967; x=1739498767; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yopLqhfx9FBzsjoQTq5VQnotD7AE589toKqt2dLQW/g=;
        b=TG3K0QtnTMxY7eo4fSkARpQ5684ZqxU4jwwfJd4EAi5ZujllIgQ5MM0KzHMk/BXHxE
         SIixorYTALuffJDX8TPatirkitrJiXzf2W/t29HAP42bz72TWn2JXWxz/2NPpS7J29Pe
         nb350VtVnOKn3xBso0YSl7tyBqKl6J0JZM0BTzQyJc8n5otCS1gmN2SNURsVC/6KPrw/
         MW21oCBsWqK8dLkjdJfrqNEkZLw5OCZvurbexjbprsgF08gOZ0qGEYAe+v3xtrN2iQ1E
         dP+Zd4GKMIYj8+UTpHOjXVNKV1wgFfyR/uY/az5hT1FUps/fsTrWsP1QEVbPoZETiaM/
         ESmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738893967; x=1739498767;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yopLqhfx9FBzsjoQTq5VQnotD7AE589toKqt2dLQW/g=;
        b=DgevwCx1zUlehZvAFvTAAyLoUJZh6gCAvirMZssTkEHGOVq/xwFGnI5rmvnQYiNfOr
         5qUjIMGKQs9IJJ00Ajxf82z6aoCVNcSKfiz67J7Z4SniKLUnz2ryGW6ed+YIP5YG3qxJ
         JrTSFdZtygLk1zjsq56P+Q8J5osGdN7CuqNUL+eP6bmv5KgQFwQ8K1ORaSwYsY/VtMSP
         71ks2oxmRlA3ZGJDSDmEYzmpxJJkRi0TbX7Dhn/3reloCPAxLzuGEUlZ8i4OZJQxFeay
         keCwcdu/ix4cAgQY45RuQGeKhN7Rj81mRwE+JUfGuVMrnlFi/aeNWiFHEgXOb78D+nKu
         377w==
X-Forwarded-Encrypted: i=1; AJvYcCU/CSYOKkZQ/3b91SnRLYlvrVzBpaPH0gkWLVnS7XoM8SIT8J3awj0tVSG8qNku0uIo26gapXKwezTf0hZ1PlTo@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg/u5fv3aV3UCepOMiIjHLnlJrLzqgRwKEtkz1MDnrWSYA5hV0
	d8cA8dCNnQnxfO0WL0xPUNstfAeM8MSNpbd48DoIwyLovte12WUoGJlzA9+o6awWwXvQGT+P/Bd
	BU2vgB/cFAA==
X-Google-Smtp-Source: AGHT+IFkXM4xOo99sOcxT31u2xnrLGGSfuSlHl8QgKpY5jPoM6In+piNqVi02IXVxH8TVZTEDBs9f2fc1XsrBg==
X-Received: from pjbpt7.prod.google.com ([2002:a17:90b:3d07:b0:2fa:b84:b308])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3dc3:b0:2ee:8ea0:6b9c with SMTP id 98e67ed59e1d1-2fa24064223mr2524108a91.12.1738893966755;
 Thu, 06 Feb 2025 18:06:06 -0800 (PST)
Date: Fri,  7 Feb 2025 02:06:00 +0000
In-Reply-To: <cover.1738888641.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1738888641.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <d6fd6d0d1cafa5520c61bcff7e24e043e606f380.1738888641.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 5/9] arm64: insn: Add BIT(23) to {load,store}_ex's mask
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, David Vernet <void@manifault.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
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
X-CRM114-CacheID: sfid-20250206_180607_902372_A2606392 
X-CRM114-Status: GOOD (  11.05  )
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
2.48.1.502.g6dc24dfdaf-goog


