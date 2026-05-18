Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D11CCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 02:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZkVweKMoSdI85cubZOQgniTBESiwe3e+6vJ5f2S/Hv4=; b=lUENGiqhsCt8lP8sSC+c1vuM4J
	KZpFuj87GnlPFdt/YPHkmNhox+IirNqwp+jPpVgzGA2v0/JYgJ8RN9kSjNLBBocYWUMc7YBgo0PBr
	JDn5tjhkx9eyB785VsTIuHHUDLbYqbDj6YxNbPg+gTqIIaDEH2ZYCKc5SQw7Tqf6zaGRJGXSnLAMl
	Vbr7dsejiNrRW6E88TMn5XWDaYQSmdwcYoJo21IJ1g/YU1CXVM+CTG2y/WBSLVhLwKLWpv+dxRVUE
	ZJox5Ekwk+stRvloWFIXzxQx5dTbNM+eUPGsFZLtfk7ptF19itNAqsVwO2jK73GWWuov8oF3WNz8H
	OchVezuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnuk-0000000Dxnx-12Wd;
	Mon, 18 May 2026 02:41:06 +0000
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnuh-0000000DxnP-0OBJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 02:41:04 +0000
Received: by mail-dy1-x1342.google.com with SMTP id 5a478bee46e88-2f30a4601bbso1450755eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 19:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779072062; x=1779676862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkVweKMoSdI85cubZOQgniTBESiwe3e+6vJ5f2S/Hv4=;
        b=V5J7acbjzf4ZbrF57Lgyf3phoWMuwwMF5azPEwfVcQ7CD46Zy+Bu7BdGYqrapSm9b1
         upCExc0wiVhh3e++TeeJ+DcL0I++rb5SxtoWL6CfH2drvAZzKIBb1tG9dQUtwCdwHeLC
         gHXSSngRskNWyLV4T1uSrxLsn4v9N3HsCQMPARJzvuGFuOo04rEl4ylSfZgZ0hBTL4Yf
         sEZE2mNwhYSa9q1XdZcsL38Lj/5986ru2vaEkwMvuXryYgVqGKFb7Jo6SEZRWgSdf2hr
         0gxVLKMl5dz/1CuyFOsTkx+2zABYRBrSPmwo2Jz9u0pjsU95ncHkyh4dhIg1zFjqLEP0
         0DFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779072062; x=1779676862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkVweKMoSdI85cubZOQgniTBESiwe3e+6vJ5f2S/Hv4=;
        b=paMQNsg/2kpV/QpbmhSCPh6Mq/YW4NdWucDPWDz2kJH94TQ+g1UUlGy12K2fe8JzA0
         IdUR1b4TgJCjKMhHbl7jPI4SCGLtOe9Xt8X1Osou20r5wBq9hoNyjaTt8bcBTRyjXgVQ
         g+UXfKyUlKM7/EeoY96PqsVx3886OFBzhZLVokZdqPQynyRhsHU7P3H671ORrjXuH9kU
         RunEFeSdNLW8dhm43x70CAeYlEOdQC+vnBcsylGHiIJOrqDE9ZVg5NFWTQe4AIPfrBzT
         fXp+XbWkrybPRKhFiR8qSs1FH7+S5ZEcD9wtvzr2ZMQypl8ygAMFYZ0ynNUXN3eX3g6c
         fyiw==
X-Gm-Message-State: AOJu0Ywk+aqONTbuJBRN9efgpqyQUyrg2L3kMHFop6SuUINoaoXqjC00
	1bGw+z+z09VluL2N2oMmHJLPw0cKd/3WRop5/Wm2BwO3FX8aWcLH7T0jFtlM7W61Ux4=
X-Gm-Gg: Acq92OGTzml43FqQn116tzN5afNXnI4x5JbXP7O6e4zN6qKykWBW6OJPR9BHMH9adN8
	z5AhPEO+WNRBLO6HhIC8cHW76JW+epz+qZHMtCmwy+EOJxmpuYZ1Sj0oH9AQNmKIcrgjh8NJbeb
	D5cY3eGFaG9BzuNcEEe0ulj6d/5268qr+iCs8zYU1M+Sjr3KZs4h88dFLsr5C+sVXkY7TttkByX
	/A+Pc3918T09sAgQXXCB4fMcPVcPI2IPKzCBnRIP4nn3wNZ191g8Ug82txmA1UjF4Wdo/S1AueJ
	RxBjkvQVCpREeR1xubwRnGrARTC4XYDYTUlZPrcFBFbasxtRTnd166t7Xmx2XwVqD7ebkbA85kK
	IiNR6YoDzPU2+qk9gE4HmTtlMEwhoOD8VRXca/SucuBVuKTzcwLOJgUZ1gfdmPrUxqcbCytQLzG
	+/O/5Em6kU5xXhlcKcYH0BhObiT9PysD7nWnf5I2O+58570By3CE/0dKv1IYpsIAVFB6X1hzENA
	XGd081wQ0Q3KQUk/UrjwMs/8xVpGbmaGq52FuF7d2JSEEfXGfQLRZjj68mmICTeSncd8ajqUrpn
	ca93p2k1nTGNjt1fPvxVQe9rSzpTP6rZ18WjVwg=
X-Received: by 2002:a05:7300:d706:b0:2d9:f0b3:1d98 with SMTP id 5a478bee46e88-303982860f0mr5402573eec.7.1779072062179;
        Sun, 17 May 2026 19:41:02 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978b3cb2sm16356144eec.30.2026.05.17.19.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 19:41:01 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Adrian=20Barna=C5=9B?= <abarnas@google.com>
Subject: [PATCH] ARM: remove the last few uses of do_bad_IRQ()
Date: Sun, 17 May 2026 19:40:45 -0700
Message-ID: <20260518024051.189979-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_194103_133808_2AC24844 
X-CRM114-Status: GOOD (  16.55  )
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

The do_bad_IRQ() macro simply calls handle_bad_irq() with a lock around
it. It also carries a comment stating that uses of it should be
replaced. According to commit aec0095653cd ("irqchip: gic: Call
handle_bad_irq() directly"), which replaced another use of
do_bad_IRQ(), locking the IRQ descriptor is not necessary for error
reporting. Therefore, replace all uses of do_bad_IRQ() with calls to
handle_bad_irq() and remove do_bad_IRQ().

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/common/sa1111.c             |  2 +-
 arch/arm/include/asm/mach/irq.h      | 10 ----------
 arch/arm/mach-footbridge/isa-irq.c   |  2 +-
 drivers/irqchip/irq-versatile-fpga.c |  2 +-
 4 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index 449c8bb86453..a0f854cf4748 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -221,7 +221,7 @@ static void sa1111_irq_handler(struct irq_desc *desc)
 	writel_relaxed(stat1, mapbase + SA1111_INTSTATCLR1);
 
 	if (stat0 == 0 && stat1 == 0) {
-		do_bad_IRQ(desc);
+		handle_bad_irq(desc);
 		return;
 	}
 
diff --git a/arch/arm/include/asm/mach/irq.h b/arch/arm/include/asm/mach/irq.h
index dfe832a3bfc7..fdcd8388977d 100644
--- a/arch/arm/include/asm/mach/irq.h
+++ b/arch/arm/include/asm/mach/irq.h
@@ -17,14 +17,4 @@ struct seq_file;
 extern void init_FIQ(int);
 extern int show_fiq_list(struct seq_file *, int);
 
-/*
- * This is for easy migration, but should be changed in the source
- */
-#define do_bad_IRQ(desc)				\
-do {							\
-	raw_spin_lock(&desc->lock);			\
-	handle_bad_irq(desc);				\
-	raw_spin_unlock(&desc->lock);			\
-} while(0)
-
 #endif
diff --git a/arch/arm/mach-footbridge/isa-irq.c b/arch/arm/mach-footbridge/isa-irq.c
index 842ddb4121ef..48c7b3efd555 100644
--- a/arch/arm/mach-footbridge/isa-irq.c
+++ b/arch/arm/mach-footbridge/isa-irq.c
@@ -89,7 +89,7 @@ static void isa_irq_handler(struct irq_desc *desc)
 	unsigned int isa_irq = *(unsigned char *)PCIIACK_BASE;
 
 	if (isa_irq < _ISA_IRQ(0) || isa_irq >= _ISA_IRQ(16)) {
-		do_bad_IRQ(desc);
+		handle_bad_irq(desc);
 		return;
 	}
 
diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
index 034ce6afe170..6eaad836d9ff 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -89,7 +89,7 @@ static void fpga_irq_handle(struct irq_desc *desc)
 
 	status = readl(f->base + IRQ_STATUS);
 	if (status == 0) {
-		do_bad_IRQ(desc);
+		handle_bad_irq(desc);
 		goto out;
 	}
 
-- 
2.43.0


