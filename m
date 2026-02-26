Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03620FC5903
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 07:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMHrV3EDqeB76tWITQKDIWbxOYh777AARVef/M6xYas=; b=AdOuAB8J1pw28UOoqPu1ZQjOSk
	MtBIO/swfS0lGNEE06v+jR/ABAI9PFQ4mxar5P1CT6g0MGgVWMdqJxJLT8Yaun5H3iAVuM8Y4cXL5
	g0sJCIyqQMwmaxw/56Wll0+lRjU+dbMRAb6gbUkIMUBCRSviJZ6rD2Px7wMt3eZCql4ii/gBCbJnU
	RqqA4WbMnuHMDDyei4bFEyMYk7VkfEszZkWYMqXkBbUtL24a6UPVBNZki+HxM0HrMEsFYW3CDa8lu
	n9CZc4x3zuXVujHReoDnNhJueRVddNl36ZqGcESsDNS7+lQugOStJUe5sFxqlfXe2PbU+aMX8a5nn
	adwWEXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWDd-00000005bhT-1sZa;
	Thu, 26 Feb 2026 07:55:33 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWDY-00000005bh7-3qWo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 07:55:31 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-65a43295689so460759a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 23:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772092526; x=1772697326; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cMHrV3EDqeB76tWITQKDIWbxOYh777AARVef/M6xYas=;
        b=wNOBVV8bY7cw2CIZZ892KDjO7h5X00USAPL1W52cNi1RTa0sfRfJUcS2+/UcELNcTT
         F6X05W8wSBzDnHhvct2lBV6cTOIojGiIyqMwXkzHS8eFAtZ3YOjfm6EmgnyUeV4bSwNy
         un5jqchE/HclFwHpeQss+vQsbMCZS7JpAAoKMX/LSIzoWWNu0pMcpxZAoBBfKyo0C8II
         cK+yXdTQivmHXlBgTykNlykR7BX1m37G/7auXx1SJcgGTBNTPXa5ON4AEM///h7tDnC0
         4ajiJArK8oBv3xaefVPzPC5CGoXDDLyou2hU2slqY0EsSerfhypDyONZJyQavycsRaOO
         Yjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092526; x=1772697326;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cMHrV3EDqeB76tWITQKDIWbxOYh777AARVef/M6xYas=;
        b=OK4/EhRXpuyIrNLGPig+VJt2Ut1OkG+aM49uwdDnwNOmamn5AUtjSLkl8vh0a/M/5L
         mqIG9iSHZzMKYB5xEmmQArNw1Evk7RbpT25gRdudm/29kV2hVbGke1P5c6xJZPwCst8W
         oW7zubxIuvXx7hypqj6JN9XGQyslK+zgb2q0ICiYZJ6NPsL+eepXa6kvJZGKcSlyeG79
         oVpxx4eUGfhidpXfVtGU0uMBvyT7X0MLXVvGe98/DSiJjklQdkIc5VmYStH2cZ5ac3yi
         Jg73JeEA28M+wHVLeDmVwZjtn7bqgkejG46jDPPp1PDy1z7moHdSPFEuKtLN9DRHqgBm
         Vqfg==
X-Forwarded-Encrypted: i=1; AJvYcCXFGZYKsnv2Rgt/laLJLs7jLwWHUtSboPr0QZ374S+8g/BwddpKh8SidftF4/YHzpG4XZ4fT8htExTLoXpjbwms@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3TOnh71rhodlkAY3XxIRAbyqvfTWo+AIHDkXuT8qwW9fOzLuc
	5bB91Xh5kGKi6iKbVaxJe8bTNpiIt3a0G4psoR84/z4btp23p/hdyodAUSaBII5fYzHZcMYckBD
	+xw==
X-Received: from edty12.prod.google.com ([2002:aa7:cccc:0:b0:64b:8c7a:2c9c])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1453:b0:659:3ed2:13dd
 with SMTP id 4fb4d7f45d1cf-65fa47703a5mr2009610a12.4.1772092526117; Wed, 25
 Feb 2026 23:55:26 -0800 (PST)
Date: Thu, 26 Feb 2026 07:55:25 +0000
In-Reply-To: <8b7050b7-f2ad-4237-890c-76fc13dc0189@huaweicloud.com>
Mime-Version: 1.0
References: <8b7050b7-f2ad-4237-890c-76fc13dc0189@huaweicloud.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260226075525.233321-1-tabba@google.com>
Subject: [PATCH v3] arm64: bpf: Force 8-byte alignment for JIT buffer to
 prevent atomic tearing
From: Fuad Tabba <tabba@google.com>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, Jean-Philippe Brucker <jpb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_235528_995029_F923BEB1 
X-CRM114-Status: GOOD (  13.57  )
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

struct bpf_plt contains a u64 target field. Currently, the BPF JIT
allocator requests an alignment of 4 bytes (sizeof(u32)) for the JIT
buffer.

Because the base address of the JIT buffer can be 4-byte aligned (e.g.,
ending in 0x4 or 0xc), the relative padding logic in build_plt() fails
to ensure that target lands on an 8-byte boundary.

This leads to two issues:
1. UBSAN reports misaligned-access warnings when dereferencing the
   structure.
2. More critically, target is updated concurrently via WRITE_ONCE() in
   bpf_arch_text_poke() while the JIT'd code executes ldr. On arm64,
   64-bit loads/stores are only guaranteed to be single-copy atomic if
   they are 64-bit aligned. A misaligned target risks a torn read,
   causing the JIT to jump to a corrupted address.

Fix this by increasing the allocation alignment requirement to 8 bytes
(sizeof(u64)) in bpf_jit_binary_pack_alloc(). This anchors the base of
the JIT buffer to an 8-byte boundary, allowing the relative padding math
in build_plt() to correctly align the target field.

Fixes: b2ad54e1533e ("bpf, arm64: Implement bpf_arch_text_poke() for arm64")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/net/bpf_jit_comp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 356d33c7a4ae..adf84962d579 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -2119,7 +2119,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	extable_offset = round_up(prog_size + PLT_TARGET_SIZE, extable_align);
 	image_size = extable_offset + extable_size;
 	ro_header = bpf_jit_binary_pack_alloc(image_size, &ro_image_ptr,
-					      sizeof(u32), &header, &image_ptr,
+					      sizeof(u64), &header, &image_ptr,
 					      jit_fill_hole);
 	if (!ro_header) {
 		prog = orig_prog;
-- 
2.53.0.414.gf7e9f6c205-goog


