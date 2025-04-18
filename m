Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AF3C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 18:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Jc22vPjDGeO+zr+AJ2vzRyryOfSK27EryZ/lo0anPI=; b=pi/e3A7R9BOAmH5hH+7TEDHDkI
	u7/UwDPbHfqAhzmOQ45ZkPf3reQFav4rl0CPlVQoJxgRSxvb1rM3bzAzLWE0PRqVbTylD3t29uoBr
	b7a8jrW8l5QDcTMhjA+qZeAKGNGGWcw/DnIGrUMAiBRKsB6WTNRIElxqYaCY4pv0zTdGFVT29K0iJ
	OcjtJ39LY8Oz45XZQ/ZFlPXBU7KDv5onb9v3XpV3sT+EV3mBTC83V7QWpXMvgSBfPbCkr36R80FTn
	h7pRNhQquPKg6aBiIWPtqFpJYMq2lk4s32eFRV/kNJDlZq7Bxci3djG61nLG4naNtemPXGNQxhtBb
	QvBs8luA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qDg-0000000HQ9s-1q3E;
	Fri, 18 Apr 2025 18:13:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ovw-0000000H5V6-1AQz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 16:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744995076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9Jc22vPjDGeO+zr+AJ2vzRyryOfSK27EryZ/lo0anPI=;
	b=Wh5NbyQr+/tK8y/3U/SYE3KJ5D0/cwhORguWg/0NbfVGA+VJ47KK/lOy1ibcxd2e0c5TIE
	sixkEy6F8TL7oMbjcL84UY892PmgdOTyPfC273ugXp5b3gQZ5xDiaIbYqvLmSk3yh7PlAR
	5+sn14IeYNfFrFbnDoN8YIW1TLyJNZ0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-J4wB9MzXMvi_sdC6eLbTQw-1; Fri,
 18 Apr 2025 12:51:12 -0400
X-MC-Unique: J4wB9MzXMvi_sdC6eLbTQw-1
X-Mimecast-MFC-AGG-ID: J4wB9MzXMvi_sdC6eLbTQw_1744995070
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE98B1800370;
	Fri, 18 Apr 2025 16:51:09 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.226.83])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AA7701800D9E;
	Fri, 18 Apr 2025 16:51:03 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Miguel Ojeda <ojeda@kernel.org>,
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
Subject: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
Date: Fri, 18 Apr 2025 18:48:16 +0200
Message-ID: <20250418165059.560503-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NkCRxYnpvnyIyhIBz-CMWsG39bIBoxf-CaANgpCY4Rk_1744995070
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_095120_389789_C334D9D7 
X-CRM114-Status: GOOD (  14.96  )
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

On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
to use a simple fifo with decimal digits as u8 instead.
This is slower but should compile on all architecture.

Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 6025a705530e..dd55b1cb764d 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
         SegmentIterator {
             segment: self,
             offset: 0,
-            carry: 0,
-            carry_len: 0,
+            decfifo: Default::default(),
+        }
+    }
+}
+
+/// Max fifo size is 17 (max push) + 2 (max remaining)
+const MAX_FIFO_SIZE: usize = 19;
+
+/// A simple Decimal digit FIFO
+#[derive(Default)]
+struct DecFifo {
+    decimals: [u8; MAX_FIFO_SIZE],
+    len: usize,
+}
+
+impl DecFifo {
+    fn push(&mut self, data: u64, len: usize) {
+        let mut chunk = data;
+        for i in (0..self.len).rev() {
+            self.decimals[i + len] = self.decimals[i];
+        }
+        for i in 0..len {
+            self.decimals[i] = (chunk % 10) as u8;
+            chunk /= 10;
+        }
+        self.len += len;
+    }
+
+    /// Pop 3 decimal digits from the FIFO
+    fn pop3(&mut self) -> Option<(u16, usize)> {
+        if self.len == 0 {
+            None
+        } else {
+            let poplen = 3.min(self.len);
+            self.len -= poplen;
+            let mut out = 0;
+            let mut exp = 1;
+            for i in 0..poplen {
+                out += self.decimals[self.len + i] as u16 * exp;
+                exp *= 10;
+            }
+            Some((out, NUM_CHARS_BITS[poplen]))
         }
     }
 }
@@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
 struct SegmentIterator<'a> {
     segment: &'a Segment<'a>,
     offset: usize,
-    carry: u64,
-    carry_len: usize,
+    decfifo: DecFifo,
 }
 
 impl Iterator for SegmentIterator<'_> {
@@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
                 }
             }
             Segment::Numeric(data) => {
-                if self.carry_len < 3 && self.offset < data.len() {
-                    // If there are less than 3 decimal digits in the carry,
-                    // take the next 7 bytes of input, and add them to the carry.
+                if self.decfifo.len < 3 && self.offset < data.len() {
+                    // If there are less than 3 decimal digits in the fifo,
+                    // take the next 7 bytes of input, and push them to the fifo.
                     let mut buf = [0u8; 8];
                     let len = 7.min(data.len() - self.offset);
                     buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
                     let chunk = u64::from_le_bytes(buf);
-                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
-                    self.carry = chunk + self.carry * pow;
+                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
                     self.offset += len;
-                    self.carry_len += BYTES_TO_DIGITS[len];
-                }
-                match self.carry_len {
-                    0 => None,
-                    len => {
-                        // take the next 3 decimal digits of the carry
-                        // and return 10bits of numeric data.
-                        let out_len = 3.min(len);
-                        self.carry_len -= out_len;
-                        let pow = u64::pow(10, self.carry_len as u32);
-                        let out = (self.carry / pow) as u16;
-                        self.carry %= pow;
-                        Some((out, NUM_CHARS_BITS[out_len]))
-                    }
                 }
+                self.decfifo.pop3()
             }
         }
     }

base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18
-- 
2.49.0


