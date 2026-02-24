Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839ACEFB7F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=srSVsiV2b/ln5UzP/d6flconP4PG3Pc7vryxNaoWscY=; b=GUm77zN2pTiWgyy9HoPjZgUcOu
	euC6MzziAxuu0RKY/CrHjoPTMsBld0bBX8jA86pwa9cvcD9ayvhcOIZZISX90DurpKn+EO29EfMwG
	qUKupedPCDkk4Fqo9F2q99qsEnRsbdiFRB4X3hV4frLa0Nf8g5pu1AF6pM53yeapFPJKFv7wowVnd
	s73+gwVd5r10xb6w4KKXYgVGp1x7xum5hT4QTNrinkj04T18X96fjybEQXNHQiDpU40yGMXPnn5aG
	5AJH4rGqUx/NqG1+PWtSKAmxO52kxD39+QlB4rEZnQsC7+juY66o+yHFe7snRf8n2MIeZx28GSqXp
	7dJ3DKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuojJ-00000001ksJ-1Nfo;
	Tue, 24 Feb 2026 09:29:21 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuojH-00000001kro-2gBX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:29:20 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-483a24db6ecso55746265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 01:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771925357; x=1772530157; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=srSVsiV2b/ln5UzP/d6flconP4PG3Pc7vryxNaoWscY=;
        b=TRxHofvzeHHm9R3zfGY+z908LrlagBQwONPS2b5+a9R9lnoSlrgMYC6mcYAhYa8mQb
         /LwA8QQPmiIlL+yZwismHIsRqqjsoWx0N05IQFN0jwYKDzB4IBIl9RFXX9i7i9jh6ovd
         5KciHCQ0kVqG2958rv3dpbSjbr6fG54+1GKkBXE+Ns+B+DJtL6VDuEk0kBu8/Dba/H/2
         ewPeHyJ/Hre9nQ242xOwRUdz7hkfPwJK9FDWN2DFau6fkVu3/o+C1qLK2KH7a/9P76Lj
         fbf0TL+6gilsL8ASL13FUKse3dYpNfEbsf7ug3BRVZjbyarEKv4HCErIJUzX3H/j9OXO
         NaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925357; x=1772530157;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=srSVsiV2b/ln5UzP/d6flconP4PG3Pc7vryxNaoWscY=;
        b=Qj0MtLqakD9I4Hy+6fFQh2YLwL8qQIKJkoM3YoxkA2IhAY8mjaDTRIkYh4PrdrmGbQ
         9nST0IT59yRDO31l9+/EDnfRW48l/go9pHmaopCPxJYxJWPBBvWTeW+XFQ5mrAAODhNY
         e8OhXv2e7guc5+l0lcjTc0De+g7WAxkCWBrda9KeYB7+9Zj7Fby8Yt1RIma9nvwAutlN
         xaqgz7gRzDjVO2vhvgq1UWp3LK3elmJipm8LJIXKZJbgMvY7WTnz+fUwORMnLR546XZf
         DGEwX1RDSk7gqx8xSlYWZsKyiUSGO+WqA6UgYoBpdVdzx5UhcLmC5NfRdj1zYSJh/VCU
         Ptbg==
X-Forwarded-Encrypted: i=1; AJvYcCVwL4nrmtMi+JH5AEvIORtZwL2nXHUdHvEbhmtd5R549YkyJvvLX9sQPdf1YwJRQyNkj3Ti/zWFOuBiMG5KuYWO@lists.infradead.org
X-Gm-Message-State: AOJu0YxkDtdvJuLowozWHvEe87qMmop5zZj+JPWUWtFIpl+boQ2JocAL
	IAs0ctSyHMquj+otft7LIg40mt74OAecpg7Se10vOJNOEX4fu4OK1TC9X0+aEu6cuM3Q+Mo0ly9
	+gQ==
X-Received: from wmbju22.prod.google.com ([2002:a05:600c:56d6:b0:47e:e4a5:c5f2])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6298:b0:477:5c58:3d42
 with SMTP id 5b1f17b1804b1-483a95fb23amr187555705e9.10.1771925356794; Tue, 24
 Feb 2026 01:29:16 -0800 (PST)
Date: Tue, 24 Feb 2026 09:29:15 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
Message-ID: <20260224092915.1925488-1-tabba@google.com>
Subject: [PATCH] arm64: bpf: Fix UBSAN misaligned access in BPF JIT
From: Fuad Tabba <tabba@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_012919_700896_03D9D3FA 
X-CRM114-Status: GOOD (  12.43  )
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


