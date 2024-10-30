Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D17D6B6D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 20:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9lNt4LfOCgp3nDnbJMhrOMducTMBgRYFbVqS645kX4Q=; b=kPrKYJ9euGLTSX
	rSu/BZU7+7TdqDKZzsDlu7u/Ured1QkdOo4gGWl7XfYCwLh4cJbg948JHVMy+Fu2FLkNX0VniKsnl
	SGtv16tcJF2Z5U8/CPtIlOveieLyvdI5yxFt3S25R2ivdfuKfSfvnwxfA4OsKaq+o6KV8RcEch5R/
	749V2jM/LEOnzxFc4YUQET8AcVcUzHFMgidPk3xXqGCdsqHg7zvF+yWKDu9J8HtYQjUHNBsjygaOa
	EbLiB8acQH4E/ebIho848Wc8cXN5PDO6AvT5H1S3uNyvuTUg6Nytr+apz143fq2dxLS6XQZsA8Nr/
	GgEhQuROP5C9NBaZXP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Ff7-00000001jqT-3oXf;
	Wed, 30 Oct 2024 20:51:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6FdT-00000001jR7-04I8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 20:49:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F4525C54BC;
	Wed, 30 Oct 2024 20:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804A3C4CECE;
	Wed, 30 Oct 2024 20:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730321385;
	bh=+yvwE337Qdag2rGuNvdsfIda3dNqnIov5peBktID6b0=;
	h=From:Subject:Date:To:Cc:From;
	b=n/1jmtKzwNjxrgBgr0XHhgb5joWzPDKskC4fLKe8EGDkTBSzI/HcVjnV0CDBIxCtl
	 B+9fZMh4aMIaW6aHFZPAcBqfGLorbZmaAD60I3yJPVQ0Fi8MRqDz9w9UEK4iI7eqBY
	 X7Bf36R90rtMJVzm1LXgDWU8DxSXHENUszkIF0CEnf/1MXrGrk4TiD9Fx0VfKlJXb9
	 hOAOoy2mhUuTflyScniRBSJu3Lx0/QosykyAgjDEHQH2KDJJhnNm6tckVDim2UYTBq
	 CUn/R91nby6UcRpNXcub5SHAqgKJmGpzdfrpcaDyRBndP2ODXxulftFVazu/r2DTnv
	 fOXpyYsn1vDog==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] arm64/fp: Fix missing invalidation when working with
 in memory FP state
Date: Wed, 30 Oct 2024 20:23:49 +0000
Message-Id: <20241030-arm64-fpsimd-foreign-flush-v1-0-bd7bd66905a2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANaVImcC/x3MQQqEMAwAwK9IzgbaWgT9injo2lQDWiVBWZD+f
 cse5zIvKAmTwti8IPSw8pkrbNvAsoW8EnKsBmect6YzGOToPaZL+YiYTiFeM6b91g37wXYhOL/
 E4QM1uIQSf//5NJfyA/2/8d5sAAAA
X-Change-ID: 20241030-arm64-fpsimd-foreign-flush-6913aa24cd9b
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+yvwE337Qdag2rGuNvdsfIda3dNqnIov5peBktID6b0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnIpvlHIiKxtAocRm8OBK6Yaj+uT1brtqrjz3czmlG
 kLb0yaGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyKb5QAKCRAk1otyXVSH0E5RB/
 4s5DbIvSqJpDZMrMzsulo88M4R3g/tC8Nk8ioDiV9SYLMmPwAIr4PYSvIxaIga3ck4r80tFkT/bOqb
 LpEP72Ya7iAsBesvmh6McFvsRdqZ4rXzvlGOIIi7vjdmDU0NaqmPAp0m2MMkEa0U1BfzPYSkEQCQRr
 Who3UZks5d0DNAaDLUhP0rkTzrk9Mwz752Ut1Ngku9AtrRkQS32mjdw6ECjfIDM/LzsqkmleCrmp59
 LLc+z7IaJxSNnSZF7opBj++RRFKN8SdJHjwi6hCzgObDSerHDWbDXfkQvVVW6MkpRNKFsO6TtH+d4a
 JLZ6ytDa3w9bcJnTFUmO/79Tdkq3IY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_134947_138114_726C78D5 
X-CRM114-Status: UNSURE (   9.17  )
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

Mark Rutland identified a repeated pattern where we update the in memory
floating point state for tasks but do not invalidate the tracking of the
last CPU that the task's state was loaded on, meaning that we can
incorrectly fail to load the state from memory due to the checking in
fpsimd_thread_switch().  When we change the in-memory state we need to
also invalidate the last CPU information so that the state is corretly
identified as needing to be reloaded from memory.

This series adds the missing invalidations.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      arm64/sve: Flush foreign register state in sve_init_regs()
      arm64/sme: Flush foreign register state in do_sme_acc()

 arch/arm64/kernel/fpsimd.c | 3 +++
 1 file changed, 3 insertions(+)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241030-arm64-fpsimd-foreign-flush-6913aa24cd9b

Best regards,
-- 
Mark Brown <broonie@kernel.org>


