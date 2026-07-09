Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C19C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bowpjSCiPZk5NB9pvPtkEkv1dxybgslNEADwXTFlXyE=; b=3kJjOfaRzQvpuzR7tUWXD7Vx7h
	BC0OONRr9cOV3q6ub2XNIaIBPfX2f2J4yaN1q8JwFF1LdRwzMAZgK/I8iq8wRyBsf/O0sG4RVDIZL
	MJTkXSJlkFfy31/qB/88ukykCzlA4tzkHScu0YgDjr/ZJG/+IzVcxsc8lTmuJ2XQ9dF9PrJ2vE/C3
	RmAi9w9JmOpOaQzmlQ0C7sqcTpRSNXbSvmUPcEcrhxwZ1LtKTWEMK69WkOqLM/jRVldpmidVGQ+CC
	r4i+lW39Q25OjkU+GMbg+1LNdk2dV3oa3at/sVfPK/A08l/A0N+YyoSS74c3jJ2w6g7GhLDKXt7hI
	SvczDOIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqz9-00000002y0F-3cHH;
	Thu, 09 Jul 2026 15:48:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqz7-00000002xzp-0JQy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:48:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59F3E3591;
	Thu,  9 Jul 2026 08:48:15 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 810C43FC81;
	Thu,  9 Jul 2026 08:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783612099; bh=cKO08W59hFBPRgQdCe3lNZ/BtKY1eCfShBunvaXMYT4=;
	h=Date:To:Cc:From:Subject:From;
	b=eeGmbDZd3FihZjVfrOXf1e1Svh/OsTe4a8Wn8njLmfyIFCsJjbNl7GG3YLJvbFrob
	 nOhOMPAGGtnX4mX1+lVMKFtg9arRXOOplyiKpg1OYXxKQuGjgPeQYwQ/z6RXH7MdOQ
	 xS4ZQNutZptCMZu14wHu9zlq7xWWpGW5xp3pU0qU=
Message-ID: <1d22f80d-34c0-4e8f-a9a7-3c527fb97232@arm.com>
Date: Thu, 9 Jul 2026 16:48:17 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Content-Language: en-US
To: "will@kernel.org" <will@kernel.org>
Cc: "james.morse@arm.com" <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Fenghua Yu <fenghuay@nvidia.com>,
 Guangshuo Li <lgs201920130244@gmail.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Andre Przywara <andre.przywara@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Subject: [GIT PULL] arm_mpam fixes for v7.2-rc2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_084821_183196_868E30B5 
X-CRM114-Status: GOOD (  10.04  )
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

I hope this method works for sending you MPAM changes but please let me know if
you would like them some other way or I've made a mistake. It's not a signed tag
as I still need to sort out my GPG key. The change authored by be me hasn't got
an Reviewed-by's or Tested-by's but it's been on the list since the middle of
May and James is on leave.

Fix the reset values for two MPAM controls that are not known to exist in
silicon. Fix a NULL pointer dereference on the driver teardown path.

Thanks,

Ben

The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  git@git.gitlab.arm.com:linux-arm/linux-bh.git MPAM_fixes_v7.2-rc2

for you to fetch changes up to ec0810359f28c3cf78320b85f894d875c3f32d10:

  arm_mpam: guard MBWU state before adding it to garbage (2026-07-09 15:40:46 +0100)

----------------------------------------------------------------
Ben Horgan (1):
      arm_mpam: Fix software reset values of MPAMCFG_PRI

Fenghua Yu (1):
      arm_mpam: Fix MPAMCFG_MBW_PBM register setting

Guangshuo Li (1):
      arm_mpam: guard MBWU state before adding it to garbage

 drivers/resctrl/mpam_devices.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

