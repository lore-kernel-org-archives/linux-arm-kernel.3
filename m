Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DC6C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 00:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Rdm+DMFLjMvv+NguyHjkOhkHmAT248a3xbKGiCO4bU=; b=mHzoaAFXXOpkCcsc3BSuhOm3lS
	OKyA5kq3PDUV0b9iT5QMvwysc+D9RqkxJmT0viGBuLCtuZrZv3QCxXD9Ph98v79N19tdgWR8kWEBE
	9qrPw7UCzxOwyR8I5HSn4FYhhfWSgcfd/AYdRvGR7cYx8kcbXB1S2UxvrYnjwaK86xpoKoovItd0B
	x0pUd5nb0GjFv6PRqnUSw1oNZaYcZBNTqKtHOl4K976Gb+5+joDSNxlu1OQXVBLjzYhn0sMiONdn3
	LY4sE9apXzd/kPUCsZzQrG2BTNuylqG1wDKNaRbgu3tjS9XSHo0OuQ+ghon1FPCJdTJh0tFeI7ajA
	5uBnlvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kYS-0000000CPaJ-1B1V;
	Thu, 24 Apr 2025 00:35:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kMk-0000000CNUw-3y1E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 00:23:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9979C5C062F;
	Thu, 24 Apr 2025 00:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23DCC4CEE2;
	Thu, 24 Apr 2025 00:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454177;
	bh=zkgW3SiDgnggtuRkQQ2RvOw/6rX9QtoTG8UCIHjtB6s=;
	h=From:To:Cc:Subject:Date:From;
	b=UO/B6EN63Q0MfszXeohxRiovANguNpxtJg/NNqgy8lk+bdQaa6mbu/8S4libCyQRR
	 HSIRMYpy+ZiYfoztydxN34bUyWR6KCKmB0xU7hRk8iYxvJIOIkrRWT8Zmc1uU02NsJ
	 xsBYWT37QGnF9rebc74+R/9OllnOrqij45u+GI7YlOwbQwtqkd0s2GL4hFXQmCr5GG
	 /n8N6mnXAy2GCs2mMHcQJVwFcppJhYXpQ5n4lleosLvV9DlnLFRP9uYCdskDE+QiTN
	 0YTC5KsqgM5kAzcadtPwXpGKAj+oluDbScYL38nyedfMU0m402zA/WhqIEhv3zsxYS
	 1+YvvpI7odh7g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 0/7] lib/crc: drop "glue" from filenames
Date: Wed, 23 Apr 2025 17:20:31 -0700
Message-ID: <20250424002038.179114-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_172259_073162_6CC25EEC 
X-CRM114-Status: UNSURE (   6.14  )
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

This series fixes an odd naming convention that was unnecessarily
carried over from the original Crypto API code.

I'm planning to take this via the crc tree.

Eric Biggers (7):
  arm/crc: drop "glue" from filenames
  arm64/crc: drop "glue" from filenames
  powerpc/crc: drop "glue" from filenames
  powerpc/crc: rename crc32-vpmsum_core.S to crc-vpmsum-template.S
  s390/crc: drop "glue" from filenames
  sparc/crc: drop "glue" from filenames
  x86/crc: drop "glue" from filenames

 arch/arm/lib/Makefile                                       | 4 ++--
 arch/arm/lib/{crc-t10dif-glue.c => crc-t10dif.c}            | 0
 arch/arm/lib/{crc32-glue.c => crc32.c}                      | 0
 arch/arm64/lib/Makefile                                     | 4 ++--
 arch/arm64/lib/{crc-t10dif-glue.c => crc-t10dif.c}          | 0
 arch/arm64/lib/{crc32.S => crc32-core.S}                    | 0
 arch/arm64/lib/{crc32-glue.c => crc32.c}                    | 0
 arch/powerpc/lib/Makefile                                   | 4 ++--
 arch/powerpc/lib/{crc-t10dif-glue.c => crc-t10dif.c}        | 0
 .../lib/{crc32-vpmsum_core.S => crc-vpmsum-template.S}      | 0
 arch/powerpc/lib/{crc32-glue.c => crc32.c}                  | 0
 arch/powerpc/lib/crc32c-vpmsum_asm.S                        | 2 +-
 arch/powerpc/lib/crct10dif-vpmsum_asm.S                     | 2 +-
 arch/s390/lib/Makefile                                      | 2 +-
 arch/s390/lib/{crc32-glue.c => crc32.c}                     | 0
 arch/sparc/lib/Makefile                                     | 2 +-
 arch/sparc/lib/{crc32_glue.c => crc32.c}                    | 2 +-
 arch/x86/lib/Makefile                                       | 6 +++---
 arch/x86/lib/{crc-t10dif-glue.c => crc-t10dif.c}            | 0
 arch/x86/lib/{crc32-glue.c => crc32.c}                      | 0
 arch/x86/lib/{crc64-glue.c => crc64.c}                      | 0
 21 files changed, 14 insertions(+), 14 deletions(-)
 rename arch/arm/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
 rename arch/arm/lib/{crc32-glue.c => crc32.c} (100%)
 rename arch/arm64/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
 rename arch/arm64/lib/{crc32.S => crc32-core.S} (100%)
 rename arch/arm64/lib/{crc32-glue.c => crc32.c} (100%)
 rename arch/powerpc/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
 rename arch/powerpc/lib/{crc32-vpmsum_core.S => crc-vpmsum-template.S} (100%)
 rename arch/powerpc/lib/{crc32-glue.c => crc32.c} (100%)
 rename arch/s390/lib/{crc32-glue.c => crc32.c} (100%)
 rename arch/sparc/lib/{crc32_glue.c => crc32.c} (97%)
 rename arch/x86/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
 rename arch/x86/lib/{crc32-glue.c => crc32.c} (100%)
 rename arch/x86/lib/{crc64-glue.c => crc64.c} (100%)

base-commit: 1ec3d4ff5c77422927896c1f7d0ed01267ec1213
-- 
2.49.0


