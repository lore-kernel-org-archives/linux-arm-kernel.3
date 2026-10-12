Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CB3CA9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 05:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PothssnYOQBqU06oPmf6jtHUTyL9DrHCtzHqtSv9s2A=; b=jmxBoDXlb0sdliYGJN7gz4Ehpb
	eQZt6X3sXrCekqvPZhuB6PIITFhVC73RfwAgVpGXnhhSKcBYvI6ec1YlwKMUy6ls6vHk5ENlg928m
	cOqqyIs1ooXEXD2g08/aJ5K1BKr7zEv6TjjLJKZnbnc+jhznG3T6DKAm1jmUMABnMrfOEYA8VqAor
	BCar8mU1FuUWToYPIdG2afE6i7b2MBNRnGYRV/Fh5QS8uOBkdJM+jhI5AIB3iDTpkC7l9PfA0W9tr
	61YrMd8KefMVdoiJkzbmM5JkJD0euSVe8AIzODJVzCkFabHrz8CeoSLCb2PchtGYHbTVIW4RwS/mq
	yRPdLQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8ys-00000009het-3q0b;
	Mon, 12 Oct 2026 05:53:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8yp-00000009heR-2Rsh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 05:53:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so11270475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 22:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791784425; x=1792389225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PothssnYOQBqU06oPmf6jtHUTyL9DrHCtzHqtSv9s2A=;
        b=VwkI4Osa5qpzExqqE9C36Dveso/DSjfRXjxByX2uFYptCkAM8E6UkjYQWfE6bn5B08
         hlXJKFcSPRgMsWdhIBu4XugUhiFaqJTzGugo/LgnSyNk5Wn/IIIHEm5sbA7UfzsjHpDN
         plHdlMdF4+aXR2A/Qi7QyHErhf5lSl4UKKWIlMcluqnb6EUMzntO3JMgzj03342Catyo
         gufLgS7QgVK1oJfbeF7t1+7PFfjFc7pKP85R/DvR7TdW64Ca3+dsajw5niOuig8rLAqw
         lvnNYuCxHLdOnmBYguJ4gyTZMvevhKPv+P0uB+SMdcauGhKZW+LHRA4yxBqudcTefkIf
         ElGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784425; x=1792389225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PothssnYOQBqU06oPmf6jtHUTyL9DrHCtzHqtSv9s2A=;
        b=TCHNoayi+7WOKelNlTcWnr9HPTDIphgw5xOfk4+W/OHmP7WwoT93aEEhS6IN/n41XH
         Ehu8Ug6c38rxrnCNcaN25XIFJlnPVXAPyiRKo3LbYiOorIDhfOrxBdnRKsnbk/rU8bL0
         yEZ7QjeH5dDNlYsSpkOpytyh712GwuwCTvjqYVPFlhiR0qJNWoIGPIlHFff3t1Geff2P
         px8ue7mB4WHq3BX5clzjvTl2qgSDL2jql2anitoREcXLZu3SeBOrodys4jUL5KJrng/s
         /xmPaMNoygO62x5ErLIpTKgyrEMi8EPn3G9ob6KspG0TQh6mpJbdaPF2/cAhkIpd3hLD
         /P9g==
X-Forwarded-Encrypted: i=1; AKwUvBwrd4akHlR6OLiuHK/uB/rs+Z46vmVMgHb+2mmVG1GOhKaRRvOgK/jFWCvCvr85ag63fNu4mOcM4QPobqIig05s@lists.infradead.org
X-Gm-Message-State: AFq9FYKqt5OCzTb2nrSa5zYM3BWX5HkoKQyzV28IJ65dWuL696A8AHCF
	URWazoXpeebGMa7Q2o6bkaUqDSDfEM/kF04gV4QWYLsni/7se9OGelpH
X-Gm-Gg: AYBFou2gwRtohgxwND9R/DLf/GvpIOushGVro3hHtrq1oDyTNgsijZXHL+Tp9nEJcZT
	cdjJZTGNKlyolpmDqYIyH/dsFF8FfVL5ZM0uS+sH3Va1x4HGk1h+TCX98k+Y4GDQqrs2ncLmLJ8
	cnAZpTtt8dKnywfmPeI2OcB+Zt/1eyJJLnO/BX65mszM/1ZwFgbKuGLVZmIxte9HvSD4/8FIFrR
	RSEx+59RO3mswNb4s+ozHvapFJhwWAKgVZ218GpJDuBfeKRF+S1e/7XtuiR+c/lYGfCpXmAHGVS
	Cm1rBvRt8TLmyPw290KRuLHKt1NkKxmSHvh0cL1qdCnzZdcEMZ1g8EZTZTz2RhpE86Ypoyt8lGJ
	IPiL1asv8tEtAhzEzps35FDKBLt1Uc6FY+fOd538y0EtizvNEN/xoeBaxxb9mYqv0VqoAQ0IO27
	YPyL0QZPffcBVEjWficG5Fre7gczYMk+n0L5lm6RhL+0aZn8PvaDabMkfyJxJnxWYS7wT12UYgv
	8HNfx4BCxhQf9H+eHIy1NtG01QaeVq8eZFKW/rJK8EncaPLiK89JC4hjyiKOoaI9gH1X2FL++xV
	sLcusTc2N30d7KbSyuXEDopPdXLvHnA7P8153YuzBrI6uCOIhhMBU7xtjxpYdRocuh5d0Qudz6Y
	=
X-Received: by 2002:a05:600c:6207:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a18e4aff66mr150789045e9.18.1791784424879;
        Sun, 11 Oct 2026 22:53:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8ab-0f01-016a-c770-797f-eaee.310.pool.telefonica.de. [2a02:3100:a8ab:f01:16a:c770:797f:eaee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e49792bsm417935035e9.4.2026.10.11.22.53.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 22:53:44 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] serial: ma35d1: Do not force-enable an unselected console
Date: Mon, 12 Oct 2026 07:53:40 +0200
Message-Id: <20261012055340.16719-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_225347_657953_304322FD 
X-CRM114-Status: GOOD (  12.09  )
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

When another console is selected and there is no matching ttyNVT console
argument, the core accepts the MA35D1 console without calling its setup
function because it has CON_ENABLED set before registration.  Its index
remains -1 and printk repeatedly reports an invalid port, flooding the
console and preventing boot.

Let the console core enable it after successful setup.

Fixes: 930cbf92db01 ("tty: serial: Add Nuvoton ma35d1 serial driver support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/tty/serial/ma35d1_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 0809655f4395..3be30fb05513 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -639,7 +639,7 @@ static struct console ma35d1serial_console = {
 	.write   = ma35d1serial_console_write,
 	.device  = uart_console_device,
 	.setup   = ma35d1serial_console_setup,
-	.flags   = CON_PRINTBUFFER | CON_ENABLED,
+	.flags   = CON_PRINTBUFFER,
 	.index   = -1,
 	.data    = &ma35d1serial_reg,
 };
-- 
2.53.0


