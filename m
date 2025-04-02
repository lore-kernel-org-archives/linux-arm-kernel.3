Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA93C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 23:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vbvHN+50wjZyKDHeJqGzjidV72L2yb8bPDDJjZCNcxA=; b=DF/32kiKRywubk
	WJbJ+4DT3eM+dNOyPOz9nMSqNrGAG2yB50Ej/MKFOSC7fXqCnjalKMJA+5RSgE5hVIIgO5MW9aZly
	DFZI7H/VKXplTzE9nj43vYHwxJFI+YxtkoQR41uHswxpTfTt3B6OjsXHrN/WU4JileYWYbwr1GOuZ
	wDSFHqiDHBuXjmv4lBSwWxnabpLCf/5YdfwKD+t0Rgj7P8KxuDCDzxy/Io5guoJyPdTXX/kbRJ3wg
	Aq3c87skF7NSyWnzdhRuEc+kkugMAdoJlkXQ8mN++QFievS0sM2k1jQRjfttdhuK/R4d7MKChaL4Q
	nFj3NwBWou6W8e9dtS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07K9-00000007Nut-1aiU;
	Wed, 02 Apr 2025 23:16:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07Ge-00000007NKx-24FG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85F9343BA8;
	Wed,  2 Apr 2025 23:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD13C4CEDD;
	Wed,  2 Apr 2025 23:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743635584;
	bh=RvfrCmcBtfS66/uApqDOYHN0iRKuLLbZk69Qk+dcHmM=;
	h=From:Subject:Date:To:Cc:From;
	b=TvrffkqABtxPT9ljHHxLb9iYteSfh0VLmE0fLXfNGv+yxCNSDvVSANCQ+6oIpAq5Y
	 jXK63k9GFTpdW0ryHLWHULCkgkYW3zvWtJ9JoJ0U0OIAmTzvhRJ+1/6mHOrNXBB13G
	 WzOX4jvpiRc45VibgUgL2CyupLexLP0Y2rTKJomV/K7U6+4iGmeT9NHWt1n6AFXp5l
	 Xr++bOSHLeGu0gFEE/ALANfccQkxOG3wbth8zpTJ1NvmrtiUcvILLw8+S8HvODWwvy
	 FVgICr1Vr9EWei90aiogF97FotPw7LeDRn2ZnA+RwjhF5RUHIo6L/ybOp0NNXrwyHg
	 ImPuzGZDa6u+Q==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/10] KVM: arm64: Backport of SVE fixes to v5.15
Date: Wed, 02 Apr 2025 23:59:32 +0100
Message-Id: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFXB7WcC/x3MQQqAIBBA0avErBsoy4quEi00xxqICickkO6et
 HyL/xMIBSaBsUgQKLLweWTUZQHLZo6VkF02qErpqlEdym3sTiiRUGOt0XrX63ZQbvEGcnUF8vz
 8x2l+3w9BrtLWYQAAAA==
X-Change-ID: 20250326-stable-sve-5-15-bfd75482dcfa
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Eric Auger <eauger@redhat.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, Eric Auger <eric.auger@redhat.com>, 
 Florian Weimer <fweimer@redhat.com>, Fuad Tabba <tabba@google.com>, 
 Jeremy Linton <jeremy.linton@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1999; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RvfrCmcBtfS66/uApqDOYHN0iRKuLLbZk69Qk+dcHmM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn7cR0MTDrMk0BLKpj/hATNP/G+/wEIZ2I5DavJxlD
 OG45fNCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+3EdAAKCRAk1otyXVSH0CIlB/
 sGvKLkDZXDWW03oFhJpynvp0xwR4P2bwJaQCKGPM6TDy3bPFtEBk/+sVjyUWlYw3MejCKC9b07HDd2
 cRQJhq9m6YDImxQgGo5kPaXnHRpkW03czQZM7JwVYo7nA4wNH5QQgVMyft7U/0gH++GROfag+/+Ett
 /4xMbfAJMBeWOsXOK89VfNQbyOz8ZDZd5AM44Vr1Aiff7sLjKrTt7xnoMK9Hiee2YVgaTjSmcPgBoD
 ZQIZmav9OuM/uMHDlDxTJEYDqwawGlDZBdXzAXM22/ojvlwdvZTSPKWu2a5qb38o4rWtSYmUgUci/8
 uyQhX9vpdZlTJN0A3cVxCwhf3eHNrE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_161308_574261_49A622FB 
X-CRM114-Status: UNSURE (   8.88  )
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

This series backports some recent fixes for SVE/KVM interactions from
Mark Rutland to v5.15.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Fuad Tabba (1):
      KVM: arm64: Calculate cptr_el2 traps on activating traps

Marc Zyngier (1):
      KVM: arm64: Get rid of host SVE tracking/saving

Mark Brown (4):
      KVM: arm64: Discard any SVE state when entering KVM guests
      arm64/fpsimd: Track the saved FPSIMD state type separately to TIF_SVE
      arm64/fpsimd: Have KVM explicitly say which FP registers to save
      arm64/fpsimd: Stop using TIF_SVE to manage register saving in KVM

Mark Rutland (4):
      KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state
      KVM: arm64: Remove host FPSIMD saving for non-protected KVM
      KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN
      KVM: arm64: Eagerly switch ZCR_EL{1,2}

 arch/arm64/include/asm/fpsimd.h         |   4 +-
 arch/arm64/include/asm/kvm_host.h       |  17 +++--
 arch/arm64/include/asm/kvm_hyp.h        |   7 ++
 arch/arm64/include/asm/processor.h      |   7 ++
 arch/arm64/kernel/fpsimd.c              | 117 +++++++++++++++++++++++---------
 arch/arm64/kernel/process.c             |   3 +
 arch/arm64/kernel/ptrace.c              |   3 +
 arch/arm64/kernel/signal.c              |   3 +
 arch/arm64/kvm/arm.c                    |   1 -
 arch/arm64/kvm/fpsimd.c                 |  72 +++++++++-----------
 arch/arm64/kvm/hyp/entry.S              |   5 ++
 arch/arm64/kvm/hyp/include/hyp/switch.h |  86 +++++++++++++++--------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |   9 ++-
 arch/arm64/kvm/hyp/nvhe/switch.c        |  52 +++++++++-----
 arch/arm64/kvm/hyp/vhe/switch.c         |   4 ++
 arch/arm64/kvm/reset.c                  |   3 +
 16 files changed, 266 insertions(+), 127 deletions(-)
---
base-commit: 0c935c049b5c196b83b968c72d348ae6fff83ea2
change-id: 20250326-stable-sve-5-15-bfd75482dcfa

Best regards,
-- 
Mark Brown <broonie@kernel.org>


