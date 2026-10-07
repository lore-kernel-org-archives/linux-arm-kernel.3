Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BA1CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 13:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wtfk6Lo3EsHBs+T8tzPIBV8ntCV/DDfwOlEBXJdzuvY=; b=FJ3gylRRj578MpSXZUlKUo9mwO
	c0hiGBVoPdcuYi2OILHgDvRn+IOyF0jb1+sur0l9Wpn/mOCT0b68GgDfp7Gs6cL7T99FU+gPXukHE
	KzULfBPLUw1Fc4olkVpG3ZG0WjMcTAdPFcMxXd+EmUx2JgxFMhvghFKJ2NvucxiVPG3+LoeEwpvCo
	1qsEiEqdAfXd7vaCupijtHngkcsFN2jKfyLq0dKZdRpMTSz+6dWP3YIxAsnQHgTpe1/DpI2nIVJD/
	kEDLhtUBjVv8nT8VvEnusttdUthvcZqIAvkAQaHuGqharPquIhk57F5YoHvAJhPXwvKpnIr/9aKv/
	x7c3n6iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERJg-00000002V57-3XmT;
	Wed, 07 Oct 2026 13:04:16 +0000
Received: from mail-wm2-x06.google.com ([2a00:1450:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERJc-00000002V3t-46Z2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 13:04:15 +0000
Received: by mail-wm2-x06.google.com with SMTP id 5b1f17b1804b1-4a01c6c0f64so8303345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 06:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791378250; x=1791983050; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wtfk6Lo3EsHBs+T8tzPIBV8ntCV/DDfwOlEBXJdzuvY=;
        b=A1ZX8WTv9L6+02YEKab8qnbyDlUslN/2PXJIQR+Ap8ZF2d9tlEKZ7UfoA9WmAgMBQc
         KdHV4FgG+sbZ+fBD+bAFFnk0nKM1+qOxGh10ndJ18qw3C3Cti8iKVBDleYjO8ldU/OJf
         MIjNejpOqNeBWbfP0AkUFrU64usnC+emVhs20untlPKmST1ocBwri4fokfHmywd+3Itq
         SoSQFLpUqlB2Q+OpvRAjYob6zu0KyBUZihIrNLDtjuWkOEZzpFCKbRfHhumJjHqBDGym
         bYSVvD/UkRRH7gTN6quSfdgJCEonrWDPy9wdnIIRAGfOKFQo+U6WwrV3VWZ4sAbDJ7UV
         CUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791378250; x=1791983050;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wtfk6Lo3EsHBs+T8tzPIBV8ntCV/DDfwOlEBXJdzuvY=;
        b=ZdZ23phtHrEgfmiKwZEW2+3KQkhcyh5z9ofZ6EqxKXzAdpYh6SWzM+nrgQ6w56W4uE
         latr2p/kSBhxMtyp/IMzRxwZ4XHPjxFsYSVdVn5rNELmhq4JqlUO4RRWZTvKsm9k2Mvw
         n73gS1v+6r5EEOH/7spni6QU1UkC56BqJeQstDZn+x8jCbjDJMCknCcHJDAur7FuOx6C
         Bm17zdZ50gxwsGJSS6zaB1mVkcpXzZfS1p5MSzp2MM+WWMQ9g8skG2ZgesvLear8F4s3
         7nr+00CYrJJ8t02b0E2pETyqGpnoDBQgkHbT9JcbJ4lh9gEM6Uw+b1M/X32hHabKGuIp
         AMdQ==
X-Forwarded-Encrypted: i=1; AKwUvByZ98J+snaijJX53YkOAD41K/u8H7G5LQS2XXNO/rQ2WbMM1szUdQuLXVPGYpexRzgzAlzkHXHw2EPCqMAFPJlm@lists.infradead.org
X-Gm-Message-State: AFuF++lzNdS3FMh2nzTweXKZZhk0iGfs5PmeQpjNkx+EhWh0rutPiugC
	Y5yOS36z3b+ahv1+BhQCaQATE7bDtEM+Wx716d3VIEDWbrwoTmXVOARd
X-Gm-Gg: AYBFou1XoucZjyVb7uLcGPfGf/WHfh4nodRqC8LYl4h5QnD7/qMQtKFYhfbSTHgLP7A
	oYVtnrqhTuJJD8IWq/9ncLJiXfoozoChm2b80Uvz/LcfdNtG31KDyvsSRysK62nU8cLmLSfY4BU
	A/p7XxfPhGBvfkgfySiANgqlQBJgwTHG0Nuyp9ejoXMnLj1xzbGkzaVq414WPj7auE5cgJjueO4
	yQs5FSQNr651/+MqpuHOmFAzOZYbtsuapaTBL9DjAnqXapqBU07VKTfqMyDLpGCQOEVmcO7LjBa
	1KEAXvdNDV2FUD80OWwVPeXitCJIbudPjj9qrydR9Ytbex06dCBBPQYO5/ZVVRyriYVPf/kFiMz
	4XHWEdGAo4QEomx0chSjOAjjcApvohjGDGX1mbZGP4xHxLqYs4IDKTxgTNJNqUtxfOW5LOYxv6W
	JpAh4y3uZLKM9QXhO2p8zc+BIFoLO0RpV/7pdCJT5wzOqkxYP4yuGsD8/mkzo8Ccg3FZ9mwuo83
	RCBimEhfuDCOY9S
X-Received: by 2002:a05:600c:c166:b0:49f:ce73:5e94 with SMTP id 5b1f17b1804b1-4a18065ab85mr38007345e9.34.1791378249855;
        Wed, 07 Oct 2026 06:04:09 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4482c4sm120825195e9.0.2026.10.07.06.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:04:07 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Zi Shen Lim <zlim.lnx@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>,
	Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Puranjay Mohan <puranjay@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10/5.15] bpf, arm64: Fix off-by-one in check_imm signed range check
Date: Wed,  7 Oct 2026 16:03:54 +0300
Message-ID: <20261007130355.119579-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_060413_214177_A6649103 
X-CRM114-Status: GOOD (  15.67  )
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

From: Daniel Borkmann <daniel@iogearbox.net>

commit 1dd8be4ec722ce54e4cace59f3a4ba658111b3ec upstream.

check_imm(bits, imm) is used in the arm64 BPF JIT to verify that
a branch displacement (in arm64 instruction units) fits into the
signed N-bit immediate field of a B, B.cond or CBZ/CBNZ encoding
before it is handed to the encoder. The macro currently tests for
(imm > 0 && imm >> bits) || (imm < 0 && ~imm >> bits) which admits
values in [-2^N, 2^N) — effectively a signed (N+1)-bit range. A
signed N-bit field only holds [-2^(N-1), 2^(N-1)), so the check
admits one extra bit of range on each side.

In particular, for check_imm19(), values in [2^18, 2^19) slip past
the check but do not fit into the 19-bit signed imm19 field of
B.cond. aarch64_insn_encode_immediate() then masks the raw value
into the 19-bit field, setting bit 18 (the sign bit) and flipping
a forward branch into a backward one. Same class of issue exists
for check_imm26() and the B/BL encoding. Shift by (bits - 1)
instead of bits so the actual signed N-bit range is enforced.

Fixes: e54bcde3d69d ("arm64: eBPF JIT compiler")
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
Reviewed-by: Puranjay Mohan <puranjay@kernel.org>
Link: https://lore.kernel.org/r/20260415121403.639619-2-daniel@iogearbox.net
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-53036

 arch/arm64/net/bpf_jit_comp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index e98fe8c006cc..b67764f8a5f1 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -494,8 +494,8 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 	int ret;
 
 #define check_imm(bits, imm) do {				\
-	if ((((imm) > 0) && ((imm) >> (bits))) ||		\
-	    (((imm) < 0) && (~(imm) >> (bits)))) {		\
+	if ((((imm) > 0) && ((imm) >> ((bits) - 1))) ||		\
+	    (((imm) < 0) && (~(imm) >> ((bits) - 1)))) {	\
 		pr_info("[%2d] imm=%d(0x%x) out of range\n",	\
 			i, imm, imm);				\
 		return -EINVAL;					\
-- 
2.53.0


