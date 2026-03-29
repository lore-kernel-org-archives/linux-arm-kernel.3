Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F856F3D5ED
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 06:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joGvpLKLQHNL2e0S7eTm2VF8nITvZONfisAAK1EQVfI=; b=lWhD9LnlqAHqs9E7qCEWmVpavt
	Ht/HgPPb/NflQGwfmTUl31tHrHXkdbPAX6NKz4yq6EZ9zqerIl19tSk1INgFU5Xqqjacd69ZO5OvJ
	JbUXaFErJ5hmnMnNrHq4JD5XlzNrUzxr6l2mHP5QUJtCMZ1sNUk4ZDBAyJKAi7KnC2WOKWRsgBzOk
	qvgubUoBrehbdfTTYN4ut6bJuf0PB6dvsjVcPbsbuKhugpRJS9G8TxQJbRhLYgpXLBOOP36+VWfYL
	RmxcLW+5bxlC0deT7byO8wNGIMRScOe6W+UprfX+/8CxRjyIFvFIRyFpXVfhiGSn9dUkVycQOKiv7
	1Q5SNW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jVX-00000009cqt-2BWN;
	Sun, 29 Mar 2026 06:20:23 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jVU-00000009cpA-3QIJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 06:20:21 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-56ce07a54e8so2636059e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 23:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765219; x=1775370019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joGvpLKLQHNL2e0S7eTm2VF8nITvZONfisAAK1EQVfI=;
        b=pdPPI0ajfvn2Yb//6zt8isEE3/kqpyOMDAkn+fgciau76xOt0NiOZX3s/1GcaKkHQ5
         N0PNGO1zwKxOUYoVq2cTLNhrLcrpJSRQAzgZOO4ve5C1EHg2o96o+4DrsgPsUX07soRn
         2Emy9Djso42fop23lBuBqaVjil5B4I/7Cpw1Qnoq5xewQcjdDsQeVzTmYt/h/Bwzf0Tp
         IpLnHTvc8fylpCSqgZob8DJWtUoDWljarwANz9JVS7Acz712xQYlbNRu6qrFgha5jy6t
         jWIIFifC+Be0Q/97/jqvz+L3YczvU2Jip4I1eenJZajVCIC1r2l+yTdv55ccF6ICG4ic
         iyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765219; x=1775370019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=joGvpLKLQHNL2e0S7eTm2VF8nITvZONfisAAK1EQVfI=;
        b=DTcOqD+W8OYBybh6aNOIDJl6eDXG/CFygI02gyUC2rWNRqwSR3pd5h//rcjbfy7qyi
         9ocOYIwffHdXqIB6CQ6JiO+gtwYlIQpy7JEeg5BP9HU6KzvpwdjKgIVkuPJX3+pHksyE
         cnp0BcVacobPMmuUj7pb3WkCSQyWdP8JsNjzT7GemeW9a1KRuyx/OZqVCM82KQMsM3/r
         ANLGOfJJB7DPApP3SL7BIqdDSOSZ8ymj4s+Yb5wE9gh7TfHg+hxv/e7v/KUS9HT/jlw5
         rKSTX3VXf6u3TTY4n2JbQxiD9MCGf4sY8tLnoJ+PUrdNiWoXtERcr9Ti7CPHTaQNx97l
         5vEA==
X-Forwarded-Encrypted: i=1; AJvYcCWEWZwJeG6Oj0nNK7bnj4pUrvYherJ+db4lNQTf5pADIbqPOLFW0bx9b72V4fBt995txAO50xk0SQ4pbUlHfNgX@lists.infradead.org
X-Gm-Message-State: AOJu0YznCRpAE6kcDivjxalU4K0UiXnwcrLS6wLllPzeVAQZL409rQ48
	QXWqazl7wT5qTEdOXudDhCNbWbHVMqGTbONjrJXH4GeJ5jsE/avSMXmfMDKWFvoadS4/wQ==
X-Gm-Gg: ATEYQzwsqWhnPq0B9M6PTGaq76PGr7/EjcttXic3bSpWdtVrM6z03Q1OsVXtOl+uhuw
	ttbt+zE1auPdCGMhnKQOWwLmCACU3SKWG7IMVN/uxdBrOcGGy4WVlLT0JcrN3Pf+eBbQGFETPW/
	DX9yPrlUTvS/tvTIBNyBisGNThe72WehrF2SB0VLe9WtFVWsqQbHIQbFNwKbG4+jeoVWA3Riq8K
	IHRHEpqSoso4JFVWwDOVaqdd7jJUfSF8Dl/UIYqD8LyP4JTgmNiQwB8tX6xo4Ee4lytPwzkZjDm
	PfA1WGPDx3KDYCCR8KK+GdT8mtKRAq2NdieESvFBV3kt+qbQXCPyNzG4/kbfiY+OVc2jsHrZXRn
	eYiH0OdMHs8rFylae3L2l80bjKs0Z1Y8YrEt+osjhrnplYqeu/WcIKyG3EvXbj6/N+1sHp5mmLv
	b1ka/j5fdyVqkiBv//khY0R07U
X-Received: by 2002:a05:6122:1d54:b0:56b:5893:d042 with SMTP id 71dfb90a1353d-56d4a5fd9fdmr3557683e0c.12.1774765219500;
        Sat, 28 Mar 2026 23:20:19 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:6d76:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58893d21sm4429929e0c.2.2026.03.28.23.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:20:18 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 1/2] staging: vc04_services: vc-sm-cma: fix integer overflow in vc_sm_cma_clean_invalid2()
Date: Sun, 29 Mar 2026 00:18:45 -0600
Message-ID: <20260329062004.492812-2-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062004.492812-1-sebasjosue84@gmail.com>
References: <20260329062004.492812-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_232020_868255_47464FA3 
X-CRM114-Status: GOOD (  14.23  )
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

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

vc_sm_cma_clean_invalid2() uses 'ioparam.op_count * sizeof(*block)' to
compute the allocation size passed to kmalloc(). Since ioparam.op_count
is a __u32 supplied directly by userspace via ioctl, an attacker can
choose a value that causes the multiplication to overflow on 32-bit
platforms, resulting in a small allocation followed by a large
copy_from_user() and out-of-bounds heap reads in the subsequent loop.

Replace kmalloc() with kmalloc_array(), which returns NULL on overflow.
Also add an early return for op_count == 0 to avoid a zero-size
allocation, and return -ENOMEM (not -EFAULT) on allocation failure to
correctly indicate out of memory.

The /dev/vc-sm-cma device is world-accessible (mode 0666), so this is
reachable by any unprivileged local user.

Fixes: dfdc7a773374 ("staging: vc04_services: Add new vc-sm-cma driver")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c b/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
index 34155d62a..d597d41b4 100644
--- a/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
+++ b/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
@@ -1292,9 +1292,13 @@ static int vc_sm_cma_clean_invalid2(unsigned int cmdnr, unsigned long arg)
 		       __func__, cmdnr);
 		return -EFAULT;
 	}
-	block = kmalloc(ioparam.op_count * sizeof(*block), GFP_KERNEL);
+
+	if (!ioparam.op_count)
+		return 0;
+
+	block = kmalloc_array(ioparam.op_count, sizeof(*block), GFP_KERNEL);
 	if (!block)
-		return -EFAULT;
+		return -ENOMEM;
 
 	if (copy_from_user(block, (void *)(arg + sizeof(ioparam)),
 			   ioparam.op_count * sizeof(*block)) != 0) {
-- 
2.43.0


