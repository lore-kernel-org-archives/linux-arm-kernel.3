Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2E2C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 08:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h2cGhuhLE40OVedXzpfrCNv2r3gg+Q9pq5IchGV8kzo=; b=2FVxaR/0aaq3muQVeQzkNGWhqb
	UAk/P9HptxYxJv9SjE3yYqWDcxpoI1Hj8Fl9FtWl93RdTWVgOXHN+lTKGN5MdwrYxj5H5LCo2lA8D
	3qqbpfe6UYjCuD2uhxB1A3PniC33i6s9JJkMQLDYwiNB3o7EZic6iMR71xAcefjstd/k6b+0T6FgE
	2tceUeAWa9kav2taokk1HRmLngr7I9ycuUmJIh7xj9eRQtu24p14KFiyj/29hUG4O5uvRPwT8F72n
	+E4ZwfeSIZ7x+r8sd1TYMW2wdu3LAsugbxsKXH0mIiqBw3/sb3NlJWd/EsbCIoJMo79Xwo3l6QX9t
	gqK9E5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKby-0000000CnrB-293X;
	Fri, 21 Aug 2026 08:28:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKbw-0000000Cnqk-0as6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 08:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787300902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h2cGhuhLE40OVedXzpfrCNv2r3gg+Q9pq5IchGV8kzo=;
	b=A0ugsOqrnsvL2poKGM8mcHyYet1qWD11rALqykn78T375Hb+dXyQ6bhj/TqmdHOQMWM6Cp
	cE0TtFBu6zwWIsVVYrjRChplmCTp/c2wLL6Rm7pE3dzLS+GI8pHGzSmJh+kwM9Kr/bZ61m
	o5JYi2My4uD898PLwiXUBkxSw/vkEC4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-IohSBfaDNnuAMBKdACNN3g-1; Fri,
 21 Aug 2026 04:28:18 -0400
X-MC-Unique: IohSBfaDNnuAMBKdACNN3g-1
X-Mimecast-MFC-AGG-ID: IohSBfaDNnuAMBKdACNN3g_1787300896
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 89B7F195604F;
	Fri, 21 Aug 2026 08:28:16 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.129])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6DDD87D8;
	Fri, 21 Aug 2026 08:28:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: imx: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Fri, 21 Aug 2026 10:28:09 +0200
Message-ID: <20260821082809.185110-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: wxbToEjdCF2tKBivN2_DKEUP40S_z23vvZUD5_SAwjY_1787300896
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_012824_247257_3C7B1504 
X-CRM114-Status: GOOD (  13.17  )
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

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This has been split from an earlier bigger patch of mine into
       a separate patch to ease reviewing

 arch/arm/mach-imx/hardware.h | 2 +-
 arch/arm/mach-imx/mxc.h      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-imx/hardware.h b/arch/arm/mach-imx/hardware.h
index 0760fff39a0b3..71f09648c7778 100644
--- a/arch/arm/mach-imx/hardware.h
+++ b/arch/arm/mach-imx/hardware.h
@@ -7,7 +7,7 @@
 #ifndef __ASM_ARCH_MXC_HARDWARE_H__
 #define __ASM_ARCH_MXC_HARDWARE_H__
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <asm/io.h>
 #include <soc/imx/revision.h>
 #endif
diff --git a/arch/arm/mach-imx/mxc.h b/arch/arm/mach-imx/mxc.h
index fe2d0f5abfcc2..1d13e3959159e 100644
--- a/arch/arm/mach-imx/mxc.h
+++ b/arch/arm/mach-imx/mxc.h
@@ -16,7 +16,7 @@
 
 #define IMX_DDR_TYPE_LPDDR2		1
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #ifdef CONFIG_SOC_IMX6SL
 static inline bool cpu_is_imx6sl(void)
-- 
2.55.0


