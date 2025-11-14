Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DEECDE03C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 08:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qswDO4fl33QLAzjl6VRDw7NFdnqMczcXHUmwmlmCKP0=; b=UCL73R5vGepB1NRngZiQ52gsKD
	R8Sy9Zi4CJsgV92itdZm3yIxzebYZZlP0ZHtBPcgCbmVOpm+7+NU1/zCzXGMJTVuIlVmqii7n90CD
	Va09fr3y43dRNjvnhKGQht+W9uQ0po7HCrnGAsAHqcSDvo3p645iNZ2xWZqtv6GVOb0wULDuYMXmv
	sLC++K1798/rbbE/Bek2w0fe3JzckaabVb0RyjgCb1z3zOUQEXMN30AHNtEFDnljpbECOqJb8BLML
	VEVBGyl4LHDHrxVhgaUBe+WIyKr6CBZILGw1jLaLKVU3tClW/QFQJrxbUOFx79hdNYDuOxv5bvbUO
	ldPhkW2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpWb-0000000BpkM-10a9;
	Fri, 14 Nov 2025 08:51:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpWY-0000000Bpju-2eho
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 08:51:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DB48412EB;
	Fri, 14 Nov 2025 08:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92BF9C116D0;
	Fri, 14 Nov 2025 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763110275;
	bh=GmRqE5RMoMhnQ3d6Sa3aWb28ACAgAslp1jHppTOujPc=;
	h=From:To:Cc:Subject:Date:From;
	b=isuJfJxJqTOikzFh3bFFJMz85LRh1QJV2JR4GaeoZ1fTu4SpfqJmR5KcXp4xGW/pC
	 KDA/tc5PVms2QKuCcK2mvJ2pRZFwdB+lSDECTr2DJ9DW/MdlQtPtkLo/0fp//kGy+9
	 AG7xEx5oVJ43nxyeauAwkz1P6ASP/lkmSNE40mpgjSi3AfgwQYq1/3nqf9CqD8O+BR
	 aOkrZAE3dgGVMPbzUdWvx7Xesmv9ana7jFPivGaoI0rlbGFsC1ImaESvM0RWouhBaJ
	 W8n284EY8W49RPglbWphaomNLMArK3D0nHuzGx3Dd5QCT1gJMT1MLst9TUwUCbfP5e
	 qufaUuCNHmAJA==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	ardb@kernel.org,
	mark.rutland@arm.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	shivendra.pratap@oss.qualcomm.com,
	leif.lindholm@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH 0/2] efi/reboot: Enable platform specific reset on arm64
Date: Fri, 14 Nov 2025 14:20:56 +0530
Message-ID: <20251114085058.2195900-1-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_005118_694972_4E0702F7 
X-CRM114-Status: UNSURE (   8.56  )
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

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Vendor/platform specific reset types are common on arm64 platforms as
can be seen from this patch-set [1]. EFI runtime ResetSystem service
provide an alternate method known as EFI_RESET_PLATFORM_SPECIFIC [2].
It should be able to handle these reset scenarios where the platform
specific UEFI implementation will decode the reboot command as reset
data passed as a parameter.

On UEFI systems, it is rather a better abstracted interface for the OS
to use EFI platform specific runtime reset method rather than overriding
PSCI reset method with DT based overrides on arm64 platforms.

[1] https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com/
[2] https://uefi.org/specs/UEFI/2.10/08_Services_Runtime_Services.html?highlight=resetsystem#resetsystem

Sumit Garg (2):
  efi/reboot: Add support for EFI_RESET_PLATFORM_SPECIFIC
  arm64: efi: Pass reboot cmd parameter to efi_reboot()

 arch/arm64/kernel/process.c   |  2 +-
 drivers/firmware/efi/reboot.c | 25 +++++++++++++++----------
 include/linux/efi.h           |  5 +++--
 3 files changed, 19 insertions(+), 13 deletions(-)

-- 
2.48.1


