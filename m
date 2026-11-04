Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856CF606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aOaHFLYh;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6PfgsQi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VC0kuAI8YTTP8xqxIGPPjehsRscbtuqmLo3CRUhyHGY=; b=aOaHFLYhIFF9lY
	H1e/k0b20vY3gUmq6P11SVvNj3rS3y/oEIoKR39qbs00wEcwIF3c/K1w24+WtmTb3qj2W+ABZQV/k
	QFk2UOhZh0+lbR0hAqGGRcYBFLHKtxbky1sXcDExN9YdpUcV02/QCH4woONqeI6BI7H7EBJY3npkm
	DhB4L5D0qnaa9jTZIC795hXcbymeOAg1+XfFt9jnS8eFhmR26cXnQodlRbz9mOUYwGWFgp6FkPhxG
	h+82pkyQg9XPpGgPU6mmjY4UDLAogY5mcThDcSSdCQOxoDXgDTkEINZTFxR0DQmLp9iujDluTc3LG
	XpwI8To0mWwW43ECBB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdfd-00000005vS7-3ou0;
	Wed, 04 Nov 2026 16:17:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdfc-00000005vQL-13pF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:17:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DE53609EB;
	Wed,  4 Nov 2026 16:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109AD1F00919;
	Wed,  4 Nov 2026 16:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809023;
	bh=VC0kuAI8YTTP8xqxIGPPjehsRscbtuqmLo3CRUhyHGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G6PfgsQitDZ1twMbvHRuDjOQSiduhDAjzyHbaIUOA6txxiAu2D1QHpHqF0/SkSCSc
	 sEoUEK79ryNJpGzvRuao/UGmwpcO7/Lf+tJTzvwJFZ59Ltkqe7WTpIj2vI6SbEjcTf
	 gEsWQ6vV3YdSU+TpI3tPB2WQmGTxR14A6bHR5wZdepMyI4ffpQoUsnjEsghEou0lBI
	 lhjNM2aE0+/Rq9F3VITQHpiDvyea+t8LHJ5lxExc+TfbmvQP7q/6ZqdSH2jcQbex8W
	 MZmP+pS0wOCrYFfo4B8d5v9Lt6HFsyzBrHrXD/OvjVVvAUk6qg6TimK4glFad8+ebP
	 pMer4fiajWMXg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v8 01/15] PCI/TSM: Move core code into its own directory
Date: Wed,  4 Nov 2026 21:46:18 +0530
Message-ID: <20261104161632.3547423-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Multiple patch series modify drivers/pci/tsm.c, and some add new files
to the PCI/TSM subsystem. Move tsm.c to tsm/core.c so these series can
share the directory layout and reduce merge conflicts.

Update the build rules, local header include, and MAINTAINERS entry for
the new location.

No functional change.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 Documentation/driver-api/pci/tsm.rst | 2 +-
 MAINTAINERS                          | 2 +-
 drivers/pci/Makefile                 | 2 +-
 drivers/pci/tsm/Makefile             | 7 +++++++
 drivers/pci/{tsm.c => tsm/core.c}    | 2 +-
 5 files changed, 11 insertions(+), 4 deletions(-)
 create mode 100644 drivers/pci/tsm/Makefile
 rename drivers/pci/{tsm.c => tsm/core.c} (99%)

diff --git a/Documentation/driver-api/pci/tsm.rst b/Documentation/driver-api/pci/tsm.rst
index 232b92bec93f..c95c513019b5 100644
--- a/Documentation/driver-api/pci/tsm.rst
+++ b/Documentation/driver-api/pci/tsm.rst
@@ -17,5 +17,5 @@ Subsystem Interfaces
 .. kernel-doc:: include/linux/pci-tsm.h
    :internal:
 
-.. kernel-doc:: drivers/pci/tsm.c
+.. kernel-doc:: drivers/pci/tsm/core.c
    :export:
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..561914074d01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28487,7 +28487,7 @@ S:	Maintained
 F:	Documentation/ABI/testing/configfs-tsm-report
 F:	Documentation/driver-api/coco/
 F:	Documentation/driver-api/pci/tsm.rst
-F:	drivers/pci/tsm.c
+F:	drivers/pci/tsm/
 F:	drivers/virt/coco/guest/
 F:	include/linux/*tsm*.h
 F:	samples/tsm-mr/
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index 41ebc3b9a518..211f195ff2c9 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -35,7 +35,7 @@ obj-$(CONFIG_XEN_PCIDEV_FRONTEND) += xen-pcifront.o
 obj-$(CONFIG_VGA_ARB)		+= vgaarb.o
 obj-$(CONFIG_PCI_DOE)		+= doe.o
 obj-$(CONFIG_PCI_IDE)		+= ide.o
-obj-$(CONFIG_PCI_TSM)		+= tsm.o
+obj-$(CONFIG_PCI_TSM)		+= tsm/
 obj-$(CONFIG_PCI_DYNAMIC_OF_NODES) += of_property.o
 obj-$(CONFIG_PCI_NPEM)		+= npem.o
 obj-$(CONFIG_PCIE_TPH)		+= tph.o
diff --git a/drivers/pci/tsm/Makefile b/drivers/pci/tsm/Makefile
new file mode 100644
index 000000000000..464414c11a72
--- /dev/null
+++ b/drivers/pci/tsm/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the PCI/TSM infrastructure
+
+obj-$(CONFIG_PCI_TSM) += tsm.o
+
+tsm-y := core.o
diff --git a/drivers/pci/tsm.c b/drivers/pci/tsm/core.c
similarity index 99%
rename from drivers/pci/tsm.c
rename to drivers/pci/tsm/core.c
index 5fdcd7f2e820..76ef03a1b3ec 100644
--- a/drivers/pci/tsm.c
+++ b/drivers/pci/tsm/core.c
@@ -15,7 +15,7 @@
 #include <linux/sysfs.h>
 #include <linux/tsm.h>
 #include <linux/xarray.h>
-#include "pci.h"
+#include "../pci.h"
 
 /*
  * Provide a read/write lock against the init / exit of pdev tsm
-- 
2.43.0


