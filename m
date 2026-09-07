Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B374C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 05:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OE+94+rxnr6JyHzVf41++W806Ur3QbjQQuslFQknClE=; b=mk/dFBOO9jJCnl
	YQiMDbehGFxPqrU7EB9f6ncj/pU3FnsCzHoBZKb2CBTsKE41fJ/vLjA3kUm7U8LY8pwuyDdJI5zAc
	T6LO5aW1h+M9bcATac7GSNGYRCtrcjZcYgAubwGjyjZ1mLnJ/lff8oKogRiy9SsqqRL1/U3zyZn7D
	HohOr9KN6P+Jp3Af7eTB6qaap9mMaoZ3yApQo3hj30XhogUP+oNoKJcjsFJtqJLXug859A/wwOiOj
	uPn2eXHMiQ954N+yHQrdH7CyD63ACLuoJJmWwGvbu0dR6HRNc6gguxfb/JUa2Bp+AhoEkD4tBhz7V
	/te1Gaxhk0dzuY2jrKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SAT-00000005xQl-0o5e;
	Mon, 07 Sep 2026 05:45:21 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SAQ-00000005xP6-0690
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 05:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1788759912;
	bh=74OyWk+S1XapnZa91tZh7QGJ8Z65Zq0I4MGM9fNJNk4=;
	h=From:Subject:Date:To:Cc:From;
	b=A6HY3cV701dgp4nehXyHi0uuEnDYEsK/ruMG+iGzYoQjZUV/M7TXnif6yPqj1WCHf
	 u6SwqmxYz6xiFp1/Wb0+Xphev6GzjL+dE1p6VSs5jEWoFF42oV7/2jf4QHzK47dG/q
	 rSXkrDVQq0zPLslfyMEAaaLBw5epZDE/IPsbgxso=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/3] driver core: Constify the signature of
 device_show/store_*()
Date: Mon, 07 Sep 2026 07:45:00 +0200
Message-Id: <20260907-sysfs-const-attr-dev_ext_attr-v2-0-bf53afe57071@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOyw7CIBBFf6Vh7RjAitGV/2GapoVBcEENQ7FN0
 3+3j7h2eZKbc+7ECKNHYrdiYhGzJ9+FBeShYNo14YngzcJMcqn4RUigkSyB7gIlaFKKYDDXOKR
 6h9YqdbXGmhLZ4nhHtH7Y/I9qZ+rbF+q0SteF85S6OG4Hslh3v1b5p5UFcFCt1Lw8nY2S4v5BT
 0Ta9e4YMLFqnucvwCtUS+EAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788759912; l=2248;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=74OyWk+S1XapnZa91tZh7QGJ8Z65Zq0I4MGM9fNJNk4=;
 b=XvYmhK8g23TtkqqxN7yFFdmL3QKRYan/Vq1gOpl1Rbpx5vGwB2eFDVQ3yILkyDbE08ZBxinF5
 wad1OfZF2tjA5gvkgXhlADqWAri64DSYcu+XOo2XcNPH3zmUHKsUZII
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_224518_321732_9DD7EB12 
X-CRM114-Status: GOOD (  10.60  )
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

Prepare for the constification of 'struct dev_ext_attribute' instances
by changing the signature of the standard callback functions.
The first two patches prepare some drivers to handle both the const and
non-const callback variants.

Intended for the driver-core tree.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Rebase on v7.3-rc1.
- Cover a few more drivers in drivers/perf/.
- Link to v1: https://patch.msgid.link/20260714-sysfs-const-attr-dev_ext_attr-v1-0-6b2c0435d621@weissschuh.net

---
Thomas Weißschuh (3):
      x86/mce: Use __DEVICE_ATTR() macro to initialize dev_ext_attribute
      drivers: perf: Use __DEVICE_ATTR() macro to initialize dev_ext_attribute
      driver core: Constify the signature of device_show/store_*()

 arch/powerpc/perf/hv-24x7.c                 |  2 +-
 arch/x86/kernel/cpu/mce/core.c              |  6 +++---
 drivers/base/core.c                         | 30 ++++++++++++++---------------
 drivers/perf/alibaba_uncore_drw_pmu.c       |  2 +-
 drivers/perf/arm-cci.c                      |  2 +-
 drivers/perf/arm-ccn.c                      |  2 +-
 drivers/perf/arm_cspmu/arm_cspmu.h          |  2 +-
 drivers/perf/arm_dsu_pmu.c                  |  2 +-
 drivers/perf/arm_spe_pmu.c                  |  6 +++---
 drivers/perf/cxl_pmu.c                      | 10 +++++-----
 drivers/perf/fsl_imx8_ddr_perf.c            |  2 +-
 drivers/perf/fujitsu_uncore_pmu.c           |  2 +-
 drivers/perf/hisilicon/hisi_pcie_pmu.c      |  2 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.h    |  6 +++---
 drivers/perf/hisilicon/hns3_pmu.c           |  6 +++---
 drivers/perf/nvidia_t410_c2c_pmu.c          |  2 +-
 drivers/perf/nvidia_t410_cmem_latency_pmu.c | 12 ++++++------
 drivers/perf/qcom_l3_pmu.c                  |  8 ++++----
 drivers/perf/starfive_starlink_pmu.c        |  2 +-
 drivers/perf/xgene_pmu.c                    |  2 +-
 include/linux/device.h                      | 14 +++++++-------
 21 files changed, 61 insertions(+), 61 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260712-sysfs-const-attr-dev_ext_attr-dbf669fdfd4e

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>


