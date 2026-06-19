Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298F4CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+rOB7Eiz0TZhGqA7xx5E72SsurOzDSCiMo/FEh87h1A=; b=JVbQmdVe5QQOZKW+DXZswzQAj9
	HjxWbqASHL/SX9G5x/DqPvkg4mUuQcdLAput2F0bxIqEfNexlraM7hN87mOxCYMyMlHPS1g9F2Wup
	YjUbqUFlo9x6QnNau1jlSlXry6fbZFdG7ipXsUtXxgXRgt9IqLqLGK4zPbHazeSRQCtpRLtqAoWH9
	1Po+ZMXpQe4vs7ZVRDouWSGtYOjjhiyY9CKO/xsphlZdk7jSf/1it69eJPqp/FDXsyoFl+pQoJCM6
	+VszTHE3U/7zAPm9C8OzbcQVTflHZQsBvmroxyKcnr76f/FFU5qj2qzj1qC3rWv5HHT1MEPbeKw5+
	QOzNizjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYHN-00000002NqH-1n1P;
	Fri, 19 Jun 2026 12:25:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYHK-00000002Noy-2mYw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 12:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781871897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+rOB7Eiz0TZhGqA7xx5E72SsurOzDSCiMo/FEh87h1A=;
	b=RcfKsqK0OcIqjuMG3nMwlx4/dJ+xQTsGMGOCUHPv3EFfRx96VtMawsu4/Q7nvU11cXv/4B
	6/0MDViHSAU2YmYCb6NFgjIL5YTVHW9RoBL+NJhF9NWJzFaWyZw42yT4Wg5SSm/Ui5mmac
	scakXLDWAo5MLQ+63kM6A4hxkxcle5U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-194-pzui6LjpPumhTVYE_8K11Q-1; Fri,
 19 Jun 2026 08:24:56 -0400
X-MC-Unique: pzui6LjpPumhTVYE_8K11Q-1
X-Mimecast-MFC-AGG-ID: pzui6LjpPumhTVYE_8K11Q_1781871895
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 944691933E39;
	Fri, 19 Jun 2026 12:24:54 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 240931624;
	Fri, 19 Jun 2026 12:24:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: imx: Replace __ASSEMBLY__ with __ASSEMBLER__ in header file
Date: Fri, 19 Jun 2026 14:24:48 +0200
Message-ID: <20260619122448.188046-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: KWtaN3_63OENFDk0g8qmAqplNnNggDjoqJ8CQe9ZQ5Q_1781871895
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_052458_779271_F1B00416 
X-CRM114-Status: GOOD (  12.70  )
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

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

This is a completely mechanical patch (done with a simple "sed -i"
statement).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This patch has been split from an earlier bigger patch of
 mine to ease reviewing.

 include/soc/imx/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/soc/imx/cpu.h b/include/soc/imx/cpu.h
index 0bf610acafd06..8c53150acd76e 100644
--- a/include/soc/imx/cpu.h
+++ b/include/soc/imx/cpu.h
@@ -30,7 +30,7 @@
 #define MXC_CPU_VF600		0x600
 #define MXC_CPU_VF610		(MXC_CPU_VF600 | MXC_CPU_VFx10)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 extern unsigned int __mxc_cpu_type;
 #endif
 
-- 
2.54.0


