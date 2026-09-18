Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEA4C982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ha8wUO0vAad7WPPmqJPILgb1Ew3Bf7lbxU7bR2Z218I=; b=tAV917yTPFlJhu2GqS2qvA1ML+
	EikjVe097eii+8r0ktfBbWUhylNlfwyc+m3G90xzaTO2D5OYJAqkZnqQyLRqECQvQ8YyATTlIIAXh
	+9Sb64kTh6Yhq0MH07hiOYsFlH2l1QeugHGqmN1IK7aK+vo0QiH6xJF/QUdxL8uXT4j+IVZ8NrjRM
	MrQZfApbbUN1H+3lmAqaJ60JtzTAYpYv+BPJQjKYcUDOEFYIYfZ6iCSVDvlLmZyBx+lsWuweOKSIx
	TQwpkjAgSeHKx1jb9XRZrXeo2U/gT2H8o0U2jbOUfVM+2iz0hJch+tHJ9oBsgOCXNwLiyLoH7wPB2
	QOOUW1Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XOm-0000000EKbx-2jMC;
	Fri, 18 Sep 2026 12:09:00 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XOl-0000000EKbI-0mQl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 12:09:00 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so439441a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789733338; x=1790338138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ha8wUO0vAad7WPPmqJPILgb1Ew3Bf7lbxU7bR2Z218I=;
        b=iQ7Zp/buSxPoM1NOdgWucDjjrnUV/55+J6ToCd96Gsi5tvn2AfVC0GuPXWLup7PBWo
         v5WdLxIa+WBxmMF1DEb2XmaQ5wYo4Lbcr7LncW9916sH7Q59KS+VUxFsudcKY7dPHZP9
         dBe4UgDUeL3Ni9LVtMltyTcS5ZWKIVtWYEcabJerSAdYpJWts3aEAXY1nf7sul05nVJt
         2qj5l7vrJwlq4ph87IY/ajv9GlvjLf2d/qTKH0JhmEGAd+j/dZGL7Jyg7PaXjco9kx/V
         wW0c6jAs+psTeWb9wxZ5AWx0NcGIhCq6LGQqFI+M2h7hOSHlgSzsqdSkEjGTlANXzzAj
         Shrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733338; x=1790338138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ha8wUO0vAad7WPPmqJPILgb1Ew3Bf7lbxU7bR2Z218I=;
        b=TDBy5hRn7zkxVVAnWwzfzStLtyOEEaXmiFDBzw/Q7eUFtHJt9IVaT5cVbYnR8Hf5yI
         Yxc04RWZl1FdOBHVFtnypSOYN2hU/EmdCyhmLA7HTuRVwiA+BmvzTnfnMqwgcxpCrbiw
         t7vIai7h5pBzmv23roZDs6dpqMJWAVd3dhmS+0R4sQ+rnTjJLhzIbvv0P9uQI6O37BoM
         286ao4Y6uZmfOyhxYLxz4xu2FxNj2rvI7bmrvnxS1yKu1fsmk6Qxl7gJqaOPdAGRqAOK
         PTHE/XUpncG/eSYMydZv/mKLCxXBo3Hi9O3w4JI6LclTkb/jvw4dPU+YFlH6tZdlYUAB
         fYjA==
X-Gm-Message-State: AFuF++myE71uDaSADEg332XrMHoAjv7UxNIfc4bAj6n1PEhRY8P7sDAV
	XXlH+3kD3r38z0dQgblvzJDixh+Yo5KJsRJLAjFCOqJKHG06U0JUbXFWzvd3CGWX
X-Gm-Gg: AYBFou3XClfePLBIh4fPkUBLecd3MUtqP0YyhoIxAwGmXwEIeqUXs1oOhLijffR5hF3
	S6hlaKHe6YkD9ZHIF2f6yn7iw6aMiGMdgvqaYHoJqAJi4feqmyMOuSF3YMyIuMzewnEa7pQM4e1
	i6UCINh8H0vLnuZDgVuIiHYHU5KsS8s9pJBv/2Vo6J132EqUeC7+q2vYjf8S8/wFrzO1OaDvIQG
	mMmxAqP+2oYLGr5qJ1vGOn2nwm/izcN6rykzD3o2s0P9f8rxP6yHKSedIKXp7Gy6mi3h8juDdVm
	s78GTdG2bixhnoLtfcOUjIMdi5IVsMSqFBsshKaH5IEwCKIvyyK8+OHZXsBq6e/XI5IbuwIVVvm
	v2QdvqHoDrXVpNe6ZUhFk9cvnb3z0k04Oo63bXn+2ptB/zVZln3FsJj3oSPC+/JdDvH9Y4EeM6f
	NzWs8mr4vZRhHATE4/5HoSx9TU44z+4BiudW5Dlf6+njzrOYS0wntjXxu3RSLG7rsT83Wrojayg
	zwOfaxMa5+X
X-Received: by 2002:a17:90b:398c:b0:39e:1c2c:1d4b with SMTP id 98e67ed59e1d1-39e54bcd0a9mr5392355a91.11.1789733338063;
        Fri, 18 Sep 2026 05:08:58 -0700 (PDT)
Received: from nevers1dd ([118.95.161.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c28180a4dsm5257193eec.0.2026.09.18.05.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:08:57 -0700 (PDT)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: nm@ti.com,
	kristo@kernel.org,
	ssantosh@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH] firmware: ti_sci: replace kcalloc with kzalloc for buffer pointer allocation
Date: Fri, 18 Sep 2026 17:38:39 +0530
Message-ID: <20260918120839.207459-1-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_050859_225414_8CCC41B7 
X-CRM114-Status: GOOD (  13.12  )
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

Previously, the buffer pointer was being allocated via devm_kcalloc that
would check for a mul overflow before allocating n * size bytes
(size being desc->max_msg_size), but since n is 1 here, we can instead
use devm_kzalloc that allocates the size directly.

Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
---
 drivers/firmware/ti_sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 33d7c4a4181e..8e346440e539 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -4132,7 +4132,7 @@ static int ti_sci_probe(struct platform_device *pdev)
 
 	/* Pre-initialize the buffer pointer to pre-allocated buffers */
 	for (i = 0, xfer = minfo->xfer_block; i < desc->max_msgs; i++, xfer++) {
-		xfer->xfer_buf = devm_kcalloc(dev, 1, desc->max_msg_size,
+		xfer->xfer_buf = devm_kzalloc(dev, desc->max_msg_size,
 					      GFP_KERNEL);
 		if (!xfer->xfer_buf)
 			return -ENOMEM;
-- 
2.55.0


