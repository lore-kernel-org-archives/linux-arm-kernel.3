Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDD2C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 23:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n91CihjOw5NQbnrzg6KvkpLWqDSB4Ugvpo6eFKwXwIg=; b=opaxi5mgEqxEnZ5ZzaLVPEPUfF
	ifkRh0doApEfuERthLS8JvQ4OPX9BkQ9t9JdzSCO25HR5UUI6vD9UMJvOdYnSiOuekt33wB03mGmI
	xPUGy/qaollObWB1IE/pUgdPG7BmChEzBCVIyzS/CnrFOgiWelZzn+HGjEftfyG4OtSyRNW+weG8J
	aLigYOwaNSNEuEXB3DkM2l1hTnbsOvZwpf8i9AMc7B1FTIfyKkjjttpOpbywLTRNRf5vy9b9bfz75
	VDKHAnFKBgIjZ3/h+YMOah286iugiozJvpNa1jhzsh+KY6OPEqS4XOHpWLgBuGhvk1V+V/H8B+EKo
	m2up6lSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYYi-00000000wDR-17EK;
	Sun, 06 Jul 2025 23:14:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYWN-00000000vmC-3nXn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 23:11:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CFE7F61460;
	Sun,  6 Jul 2025 23:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD73BC4CEED;
	Sun,  6 Jul 2025 23:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751843502;
	bh=b9yTjrbNlpjbYFfN/2AHdX2leYa4WC4arSWKY1vadb0=;
	h=From:To:Cc:Subject:Date:From;
	b=OcgXL7h3194Y0aIv2wQH6apRZAwSf0HabeYzKqhbhihK0xoL0941lDRb7Xe+jGttT
	 O/6lnzi8nfPVP2Loj7p7VmRPkips9NbcR0gZPfo0CA2BFqAVqr7TIc1oK8IXAIbsmQ
	 21VsPhleA6+028Qpb74BJUyUpWI872u39X5pOKYysujb7DRHhf0OML7q7e8j7JnMjE
	 rDqDs9hv1EybN+ia1p8fco/GX2BiC5VY8eej8Pj7fU3pEa0rwLIuBhdZ79aXwueVgn
	 EU2K2O7l1FgAvS4AufDsNoJY+wxXJRoleedNRRDlkXcE/3CzgZb9j3MfVaLHmLF5/+
	 dh5v2Zm3FhIHQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 0/5] lib/crypto: Poly1305 fixes
Date: Sun,  6 Jul 2025 16:10:55 -0700
Message-ID: <20250706231100.176113-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This series is also available at:                                                                        
                                                                        
    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git poly1305-fixes

This series fixes the arm, arm64, and x86 Poly1305 functions to not
corrupt random tasks' registers when called in the "wrong" context.  It
also fixes a performance regression on x86 with short messages.

This series is needed for my upcoming poly1305_kunit test to pass.

Eric Biggers (5):
  lib/crypto: arm/poly1305: Remove unneeded empty weak function
  lib/crypto: arm/poly1305: Fix register corruption in no-SIMD contexts
  lib/crypto: arm64/poly1305: Fix register corruption in no-SIMD
    contexts
  lib/crypto: x86/poly1305: Fix register corruption in no-SIMD contexts
  lib/crypto: x86/poly1305: Fix performance regression on short messages

 lib/crypto/arm/poly1305-glue.c   |  8 ++----
 lib/crypto/arm64/poly1305-glue.c |  3 +-
 lib/crypto/x86/poly1305_glue.c   | 48 +++++++++++++++++++++++++++++++-
 3 files changed, 51 insertions(+), 8 deletions(-)


base-commit: f1da28dfadd26ef95bbd0b1ddf066e7ffe1505ff
-- 
2.50.0


