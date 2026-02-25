Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2FBEFD210
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AfljrNH9qdxqKmIU4kvMc13BAHxSq/ttgbIGBHEUq/E=; b=25tyJ+erGsMQQeCuaPPmIjvb3u
	zteTgT1mWQ22sChz/7/b3hU4ZdR6FzxSn8ek2pi8mBR8H1V6pc1ViSswdaVo8EWNpfZE5oLT8hdRW
	wK/sUYTID4/Oizydv6WQKq3njMhqr4N3qjj/MfvROB/9hq1b7A/cC3dnat375kgLUeIG94rRSvsoz
	/FfNNdv0touIhKtpZW5cCXbjRzwuCZX6M5NUS6VDsj8RSyJc9amg83eMuOIWaefCnAINPuVl8m4/P
	do8cRgESzhAdo+ck4BR8gjf7jHx/Asmn4t4AUxoSEtgS3OexojljbX4Ho/AGhHcItDl0yurwRnzHt
	VSLwdUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAy5-00000003e5c-2uP0;
	Wed, 25 Feb 2026 09:14:05 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAy2-00000003e5B-469x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:14:04 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b8f5bce308dso651258966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 01:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772010841; x=1772615641; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AfljrNH9qdxqKmIU4kvMc13BAHxSq/ttgbIGBHEUq/E=;
        b=ugybtjSkkNA7TIDc991d6gR/wgBt0czcL7QcBl7ZE+P/jdsTZA2MmETPM802t/bXDK
         FJZxsAY8AepSomel7UqVSJ24gN+pn/mhvY/HSzUDqlO0kOhS+bCs7UTfR6X7rrKHtIam
         ehYqMmCFwzLiaumdo2tlgdj//MRU/+0iRhzaaGekxElDhw3VaZjKMPixcCY5OVh0dfNq
         mJu4VZX4enFTkqA3DRHdfMM8MX1EjbimtmrdiRVPglgHJNq787kKwTA8PJgog4omR3as
         UjTKzvplRoPllDBnIUqBAVX+lINHgLCdoLFw6+frqUMEhsN+fBs41eEY9hDt0YgJu+G5
         Q1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772010841; x=1772615641;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AfljrNH9qdxqKmIU4kvMc13BAHxSq/ttgbIGBHEUq/E=;
        b=wIrQA3weLeBcjz6SrktBc+OAASQp/e7mWd2o55eRzMBzpKLMD8Qsw7gR9lWnLiTPla
         I+pp/N9N8Q/fccnrT28weRWoSfwusziBDJXrI5IfVJQY8Gj3YKr5p2oE/440sOEVBZFD
         p6cOdHgzKhg0L3VsJFp5c5Bf+hA/f0bpE8haApdHYg32PF6tToCJpWsCBhXQgOpzM9S+
         qahwX8SCnIxWEsfqXeJUGbLwn0NN6n0pX20UVU50ee2pKOAvCWDr/fzH8dR7TVJoR+in
         tlQYB0VT/nLxKjB1fK/lTIZUF4rMWFo90YRYfJiz99pg/kUiDeeWjkr7ZBCswjrWTwDd
         gFKw==
X-Forwarded-Encrypted: i=1; AJvYcCXayFMgLMKsN9usBYmwUIit6ppnvrXKn6iUtC4noH17govVyKqoaQBTWKwmlHzV0KUd6O6MA5yH2QDOsZxKSMAJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwL/Omk0+/h0ObpK5wdZTnY/KJrBv4Psx0m+qvnjt2lkLCtNJET
	A2djaM7N3hvmL8tUg+YXSXEWAa0KE2e6EZtqpZijzEScduXbf6F0kS0e5iPk29bb8U+iXxUHwFQ
	qgw==
X-Received: from edvb20.prod.google.com ([2002:a05:6402:1394:b0:65a:19ec:9a9f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:d06:b0:b8f:a26e:dec4
 with SMTP id a640c23a62f3a-b90819557c5mr995121566b.7.1772010840499; Wed, 25
 Feb 2026 01:14:00 -0800 (PST)
Date: Wed, 25 Feb 2026 09:13:59 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260225091359.3299924-1-tabba@google.com>
Subject: [PATCH v2] arm64: bpf: Fix UBSAN misaligned access in BPF JIT
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
X-CRM114-CacheID: sfid-20260225_011403_020182_6C06B863 
X-CRM114-Status: GOOD (  12.17  )
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

struct bpf_plt contains a u64 'target' field, but the struct itself is
often placed at 4-byte aligned offsets in the BPF JIT buffer. This
causes UBSAN to report misaligned-access warnings when dereferencing the
structure.

To pacify UBSAN and signal the compiler about the layout without
over-aligning the entire JIT buffer allocation, mark struct bpf_plt as
__packed.

No functional change intended.

Suggested-by: Will Deacon <will@kernel.org>
Fixes: b2ad54e1533e9 ("bpf, arm64: Build branch-target-identification-enabled BPF trampolines")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/net/bpf_jit_comp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 356d33c7a4ae..fc8c74c29bd6 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -98,7 +98,7 @@ struct bpf_plt {
 	u32 insn_ldr; /* load target */
 	u32 insn_br;  /* branch to target */
 	u64 target;   /* target value */
-};
+} __packed;
 
 #define PLT_TARGET_SIZE   sizeof_field(struct bpf_plt, target)
 #define PLT_TARGET_OFFSET offsetof(struct bpf_plt, target)
-- 
2.53.0.473.g4a7958ca14-goog


