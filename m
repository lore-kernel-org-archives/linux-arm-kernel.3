Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CF5C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lh8RRN115hHENZhRVI/HJKnLn1gmr4TNfVUEedSzXSE=; b=NG3e0/How6FDt0C8rxtil22nZl
	tHhgQ/q72NaCBKhQe6FGxkEh7X3LH1cX9t9W8VW299yYNjiZaLnAbN298MwRls9twwrHlSw0SR0n2
	sli/P+/hc4o6cpb4eVddfPHW4qCrQhGMe30YF4BHc392q6NCHqOLlJzTwyaxaOz4d9OhZCvMc2CEl
	DUvcixOYh/dIc2bRlj3+H3O4Vh6HvVMhbLdcEAHS8MTvytsnQ32x/hrLaH7HZpR5RW0ln+VMogxsz
	45EnoCSDqfcUzG94BCX3uLu/XvAO6O1GMrcrBJ7mt1ls8k63KYkdlNaoe37LxMIWwpn+OmON8AZlb
	vgf1zYiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8udr-00000004Sq9-2fnB;
	Tue, 22 Sep 2026 07:10:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8udg-00000004Sjf-35tX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790061002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Lh8RRN115hHENZhRVI/HJKnLn1gmr4TNfVUEedSzXSE=;
	b=beFJvzTkQDtdvShRm4W1pBuYV0esTslJ19uITHPRnGOvaZSQNl8aJLZFEGp1kmsjp+Xto+
	KxA0BzzUmJR4cijVIEiC7HCRl/HgkGuFBQrsEkhad/zwdP6W9BYOKthr2Gun4+SMWKPEv0
	H3Ib8onfll4014A9qpK/BOCeuv5y1gA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-h3zLrZ1PPYetoFlWi0zq1A-1; Tue,
 22 Sep 2026 03:09:56 -0400
X-MC-Unique: h3zLrZ1PPYetoFlWi0zq1A-1
X-Mimecast-MFC-AGG-ID: h3zLrZ1PPYetoFlWi0zq1A_1790060995
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 96E351843AD4;
	Tue, 22 Sep 2026 07:09:54 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 843B91956041;
	Tue, 22 Sep 2026 07:09:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: BCM7XXX: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Tue, 22 Sep 2026 09:09:50 +0200
Message-ID: <20260922070950.76946-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: YVlZ6LtPR_7uCh_L13r34DoP9uy4RXCI9IIF43-VyYg_1790060995
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_001004_856208_0B3A3BF9 
X-CRM114-Status: GOOD (  13.30  )
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

While the GCC and Clang compilers already define __ASSEMBLER__ auto-
matically when compiling assembly code, __ASSEMBLY__ is a macro that
only gets defined by the Makefiles in the kernel. This can be very
confusing when switching between userspace and kernelspace coding, or
when dealing with uapi headers that rather should use __ASSEMBLER__
instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
this confusion.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Added Florian's Reviewed-by and fixup up the CC: list

 arch/arm/include/asm/hardware/cache-b15-rac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/hardware/cache-b15-rac.h b/arch/arm/include/asm/hardware/cache-b15-rac.h
index 3d43ec06fd359..b96365bfb2a87 100644
--- a/arch/arm/include/asm/hardware/cache-b15-rac.h
+++ b/arch/arm/include/asm/hardware/cache-b15-rac.h
@@ -1,7 +1,7 @@
 #ifndef __ASM_ARM_HARDWARE_CACHE_B15_RAC_H
 #define __ASM_ARM_HARDWARE_CACHE_B15_RAC_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 void b15_flush_kern_cache_all(void);
 
-- 
2.55.0


