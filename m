Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E0FCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKz8NUqf954PmIay5EE/hIAKeXuaGdFZUwHX4OEdwvg=; b=pE+KBkehZ4mCEjAAZ+UWXf6bgy
	9+4DOkBbviMDyMp0wrQZcwrJ1vm2KeND9OuuuD3mmjjtP+hz8oTsz3e4UXbRt4+hm+YQ9bMqZCfqq
	WThXlREFVu6Ey+Dj1KnCdMefIf0+CwTwiWheIg4DXZxiqThIqx4uuyyZMmA/QG1MKRQYng/5AylJk
	EaQ4zUaGdiL41sIR08V5yRecO7WT8S+1NhHvA4pRnsMKWrrTO0J6t7/z4ZciNIJ7PPm/GOH+qegCR
	NVW0UttsnCJnq1jsIQEZ7HgjyGNQlPYb2PaIzlojywjoz+W700YJxl89Kw1UXlcDqYU6CtmbnDehu
	xM+aNjLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Nw-00000008i5i-1zaH;
	Mon, 18 Aug 2025 21:27:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5Uz-00000008ViQ-46Rc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 19:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B94345F1F;
	Mon, 18 Aug 2025 19:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06817C4CEEB;
	Mon, 18 Aug 2025 19:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755545189;
	bh=WuZkA+3W6xGa4E/TZchTSAE/H6G9gi5ov679T+TmFuI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JIk8LPIraA5qigmZ8M9b7LWFDtpBW0YZ0T2PP4XpGzOB2bLjSqHg09KbvFh8FSIKU
	 P+HNzDesyZC6q0ny07/MDt5gfqjf3hJNPgAicagMlmkAOJ5kC07+I/YNlcjkN9l0ZE
	 9QRRX0pnkWJafhhXBPXNUoGjWV/J+DaMNvhsOGSNW+FA5gL/sUppVJHwIE+EMa1y29
	 XBfC8jcbVCxoAgRQdLN6ipfPdSw8PyckHBGRqsq2HnPlLrnR6Oet7ms4QoQAzSze0n
	 KiyBCYgkqJdvJu7tiu3il8F03zFlGehLLxrwAeW5vwRyTdguUZw9HQx4tooG9sfa5G
	 zVLYCvuMgK7Qw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 18 Aug 2025 20:21:19 +0100
Subject: [PATCH v3 2/3] KVM: arm64: Expose FEAT_LSFE to guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-arm64-lsfe-v3-2-af6f4d66eb39@kernel.org>
References: <20250818-arm64-lsfe-v3-0-af6f4d66eb39@kernel.org>
In-Reply-To: <20250818-arm64-lsfe-v3-0-af6f4d66eb39@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WuZkA+3W6xGa4E/TZchTSAE/H6G9gi5ov679T+TmFuI=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhozFddGCUonZ74SrJEXuBqxgCyt/drfgy4XF66bbipXda
 C7xvneuk9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYyPEC9n+qm/+fajtxQW1N
 cxTTmXmNdq5bqkvkP+hWhtmfNq3qCNG87ZhoJiica33V7+HdVMtsyZzyeW5ZRi4xd17wpPnse2F
 +6ZKdyqKdf+UmhOqu+SssF3irfktb7rff/Z6LrKzO9uxmXf9hY9U5H3m/SZZXDxWFFz374sjxIc
 J74bfgHRqtpnMOlJvI7nGKY6p7Vrp7uyqbaNZK7T0FDvPX782qemZh4erz8uXJ/Ds7G7O563eG6
 gV08Il6xd/7LaS+a835uZ0OMSGl+3LEX3lsn14+YfqDdfsWttzg5QgO9rf5y1t9ovSg0p/9wY0T
 mQz/8SS5d9xlVWKfc7r8jk/oWTW3Ht+tT2ST4rxlk32aAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_122630_040468_905A7F62 
X-CRM114-Status: GOOD (  11.52  )
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

FEAT_LSFE (Large System Float Extension), providing atomic floating point
memory operations, is optional from v9.5. This feature adds no new
architectural state, expose the relevant ID register field to guests so
they can discover it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82ffb3b3b3cf..08e2cb94bff3 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1642,7 +1642,8 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 			val &= ~ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_WFxT);
 		break;
 	case SYS_ID_AA64ISAR3_EL1:
-		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_FAMINMAX;
+		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_LSFE |
+			ID_AA64ISAR3_EL1_FAMINMAX;
 		break;
 	case SYS_ID_AA64MMFR2_EL1:
 		val &= ~ID_AA64MMFR2_EL1_CCIDX_MASK;
@@ -2991,6 +2992,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 					ID_AA64ISAR2_EL1_APA3 |
 					ID_AA64ISAR2_EL1_GPA3)),
 	ID_WRITABLE(ID_AA64ISAR3_EL1, (ID_AA64ISAR3_EL1_FPRCVT |
+				       ID_AA64ISAR3_EL1_LSFE |
 				       ID_AA64ISAR3_EL1_FAMINMAX)),
 	ID_UNALLOCATED(6,4),
 	ID_UNALLOCATED(6,5),

-- 
2.39.5


