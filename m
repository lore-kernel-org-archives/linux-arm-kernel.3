Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D44CC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X8B92NSgcTkdtLIgkn5KYMnVlI4ZOR0kx94kw92peH4=; b=d/2Uwk9FzrQSbj
	uIT02nuYomqiWH24XULuWjeJYl6pQgQV9eSJVlnL62e/bTAbMDZFIgUgbj4hOdkoQFW8aIPVR8TPa
	AnP2LUh72MiGtEZzJycbFJwMbomtfODS1un9fCzTRvrEfGgmVa81cwbhzqfE4Da7BLbINThH3YJ0J
	YEneiAN7xCFh56xQrz7RYnf1086Ju3iqXTafA8z2axSJRHgO2Mr2rZm2uSgTABmGHdrFel+T9vHlb
	Ew9OtKxOEHUyqK1knLmamGBHpGaGYxEYxwDYJJZzSyYAxIaFlfuy4SjGJ4OgbmZ+2xyXY/Tbhgq2A
	wPxs43VC+X4qdhydepvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgMV-0000000CgnA-1kdw;
	Tue, 14 Jul 2026 16:52:03 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgMT-0000000CgiU-0N7v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 16:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1784047914;
	bh=P8axtzlc26y5kWyEb7PWfrNrtHlna+IHi2EA6Xja4RU=;
	h=From:Subject:Date:To:Cc:From;
	b=fve7O5Vdo0KIs1MfkqxpEQn3B8brETbVkR2GMWxcSRtjnyMrrllrNZSFcVUyAKGfJ
	 +0MemZuGN2XsszgcG33WTOnzCWVhGwc0tsW7lp4iTH9ZjJH6ylUCl6axlnl64eOBgG
	 QHUVxyn/CcyexZdNguLoj0JIfv89MVc7IhxCP7b0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/3] driver core: Constify the signature of
 device_show/store_*()
Date: Tue, 14 Jul 2026 18:51:47 +0200
Message-Id: <20260714-sysfs-const-attr-dev_ext_attr-v1-0-6b2c0435d621@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAwA0F+RnA1oGR3brwwRbRPNDnU0mTjEf
 183j+/ydlDKQgr3aodMq6gsqaCtKwjzkCZCicXgGueba+tQP8qKYUlqOJhljLT2tFl/YmTvbxw
 5XgjK8crEsv3/R3da3+OTgv1SOI4v7Q3lOoEAAAA=
X-Change-ID: 20260712-sysfs-const-attr-dev_ext_attr-dbf669fdfd4e
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
 Yushan Wang <wangyushan12@huawei.com>, Jijie Shao <shaojijie@huawei.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, driver-core@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784047913; l=1711;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=P8axtzlc26y5kWyEb7PWfrNrtHlna+IHi2EA6Xja4RU=;
 b=ygssrvOv1vOPr3lElItnO1Z5cofbIvqxZSp7zutH11/4nI7eNOB7qK2ICFH8O4iBEF8Ffq26R
 SSBn+MlIBpABIIOgUqelEMPj402hGe/Kyp7J89f+xIgEOUpE3i2ZbqC
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_095201_273989_4EA21F21 
X-CRM114-Status: UNSURE (   8.35  )
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

Prepare for the constification of 'struct dev_ext_attribute' by changing
the signature of the standard callback functions.

Intended for the driver-core tree.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (3):
      x86/mce: Use __DEVICE_ATTR() macro to initialize dev_ext_attribute
      drivers: perf: Use __DEVICE_ATTR() macro to initialize dev_ext_attribute
      driver core: Constify the signature of device_show/store_*()

 arch/powerpc/perf/hv-24x7.c                 |  2 +-
 arch/x86/kernel/cpu/mce/core.c              |  6 +++---
 drivers/base/core.c                         | 30 ++++++++++++++---------------
 drivers/perf/arm-cci.c                      |  2 +-
 drivers/perf/arm-ccn.c                      |  2 +-
 drivers/perf/arm_cspmu/arm_cspmu.h          |  2 +-
 drivers/perf/arm_dsu_pmu.c                  |  2 +-
 drivers/perf/cxl_pmu.c                      | 10 +++++-----
 drivers/perf/fujitsu_uncore_pmu.c           |  2 +-
 drivers/perf/hisilicon/hisi_pcie_pmu.c      |  2 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.h    |  6 +++---
 drivers/perf/hisilicon/hns3_pmu.c           |  6 +++---
 drivers/perf/nvidia_t410_c2c_pmu.c          |  2 +-
 drivers/perf/nvidia_t410_cmem_latency_pmu.c | 12 ++++++------
 drivers/perf/qcom_l3_pmu.c                  |  8 ++++----
 drivers/perf/xgene_pmu.c                    |  2 +-
 include/linux/device.h                      | 14 +++++++-------
 17 files changed, 55 insertions(+), 55 deletions(-)
---
base-commit: 1160c2208fab4eaf4a32d738f83474c32c3a6944
change-id: 20260712-sysfs-const-attr-dev_ext_attr-dbf669fdfd4e

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>


