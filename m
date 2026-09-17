Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45202C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mhGEf8mpyg4UxEKpmS5TYtXOZtm+XpKxy7o28279ww0=; b=Dqjf7GmqA3IV0AJcVbgvlnO7zi
	Xpa42JzUtqJN16AtROfxvpvzjs/aqkyPW7kHuUrF/qPvuSfwJE9IK8pjafEFl/S9wjt403J5xoKoR
	CkVfV9mwr2x8Ncic6U3xdEmAS49L9pfUZFUew7TLa+GKvCRVNHLkbySY6NHi7/Tq+oERHy9ZzgY85
	E67HSWmGPpI/2lmPb1XDvmQ0XaqebB/0I6bMqKmevWIbs45xxPwPonVhfOSIZGHCY4qgBRNUS+B8b
	Kag2THwaHBlDuoC8lBfsqjcJerdlJH7UmQkpGTwYnTxj57VqlhJ5uAyg7erk6oTX21pu0ibpu3iZT
	PsA2ey+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IIg-0000000COBD-1YgM;
	Thu, 17 Sep 2026 20:01:42 +0000
Received: from mail-ua2-x21.google.com ([2a00:1450:4864:39::21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IId-0000000COAU-47dH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:01:41 +0000
Received: by mail-ua2-x21.google.com with SMTP id a1e0cc1a2514c-97e80579b7dso359434241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 13:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789675299; x=1790280099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhGEf8mpyg4UxEKpmS5TYtXOZtm+XpKxy7o28279ww0=;
        b=PI4UfDa/lPKmiQB4rKY2lzxo6YyvQBmiYtYa61lgwXJzLmLDCqtOfpFmwejWxT66Fi
         K73NuAR0jXuV+YPYbXsngvI2FVhdk5J9imPafCz3TnBCGYWo7wbhwSrrwPHR6RmUzPso
         8v+EXbJqyVLa1n12ltpv2CHIbYV0iJl+wDOzIu+zA8ESZRI8vzHOGv78nvwxqU7lVi2L
         G/kSg4S/wavk+UK/JA4MHM2150GgKQI0cmmOXuLDYfTUIiUnTe6d+u9etR7gv4gTID0p
         UqJjbdpUXBtuTiIhstHoi5szyO1DZJbV5hRanXVzBPOq/LhMSrrfTgCwmu9CPelkIdBW
         jYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675299; x=1790280099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhGEf8mpyg4UxEKpmS5TYtXOZtm+XpKxy7o28279ww0=;
        b=IBfvQPxHTh7Pvvl09ftb1X/07f/z0h+8d0jkMb6qcL4B39/FbOY/qszOX6aEGchBq2
         AunnjtTwI2ZzC753Shv/cVhmIxyxYeDIOVbEewa8Hmvi+jTrTQb5yRJYs6r7ptC0gO+2
         jGnqu0BXyigofcYIAgZQAjuVhXJNzULKtnZ3f8Qbnpw+9NhmWWrS9foJXwWGAeuGdKWc
         hFWpxGWZXDE4H2HTdDX5tCyfT+KFoqkjl3fN2m7vtTb//rwtmQALarafJH5YAyeLvrWp
         hOjsYIADYPe5rHFWcjfhmP5Si7IX0yJ/wJbR6x2XygxtluNpFovr46cdNn9ezEcEGWai
         XPVw==
X-Forwarded-Encrypted: i=1; AKwUvByAu8F8/D6o9DuSJO8++kWtTNOQMGz7tB4p2ytE66SI1cuC1+JcyikbJw1WVGN+BQA4REggHaYpeaEWWdqXyizG@lists.infradead.org
X-Gm-Message-State: AFuF++noGnx3xtKzyeY6ltk0IaPODBLEu7nIJLgHczGHsBmDkFxkznmB
	yKKB/0J8MBCnMtvaJqqtH1lFb7SoZbeZv7UT50f6xgL7ZQ1kzj+VJZQ=
X-Gm-Gg: AYBFou0HpgGpc8ulORfdgd141kslJ2h6UCjC1L02tHiQhBbcjrRLSQtCMB3y8BtiWXT
	sgaI7N8aBb8QVfJyXhePpsaIjNgRupM6DisEh+a+Wgn049Hc16uOUwa+azIRay287glWuat2QWN
	k2e1rB3dR3RpWf2ov5bqNt2XMHC0HttLCwlciWQ7aQj1BgTfdthrlTZJ6qdH4nGpDu5ijpVQTp3
	yviUihJwPfsOfSGZDEyt6q7x/x9nP8rwBSP764DbootDVwOOW68wt9CbV3hNHkcG7WrCECSKakx
	IbKb3sE5IkaTsIKSxPYX7D1MqknkgzngrNwJ3WvrE9wwT3aqzUY0d5f3FG6G+VQQVDIAluwzrqW
	RfhpVcRU41yGo1MsrxKMMYTF9oRYUmITog4H1i3ayGTXv6y1Jaq/6WCyFyeAdpyJSAEySn4Ozef
	GvBbWeJxyocpuM9TihYIu/RP8Z+C3AOAngDV1rYFIXjVe9PYT0D6o5jUmsoHwtrZrmvi8hxbbUo
	4oGCkN+tWiHbUFQz9FA5ZxUrFHXT/no7PWebSHg123Fk+r7pgVwsQ3qGZjNFMSP8ZKTyfWNXFaR
	rnALL6hDQkrC46rCIiIY1NiKbUMtXimjCsO1
X-Received: by 2002:a05:6102:e0e:b0:79f:eeb7:d630 with SMTP id ada2fe7eead31-7a55a226309mr83581137.6.1789675298545;
        Thu, 17 Sep 2026 13:01:38 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252c7cb8bsm5425606d6.20.2026.09.17.13.01.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 13:01:37 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] soc: fsl: dpio: Free the IRQ before releasing the I/O object
Date: Thu, 17 Sep 2026 16:01:36 -0400
Message-ID: <20260917200136.75721-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_130140_031426_0799E3A3 
X-CRM114-Status: GOOD (  11.28  )
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

The DPIO interrupt handler accesses priv->io, but dpaa2_dpio_remove()
releases that object before tearing down the interrupts. The IRQ was
requested with devm_request_irq(), and unregister_dpio_irq_handlers()
only clears its affinity hint. fsl_mc_free_irqs() returns IRQ resources
to the MC resource pool without freeing the handler. An interrupt can
therefore access the freed I/O object before devres releases the IRQ.

Explicitly free the managed IRQ before returning its resource to the
pool, and perform IRQ teardown before releasing the I/O object. This
also waits for an in-flight handler while the object is still valid.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 993fec7e11ca ("bus: fsl-mc: dpio: add the DPAA2 DPIO object driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/soc/fsl/dpio/dpio-driver.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/dpio-driver.c
index d5198ffc4455..fa82cdcc4922 100644
--- a/drivers/soc/fsl/dpio/dpio-driver.c
+++ b/drivers/soc/fsl/dpio/dpio-driver.c
@@ -263,6 +263,8 @@ static int dpaa2_dpio_probe(struct fsl_mc_device *dpio_dev)
 static void dpio_teardown_irqs(struct fsl_mc_device *dpio_dev)
 {
 	unregister_dpio_irq_handlers(dpio_dev);
+	devm_free_irq(&dpio_dev->dev, dpio_dev->irqs[0]->virq,
+		      &dpio_dev->dev);
 	fsl_mc_free_irqs(dpio_dev);
 }
 
@@ -276,10 +278,10 @@ static void dpaa2_dpio_remove(struct fsl_mc_device *dpio_dev)
 	priv = dev_get_drvdata(dev);
 	cpu = dpaa2_io_get_cpu(priv->io);
 
-	dpaa2_io_down(priv->io);
-
 	dpio_teardown_irqs(dpio_dev);
 
+	dpaa2_io_down(priv->io);
+
 	cpumask_set_cpu(cpu, cpus_unused_mask);
 
 	err = dpio_open(dpio_dev->mc_io, 0, dpio_dev->obj_desc.id,
-- 
2.47.1

