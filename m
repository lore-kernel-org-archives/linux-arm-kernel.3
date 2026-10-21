Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C40F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2n+8MjIP;
	dkim=pass (2048-bit key, unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=QxpHPkXH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s18p6ABSRGJ/UxVSqWCBTz6bx2WQqcF10z8V9BS39Q8=; b=2n+8MjIP30qHkb/+Ilt2u/rFFa
	UO4nc9gQ2lO+NzrGeJVlFZoC5Z2iz8oPu8+SM4/YuNDdW3j/puhWo9IkoRCXS2d0ao74PdJML2ESw
	CiQ2onEAC2L/PCrHefxpU/G6qmJEGgyl4wMSoIa2ACwOP//0OvqYLtGTic7I+RRcdJz7v25EP9yUl
	eEHGHaMQQ11tcjF3HuQV+loHWucu9YqcdfV/qvlgLB97cbXbp3Q6eFqK5WDylOcPrD2DXh5+y9LYw
	tJR4vCjWymYsQMnhEdAy3vglyf9XeyFs+C1jQPmLVvi4Bi14hAXLWRn/M3zZ9Vm5nm/yvHHY4mG1m
	/nJLFXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZwk-0000000CXIN-0qXk;
	Wed, 21 Oct 2026 17:17:50 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZwh-0000000CXI1-2Ygx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 17:17:48 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-35ef6b49813so1285428eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792603066; x=1793207866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s18p6ABSRGJ/UxVSqWCBTz6bx2WQqcF10z8V9BS39Q8=;
        b=QxpHPkXHDnfRzdoNDHrCeul52lZFj50rrdXBL5pDTWNLh5Tx8Hvp+OBQr8RJPELaTo
         EK1OeZw2DzuFgOQJvVIpc8bAAoFEMH9KgQx78q14/oVEDT4bxlIOWjKSwO4V/avUaoRd
         kQhYgCn2MrvOAdpk6ot1odzHLOeYQWAkYV0A8iacz+N5JiNRcvD7WzFLzF92Yn05fLBN
         DHMJpwH+eoN60nUuNKGGBTlw7M8XEXIQOYm/4NqVe8YV4aQ9Ji1viZxkAo5kOt3EGjWm
         gEZ8HfpzsepGpKWqiYYqm55GSH7wd/ErsqJfbLzgUTlq1ov3kfGR+5CFlQHy1mTd9VNn
         1KxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603066; x=1793207866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s18p6ABSRGJ/UxVSqWCBTz6bx2WQqcF10z8V9BS39Q8=;
        b=CGb0kG2GBCROGSq1QnFiGh7ckD1lp6KTzMtMboMGoec+YKetPTBUh8pzUfm9FWNusp
         zMj+U5EQ3MglcJFoJtFU0krII/K/L6ykkzkJzzqw/rXu61MoB/2dcgy2D+sn/M7KE/E3
         vg1Bx/KIABotETwYBm3tUyP71Eq6UaSng3fPQO74HIBLbMcbs3HyRIA+hsy7m+s5qpLv
         fmlxLVbdGF8dRjhGhvtch4woobDSrvEtwiLq5jFzGJJ0syYVTwkV8A9ajnTLPzvypFDy
         Z4FVNwfHtU7ikp7BztRhDbIOhWjr+7bY5K5m6EY8XMo8cueOGF+N1Of37ZnlZNcT1zHT
         RAUQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3tBBdF5+LzybBlBCHQGIpAW3xHymzsoQSpGvLtk3KO2+5SjF4/NdKVZ+HFRi2xtwWN6J8JFczX1Ks9MolYdCo@lists.infradead.org
X-Gm-Message-State: AFq9FYIBbr2tNlywSOIoR6qWSjm7RRqFDST4luBjsf1UQkvzFeScKO8q
	nDRA27iUa5c61kWCyaME+vCy79vBU9WENO/jy5atUSZ62va23c64ZEQhiK2heAR/ZI8=
X-Gm-Gg: AYBFou13C9C7HHphugSuEJPSuF1foJDXBtejjuJNGq5zKMfddTNVXXrJDTCN2qhVT3e
	pmcr8VwYPm9cJfzHjUjqIaxIOFJZIqtyD5M5J5nURJlPSz5r4dB3Vi8AUVF9LAPBRIPJxa2Ednq
	a0m/g006WNH0mDqlHa5CfUZtM9RxaOOTukh7xv4eNgneSyRbQvfQaWaH+6TN7NmX0jdrlN1OtT+
	qpX+Yn9Xl/VpuJDk4yOcQE+dVYwRKjBztaWNOvswiXB/AiMt1X2FLrzfMxn1fH7IaA6lIWtGhqy
	sbdHDIIUeAz3C/eTX5WsPnhTmRQLC2C1zRc6gI7bkt7cZXXoblqYWXKG0Ihe6849Sbls8RtqpzP
	ko+zNa1kTQF8abHZz2/cSN6aS2vsdjcitDuF/KBFhpXMKTai5a729jC9iqsR5boiRyY7xAJeD7p
	5BTRIcm9cxw0doNMXIO2I+01akIGcfFBElvTGygPTTyzi4i9VEXY5BTnV8QHe9nUJy9ZcuYLLMJ
	qJxffi/v12Mqg78OvormLPc2OdnH2fxXRmFRDDo9K5rs+B9lnHRLUsaNd5kszi6QZCHLYEZZizn
	+SHOStnjzmUxqtssIhL1gZieaRsrP7oB5nPXg7qmXMd5n+ORAeqaUdmVA3sj0fnex5WWLUr0kQ=
	=
X-Received: by 2002:a05:7300:a206:b0:35d:8c39:b314 with SMTP id 5a478bee46e88-3674f22497bmr3602008eec.37.1792603066175;
        Wed, 21 Oct 2026 10:17:46 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:d059:e601:becb:a5ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367412b24e3sm7811387eec.19.2026.10.21.10.17.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 10:17:45 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	catalin.marinas@arm.com,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	emil@etsalapatis.com,
	fuad.tabba@linux.dev,
	ihor.solodrai@linux.dev,
	jolsa@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mark.rutland@arm.com,
	martin.lau@linux.dev,
	memxor@gmail.com,
	puranjay@kernel.org,
	song@kernel.org,
	will@kernel.org,
	xukuohai@huaweicloud.com,
	yonghong.song@linux.dev
Subject: [PATCH 6.6.y] bpf, arm64: Force 8-byte alignment for JIT buffer to prevent atomic tearing
Date: Wed, 21 Oct 2026 13:17:42 -0400
Message-ID: <20261021171742.310-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_101747_670482_247DEEA2 
X-CRM114-Status: GOOD (  16.10  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fuad Tabba <tabba@google.com>

[ Upstream commit ef06fd16d48704eac868441d98d4ef083d8f3d07 ]

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
Acked-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/r/20260226075525.233321-1-tabba@google.com
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
Assisted-by: LLM
[ Backport to 6.6.y: Request eight-byte image alignment from
  bpf_jit_binary_alloc(); this target does not use the upstream pack
  allocator. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-23383 to 6.6.y.

The backport requests the same eight-byte JIT image alignment from the
older allocator. See the bracketed backport note above.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: the ARM64 JIT
object with BPF_SYSCALL=y, BPF_JIT=y and WERROR=y; no runtime testing.

Thanks,
Artem Dinaburg

 arch/arm64/net/bpf_jit_comp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 9fd0b658e4602bec2be466665d880a355e5bac1a..c5f7276ad1af7e32b69eb9bb5c0f14c3feaa74e8 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1648,7 +1648,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	extable_offset = round_up(prog_size + PLT_TARGET_SIZE, extable_align);
 	image_size = extable_offset + extable_size;
 	header = bpf_jit_binary_alloc(image_size, &image_ptr,
-				      sizeof(u32), jit_fill_hole);
+				      sizeof(u64), jit_fill_hole);
 	if (header == NULL) {
 		prog = orig_prog;
 		goto out_off;

