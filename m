Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05918CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FDh4HHbjHZ2n8XaRDG5EEV15xMZvHpl5z1eZvSUxfbw=; b=VimXFEj4iuOR+ErjRwXAiSVilj
	o3XI96fNcVCOZV/rgn8GiZ8YJU2iX0kDH5RXRY/spshEd1iclXIofpme6nvBMvbYtFAxDjw1vT9iw
	ftqhVGXm1V2DN8GtMXPc508NVgn8QIWpVvwP+D3f3GbFwqvft54+8fTFg/U3+TttRqcyOF9EqqF8Y
	waCS8kUwnPYW4zeSgPCYRD6QRE5H6Oslc79oZlcPxMpD+nbefD4ODdfYKO6fUfU1zjvY42vUOzqRd
	1e74iQRgoXesUBceuzUYaTTTK1/4uuWBfxt2jTMTIMNBaIfvBT5JQi5ECetls2ny2xWLI2qfFSROe
	3UpFB2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYo1-00000002R8Y-2i8o;
	Fri, 19 Jun 2026 12:58:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYnu-00000002R6S-0gpe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 12:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781873916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FDh4HHbjHZ2n8XaRDG5EEV15xMZvHpl5z1eZvSUxfbw=;
	b=i8zh7fP1VQYCgAmaGsnwV6R/gqQQxZ7Un/Vr6BLtOXzTUUCNHZzVh+SflIsjgQo3rmJBng
	qKWiWT+R2swYGhKBP2HzkZIM9vw+bGWNXzDQK7/eKZ0pQ+S2rUtivuV77QlpVlDnv9gj/z
	qHfwY3rnRYhno2jbKD19RQsgTiS/ZkY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-662-uZUIwzWTMDqEiQWQ4I7aBg-1; Fri,
 19 Jun 2026 08:58:34 -0400
X-MC-Unique: uZUIwzWTMDqEiQWQ4I7aBg-1
X-Mimecast-MFC-AGG-ID: uZUIwzWTMDqEiQWQ4I7aBg_1781873913
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A26D195DBA4;
	Fri, 19 Jun 2026 12:58:32 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DBFED18005B6;
	Fri, 19 Jun 2026 12:58:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] ARM: s3c: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files
Date: Fri, 19 Jun 2026 14:58:27 +0200
Message-ID: <20260619125827.215977-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: zF4nyl6H3MFNFwtjfXC_H8Z_J_mD46fxsgiRbd7wRkI_1781873913
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_055838_282137_DFDCFA26 
X-CRM114-Status: GOOD (  15.99  )
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
 Note: This patch has been split from an earlier patch of mine
 to ease reviewing.

 arch/arm/mach-s3c/map-base.h | 2 +-
 include/linux/serial_s3c.h   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c/map-base.h b/arch/arm/mach-s3c/map-base.h
index 463a995b399bc..beb58e6f12e16 100644
--- a/arch/arm/mach-s3c/map-base.h
+++ b/arch/arm/mach-s3c/map-base.h
@@ -20,7 +20,7 @@
 
 #define S3C_ADDR_BASE	0xF6000000
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #define S3C_ADDR(x)	((void __iomem __force *)S3C_ADDR_BASE + (x))
 #else
 #define S3C_ADDR(x)	(S3C_ADDR_BASE + (x))
diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
index 102aa33d956c4..f54cb6e23f85e 100644
--- a/include/linux/serial_s3c.h
+++ b/include/linux/serial_s3c.h
@@ -269,7 +269,7 @@
 #define APPLE_S5L_UTRSTAT_RXTO		BIT(9)
 #define APPLE_S5L_UTRSTAT_ALL_FLAGS	GENMASK(9, 3)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/serial_core.h>
 
@@ -294,7 +294,7 @@ struct s3c2410_uartcfg {
 	unsigned long	   ufcon;	 /* value of ufcon for port */
 };
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ASM_ARM_REGS_SERIAL_H */
 
-- 
2.54.0


