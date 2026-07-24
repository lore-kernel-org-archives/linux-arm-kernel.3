Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD760C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=77TlUQQ5Ug6Bo+r9yStAO1cYSC7lbr5tqO3K9ciX64s=; b=vfolbitYtEi3SixbxysPBCOQjS
	gDk39K5tvekSxwpmMuu/MqIXSa/Qtl0N0v3qSIqMgGI8mTpDuPOjcYh1ffT3U/h0Rc3934uHF8B2u
	3KVxjqM8LExoDzGzLzRP9otSAcdNgvmXq8eCOKph+AiQwRNyGat6DQ/aTrFRutgfJXCYdgp5eEfZG
	0CVfWFyNThXSIGNrSBlK/RiD2KZ13MDYKG+xafVOyALukwk0cTYi9B5EygDkCskAgtQJ2OW9GhXl1
	V6S/a8TofLgrZ5y4EYqtJl0TjSWnja9zMnB8Jd38L7grs9++ZYgicGh+lKqWDwozmKxKuLgWUMlQc
	6CRPzhHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn5Qi-0000000FMz0-3TdN;
	Fri, 24 Jul 2026 02:14:28 +0000
Received: from m16.mail.126.com ([117.135.210.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn5Qg-0000000FMxt-1Yaj;
	Fri, 24 Jul 2026 02:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=77
	TlUQQ5Ug6Bo+r9yStAO1cYSC7lbr5tqO3K9ciX64s=; b=A58Q0hC7pBgmyd1P0k
	hLdauK2xNyRBVzvhAisrBvhwe51IYuU3v9CdBPEmeUuNhaOUQCGDOQWF5MJocr6d
	sUDDytIRZ4RCNVAsuNo5OmI5d3/Yw40nyoy5CkXb3KuvjzGCqY5FdMsT584qwXjb
	/BY0wrzWkU1UlbE8vhPU3x/hE=
Received: from song-MS-7D48.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSkvCgDnr+wRymJqH7z4DA--.34972S2;
	Fri, 24 Jul 2026 10:12:35 +0800 (CST)
From: Song Chen <chensong_2000@126.com>
To: arnd@arndb.de,
	kees@kernel.org,
	clm@fb.com,
	dsterba@suse.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	guoren@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	gor@linux.ibm.com,
	borntraeger@linux.ibm.com,
	agordeev@linux.ibm.com,
	svens@linux.ibm.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	jpoimboe@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Song Chen <chensong_2000@126.com>
Subject: [RFC PATCH v2 0/3] btrfs: add error injection support for checksum verification
Date: Fri, 24 Jul 2026 10:12:26 +0800
Message-ID: <20260724021229.47302-1-chensong_2000@126.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSkvCgDnr+wRymJqH7z4DA--.34972S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1xWr1UWw47tryUKF4Durg_yoW8GF1rpr
	y3u3s3uryrC34fCrnxAay8Zw1Fkrs5W34UXFnrG348W343Za4qq3WkKa4UJ3WS9rWUGw17
	X3WUKr4UWr1UAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UonmiUUUUU=
X-Originating-IP: [221.238.56.48]
X-CM-SenderInfo: xfkh02prqjsjqqqqqiyswou0bp/xtbBsxPpaWpiyhNNnAAA3g
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_191426_802524_1288D229 
X-CRM114-Status: UNSURE (   8.44  )
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

This patchset adds fault injection support for btrfs_data_csum_ok,
enabling controlled simulation of checksum mismatches to test btrfs
silent data corruption detection and reporting paths.

The first patch extends the error injection framework with a new type,
EI_ETYPE_FALSE, which allows bool-returning functions to be overridden
with a false return value directly.

The second patch marks btrfs_data_csum_ok with ALLOW_ERROR_INJECTION
using this new type.

The third patch adds a parent field to fei_attr to allow fault injection
on a function only when called from a specific parent function. 

Song Chen (3):
  error-injection: Introduce EI_ETYPE_FALSE for fail_function
  btrfs: Allow error injection on btrfs_data_csum_ok
  error-injection: Introduce parent in fei_attr

 arch/arm/lib/error-inject.c           |  6 ++
 arch/arm64/lib/error-inject.c         |  6 ++
 arch/csky/lib/error-inject.c          |  6 ++
 arch/loongarch/lib/error-inject.c     |  6 ++
 arch/powerpc/lib/error-inject.c       |  6 ++
 arch/riscv/lib/error-inject.c         |  6 ++
 arch/s390/lib/error-inject.c          |  6 ++
 arch/x86/lib/error-inject.c           |  6 ++
 fs/btrfs/inode.c                      |  1 +
 include/asm-generic/error-injection.h |  6 ++
 kernel/fail_function.c                | 98 ++++++++++++++++++++++++++-
 11 files changed, 152 insertions(+), 1 deletion(-)

---
changelog:
v1 --- v2:
Add a parent field to struct fei_attr.

-- 
2.43.0


