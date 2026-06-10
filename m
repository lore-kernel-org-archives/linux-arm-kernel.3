Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF28CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 07:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaeZgUL9why9NypSzc70XDOqswpi+FzflFlPsoNkX3E=; b=AY2697xhITEz2CrnAPcXwSSHaK
	12dto+g1Uq+3Yb6GrU8zRSVVTv3x8hAJTYnGi96v1+qUgnHlEGCMQ/jhD8svAMzobWhY0SupV9R6o
	wck4r2tbhHSzYugMcw88NQRQOPhdNf2TG1epdphlP/Gg+IUlIwhvFdMkrsUvWH9qt/a33PPUxkqat
	dvdC05mJbSomJZfdHWlGKBkN4V6p1tB54ofaIJ0/FglWZn70idp8rtpSe9oDBBOTbjVBD6Efhwwaz
	IrMVGqkHWBeAVGPkcXPOxp8Zx1sNbPKTtEdZUE2DkFN9xPTvdpEfE0u9aLeswWbeeamo9RAPTrDab
	/0Z2/m1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDjf-00000006yyL-2nhv;
	Wed, 10 Jun 2026 07:52:27 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDjb-00000006ywl-2VmO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 07:52:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yaeZgUL9why9NypSzc70XDOqswpi+FzflFlPsoNkX3E=;
	b=X/ujI6xgJIrMpg9KYVbi42TOs/c598kqx7zgRtlaOhtl2kk1EYubY+8czdU9Oj0zla4W5U2SA
	/o3L1Eq06le+rx4poWLuXm1sH1G4w/gpsGEsld6Y81vvGplKWEbcTaFYrIwSya21YIMP3k1Lanb
	UwGcenn4FXbpVMEj7sUCtYY=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gZyTk52nnz12LCq;
	Wed, 10 Jun 2026 15:44:26 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 714DA40670;
	Wed, 10 Jun 2026 15:52:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 10 Jun
 2026 15:52:17 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <punit.agrawal@oss.qualcomm.com>,
	<ruanjinjie@huawei.com>, <mrigendra.chaubey@gmail.com>,
	<suzuki.poulose@arm.com>, <chenl311@chinatelecom.cn>,
	<fengchengwen@huawei.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <arnd@arndb.de>, <gshan@redhat.com>,
	<jic23@kernel.org>, <dietmar.eggemann@arm.com>, <sudeep.holla@kernel.org>,
	<pierre.gondois@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/2] arm64: smp: Fix hot-unplug tearing by forcing unregistration
Date: Wed, 10 Jun 2026 15:52:01 +0800
Message-ID: <20260610075202.3597031-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610075202.3597031-1-ruanjinjie@huawei.com>
References: <20260610075202.3597031-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_005224_161649_AA593C45 
X-CRM114-Status: GOOD (  13.41  )
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

Sashiko review pointed out the following issue[1].

Commit eba4675008a6 ("arm64: arch_register_cpu() variant to check if
an ACPI handle is now available.") introduced architectural safety
blocks inside arch_unregister_cpu(). If a hot-unplug operation is
determined to be a physical hardware removal (where _STA evaluates to
!ACPI_STA_DEVICE_PRESENT), or if firmware evaluation fails, it aborts
the unregistration transaction early to protect unreadied arm64
infrastructure.

However, returning early from arch_unregister_cpu() causes a catastrophic
state tearing because the generic ACPI layer (acpi_processor_post_eject())
unconditionally continues its cleanup flow. This leaves the stale sysfs
device leaked in the memory, deadlocking any subsequent hot-add attempts
on the same CPU.

Fix it by simplifying arch_unregister_cpu() to always proceed with
the unregistration, as a pr_err_once() warning is sufficient to make
it more visible for currently not supported physical CPU removal.
Also remove the redundant NULL check on acpi_handle as it cannot be
NULL when calling arch_unregister_cpu().

[1]: https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: James Morse <james.morse@arm.com>
Cc: stable@vger.kernel.org
Fixes: eba4675008a6e ("arm64: arch_register_cpu() variant to check if an ACPI handle is now available.")
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/smp.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..543d3459f6e3 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -535,23 +535,13 @@ void arch_unregister_cpu(int cpu)
 {
 	acpi_handle acpi_handle = acpi_get_processor_handle(cpu);
 	struct cpu *c = &per_cpu(cpu_devices, cpu);
-	acpi_status status;
 	unsigned long long sta;
-
-	if (!acpi_handle) {
-		pr_err_once("Removing a CPU without associated ACPI handle\n");
-		return;
-	}
+	acpi_status status;
 
 	status = acpi_evaluate_integer(acpi_handle, "_STA", NULL, &sta);
-	if (ACPI_FAILURE(status))
-		return;
-
-	/* For now do not allow anything that looks like physical CPU HP */
-	if (cpu_present(cpu) && !(sta & ACPI_STA_DEVICE_PRESENT)) {
+	if (!ACPI_FAILURE(status) &&
+	    cpu_present(cpu) && !(sta & ACPI_STA_DEVICE_PRESENT))
 		pr_err_once("Changing CPU present bit is not supported\n");
-		return;
-	}
 
 	unregister_cpu(c);
 }
-- 
2.34.1


