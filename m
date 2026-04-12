Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0825BE937E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 15:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=35Kb1G8diUXdcUeRO6z0zPQrKqyhuQE+qiXkqgMSh9U=; b=ujs4DfDCMucTn5t8TYkqCqwAbw
	eYfIwRA0lu0qg0HpuPQTYMQ4XUEJfa8ParcJxhb/MWJaroG2wHdTsq/YFsHb7eO0pmk6fr1Vejwx0
	QmHpXjuL7ipwdHkH2Ttr6p7zFVqu0ENi92SrrfIMCYnKb57u7wR3yB4Qb3Ud0OaGlcrwp198O7yI4
	Ges7jLMTEQ78hZdrgXWoXzGBHJ2cKEWGYCXQKklApzgQwc1MWz94/CqWITVcbLvTCai9ZAGvgZiCo
	DOHV8VB2jWBrjpXSqnxwQYNB96Do4VR2h3A/sW5xHOmj41WzljYRwZGAGOQHsLrtKGyU7D1oXz4An
	SYbLoLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBx1Y-0000000ES1v-44PC;
	Sun, 12 Apr 2026 15:47:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBx1X-0000000ES1n-18tH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 15:46:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E93EB6014B;
	Sun, 12 Apr 2026 15:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADBFC19424;
	Sun, 12 Apr 2026 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776008816;
	bh=23dLLAcM76ajvHwVd9STiwBmiFsqBllnva76VnjCY0A=;
	h=Date:From:To:Cc:Subject:From;
	b=XXZn39WKLIgN3EAJkU5ENkWYZAuWvtD3iPiOn2ozgnaDOWxI5dBZ5BQmoFtFm2rE5
	 8SvYKVh+BiE2QtmOhZabXGgkkUUugDwoDYf8yxsZrEtcOf4wjIPBRyWiXDvNOmXVzB
	 tikHKggIoVLzkavDBwUeYVxmpCG98H5XVARlwPdNnSzNK1w5LM+Lxeg8tY3hNZAXBD
	 1UNYY56I3A9zV/+XMHzeoH8MDZhUK2JGiBLj7MVEywl6gQv2Fj6VG9OEJUWTyjAQji
	 OOXucRVnk+iJt7Nhg9VqjWOE/zvhkal2k4/PrKupY+JrxnbNbTlXSyxpO3xfjV1V4C
	 hOH6k+cYbW0tg==
Date: Sun, 12 Apr 2026 17:46:47 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alexander Coffin <alex@cyberialabs.net>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Bill Wendling <morbo@google.com>,
	David Howells <dhowells@redhat.com>,
	Dodji Seketeli <dodji@seketeli.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>,
	John Moon <john@jmoon.dev>, Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>, Song Liu <song@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Yonghong Song <yonghong.song@linux.dev>, kernel-team@fb.com,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev, loongarch@lists.linux.dev
Subject: [GIT PULL] Kbuild and Kconfig changes for v7.1
Message-ID: <adu-ZyIv47FnsVLI@levanger>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Coffin <alex@cyberialabs.net>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Bill Wendling <morbo@google.com>,
	David Howells <dhowells@redhat.com>,
	Dodji Seketeli <dodji@seketeli.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>,
	John Moon <john@jmoon.dev>, Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>, Song Liu <song@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Yonghong Song <yonghong.song@linux.dev>, kernel-team@fb.com,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev, loongarch@lists.linux.dev
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WEAPSl/ZOh7quu+7"
Content-Disposition: inline
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


--WEAPSl/ZOh7quu+7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

please pull these changes to Kbuild and Kconfig for v7.1.  Please let me
know if anything is incorrect and not matching your standards.

All changes have been in -next, most for several cycles without reported
problems.

Thanks and kind regards,
Nicolas

---

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git t=
ags/kbuild-7.1-1

for you to fetch changes up to 404927758daac5ec4594071e033c1fa6ee9ca9b6:

  kbuild: expand inlining hints with -fdiagnostics-show-inlining-chain (202=
6-04-07 21:48:44 +0200)

----------------------------------------------------------------
Kbuild/Kconfig updates for 7.1

Kbuild changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  * tools/build: Reject unexpected values for LLVM=3D

  * kbuild: uapi: remove usage of toolchain headers

  * kbuild: Switch from '-fms-extensions' to '-fms-anonymous-structs'
    when available (currently: clang >=3D 23.0.0)

  * kbuild: Reduce the number of compiler-generated suffixes for clang
    thin-lto build

  * kbuild: reduce output spam ("GEN Makefile") when building out of tree

  * check-uapi: improve portability for testing headers

  * uapi: also test UAPI headers against C++ compilers

  * kbuild: vdso_install: drop build ID architecture allow-list

  * checksyscalls: only run when necessary

  * Documentation: kbuild: Update the debug information notes in
    reproducible-builds.rst

  * kconfig: forbid multiple entries with the same symbol in a choice

  * kbuild: expand inlining hints with -fdiagnostics-show-inlining-chain


Kconfig changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  * kconfig: Error out on duplicated kconfig inclusion


Cc: Alexander Coffin <alex@cyberialabs.net>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bill Wendling <morbo@google.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Dodji Seketeli <dodji@seketeli.org>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Helge Deller <deller@gmx.de>
Cc: John Moon <john@jmoon.dev>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Song Liu <song@kernel.org>
Cc: Thomas Wei=DFschuh <linux@weissschuh.net>
Cc: Yonghong Song <yonghong.song@linux.dev>
Cc: kernel-team@fb.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-efi@vger.kernel.org
Cc: linux-hexagon@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev
Cc: loongarch@lists.linux.dev

----------------------------------------------------------------
Arnd Bergmann (3):
      check-uapi: link into shared objects
      check-uapi: honor ${CROSS_COMPILE} setting
      check-uapi: use dummy libc includes

Justin Stitt (1):
      kbuild: expand inlining hints with -fdiagnostics-show-inlining-chain

Masahiro Yamada (1):
      kconfig: forbid multiple entries with the same symbol in a choice

Nathan Chancellor (3):
      kbuild: Consolidate C dialect options
      kbuild: Use '-fms-anonymous-structs' if it is available
      Documentation: kbuild: Update the debug information notes in reproduc=
ible-builds.rst

Nicolas Schier (1):
      kconfig: Error out on duplicated kconfig inclusion

Thomas Wei=DFschuh (25):
      Documentation/llvm: drop note about LLVM=3D0
      tools/build: Reject unexpected values for LLVM=3D
      hexagon: uapi: Fix structure alignment attribute
      kbuild: uapi: test linux/bpf_perf_event.h on powerpc
      kbuild: uapi: deduplicate linux/bpf_perf_event.h exclusions
      kbuild: uapi: completely exclude linux/bpf_perf_event.h on nios2
      kbuild: uapi: only use dummy-include for headers which use libc
      kbuild: uapi: provide stub includes for some libc headers
      kbuild: uapi: use custom stub headers instead of libc ones
      kbuild: uapi: simplify libc dependency logic
      kbuild: uapi: remove now unneeded guard headers
      kbuild: reduce output spam when building out of tree
      kbuild: uapi: move some compiler arguments out of the command definit=
ion
      kbuild: uapi: move all include path flags together
      kbuild: uapi: handle UML in architecture-specific exclusion lists
      kbuild: uapi: provide a C++ compatible dummy definition of NULL
      kbuild: uapi: also test UAPI headers against C++ compilers
      kbuild: vdso_install: split out the readelf invocation
      kbuild: vdso_install: hide readelf warnings
      kbuild: vdso_install: gracefully handle images without build ID
      kbuild: vdso_install: drop build ID architecture allow-list
      checksyscalls: move path to reference table to a variable
      checksyscalls: fail on all intermediate errors
      checksyscalls: only run when necessary
      checksyscalls: move instance functionality into generic code

Yonghong Song (1):
      kbuild: Reduce the number of compiler-generated suffixes for clang th=
in-lto build

 Documentation/kbuild/llvm.rst                      |  4 --
 Documentation/kbuild/reproducible-builds.rst       |  7 ++-
 Kbuild                                             | 14 +++--
 Makefile                                           | 35 +++++++++---
 arch/arm64/kernel/vdso32/Makefile                  |  3 +-
 arch/hexagon/include/uapi/asm/sigcontext.h         |  2 +-
 arch/loongarch/vdso/Makefile                       |  2 +-
 arch/mips/Makefile                                 |  6 +-
 arch/parisc/boot/compressed/Makefile               |  2 +-
 arch/powerpc/boot/Makefile                         |  3 +-
 arch/s390/Makefile                                 |  3 +-
 arch/s390/purgatory/Makefile                       |  3 +-
 arch/x86/Makefile                                  |  6 +-
 arch/x86/boot/compressed/Makefile                  |  6 +-
 drivers/firmware/efi/libstub/Makefile              |  3 +-
 init/Kconfig                                       |  5 ++
 scripts/Makefile.vdsoinst                          |  7 ++-
 scripts/Makefile.warn                              |  5 --
 scripts/check-uapi.sh                              | 19 ++++---
 scripts/checksyscalls.sh                           | 11 +++-
 scripts/kconfig/lexer.l                            |  4 +-
 scripts/kconfig/lkc.h                              |  3 +-
 scripts/kconfig/parser.y                           | 15 ++---
 scripts/kconfig/tests/err_repeated_inc/Kconfig     |  3 +
 .../kconfig/tests/err_repeated_inc/Kconfig.inc1    |  4 ++
 .../kconfig/tests/err_repeated_inc/Kconfig.inc2    |  3 +
 .../kconfig/tests/err_repeated_inc/Kconfig.inc3    |  1 +
 scripts/kconfig/tests/err_repeated_inc/__init__.py | 10 ++++
 .../kconfig/tests/err_repeated_inc/expected_stderr |  2 +
 scripts/kconfig/util.c                             | 31 ++++++++++-
 tools/scripts/Makefile.include                     |  2 +
 usr/dummy-include/endian.h                         |  0
 usr/dummy-include/limits.h                         |  8 +++
 usr/dummy-include/netinet/if_ether.h               |  0
 usr/dummy-include/netinet/in.h                     |  0
 usr/dummy-include/stdbool.h                        |  7 ---
 usr/dummy-include/stddef.h                         | 13 +++++
 usr/dummy-include/stdint.h                         | 17 ++++++
 usr/dummy-include/stdlib.h                         |  7 ---
 usr/dummy-include/string.h                         | 12 ++++
 usr/dummy-include/sys/ioctl.h                      |  0
 usr/dummy-include/sys/socket.h                     | 12 ++++
 usr/dummy-include/sys/time.h                       |  3 +
 usr/dummy-include/sys/types.h                      |  0
 usr/dummy-include/time.h                           |  0
 usr/dummy-include/unistd.h                         |  0
 usr/include/Makefile                               | 65 ++++++++++++++----=
----
 47 files changed, 251 insertions(+), 117 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_repeated_inc/Kconfig
 create mode 100644 scripts/kconfig/tests/err_repeated_inc/Kconfig.inc1
 create mode 100644 scripts/kconfig/tests/err_repeated_inc/Kconfig.inc2
 create mode 100644 scripts/kconfig/tests/err_repeated_inc/Kconfig.inc3
 create mode 100644 scripts/kconfig/tests/err_repeated_inc/__init__.py
 create mode 100644 scripts/kconfig/tests/err_repeated_inc/expected_stderr
 create mode 100644 usr/dummy-include/endian.h
 create mode 100644 usr/dummy-include/limits.h
 create mode 100644 usr/dummy-include/netinet/if_ether.h
 create mode 100644 usr/dummy-include/netinet/in.h
 delete mode 100644 usr/dummy-include/stdbool.h
 create mode 100644 usr/dummy-include/stddef.h
 create mode 100644 usr/dummy-include/stdint.h
 delete mode 100644 usr/dummy-include/stdlib.h
 create mode 100644 usr/dummy-include/string.h
 create mode 100644 usr/dummy-include/sys/ioctl.h
 create mode 100644 usr/dummy-include/sys/socket.h
 create mode 100644 usr/dummy-include/sys/time.h
 create mode 100644 usr/dummy-include/sys/types.h
 create mode 100644 usr/dummy-include/time.h
 create mode 100644 usr/dummy-include/unistd.h

--=20
Nicolas

--WEAPSl/ZOh7quu+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmnbvloACgkQB1IKcBYm
EmnVJBAAlJvaCwNlI1ymaWQKEC+s4udzUKo5DuA14pw/3NgGhLasok1WZaWB0LUb
2D4NtXMeQLTFybnTE07rbHZwQ/fBpvyWNL0D9aL+bjHfYhkbJHIJIgnrTOJLn3IW
wJuPJgJDMvgmWKyXGRLjPEevSmKF10Aej8f0QIsXuv8IG8M0ZfpIohRV35Dot9w6
kRQC6lX0lYTfaBzp7IBMtY634rtzC9rHK+U1gkkvswuE2H26rm5TxeE1lL6Xecmf
pd16FUspWGCMMB6YFRz3hi4ZRIMhY3MgY6LvvcHNF0RDrdoEoqWFyKLd/l5X5CNq
HKbIrMJ4l5E4KCSw3rtaW/RzmcZjDtU1RLdXLomAhZU7sszIhyYOuptBVAncdKVC
Vo+lxm1kLlBRG4eQjCnA51HQZN7VbO54XSvWVmRioEUevu6wSA8UvSq7Kcufzg57
I9nn9kpwFqJZvQsNGIdDqEgIT5l3muX1Y89E723OqKZ9CoPl2meGrLQU69e4gGFc
R/nTDktzEFINZHVk72AwAWyjvE/IGx6mmogf1+4Zz7MK2Q5aeXejy6T5aZ0QMwtH
/290TxOxWlOqi3b57Quo0xJVltkA9WxCi++4hh0Te/x2Yjaqbaovui7fBjqeKvCh
Oh9AhNVYbTOjIMS2CyL6xQBlr+Vp2MQ163tqds1uSP3IqrS2T+8=
=WfCJ
-----END PGP SIGNATURE-----

--WEAPSl/ZOh7quu+7--

