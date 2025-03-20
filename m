Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205F2C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwJWfv7sSsu8zcuBk05hMx3hXI76rKRudocCrAtv49o=; b=kW8stoxIJCATyM7bYe319k1msH
	uF/pM9qm64IQiPeAyUPr6ii3OJgsjA8IBETnUnQ/5kTbRmeDm3AEWISyScZsCLlrSTH25xTH6YYzh
	hGSVLcFgoCdpcMb1OMUHshe9tD9KyDLr+0UaKlw4oEqRbV2fCjMAGHinl0ktw5xdpuNBYh1Pgu1KJ
	wjw/U2GPAnCoWvEUyo6wYurr/mhqvacwMZ0PPojsc//jmLXlkFe/LjB7ui7JCRtMlXoNKoy8nXv3O
	Dg3Zsz3ovDAkyqIzfFzgdHiw7iW2dF9ws3J8tQe2V3G3sL+ywxtuYIfU4NKV+Gw2yftlGI1BFfdGN
	JVP71XgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvK3h-0000000Crvm-3vsQ;
	Thu, 20 Mar 2025 17:51:57 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJvy-0000000CqPv-1WqX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 17:44:00 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZJXsw4H2fz6M4kK;
	Fri, 21 Mar 2025 01:40:36 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id DB01114050C;
	Fri, 21 Mar 2025 01:43:56 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Mar 2025 18:43:56 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<james.morse@arm.com>, <conor@kernel.org>, Yicong Yang
	<yangyicong@huawei.com>, <linux-acpi@vger.kernel.org>
CC: <linux-arch@vger.kernel.org>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, <linux-mm@kvack.org>,
	<gregkh@linuxfoundation.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: [RFC PATCH 5/6] acpi: PoC of Cache control via ACPI0019 and _DSM
Date: Thu, 20 Mar 2025 17:41:17 +0000
Message-ID: <20250320174118.39173-6-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320174118.39173-1-Jonathan.Cameron@huawei.com>
References: <20250320174118.39173-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_104358_717156_B61C9BE2 
X-CRM114-Status: GOOD (  24.48  )
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

Do not merge. This is the bare outline of what may become an ACPI
code first specification proposal.

From various discussions, it has become clear that there is some desire not
to end up needing a cache flushing driver for every host that supports the
flush by PA range functionality that is needed for CXL and similar
disagregated memory pools where the host PA mapping to actual memory may
change over time and where various races can occur with prefetchers making
it hard to use CPU instructions to flush all stale data out.

There was once an ARM PSCI specification [1] that defined a firmware
interface to solve this problem.  However that meant dropping into
a more privileged mode, or chatting to an external firmware. That was
overkill for those systems that provide a simple MMIO register interface
for these operations. That specification never made it beyond alpha level.

For the typical class of machine that actually uses these disaggregated
pools, ACPI can potentially provide the same benefits with a great deal more
flexibility.  A _DSM in DSDT via operation regions, may be used to do any of:
1) Make firmware calls
2) Operate a register based state machine.
3) Most other things you might dream of.

This was prototyped against an implementation of the ARM specification
in [1] wrapped up in _DSM magic. That was chosen to give a second
(be it abandoned) example of how this cache control class can be used.

DSDT blob example that uses PSCI underneath.

Device (CCT0)
{
     Name (_HID, "ACPI0019")  // _HID: Hardware ID
     Name (_UID, Zero)  // _UID: Unique ID
     OperationRegion (AFFH, FFixedHW, One, 0x90)
     Field (AFFH, BufferAcc, NoLock, Preserve)
     {
         AFFX,   1152
     }

     Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
     {
         If ((Arg0 == ToUUID ("61fdc7d5-1468-4807-b565-515bf6b75319") /* Unknown UUID */))
         {
             If ((Arg2 == Zero))
	     {
                 Return (Buffer (One)
                 {
                     0x0F                                             // .
                 })
             }

             If ((Arg2 == One))
             {
                 Name (CCR1, Buffer (0x08)
                 {
                      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                 })
                 CreateDWordField (CCR1, Zero, RRR1)
                 CCR1 = AFFX = Buffer (0x10)
                 {
                      /* 0000 */  0x17, 0x00, 0x00, 0xC4, 0x00, 0x00, 0x00, 0x00,  // ........
                     /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                 }
                 Name (CCOP, Zero)
                 CCOP = RRR1 /* \_SB_.CCT0._DSM.RRR1 */
                 CCR1 = AFFX = Buffer (0x10)
                 {
                     /* 0000 */  0x17, 0x00, 0x00, 0xC4, 0x00, 0x00, 0x00, 0x00,  // ........
                     /* 0008 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                 }
                 Name (CCLA, Zero)
                 CCLA = RRR1 /* \_SB_.CCT0._DSM.RRR1 */
                 CCR1 = AFFX = Buffer (0x10)
                 {
                      /* 0000 */  0x17, 0x00, 0x00, 0xC4, 0x00, 0x00, 0x00, 0x00,  // ........
                      /* 0008 */  0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                 }
                 Name (CCRL, Zero)
                 CCRL = RRR1 /* \_SB_.CCT0._DSM.RRR1 */
                 Return (Package (0x04)
                 {
                     CCOP,
                     CCLA,
                     CCRL,
                     One
                 })
            }
            If ((Arg2 == 0x02))
            {
                If (!((ObjectType (Arg3) == 0x04) && (SizeOf (Arg3) == 0x03)))
                {
                    Return (One)
                }

                Name (BUFF, Buffer (0x28)
                {
                    /* 0000 */  0x16, 0x00, 0x00, 0xC4, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                 })
                 CreateQWordField (BUFF, 0x08, BFBA)
                 CreateQWordField (BUFF, 0x10, BFSZ)
                 CreateQWordField (BUFF, 0x20, BFFL)
                 Local0 = Arg3 [Zero]
                 BFBA = DerefOf (Local0)
                 Local0 = Arg3 [One]
                 BFSZ = DerefOf (Local0)
                 Local0 = Arg3 [0x02]
                 Local1 = DerefOf (Local0)
                 If ((Local1 != Zero))
                 {
                     Return (One)
                 }

                 AFFX = BUFF /* \_SB_.CCT0._DSM.BUFF */
                 Return (Zero)
             }

             If ((Arg2 == 0x03))
             {
                 Return (Zero)
             }
         }
    }
}

Link: https://developer.arm.com/documentation/den0022/falp1/?lang=en [1]
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/acpi/Makefile              |   1 +
 drivers/cache/Kconfig              |   8 ++
 drivers/cache/Makefile             |   1 +
 drivers/cache/acpi_cache_control.c | 157 +++++++++++++++++++++++++++++
 4 files changed, 167 insertions(+)

diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index 40208a0f5dfb..fcb6635d27d8 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -129,3 +129,4 @@ obj-$(CONFIG_ACPI_VIOT)		+= viot.o
 
 obj-$(CONFIG_RISCV)		+= riscv/
 obj-$(CONFIG_X86)		+= x86/
+
diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index 6dab014bc581..5569af0903c4 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -17,6 +17,14 @@ config HISI_SOC_HHA
 
 	  This driver can be built as a module. If so, the module will be
 	  called hisi_soc_hha.
+
+config ACPI_CACHE_CONTROL
+       tristate "ACPI cache maintenance"
+       depends on ARM64
+       help
+         ACPI0019 device ID in DSDT identifies an interface that may be used
+	 to carry out certain forms of cache flush operation.
+
 endif
 
 config AX45MP_L2_CACHE
diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
index 48b319984b45..9f0679a6dab1 100644
--- a/drivers/cache/Makefile
+++ b/drivers/cache/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
 
 obj-$(CONFIG_CACHE_COHERENCY_CLASS)	+= coherency_core.o
 obj-$(CONFIG_HISI_SOC_HHA)		+= hisi_soc_hha.o
+obj-$(CONFIG_ACPI_CACHE_CONTROL)   	+= acpi_cache_control.o
diff --git a/drivers/cache/acpi_cache_control.c b/drivers/cache/acpi_cache_control.c
new file mode 100644
index 000000000000..d5b91f505a26
--- /dev/null
+++ b/drivers/cache/acpi_cache_control.c
@@ -0,0 +1,157 @@
+
+#include <linux/acpi.h>
+#include <linux/cache_coherency.h>
+#include <linux/cleanup.h>
+#include <asm/cacheflush.h>
+
+struct acpi_cache_control {
+	struct cache_coherency_device ccd;
+	/* Stuff */
+};
+
+static const guid_t testguid =
+	GUID_INIT(0x61FDC7D5, 0x1468, 0x4807,
+		0xB5, 0x65, 0x51, 0x5B, 0xF6, 0xB7, 0x53, 0x19);
+
+static int acpi_cache_control_query(struct acpi_device *device)
+{
+	union acpi_object *out_obj;
+
+	out_obj = acpi_evaluate_dsm(device->handle, &testguid, 1, 1, NULL);//&in_obj);
+	if (out_obj->package.count < 4) {
+		printk("Only partial capabilities received\n");
+		return -EINVAL;
+	}
+	for (int i = 0; i < out_obj->package.count; i++)
+		if (out_obj->package.elements[i].type != 1) {
+			printk("Element %d not integer\n", i);
+			return -EINVAL;
+		}
+	switch (out_obj->package.elements[0].integer.value) {
+	case 0:
+		printk("Supports range\n");
+		break;
+	case 1:
+		printk("Full flush only\n");
+		break;
+	default:
+		printk("unknown op type %llx\n",
+			out_obj->package.elements[0].integer.value);
+		break;
+	}
+
+	printk("Latency is %lld msecs\n",
+		out_obj->package.elements[1].integer.value);
+	printk("Min delay between calls is %lld msecs\n",
+		out_obj->package.elements[2].integer.value);
+
+	if (out_obj->package.elements[3].integer.value & BIT(0))
+		printk("CLEAN_INVALIDATE\n");
+	if (out_obj->package.elements[3].integer.value & BIT(1))
+		printk("CLEAN\n");
+	if (out_obj->package.elements[3].integer.value & BIT(2))
+		printk("INVALIDATE\n");
+	ACPI_FREE(out_obj);
+	return 0;
+}
+
+static int acpi_cache_control_inval(struct acpi_device *device, u64 base, u64 size)
+{
+	union acpi_object *out_obj;
+	union acpi_object in_array[] = {
+		[0].integer = { ACPI_TYPE_INTEGER, base },
+		[1].integer = { ACPI_TYPE_INTEGER, size },
+		[2].integer = { ACPI_TYPE_INTEGER, 0 }, // Clean invalidate
+	};
+	union acpi_object in_obj = {
+		.package = {
+			.type = ACPI_TYPE_PACKAGE,
+			.count = ARRAY_SIZE(in_array),
+			.elements = in_array,
+		},
+	};
+
+	out_obj = acpi_evaluate_dsm(device->handle, &testguid, 1, 2, &in_obj);
+	printk("out type %d\n", out_obj->type);
+	printk("out val %lld\n", out_obj->integer.value);
+	ACPI_FREE(out_obj);
+	return 0;
+}
+
+static int acpi_cc_wbinv(struct cache_coherency_device *ccd,
+			 struct cc_inval_params *invp)
+{
+	struct acpi_device *acpi_dev =
+		container_of(ccd->dev.parent, struct acpi_device, dev);
+
+	return acpi_cache_control_inval(acpi_dev, invp->addr, invp->size);
+}
+
+static int acpi_cc_done(struct cache_coherency_device *ccd)
+{
+	/* Todo */
+	return 0;
+}
+
+static const struct coherency_ops acpi_cc_ops = {
+	.wbinv = acpi_cc_wbinv,
+	.done = acpi_cc_done,
+};
+
+DEFINE_FREE(acpi_cache_control, struct acpi_cache_control *,
+	if (_T) cache_coherency_device_put(&_T->ccd));
+
+static int acpi_cache_control_add(struct acpi_device *device)
+{
+	int ret;
+
+	printk("ACPI device bound\n");
+
+	ret = acpi_cache_control_query(device);
+	if (ret)
+		return ret;
+
+	struct acpi_cache_control *acpi_cc __free(acpi_cache_control) =
+		cache_coherency_alloc_device(&device->dev, &acpi_cc_ops,
+					struct acpi_cache_control, ccd);
+	if (!acpi_cc)
+		return -ENOMEM;
+
+	ret = cache_coherency_device_register(&acpi_cc->ccd);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(&device->dev, acpi_cc);
+	return 0;
+}
+
+static void acpi_cache_control_del(struct acpi_device *device)
+{
+	struct acpi_cache_control *acpi_cc = dev_get_drvdata(&device->dev);
+
+	cache_coherency_device_unregister(&acpi_cc->ccd);
+	cache_coherency_device_put(&acpi_cc->ccd);
+}
+
+static const struct acpi_device_id acpi_cache_control_ids[] = {
+	{ "ACPI0019" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(acpi, acpi_cache_control_ids);
+
+static struct acpi_driver acpi_cache_control_driver = {
+	.name = "acpi_cache_control",
+	.ids = acpi_cache_control_ids,
+	.ops = {
+		.add = acpi_cache_control_add,
+		.remove = acpi_cache_control_del,
+	},
+};
+
+module_acpi_driver(acpi_cache_control_driver);
+
+MODULE_IMPORT_NS("CACHE_COHERENCY");
+MODULE_AUTHOR("Jonathan Cameron <Jonathan.Cameron@huawei.com>");
+MODULE_DESCRIPTION("HACKS HACKS HACKS");
+MODULE_LICENSE("GPL");
-- 
2.43.0


