Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61E9CF885C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXmsHzOTgobyrq58vAIqi/B9JB4iFP9AaCH0AN/xjgQ=; b=ktuFoRcQtZHQopcJd3FYmM5dOd
	J8L69Vxq6FA2maeZT1icuyiIpsEew9lSn9Hdmcv3X1GOl7FNrwkUvlNuOuKAUpZi7jsFNFuLISkV/
	RzlN2w2YCSJH6kOksouPLFwX1PWYJ8QPXUzEffjfm3AYkrOfCb05oWk9vMxv2aFMySioN0TacdLC6
	OVi7gdonhIw4ep6jdYgAF+oaYBnNd6MLu6O+Ts8XIdY/bIp+c4F9guTACfSWkKvhJuNH8lTYMaZqb
	4qrabLjztsQd3o6bd3XXcT4iz26wfNg5LWq0GhFZVEYpGpQBrAP6ZrK7l8g+YXbP97w0PMjawHq5U
	S3wzF6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5IN-00000006nx7-2BAF;
	Thu, 20 Nov 2025 14:05:59 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5IL-00000006nw4-1vfO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1763647557; x=1795183557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IXmsHzOTgobyrq58vAIqi/B9JB4iFP9AaCH0AN/xjgQ=;
  b=C5/moA3Ui8sDst+uDU7YClGldhQ0RhfC6RMY6fncbnHZwWUE3fzHbRWE
   d5LP3bWXNeQCnfQyfPUrtl52aCAkBxW+pFJk2n2Fle9i8IYYQMSFf0KbF
   bZ8nzyTkuHKY98R4qqlsnlok41ruv24wlf9hKcl4CzMAsJ8ldOMQfXf1p
   t3KB/36bFqa8mvCeO9UW2IYnqJMrOce1d4oQ2c0eorwxeKQSpgq1HyHTT
   1Jg0PALg1B1OHziOeLvY1BH+LqeNZfKYKxSFfNPNXvJ+OqEmhRL7FJsXk
   J1Na3po82y56ZuKEX6lhuTPvGZkPr7vDHALoNcAkxOEPQ+ZbREulbSrRv
   w==;
X-CSE-ConnectionGUID: 4fBRsVRXQdK+hWPxscOfnQ==
X-CSE-MsgGUID: DN8vPk33QZyh87/qyWBELA==
X-IronPort-AV: E=Sophos;i="6.20,213,1758585600"; 
   d="scan'208";a="7250788"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 14:05:51 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:4241]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.22.241:2525] with esmtp (Farcaster)
 id 52c7c98f-0056-413d-b56a-df46b1121cd8; Thu, 20 Nov 2025 14:05:51 +0000 (UTC)
X-Farcaster-Flow-ID: 52c7c98f-0056-413d-b56a-df46b1121cd8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Thu, 20 Nov 2025 14:05:50 +0000
Received: from amazon.com (10.1.213.15) by EX19D001UWA001.ant.amazon.com
 (10.13.138.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29; Thu, 20 Nov 2025
 14:05:48 +0000
From: Maximilian Dittgen <mdittgen@amazon.de>
To: <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <pbonzini@redhat.com>, <shuah@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <kvm@vger.kernel.org>,
	<mdittgen@amazon.de>, <lilitj@amazon.de>, <sauravsc@amazon.de>,
	<nh-open-source@amazon.com>
Subject: [RFC PATCH 10/13] KVM: selftests: fix MAPC RDbase target formatting in vgic_lpi_stress
Date: Thu, 20 Nov 2025 15:02:59 +0100
Message-ID: <20251120140305.63515-11-mdittgen@amazon.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251120140305.63515-1-mdittgen@amazon.de>
References: <20251120140305.63515-1-mdittgen@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [10.1.213.15]
X-ClientProxiedBy: EX19D032UWA004.ant.amazon.com (10.13.139.56) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_060557_546314_E30AB8B2 
X-CRM114-Status: GOOD (  11.95  )
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

Since GITS_TYPER.PTA == 0, the ITS MAPC command demands a CPU ID,
rather than a physical redistributor address, for its RDbase
command argument.

As such, when MAPC-ing guest ITS collections, vgic_lpi_stress iterates
over CPU IDs in the range [0, nr_cpus), passing them as the RDbase
vcpu_id argument to its_send_mapc_cmd().

However, its_encode_target() in the its_send_mapc_cmd() selftest
handler expects RDbase arguments to have a 16 bit offset, as shown
by the 16-bit target_addr right shift its implementation:

        its_mask_encode(&cmd->raw_cmd[2], target_addr >> 16, 51, 16)

At the moment, all CPU IDs passed into its_send_mapc_cmd() have no
offset, therefore becoming 0x0 after the bit shift. Thus, when
vgic_its_cmd_handle_mapc() receives the ITS command in vgic-its.c,
it always interprets the RDbase target CPU as CPU 0. All interrupts
sent to collections will be processed by vCPU 0, which defeats the
purpose of this multi-vCPU test.

Fix by creating procnum_to_rdbase() helper function, which left-shifts
the vCPU parameter received by its_send_mapc_cmd 16 bits before passing
it to its_encode_target for encoding.

Signed-off-by: Maximilian Dittgen <mdittgen@amazon.de>
---
This patch has already been merged as a fix in Linux 6.18-rc6 as a24f7af.
---
 tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c b/tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c
index aec1b69a4de3..7f9fdcf42ae6 100644
--- a/tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c
+++ b/tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c
@@ -15,6 +15,8 @@
 #include "gic_v3.h"
 #include "processor.h"
 
+#define GITS_COLLECTION_TARGET_SHIFT 16
+
 static u64 its_read_u64(unsigned long offset)
 {
 	return readq_relaxed(GITS_BASE_GVA + offset);
@@ -163,6 +165,11 @@ static void its_encode_collection(struct its_cmd_block *cmd, u16 col)
 	its_mask_encode(&cmd->raw_cmd[2], col, 15, 0);
 }
 
+static u64 procnum_to_rdbase(u32 vcpu_id)
+{
+	return vcpu_id << GITS_COLLECTION_TARGET_SHIFT;
+}
+
 #define GITS_CMDQ_POLL_ITERATIONS	0
 
 static void its_send_cmd(void *cmdq_base, struct its_cmd_block *cmd)
@@ -217,7 +224,7 @@ void its_send_mapc_cmd(void *cmdq_base, u32 vcpu_id, u32 collection_id, bool val
 
 	its_encode_cmd(&cmd, GITS_CMD_MAPC);
 	its_encode_collection(&cmd, collection_id);
-	its_encode_target(&cmd, vcpu_id);
+	its_encode_target(&cmd, procnum_to_rdbase(vcpu_id));
 	its_encode_valid(&cmd, valid);
 
 	its_send_cmd(cmdq_base, &cmd);
-- 
2.50.1 (Apple Git-155)




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Christof Hellmis
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


