Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DE9CFA76A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 10:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyxNrZrZ4s0Cafl08yElNbsFTtb9GtmPPWVKnhiFUv0=; b=mYPGKM+GGLy5NI5LusOfEEu2TL
	IgBAVEosOh0eCqiDwHFeu30m6sPOi2Iv6kAXd1qvMc03Us5yALpZROPBPED5JFfXwxb05vE6Rs8pt
	WUA2KdE0gpfqOAyLSACnVs1PUydIeqiKDmctu3948vD1vJNC5kLyVArLl1rhlCOIj0Vg5FgpFX5KM
	RAWIGOa0YW09Q8rucc6NINzzQV0Xq8MX/2PpNaiPMuGXD0gZPTv2O9kldbcJ1vopIjHdOoei9ISQj
	jPgHxlauXGOd5+/JRad6xaT5qfQp3JmS+4+exFSObQjQ3uDkBR28/Ff/VBJ1mkI8TSWNfMtMxj/5l
	k7bfX40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNxE-00000008BZM-0CNS;
	Fri, 21 Nov 2025 10:01:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNxA-00000008BX9-0puu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 10:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763719279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PyxNrZrZ4s0Cafl08yElNbsFTtb9GtmPPWVKnhiFUv0=;
	b=Li7MbexHdAZFKK5hEHqgRdbvRmsyKpVhq+kGVUjyHtBWr8qSSx2fuVD7+d659Fzc+XIagf
	PGtAy/LYrWN5jkWk7PCoWrujYAbKl1kAb7o5/sEh7lPF0iIYg5TJh9M6oDcCcZNvYud/Mw
	51Y/bH2F78qXDJpS2+uWj9e4hijeJoU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-27-k3_x5bMqM3ipcdFdaf01Qg-1; Fri,
 21 Nov 2025 05:01:14 -0500
X-MC-Unique: k3_x5bMqM3ipcdFdaf01Qg-1
X-Mimecast-MFC-AGG-ID: k3_x5bMqM3ipcdFdaf01Qg_1763719273
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1507619560BC;
	Fri, 21 Nov 2025 10:01:13 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.78])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CB4131955F66;
	Fri, 21 Nov 2025 10:01:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	linux-hexagon@vger.kernel.org
Subject: [PATCH v4 4/9] hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
Date: Fri, 21 Nov 2025 11:00:39 +0100
Message-ID: <20251121100044.282684-5-thuth@redhat.com>
In-Reply-To: <20251121100044.282684-1-thuth@redhat.com>
References: <20251121100044.282684-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_020120_315242_F0B9B4E5 
X-CRM114-Status: GOOD (  12.45  )
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

__ASSEMBLY__ is only defined by the Makefile of the kernel, so
this is not really useful for uapi headers (unless the userspace
Makefile defines it, too). Let's switch to __ASSEMBLER__ which
gets set automatically by the compiler when compiling assembly
code.

Cc: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: linux-hexagon@vger.kernel.org
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/hexagon/include/uapi/asm/registers.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/hexagon/include/uapi/asm/registers.h b/arch/hexagon/include/uapi/asm/registers.h
index d51270f3b3582..8f73d41651e87 100644
--- a/arch/hexagon/include/uapi/asm/registers.h
+++ b/arch/hexagon/include/uapi/asm/registers.h
@@ -7,7 +7,7 @@
 #ifndef _ASM_REGISTERS_H
 #define _ASM_REGISTERS_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*  See kernel/entry.S for further documentation.  */
 
@@ -224,6 +224,6 @@ struct pt_regs {
 	(regs)->hvmer.vmest = (HVM_VMEST_UM_MSK << HVM_VMEST_UM_SFT) \
 			    | (HVM_VMEST_IE_MSK << HVM_VMEST_IE_SFT)
 
-#endif  /*  ifndef __ASSEMBLY  */
+#endif  /*  ifndef __ASSEMBLER__  */
 
 #endif
-- 
2.51.1


