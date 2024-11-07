Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6279D5D687
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 20:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmJXawpBcFqg6fhvb715pUfMafSqsiwvL4tmSZFqy2A=; b=UTc01ZWMXITprwQzOb8uFDHFsA
	cLwulNDWsfVUEIrADJzYbFUp4vbGc/OJnoBR4HK37wOCELkSQg40AGzTpLQ9e0dFxt3Ln2pGpHh5L
	Ct6FQQSzHoUqXfjLNUpAQzEqfW+aVzViPX13tN/UMjbpiVo53NUAdy+D2JDlFbn1ZT8wsuRalAG0C
	MyN5qxNd50efZuO7GL4CoNmjiCDWn+hNdy9YYT2iUFVfYNwRsr+Hv7FW0wP4pBfsyTMRlAa1EVerT
	DoAeoRg5KvhFEMAppZGIbtrHsoYIuVjSODNhA2ayI0qc0wd6hJamggGrE4IpMChtYXV3zigzy4VPO
	XaZgYeRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98gV-00000008C2N-2coV;
	Thu, 07 Nov 2024 20:00:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98UO-000000088ez-1OQB;
	Thu, 07 Nov 2024 19:48:21 +0000
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:c173:4b:4a04:3a21])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87AF899F;
	Thu,  7 Nov 2024 20:48:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731008890;
	bh=u3Nlc3VrK6eIFZ/S5a9xrWzVB09MmxR0BHD8rNbHZ9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Plgr2cOEIf3tTqxCgt5dXMIK+DMiSd+f4ueONz75ODGLhPZbcybzbHcYDu9+zAGYW
	 DFFYlu5piJdtUoaivonivYdwdodXVR1U+0YcIM3izORQcl9n7eEO+digqYgj52AoUx
	 QVPSyDDH8JSjT9hnTlgQRGmSKMB0pxCeAWlpfeU0=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 2/3] staging: vchiq_core: Rectify header include for vchiq_dump_state()
Date: Fri,  8 Nov 2024 01:18:05 +0530
Message-ID: <20241107194806.90408-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107194806.90408-1-umang.jain@ideasonboard.com>
References: <20241107194806.90408-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_114820_529586_235B209E 
X-CRM114-Status: GOOD (  10.94  )
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

The header vchiq_core.h does not need <linux/debugfs.h>. It needs
the <linux/seq_file.h> for vchiq_dump_state() to dump the vchiq
state through vchiq_debugfs.[ch].

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index fadca7b1b196..9b4e766990a4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -7,11 +7,11 @@
 #include <linux/mutex.h>
 #include <linux/completion.h>
 #include <linux/dma-mapping.h>
-#include <linux/debugfs.h>
 #include <linux/dev_printk.h>
 #include <linux/kthread.h>
 #include <linux/kref.h>
 #include <linux/rcupdate.h>
+#include <linux/seq_file.h>
 #include <linux/spinlock_types.h>
 #include <linux/wait.h>
 
-- 
2.45.2


