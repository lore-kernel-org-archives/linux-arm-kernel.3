Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0039CEFB7F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=srSVsiV2b/ln5UzP/d6flconP4PG3Pc7vryxNaoWscY=; b=3xpgf97jsw/ag3AXAUlbA61jqX
	HqYfHP9407Kot9/EnOr0wi3rV9zOdEDyl+Zc0vhNNzMVXVvftjSV0Dulm//dBbFco0m7tN3/pd63M
	Z4z+XWh7EM74MnlmRqrHC+nvOWe8dVFaJ0YUt4WE/FXBztSjhqvNxVpwptzyeL1j0nyErOUCEmJln
	dIcU9HxS74dWmwSYSrWXVpHAiaccoNvGgShjyYy8ncPHRevuzsWvqb8B8EXX0GGH+WMw/MhW5xf+C
	Frs0fzUqH1gMzkmp2iWsPhX/Mg+Xx50c/1JYwKwWqd2+96WQzbHTkZzRjpN43o45BG8pfFhdjEu87
	vIJAODrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuolS-00000001lBh-0t2Q;
	Tue, 24 Feb 2026 09:31:34 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuolP-00000001lAm-2H4a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:31:32 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-483786a09b1so54279395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 01:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771925489; x=1772530289; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=srSVsiV2b/ln5UzP/d6flconP4PG3Pc7vryxNaoWscY=;
        b=1LJCW071jSA2ijACithdxixAAjl+9n309rKhdHHbWqe1J4qxZ3c1e5sAwFxbnUCJKD
         rqmSVGuiUvNVurNgQrkKXrNbA4X2HZCl04wQJd6Ju3FIIoAnOHcE2rYcQzurW5xfhsP5
         Ppma+D6ph8hAUsUgDbL0yUnxGeyx8DMzqyPXhczifvvqcHQd3eOW1KFfwgfKYAquSkCE
         Zu/kLqx9c9Q5vZLGjRg4/rAAtk/YnavvHR6WlVnb1p7Xr6TNeRlL5NyoqkWqhWFzr8+k
         GhKrfsufEKiS2MV9O+aOT6X899i1yyJBgU49ICtUhnTWnpp8Hr/cWJuIQ1UrE1PqcFCs
         LVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925489; x=1772530289;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=srSVsiV2b/ln5UzP/d6flconP4PG3Pc7vryxNaoWscY=;
        b=cfVrekHYEsKBxLqywjhieUi94dcNUULEgkIKBxzZGCafHL0qfIi17z5Salkpvlw63I
         lIALKJIEJNoeNTtO4KoRpLm8nDJLLn6TDKfaaq5OO59NRB95G6Su8yKxoWHja8fy2uId
         k5SnQPadxwVYhS41H6+2y/aBxHuogJqfX4cF6Yknt4n647qYQHVgAdGoyY0iiNBp06Mu
         1XlRWHIpvXPTrR1omBCpNMUd1ccltOgGzakAx/xSvS3IIFy9OQ3kOevytz4KvARD+xPT
         GCvZZ6Ge7BfHBo+4H0vNNHLF6AOTtfBnEggaUurpT6GYpaYDfYvRZWzjMYtq52HFmYfs
         aYOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/fRF5LGmOfGmwZ+ZIDO/vP5jFEKIExNaBkZrQE6vx6lEwmhPRqMC+IJQVL4M6BIPt1XLdtuU291K4cK7TerRj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp3LVLH5jL5E7Nfe5lpBokgZAxRk+/UzJzS4duwaUwtM0X4H6n
	hbcFVZmM1yWviJaYC+dAzp9ZxyVU0DaGO34wZpbhEg+mVwYt5SwZRgy896a2uSNjrzTtjGZC2fy
	NLQ==
X-Received: from wmdq4.prod.google.com ([2002:a05:600c:304:b0:483:2ac4:5da6])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e1d:b0:483:456a:514b
 with SMTP id 5b1f17b1804b1-483a95befe5mr191351835e9.12.1771925489179; Tue, 24
 Feb 2026 01:31:29 -0800 (PST)
Date: Tue, 24 Feb 2026 09:31:28 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
Message-ID: <20260224093128.1926610-1-tabba@google.com>
Subject: [PATCH] arm64: bpf: Fix UBSAN misaligned access in BPF JIT
From: Fuad Tabba <tabba@google.com>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, Jean-Philippe Brucker <jpb@kernel.org>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_013131_585549_CB1F3644 
X-CRM114-Status: GOOD (  12.12  )
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

struct bpf_plt contains a u64 'target' field. The BPF JIT allocator
was using an alignment of 4 bytes (sizeof(u32)), which could lead
to the 'target' field being misaligned in the JIT buffer.

Increase the alignment requirement to 8 bytes (sizeof(u64)) in
bpf_jit_binary_pack_alloc() to guarantee proper alignment for
struct bpf_plt.

Fixes: b2ad54e1533e9 ("bpf, arm64: Implement bpf_arch_text_poke() for arm64")
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
2.53.0.371.g1d285c8824-goog


