Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4F6C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 17:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OyCuvjHuxSPR1hkagfM/RsHa0ENTfkjdD4WRpNm9UZQ=; b=16PYbOSD2rTqtObkhVZJthozO9
	HdUwXzFNDsDORcMF9xmtGrcZ70H8/mOZ3JsxK6XMJjXa3VXnTB3h4Asy4ztSDpdtVDS90pyuWmu9u
	lrsQlrZnC08VTpYL/0YFHUGWmc0nF+EWYvHRx9EL9I0yMYA5m80I8B70AeD4afHSv2hGxkVWeIYSC
	3d7/AbSSjHExRsJqB5Y7n1BluHYzCI+2JhtFnk3zbqFMcMiJoQBLa69GQ6taxAUWHpWK9BlG7lax6
	Zkz6a6EpAHPXx2fFKtICTHWE/IvF24HsIknoAIfm4ECZg7TLZZixh+RJJqhWfCh7G5ClyBGs7+CWP
	S4UtQlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5gD-00000006zDW-3q4P;
	Thu, 06 Feb 2025 17:28:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5eq-00000006z1F-1keR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 17:27:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DC255C66EE;
	Thu,  6 Feb 2025 17:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCF6C4CEDD;
	Thu,  6 Feb 2025 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738862839;
	bh=pPmLZssZVb0h1amjrYDb6Gwl7U84SRos3SRqFBYvoCo=;
	h=From:Date:Subject:To:Cc:From;
	b=bYBURifiYdmqDU+oTvDryxlGF6HdiUW+WvteWC1oxTFN+XGfdL1BNVaER58x8OtIE
	 IdKrOpUoXHVeykjblCZ4ptC6a04lDIVjqsrj9c5rgGpj1bK6NXA0U48B+lFnoMObIE
	 gYtgFeBqOog5L317/SLiPgBPKKtoESVsFBhkXYcuXNoky9w8UByRZ/8OYrrDiep3EV
	 rsOfHBP2MyesRJroDTO5kPFpjUUbcWcgJB3B1P/o1hcvnu1j0WbBsPjCUsRnh47IDI
	 aeTapHdfhAakZ39fwHXZ3BXCGThmljkoP7u8sr3XS+w6qzw4wzXor+jPiNTFNwYiPl
	 IVNkCU6/AqYKg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 06 Feb 2025 10:21:38 -0700
Subject: [PATCH v3] arm64: Handle .ARM.attributes section in linker scripts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-arm64-handle-arm-attributes-in-linker-script-v3-1-d53d169913eb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKHvpGcC/5WNyw6CMBBFf4V07Rj6QnTlfxgXBQadiIVMK9EQ/
 t1CYoxLl+fe5JxJBGTCIA7ZJBhHCtT7BHqTifrq/AWBmsRC5crmUmlwfC8MpKvpcAFwMTJVj4g
 ByENH/oYMoWYaIpTKISqrpXa1SMqBsaXnmjudE18pxJ5fa32Uy/oJmf9CowQJOyO1rYq61WZ/T
 KfHbtvzRSylUX3tKv/XrpK9KUqT73ettdb82Od5fgPktuqQRwEAAA==
X-Change-ID: 20250123-arm64-handle-arm-attributes-in-linker-script-82aee25313ac
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2841; i=nathan@kernel.org;
 h=from:subject:message-id; bh=pPmLZssZVb0h1amjrYDb6Gwl7U84SRos3SRqFBYvoCo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOlLPnxV+6A67+IFds/l3b5sU1/8niS54G3eHR6XVy03n
 H2kn4fJdZSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJKB1jZNhiENbys+tSl9w+
 rkVL94q4npbStW/y+bFusfHsh8rWLf8ZGVr7NlVukIz0WbhMdH7u8hsfLriuOKzteLeT/7rQas3
 FScwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_092720_544171_06E6BE5C 
X-CRM114-Status: GOOD (  10.91  )
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
Changes in v3:
- Update location of section discard in vDSO to align with
  .note.gnu.property discard since the sectionss are similar in
  nature (Will).
- Link to v2: https://lore.kernel.org/r/20250204-arm64-handle-arm-attributes-in-linker-script-v2-1-d684097f5554@kernel.org

Changes in v2:
- Discard the section instead of adding it to the final artifacts to
  mirror the .note.gnu.property section handling (Will).
- Link to v1: https://lore.kernel.org/r/20250124-arm64-handle-arm-attributes-in-linker-script-v1-1-74135b6cf349@kernel.org
---
 arch/arm64/kernel/vdso/vdso.lds.S | 1 +
 arch/arm64/kernel/vmlinux.lds.S   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index 4ec32e86a8da..47ad6944f9f0 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -41,6 +41,7 @@ SECTIONS
 	 */
 	/DISCARD/	: {
 		*(.note.GNU-stack .note.gnu.property)
+		*(.ARM.attributes)
 	}
 	.note		: { *(.note.*) }		:text	:note
 
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


