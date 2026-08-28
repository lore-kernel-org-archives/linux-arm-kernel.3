Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A07C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 23:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3lS8Pe52E15AsSTbFDf2Q8tOnEgRxl/Bw8+tn4QAZ3Q=; b=E3HyrRJ9sr0Bvb
	S2iF3YZSqN5gfcnhzqKd5kmL+M0QHbh2SM3k7TCUIoOK1it0VO37n6o29dh9Zeb26fcEx5y9LMYfJ
	hl5MEypPlnmGbreymX+/OiNhNn7nsUiEVQ7USC+60OsVexJv3E9rzAREggEGI6Su6ghc7v56bEje5
	V7F5a4VsJKQXF67Y1QDUV/b2C3GNn7TK7SfrrVBQYAwcKupKyVl6l+RlrSoBZU/DLEQe3sKcOn11O
	dJ3e5hmy7J62VkdgL9U/jMUE41R9BzeeiuVZKz85r888Mf/wvlztHYGNOcNgzDnbsHWT5jsyAMgLr
	nNj6dq5IL+hBV0JgODDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x05rY-00000006UXm-3pzI;
	Fri, 28 Aug 2026 23:19:56 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x05rU-00000006UW7-46AD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 23:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Reply-To;
	bh=3lS8Pe52E15AsSTbFDf2Q8tOnEgRxl/Bw8+tn4QAZ3Q=; b=AFBr+8MF6Vo2i6RVnqs6KlfZGV
	MqMzbqDgglqnFphc/cnp9EsC5M1YMlCCa8uuHY82nTwytw0vgNMyHDHGwexSVgELFlkEj36oG5H8/
	fqvxBpUdG7QMdriCtgNoTTLJU8jeZHfvE64QQJITv/uP+DgdJCeuhOp0aG12Z++AbA0QHqB1IjVtf
	9xVemXIycIb/pvCosC495IjxXXO01gZjV+hF1isHqoD/O4Y9/9GmyMjdY/gWK2VXp0yuWg4MLxnn2
	aV8w51KZdz8AR29jCkajERX+bxfEmlnltDqEOEGYexi9CZ8hOR2XgRjSpQAIBenxVLPKrox169wKa
	BHvhK/Jg==;
Received: from [187.57.78.212] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x05rI-00B3sF-KD; Sat, 29 Aug 2026 01:19:40 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v6 00/13] syscalls: Add a shared table for all archs
Date: Fri, 28 Aug 2026 20:19:27 -0300
Message-Id: <20260828-tonyk-syscall_table-v6-0-fdd358456cf1@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NTU7DMBQE4KtUXmNkP9uxzYp7VBXyz0trCAmKQ
 0RU5e7YZUFRCmI50sw3Z5JxTJjJw+5MRpxTTkNfQnO3I+Hk+iPSFEsmwKBhGiSdhn55oXnJwXX
 d0+R8h9SC8d5zD433pCzfRmzTx0XdH75yfvfPGKZK1cYp5WkYl8vtzGvv74eZU0ZtUIIbI0FE9
 5iOrkvuPgyvpF7McI3o2whUREXZckSpebtBxDdi2C+IKIgOUjkQQTGvNoi8QjjcRmRFpIkMwLo
 o2QZR/0BUQUQURljQoWH2B7Ku6yfn2gP73QEAAA==
X-Change-ID: 20260724-tonyk-syscall_table-928bbb1b26bb
To: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_161953_307240_CD217B0D 
X-CRM114-Status: GOOD (  15.36  )
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

Changes in v6:
- Rebased on top of 7.3-rc0: new syscall fchroot()
- Fix compliance with POSIX shells
- Add $(syscalltbl_common) to the prereq build files, so the build is triggered
if the common table changes
- v5: https://patch.msgid.link/20260812-tonyk-syscall_table-v5-0-3d383927c609@igalia.com

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
 arch/alpha/kernel/syscalls/Makefile       |  14 +-
 arch/alpha/kernel/syscalls/syscall.tbl    |  55 +-
 arch/alpha/kernel/systbls.S               |   1 +
 arch/arm/tools/Makefile                   |  14 +-
 arch/arm/tools/syscall.tbl                |  69 ---
 arch/arm64/tools/syscall_32.tbl           |  69 ---
 arch/mips/kernel/scall64-n32.S            |   1 +
 arch/mips/kernel/scall64-n64.S            |   2 +
 arch/mips/kernel/syscalls/Makefile        |  30 +-
 arch/mips/kernel/syscalls/syscall_n.tbl   | 464 +++++++++++++++++
 arch/mips/kernel/syscalls/syscall_n32.tbl | 413 ---------------
 arch/mips/kernel/syscalls/syscall_n64.tbl | 389 --------------
 arch/mips/kernel/syscalls/syscall_o32.tbl | 827 ++++++++++++++----------------
 arch/mips/kernel/syscalls/syscallnr.sh    |  26 -
 arch/s390/kernel/syscall.c                |   2 +
 arch/s390/kernel/syscalls/Makefile        |  12 +-
 arch/s390/kernel/syscalls/syscall.tbl     |  49 --
 arch/sparc/kernel/syscalls/Makefile       |  12 +-
 arch/sparc/kernel/syscalls/syscall.tbl    |  69 ---
 scripts/Makefile.asm-headers              |  15 +-
 scripts/syscall.tbl                       |  69 ---
 scripts/syscall_common.tbl                |  84 +++
 scripts/syscallhdr.sh                     |  83 ++-
 scripts/syscalltbl.sh                     |  50 +-
 25 files changed, 1111 insertions(+), 1716 deletions(-)
---
base-commit: 548e7bcd0c5460ddcbca9600cea603ebeebf4da7
change-id: 20260724-tonyk-syscall_table-928bbb1b26bb

Best regards,
--  
André Almeida <andrealmeid@igalia.com>


