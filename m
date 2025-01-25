Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298D3C02181
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 02:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jhO7BAME7t86oa1kVif63p2DnH3NcNv11+/BWAtyDY=; b=EKx4Gj9e681A9Tz1JGycq4QF3T
	L6KnPiZfaYeIWpouTftxFpNvndgzpMcLMVnrin0GgAIeWFTpAOV+Q0kyzeyGjlsV+WHvxQ4gyMyCr
	yHiBtAhQ1XGkr1U9zgKZFTSDV+LBl5JXUT/Z9Ol2UjFxk1/46P8dmordEQhdEQ10t2kP3lxA2agyy
	L/t7a2O0TVReEymsr+MdVHmQ8sF2Og/3NlZarTtWlS26UvjcVCRhCNUJfJI31xH+kl32Wc2Z1bAcY
	3nGEt1CUlDW2mmD84Mr6wgJQFobaLg+W2IwlMNFqoY9RyisSeFRJS2uaOZf3mS2ISqFk9+1om6Tth
	KiceHTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbVq4-0000000FuZW-1cis;
	Sat, 25 Jan 2025 02:24:00 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbVl0-0000000Ftxk-3isb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 02:18:47 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-21648c8601cso46531165ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 18:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737771526; x=1738376326; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0jhO7BAME7t86oa1kVif63p2DnH3NcNv11+/BWAtyDY=;
        b=MmXYew9njyfxQa8pComPmP75vwPoN+bxd5GNnYJP0z1NyoHjaYSvF2uDRloJoa/m6k
         H2lTklKlGNqPzkdmJwYFQKCuVG8FYMaSp/jDuV5DFxyvJckwiivmzPnpJ1z9zdYQf6Rv
         WgLQVMUH+C7ja4AcVj30P/oGac31fSND1leUUizjInriuFU288jL5JPNbVJmXW4o0xv6
         x5v6ce5xSUrlaGtr9EOzzaLuLRrUy0yzyflYrDrUk+ZXEYUjh0RA9GwOaFaWIvxu1YjW
         3Rox5bG1EDBBGQ0g/1tSaDg0lTS/IxVQe9Gqb719QtWETcHIzzg4I7EoOesHUAPnKSdn
         07zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737771526; x=1738376326;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jhO7BAME7t86oa1kVif63p2DnH3NcNv11+/BWAtyDY=;
        b=sjEFaA9fwO0sYV+qK5h2twcxiyRiaFW2yeSDbpyUFir4bxihN1ISfms81Diy+9c5a3
         ue2vOeIrhYfK3NEVucfdJ62ORlVpei+/buTW/zdGNSgazHQ4LaInLpBTbqpuiQW5BVqB
         HpDH37lp9UGArGTs8A5cedvPftaqbB++hDQ3Uqjr6JD/m88O9u5fhsQN7AiCQ48KLpGc
         sjj0iGo3R+sBPVe5vukD0tmO2WxGRqPI8s5KL+Ec81w0lLCT+qbnf3C/72TusLzncjeE
         DO8l3dRZ+Ct7A0TeVP78EuQlJQQv6sGbR78nqv81ByCkRFgzq+GjvSZZ0G+QFbw+KkBX
         6IXA==
X-Forwarded-Encrypted: i=1; AJvYcCXIa0PhY+4cpSEWojetk4ojif8VKA5EpfbuLtRleRjYGzIX69hKpX7WPKYaIwU/dYCerzIaRHHueX8pwHC3QnNY@lists.infradead.org
X-Gm-Message-State: AOJu0YxEdYqCCmkY05jlPhyXYi6wu8mBUY0o7DHOVqyNEp6O+TwQ8Vv9
	+A/fiG3oC2FY86vdySCL2SxOPJXDA17cdvWxJ62Uq2yKMDGLDocpKtMaosWNDkW2J/IIMmQMbnp
	uBcaYGIv+PA==
X-Google-Smtp-Source: AGHT+IGOA2myrdjHdShHtNzy3sHhO4gQRnqhkbbsoC8Yq6DOPMUbkkwaNv2wF6MPelQcaIQVD67axVPVSm5LaA==
X-Received: from plnq11.prod.google.com ([2002:a17:902:f78b:b0:216:1543:196d])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ea10:b0:21a:8716:faab with SMTP id d9443c01a7336-21c352ec1f0mr490310075ad.16.1737771525995;
 Fri, 24 Jan 2025 18:18:45 -0800 (PST)
Date: Sat, 25 Jan 2025 02:18:40 +0000
In-Reply-To: <cover.1737763916.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1737763916.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <e003a69271782b91fafc07c7614becb4f5fe115b.1737763916.git.yepeilin@google.com>
Subject: [PATCH bpf-next v1 4/8] arm64: insn: Add BIT(23) to {load,store}_ex's mask
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
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_181846_928497_3A68158B 
X-CRM114-Status: GOOD (  10.82  )
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
2.48.1.262.g85cc9f2d1e-goog


