Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D19FCC07D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 22:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gb/5d66LjotcfkgZJbsB09wnOgpZrQCiED7rHaBD+VE=; b=c1dRO07nfz3WmtXPnQyutsJwWt
	HCWpXl77twYJHuGeOtmZrVqPqbfXVPkHFytKyJ9tAFdMJw7dllWpTUhyqRYzFweZgxxgQxBk99sUr
	vApFR5XU5RceaTgMgLlPwaca0AMWEd7zm87U5G9gPitdcY/rXIbBXVbb8tu1vhMN8BMje/ZwOMWq9
	Hom50Ue35g4sLHs35WPeqlMU5zIeUTgOcXlOcLajBlZROec3qk8lNgb+MUn7ZGiWzdbyNFBZ5w4s1
	2fM92CTt5rtdL9iDc4ZpVcatyw/KxKRBMiCr/tcEhn31tIZTDarN4D/1khHk4WiI0i/z+lGpTd4Vn
	SV8KK0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydQW-00000004ZPQ-3PQ9;
	Fri, 06 Mar 2026 22:13:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydQT-00000004ZO6-3RYN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 22:13:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EA581516;
	Fri,  6 Mar 2026 14:13:32 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E4FF73F7BD;
	Fri,  6 Mar 2026 14:13:35 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	puranjay@kernel.org,
	xukuohai@huaweicloud.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	richardcochran@gmail.com,
	a.s.protopopov@gmail.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 1/3] bpf: introduce gotox_point in bpf_insn_aux_data.
Date: Fri,  6 Mar 2026 22:13:28 +0000
Message-Id: <20260306221330.630971-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306221330.630971-1-yeoreum.yun@arm.com>
References: <20260306221330.630971-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_141341_897849_04611F6F 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

This is preparation patch to fix BTI exception with gotox.
To make JIT know whether instruction is gotox points,
Add gotox_point field in bpf_insn_aux_data.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 include/linux/bpf_verifier.h | 3 +++
 kernel/bpf/verifier.c        | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index ef8e45a362d9..92f4c252193e 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -588,6 +588,9 @@ struct bpf_insn_aux_data {
 	 * accepts callback function as a parameter.
 	 */
 	bool calls_callback;
+	/* true if instruction is destination of gotox.
+	 */
+	bool gotox_point;
 	/*
 	 * CFG strongly connected component this instruction belongs to,
 	 * zero if it is a singleton SCC.
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 401d6c4960ec..bf0281fb5db9 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -3973,6 +3973,11 @@ static bool is_jmp_point(struct bpf_verifier_env *env, int insn_idx)
 	return env->insn_aux_data[insn_idx].jmp_point;
 }
 
+static void mark_gotox_point(struct bpf_verifier_env *env, int idx)
+{
+	env->insn_aux_data[idx].gotox_point = true;
+}
+
 #define LR_FRAMENO_BITS	3
 #define LR_SPI_BITS	6
 #define LR_ENTRY_BITS	(LR_SPI_BITS + LR_FRAMENO_BITS + 1)
@@ -18720,6 +18725,7 @@ static int visit_gotox_insn(int t, struct bpf_verifier_env *env)
 		}
 
 		mark_jmp_point(env, w);
+		mark_gotox_point(env, w);
 
 		/* EXPLORED || DISCOVERED */
 		if (insn_state[w])
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


