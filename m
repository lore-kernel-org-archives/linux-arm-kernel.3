Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E54C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 21:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9dbQX0IutHksS3KeyzCUfsCg5UoTyCBTj83nI6SiFGg=; b=MlLkHsQYWDwZcDbSPu7KtQ25jK
	KCqR02BMWooOVsVAu+8dG9Se/KWoAduPs0WUCUEpCpySV4x6Un45t0mrVR2xfOfVmze5KOeA3Q9Ui
	uZgGevLUgIAEnxvB0RrNAgJCiKVXIOuzbyvB8kXDTa40tx8gZptYWACZgJHE/yagCrdsjQ35lHiAy
	5t1qBtg5uLc0aS9WTl6QdgoZycfYZ0FLQquBtqvbAlDKXDvhH/rp7vCLkDTTGep/lJqVlO9fTXpSZ
	xG14jcape+E0CDkis0oEjkCICzU2+IM2DZPEw2eP/eYebkHBU5pvwS93BNgWY4EP9miu7XOiMhhJu
	Ucy2YGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQH4-00000001ZEa-3ZZw;
	Tue, 04 Feb 2025 21:16:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfN2u-000000019Bi-2dmW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 17:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC75D5C6190;
	Tue,  4 Feb 2025 17:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5820C4CEDF;
	Tue,  4 Feb 2025 17:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738691351;
	bh=rXAK34OphyEItP6/+639hQrb7zlf+ZgtdRAQ99Mc1xA=;
	h=From:Date:Subject:To:Cc:From;
	b=SHtnS5KtsZ/GOENUm5oQLadqfIxf887yWaCuZngDsiv7/CyDO9QC34fijUzxSRrVQ
	 kngZDnCH3unbXVxFTR1GxMquyEiACyFsVKrPj4yeLVPUlnNETP0mXxW7iswjxU3KlW
	 /McoIFOGzYDLIuIXTUiRu4dlzQ7HXgW8WB1z+iTtn18pR6AMMLGsxZzC/x9kHfcIOh
	 T3da3wf/qvYrWehDk8r5wVS0UMofLrV8hFynf+w7TTf+PY99/jrik4Y1hsfVmA6kxR
	 tytim7CxgxFzQeV/FTL/cQmo6RQkZsCG7Olaw14EdKN/pSFujkGTkWP4PuNtNbF9jn
	 0fogOD/mQ/kAQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 04 Feb 2025 10:48:55 -0700
Subject: [PATCH v2] arm64: Handle .ARM.attributes section in linker scripts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-arm64-handle-arm-attributes-in-linker-script-v2-1-d684097f5554@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAZTomcC/5WNyw6CMBBFf4V07Rj6AB8r/8OwKGWAiVjItBIN4
 d8tJH6Ay3NPcs8iAjJhENdsEYwzBRp9AnXIhOut7xCoSSxUropcKg2Wn6WBpJoBNwAbI1P9ihi
 APAzkH8gQHNMU4awsoiq01NaJdDkxtvTec/cqcU8hjvzZ67Pc1l/I/BeaJUg4GamLunStNpdbk
 h6H48idqNZ1/QLKQtx56QAAAA==
X-Change-ID: 20250123-arm64-handle-arm-attributes-in-linker-script-82aee25313ac
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2567; i=nathan@kernel.org;
 h=from:subject:message-id; bh=rXAK34OphyEItP6/+639hQrb7zlf+ZgtdRAQ99Mc1xA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOmLgkVPWnK9OzmvIvdskY3O/JnndpzanxPoV98gZS8Uo
 c038eCCjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjARhamMDB0LlsU8eMydZMf/
 Jz9cUGOBxqbSa3cXLD0levu1rdbunX8ZGTa3exwvDM59N3HSnji5A3vPGxt9M9++e3fGg5o/iss
 j7dkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_094912_759379_9AB9F4C8 
X-CRM114-Status: GOOD (  10.78  )
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

A recent LLVM commit [1] started generating an .ARM.attributes section
similar to the one that exists for 32-bit, which results in orphan
section warnings (or errors if CONFIG_WERROR is enabled) from the linker
because it is not handled in the arm64 linker scripts.

  ld.lld: error: arch/arm64/kernel/vdso/vgettimeofday.o:(.ARM.attributes) is being placed in '.ARM.attributes'
  ld.lld: error: arch/arm64/kernel/vdso/vgetrandom.o:(.ARM.attributes) is being placed in '.ARM.attributes'

  ld.lld: error: vmlinux.a(lib/vsprintf.o):(.ARM.attributes) is being placed in '.ARM.attributes'
  ld.lld: error: vmlinux.a(lib/win_minmax.o):(.ARM.attributes) is being placed in '.ARM.attributes'
  ld.lld: error: vmlinux.a(lib/xarray.o):(.ARM.attributes) is being placed in '.ARM.attributes'

Discard the new sections in the necessary linker scripts to resolve the
warnings, as the kernel and vDSO do not need to retain it, similar to
the .note.gnu.property section.

Cc: stable@vger.kernel.org
Fixes: b3e5d80d0c48 ("arm64/build: Warn on orphan section placement")
Link: https://github.com/llvm/llvm-project/commit/ee99c4d4845db66c4daa2373352133f4b237c942 [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Changes in v2:
- Discard the section instead of adding it to the final artifacts to
  mirror the .note.gnu.property section handling (Will).
- Link to v1: https://lore.kernel.org/r/20250124-arm64-handle-arm-attributes-in-linker-script-v1-1-74135b6cf349@kernel.org
---
 arch/arm64/kernel/vdso/vdso.lds.S | 1 +
 arch/arm64/kernel/vmlinux.lds.S   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index 4ec32e86a8da..8095fef66209 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -80,6 +80,7 @@ SECTIONS
 		*(.data .data.* .gnu.linkonce.d.* .sdata*)
 		*(.bss .sbss .dynbss .dynsbss)
 		*(.eh_frame .eh_frame_hdr)
+		*(.ARM.attributes)
 	}
 }
 
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index f84c71f04d9e..e73326bd3ff7 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -162,6 +162,7 @@ SECTIONS
 	/DISCARD/ : {
 		*(.interp .dynamic)
 		*(.dynsym .dynstr .hash .gnu.hash)
+		*(.ARM.attributes)
 	}
 
 	. = KIMAGE_VADDR;

---
base-commit: 1dd3393696efba1598aa7692939bba99d0cffae3
change-id: 20250123-arm64-handle-arm-attributes-in-linker-script-82aee25313ac

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


