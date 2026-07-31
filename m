Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE3FC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AtWUoXaA/r3VYJ+M1qXYdvPAmgeHsXRaRHj+/f6cQog=; b=A4D6JF/LYKH+ryvVMUoyu+Ibae
	Gq5bx5PIg3tQ41h0YTTniR0jag34uWGZUQk45IGL4pb3UglIQQFJ+xRvJuVtk0kl5YTRv/C/yFNUH
	3DVQp46rSdv+OSfEpeJ5TBcbZxBhmTw/2YW0xluoX8k03WJFDESB19p7nzONiRNSofXGvzaYY1t+2
	xOuiEI5BYxo+4Gvpg3n79RJcD3dT8+TrmkPxevTqb06I3jbPw3xGKtpCwmf6wF7UX0/Fom6EBUkG6
	n/65BxpcRM+G8ZbLo3DnFS70oxK4IUdep5EvUwPRAC+oFqSs2Fp1qpnN1hiMUDKmRWcGHbUsEolPe
	X2NZ2Fnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprPp-0000000DIY1-0mQR;
	Fri, 31 Jul 2026 17:53:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprPm-0000000DIXF-3IhY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:52:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 909851595;
	Fri, 31 Jul 2026 10:52:52 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D97273F66F;
	Fri, 31 Jul 2026 10:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785520376; bh=JZXnukZGCrDI/usIN11DGn1TTGj+vrTYbZXaelRizx4=;
	h=From:To:Cc:Subject:Date:From;
	b=NnGZDnR1Gvxe70feUzWr+cAE43a7sPN7zFWjfthmaMyYv27te4veOfT1glshI787k
	 qMNRtlTT73oKW3Q4ynFyPW+/RHWw9mkUHY4OIcfbQlvBCl3pPbq83jsRD54varhP5d
	 5kWXaZeA+vriIDjriRIw8Jw0/JABI13RJqz5MF7k=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com,
	will@kernel.org
Cc: james.morse@arm.com,
	fenghuay@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	andre.przywara@arm.com,
	gshan@redhat.com,
	tan.shaopeng@jp.fujitsu.com,
	sdonthineni@nvidia.com,
	jonathan.cameron@oss.qualcomm.com
Subject: MPAM changes for v7.3
Date: Fri, 31 Jul 2026 18:52:37 +0100
Message-ID: <20260731175243.904730-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_105258_890186_7166BC95 
X-CRM114-Status: UNSURE (   8.58  )
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

Hi Will,

Please find the MPAM changes for v7.3 in this collected series. I hope
this is more convenient than my last pull request for the fixes.

This combines the MPAM abmc emulation series and a fix for an Nvidia quirk which:

Make MPAM memory bandwidth counters usable by hooking them to resctrl's counter assignment
interface.

Fix a quirk in the MPAM bandwidth counting on an Nvidia to also apply to 63 bit counters.

The changes can also be found at:
git@git.gitlab.arm.com:linux-arm/linux-bh.git mpam_v7.3

Thanks,

Ben

Ben Horgan (2):
  arm_mpam: resctrl: Pre-allocate assignable monitors
  arm64: mpam: Add memory bandwidth usage (MBWU) documentation

James Morse (3):
  arm_mpam: resctrl: Pick classes for use as MBM counters
  arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
  arm_mpam: resctrl: Add resctrl_arch_cntr_read() &
    resctrl_arch_reset_cntr()

Shanker Donthineni (1):
  arm_mpam: Apply T241-MPAM-6 to 63-bit counters

 Documentation/arch/arm64/mpam.rst |  22 +++
 drivers/resctrl/mpam_devices.c    |   6 +-
 drivers/resctrl/mpam_internal.h   |   6 +-
 drivers/resctrl/mpam_resctrl.c    | 318 +++++++++++++++++++++++++++---
 4 files changed, 325 insertions(+), 27 deletions(-)

-- 
2.43.0


