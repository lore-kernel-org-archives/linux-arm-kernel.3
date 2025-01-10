Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D2BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/s6AcoV7eSa8oU9Cj5O6jNKTNB31fGwfafoEc6FUA1U=; b=vRbS8yXRkuw+CTg4qBqz2DOmsc
	kHHrVn4pEoZo/2VTEmakz30rJGcT0mmWFs7iIUB+6JQVZlELBMH4f+vZx3l/HV38qz+LfKP244wYP
	aOnTryiqdgAueQ7AUYLkuP9fi1dp9rZFrz3OGaOE/Stq7Rw8sJS3RKQhjSBH99vKwMUU5gSY+xt9m
	20BT8PFZCy7Hwmlpz0y/jPnlrlWgwuJ7lKfIyeTK3X8mP7UaVVMcexHU+BdIKJ15XNc1ilA91UqP5
	Yr0fUjcu9Jqd1jwmRsvD408JGeKkn2YgaQ5fWKFYsyumjdbEe+l+kawPeKVa92EOf/6ZPjoo2b6go
	u3sYZYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDp0-0000000FDOd-3VBw;
	Fri, 10 Jan 2025 12:09:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDnn-0000000FDHD-0Hz1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 12:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736510865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/s6AcoV7eSa8oU9Cj5O6jNKTNB31fGwfafoEc6FUA1U=;
	b=RDZTMhKAVNMAq9ykcNm2UfkPiPLVlE3x4441uMSe2JDIg2aCEUXtQ+n6+Ctp8me1bbVo1v
	xVHBp43thBk2+sUfnmd5Nt1nVFk4HNy2kPOWfqn0fjOCoky3llQYSitl+NvsYqzZuEcyTf
	/ufWYv3FSL9J+KDDkGOUhFweiymmjq4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-tIhIPn1MPKKs8eOTqBcvYw-1; Fri, 10 Jan 2025 07:07:44 -0500
X-MC-Unique: tIhIPn1MPKKs8eOTqBcvYw-1
X-Mimecast-MFC-AGG-ID: tIhIPn1MPKKs8eOTqBcvYw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-436248d1240so9740415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 04:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736510862; x=1737115662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/s6AcoV7eSa8oU9Cj5O6jNKTNB31fGwfafoEc6FUA1U=;
        b=A/ULe3z5pe+xwvaMzgvxV7Os6ejHpTvWFEJGUJPimOeZAWtIwowPRqHNrx/hYNse40
         wFc4vlDc56xSRALj8wn8u6NRiUHa+y1xFkzzId0JDDuYnqrvpvkTr3okE6XqTdZV7DPo
         AWI5W1o3oGQ3hnyFhbicb3Mq3zR7uBovdxlBzfoJ3VLsQwYQ+Qjvwb2jvqy8X2peWc8P
         xpu22TK48gaj3YB24Cc1bzBtTN44DSGfftXUmMpQu2omy3cBnBEPVw79tipSvl0LFVCw
         r+FlFTB0eXWMUaJmE2XADX30GiXA/riStYVU1CvKaSWZ6rYtjaYvbLdTtZ11s/TyRH/p
         j4JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT2jbRDIZMZvshhNxho+bw8qKL/irpEoVD4vtF/swzaI5LYw5oXEvdw/Rwcfj0HSMv7cQ0dRl0f2HmgVSeIVHb@lists.infradead.org
X-Gm-Message-State: AOJu0YzlLgOJV0GBj/bs7gzZ80jLHQJe+g/AITJT7FbtmQC6euhaty5Y
	EsmHQ2bchH+kEJqbT+LuPSE2o9+IruUdt/R18BWrTBzvW/02WPXUgaNViY+I8xpz+jWVelWoYdw
	cuyhbQfxJNsmhxHOAt6chOdb/0mJfhe21GuYr9TBMtNDYWGo6/GxGqM8NWBZoQwcLiwWF3/7dA8
	/VcHHf
X-Gm-Gg: ASbGncumvpYq/07QUgoqYkHzhfWp/R5MV30MPB7GzlOAaOuZ3bbxQuo6sb5AYtTuozG
	p6EUtTcsOe+iPJ5j1V1M5uIqmZ3Me1w40DK/4hZ+LnP15m0qJIgN8pUGaIoXfQxudJgDcIAceyI
	KARR1d5MjiwcdlukVyCpaQDJaDVx0dlz7+nknI2IjKJ2DU7lFf35+hLKy2xI7OlW01ZtpvEkgS2
	UuHnzkwRMA51BN7+Cd6v0G/J6OcOJe8eCHNt8D73R3phOJ14TIbWM9fO2q7owM2e0CeIbinHRbH
	KVm75RG2vgqQKLRLuQWFfcfXAu3O
X-Received: by 2002:a05:600c:3505:b0:434:a7b6:10e9 with SMTP id 5b1f17b1804b1-436e26a9045mr102324455e9.17.1736510862549;
        Fri, 10 Jan 2025 04:07:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbgDQ3ewebQfLS4urKYZZILsPA8GS3xvXnwmYJ52EVcMnygfg0FQR9Yh+N96Ihn3P91v+A4g==
X-Received: by 2002:a05:600c:3505:b0:434:a7b6:10e9 with SMTP id 5b1f17b1804b1-436e26a9045mr102324195e9.17.1736510862220;
        Fri, 10 Jan 2025 04:07:42 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fc81sm51204965e9.5.2025.01.10.04.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 04:07:41 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: Adjust the file entry for the qnap-mcu header
Date: Fri, 10 Jan 2025 13:07:36 +0100
Message-ID: <20250110120736.58831-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MaPz9hAS9tDQj8eOOjBwIDeR377lUOdqaOg05xgKvSU_1736510863
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_040747_183758_DEEDF99C 
X-CRM114-Status: GOOD (  15.38  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 998f70d1806b ("mfd: Add base driver for qnap-mcu devices") adds a
file entry in MAINTAINERS referring to the file include/linux/qnap-mcu.h,
whereas the file added in the commit is placed in include/linux/mfd/.

Adjust the file entry to the actual location of this header file.

Fixes: 998f70d1806b ("mfd: Add base driver for qnap-mcu devices")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9fc47f2f1286..ccb919894a1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19260,7 +19260,7 @@ F:	drivers/hwmon/qnap-mcu-hwmon.c
 F:	drivers/input/misc/qnap-mcu-input.c
 F:	drivers/leds/leds-qnap-mcu.c
 F:	drivers/mfd/qnap-mcu.c
-F:	include/linux/qnap-mcu.h
+F:	include/linux/mfd/qnap-mcu.h
 
 QNX4 FILESYSTEM
 M:	Anders Larsen <al@alarsen.net>
-- 
2.47.1


