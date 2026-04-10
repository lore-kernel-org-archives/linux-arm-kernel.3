Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E19AF4484F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=M9a5EG3CG8Udn3B7jIZCxrZ3k3coZbiW9xz1Wj8kXaE=; b=RpeOYRCNo00022
	xFibQeb//HGrjGG4EhPOLfI0M3MG2wqbAnTjjwg2XGkpgACDZuLjlgMSvCktsgyj08Up3+e2mJ16m
	LITuR6Gll+0A2YX8wP/bwxV2i03qouY2x5LI4cN59u+Y4CYebyl05V9yJWdh8/IJ055Pvyur8yCP2
	WoM/ZQCh7LpM3/zF/6IWSBhYG2AM46ZZhiozjXQgRZVRynXvkGMlZDEwZs/+eJtffN/Zq/FOVSPoK
	6vwheMIz3hY3S3M1mEXU5aYahXBkCOUmcUvQd5fQilbC5pwZv1FkBKMOCSVt8A8hZ0RgdlVHaKlW5
	uOgCMKtdUvQgT34KE3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApX-0000000C9pW-0zWj;
	Fri, 10 Apr 2026 12:19:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApU-0000000C9lL-2x8A;
	Fri, 10 Apr 2026 12:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E547D4047B;
	Fri, 10 Apr 2026 12:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38E7C2BC87;
	Fri, 10 Apr 2026 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823559;
	bh=p4ul6fecafqSjuz/HWiW1SqReHpNi3SQC1heaf7AtH8=;
	h=Date:From:To:Cc:Subject:References:From;
	b=VM13lKS0vi1Fampzs2SOJUSl5pFNtZPRrbRXrfYUkEg7syYn7CVko7c7egIdexCfj
	 MaRLNlopnK85+N7I7i3OZHuHcMdHWNGNdlJV5bSYYI//COctIU1M1ukOOe7R86fGRN
	 QQ/j+jjVi+CYY1R1j+UlDL84K4FAOhCbq1OrkH36o+f5XviRftg90dsfUTYhZvjNV5
	 hk3/t6EuYClXGdWJA1CVm0r4gv7+Uuy+bWtd/uVuLx4/iO4+bV/Z+fKbXLcG7tmKkB
	 b/7xC9trAvx6oz1zNsW6Ny9Eav33gyvB9AokHXFATxUfQATArxGnp5TkYcwejIeG8o
	 hkZquPfDoH+3g==
Date: Fri, 10 Apr 2026 14:19:16 +0200
Message-ID: <20260410120318.253872322@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev,
 linux-wireless@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org,
 David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org,
 "Theodore Tso" <tytso@mit.edu>,
 linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 10/38] arcnet: Remove function timing code
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_051920_825702_5B3D71AF 
X-CRM114-Status: GOOD (  17.52  )
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

ARCNET is a museums piece and the function timing can be done with
ftrace. Remove the cruft.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: netdev@vger.kernel.org
---
 drivers/net/arcnet/arc-rimi.c  |    4 ++--
 drivers/net/arcnet/arcdevice.h |   20 +-------------------
 drivers/net/arcnet/com20020.c  |    6 ++----
 drivers/net/arcnet/com90io.c   |    6 ++----
 drivers/net/arcnet/com90xx.c   |    4 ++--
 5 files changed, 9 insertions(+), 31 deletions(-)

--- a/drivers/net/arcnet/arc-rimi.c
+++ b/drivers/net/arcnet/arc-rimi.c
@@ -291,7 +291,7 @@ static void arcrimi_copy_to_card(struct
 	struct arcnet_local *lp = netdev_priv(dev);
 	void __iomem *memaddr = lp->mem_start + 0x800 + bufnum * 512 + offset;
 
-	TIME(dev, "memcpy_toio", count, memcpy_toio(memaddr, buf, count));
+	memcpy_toio(memaddr, buf, count);
 }
 
 static void arcrimi_copy_from_card(struct net_device *dev, int bufnum,
@@ -300,7 +300,7 @@ static void arcrimi_copy_from_card(struc
 	struct arcnet_local *lp = netdev_priv(dev);
 	void __iomem *memaddr = lp->mem_start + 0x800 + bufnum * 512 + offset;
 
-	TIME(dev, "memcpy_fromio", count, memcpy_fromio(buf, memaddr, count));
+	memcpy_fromio(buf, memaddr, count);
 }
 
 static int node;
--- a/drivers/net/arcnet/arcdevice.h
+++ b/drivers/net/arcnet/arcdevice.h
@@ -11,7 +11,6 @@
 #ifndef _LINUX_ARCDEVICE_H
 #define _LINUX_ARCDEVICE_H
 
-#include <asm/timex.h>
 #include <linux/if_arcnet.h>
 
 #ifdef __KERNEL__
@@ -62,7 +61,7 @@
 #define D_RX		512	/* show rx packets                        */
 #define D_SKB		1024	/* show skb's                             */
 #define D_SKB_SIZE	2048	/* show skb sizes			  */
-#define D_TIMING	4096	/* show time needed to copy buffers to card */
+#define D_TIMING	4096	/* Not longer supported. Use tracing instead */
 #define D_DEBUG         8192    /* Very detailed debug line for line */
 
 #ifndef ARCNET_DEBUG_MAX
@@ -95,23 +94,6 @@ do {									\
 		pr_cont(fmt, ##__VA_ARGS__);				\
 } while (0)
 
-/* see how long a function call takes to run, expressed in CPU cycles */
-#define TIME(dev, name, bytes, call)					\
-do {									\
-	if (BUGLVL(D_TIMING)) {						\
-		unsigned long _x, _y;					\
-		_x = get_cycles();					\
-		call;							\
-		_y = get_cycles();					\
-		arc_printk(D_TIMING, dev,				\
-			   "%s: %d bytes in %lu cycles == %lu Kbytes/100Mcycle\n", \
-			   name, bytes, _y - _x,			\
-			   100000000 / 1024 * bytes / (_y - _x + 1));	\
-	} else {							\
-		call;							\
-	}								\
-} while (0)
-
 /*
  * Time needed to reset the card - in ms (milliseconds).  This works on my
  * SMC PC100.  I can't find a reference that tells me just how long I
--- a/drivers/net/arcnet/com20020.c
+++ b/drivers/net/arcnet/com20020.c
@@ -70,8 +70,7 @@ static void com20020_copy_from_card(stru
 	arcnet_outb(ofs & 0xff, ioaddr, COM20020_REG_W_ADDR_LO);
 
 	/* copy the data */
-	TIME(dev, "insb", count,
-	     arcnet_insb(ioaddr, COM20020_REG_RW_MEMDATA, buf, count));
+	arcnet_insb(ioaddr, COM20020_REG_RW_MEMDATA, buf, count);
 }
 
 static void com20020_copy_to_card(struct net_device *dev, int bufnum,
@@ -84,8 +83,7 @@ static void com20020_copy_to_card(struct
 	arcnet_outb(ofs & 0xff, ioaddr, COM20020_REG_W_ADDR_LO);
 
 	/* copy the data */
-	TIME(dev, "outsb", count,
-	     arcnet_outsb(ioaddr, COM20020_REG_RW_MEMDATA, buf, count));
+	arcnet_outsb(ioaddr, COM20020_REG_RW_MEMDATA, buf, count);
 }
 
 /* Reset the card and check some basic stuff during the detection stage. */
--- a/drivers/net/arcnet/com90io.c
+++ b/drivers/net/arcnet/com90io.c
@@ -332,15 +332,13 @@ static void com90io_setmask(struct net_d
 static void com90io_copy_to_card(struct net_device *dev, int bufnum,
 				 int offset, void *buf, int count)
 {
-	TIME(dev, "put_whole_buffer", count,
-	     put_whole_buffer(dev, bufnum * 512 + offset, count, buf));
+	put_whole_buffer(dev, bufnum * 512 + offset, count, buf);
 }
 
 static void com90io_copy_from_card(struct net_device *dev, int bufnum,
 				   int offset, void *buf, int count)
 {
-	TIME(dev, "get_whole_buffer", count,
-	     get_whole_buffer(dev, bufnum * 512 + offset, count, buf));
+	get_whole_buffer(dev, bufnum * 512 + offset, count, buf);
 }
 
 static int io;			/* use the insmod io= irq= shmem= options */
--- a/drivers/net/arcnet/com90xx.c
+++ b/drivers/net/arcnet/com90xx.c
@@ -633,7 +633,7 @@ static void com90xx_copy_to_card(struct
 	struct arcnet_local *lp = netdev_priv(dev);
 	void __iomem *memaddr = lp->mem_start + bufnum * 512 + offset;
 
-	TIME(dev, "memcpy_toio", count, memcpy_toio(memaddr, buf, count));
+	memcpy_toio(memaddr, buf, count);
 }
 
 static void com90xx_copy_from_card(struct net_device *dev, int bufnum,
@@ -642,7 +642,7 @@ static void com90xx_copy_from_card(struc
 	struct arcnet_local *lp = netdev_priv(dev);
 	void __iomem *memaddr = lp->mem_start + bufnum * 512 + offset;
 
-	TIME(dev, "memcpy_fromio", count, memcpy_fromio(buf, memaddr, count));
+	memcpy_fromio(buf, memaddr, count);
 }
 
 MODULE_DESCRIPTION("ARCnet COM90xx normal chipset driver");


