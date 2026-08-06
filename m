Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E28FC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 14:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wfmNJelByFUAgBMk4tUcA1wpSaIW98vB5+0cYzWtZq4=; b=TzSKLsXzwvDd1CB10x0zGU58cJ
	ORZAEruBq5aFVkO3fL9yGw503E3BpoZkmOBDeQBpalH7Ryg/N6NQ219T0l3zpu/eAkZr4/KLS89Bt
	9lXsxlalb+pt45TixCA2zBgDAPLpEm5JNnSNZPDYHK5IoMTvylap9aVxW0eVKY5hI4kXSt+fdpMSJ
	0K/g8h6GIk6VQYjNq5mJ7o1f5UPEAx3H+VA3VSbm55OA+BwvwMz3KMjLNMdgBLPqGiMhIW5RMXGqI
	3uCUPjPS4DGhnkT+Wia968p6hX61IrhK93vLnZr0UT3JVh7fU1gr7+nIqwsV+4pvjwwL/HwUtd9AH
	mMZvu4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzMt-000000061aI-2jon;
	Thu, 06 Aug 2026 14:46:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzMr-000000061Zu-3K6Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 14:46:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AE32153B;
	Thu,  6 Aug 2026 07:46:39 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 892B73F9A2;
	Thu,  6 Aug 2026 07:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786027603; bh=N5PYz8L08pcG1X2UIa4YSQHaZDUoTg72wd0fTuL/1Mw=;
	h=From:To:Cc:Subject:Date:From;
	b=f/vePDVoEnXdQMrk+C6mbM/2/vUjplJcg+WK0Mo3rMOjkWE7tMOi4z9f0BQS7x9bO
	 lS6Kuz0+tJt1wFTGKLhkP3w1Kon7ecerOUuIiDIFo6Sx1shok5UnxySN7kdNRgtUXQ
	 1dgN70UHeo2Dp4U9D9yLW5gNUyMCfttUHDKuQW6g=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	will@kernel.org,
	catalin.marinas@kernel.org
Subject: [PATCH v1 0/2] MPAM Fixes for UAF and NPE on unbind
Date: Thu,  6 Aug 2026 15:46:29 +0100
Message-ID: <20260806144631.2502918-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_074645_897178_D0766752 
X-CRM114-Status: UNSURE (   7.63  )
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

The MPAM driver expects to manage all the MSC in a system. At boot it
delays its initialization until it has probed all of them but once
running it is unprepared to have the MSC taken away and that can trigger
UAF and NPE. Workaround this by ensuring it never relinquishes the MSC.

Ben Horgan (2):
  arm_mpam: Fix a NULL pointer dereference on unbinding after an error
    interrupt
  arm_mpam: Disable driver unbind to avoid UAF

 drivers/resctrl/mpam_devices.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0


