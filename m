Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11ABF4645E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 12:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6E+dKhZEiGUG0B2R4F9V5NwBD3IvG5yQHAXHWZtspsE=; b=jNU+TIKIuuCD/jvaGDtLCUFtNA
	D56Y0CNATUnuXrsmRkmk2IPhPItqpJil+LqyFhwuQy2CgtvnaGYcCdLTkbz9Nqn21gqKJ99qPiZVe
	IUWhaUGe+8qj0qzU909SrmADOLA3gtY5gto5arkRGxup5g2tx8g7Ec3V1RQ2x3bVMjJrgNMQrmUf7
	0Tq2F5a55O89EywpEmwFhStNF+nkoBgle+FDA00CEiNHq2049QFPMl0os94PWfSq4asIYy+hwaEOT
	qwb2t1lHResE1LntpDh3U4dMY+KLsP+EiBlnVE1RZpfrvA5AkhEeG/ktgBgRDX27fskYbhMUygtYc
	Lodb64lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26oa-00000003uR2-0EkK;
	Mon, 16 Mar 2026 12:12:56 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26oY-00000003uQg-1HSo;
	Mon, 16 Mar 2026 12:12:55 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.19])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3BAAB20B710C;
	Mon, 16 Mar 2026 05:12:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3BAAB20B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773663171;
	bh=6E+dKhZEiGUG0B2R4F9V5NwBD3IvG5yQHAXHWZtspsE=;
	h=From:To:Cc:Subject:Date:From;
	b=KmMzN+L72LBHYNUzHaLuEqLmYUZbFE86Ghb9lbKG5LUyRumq1Pfq+2svrA0+xYFZO
	 icrvijbYw47VQDkU6veDLhVKqlnse8g07r2eqLanFYIkoRzULa0MthPoLVSiv4VasW
	 5uFwpbJrFIVM1RNuHNLwoLRVAHOnsvo3dZAS4584=
From: Naman Jain <namjain@linux.microsoft.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	ssengar@linux.microsoft.com,
	Michael Kelley <mhklinux@outlook.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 00/11] Drivers: hv: Add ARM64 support in mshv_vtl
Date: Mon, 16 Mar 2026 12:12:30 +0000
Message-ID: <20260316121241.910764-1-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_051254_400651_1FEC265E 
X-CRM114-Status: UNSURE (   9.06  )
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

The series intends to add support for ARM64 to mshv_vtl driver.
For this, common Hyper-V code is refactored, necessary support is added,
mshv_vtl_main.c is refactored and then finally support is added in
Kconfig.

Based on commit 1f318b96cc84 ("Linux 7.0-rc3")

Naman Jain (11):
  arch: arm64: Export arch_smp_send_reschedule for mshv_vtl module
  Drivers: hv: Move hv_vp_assist_page to common files
  Drivers: hv: Add support to setup percpu vmbus handler
  Drivers: hv: Refactor mshv_vtl for ARM64 support to be added
  drivers: hv: Export vmbus_interrupt for mshv_vtl module
  Drivers: hv: Make sint vector architecture neutral in MSHV_VTL
  arch: arm64: Add support for mshv_vtl_return_call
  Drivers: hv: mshv_vtl: Move register page config to arch-specific
    files
  Drivers: hv: mshv_vtl: Let userspace do VSM configuration
  Drivers: hv: Add support for arm64 in MSHV_VTL
  Drivers: hv: Kconfig: Add ARM64 support for MSHV_VTL

 arch/arm64/hyperv/Makefile        |   1 +
 arch/arm64/hyperv/hv_vtl.c        | 152 ++++++++++++++++++++++
 arch/arm64/hyperv/mshyperv.c      |  13 ++
 arch/arm64/include/asm/mshyperv.h |  28 ++++
 arch/arm64/kernel/smp.c           |   1 +
 arch/x86/hyperv/hv_init.c         |  88 +------------
 arch/x86/hyperv/hv_vtl.c          | 130 +++++++++++++++++++
 arch/x86/include/asm/mshyperv.h   |   8 +-
 drivers/hv/Kconfig                |   2 +-
 drivers/hv/hv_common.c            |  99 +++++++++++++++
 drivers/hv/mshv.h                 |   8 --
 drivers/hv/mshv_vtl_main.c        | 205 ++++--------------------------
 drivers/hv/vmbus_drv.c            |   8 +-
 include/asm-generic/mshyperv.h    |  49 +++++++
 include/hyperv/hvgdk_mini.h       |   2 +
 15 files changed, 505 insertions(+), 289 deletions(-)
 create mode 100644 arch/arm64/hyperv/hv_vtl.c


base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
prerequisite-patch-id: 24022ec1fb63bc20de8114eedf03c81bb1086e0e
prerequisite-patch-id: 801f2588d5c6db4ceb9a6705a09e4649fab411b1
prerequisite-patch-id: 581c834aa268f0c54120c6efbc1393fbd9893f49
prerequisite-patch-id: b0b153807bab40860502c52e4a59297258ade0db
prerequisite-patch-id: 2bff6accea80e7976c58d80d847cd33f260a3cb9
prerequisite-patch-id: 296ffbc4f119a5b249bc9c840f84129f5c151139
prerequisite-patch-id: 3b54d121145e743ac5184518df33a1812280ec96
prerequisite-patch-id: 06fc5b37b23ee3f91a2c8c9b9c126fde290834f2
prerequisite-patch-id: 6e8afed988309b03485f5538815ea29c8fa5b0a9
prerequisite-patch-id: 4f1fb1b7e9cfa8a3b1c02fafecdbb432b74ee367
prerequisite-patch-id: 49944347e0b2d93e72911a153979c567ebb7e66b
prerequisite-patch-id: 6dec75498eeae6365d15ac12b5d0a3bd32e9f91c
-- 
2.43.0


