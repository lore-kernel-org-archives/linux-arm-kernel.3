Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D0CC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=+Oczzkl+ZPxzE8AFJwStgEnhU0TPYb/al4158VyjdKo=; b=2vc8zM/+ld7wb8ZLs4zhGlaWfI
	ICz4HvODxZ3XhnCaZyNfjHPIzpfVHVk3cztFuviPd4LKYl5LuW4YEs1qZQWMT0bbIdEwSg0Kf9Upj
	lTNvl26eX4J83aA+/85Qlj9TW6C/ZcvSd8rxtJ/Ya5BEVLSp9Wu5X6TB19MpP9Y05hTU6bsWsd0gz
	1fYkqGY6L2Ugdmz0vtrA8IfATpcwVmaanheHyt7gkYpXO1vdiv62K5RdNgk0kCCy2G8xn6MM0yJtR
	SLAekzYtYwhPeTZIvkla8DREO+IaJXc4LMQq6eiuC/InNbXKrPXTSK4gbN32cow6+o9h9LhX1DLXJ
	3ReVnfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Cf-0000000DD2y-1buO;
	Fri, 25 Sep 2026 11:34:57 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Cc-0000000DD2C-1ar7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 11:34:56 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260925113451euoutp01cc47361ba05fcc9fcb3b693e8e3a2d45~YjTBvQ5e43035330353euoutp01t;
	Fri, 25 Sep 2026 11:34:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260925113451euoutp01cc47361ba05fcc9fcb3b693e8e3a2d45~YjTBvQ5e43035330353euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790336091;
	bh=+Oczzkl+ZPxzE8AFJwStgEnhU0TPYb/al4158VyjdKo=;
	h=From:Subject:Date:To:Cc:References:From;
	b=SD8t4TBS4zLynMpoJ+XZO5G7obvN2+9pjLb3nh5+FgWwcA40u9Y78IEGJ2rQ+0LXM
	 iqZbOlJt5wElT8Ubuw0ShuJdSbQpAfam6aezbkmehoWybA9pxvVkq9g/3n5eufu/x0
	 wFGDKiTBtjc9yrWXe/HL6N2CH3OxHI6iigZnAz2o=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260925113450eucas1p2fcf838f00f35e1bce0ca04a694cd0cd2~YjTBUNGyK1156811568eucas1p2k;
	Fri, 25 Sep 2026 11:34:50 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260925113448eusmtip2654acd08b88fee7c049616f2c0eed0d2~YjS-y0y__2286422864eusmtip2B;
	Fri, 25 Sep 2026 11:34:48 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH RFC 0/9] lib/lz4: stop forking upstream LZ4, vendor it
 instead
Date: Fri, 25 Sep 2026 13:27:30 +0200
Message-Id: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJatmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
	vPSU3UzU4B8JSMDIzMDSwMT3ZwqE92y1LyU/CLd0oLikqLUxFxdk6RkI6CCFIO0tGQloM6CotS
	0zAqwqdFKQW7OSrG1tQAwfPrdagAAAA==
X-Change-ID: 20260904-lz4-vendor-upstream-4bc2202d0ffc
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Nathan Chancellor
	<nathan@kernel.org>,  Nick Desaulniers <ndesaulniers@google.com>,  Bill
	Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,  Russell
	King <linux@armlinux.org.uk>,  Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>,  "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,  Helge Deller <deller@gmx.de>,
	Heiko Carstens <hca@linux.ibm.com>,  Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>,  Christian Borntraeger
	<borntraeger@linux.ibm.com>,  Sven Schnelle <svens@linux.ibm.com>, Thomas
	Gleixner <tglx@kernel.org>,  Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>,  Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>,  Sergey
	Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>,  Nick
	Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>,  Chao Yu
	<chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,  Herbert Xu
	<herbert@gondor.apana.org.au>,  Phillip Lougher <phillip@squashfs.org.uk>,
	Sungguk <sungguk.na@samsung.com>,  Jaehoon Chung <jh80.chung@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8607;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=rfVq31cP2YSbDAGF6XUIrjIv9+n8hE00DYqthoHMGoo=;
	b=owEBbQGS/pANAwAKASw99I2nQptuAcsmYgBqtlxPvYGoEOWx8z6fD2Wm9AY/MPYvOQ/+J3tI2
	JWI5pSAVTOJATMEAAEKAB0WIQR2xBTdTO5XfoUTSOYsPfSNp0KbbgUCarZcTwAKCRAsPfSNp0Kb
	bokBB/4lhWKPyvHooP1nezrGPjCk/0xH1ec9m/tifVEV6KSuIzwgPylAi6HyP0FPrxcod9B6Rin
	nS7s5B97LD/FZKmx0ukSpNpkL1IQmR+a3oleVjGd5W5qgqDav/c58w09MCpiR9bOv6sqZAgl/IR
	HOfZicvcks74I2CBq7m1Zl7XxqSXamBk3X2XUgh0Kv7WGsvjw28USiDphcDL3wjPgRuglooM0iG
	2trbPsvCyfSAN44iVpPvCS8E5IB8tedPRQPbct0UezB8wVDLNUHXlx9I0yGUWnUioiekpCt2x4W
	hDyc+KcdDvgQV7Dj4aVeBrECkXOcSES/T8yQ3wvcoVErAwCb
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=76C414DD4CEE577E851348E62C3DF48DA7429B6E
X-CMS-MailID: 20260925113450eucas1p2fcf838f00f35e1bce0ca04a694cd0cd2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260925113450eucas1p2fcf838f00f35e1bce0ca04a694cd0cd2
X-EPHeader: CA
X-CMS-RootMailID: 20260925113450eucas1p2fcf838f00f35e1bce0ca04a694cd0cd2
References: <CGME20260925113450eucas1p2fcf838f00f35e1bce0ca04a694cd0cd2@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_043454_699399_D6BE135B 
X-CRM114-Status: GOOD (  22.55  )
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

The in-kernel LZ4 is a fork. The decompressor was last synced with
upstream v1.8.3 in 2018 and the compressor with v1.7.3 in 2017, both by
hand. Upstream has made 488 commits against lib/ since, and the gap is
maintained one cherry-pick at a time.

That has left real bugs in place for example the forked
LZ4_decompress_fast() has no bounds checks, so corrupted input runs off
the output buffer in both directions. 

This series vendors the upstream sources unmodified and adapts them at
build time, so a re-sync becomes a directory copy:

  upstream/lz4.c, upstream/lz4.h    verbatim upstream sources
  upstream/lz4hc.c, upstream/lz4hc.h
  lz4_deps.h                        the build environment
  lz4_kernel_api.h                  hands the LZ4 names back
  freestanding/                     ISO C headers -nostdinc drops
  lz4_compress.c                    the kernel's entry points
  lz4_decompress.c
  lz4hc_compress.c

Patch 1 imports the sources. Patch 2 backports the one upstream fix the
kernel's warning flags require. Patch 3 adds the build environment.
Patch 4 puts the freestanding headers on the pre-boot decompressor path.
Patches 5-7 convert the compressor, HC compressor and decompressor in
turn. Patch 8 folds away the last duplicated prototype list. Patch 9
gives lib/lz4 a MAINTAINERS entry, which it has never had.

The exported API changes in three ways.

The three stream types become incomplete. <linux/lz4.h> spelled out their
layout for the fork's benefit, upstream headers define the same types and
lib/decompress_unlz4.c ends up with both in one translation unit. Callers
allocate LZ4_MEM_COMPRESS, LZ4HC_MEM_COMPRESS or LZ4_MEM_DECOMPRESS bytes
instead of sizeof() every caller but zram already did. Each conversion
patch makes its own type incomplete so no step leaves the tree broken.

Sixteen macros go with them: the hash geometry (LZ4_HASHLOG,
LZ4_HASHTABLESIZE, LZ4_HASH_SIZE_U32, LZ4HC_DICTIONARY_LOGSIZE, LZ4HC_MAXD,
LZ4HC_MAXD_MASK, LZ4HC_HASH_LOG, LZ4HC_HASHTABLESIZE, LZ4HC_HASH_MASK) and
the sizes derived from it (LZ4_MEMORY_USAGE, LZ4_STREAMSIZE{,_U64},
LZ4_STREAMHCSIZE{,_SIZET}, LZ4_STREAMDECODESIZE{,_U64}). They existed to
lay out structures the fork defined here none has an in tree user outside
lib/lz4. LZ4_compressBound() goes too a static inline whose only caller
was lib/decompress_unlz4.c, now using the LZ4_COMPRESSBOUND() macro.

LZ4_MEM_DECOMPRESS and LZ4HC_CLAMP_CLEVEL are new.

There are some behaviour changes. All of them come from upstream rather
than from this series and I have kept them rather than patching them
out: a local fix on top of vendored sources is exactly the divergence
this series exists to remove.

 - LZ4HC levels 10 and up are clamped to 9. Upstream routes them to its
   optimal parser, whose ~64K opt[] does not fit a kernel stack. The
   fork had no optimal parser at all - level only scaled search depth -
   so its levels 10-16 beat its own level 9 by 0.01%. Clamping rather
   than rejecting keeps existing f2fs and zram settings working.

 - LZ4_decompress_fast() stops running off the output buffer.
   Upstream routes it through LZ4_decompress_unsafe_generic(), which
   bounds-checks. 

 - LZ4_decompress_safe_partial() with a zero-length target returns 0
   rather than -1, matching upstream since 725cb0aafdf7. No in-tree
   caller passes zero.

 - The compressors require wrkmem aligned to 8 bytes. Upstream checks
   this and LZ4_initStream() returns NULL, which the stateless entry
   points cannot report, so a misaligned buffer faults rather than
   failing cleanly. Every in-tree caller uses kmalloc() or vmalloc() and
   is already aligned; <linux/lz4.h> now documents the requirement.
   Turning upstream's LZ4_ALIGN_TEST off would trade a loud failure for
   a silent one.

The layout follows lib/zstd, which keeps upstream's sources in a
subdirectory and the kernel glue on top. zstd has an upstream import
tool and an upstream zstd_deps.h; LZ4 has neither, so the kernel glue
here lives outside the vendored files.

The import is the v1.10.0 release tag. It does not build under
-Wmissing-prototypes without upstream commit 5ef1f16929b5, which patch 2
backports; that is the only deviation from the tag. The decoder fixes
in PR #1753 landed after v1.10.0 and do not backport cleanly; they will
come with the next release.

checkpatch reports some 3500 errors against patch 1: upstream's coding
style, and no SPDX tags, in files kept verbatim.

Measured in the kernel: three kernels differing only in lib/lz4, booted
one core under KVM, each reading 1.3GB of kernel source from an LZ4
erofs image with the page cache dropped before every pass. Median of 21
passes. The middle column is upstream v1.10.0 with LZ4_FAST_DEC_LOOP=0,
to separate the version bump from the decode loop upstream added in
v1.9.0.

                        erofs read, MB/s
  erofs cluster    today   v1.10.0   + fast loop    net
             4K     2363      2404          2630   +11%
            64K     2788      2904          3168   +14%

The same three decoders at the library level, each block decompressed
on its own the way zram treats a page. x86_64, the fork's and upstream's
sources built with the kernel's code generation flags (so no SSE), all
decoding the same compressed input, median of 21 interleaved runs. The
first corpus is upstream's tests/datagen with a fixed seed, so it is
byte-identical anywhere; the second is a tar of kernel sources:

                                 decompression, MB/s
  corpus           block  ratio    today   v1.10.0  + fast loop   net
  datagen -s0 -P60   4K  1.09x     4588      4702         5086   +11%
                    16K  1.34x     3950      4016         4779   +21%
                    64K  1.90x     4761      4866         5588   +17%
                   256K  1.92x     6596      6714         7258   +10%
  kernel source tar  4K  2.29x     3694      3830         4190   +13%
                    16K  2.57x     3653      3842         4091   +12%
                    64K  2.80x     3655      3818         4039   +11%
                   256K  2.95x     4072      4231         4542   +12%

The cost is size: lib/lz4 grows from 45K to 89K of text on x86_64,
lz4hc most (12K to 39K). That is upstream code the fork never had, and
the optimal parser the level clamp leaves unreachable is only 6K of it.

---
Michal Wilczynski (9):
      lib/lz4: import upstream LZ4 sources verbatim
      lib/lz4: backport upstream's -Wmissing-prototypes fix
      lib/lz4: add the build environment for the vendored sources
      arch: boot: put the LZ4 freestanding headers on the decompressor path
      lib/lz4: switch the compressor to the vendored sources
      lib/lz4: switch the HC compressor to the vendored sources
      lib/lz4: switch the decompressor to the vendored sources
      lib/lz4: fold lz4_kernel_api.h into <linux/lz4.h>
      MAINTAINERS: add an entry for the LZ4 compression library

 MAINTAINERS                          |    6 +
 arch/arm/boot/compressed/Makefile    |    3 +
 arch/mips/boot/compressed/Makefile   |    4 +
 arch/parisc/boot/compressed/Makefile |    3 +
 arch/s390/boot/Makefile              |    3 +
 arch/x86/boot/compressed/Makefile    |    3 +
 drivers/block/zram/backend_lz4.c     |    8 +-
 drivers/block/zram/backend_lz4hc.c   |    4 +-
 include/linux/lz4.h                  |  151 +-
 lib/decompress_unlz4.c               |    4 +-
 lib/lz4/Makefile                     |   15 +-
 lib/lz4/freestanding/limits.h        |   14 +
 lib/lz4/freestanding/stddef.h        |   15 +
 lib/lz4/freestanding/stdint.h        |   14 +
 lib/lz4/freestanding/string.h        |   14 +
 lib/lz4/lz4_compress.c               |  941 +----------
 lib/lz4/lz4_decompress.c             |  718 +--------
 lib/lz4/lz4_deps.h                   |   96 ++
 lib/lz4/lz4_kernel_api.h             |   35 +
 lib/lz4/lz4defs.h                    |  247 ---
 lib/lz4/lz4hc_compress.c             |  785 +---------
 lib/lz4/upstream/lz4.c               | 2829 ++++++++++++++++++++++++++++++++++
 lib/lz4/upstream/lz4.h               |  884 +++++++++++
 lib/lz4/upstream/lz4hc.c             | 2192 ++++++++++++++++++++++++++
 lib/lz4/upstream/lz4hc.h             |  414 +++++
 25 files changed, 6748 insertions(+), 2654 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260904-lz4-vendor-upstream-4bc2202d0ffc

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>


