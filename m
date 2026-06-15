Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325B5CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WrhOiAXY4BpdFNkpuEH5kqbHucFA9LBquobYeTzjtI4=; b=1VDH2pi2TcbXHT
	k4jtgfAobcSEinnOLtd96H4B9NH9u3m2FpkQOl7jcZarju+ecUFlXGOOklw3y71G9azhjIMBAMHgN
	S1imomac+pBSSmNe50ziVBtM5+J7rPDKlnnW6oCpMM0m5EoQIKRJQaIH3BT4Pf3YJqPDUFuV835CM
	7Q23DYTnrTT4i7B+VyCto8VfmX4OSiDPSZNUAg/h3D92I6za7pBAKoQswr2539Cme2T1OWgWZML9x
	TtgNCxtfWB286Q07816gz1B+cJrFkcWopN3HiTZ4qZ2+qOINqo6Awygfb4iyWSOFNgPButwaEULaf
	yoi7w3tfmS6ruWhMvKhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9t7-0000000EXvt-2Iap;
	Mon, 15 Jun 2026 16:10:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9t5-0000000EXvb-2bKw;
	Mon, 15 Jun 2026 16:10:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76F53600AB;
	Mon, 15 Jun 2026 16:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659B51F000E9;
	Mon, 15 Jun 2026 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539810;
	bh=WrhOiAXY4BpdFNkpuEH5kqbHucFA9LBquobYeTzjtI4=;
	h=From:Subject:Date:To:Cc;
	b=J2bt7UtU/OYY8PxVyIm3d95v5G+IcTrjBW3L2jU7dt2De3kFnXcxRBS+wcjkcf6fN
	 XltNpsJON5Ei+eQjAfRadOoGZ6Zr5MKKrnWqjtat85KDYFuJIzaAhhV9joTPZvvnm/
	 Upf4GSVXporZ+/9u524Qsag7+a/uWIBE8WrhynM4IvaF/bx9BOfhayePviKAuHtMdm
	 yF/mMlzcia/W4uNmZrGta+pMv2x8g5cbMGvX0YqVwoVCDJpU+Ht9xei0zv8nicGVwV
	 SRcRt86DYJ9ycUYURQM1lx9ByNJFh+o5TVH1JyohwC9u2Q2ptXr+Wwo4pEiWgn9BWI
	 W8aRU0vDmzPwg==
From: Vincent Mailhol <mailhol@kernel.org>
Subject: [PATCH 00/19] init: discoverable root partitions, a.k.a. an
 omittable "root=" cmdline option
Date: Mon, 15 Jun 2026 18:08:56 +0200
Message-Id: <20260615-discoverable-root_partitions-v1-0-39c78fac42e2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1hZaQQWvMgySNlEDYiUpMiDef
 YrLt/j/BmMVNpiaG5QvMclHRWgbSBseKzuhauh8N/ghBEdiKV+sGHd2mnOZT9QipXbmImGKSNi
 PnqAuTuVFfu/+832eP+2uWG1uAAAA
X-Change-ID: 20260611-discoverable-root_partitions-bdacbada570d
To: Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso <dave@stgolabs.net>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-efi@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 linux-alpha@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, 
 linux-snps-arc@lists.infradead.org, Russell King <linux@armlinux.org.uk>, 
 linux-arm-kernel@lists.infradead.org, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 loongarch@lists.linux.dev, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-mips@vger.kernel.org, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6653; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=RjmwbjJUekMN4XQbpwM2sAMQ8Q4VGqazX1lTIqnbeDs=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFkGyhcU3klMvHNzftiCl6lmH3kWl02+abz8VKXHlaTy/
 w4vP39V7pjIwiDGxWAppsiyrJyTW6Gj0Dvs0F9LmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMWLg4hSAqfbXZfgr2rolQuyW6w6JgNKDJ4tvO69i+ZPHkj6Tv9JAckFms/tLRoYma5u3R6a
 1csurnulLb7M78HnNmlIVnlf38k/kSby8dJsZAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
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

DPS [1] defines GPT partition type UUIDs for OS partitions and
attributes that control whether such partitions should be
automatically discovered. The specification states that:

  The OS can discover and mount the necessary file systems with a
  non-existent or incomplete /etc/fstab file and without the root=
  kernel command line option.

DPS is already implemented in systemd-gpt-auto-generator [2], which,
when embedded in an initrd, indeed allows automatic detection of the
root filesystem through its partition type UUID.

This series adds this discovery feature directly into the kernel so
that people who are not using systemd or not using an initrd can still
benefit from it. The implementation follows the same model as
systemd-gpt-auto-generator:

  - GPT partition type UUIDs are used for automatic discovery policy
    only. No root=PARTTYPEUUID=xxx cmdline option or similar syntax is
    added.

  - The root= cmdline option takes precedence. This prevents unexpected
    behaviour.

  - Only the disk with the active EFI System Partition is scanned, as
    required by DPS. The disk is identified through the Boot Loader
    Interface LoaderDevicePartUUID EFI variable.

The DPS no-auto attribute is also implemented, giving another option for
the user to disable this auto discovery. However, the DPS read-only
attribute is intentionally not enforced. The kernel already mounts the
root filesystem read-only by default unless the command line requests
rw, and user space remains responsible for deciding whether a discovered
root should later be remounted read-write based on DPS metadata and
local policy. The other partition type UUIDs (home, swap, var...) are
also out of scope for the same reason: user space remains responsible
for mounting anything other than the root partition.

Patch 1 adds the ARCH_HAS_DPS_ROOT_PARTITION_TYPE_UUID capability and
the hidden CONFIG_DPS_ROOT_AUTO_DISCOVERY Kconfig symbol used to signal
whether the feature is available. Patches 2 to 12 declare the
ARCH_HAS_DPS_ROOT_PARTITION_TYPE_UUID capability for the supported
architectures and define their architecture-specific root partition type
UUID values in asm/dps_root.h.

Patches 13 to 16 make the GPT partition type UUID and the no-auto
attribute available during early block lookup.

Patch 17 is a small code refactor that prepares for patch 18, which
updates the root mount path so that, when root= is omitted, the kernel
reads LoaderDevicePartUUID and uses the early block lookup
infrastructure to discover the DPS root partition on that disk.

Finally, patch 19 documents this automatic root discovery feature.

Tested with GRUB, which implements the LoaderDevicePartUUID EFI variable
in its bli module [3]. With this, I was able to boot a kernel with a
completely empty cmdline and no initrd.

[1] The Discoverable Partitions Specification (DPS)
Link: https://uapi-group.org/specifications/specs/discoverable_partitions_specification/

[2] systemd-gpt-auto-generator
Link: https://www.freedesktop.org/software/systemd/man/latest/systemd-gpt-auto-generator.html

[3] GRUB -- §16.2 bli
Link: https://www.gnu.org/software/grub/manual/grub/html_node/bli_005fmodule.html

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Vincent Mailhol (19):
      init: add DPS root partition type UUID capability
      alpha: define DPS root partition type UUID
      arc: define DPS root partition type UUID
      arm: define DPS root partition type UUID
      arm64: define DPS root partition type UUID
      loongarch: define DPS root partition type UUID
      mips: define DPS root partition type UUIDs
      parisc: define DPS root partition type UUID
      powerpc: define DPS root partition type UUIDs
      riscv: define DPS root partition type UUIDs
      s390: define DPS root partition type UUIDs
      x86: define DPS root partition type UUIDs
      block: store GPT partition type UUID
      block: add early_lookup_bdev_by_type_uuid()
      block: store GPT attributes as a raw value
      block: don't discover partition with DPS no-auto GPT attribute
      init: factor out root device lookup into lookup_root_device()
      init: discover root by DPS partition type UUID
      docs: document discoverable root partitions

 Documentation/admin-guide/discoverable-root.rst | 33 +++++++++
 Documentation/admin-guide/index.rst             |  1 +
 Documentation/admin-guide/kernel-parameters.txt |  5 ++
 arch/alpha/Kconfig                              |  1 +
 arch/alpha/include/asm/dps_root.h               |  8 +++
 arch/arc/Kconfig                                |  1 +
 arch/arc/include/asm/dps_root.h                 |  8 +++
 arch/arm/Kconfig                                |  1 +
 arch/arm/include/asm/dps_root.h                 |  8 +++
 arch/arm64/Kconfig                              |  1 +
 arch/arm64/include/asm/dps_root.h               |  8 +++
 arch/loongarch/Kconfig                          |  1 +
 arch/loongarch/include/asm/dps_root.h           |  8 +++
 arch/mips/Kconfig                               |  1 +
 arch/mips/include/asm/dps_root.h                | 20 ++++++
 arch/parisc/Kconfig                             |  1 +
 arch/parisc/include/asm/dps_root.h              |  8 +++
 arch/powerpc/Kconfig                            |  1 +
 arch/powerpc/include/asm/dps_root.h             | 16 +++++
 arch/riscv/Kconfig                              |  1 +
 arch/riscv/include/asm/dps_root.h               | 12 ++++
 arch/s390/Kconfig                               |  1 +
 arch/s390/include/asm/dps_root.h                | 12 ++++
 arch/x86/Kconfig                                |  1 +
 arch/x86/include/asm/dps_root.h                 | 12 ++++
 block/blk.h                                     |  1 +
 block/early-lookup.c                            | 68 +++++++++++++++++-
 block/partitions/core.c                         |  2 +
 block/partitions/efi.c                          |  3 +
 block/partitions/efi.h                          | 11 ++-
 include/linux/blk_types.h                       |  1 +
 include/linux/blkdev.h                          |  5 ++
 include/linux/root_dev.h                        |  6 ++
 init/Kconfig                                    |  6 ++
 init/do_mounts.c                                | 94 ++++++++++++++++++++++++-
 35 files changed, 355 insertions(+), 12 deletions(-)
---
base-commit: 36808d5e983985bbda87e01059cccc071fe3ec8d
change-id: 20260611-discoverable-root_partitions-bdacbada570d

Best regards,
-- 
Vincent Mailhol <mailhol@kernel.org>


