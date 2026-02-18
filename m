Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963CFE9A04B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 21:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XisRzfY1hQcuXqC3hkJsOcxMhuRqBwbDquUazg2syqQ=; b=a0U8QIME94VYnX/ZT0e/g5Leva
	EyAEfu9lNnyulEz2ZHv97xCDiwceuhBAiUb4a3pDD8hcUuPzbnAvzPuWqLCqS1V3TMKejdAvHNYup
	HU2o5n/xtEjktsA/VHQCcBeWI+P1A8je0ATjTqUO7OYi65F26eZAus+x2W/H2N9WHZvMSPfJsx+6U
	RpreI+5qzk83QyeLR9quAh/WzTJJF4KjaTf1DomPFD6Fjt/HDoqVVzrxp73mSjECHyKTkx0DB8THu
	IX0XPPculrRSDaxa15175alESLs7531CZGeMcgQ8wLnQkIY/rwufW8Mj0y87RfuLnR2xZNSkiwTwY
	eAgpPIXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspE7-0000000ASQd-0sBd;
	Wed, 18 Feb 2026 21:36:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspE3-0000000ASO9-0kxw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 21:36:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F311F43738;
	Wed, 18 Feb 2026 21:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65688C19421;
	Wed, 18 Feb 2026 21:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771450609;
	bh=wf8/GUqvoI3GfA7MCp1kWAe/s3LxP5yqBgsjAILj20U=;
	h=From:To:Cc:Subject:Date:From;
	b=ZieEykj75bB8BK4FB/0RkIiO554XHDyNUfjzIEXtza8cRLodsTCv0sVmUGbwZE2Bb
	 TTsymEYxdfgkxxSQPoULk5eT1oyszXBfuLr/w+iFz6uENOOlE/c9bLlEHwFmpy/t/w
	 CbopT4u9KznPzJ65+1qUN0MGNREaS9QjjIFanVQbVBKNSSbdd+5E4KNe7xT9mDqwDF
	 cMRQh2LQormCJUd6riFfvUJmQUKK826D45RR92WfsCHpEmSczUmK8m4pa9ggTQ1kNk
	 NlI/zKSetmtqB8MVwi0BthwVzDJkTTAga9Xfjel0zlhqukUyy8Eo7kwp8QhE5f0zQg
	 WJchilasLghsg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 00/15] AES-CMAC library
Date: Wed, 18 Feb 2026 13:34:46 -0800
Message-ID: <20260218213501.136844-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_133651_264934_3BE1939E 
X-CRM114-Status: GOOD (  15.26  )
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

This series can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-cmac-v1

This series adds support for AES CBC-based MACs to the crypto library,
specifically AES-CMAC, AES-XCBC-MAC, and AES-CBC-MAC.  The
implementation is fully optimized with the existing
architecture-optimized AES code, either single-block AES en/decryption
or arm64's neon_aes_mac_update() and ce_aes_mac_update().  As usual,
optimizations are now enabled by default as well.

AES-CMAC support will be useful for at least the SMB client and server,
and the bluetooth and mac80211 drivers.  Patches 8-15 convert these
users to use the crypto library API instead of crypto_shash, though
these patches will likely go in via subsystem trees later.  They result
in some significant simplifications and performance improvements.

As usual, a KUnit test suite, FIPS self-test, and traditional crypto API
wrapper algorithms are included as well.

Note that I'm also planning to add additional AES modes to the library.
This is just an initial set of AES modes to get things started.
Notably, with the SMB client and server already using the SHA* and MD5
libraries, "cmac(aes)" was the only remaining use of crypto_shash there.
So it makes sense to take care of that.

Eric Biggers (15):
  lib/crypto: aes: Add support for CBC-based MACs
  crypto: aes - Add cmac, xcbc, and cbcmac algorithms using library
  crypto: arm64/aes - Fix 32-bit aes_mac_update() arg treated as 64-bit
  lib/crypto: arm64/aes: Move assembly code for AES modes into libaes
  lib/crypto: arm64/aes: Migrate optimized CBC-based MACs into library
  lib/crypto: tests: Add KUnit tests for CBC-based MACs
  lib/crypto: aes: Add FIPS self-test for CMAC
  smb: client: Use AES-CMAC library for SMB3 signature calculation
  smb: client: Remove obsolete cmac(aes) allocation
  smb: client: Make generate_key() return void
  smb: client: Drop 'allocate_crypto' arg from smb*_calc_signature()
  ksmbd: Use AES-CMAC library for SMB3 signature calculation
  Bluetooth: SMP: Use AES-CMAC library API
  wifi: mac80211: Use AES-CMAC library in ieee80211_aes_cmac()
  wifi: mac80211: Use AES-CMAC library in aes_s2v()

 arch/arm64/crypto/Kconfig                     |   2 +-
 arch/arm64/crypto/Makefile                    |   4 +-
 arch/arm64/crypto/aes-ce-ccm-glue.c           |   4 -
 arch/arm64/crypto/aes-glue.c                  | 260 +-----------------
 arch/arm64/crypto/aes-neonbs-glue.c           |  15 +-
 crypto/Kconfig                                |   2 +
 crypto/aes.c                                  | 183 +++++++++++-
 crypto/testmgr.c                              |  10 +-
 drivers/crypto/starfive/jh7110-aes.c          |   2 +-
 fs/smb/client/Kconfig                         |   2 +-
 fs/smb/client/cifs_unicode.c                  |   1 +
 fs/smb/client/cifsencrypt.c                   |  62 ++---
 fs/smb/client/cifsfs.c                        |   1 -
 fs/smb/client/cifsglob.h                      |   7 +-
 fs/smb/client/cifsproto.h                     |   3 -
 fs/smb/client/misc.c                          |  57 ----
 fs/smb/client/sess.c                          |  11 -
 fs/smb/client/smb2proto.h                     |   1 -
 fs/smb/client/smb2transport.c                 | 113 ++------
 fs/smb/server/Kconfig                         |   2 +-
 fs/smb/server/auth.c                          |  51 +---
 fs/smb/server/auth.h                          |   4 +-
 fs/smb/server/crypto_ctx.c                    |  58 ----
 fs/smb/server/crypto_ctx.h                    |  12 -
 fs/smb/server/server.c                        |   1 -
 fs/smb/server/smb2pdu.c                       |   8 +-
 include/crypto/aes-cbc-macs.h                 | 154 +++++++++++
 include/crypto/aes.h                          |  66 +++++
 lib/crypto/Kconfig                            |  10 +
 lib/crypto/Makefile                           |   4 +-
 lib/crypto/aes.c                              | 231 +++++++++++++++-
 .../crypto => lib/crypto/arm64}/aes-ce.S      |   0
 .../crypto => lib/crypto/arm64}/aes-modes.S   |  23 +-
 .../crypto => lib/crypto/arm64}/aes-neon.S    |   0
 lib/crypto/arm64/aes.h                        |  76 ++++-
 lib/crypto/fips.h                             |   5 +
 lib/crypto/tests/Kconfig                      |  10 +
 lib/crypto/tests/Makefile                     |   1 +
 lib/crypto/tests/aes-cmac-testvecs.h          | 181 ++++++++++++
 lib/crypto/tests/aes_cbc_macs_kunit.c         | 228 +++++++++++++++
 net/bluetooth/Kconfig                         |   3 +-
 net/bluetooth/smp.c                           | 180 +++++-------
 net/mac80211/Kconfig                          |   2 +-
 net/mac80211/aes_cmac.c                       |  65 +----
 net/mac80211/aes_cmac.h                       |  12 +-
 net/mac80211/fils_aead.c                      |  48 ++--
 net/mac80211/key.c                            |  11 +-
 net/mac80211/key.h                            |   3 +-
 net/mac80211/wpa.c                            |  13 +-
 scripts/crypto/gen-fips-testvecs.py           |  10 +
 scripts/crypto/gen-hash-testvecs.py           |  31 ++-
 51 files changed, 1388 insertions(+), 855 deletions(-)
 create mode 100644 include/crypto/aes-cbc-macs.h
 rename {arch/arm64/crypto => lib/crypto/arm64}/aes-ce.S (100%)
 rename {arch/arm64/crypto => lib/crypto/arm64}/aes-modes.S (98%)
 rename {arch/arm64/crypto => lib/crypto/arm64}/aes-neon.S (100%)
 create mode 100644 lib/crypto/tests/aes-cmac-testvecs.h
 create mode 100644 lib/crypto/tests/aes_cbc_macs_kunit.c


base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
prerequisite-patch-id: 8eccdd31739fb317dfda9dddbfc5c3cd64e77331
prerequisite-patch-id: ca782470cef2467042fbe8f0166933d7fa292628
-- 
2.53.0


