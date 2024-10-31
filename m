Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49D3D767FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 19:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ChYcAA2qKI/rrmzofIPEpBKnSSfo9Mhb1y+B+IlatKY=; b=3O50USnfqpOrz1/4GqV1xXyxsu
	9onY7adD7X9W0BuhPjyEgo8hdxv/nksBYC0uGI1s0JXcuYGSaRHF1wLeqmNmrzdpdsgCjkKCQr5Pt
	AmMnlwVMYIjWrUlMn0smQkP+TwXOD5Ub1vm41i/Rgt/8RcPcmb/VwbR7fConqp4Ej4bE31yQzqQQU
	yciX9gL3/R3kob+nWO6AoK1YR+q+NHA5pBZUKddCyVAUsnadqttvu1yxBZv32rygUfqi/VishS2W1
	fRTnJGJPxnZTiC640PyQzrColh0gxg+BwU9byv9rj30nJqReS9SlRVGzrCcPfq1MBaJMcrh/LX3K/
	YdWphq3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6alW-00000004ci7-0dNN;
	Thu, 31 Oct 2024 19:23:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ajq-00000004cKV-0EQa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 19:21:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A01F7A44910;
	Thu, 31 Oct 2024 19:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D72CC4CED3;
	Thu, 31 Oct 2024 19:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730402504;
	bh=0ZSgsybRkNgA//hqHaFbgWNG+1PnzRnJxZ3UfA4h9Rs=;
	h=From:Date:Subject:To:Cc:From;
	b=jAotM7qdJB81uguvOPNpxfpjVngo51BMHoiWwhXcNwIr86J2udKL3utXN7I8nPX9D
	 0i5FNYPAvnweqqvT0bm0XYe1PtZ4mKOgF9eoqRskXUjc/MV0MJOAxvbjx8vDBLL7P1
	 IznFmDgKZJ7m4+clMiJKYbYRyJU4OKXSAaSTe6KFtu/wypGH16NGKR5dtJ8HUyWrwK
	 hP1l9PZWShs9wx8rvpOQOXdW8JG7Xn42JrzsKZWz6Qs/Eue1hHS889sSa5NlOJYFPo
	 bqg91tOQdWR2/9gmviQwUdmeISpwPXAxxQ35CttsiqQfOsDQ8Q+NPVHYR5rKsPIGtb
	 UOSjGJZfOXQSg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 31 Oct 2024 19:21:38 +0000
Subject: [PATCH] arm64/gcs: Fix outdated ptrace documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-arm64-gcs-doc-disable-v1-1-d7f6ded62046@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMHYI2cC/x3MwQqDMAyA4VeRnA0krp2wVxkeahtdwLWjARHEd
 1/x+B3+/wSTqmLw6k6osqtpyQ3cdxA/Ia+CmpphoMExPRhD/T4drtEwlYhJLcyboDiKxOz9SAK
 t/VVZ9Li/7+m6/vrBbvZnAAAA
X-Change-ID: 20241031-arm64-gcs-doc-disable-e40c0115570e
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0ZSgsybRkNgA//hqHaFbgWNG+1PnzRnJxZ3UfA4h9Rs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnI9jG+FCHClvg5NARf9CZ3l7Gnyt4LVv9jrok91J5
 qnOg2QOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyPYxgAKCRAk1otyXVSH0GolB/
 9x7Rxxvu35bazi1kYivVoC5b5L6KYYjB5ulPK+yCDLHX1M2g2elshC33kBGGBQfzRF3JggFfO+88p8
 n20h9PE6vHwLrVDuNFBtsQrhgsVJ/rw+HfLsPeYmQCRljuCtnUUcmGX23ZtPv6h3rfIYE2WJh+lqlj
 vZWgVQyxmUNdT+moVsN+2SRNllvrhzUVbob4Z2ynSYARcreMguOwoOJ3tGLUAYLxNjshJuKLVF/DcL
 88+iglT8m6AMP5OQN0oWaVN14FBlUNvt8uL3JSwQaMEtO2wfKYq+r4HpnjmXb23NY7hbmSWihugV69
 twT6cz31E1oSFzQJj4edC/qPaQK0Rz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_122146_254795_9EAF527D 
X-CRM114-Status: GOOD (  13.48  )
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

The ptrace documentation for GCS was written prior to the implementation of
clone3() when we still blocked enabling of GCS via ptrace. This restriction
was relaxed as part of implementing clone3() support since we implemented
support for the GCS not being managed by the kernel but the documentation
still mentions the restriction. Update the documentation to reflect what
was merged.

We have not yet merged clone3() itself but all the support other than in
clone() itself is there.

Fixes: 7058bf87cd59 ("arm64/gcs: Document the ABI for Guarded Control Stacks")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/gcs.rst | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/arm64/gcs.rst b/Documentation/arch/arm64/gcs.rst
index af58d9151cb72df9058ddccadb2602127b479c95..1f65a3193e7765dce9bfd6ad88b9fbd6a225ed86 100644
--- a/Documentation/arch/arm64/gcs.rst
+++ b/Documentation/arch/arm64/gcs.rst
@@ -204,11 +204,8 @@ When returning from a signal handler:
 * A new regset NT_ARM_GCS is defined for use with PTRACE_GETREGSET and
   PTRACE_SETREGSET.
 
-* Due to the complexity surrounding allocation and deallocation of stacks and
-  lack of practical application it is not possible to enable GCS via ptrace.
-  GCS may be disabled via the ptrace interface.
-
-* Other GCS modes may be configured via ptrace.
+* The GCS mode, including enable and disable, may be configured via ptrace.
+  If GCS is enabled via ptrace no new GCS will be allocated for the thread.
 
 * Configuration via ptrace ignores locking of GCS mode bits.
 

---
base-commit: 9b9be78258511e67767e4aa51f587cf22feb5065
change-id: 20241031-arm64-gcs-doc-disable-e40c0115570e

Best regards,
-- 
Mark Brown <broonie@kernel.org>


