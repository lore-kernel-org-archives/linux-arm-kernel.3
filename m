Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE7FC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 09:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L6jxLqbH5aL7S/cyb6QujO2iII/2MSR1tRtC68sK9Tc=; b=NudEXPk2LFjaqD+vPpjgUKsEA+
	VfpEaeN/Lo3GgkIXXvAdod9qdpwDpOtLoFnNjsAznQR5w3gWUsHW6kAn+1YwMvYbVnv8ZhInhcq4T
	H5SLERw6flRjWuJVtQiAmA7xipUEBZk4NndQI1c9Ca4+u5imOMfCmqeTBMT3r5lupeOVtgP8QJZoB
	aaJRN8KnsoyUuNjTEeBfWMrO2LtN6G7czcxsXhiEsjB6jwvDPCm5Z1e1VOfoAV6KIcyv2BN0CQI78
	tdjGNTtG+5lIX0naQt3wQ8vlcG4n5isNi5zYHlKRV/5S8Sv0PVpJr3fMJhVueI1GRIEhLRV6CQwkx
	pnzbK8kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5cX-0000000E9IX-2ITo;
	Fri, 27 Jun 2025 09:43:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5aE-0000000E961-0l3f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 09:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751017280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L6jxLqbH5aL7S/cyb6QujO2iII/2MSR1tRtC68sK9Tc=;
	b=SVv3jZR72MlQFvkb6X4pflgt7OokdZqMhxwC41i5MYHxIOT/kZJA0DdYZXXa/4pKz51fmq
	IOdbZjEKjc53ntlH3+ayS43LuO6ZMnOUcPLgrQLnb5i5hRtkwrzf3bAkeNMhVA/qB5cOuu
	8E+fgDHz8sTonPHSX77w87AAap+CfQw=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-208-CFZx656jPpyzHa0zMhDWhw-1; Fri,
 27 Jun 2025 05:41:16 -0400
X-MC-Unique: CFZx656jPpyzHa0zMhDWhw-1
X-Mimecast-MFC-AGG-ID: CFZx656jPpyzHa0zMhDWhw_1751017274
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D022E1955ECC;
	Fri, 27 Jun 2025 09:41:13 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.224.209])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CD40C19560A7;
	Fri, 27 Jun 2025 09:41:07 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
Date: Fri, 27 Jun 2025 11:40:01 +0200
Message-ID: <20250627094102.770689-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JBs6yAcGC01a-5INavjMMnCIpY3MTqc4r62pBtgoyRw_1751017274
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_024122_291008_906CBD64 
X-CRM114-Status: GOOD (  13.18  )
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

On 32bits ARM, u64 divided by a constant is not optimized to a
multiply by inverse by the compiler [1].
So do the multiply by inverse explicitly for this architecture.

Link: https://github.com/llvm/llvm-project/issues/37280 [1]
Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com/
Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 divide")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic_qr.rs | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index dd55b1cb764d..82acecd505d3 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -381,6 +381,24 @@ struct DecFifo {
     len: usize,
 }
 
+/// On arm32 architecture, dividing an u64 by a constant will generate a call
+/// to __aeabi_uldivmod which is not present in the kernel.
+/// So use the multiply by inverse method for this architecture.
+#[cfg(target_arch = "arm")]
+fn div10(val: u64) -> u64
+{
+    let val_h = val >> 32;
+    let val_l = val & 0xFFFFFFFF;
+    let b_h: u64 = 0x66666666;
+    let b_l: u64 = 0x66666667;
+
+    let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
+    let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
+    let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
+
+    tmp3 >> 2
+}
+
 impl DecFifo {
     fn push(&mut self, data: u64, len: usize) {
         let mut chunk = data;
@@ -389,7 +407,11 @@ fn push(&mut self, data: u64, len: usize) {
         }
         for i in 0..len {
             self.decimals[i] = (chunk % 10) as u8;
-            chunk /= 10;
+            if cfg!(target_arch = "arm") {
+                chunk = div10(chunk);
+            } else {
+                chunk /= 10;
+            }
         }
         self.len += len;
     }

base-commit: 3529cb5ab16b4f1f8bbc31dc39a1076a94bd1e38
-- 
2.49.0


