Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6360C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 10:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mN08T+lAXbl7r9bzqH6+wsZ94RJo5X3M/h+i9whWoUk=; b=Z5PWqUYSYq2GSuoF69WdrVm96f
	Fqho8NTTNBspb0WHrh/d5T2n21JneNq2Ij9suhMOydtv1Bs/iAg9t3t0b9ias66sJGrxKNMOfs+mh
	eEE5Srr253HbYxARGWA2KRM5UEy2e+Y0d7uYgJRCUhhKwsDQ6IHM34/su84qWDq4FuQ+R6m0R96rv
	GcpLlMmfh3aNTh0ZC6cqBBotYOsG4qpdJTbZemR12BhoFIL5Dci3AZZVnFjZOppu+QBeyXyXEPuzS
	qazyclX5WT5lrOPs6rHBaG/8DGaSg+aSdesCB5oF/Ta4vOgabP5BtXnFtfA778wtjqdwJrXObGM+C
	zb0nu4Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BJO-0000000DJta-3YLv;
	Fri, 11 Apr 2025 10:08:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Akq-0000000DDdE-2IVN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 09:32:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0662F106F;
	Fri, 11 Apr 2025 02:32:56 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 356FA3F6A8;
	Fri, 11 Apr 2025 02:32:55 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Fix for v6.15
Date: Fri, 11 Apr 2025 10:32:51 +0100
Message-Id: <20250411093251.1060513-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_023256_631830_EEB08293 
X-CRM114-Status: UNSURE (   6.57  )
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

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-6.15

for you to fetch changes up to 4567bdaaaaa1744da3d7da07d9aca2f941f5b4e5:

  firmware: arm_ffa: Skip Rx buffer ownership release if not acquired (2025-04-08 10:32:15 +0100)

----------------------------------------------------------------
Arm FF-A fix for v6.15

A fix that addresses incorrect release of Rx buffer ownership in the
driver. The fix specificially avoids releasing Rx buffer ownership with
FFA_RX_RELEASE if it wasn’t acquired during a FFA_PARTITION_INFO_GET call
that only requested the partition count. This prevents unnecessary errors
like FFA_RET_DENIED from firmware when buffers are not actually owned by
the driver.

----------------------------------------------------------------
Sudeep Holla (1):
      firmware: arm_ffa: Skip Rx buffer ownership release if not acquired

 drivers/firmware/arm_ffa/driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

