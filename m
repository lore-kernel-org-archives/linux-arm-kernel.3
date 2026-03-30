Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FF51061B06
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NOkrzrTjjTACmNiGF56/T84mVdPyPdwWowe3bIZaw50=; b=kPodVJx8Hk8ffB+6kySk9ZBi4Y
	fImxahpzpqXSV+22KCWecHLDidkzzsVnhOau6/XVX3k8i+WErD8ZsGGhjKMMJGY1mWZUyV6v4q4mh
	lILV3VfQky2GOkAiW4VLHCIHI9GjcLRoMy/cIAJZbsNxquXcnLYL1vfmmlghyaAHOIIo24x13VSNR
	OLj0sxff4bjThhZlB7P0Ao9J7f/rP79qIAr4xrIgDJNU3p/qdsvW0d8Ej+b1Xi8acC1KuHY7ubWC0
	QtXJuDHHMEW3HMtyZ3Myiv4zmATslnyrpdfkWOVe1cHuOJUepk5DVxiyIqbIZCmFZOpE50Ef7gubD
	nN5qy76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dt5-0000000BS48-2Sto;
	Mon, 30 Mar 2026 14:46:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dt3-0000000BS40-3z0J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:46:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11C04600AE;
	Mon, 30 Mar 2026 14:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA92C2BCB2;
	Mon, 30 Mar 2026 14:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882000;
	bh=MnnqFIN2vC8heU3/zvcEJ/dikTf9Y4MoH+gFtljmtJY=;
	h=From:To:Cc:Subject:Date:From;
	b=USMzJB4N+pOL5ujlqYguF3cwn18bdH6PH/lIot1UdUzd/15yyv1GGfpgT531q1S2j
	 jSSDRVZrwhveQHA9YgDSLHjNmNeWWRxIjgoFvF8BXsriXNo3ZKldSYGsRJfXwL1cAG
	 qWzxH0EjbL8qIo1B8kEMX7f1CHVeXGEMBe0GOfCj1rZCbadqrgo1azNW9H0REuuzWe
	 Y3ZnYcs1KHnozZDjGn/4C9QxXpZ7eoCCoFLJjxDPkP0tAhWrcZgAxX0FP2qZzXrEPt
	 RYL3ytrW3muZg0vSq1ALlLWUK+tv+D/gRy2FL0mBTo+R9EcC41Pux83TcSxW8FnHdO
	 VmaQlPfVUE6VA==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Demian Shulhan <demyansh@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 0/5] crc64: Tweak intrinsics code and enable it for ARM
Date: Mon, 30 Mar 2026 16:46:31 +0200
Message-ID: <20260330144630.33026-7-ardb@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=ardb@kernel.org; h=from:subject; bh=MnnqFIN2vC8heU3/zvcEJ/dikTf9Y4MoH+gFtljmtJY=; b=owGbwMvMwCn83sBh/rljoYmMp9WSGDJP9RwX/5f5PeeeRbFV6GpFiYTbW51c7GrKHzmyTF7hm 1pePLGmYyoLgzAng6yYIstO5Zzu1y6i7/QVKnNg5rAygQxh4OIUgIls7WFsmL2oszC5699FcYZr efz+la/FM3cEZy15fGD+PSuJO4W/Q6/zRz5TcuCJDzrYlWPBensHY32x7uJyw1rtN1Huu/m+LTa /tfftb8tL0b83duVFFog2rbyR9/ZhQ8y1N7+Ot5S+D996vxkA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
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

Apply some tweaks to the new arm64 crc64 NEON intrinsics code, and wire
it up for the 32-bit ARM build. Note that true 32-bit ARM CPUs usually
don't implement the prerequisite 64x64 PMULL instructions, but 32-bit
kernels are commonly used on 64-bit capable hardware too, which do
implement the 32-bit versions of the crypto instructions if they are
implemented for the 64-bit ISA (as per the architecture).

Cc: Demian Shulhan <demyansh@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>

Ard Biesheuvel (5):
  lib/crc: arm64: Drop unnecessary chunking logic from crc64
  lib/crc: arm64: Use existing macros for kernel-mode FPU cflags
  ARM: Add a neon-intrinsics.h header like on arm64
  lib/crc: arm64: Simplify intrinsics implementation
  lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64

 Documentation/arch/arm/kernel_mode_neon.rst |   4 +-
 arch/arm/include/asm/neon-intrinsics.h      |  64 ++++++++++++
 lib/crc/Kconfig                             |   1 +
 lib/crc/Makefile                            |   8 +-
 lib/crc/arm/crc64.h                         |  36 +++++++
 lib/crc/arm64/crc64-neon-inner.c            | 108 ++++++++++++--------
 lib/crc/arm64/crc64.h                       |  12 +--
 7 files changed, 179 insertions(+), 54 deletions(-)
 create mode 100644 arch/arm/include/asm/neon-intrinsics.h
 create mode 100644 lib/crc/arm/crc64.h


base-commit: 63432fd625372a0e79fb00a4009af204f4edc013
-- 
2.53.0.1018.g2bb0e51243-goog


