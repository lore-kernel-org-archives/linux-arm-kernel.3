Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1284CF34B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lzpnv0u1m2nCELjHbHbtPbxJSZ+ELcyCY03eyueq0jc=; b=BjFKeWURZ95Ep/yPKOSIpPEjti
	/cFHHkpdHsOHqkZCp260mpNQ/RBuQ4pcYbFFHLzhmE9cdVkH2M7NSqY3J7oYuPllV1lsvsxbnX31T
	gfZWFV8oosmI+zOjTGs/7mCaz0EuyM/T1baDBCQdqn7xGR8i5LSreF+cH+FGrrQqv0/G1ZX3gYG5u
	inJVWa+n1ten41qsVIyii6I4udesKKHVnrhqbI33Os/SWh3jFTjlC1moWBbL5tzasD3esjFOg++L9
	vfwKzM1bVNzpRY/WeFMiTmDDcovhj/5jtCnvoHTeSrpKg9JC9hQ3tjBb/z1z+UPENstkx42fZ/Q5D
	Hb83CQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLihE-00000003KQv-0WV0;
	Wed, 19 Nov 2025 13:58:08 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLihA-00000003KPl-23p8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1763560684; x=1795096684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lzpnv0u1m2nCELjHbHbtPbxJSZ+ELcyCY03eyueq0jc=;
  b=SncTh+ynHcK5jmctkThmG3DdXMF40pQfgnHs6etL33j3WlOwejAboEM9
   KlXNmbS8581FM30rEy52NhEMAiM3dliEokYRtJW/Ly5D3bIdSMcQ2Voan
   LeyubcqWQRGcfSrQFNmfwK7EKXF+fqhj/mzKfhlRevXcaAhziHA8ktdVH
   EK69weKczN9xnq3C1RW+sZeYwwMplA/HiB40XrEsTaozTOZbviFrogg/m
   bJJLcUwDyVYI/PwhD+KDuSKr86S0THkIA/WoxKnVymzLBKT0RFe0PR3kM
   312nNvzXj5653ei+7V/72JwhpavLdMz2Uo4prbadvc9iwEgVZVJ80I5OY
   A==;
X-CSE-ConnectionGUID: H7eTEbVIRnaLQvIxNFiMiQ==
X-CSE-MsgGUID: fvcmET55SiKDpntLhtopdQ==
X-IronPort-AV: E=Sophos;i="6.19,315,1754956800"; 
   d="scan'208";a="7361146"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 13:57:57 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:21699]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.46.156:2525] with esmtp (Farcaster)
 id 70adb8ed-f7ea-4134-8909-59c27b0a6c34; Wed, 19 Nov 2025 13:57:57 +0000 (UTC)
X-Farcaster-Flow-ID: 70adb8ed-f7ea-4134-8909-59c27b0a6c34
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Wed, 19 Nov 2025 13:57:57 +0000
Received: from amazon.com (10.1.212.27) by EX19D001UWA001.ant.amazon.com
 (10.13.138.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29; Wed, 19 Nov 2025
 13:57:54 +0000
From: Maximilian Dittgen <mdittgen@amazon.de>
To: <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <pbonzini@redhat.com>, <shuah@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <kvm@vger.kernel.org>,
	<mdittgen@amazon.de>, <lilitj@amazon.de>, <nh-open-source@amazon.com>
Subject: [PATCH v2 2/2] KVM: selftests: SYNC after guest ITS setup in vgic_lpi_stress
Date: Wed, 19 Nov 2025 14:57:44 +0100
Message-ID: <20251119135744.68552-2-mdittgen@amazon.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251119135744.68552-1-mdittgen@amazon.de>
References: <20251114143902.30435-1-mdittgen@amazon.de>
 <20251119135744.68552-1-mdittgen@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [10.1.212.27]
X-ClientProxiedBy: EX19D043UWA001.ant.amazon.com (10.13.139.45) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_055804_653419_9D352F6B 
X-CRM114-Status: GOOD (  12.82  )
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

vgic_lpi_stress sends MAPTI and MAPC commands during guest GIC setup to
map interrupt events to ITT entries and collection IDs to
redistributors, respectively.

We have no guarantee that the ITS will finish handling these mapping
commands before the selftest calls KVM_SIGNAL_MSI to inject LPIs to the
guest. If LPIs are injected before ITS mapping completes, the ITS cannot
properly pass the interrupt on to the redistributor.

Fix by adding a SYNC command to the selftests ITS library, then calling
SYNC after ITS mapping to ensure mapping completes before signal_lpi()
writes to GITS_TRANSLATER.

Signed-off-by: Maximilian Dittgen <mdittgen@amazon.de>
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


