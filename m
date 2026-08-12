Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15573C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 17:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6EzYPaGuuMIoxmiqca3tHSV0ntTQ4/JK20Xi8w7N9+U=; b=S4Xr0HERlrjQND
	bmgt7sZYzY380Mvwc+ckmfFhSQ86N6r/joRHJDedAiCI9Am3xqFJ4AF7k1SVrX7GFDtcanUWH7wuM
	gZJJDOSKwDtXWJtA0usp3ALILsUu8/c9saK1nM8NPz3SlGe1VckSgMvG9/7asnkxFakalN/QUm9xu
	cx3ZV2OW7buWVnM1FBMRB3Sp0AnjYcJTooZ0w+1S+NuqCrpGJH6w2bpGs/p4ZE9hb+q4w7QFt6i5j
	fCc0/cm01NMaF8bwT5b4woTW+TYTDh6Mmuv+kCo2qLeAAB2xPACfUxj2fTe1fYU9zvMtmAFGUox7N
	5ap4FzZ0omuVBibIMcbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCuw-0000000GgXO-2ecv;
	Wed, 12 Aug 2026 17:39:06 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCus-0000000GgVN-32Xx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 17:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Reply-To;
	bh=6EzYPaGuuMIoxmiqca3tHSV0ntTQ4/JK20Xi8w7N9+U=; b=OxgkpZiXhDR/EcCzamW0ylPShj
	oWHhVie6raLq6F9t/ANzDoRIteOmIH3FCvGN00E0Oy9cUopBIBUIY9nQAUMGNpz4nRT2M/0XFCtW9
	7DUvCow2v0D0N1mjGa0W08HDnoCbK8AROYQgw6w2HbgHIn9CtBHN+JjwhHKZVGJpnzwHpDzdNdLlN
	kZwPNGv+ogJRaw1pKSgaK+zASX0fUpIFdNov+mYqPrjgRB3hOgofcHt8n6lhtvsRyfxdQIi+oWktZ
	kEmQfktpKszHcoTleA1LplJbnQFblmCuJr/Tn5Csi8gbjSKEW1g9+y6yQKjaFNRakv/Q87XFfWCXv
	rKjtFCJQ==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wuCug-000FR2-Ux; Wed, 12 Aug 2026 19:38:51 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v5 00/13] syscalls: Add a shared table for all archs
Date: Wed, 12 Aug 2026 14:38:31 -0300
Message-Id: <20260812-tonyk-syscall_table-v5-0-3d383927c609@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NwU7DMBAE0F+pfMbIXq8bhxP/gSrktTetIU1Qn
 EZEVf6duBwoauE40sybs8g8JM7iaXMWA08pp75bg33YiHDw3Z5limsWoGCrKkA59t38LvOcg2/
 b19FTy7IGR0SaYEsk1uXHwE36vKgvu++cT/TGYSxUaRxSHvthvtxOuvT+f5i0VLIO1mjnEEz0z
 2nv2+QfQ38U5WKCa6S6j0BBbMRGM2OlmxvE/CBO/YGYFakCWg8mWEX2BsErRMN9BAuCLiqA2kd
 Uv5BlWb4AS3uiUZgBAAA=
X-Change-ID: 20260724-tonyk-syscall_table-928bbb1b26bb
To: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 kernel-dev@igalia.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-mips@vger.kernel.org, parclinux@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_103902_764359_D9852A75 
X-CRM114-Status: GOOD (  14.91  )
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

While implementing a new syscall, we need to wire up it's number to the arch
table. Since syscall number 403, all architectures are on sync regarding the
number (except alpha), which make things a lot easier but more repetitive as
well. Have a look at commit b36d4b6aa88 ("arch: hookup listns() system call"),
with 15 lines of mostly:

  +470    common  listns                          sys_listns

There's already a "common" table shared with a bunch of archs at
`scripts/syscall.tbl`, but due to historical reasons some archs will never be
able to move to this table and share all the numbers.

The generic table starts from 403 (clock_gettime64), the first common syscall.

I've compile tested for arm32, arm64, s390, mips, sparc and alpha by comparing
the syscalls_*.h and unistd_*.h files generated before and after this patchset.
For most of cases the files are identical, for the few cases that they are not,
there's a note in the commit explaining why they are equivalent.

Thanks!
	André

Changes in v5:
- Add archs lists to Cc
- alpha: Change custom alpha_syscall to __syscall
- mips: Use "common" for all ABI tables
- mips: Kept it as a single table for n32/n64
- Fix bug introduced by mixing --offset and --compat-offset
- v4: https://patch.msgid.link/20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com

Changes in v4:
- Replace cln3 with clone3 in the ABIs
- mips: Get rid of custom mips ABIs (o32, n32, n64) and use 32 and 64
- mips: Unify n32 and n64 tables
- Add alpha to the syscall party, along with it's adaptations
- Remove --no-compat option and define SYSCALL_WITH_COMPAT() macro for archs
that need it
- v3: https://patch.msgid.link/20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com

Changes in v3:
- Removed x86 for now, let's wait till x32 is dropped
- Added much more archs
- v2: https://patch.msgid.link/20260727-tonyk-syscall_table-v2-0-95d4f1ee471f@igalia.com

Changes in v2:
- Managed to move to the real first common syscall: 403 (clock_gettime64)
- Added -no-compat option to be used with x86_64
- v1: https://patch.msgid.link/20260724-tonyk-syscall_table-v1-0-9c53188423da@igalia.com

---
André Almeida (13):
      syscalls: Make --abis parsing more robust
      syscalls: Create unified partial table for all archs
      scripts/syscall.tbl: Use the common table
      arm: Use the common syscall table
      s390: Use the common syscall table
      sparc: Use the common syscall table
      mips: Remove duplicated syscallnr.sh
      mips: Get rid of custom mips ABIs for syscall tables
      mips: Use the common syscall table
      syscalls: Add an option for offsetting the common table
      alpha: Define entry point for set_mempolicy_home_node syscall
      alpha: Remove alpha_ prefix from custom syscall entries
      alpha: Use the common syscall table

 arch/alpha/kernel/entry.S                 |   8 +-
 arch/alpha/kernel/syscalls/Makefile       |  10 +-
 arch/alpha/kernel/syscalls/syscall.tbl    |  54 +-
 arch/alpha/kernel/systbls.S               |   1 +
 arch/arm/tools/Makefile                   |  10 +-
 arch/arm/tools/syscall.tbl                |  68 ---
 arch/arm64/tools/syscall_32.tbl           |  68 ---
 arch/mips/kernel/scall64-n32.S            |   1 +
 arch/mips/kernel/scall64-n64.S            |   2 +
 arch/mips/kernel/syscalls/Makefile        |  30 +-
 arch/mips/kernel/syscalls/syscall_n.tbl   | 464 +++++++++++++++++
 arch/mips/kernel/syscalls/syscall_n32.tbl | 412 ---------------
 arch/mips/kernel/syscalls/syscall_n64.tbl | 388 --------------
 arch/mips/kernel/syscalls/syscall_o32.tbl | 826 ++++++++++++++----------------
 arch/mips/kernel/syscalls/syscallnr.sh    |  26 -
 arch/s390/kernel/syscall.c                |   2 +
 arch/s390/kernel/syscalls/Makefile        |   8 +-
 arch/s390/kernel/syscalls/syscall.tbl     |  48 --
 arch/sparc/kernel/syscalls/Makefile       |   8 +-
 arch/sparc/kernel/syscalls/syscall.tbl    |  68 ---
 scripts/Makefile.asm-headers              |   9 +-
 scripts/syscall.tbl                       |  68 ---
 scripts/syscall_common.tbl                |  83 +++
 scripts/syscallhdr.sh                     |  81 ++-
 scripts/syscalltbl.sh                     |  47 +-
 25 files changed, 1094 insertions(+), 1696 deletions(-)
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260724-tonyk-syscall_table-928bbb1b26bb

Best regards,
--  
André Almeida <andrealmeid@igalia.com>


