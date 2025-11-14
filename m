Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66926CE7B13
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tuugdbs4qPrYJbDgPmXQJ06XmUfS38Y/AWsXOl8uN2E=; b=NwtL6W+z/iXWBIjIBl+0krkDNu
	MNxDRN0CA5iTRSVmOhjCMk6uT9casX1YQIFFCR2Zvht4uJjYqsTATfp30I3oyfZ6rYTGterJQAf9o
	RpB1XKamPcL6QZtgxWTPgIbVx3O583JGJB17Y0u2gvrOFba8zyO8CoOFQXiC0xCZbB0U73MkDYQLH
	nDf6duqhCGHE1oZx3/RDnH0Aw9Jns7WkNh5xr565xybyPEnTrvmzBZ2RdxBQmHhbbFo0gf8t/tVZE
	ojfuTf7c3pgtgMtYXfpwo5OkyeF4rCjtSnSi/A1nxR5saz/n01Nt5FkIW3teMfc1FoSri1M8mqnab
	GLPFI1mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuxM-0000000COYT-47GB;
	Fri, 14 Nov 2025 14:39:20 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuxK-0000000COY3-0tRI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1763131158; x=1794667158;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tuugdbs4qPrYJbDgPmXQJ06XmUfS38Y/AWsXOl8uN2E=;
  b=bVy/zdWU9f+Pd52NOpLNK90M56yW6V3eRHYXUjq2FuVy1Pkrj2q+OnWR
   SJZvO3rvj3S/+ub8jzGU8U9SSYX2tn99vcBjh/EBDhTnIrASefl9ba02Z
   l0Y5ZiRFjCmU9acZ34IcAR7/PYloqwz9+TD8M0E8DdhXPkDJB7z/jvNTI
   JJ6cFZIvklGH8doukweVAoD0NzrTdPNsRiTiN4NkFaJJKyMkS9fGIfF4f
   1joQYfGXqTRcIITPKbnBiGPxH1Aa5rDE0DbwV/ZcWHs4KMqmgesp30027
   jK4qprO96pP6Mi8UyBOV2i2xZr/SnPQY9oKx4qyBz+/a3CGcxucZVklZj
   A==;
X-CSE-ConnectionGUID: o5a+tyeIR5G2RJUtFkkssQ==
X-CSE-MsgGUID: YR9i1iJSQ9qI4StgXjCJZw==
X-IronPort-AV: E=Sophos;i="6.19,305,1754956800"; 
   d="scan'208";a="7112465"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 14:39:12 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:4363]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.62.84:2525] with esmtp (Farcaster)
 id f4ae6c68-9432-4b5a-b747-c7b52eb56619; Fri, 14 Nov 2025 14:39:12 +0000 (UTC)
X-Farcaster-Flow-ID: f4ae6c68-9432-4b5a-b747-c7b52eb56619
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Fri, 14 Nov 2025 14:39:12 +0000
Received: from amazon.com (10.1.212.32) by EX19D001UWA001.ant.amazon.com
 (10.13.138.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29; Fri, 14 Nov 2025
 14:39:09 +0000
From: Maximilian Dittgen <mdittgen@amazon.de>
To: <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <pbonzini@redhat.com>, <shuah@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <kvm@vger.kernel.org>,
	<mdittgen@amazon.de>, <lilitj@amazon.de>, <nh-open-source@amazon.com>
Subject: [PATCH] KVM: selftests: Add SYNC after guest ITS setup in vgic_lpi_stress
Date: Fri, 14 Nov 2025 15:39:02 +0100
Message-ID: <20251114143902.30435-1-mdittgen@amazon.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Originating-IP: [10.1.212.32]
X-ClientProxiedBy: EX19D041UWA002.ant.amazon.com (10.13.139.121) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_063918_309948_935D1BFC 
X-CRM114-Status: GOOD (  13.73  )
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

vgic_lpi_stress sends MAPTI and MAPC commands during guest GIC
setup to map interrupt events to ITT entries and collection IDs
to redistributors, respectively.

Theoretically, we have no guarantee that the ITS will
finish handling these mapping commands before the selftest
calls KVM_SIGNAL_MSI to inject LPIs to the guest. If LPIs
are injected before ITS mapping completes, the ITS cannot
properly pass the interrupt on to the redistributor.

In practice, KVM processes ITS commands synchronously, so
SYNC calls are functionally unnecessary and ignored in
vgic_its_handle_command().

However, selftests should test based on ARM specification and
be blind to KVM-specific implementation optimizations. Thus,
we must update the test to be architecturally compliant and
logically correct.

Fix by adding a SYNC command to the selftests ITS library,
then calling SYNC after ITS mapping to ensure mapping
completes before signal_lpi() writes to GITS_TRANSLATER.

This patch depends on commit a24f7afce048 ("KVM: selftests:
fix MAPC RDbase target formatting in vgic_lpi_stress"), which
is queued in kvmarm/fixes.

Signed-off-by: Maximilian Dittgen <mdittgen@amazon.de>
---
Validated by the following debug logging to the GITS_CMD_SYNC handler
in vgic_its_handle_command():

        kvm_info("ITS SYNC command: %016llx %016llx %016llx %016llx\n",
            its_cmd[0], its_cmd[1], its_cmd[2], its_cmd[3]);

Initialized a selftest guest with 4 vCPUs by:

        ./vgic_lpi_stress -v 4

Confirmed that an ITS SYNC was successfully called for all 4 vCPUs:

        kvm [5094]: ITS SYNC command: 0000000000000005 0000000000000000 0000000000000000 0000000000000000
        kvm [5094]: ITS SYNC command: 0000000000000005 0000000000000000 0000000000010000 0000000000000000
        kvm [5094]: ITS SYNC command: 0000000000000005 0000000000000000 0000000000020000 0000000000000000
        kvm [5094]: ITS SYNC command: 0000000000000005 0000000000000000 0000000000030000 0000000000000000
---
 tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c   |  4 ++++
 .../testing/selftests/kvm/include/arm64/gic_v3_its.h  |  1 +
 tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c    | 11 +++++++++++
 3 files changed, 16 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index 687d04463983..e857a605f577 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -118,6 +118,10 @@ static void guest_setup_gic(void)
 
 	guest_setup_its_mappings();
 	guest_invalidate_all_rdists();
+
+	/* SYNC to ensure ITS setup is complete */
+	for (cpuid = 0; cpuid < test_data.nr_cpus; cpuid++)
+		its_send_sync_cmd(test_data.cmdq_base_va, cpuid);
 }
 
 static void guest_code(size_t nr_lpis)
diff --git a/tools/testing/selftests/kvm/include/arm64/gic_v3_its.h b/tools/testing/selftests/kvm/include/arm64/gic_v3_its.h
index 3722ed9c8f96..58feef3eb386 100644
--- a/tools/testing/selftests/kvm/include/arm64/gic_v3_its.h
+++ b/tools/testing/selftests/kvm/include/arm64/gic_v3_its.h
@@ -15,5 +15,6 @@ void its_send_mapc_cmd(void *cmdq_base, u32 vcpu_id, u32 collection_id, bool val
 void its_send_mapti_cmd(void *cmdq_base, u32 device_id, u32 event_id,
 			u32 collection_id, u32 intid);
 void its_send_invall_cmd(void *cmdq_base, u32 collection_id);
+void its_send_sync_cmd(void *cmdq_base, u32 vcpu_id);
 
 #endif // __SELFTESTS_GIC_V3_ITS_H__
diff --git a/tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c b/tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c
index 0e2f8ed90f30..d9ee331074ea 100644
--- a/tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c
+++ b/tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c
@@ -253,3 +253,14 @@ void its_send_invall_cmd(void *cmdq_base, u32 collection_id)
 
 	its_send_cmd(cmdq_base, &cmd);
 }
+
+void its_send_sync_cmd(void *cmdq_base, u32 vcpu_id)
+{
+	struct its_cmd_block cmd = {};
+
+	its_encode_cmd(&cmd, GITS_CMD_SYNC);
+	its_encode_target(&cmd, procnum_to_rdbase(vcpu_id));
+
+	its_send_cmd(cmdq_base, &cmd);
+}
+
-- 
2.50.1 (Apple Git-155)




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Christof Hellmis
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


