Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DDAC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tgIv5uDPfYYFM3FHtkhTsZGkNT2/xL77irb2ZwO/EGI=; b=bo5VqC3A0gSm/v
	zoefA7eO2xo4KjFOEPibaPx0V1M1tU+tlds6w5r5IZNrHBIm/hVCLZGrXKy8WDsVnzqmZWGJY26MS
	wp4U3j+HxwjTrOgGk83Wmx90kQjPSCtvn6Fg8NLjCtSdY0gifTr4c+Hj1Yn/H3zdfz4yQXf0rQR0I
	Utz9VCtSunLBl3WgF7zIT4G5U2qM0d4SQtwMnLTQnoHGNo/Mudb8a3eZGZd6+ta2MyOSRAW1FS9z1
	2l8jJWtNY1NykXXg30ci1a8QLcytcex2gZXMCpf61PldJYSMYw0WvwC6QqIASpxMqpnQ/eCcuKIex
	SDDTVlc/nicOo1Q1rMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLKG-00000008Q9B-27Yg;
	Wed, 12 Mar 2025 12:36:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKS5-00000008ILr-1MzS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:40:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D05D6152B;
	Wed, 12 Mar 2025 04:40:53 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C24F3F694;
	Wed, 12 Mar 2025 04:40:42 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 0/3] firmware: arm_scmi: Minor cleanups in the scmi bus
 layer
Date: Wed, 12 Mar 2025 11:40:23 +0000
Message-Id: <20250312-b4-scmi_minor_cleanup-v1-0-c62c6cb4111a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKhy0WcC/w3HwQqAIAwA0F+JnRN0KUg/I7VWDXKFUhfp3+vdX
 oPKRbjC2DUo/EiVU/+4vgPaJ93YyPIf0GKwg0Mze1MpS8qiZ0l08KT3ZeIaA2Jc/BAI3vcD8t8
 TpFcAAAA=
X-Change-ID: 20250312-b4-scmi_minor_cleanup-8f85228d435c
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=VUNxvcijs9An1927oTqaVDUsqXThCsE8zDBbKNgPFgM=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn0XK5c2BTNGTOLzPFitGsESmr3eas1w0PoAFTS
 P2CaUUEA5qJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9FyuQAKCRAAQbq8MX7i
 mPirEADMhHNWzclWqfmuECTJMpazKJaamjNSYgWYtIuDM+D5yLkZo1rWPPon5pNfEVB2jRI+3lP
 eQmmwPe0kOPXKZpOpzLDXvrNU4gwO9TOUhWWCSuPC8sU2qU3IVZ2OKi7zfJSciItezoEjY9PdSb
 p0IRf/wNNJPfBz5EF+7Lkdkw41nokJmsd2DUDZnKE3UyEhqNu/dg7xRRHtvh02yJnG1Bi+q3r+F
 zLzGlJfNuvHgpXPq/NAvTQzdYmQKXmR6MhN6Gm8u1TWIXkFCFlHlVObb/b5DA65jFZxdPGeVpJa
 cm8awJXBQYZEVN61Jrf6PhZSfx5svTbuTkhN/igaD6r47GQ1x+ebMIO66fOU1J8Vc9aE27zgR5o
 MbSRs0m42FHjVAfrUqSqVX66t+9/3mjd2B3hNsvVjbEjOhhplZJTJeNnSBgj3Ze0QwdIBD02Y2B
 SQHIQKDGyFh5zh6/xUoec1mBGNn0pm/1rqPQPNI6fyHwZlt/x1htFmRn6ZzqDvyPEaZwynUi9TI
 Yv5BsUNxKXbYxBqef6niiB95rCuXCFHSTMOj2RoI1E8imjPMXxxrZcWg3eoxo++21qXmeIvEXsL
 fp+G/HKpf2yjEjXmiA231T3dzx/bLK0OeNfIbEilkSokI+LkNSOy1RL5L+stN18O5o/kFO8Ikf6
 IvSKZEa/DPV3DwA==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_044045_401896_5D1FBFDB 
X-CRM114-Status: UNSURE (   5.25  )
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

These cleanup centralizes error logging for SCMI device creation into a
single helper function, _scmi_device_create(), consolidates the device
matching logic into a single function, and ensures that devices must
have a name for registration, removing support for unnamed devices while
matching the devices and drivers for probing.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
Sudeep Holla (3):
      firmware: arm_scmi: Ensure scmi_devices are always matched by name as well
      firmware: arm_scmi: Refactor device matching logic to eliminate duplication
      firmware: arm_scmi: Refactor error logging from SCMI device creation to single helper

 drivers/firmware/arm_scmi/bus.c    | 75 ++++++++++++++++++++------------------
 drivers/firmware/arm_scmi/driver.c |  8 +---
 2 files changed, 40 insertions(+), 43 deletions(-)
---
base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
change-id: 20250312-b4-scmi_minor_cleanup-8f85228d435c

Best regards,
-- 
Regards,
Sudeep


