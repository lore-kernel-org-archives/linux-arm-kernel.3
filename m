Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAD8CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 03:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BSgCuJA/tA0laIMmqGKOL/31DJd5ibkvLEv/sSjsCkw=; b=vEW+aGyTgq8dXEfqgKdOZIwDJV
	XeieXhcSvYsshXKcZB0eAyayx7aPFvrtFsR0fDIYuWMupjn1EHSSdkdg7cBJ7XciK/8siVXK6sP2w
	rEm4eaoQkVYZ73D62pbHUaPuxlYe/TboZZwSKk89sDgqUynuO94EXt8h3EJX85l01vpiYh70OCN0P
	7fMZSf462uFLSgt15FWDbOavut6YfQFEL/aml88EOFbOdNHCyMm3ZrEt6vUZ5jZXIA+y2it6iISK5
	mJU/N0MM996Oitjg+SrdlIW2jBoc8U0f5Sc4ozcg2TYuN0zAiO8JGx8xDa2JacXnwxx9upVlr7Rlz
	ab7UWT8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGHs-0000000CFth-2jk5;
	Tue, 02 Jun 2026 03:59:32 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGHn-0000000CFtM-2cmj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 03:59:31 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-51720674eb7so53106401cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 20:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780372766; x=1780977566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BSgCuJA/tA0laIMmqGKOL/31DJd5ibkvLEv/sSjsCkw=;
        b=fxlWQnoGa0SFOV1Bl4KoEDckv1yEQ8UIMPaELxYVVBZHkIAkGhWZI4JbXPD21zZzdq
         8Nxyj2FCN1Nt1HttP+jypsPDRNccGgbODiSfxoednmXF9mrZ4Ky5UniQu2rnucsC5hmE
         3IqGLtXSDHWNMRXi6nqCnt30NIZvo56JLVlwock/JLu/iI3YFFuY4CZyAmIATWxaVY/o
         XrW+5BH7JdtCDWF3WcWhxLvEhzNjBp9YnsrxMfBGpTpY4G5GXh+r/T3I6OZByxMHN1AA
         MjDmTRB6gJAdAgs+PBx+Ag3+x6O6U9ZFsepVlj87N/N9oXHvjzBugS90LfXZrgTBpOfh
         pq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780372766; x=1780977566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSgCuJA/tA0laIMmqGKOL/31DJd5ibkvLEv/sSjsCkw=;
        b=sqRVl7/72w2uXFBfnyqLMWaTwYBe77Fz2IJgEymnRnFRSmu3ZvyqGJz8qFRf1kKep1
         XHHGs9sTZDHJ2D3m2lqA5JiAQLODFIN5AWsD5nD9A3K49v+wLqAS4e9rZXthHZ0KQRIt
         XyWWsgw8o+dyp1KGUI4DRBgSDlayPSrXPFEOuYhYbIp050ZZNZcB4xsGZ4OfMYvsQ3Qq
         0ffHDpaxQBgHYyhkOxfsWIyXxL256E1JTF5dmK/SM4g8QNzBTcJX7L8/8zbU+Wgrmycp
         Lvu1jFnVz1PpjUTpO8vMTHPHMay7jO7g4QM/+PJwNP8921cJZmXoS99L1Sx7ehzYT3ab
         VC3w==
X-Forwarded-Encrypted: i=1; AFNElJ9+wrbF7iEYoq+lj+8bH8G18d4BIPHDUjc/W8+oIVJiWUfKKDC0xgyGzWFwhqTmKgVE8RbR/+IgpyJmvLNTfUZj@lists.infradead.org
X-Gm-Message-State: AOJu0YyXsYw/RVfdPQA4iJWfMbfbsGJT617nvj/YnjfZPrCYDJ/3imqM
	reO0DMd4xoSPTtNa/EtQ2btNV8J5sE9/i46sj2W0NPLfaRbOpRHIHtxJ
X-Gm-Gg: Acq92OExAPjH5EtbNgbtGNUlE9WX0B+nGYQevPOvuZqVPtM4mA3f+Qlwuf5vSBkRBKi
	g0OP4buKpAKCSaPHlF2JJuYZWQuILPsEtJierLqXGLJeuvR1Fs2JkzJtBGusTDlZ5E/oeUyYSEW
	8dxBQB8BJVe9yRYaWpzPDTkV6B9W6cWyXhItVrdnBYNn+SR7pIhLpn4SHc5AYiO5SGhPCFWKvte
	QPJKy+QpTlSOjeLFV/86U/OpqXBdBsGE18nFBjcZXHfFduhEWI+m6UhS55TlGwUcLTUW0Xs1kJ/
	aLElaLdO6JDLQ/lxnJ9YIr2lz4XA9h36mouTY4qvxSxIcJ/Ctlqk33xg5PWdG5E3TOwkXr0IkC3
	q9mtbYZlTEXpbTbbnYgwx/fL67cCavgJ5xYEJB1o3ItIc/V2BprMo3QZ4W4o+wOcTO1fgHaF8W1
	9C9t1H4FsRF9NZXKaZAMkWb9iwDLQGZyzv7Vil0YLF4bHA8PxZ5rqWQC9rytwQyHi/Awfp0mZwM
	iT9+vT2IfXZhKym6wJMiTyBjJJXiduKX7Mc3hzaajtY2w==
X-Received: by 2002:a05:622a:1cca:b0:50d:8792:b6d1 with SMTP id d75a77b69052e-5173a7d90bcmr179325091cf.38.1780372766150;
        Mon, 01 Jun 2026 20:59:26 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm7933791cf.4.2026.06.01.20.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:59:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	chleroy@kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE)
Subject: [PATCH] Input: xilinx_ps2 - replace in_be32/out_be32 with ioread32be/iowrite32be
Date: Mon,  1 Jun 2026 20:59:07 -0700
Message-ID: <20260602035907.623599-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_205927_681391_6182A533 
X-CRM114-Status: GOOD (  18.15  )
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

Mechanical conversion of the ppc4xx-specific accessors to the generic
portable helpers.

Allows enabling COMPILE_TEST for extra compile coverage.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/input/serio/Kconfig      |  2 +-
 drivers/input/serio/xilinx_ps2.c | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/input/serio/Kconfig b/drivers/input/serio/Kconfig
index 5f15a6462056..60d886631c42 100644
--- a/drivers/input/serio/Kconfig
+++ b/drivers/input/serio/Kconfig
@@ -190,7 +190,7 @@ config SERIO_RAW
 
 config SERIO_XILINX_XPS_PS2
 	tristate "Xilinx XPS PS/2 Controller Support"
-	depends on PPC || MICROBLAZE
+	depends on PPC || MICROBLAZE || COMPILE_TEST
 	help
 	  This driver supports XPS PS/2 IP from the Xilinx EDK on
 	  PowerPC platform.
diff --git a/drivers/input/serio/xilinx_ps2.c b/drivers/input/serio/xilinx_ps2.c
index 411d55ca1a66..7eb96375b515 100644
--- a/drivers/input/serio/xilinx_ps2.c
+++ b/drivers/input/serio/xilinx_ps2.c
@@ -89,9 +89,9 @@ static int xps2_recv(struct xps2data *drvdata, u8 *byte)
 	int status = -1;
 
 	/* If there is data available in the PS/2 receiver, read it */
-	sr = in_be32(drvdata->base_address + XPS2_STATUS_OFFSET);
+	sr = ioread32be(drvdata->base_address + XPS2_STATUS_OFFSET);
 	if (sr & XPS2_STATUS_RX_FULL) {
-		*byte = in_be32(drvdata->base_address + XPS2_RX_DATA_OFFSET);
+		*byte = ioread32be(drvdata->base_address + XPS2_RX_DATA_OFFSET);
 		status = 0;
 	}
 
@@ -109,8 +109,8 @@ static irqreturn_t xps2_interrupt(int irq, void *dev_id)
 	int status;
 
 	/* Get the PS/2 interrupts and clear them */
-	intr_sr = in_be32(drvdata->base_address + XPS2_IPISR_OFFSET);
-	out_be32(drvdata->base_address + XPS2_IPISR_OFFSET, intr_sr);
+	intr_sr = ioread32be(drvdata->base_address + XPS2_IPISR_OFFSET);
+	iowrite32be(intr_sr, drvdata->base_address + XPS2_IPISR_OFFSET);
 
 	/* Check which interrupt is active */
 	if (intr_sr & XPS2_IPIXR_RX_OVF)
@@ -160,11 +160,11 @@ static int sxps2_write(struct serio *pserio, unsigned char c)
 	guard(spinlock_irqsave)(&drvdata->lock);
 
 	/* If the PS/2 transmitter is empty send a byte of data */
-	sr = in_be32(drvdata->base_address + XPS2_STATUS_OFFSET);
+	sr = ioread32be(drvdata->base_address + XPS2_STATUS_OFFSET);
 	if (sr & XPS2_STATUS_TX_FULL)
 		return -EAGAIN;
 
-	out_be32(drvdata->base_address + XPS2_TX_DATA_OFFSET, c);
+	iowrite32be(c, drvdata->base_address + XPS2_TX_DATA_OFFSET);
 	return 0;
 }
 
@@ -189,8 +189,8 @@ static int sxps2_open(struct serio *pserio)
 	}
 
 	/* start reception by enabling the interrupts */
-	out_be32(drvdata->base_address + XPS2_GIER_OFFSET, XPS2_GIER_GIE_MASK);
-	out_be32(drvdata->base_address + XPS2_IPIER_OFFSET, XPS2_IPIXR_RX_ALL);
+	iowrite32be(XPS2_GIER_GIE_MASK, drvdata->base_address + XPS2_GIER_OFFSET);
+	iowrite32be(XPS2_IPIXR_RX_ALL, drvdata->base_address + XPS2_IPIER_OFFSET);
 	(void)xps2_recv(drvdata, &c);
 
 	return 0;		/* success */
@@ -207,8 +207,8 @@ static void sxps2_close(struct serio *pserio)
 	struct xps2data *drvdata = pserio->port_data;
 
 	/* Disable the PS2 interrupts */
-	out_be32(drvdata->base_address + XPS2_GIER_OFFSET, 0x00);
-	out_be32(drvdata->base_address + XPS2_IPIER_OFFSET, 0x00);
+	iowrite32be(0x00, drvdata->base_address + XPS2_GIER_OFFSET);
+	iowrite32be(0x00, drvdata->base_address + XPS2_IPIER_OFFSET);
 	free_irq(drvdata->irq, drvdata);
 }
 
@@ -278,13 +278,13 @@ static int xps2_of_probe(struct platform_device *ofdev)
 	}
 
 	/* Disable all the interrupts, just in case */
-	out_be32(drvdata->base_address + XPS2_IPIER_OFFSET, 0);
+	iowrite32be(0, drvdata->base_address + XPS2_IPIER_OFFSET);
 
 	/*
 	 * Reset the PS2 device and abort any current transaction,
 	 * to make sure we have the PS2 in a good state.
 	 */
-	out_be32(drvdata->base_address + XPS2_SRST_OFFSET, XPS2_SRST_RESET);
+	iowrite32be(XPS2_SRST_RESET, drvdata->base_address + XPS2_SRST_OFFSET);
 
 	dev_info(dev, "Xilinx PS2 at 0x%08llX mapped to 0x%p, irq=%d\n",
 		 (unsigned long long)phys_addr, drvdata->base_address,
-- 
2.54.0


