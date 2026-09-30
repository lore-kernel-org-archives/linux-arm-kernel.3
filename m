Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED67CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AoNn9IrRf6+2TK5gl+pKg760w1DAC/vdj1nXqae1ME=; b=Iu3pDK9nKvtLqaYbk9x/J+Mkvx
	rorb7TOnUYVl23sXBVLa6BR9iZ4awpzEDc5tbuFbYg/8A3Co9HYVe4nHPD0pyjSnwZVsdhofk2ZAz
	F5VR22RuVdiuILPGk/DGDdgWnZZV/eGg4FE3H+XpZFp2iPfWuWT9LyHrNvsNyv3+cBWts7sUDwwZ9
	jpXx2tcJHGuFxPyj6dFg8P7BrSnHlyqGSNc/4oQzjnZkH60LbN75qltcVV7P0GDqLJ8l1n0MPb4hW
	MldLDfXPyLNpthRKbj5WiB6RgKCJgf23TsR4Pbq/Tw23vVkeEl0kXMea8WbynarwVZFOzqhJYvOoc
	05FB0ytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2Ai-00000007IBz-1Koh;
	Wed, 30 Sep 2026 21:49:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2Ac-00000007IAL-0HeR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:48:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDC0E42A2A;
	Wed, 30 Sep 2026 21:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BE41F00899;
	Wed, 30 Sep 2026 21:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790804937;
	bh=6AoNn9IrRf6+2TK5gl+pKg760w1DAC/vdj1nXqae1ME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=E9AZvKsAKLNfMfxPf9Zy/5oBN2eggb1IM4PHjQv6fNe/uPCOmvKsdE4fZjIK+nSwp
	 VbFtaRYkHSPZsxLmL4sW7Fz739D/vnuraykqz2GebS2jtnZScf8E+6fpNQgSy+CWJN
	 Eb7T+gWoM2Fa8OYpl8/h5q5VPqDmtLkmA31rCd+CHtlFSa3mYvO4h5rPyiBSmi/7R0
	 Nw84k74TePaqhCzj+gp9bZxfSiNG+HvAqQWOug2yoObrmpWjFTO9WUABRgXSKZCjPd
	 BhnvkET0SDdKnAk8eplNTflbcfdbj5uDFNWbycXxpWCSDGbgaFR3QxQf/OsY98PbtA
	 WfLFaATgFc/ag==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Sep 2026 22:48:11 +0100
Subject: [PATCH v21 01/15] arm64/gcs: Ensure FGTs for EL1 GCS instructions
 are disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-arm64-gcs-v21-1-3556644cd927@kernel.org>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
In-Reply-To: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006; i=broonie@kernel.org;
 h=from:subject:message-id; bh=X1FgS+kMZP9ukBUAVhzrOqr7yryrwOBh9nVXlOvtkDc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqvYO07YPOw7wKvBJdXdYYLORf4er5mAip1k2qT
 +5jJaeLhbmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCar2DtAAKCRAk1otyXVSH
 0DwiB/0ec0wcYBdfjSINE9IKRpKNZ9OV/BS1v23AxKqTWwrunVfLuoRMx+jCLv/TY0e5TGlGAyK
 TPE9tF5BcmYAm11arvJ9Ar7BEuSJ089xAiS8uK+GVKmQPzWLJZzs9j56S+PAgswBOanvstwpPYq
 1PtCA/EydqKaGul6afJo6+T3zY+2NFtTEAavaC8Zxe3h169bb86RvEt4PtUs6XKjmyupcHSJkwF
 II6MZlPGOuKaoRQCvSsV7ph/Z+otkwaZ9v5XtgAwSdIUTRCIJOBlMNkvqTMJpqvKeq1rj2CMdH9
 OpE4b8tEmWW+9REjiE4ScnTXWBWEJ3CacDa82zRTB/gNOjVo
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

The initial EL2 setup for GCS did not include disabling of EL1 usage of
GCS instructions, also disable these traps.

Fixes: ff5181d8a2a8 ("arm64/gcs: Provide basic EL2 setup to allow GCS usage at EL0 and EL1")
Reviewed-by: Leonardo Bras <leo.bras@arm.com>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index aa8ec9df8024..d308c6e6757d 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -393,6 +393,11 @@
 	orr	x0, x0, #HFGRTR_EL2_nGCS_EL1_MASK
 	orr	x0, x0, #HFGRTR_EL2_nGCS_EL0_MASK
 
+	/* Disable traps of GCS instructions at EL1 */
+	orr	x2, x2, #HFGITR_EL2_nGCSEPP_MASK
+	orr	x2, x2, #HFGITR_EL2_nGCSSTR_EL1_MASK
+	orr	x2, x2, #HFGITR_EL2_nGCSPUSHM_EL1_MASK
+
 .Lskip_gce_fgt_\@:
 
 .Lset_fgt_\@:

-- 
2.47.3


