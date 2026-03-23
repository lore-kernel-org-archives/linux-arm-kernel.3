Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655DBEC01D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 11:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxnppuImLMBgT4VBsGkDuaPUxODcTjjrpyoPcgMsU1k=; b=pOb4yDtf1ZsQ6/IFsL8PMg5UbE
	CzZBWeWz3doadL2kdlS8IQqRALfW7+qY6SZrvouyGqgEjxPfE/J+Cf8w6O0IxUpqzfZ4EkhWrzXaK
	71VyFfwsYTUpdKt+xN9PlEkY35PG1HxvcMKBSr3itsbPSUrSv13mtGaqhbWgadq5tieij7Qj2Lh+n
	Cew18AVjt8okOuJ85lXuHymkBCngeLxDbz5zgEndBPhmrH9zqWWwj0+vvUC1PcgHBZrzhxm82PNPZ
	BfW/+wt6nqPyMrSE2V5qQQ4ykiju5bHs8nuVPBIGgBi9K0grOgNTBlun64yA21l9UesjanQd5UuBD
	yqzA9wgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4di3-0000000Gdny-2RPC;
	Mon, 23 Mar 2026 11:44:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4di1-0000000Gdnr-2kaz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 11:44:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96CD36013A;
	Mon, 23 Mar 2026 11:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622CAC4CEF7;
	Mon, 23 Mar 2026 11:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774266276;
	bh=aXd296Lm46/RWsbI4I1OOM2FgVG5HdKEPdtKxCcKiSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gR/RCY7xEISChh9Lrf9qGuhPEZS19LykvA5um6hJZDCEVVMpMFmEesD49v4VS0VeX
	 7tvtxyMDQ8xUKY4iIhm3sU/C9WMRUdj6Z81Mw6hUi1GQnRCuXsZFys+7kWnJiM8LcH
	 8qIODBP67hQ9u9z4blHsBR/iyNhx3ikj0My0HbCKCwAfCv1CzXTou3L+pTZAo5icZX
	 O7F1SyOoy3ailgv1X6DwqsvZtE5mFHC/I3tpfFNVdXE7iSSWu4p62HgxDdHbQH+JxZ
	 xHniVseYGTA81Swnq7Ya3s5cLs7Yq1ml1dSxfQYULHCaMrleKub1aY5HyQ6V3LTinA
	 /L+uZAmg1tcww==
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: fix architecture-specific compat_ftruncate64 implementations
Date: Mon, 23 Mar 2026 12:44:08 +0100
Message-ID: <20260323-pocht-abberufen-825ffe02281f@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323070205.2939118-1-hch@lst.de>
References: <20260323070205.2939118-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=2179; i=brauner@kernel.org; h=from:subject:message-id; bh=aXd296Lm46/RWsbI4I1OOM2FgVG5HdKEPdtKxCcKiSg=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQeVJ/Ny96b4PNJrzr+9NOiA/8+bLx4YW3lMTVfacWzS 0yOhLLad5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzkwDmGf1plEULnTrzd+kq7 uMavcddW/zt2IduMvmY9VrKaK9Qs58Lw3/Gk5+XnL/zeeZz4yxfF98j+tsyNy3aT8znSj9yckRz wkh0A
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
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

On Mon, 23 Mar 2026 08:01:43 +0100, Christoph Hellwig wrote:
> this series fixes a really old bug found by code inspection, where the
> architecture-specific 32-bit compat ftruncate64 implementations enforce
> the non-LFS file size limit unless opened with O_LARGEFILE.
> 
> Diffstat:
>  arch/arm64/kernel/sys32.c       |    2 +-
>  arch/mips/kernel/linux32.c      |    2 +-
>  arch/parisc/kernel/sys_parisc.c |    4 ++--
>  arch/powerpc/kernel/sys_ppc32.c |    2 +-
>  arch/sparc/kernel/sys_sparc32.c |    2 +-
>  arch/x86/kernel/sys_ia32.c      |    3 ++-
>  fs/internal.h                   |    3 +--
>  fs/open.c                       |   40 +++++++++++++++++++---------------------
>  include/linux/syscalls.h        |   16 +++-------------
>  io_uring/truncate.c             |    2 +-
>  10 files changed, 32 insertions(+), 44 deletions(-)
> 
> [...]

VFS CI: https://github.com/linux-fsdevel/vfs/actions/runs/23425735066

  x86_64 (gcc, debian, ovl-fstests)  pass
  x86_64 (gcc, debian, selftests)    pass
  x86_64 (gcc, debian, xfstests)     pass
  x86_64 (gcc, fedora, ovl-fstests)  pass
  x86_64 (gcc, fedora, selftests)    pass
  x86_64 (gcc, fedora, xfstests)     pass

---

Applied to the vfs-7.1.misc branch of the vfs/vfs.git tree.
Patches in the vfs-7.1.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.1.misc

[1/3] fs: fix archiecture-specific compat_ftruncate64
      https://git.kernel.org/vfs/vfs/c/e43dce8a0bc0
[2/3] fs: pass on FTRUNCATE_* flags to do_truncate
      https://git.kernel.org/vfs/vfs/c/0924f6b80d4a
[3/3] fs: remove do_sys_truncate
      https://git.kernel.org/vfs/vfs/c/e8767a3134ca

