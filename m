Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEC2C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 23:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWlLd/PWbYINVwpXcYMDnYu5TnVLNXcprwUMzPtexF8=; b=30PYdwy3IhRcdxbD+YICcX6ggt
	ZagbK8ll87GFLqRNeV3v2N89tgaiTTGupDnzkUkPtNKzeWqpTY+nMzbC2iD071maHJBQ9J2zXf+Jn
	C4qUFrYn/fX/CzOjhtBtLrIxgA2HDqVfo8sPHVcLcQR/8iva04Dxprfl+jLe+ZciqasXIU2sJ0ZhX
	zRe1VDhMgttOlJZBKP3BFjF63QF/gJUacBI2anrqTlpL0BR1ACQbsA9O+IARxz3RlbSMKt/KOyZLG
	OkXnCoFVyYH0DaGbqOidaJp1g4kGVE+F3Y1gTs7U91mlltX6MTBgDD67u+W7M2qYI6olEa2zQnG1u
	jkR5Hbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1r2-00000000etS-17Ni;
	Mon, 03 Aug 2026 23:13:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1qy-00000000esI-1Ca5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 23:13:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9ACBB60A59;
	Mon,  3 Aug 2026 23:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F49A1F00A3A;
	Mon,  3 Aug 2026 23:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785798831;
	bh=YWlLd/PWbYINVwpXcYMDnYu5TnVLNXcprwUMzPtexF8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=n1B1ZB7NZk/zoYIXJLELhvaOM9ee9r5LVdnVLFMQMZsrlnvmIdWA+QekBRoe3mAld
	 wP8pfbEDj80MlaUqf7PJI5to074itwnVO+jFmV0VJrRF06BnHYy1VH2v0Zq2JHYW11
	 VB9d352PsFVMr74/vovZl17L9KshF7Wd/TuxDLQ2c5ur2To0jmdIMYMeuDKp+uRtWV
	 zBXoGsy1zV0hu5UDplg/4twF1AI2CUGde8uqEUHTUUPV6sGINervfzYzN71HSqITe5
	 T/KEUrGie3wI1HZ71MxeNFGXkjyN4d6LOhVP0CX1jx5x9/KNA291EAt6LqEtDWPOhq
	 7bReHO3mfm8ig==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 03 Aug 2026 23:56:47 +0100
Subject: [PATCH v18 02/14] KVM: arm64: Fix FGT mapping for
 HFGITR_EL2.nGCSEPP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm64-gcs-v18-2-fd8c40f5ad88@kernel.org>
References: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
In-Reply-To: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cmvAQBxB4SuCRvDZjmRe7yIsmwDDWXuwPP1P7cDHpHg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcSCbkagjMfsbLEpGUmar5p5Ty1V7CBLnEKnXQ
 ra30SaQdMOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanEgmwAKCRAk1otyXVSH
 0PAhB/9mBKlZ9sVJgzTIjaFaUlLo2gm1JQgfsLOHRI6C9ty/0BN1X7qgdk6ZxWd3wzBBIPCYqrj
 IkzEXO5sLn18xJK+vWZxGakaHibAVq8z/fDea75/tAKJyMW3jK1i5Ypo218kwnr7TMA9crMVpV2
 x2H8Hxj9pFwJyoOrDU22vdQnfjMB8UhlTesrZaTvGn4IkKzHKGizQQ241EoRZz4o+vMsJ//EDsH
 ffcB2O+ppdot5+e/1l9sbdToya2Chjq0TTMyvSEJMMmqL/iJVNqPXLQmx8qpA0ni6iciKzN4+cN
 YTh1cd8OWdeVI7abMF8P7TUTR51VzLQa0mcGkLjbzWt6ViL+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

The encoding to trap mapping currently maps a FGT on OP_GCSPOPX to
HFGITR_EL2.nGCSEPP but as per DDI0601 2026-06 this FGT controls trapping
of GCSPUSHX and GCSPOPCX, and not the separate GCSPOPX instruction.
Update the mapping to reflect the architecture.

Fixes: 863ac38984a82 ("KVM: arm64: Add missing HFGITR_EL2 FGT entries to nested virt")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 3c82f392845d..b32742d9dd73 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1432,7 +1432,7 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	SR_FGT(OP_AT_S1E1A, 		HFGITR, ATS1E1A, 1),
 	SR_FGT(OP_COSP_RCTX, 		HFGITR, COSPRCTX, 1),
 	SR_FGT(OP_GCSPUSHX, 		HFGITR, nGCSEPP, 0),
-	SR_FGT(OP_GCSPOPX, 		HFGITR, nGCSEPP, 0),
+	SR_FGT(OP_GCSPOPCX, 		HFGITR, nGCSEPP, 0),
 	SR_FGT(OP_GCSPUSHM, 		HFGITR, nGCSPUSHM_EL1, 0),
 	SR_FGT(OP_BRB_IALL, 		HFGITR, nBRBIALL, 0),
 	SR_FGT(OP_BRB_INJ, 		HFGITR, nBRBINJ, 0),

-- 
2.47.3


