Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE61C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 19:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWKdz3JjvBdWuvOM6XAtmb0QINEsI1qn45G5e91+shs=; b=qBGyayP8lEscKsY4wyqwZ1hWjn
	KwBp1PfYdUI6e0uONICUJ6HR3IYp1ej5h/bo+toO9Pk85UUOJclSjG+WlHkNhwWMmjz9NWHzc89+D
	MsS9fmpImN8LLxFk8VT59olLyMC+Kg4k1zOYkDWjwEGtJD6Nz27eTbd26ugGftfD9AOp2NOv49Cij
	TE86zdGCqLJoa+46aeXb0poIkg6lZpxwWdP/Mwk+38S08N1edpq24fFOeRHoK3Ddbnf+Wgo1405z+
	sw50vRz9ZWZLS2T+MmT2m1gr3aZKgjjupK6ghdw6prMyoiXugu0xyU4Xm9cY/Z+JtN9akigjfOj4M
	xwJw43FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEO9-0000000Gra9-3o0P;
	Wed, 12 Aug 2026 19:13:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEO6-0000000GrZS-2lBC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 19:13:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45F3443B7B;
	Wed, 12 Aug 2026 19:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459D51F00A3A;
	Wed, 12 Aug 2026 19:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786561998;
	bh=MWKdz3JjvBdWuvOM6XAtmb0QINEsI1qn45G5e91+shs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ch10FdKCYrPAge4YrDIKurVwiVkcvI3avuxDVD/hpNb9oGd2q0ZKs/9Y8EYdE2Hh6
	 gHN2OIvPlLdUp+87f/j187KDkiHw3290k2QmmiWTFqQ4K2165XVwWeQU2Rp0fabGmZ
	 6qXO3/nhIKt3c38zW6eoVcIGZMFGsbtuTPrWcw9rvAkoS6nn0WkyC1BO0vVjE0o5P9
	 1MBHvmsLmPc6urMKU1Ey4n4gA1oHxHuWWrLDtqVStUfPNzH0f/iTVv7OWM5iX4aBno
	 ecqKsv0qp6yXjsWGrBBN/F9vn/bRhp3OODdZ0djeaoxZZZDYOFi8L+G5z6/iqfcbvX
	 MXHxW3iMj/bug==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Aug 2026 20:12:00 +0100
Subject: [PATCH v19 01/14] arm64/gcs: Ensure FGTs for EL1 GCS instructions
 are disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-arm64-gcs-v19-1-9105afd828ac@kernel.org>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
In-Reply-To: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DZmwxJP+W8fGWvn/wOKVMifNip3avlrIAIcelKvVs+o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfMW6RedFIHw3NdjVXn4+RQSWMjajzdkv9Vt/S
 +f/MmP6zhiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanzFugAKCRAk1otyXVSH
 0KhHB/9wfTWobWZqN3e8DvFY3Owj3Ai5t96DelDcqPkBKnT2iBecIiC+nl9PbHRyf4PDmbdjw5a
 hIZXrAb9UtOIQ4/MuZMK85oaTmuu+y0ptI0Ge0Mr75s6dNdTbD5LQk1PzRvnHPSGVfgMNMSPhyV
 rFXPEfEUuXF+K149gtkN4Nrt9R0okPxOUHjpLULia57/n9HWhJwbkeZgprtG8RZZkmRQH1vvErO
 4V+gRJzt7pUKzilNuA1CSV4M5FE4BQXAgunpUtobxh3g/jX9R6Dsm3HugxjDdl9zIeDoZVxlW+B
 kRQEmKCAJC7EmC7pK5vg6XhzxAsLtkghqzzzdSKQtJVHXbhB
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


