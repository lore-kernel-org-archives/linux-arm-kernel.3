Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C06CAC5BC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 12:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rzYSufdM+rsMciKNkwglHkRqsMM2Z3jYvyXz9ITjeXs=; b=e4szEJl/U5pYx3j3aGJOdA3QxO
	Gmmems3qsCqbnW1jFZFVaGEE0bt3CO3GSseohlHgfx+TWvZDwFVQ2DuEsuQI58H6kDfIZAZDJPzLP
	muEht4F4MFtq69q5UNlSdAcOazyL80X63hMoPOqPverm1cW+b30Fs3zkACh8KZQB/plS8aRYZ3oNS
	ZHs8Xz3zTxx6VOuB1c9W7vtR+0dE9/X/+u0ERpz54sPv6JY8QnRabY1LshPULAqoI9GzCyCHap85e
	ECSac+grjG8PZvqgnp2pHQtNjekpqOYoxurFGaJbzW5Hcb0OBMteXwZvD72rqBc8GO4FGQ8nYHCUJ
	3xCR366w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v27cf-00000001AkK-3RmH;
	Fri, 26 Sep 2025 12:32:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v27cc-00000001Af7-0RyN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 12:32:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14E58168F;
	Fri, 26 Sep 2025 05:32:11 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 497733F5A1;
	Fri, 26 Sep 2025 05:32:17 -0700 (PDT)
From: Salman Nabi <salman.nabi@arm.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@arm.com,
	andre.przywara@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	vsethi@nvidia.com,
	sdonthineni@nvidia.com,
	vwadekar@nvidia.com,
	chao.gao@intel.com,
	ardb@kernel.org
Subject: [RFC PATCH v2 0/1] firmware: smccc: Add support for Live Firmware Activation (LFA)
Date: Fri, 26 Sep 2025 12:31:44 +0000
Message-Id: <20250926123145.268728-1-salman.nabi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_053222_261060_E6BA04DD 
X-CRM114-Status: GOOD (  16.76  )
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

Hi,

This patch addresses some feedback from the previous RFC, and fixes and
improves some shortcomings discovered during internal review:
There is now a new sysfs file to waive the kernel's CPU rendezvous
requirement, if administrators are sure that the firmware's brief downtime
has no effect on the kernel's drivers. Also the firmware images are now
handled in a linked list, as this provides more flexibility for upcoming
changes. For more details, see the original cover letter, the changelog
below and the patch's commit message. We are still looking for feedback,
also from other architectures, on the best userland interface.

=====================================================================

this is a proposal for a driver for the Arm Live Firmware Activation (LFA)
specification[1]. LFA provides an interface to allow "activating" firmware
updates without a reboot.
In contrast to Intel's TDX [2] approach (which seems only concerned about
some confidential computing related firmware blob), and even OCP's
"impactless" updates[3], the Arm approach just lists a number of
"activatable" firmware images, and does not limit their scope. In
particular those updates can (and will) be for firmware bits used by the
application processors (which OCP seems to rule out), including runtime
secure firmware (TF-A/BL31), confidential compute firmware, and
potentially even UEFI runtime firmware.
Initially we have the whole chain demoing the Arm Confidential Computing
firmware (RMM) update, which is conceptually the same as Intel's TDX
proposal.

So our design approach is to create a directory under /sys/firmware, and
just list all images there, as directories named by their GUID.
Then the properties of each image can be queried and the activation
triggered by the sysfs files inside each directory. For details see the
commit message of the patch.
This is admittedly a somewhat raw interface, though even in that form
it's good enough for testing. Eventually I would expect some fwupd
plugin to wrap this nicely for any admins or end users.

The purpose of this RFC is to get some feedback on the feasibility of
this interface, and to understand how this would relate to the other two
approaches (TDX + OCP "impactless" updates).

- Are GUID named directories under /sys/firmware/lfa a good idea?
- Shall all three approaches be unified under a common kernel/userland
  sysfs interface? Or can we live with separate interfaces, given the
  different scopes, and unify this in userland, for instance via fwupd
  plugins?

=====================================================================

v1...v2:
 - added forcce_cpu_rendezvous hook for skipping cpu rendezvous for
   firmware components that supports it.
 - changed the static firmware images array with a dynamic linked list.
 - the activation pending flag is retrieved directly from the lfa agent
   for an up-to-date information.
 - added a mapping of LFA error codes to human-readable strings.
 - kernel error codes changed to more appropriate ones
 - comment fix in call_lfa_activate()
 - the "bitfields" name in variables has been refactored to an
   appropriate "image_flags".
 - change image_flags variable datatype to u32 from an int


Many thanks
Salman Nabi

Salman Nabi (1):
  firmware: smccc: Add support for Live Firmware Activation (LFA)

 drivers/firmware/smccc/Kconfig  |   7 +
 drivers/firmware/smccc/Makefile |   1 +
 drivers/firmware/smccc/lfa_fw.c | 455 ++++++++++++++++++++++++++++++++
 3 files changed, 463 insertions(+)
 create mode 100644 drivers/firmware/smccc/lfa_fw.c

-- 
2.25.1


