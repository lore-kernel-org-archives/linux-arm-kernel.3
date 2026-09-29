Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61871CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhU4Q4AtsXWrT2tsgOla9plnm0e1MrQXpUDDau4gO4c=; b=4DSoBCQjbzcerLHUIOp73jDS7+
	J1yO6+Ls0/RtPkgqvNS7L5WOq6AgIXamTozQGE6jEDJt7qbeiRBO9jtfHhADTvuI9KDPkP8hzeYkA
	NibEql/1fSPSnbY74CdXhhVJMCmmikO10KuoLBUbK2r1ZnRN9fJogvsmT+RhK4UU2oc+RHtLvkidF
	AMxXG2M9G1GRbgwhpMlCbldD5wxkA2pe04VJE3F0qCP1aKcgeB0EqldsqrazjrZhcponoGMJOWC7f
	rqj9wMWN8+6z/ie3IJ4AUzN1uzkwRe3R1qbYr95Ps1ZusYJE/7Jkn2CP68GnFxuYFqpBT83GN/RGg
	skEcJn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdiM-00000004PF1-1Eww;
	Tue, 29 Sep 2026 19:42:10 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdiJ-00000004PCy-3J8W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:42:08 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so28560005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 12:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1790710926; x=1791315726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhU4Q4AtsXWrT2tsgOla9plnm0e1MrQXpUDDau4gO4c=;
        b=AworG55p/PDrIr3omMGTOe9n8tILBV/SSbLcLgKXtYH86KSIGTNlVhgWu0mgC5jFd5
         RXoExlZgivbGkofLwSdk8bwIzD/EIcosypz5ow5ofsNZiKm6k1LhMALz8VPv0lqMEciB
         umq7QlpHCt9HfHj7AV6jzlRbf8PuBL9GjPDfKjJoExVNUBETSyEmsiLfajKgxIk9nmsV
         ReCtVne9rEylZjAD57pPdz+kk0Lj3gH1eXyG26hi60QOzRmz4QGsEAyoc17Nw15zxaQO
         XUr/x+f2PnJ+VXnIn3umdGwyPQRHCx/GXJb3dWkmhiXZv4OgoFRwGZuvcMnP0agBYLok
         BPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710926; x=1791315726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhU4Q4AtsXWrT2tsgOla9plnm0e1MrQXpUDDau4gO4c=;
        b=dv4JR1z2MAe2r+ReSgJJ9BZ50H9ljDXEWxOhUj52NUGBHWIFabHmCj0P6d+Kd0Y2Pi
         vfUbVUT8yku0fKi5Covy1cIS0YGVSdoPXqUTcXcBqTTO3t4GBOenSZfwdcY6jFgPwYL4
         mcvDMQgSmlgleCif6UYKuSzox5y7cJ9HXbLp+rOKjgxhiuflEfc/faed1BRzdaf2JZmL
         gYbeDwb8EmChpZSJtec9ClYOy+fHzOU+mTlErDwrlPFnH3yPkcsDW5OtSZzO6rQdinpl
         LgzxOE/awa7cFtwTjtzhlqp9+tSa2FW+SWBChVxqigHRMXFs8+ynm3Ak/pkH3Eq44THy
         EN2w==
X-Forwarded-Encrypted: i=1; AKwUvBzAoUgJaxL1fa00QujvjKpaUDHZYlEJv4IXXDh5Xx4fpeskbeipV7bkVNgeG+7zGBZ2AlsT8wMcGmXvPirAGypj@lists.infradead.org
X-Gm-Message-State: AFuF++kJceq0wP11PG9l0LZAb2XXQJRpnc4Hhei4wpcYwYehpQWyjbyu
	09EMAN0VYAZlAnKICfbeShubCZF5wUKsPVX6APwqcB9m36akOHgOLY6N9g1eJ3Y3pdw=
X-Gm-Gg: AYBFou3oKVGN81mUkr/+vruy2eFSEr2SJ6eAB8WJQhTAjEFsQy9Z9XgZAIB2LWlSYJC
	Y7PAygtnduF8BxL1P5XdkTrG/fBb4QJSEaELKdEKklpS9UNexipKeK59JnHQ3MSo2+witgQ102r
	NdY59mIuayC+4wFsPT7PHalIZaS9x87Dm9DLW2wUjvNqVsxd6knoL2rVV0PAXR9UI76u19v566o
	1k55FrPA9g3PRwuxDI8D9+f05rtx5hvktadRpnW8urW8ZGySJv7nyeA0onStckf2Y6ZJcbWdvLB
	60NzzMMo2z7AB5G4V6lfqg+pZiaKr88BFUz0Jo9rsg05gnbquOJZRrRdgYDfyGLnJT+is2RBwCt
	7+pXi8Lu3Pq5/ARUS9e3b3tnO4bxvgjis2Hnvp6I0ARLx9nwQ22j8jNM/89K+frenXlXUZbples
	n7a23CjGI4GEgbNbu7uDu65zy3hhFG0VXWyGm3bFWAUllBBL+t1CUi8fxDFosqncQ6woFmbCegF
	tVmoJcHYnTTJl4h9HmBvLGIQTDUWttzVyNHUeDra9dM+FJLZGQQMU/gLQPb1DMjmoIjaOWv
X-Received: by 2002:a05:600c:4f4c:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a01514585dmr2362545e9.35.1790710926223;
        Tue, 29 Sep 2026 12:42:06 -0700 (PDT)
Received: from localhost.localdomain ([217.146.93.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f77b62sm5238355e9.6.2026.09.29.12.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:42:05 -0700 (PDT)
From: salil.mehta@opnsrc.net
To: Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	James Morse <james.morse@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Gavin Shan <gshan@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Salil Mehta <salil.mehta@opnsrc.net>
Subject: [RFC PATCH 2/2] Revert "cpu/hotplug: Fix NULL kobject warning in cpuhp_smt_enable()"
Date: Tue, 29 Sep 2026 19:41:30 +0000
Message-Id: <1ecc8a0a92cd7bc30f402a6b9e16be93444e57bc.1790692295.git.salil.mehta@opnsrc.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790692295.git.salil.mehta@opnsrc.net>
References: <cover.1790692295.git.salil.mehta@opnsrc.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_124207_888501_3773F3A9 
X-CRM114-Status: GOOD (  21.27  )
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

From: Salil Mehta <salil.mehta@opnsrc.net>

This reverts commit f9a82544c7174851f5c7524622f5966dcafd3a47.

That commit fixed a NULL kobject warning in cpuhp_smt_enable() by changing
arm64 so that Online-Capable but MADT-disabled CPUs are not initially in
cpu_present_mask, and by adding/removing them from that mask through the
ACPI map/unmap path.

The original arm64 virtual CPU hotplug model deliberately allowed CPUs to
be present but not enabled. cpu_enabled_mask was introduced to represent
exactly whether a present CPU may currently be brought online.

With the preceding change, cpuhp_smt_enable() now checks cpu_enabled()
before attempting _cpu_up(). This addresses the original warning at the
caller while preserving the present/enabled distinction and the arm64
virtual CPU hotplug model.

Restore the previous arm64 present-mask handling and documentation so that
all enumerated possible CPUs remain present while firmware availability is
represented by the enabled state.

This is posted as an RFC because there may be another reason why changing
the arm64 present-mask semantics is preferred over consuming the generic
enabled mask in cpuhp_smt_enable().

Signed-off-by: Salil Mehta <salil.mehta@opnsrc.net>
---
 Documentation/arch/arm64/cpu-hotplug.rst | 28 ++++++++++--------------
 arch/arm64/kernel/acpi.c                 |  2 --
 arch/arm64/kernel/smp.c                  | 12 +---------
 3 files changed, 13 insertions(+), 29 deletions(-)

diff --git a/Documentation/arch/arm64/cpu-hotplug.rst b/Documentation/arch/arm64/cpu-hotplug.rst
index 7c3379b704aa..8fb438bf7781 100644
--- a/Documentation/arch/arm64/cpu-hotplug.rst
+++ b/Documentation/arch/arm64/cpu-hotplug.rst
@@ -47,12 +47,11 @@ ever have can be described at boot. There are no power-domain considerations
 as such devices are emulated.

 CPU Hotplug on virtual systems is supported. It is distinct from physical
-CPU Hotplug as all vCPU resources are statically described in the firmware
-configuration tables (e.g. MADT), meaning their maximum possible count is
-known at boot. However, vCPUs that are not enabled at boot are not marked
-as ``present`` by the kernel until they are hotplugged. An example is where
-a virtual machine boots with a single CPU, and additional CPUs are added
-once a cloud orchestrator deploys the workload.
+CPU Hotplug as all resources are described as ``present``, but CPUs may be
+marked as disabled by firmware. Only the CPU's online/offline behaviour is
+influenced by firmware. An example is where a virtual machine boots with a
+single CPU, and additional CPUs are added once a cloud orchestrator deploys
+the workload.

 For a virtual machine, the VMM (e.g. Qemu) plays the part of firmware.

@@ -61,19 +60,16 @@ brought online. Firmware can enforce its policy via PSCI's return codes. e.g.
 ``DENIED``.

 The ACPI tables must describe all the resources of the virtual machine. CPUs
-that are hot-pluggable must have the ``online capable`` bit set and the
-``enabled`` bit cleared in the MADT GICC structures to indicate they can be
-enabled later. The boot CPU must be marked as ``enabled`` with its
-``online capable`` bit cleared. The 'always on' GICR structure must be used
-to describe the redistributors.
+that firmware wishes to disable either from boot (or later) should not be
+``enabled`` in the MADT GICC structures, but should have the ``online capable``
+bit set, to indicate they can be enabled later. The boot CPU must be marked as
+``enabled``.  The 'always on' GICR structure must be used to describe the
+redistributors.

 CPUs described as ``online capable`` but not ``enabled`` can be set to enabled
 by the DSDT's Processor object's _STA method. On virtual systems the _STA method
-must always set the ``ACPI_STA_DEVICE_PRESENT`` bit, while toggling the
-``ACPI_STA_DEVICE_ENABLED`` bit to reflect its plug status. The kernel will
-then dynamically mark the vCPU as ``present`` within the OS when the
-``ACPI_STA_DEVICE_ENABLED`` bit becomes set during hot-add. Changes to the
-firmware policy can be notified to the OS via device-check or eject-request.
+must always report the CPU as ``present``. Changes to the firmware policy can
+be notified to the OS via device-check or eject-request.

 CPUs described as ``enabled`` in the static table, should not have their _STA
 modified dynamically by firmware. Soft-restart features such as kexec will
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 681aa2bbc399..5891f92c2035 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -448,14 +448,12 @@ int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 apci_id,
 		return *pcpu;
 	}

-	set_cpu_present(*pcpu, true);
 	return 0;
 }
 EXPORT_SYMBOL(acpi_map_cpu);

 int acpi_unmap_cpu(int cpu)
 {
-	set_cpu_present(cpu, false);
 	return 0;
 }
 EXPORT_SYMBOL(acpi_unmap_cpu);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index a61dc3016a11..0c5292e4f4e0 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -558,11 +558,6 @@ struct acpi_madt_generic_interrupt *acpi_cpu_get_madt_gicc(int cpu)
 }
 EXPORT_SYMBOL_GPL(acpi_cpu_get_madt_gicc);

-static bool acpi_cpu_is_present(int cpu)
-{
-	return acpi_cpu_get_madt_gicc(cpu)->flags & ACPI_MADT_ENABLED;
-}
-
 /*
  * acpi_map_gic_cpu_interface - parse processor MADT entry
  *
@@ -667,10 +662,6 @@ static void __init acpi_parse_and_init_cpus(void)
 		early_map_cpu_to_node(i, acpi_numa_get_nid(i));
 }
 #else
-static bool acpi_cpu_is_present(int cpu)
-{
-	return false;
-}
 #define acpi_parse_and_init_cpus(...)	do { } while (0)
 #endif

@@ -815,8 +806,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 		if (err)
 			continue;

-		if (acpi_disabled || acpi_cpu_is_present(cpu))
-			set_cpu_present(cpu, true);
+		set_cpu_present(cpu, true);
 		numa_store_cpu_info(cpu);
 	}
 }
-- 
2.34.1

