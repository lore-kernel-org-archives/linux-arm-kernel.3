Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A41FC5914
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HOFEfvQO1CVhgH88u777VDiEl1QZLrAdUtZSDefJt8M=; b=aKa152U0MOvvSe
	XsIKaZ+6RUdBZKmkllxF9hhkxu3iwpE3uGBoZcCl8tLY3Taz3CdBNwYkWcWcAhkgoFWkl2lu38gee
	ny26d1i/6E9vSZsWL+bt43eaUiGcNM0JIXXinvN9wllSHU6H1ObquPqAGZf2rYmrdQY0YFle3lHO3
	vpGuQcmAPxDZ08oJnVt948L3a6q/nKiS/X3pQe0P4tEnFWrWjjK6s4advWeqrW4WBVkxl6ZfrgAE4
	kaCRMJguHBOyJWC0lueXxsY3pNZxhhfI4g0c2JPs7vwgTq79aJFQTtOg2IWQO6Rytd8XgI54vm8kb
	FSk9ZXgqvYMMoVch4Yaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbL-00000005muZ-2YjE;
	Thu, 26 Feb 2026 09:24:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbJ-00000005mts-3zci
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 09:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=HOFEfvQO1CVhgH88u777VDiEl1QZLrAdUtZSDefJt8M=; b=f3GorjsrwY10+R92NBJEkXcAKU
	KAdSzuP2JLU/Z46Rzz3eIxKtgX2bLN89T7hToyE0lglIZiKeupzqGA/S6xPx+bkpbBmU8AgEe1IiU
	bWPSX5+BIwHbGAysxUG8c3K3VsrVh5jp99KDTPLqQ7pLblaDBXlWcu+dfZ/CkCEWLyo/knRxvlx3s
	45sdtGko4nkgzdtMjw59RQ/044fQE2r+nxznpsH7EQBl9AG2LMRnNORMiVKwT2APVhf/zMYsiCt2X
	rJuXQHzXIrNvIysh0VvOYIrKBTlHnzKQgd+/KcCvqb6guZhDr6xYHsF7tjm0n9FiEZ8WhOupu5M96
	HC25yQnw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbG-0000000AbRu-2PMi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:24:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FFA21516;
	Thu, 26 Feb 2026 01:23:53 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BB6D3F62B;
	Thu, 26 Feb 2026 01:23:57 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 0/8] coresight: cti: Miscellaneous fixes and CPU PM
 cleanup
Date: Thu, 26 Feb 2026 09:23:48 +0000
Message-Id: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACQRoGkC/43PzQrCMAwH8FeRnp2k6daqJ99DxuhHdD3opB1Dk
 b272Q5+nCaUQtLwy79PkSlFymK/eopEQ8yxu3KB65Xwrb2eqYiBa4GAlURUhU2XxneJcjy3feP
 72CQ6Wd93qRlkYTRJF+zWGakFGzd+jPfZP9ZctzHz5GNeN8ipO8kapNQLMh8oXAm6cuglBXXg+
 Y3vLtOa2UDY/WMEzmZdGRDAvY0p24BfeRQsWciW1tVWnyCgMfBrqY/F15Kl2DKWPFbOlUifv9X
 jOL4AGlSlXaQBAAA=
X-Change-ID: 20251223-arm_coresight_cti_refactor_v1-76e1bda8b716
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tingwei Zhang <quic_tingwei@quicinc.com>, 
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
 Jie Gan <jie.gan@oss.qualcomm.com>, Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772097837; l=2084;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=3yPNEwH0oDNWnKD4zq6mHWM9/6rk3+UZJdKDGMqOG1o=;
 b=3XsemVMYorku/KJX9O1AuBV6+ZleCzArS3r1tVSx71+PmRHmq3Dme/M1TYhVHxVxnawNlHDWG
 9l7rXl7S2dtC1c5N+YAwUHz3hhB6YbYZog+UaUGCE2GXRXZyNIsMFFD
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_092402_980810_760AA71F 
X-CRM114-Status: UNSURE (   8.51  )
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

The CPU power management issue in the CTI driver was first observed in
series [1]; this series resolves that issue.  It fixes bugs and removes
CPU PM operations from the CoreSight CTI driver, the goal is to use the
CoreSight core layer as the central place for CPU power management.
Removing CPU PM from CTI driver can avoid conflicts with the core layer.

This series can be divided into:

  Patches 01 ~ 02: Fix spinlock with irqsave and register read with CS
                   lock.
  Patches 03 ~ 08: Access ASICCTL condintioanlly, remove CPU PM code,
                   and refactor register access in sysfs knob.

This series is based on coresight-next branch and has been validated on
Juno r2 platforms, pass normal sysfs and perf test, as well as CPU PM
stress testing.

[1] https://lore.kernel.org/all/20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com/

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v2:
- Rebased on coresight-next branch (v7.1).
- Kept read/write cache value in sysfs knob (Mike).
- Link to v1: https://lore.kernel.org/r/20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com

---
Leo Yan (8):
      coresight: cti: Make spinlock usage consistent
      coresight: cti: Fix register reads
      coresight: cti: Access ASICCTL only when implemented
      coresight: cti: Remove CPU power management code
      coresight: cti: Rename cti_active() to cti_is_active()
      coresight: cti: Remove hw_powered flag
      coresight: cti: Remove hw_enabled flag
      coresight: cti: Properly handle negative offsets in cti_reg32_{show|store}()

 drivers/hwtracing/coresight/coresight-cti-core.c  | 278 ++++------------------
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 171 ++++++-------
 drivers/hwtracing/coresight/coresight-cti.h       |  13 +-
 3 files changed, 137 insertions(+), 325 deletions(-)
---
base-commit: eef33a7cce239783d0422526a4d786289a936f1b
change-id: 20251223-arm_coresight_cti_refactor_v1-76e1bda8b716

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


