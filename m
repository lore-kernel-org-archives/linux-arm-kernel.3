Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B2AC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 09:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RXO4f3Yp6Be71rD2cH9gM61HbHGWJD/s7+tuHyvcz5U=; b=0/03MB0YokAVKPYVOvKXtdyXaH
	sLLIKwl9N+WwoOnUC+BHHqdm9gzwwoJxZf4Xf/LuGIXRTbdJxi/vavvSwHo0iXIGYm5lLFxEZr9Q2
	1g4P+fuutiwDTOe5E2AkLMgAncwNC0v2la3/Z3xQQ0HRyTdiCRjvkWXtgNnegqL/880RJo61YISTP
	+5OZVSxwx9qhbXzEiXWfh9b64/ZFNOjGnp4E1NM5rkr6f9hPBIydkTyWQvoOtz8g8fcANj46NKSdx
	DIEvzvs5sLLCWo+BGNkV6eR50pGRHIvb7ks6+N1fWwT37G9mrEAMeOLEJbGubufeS6YyPSAKENuVM
	5UFGmX8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLIJO-00000003ZXy-2urB;
	Sat, 31 May 2025 09:15:30 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLIEI-00000003Z8g-41jk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 09:10:16 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 55656138034E;
	Sat, 31 May 2025 05:10:14 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 31 May 2025 05:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1748682614; x=1748769014; bh=RX
	O4f3Yp6Be71rD2cH9gM61HbHGWJD/s7+tuHyvcz5U=; b=sz4IZZbzEd7DDdVpIP
	PcvuT23+ITNiLVgPM/ZwbxesELoZPwW5k6dEvBLAPTuMUQIsy6tRZNOH7QvB/dmJ
	NFQLHWXj9R7XNM8httMvK2n3NyIaAvpUEVIidEoHqQc88LYKExFQd2PHiueDT/R3
	s1cOaTIAmYfd4Zl2di0KogiuLcn86CkJnASeb2Skt9m35eaC8LBs79D7TAU2XkYY
	SMJM+iJSKdBEPXfRYxmfqtujfowd8HThjyGe/9tL+BYLFthRnRNeoHh53B6N2XQ0
	78gj7nZLJsomffo2rY09wU8G1Bw6A+zvwU+7rH4AT1GfdIQxejpG4MQgv6ynHTQH
	qTsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1748682614; x=1748769014; bh=RXO4f3Yp6Be71rD2cH9gM61HbHGW
	JD/s7+tuHyvcz5U=; b=lDSX/gnqofokQz3vlh2ZNFDjUTV/FIwwX0zhFNEmtcm7
	cIAKkvmjnKFmlhwQsGoRNPxgHL09iRpqD+vjUXzjH0hCXMX8TLQtdHW6jMoQeDwW
	mWw529YDvlkgyvUH6tpoKiBd4gPw7frqQViSEGc8CXbx62ivpx/tDyuNcMd3OD4S
	Rqh421esWYP4jv425UXUtPpqYps4UiheSwV2wobami9nwo1EXCFAbQY9npvEvsw+
	UHcghVkxi1T7+QNWlO3yOM/TQJUKD2kL4R8r/N8inNb5WHgecGSUlwmIkF6EUfco
	vSHCGRLAweeTczuIQBISNpcH+5U4BrT3xDuALJQ6mw==
X-ME-Sender: <xms:dsc6aIhtHfr4LZdGNKoMy7tjoUrGxaTEshiQ8hJxjjjJMjzTZ2lnDw>
    <xme:dsc6aBDvRSByIYaUh0tsGtfvBgdVWhYUfYHYr4lkiq4g65UNuJlUmn64UjHSIi1gj
    oIH32iQQlMXY9SQyH8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudehudculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    ufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoe
    grrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeduleeigeekveeugeet
    tdejtddtleeghefhvdfhueehtefhudelffduvdeuleevteenucffohhmrghinhepkhgvrh
    hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphht
    thhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhrvhgrlhgusheslh
    hinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:dsc6aAGCr8yQaaseQMm_XQw4bZ095G5ZcWNy3prGMpNDFUCkKUcXUw>
    <xmx:dsc6aJSsVtH9gcAsTJWgx2yz1bCs3TBYSBJtlX9KAM_Mj1yE7P4bfQ>
    <xmx:dsc6aFw3qK1oBAaTZx1JPlv4RKKfH8K5kxcR1osQPu3OWGao_VlLGQ>
    <xmx:dsc6aH7WEmQyHMUDTYsHrMIGmeCqAze97w2bgFFUe44teRBWQHKJNw>
    <xmx:dsc6aHf5EfpfJKJ4dzibYskkAxRFVm6jl0WdKbgtXw1s1FYvv1tXWftn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F1CC9700060; Sat, 31 May 2025 05:10:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 31 May 2025 11:09:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-kbuild@vger.kernel.org, "Kees Cook" <kees@kernel.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Message-Id: <feab370a-3857-4ae9-a22d-1ab6d992c73c@app.fastmail.com>
Subject: [GIT PULL] require gcc-8 and binutils-2.30
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_021015_074921_06FB3754 
X-CRM114-Status: GOOD (  13.29  )
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

The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git tags/gcc-minimum-version-6.16

for you to fetch changes up to 582847f9702461b0a1cba3efdb2b8135bf940d53:

  Makefile.kcov: apply needed compiler option unconditionally in CFLAGS_KCOV (2025-05-21 16:08:42 +0200)

----------------------------------------------------------------
require gcc-8 and binutils-2.30

x86 already uses gcc-8 as the minimum version, this changes all other
architectures to the same version. gcc-8 is used is Debian 10 and Red
Hat Enterprise Linux 8, both of which are still supported, and binutils
2.30 is the oldest corresponding version on those. Ubuntu Pro 18.04 and
SUSE Linux Enterprise Server 15 both use gcc-7 as the system compiler
but additionally include toolchains that remain supported.

With the new minimum toolchain versions, a number of workarounds for older
versions can be dropped, in particular on x86_64 and arm64.  Importantly,
the updated compiler version allows removing two of the five remaining
gcc plugins, as support for sancov and structeak features is already
included in modern compiler versions.

I tried collecting the known changes that are possible based on the
new toolchain version, but expect that more cleanups will be possible.
Since this touches multiple architectures, I merged the patches through
the asm-generic tree.

----------------------------------------------------------------
Arnd Bergmann (6):
      kbuild: require gcc-8 and binutils-2.30
      raid6: skip avx512 checks
      arm64: drop binutils version checks
      Kbuild: remove structleak gcc plugin
      gcc-plugins: remove SANCOV gcc plugin
      Documentation: update binutils-2.30 version reference

Lukas Bulwahn (1):
      Makefile.kcov: apply needed compiler option unconditionally in CFLAGS_KCOV

 Documentation/admin-guide/README.rst               |   2 +-
 Documentation/kbuild/makefiles.rst                 |   4 +-
 Documentation/process/changes.rst                  |   6 +-
 .../translations/it_IT/process/changes.rst         |   6 +-
 .../translations/zh_CN/admin-guide/README.rst      |   2 +-
 arch/arm64/Kconfig                                 |  37 +--
 arch/arm64/Makefile                                |  21 +-
 arch/arm64/include/asm/rwonce.h                    |   4 -
 arch/arm64/kvm/Kconfig                             |   1 -
 arch/arm64/lib/xor-neon.c                          |   2 +-
 arch/um/Makefile                                   |   4 +-
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c       |   6 +-
 include/linux/unroll.h                             |   4 +-
 kernel/gcov/gcc_4_7.c                              |   4 -
 lib/Kconfig.debug                                  |  10 +-
 lib/raid6/algos.c                                  |   6 -
 lib/raid6/avx512.c                                 |   4 -
 lib/raid6/recov_avx512.c                           |   6 -
 lib/raid6/test/Makefile                            |   3 -
 lib/test_fortify/Makefile                          |   5 +-
 lib/tests/stackinit_kunit.c                        |  10 +-
 mm/mm_init.c                                       |   6 -
 scripts/Makefile.compiler                          |   2 +-
 scripts/Makefile.gcc-plugins                       |  16 --
 scripts/Makefile.kcov                              |   3 +-
 scripts/gcc-plugins/Kconfig                        |  10 -
 scripts/gcc-plugins/gcc-common.h                   |  45 ----
 scripts/gcc-plugins/sancov_plugin.c                | 134 -----------
 scripts/gcc-plugins/structleak_plugin.c            | 257 ---------------------
 scripts/min-tool-version.sh                        |   6 +-
 security/Kconfig.hardening                         |  76 ------
 31 files changed, 25 insertions(+), 677 deletions(-)
 delete mode 100644 scripts/gcc-plugins/sancov_plugin.c
 delete mode 100644 scripts/gcc-plugins/structleak_plugin.c

