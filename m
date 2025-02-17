Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03144C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R8naEOTdABQ6ek42F96g0zKj5wjNDhuqMoSCqjLqNUE=; b=Pg3y0xl0c1YCuQoLWj/TSmX/n4
	mdTpLzwhxkqsVvOhHQZxEnIOIf1CWZaO8flW8i3ZejVRIYZEsM1eNUm7mN7fe74FwLw9WQ93LpKKy
	ufc58r+E6J14+3Fx6I827zmuEONaL/Sw0qN3dlFeKjsgyKk7BUHGakZ22pwE8ci4iMxIMVHiJ2vxI
	Dj8bwkLJrvvfvNpJF+W39+bFGd1jJWV/BY26NH0fx1T0m2NISt9d6AAnCWn18dJLCNWTaz8Ca0vAO
	Jbg1i8NmLbtnWWg3wNGUGXF09izcxQL3E7mZZ9ZdJaoztrXI1o9jWfqiTU/ec17IGniSUXq4pgQtk
	jzx6wQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3LT-000000057be-1TLU;
	Mon, 17 Feb 2025 15:47:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3DV-000000055VR-2dco
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:39:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04CAB152B;
	Mon, 17 Feb 2025 07:39:48 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E9393F6A8;
	Mon, 17 Feb 2025 07:39:27 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v3 00/19] firmware: arm_ffa: Framework notification support
 + other updates and fixes
Date: Mon, 17 Feb 2025 15:38:41 +0000
Message-Id: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAZYs2cC/23MSwrCMBSF4a2UjI3k5ia+Ru5DRNLmxmbQpiQ1K
 KV7Ny2ICA7Pge+fWKLoKbFTNbFI2Scf+jJwU7GmNf2duLdlMymkAikVd87cHoM1IyUOYucsWnd
 Eq1kRQyTnn2vtci279WkM8bXGMyzv/04GLrgAiWhqgwR0NrHbNqFjSyXLj9QCEH6lLFIrVRtFq
 PGw/8p5nt9c5vTu3gAAAA==
X-Change-ID: 20241224-ffa_updates-106fd3df93d5
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3957; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=RhTnNYTfj2ffvvqL8JaHV8Axj4MhUpAhKy1ZgSM7abE=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBns1gtlQjXSIZZ1QilM4KEtRmZZGA/mabcIzQyM
 HMQGh7ifgWJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ7NYLQAKCRAAQbq8MX7i
 mMaTEADXtL3GaYTyX9jBF0qryyucuCDMc0PT3DNxvYndxYVB4X0pWfMLajZqMB4sjbJe0NXpy2e
 M1OKrlAp/6C6X7aLkGEvzELgzlHPdk4VLjw+vG3hBKsTc7Ej4iqORfSASIwUwV/xYN/CWri4xD4
 z3KH3Soj20Fb4858gGph5P+++ZJR+66onbTrI/b0GXesqd+s0pwoZ2eO5ggnZkNlIEo0lM+kxPI
 vPX698S4vQbZJvT85v+Pv80er/XZZswj3Yj4g+8XZrdESjEY6tEOc5LbOl20nuX/ZL/TERV9opt
 JCqX6vWN8IMFcAbUPACK6//3HR+Fwm/CYrBN2RMHeN6NkQ1z3m+fB5qV17IIloqp3RJ0rzxudam
 ZcqyVlwOct5e3HMTiiLQ4aGZJqQrxvMpLefMXKexOcg/lqChxNRKD/V7fHnAGW34QTt1IhW5wd/
 88IbTg4+sm4KCThcBYus4OnnqkxXTDW7jV47np0p0GT2jv/GrpqKyv+nqmyElLyiHXH6IqGXja2
 Atp7moVDW9TKpS4i/L77rlbTDh/EcmGUNZMLxH8WkZVNAUJ3A1YLFbN6gnRN+vrur6FsWzBxyD6
 xS0ZtVvKbf0u7OfLYTO2a6GjO5p68CuF72QMzEMbipl02u50YhBUP+fUVjOcm+tEOCd0DT1+x03
 hB98ma3NAwS0IuQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073929_756483_CEB507F8 
X-CRM114-Status: GOOD (  12.71  )
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

This bundle of changes mainly have FF-A framework notification support
along with other minor updates and fixes.

It adds support to allow multiple UUIDs per partition to register
individual SRI callback, to handle Rx buffer full framework notification
in particular and general framework/interface to extend in the future.

It also adds support for passing UUID in FFA_MSG_SEND2 which improves
the multiple UUID/services per partition support in the driver and
an helper to check if a partition can receive REQUEST2 messages or not.

It also improves cleaning up the partitions by adding unregistration of
the devices as well as handles the presence of host partition in the
partition info.

It also contain fixes big-endian support in couple of functions:
__ffa_partition_info_regs_get() and __ffa_partition_info_get().
Big-endian support is still not complete. Only these changes can be
verified at the moment without any additional application or testing
support changes.

Regarding the FF-A versions, it upgrades the driver version to v1.2
and rejects any higher major version than the driver version as
incompatible.

It also fixes the mis-alignment with sync_send_receive{,2} function
prototypes.

It replaces UUID buffer to standard UUID format in the ffa_partition_info
structure and fixes a typo in some FF-A bus macros.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
Changes in v3:
- Dropped spurious extra blank line in ffa_setup_partitions()
- Fixed issue with Xarray erase in ffa_partitions_cleanup()
- Used kmemdup() instead of kmalloc() + memcpy()
- Extend support to read non-secure notification bitmaps
- Added Viresh's Tested-by tag
- Link to v2: https://lore.kernel.org/r/20250131-ffa_updates-v2-0-544ba4e35387@arm.com

Changes in v2:
- No changes in the patches sent as v1 itself.
- Addition of framework notification support and other updates as listed
  above
- Link to v1: https://lore.kernel.org/r/20241224-ffa_updates-v1-0-01233aba3e1e@arm.com

---
Sudeep Holla (18):
      firmware: arm_ffa: Replace SCMI by FF-A in the macro
      firmware: arm_ffa: Replace UUID buffer to standard UUID format
      firmware: arm_ffa: Align sync_send_receive{,2} function prototypes
      firmware: arm_ffa: Fix big-endian support in __ffa_partition_info_get()
      firmware: arm_ffa: Fix big-endian support in __ffa_partition_info_regs_get()
      firmware: arm_ffa: Handle the presence of host partition in the partition info
      firmware: arm_ffa: Unregister the FF-A devices when cleaning up the partitions
      firmware: arm_ffa: Helper to check if a partition can receive REQUEST2 messages
      firmware: arm_ffa: Add support for passing UUID in FFA_MSG_SEND2
      firmware: arm_ffa: Upgrade FF-A version to v1.2 in the driver
      firmware: arm_ffa: Reject higher major version as incompatible
      firmware: arm_ffa: Remove unnecessary declaration of ffa_partitions_cleanup()
      firmware: arm_ffa: Refactoring to prepare for framework notification support
      firmware: arm_ffa: Stash ffa_device instead of notify_type in notifier_cb_info
      firmware: arm_ffa: Add support for {un,}registration of framework notifications
      firmware: arm_ffa: Add support for handling framework notifications
      firmware: arm_ffa: Allow multiple UUIDs per partition to register SRI callback
      firmware: arm_ffa: Handle ffa_notification_get correctly at virtual FF-A instance

Viresh Kumar (1):
      firmware: arm_ffa: Refactor addition of partition information into XArray

 drivers/firmware/arm_ffa/bus.c    |  13 +-
 drivers/firmware/arm_ffa/driver.c | 526 ++++++++++++++++++++++++++++----------
 include/linux/arm_ffa.h           |  22 +-
 3 files changed, 418 insertions(+), 143 deletions(-)
---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20241224-ffa_updates-106fd3df93d5

Best regards,
-- 
Regards,
Sudeep


