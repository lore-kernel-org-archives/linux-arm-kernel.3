Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30166606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hyx3Ta7K;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvOP+GRe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dJwwgZepT61iJuK80D0VOZi9hRO7XI3X6avR3AOgfjw=; b=Hyx3Ta7K/GSG8lI98G2VckJm1K
	d7y896+A6xPNjiEW7EfTdWdLY+bOpTXIqeLvA+5xHfxTp6Pao2ZzFn5Hv+8S1eE282xj+DV7E4+bJ
	rQ/sZ6yckeydRyGG6JwlGlUbFKhoPDsT44czM8/90inAkuWFEGAxBaASn9AxaAF7WnhIzXy0JjaBa
	aEX6zpf0lfTBTNo50yOING2TPo3NIsIR3V7PsIEfI9Cu7cvX5TGXVKDOwUTffAik/EifGTI71pSQw
	X/WmEETFEOuHUokb2LbkyQKAdLc2SXYVG3TBSxoYdVDqr1dLxFxd8asarcD8udU/AxVH6n19UPUVt
	+1x0Mt0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0At-00000009ZbS-0oZW;
	Thu, 05 Nov 2026 16:18:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Ab-00000009ZQC-2LHl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 16:18:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0788F602D3;
	Thu,  5 Nov 2026 16:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFB61F00A15;
	Thu,  5 Nov 2026 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793895512;
	bh=dJwwgZepT61iJuK80D0VOZi9hRO7XI3X6avR3AOgfjw=;
	h=From:Subject:Date:To:Cc;
	b=mvOP+GReeU+1v52XCaFnBL9ClC5t7oxsgdBFVjXryZPJ6rgs1+BtF+FKhhVUCeT2f
	 iRXVNzqWSEtUYLXRqSzPEwLZrqRLh6BhBOsX62Qu35qqzDEUiGNsCNwlggjSWAIn2n
	 2plXyz4obcHsnI6k5zSbiAGJPgbiLI/cYaz31OwekCC2YCVge8HBE1IXTxVBHcTWoC
	 gW10UhJspfXgSv3F8g9VyEfBKFtw5A1eoQEowy3CYNtTe9tiEU5tCl2km9p9jxyE3Y
	 r+iK+d90aBv1xTG/CQsYMhJGbh5+eyw5qzbASkF0JOcRDvGCNUCtO8+vlF371pnqhR
	 Hy4QUV1yRnLKw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] arm64/suspend: Save more registers over suspend
Date: Thu, 05 Nov 2026 16:05:03 +0000
Message-Id: <20261105-arm64-fix-sysreg-suspend-v1-0-f4d9a99fec46@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADGp7GoC/yXMQQrCQAyF4auUrA00Q5xFryIuxmlaU3AsSStK6
 d0d6/KD9/4NXEzFoWs2MHmp67NU0KmBfE9lFNS+GkIbIlHLmOwRGQd9o3/cZERffZbS4znGwAM
 nJspQ77NJXR3py/VvX2+T5OXXg33/Agm9pvZ8AAAA
X-Change-ID: 20261104-arm64-fix-sysreg-suspend-56624f4a411c
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=763; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2ATZawLqBLUtwnOq5tqUFhonr+3ShvJg+pHfQAcax70=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLerAkt297FrWehZFT1a9vu8paPZxMYzvzf8DFNd8XMh
 8Vb5l/O7yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBE5rIx/NPwfyIvsr3U0s/C
 pPDTlRjjcw51E9/8P7dO6nNC/JELqx4y/FO/xnq9jUF2fulvXwHTk1IXjUpmuOt+mWxZpmNqdLG
 6hBUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While reviewing beeec0404622 (arm64: suspend: Save and restore
TPIDR2_EL0 across CPU suspend) I noticed some more registers that we
need to save over suspend, fix this.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      arm64: suspend: Save POR_EL0 over suspend
      arm64: suspend: Save GCS state over suspend

 arch/arm64/include/asm/suspend.h |  2 +-
 arch/arm64/mm/proc.S             | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)
---
base-commit: b0958b1397fb5ffdb995c0ccc74349841929c08d
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
change-id: 20261104-arm64-fix-sysreg-suspend-56624f4a411c

Best regards,
--  
Mark Brown <broonie@kernel.org>


