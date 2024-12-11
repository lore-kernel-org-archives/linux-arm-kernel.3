Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AECE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 01:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfPZuN0CH+PS9CIjMLJ4oPxU6y6fCuvkVBcOnd937/U=; b=ObisZ/zIwiEMlR1PWi03Xzx9cU
	F+/7Yf9fnICEl/dWlWPkpWQ4qxuYlWHz+ktaHdOJ4KWdGRjD4EczddNFKzdWyPosUYKdUZ7Y4NAA4
	zy03NLbS9/2cSYDzlkDwv7c2ial4pDLuDdg9/5g/rwqs5/9PQ2YYoos0NBqW2JxxKwEQayWmvo421
	8GY5ZjeZKRNXMjRuPQnPeCGyAi2dW7vl7obLlisrejvCC0cShnSC3UMndklonN9uuT+yw7bz1zAHT
	0vf4dxoThyj4yoaBXZUMuMabumU3o1w2WD6paZPSFJbCePdHy15tFnVQq998UYhzsqtTt7l24fZOC
	GrSVCtTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBGb-0000000DNnH-3SGM;
	Wed, 11 Dec 2024 01:11:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLB9f-0000000DMTd-2Gsp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 01:04:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92A975C6491;
	Wed, 11 Dec 2024 01:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D76FC4CEDE;
	Wed, 11 Dec 2024 01:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733879082;
	bh=TIHTphWBuVOkUDtoZBC1frDZIcBdWo09SQC7mFjqspw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RJIzxGO9ObOgo4oihtpBf38kU5wUdj9l4zW3P4wo7xEyRvnIw7g+d8J+qttSdL5XR
	 gIlQs7VlHPrmfZPLrzt6UYCYKAeNR7CxLmBA1eOJSQF+dzFog9vV9OsqbuSxuEiYch
	 gYi0PS5Z66LX1yfdSaILRs+zeJxSKhvviXO+ojtyLKFczernfbcJJjoq0MJWDJDRnD
	 YN136ycnoj0y0yM3MxlODW98SPnT0L9MdSyLRsd9sxkeVWeKm/17RXMX65jKPYruBo
	 GLAJ5AD6CPvUjMViyIyIDzS56knZgkQQoLBjZa5s30nFPuD3cKSLBxeygnYs77cntb
	 y5c5zxZ2kokkQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Dec 2024 01:02:51 +0000
Subject: [PATCH v4 6/9] arm64/sysreg: Update ID_AA64ISAR2_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-arm64-2024-dpisa-v4-6-0fd403876df2@kernel.org>
References: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
In-Reply-To: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=827; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TIHTphWBuVOkUDtoZBC1frDZIcBdWo09SQC7mFjqspw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnWOUThsm18uEZtQLS9pYRiLAL4lh6QYuVYwITO2XT
 DTeVQQ+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1jlEwAKCRAk1otyXVSH0OvpB/
 0XPMGf/WfzIbveT4gNjNboBw7DD62/YxmpCCoPr/Q4BCY9k1xkCplBqi3c7E51jqf6MYkf0nGbBdvz
 WYHcklfjIUIAYgIV3KfrpKzL93LIqbEgTNO29gEMjOcoNlZ8x5WfMsodfOjI/Ux7ig7BQ4aDpR7S2r
 gFsKNEyUgTP7novphMpBMGg7CgP5dW3ywHZe9mr9tzcI333uQdAnBV9HsNBlxZ9/dXiAokuUvaK+g3
 bwEK91IPZrTUoHMynJqsjXCyftINTo4sM/32BttYVWVWJVlUlBEL3TuPFcGfN2AS1TIKIYIvNf42Tv
 cKOoIWqh2OM2s5vE5mv2MZ5PWNLJ28
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_170443_621766_DF5E29D6 
X-CRM114-Status: UNSURE (   8.84  )
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

DDI0601 2024-09 introduces new features which are enumerated via
ID_AA64ISAR2_EL1, update the sysreg file to reflect these updates.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index d78b12c59658b480739ae797f5ea2c2f14d8d765..724762f0c1db223b5772f4f1b27720facb428bf1 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1556,12 +1556,16 @@ EndEnum
 UnsignedEnum	55:52	CSSC
 	0b0000	NI
 	0b0001	IMP
+	0b0010	CMPBR
 EndEnum
 UnsignedEnum	51:48	RPRFM
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	47:44
+UnsignedEnum	47:44	PCDPHINT
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 UnsignedEnum	43:40	PRFMSLC
 	0b0000	NI
 	0b0001	IMP

-- 
2.39.5


