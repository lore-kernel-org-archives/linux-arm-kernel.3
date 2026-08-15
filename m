Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142D3C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UM/qY+57O2WGKIidD8uuvpNNv07GGWbHqFgymg7+PkQ=; b=ohLrlUy0dzNRTnfjSJoR9gcuGe
	srY8QMYPpOsfzIVFUqo7rlQHc/fW7u7HFl9Bbxds5XtXuUrTQFpZNVUI9yWhLo8Sj9SGEjgjeDWEz
	6PZOFOPf1Z8ihaMYVtQEOqJxFZT8SoeoRA5gmqusFenWj2eTiDvj8fGzpcfdf7sfc569Xbhvvw+VM
	d3a8j392X8LHxblAPDHFos8bhs7ZdJyv9ROTe6BCgpSN+JIIVWs8/rK//778V+tnuWvBU/kKB+wHb
	P0TeFSMXAcXNuy3Y+/imCJC2lqQDnSUMlpjOtqEOl8aiMWaRRslFDrNk92sBaZ5j23Tydgu3ef2nt
	9oJj2DDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvG8a-00000003uK2-118l;
	Sat, 15 Aug 2026 15:17:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvG8X-00000003uJW-2wlY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 15:17:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2caced6038eso22631475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786807048; x=1787411848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UM/qY+57O2WGKIidD8uuvpNNv07GGWbHqFgymg7+PkQ=;
        b=EQLGH49aOpR7ycpARZ66TsohL/O2Wz/nUH9oOLsBGDOocQnN4P0CH4JQhzJVAkLXps
         dg0cmK8A68SGVaJENnrFW/DqKhYsQWaZOmem5kiuXdpF2PuIk8nM6YilbfNpX06X3Bj6
         nby4M2bh6OEMpqL/rJXmatGI9iIr4DWlozFusxpwt+yTy3oXvML2x7shj9XdJWFc7izm
         WWTxGF7SsMfniJrAiuyD7sitX7iKQ8DcJHsModzwxLv6CpWLNyMekw+jZvYlDjQ8UWh9
         yZxg2gT9LJK0xBj5vgmOaQPUWbxm1o/rTnCB7e23EZqZfRq4A+wk19Ujo92r6e+8fQGI
         l8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786807048; x=1787411848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UM/qY+57O2WGKIidD8uuvpNNv07GGWbHqFgymg7+PkQ=;
        b=cNCKAly2Ao5bO7eLheguHjSmQpLNuoi1Y7wi919zrHjBoErG6pkAEoEL+PiMVGqtYQ
         k/AjsBY1+UjdO6KMvXPAviABb3dEryWUI/cXK6cMiaLstaWXxLrMXziiBfcPi4HCF43H
         dich1YQiXYDJb8xGBSt0EsRP1ga1W+YZk8QCxX5WpxIOaaCU7toNNUMOT0aJrJm3P/mm
         bVTYDweLx+MWfU1qNd0cM/1ocaSpqarHg5Vi3maffpSR5ls3du04BpojsaBJ5NPpTKFW
         Sgj7u1iek9K27cTBR8QaQ+adRNVncyEV+GGJGvcNSP4CfmlMkn5TouwttF3qglcjevuC
         ZRLA==
X-Forwarded-Encrypted: i=1; AHgh+Rqk7NGB7LboTyEp4QtPN988DainrFiQrMvbft1lGXHqbYPwH+PnSp+3w1PvFUZPoy0UyFmkadfnOMGHdXitwipN@lists.infradead.org
X-Gm-Message-State: AOJu0YxHehuVilgoYNcHDz3YfQisJGpiBcIskk1RDErn3C0Aii+T00cA
	LgelecGqG7U0eFHE+ZdM6uUNsYYTofDv/HYeZ0onXSJ4LASgORwh4Wh7
X-Gm-Gg: AR+sD12pjX+wSD1HrXSSGcIab9/SjKTrNBNihR6rcYDW5Pc0rqfyKeVTexCAQqHd7j9
	iw+4rZyKJj1EZT9lOE73EwAWXbBPKKHVbVYF8/qWMaZ+VG6m8oWhMUOujuFehWQRrxNb+wHsm/w
	jgp2jrjwsoBxMDrYk0sNhoim/U1s3MwVAQvuHjtv2/XfIqOfsaiS06MvaCl8MN00EFf61IW2Te6
	L3WAOSmHTMYyFXUxkfc1zz2YmzhreZ+QVtAi0+yM3DH4GBBdVOZUKjGvPZAAenlpR7QmfSansTg
	Mr0VDanxB5h2ndYx7BsvfdbvWgRbrW9KWWVjC6dpoIpMBmZP4SGjCpHT8FcdI1AbM7NZKAJTOgg
	7ZLWNquxhrIxsU0bhGzmrRT9HSS1cAnfHKBFJjtJKG7DAj0bS+T5z4WcpevJaGzlik1Wp9fLCkQ
	iFE1gjzpoOy3MC3R4FRnpDXpWNjQZQS18+0sn9LYU/df01RA+x9op8GRaBWO8cNeuq4gVeuuxqp
	kuIgizLMg==
X-Received: by 2002:a17:903:15c3:b0:2cf:b9f9:18bb with SMTP id d9443c01a7336-2d3afdacabfmr116123305ad.4.1786807047906;
        Sat, 15 Aug 2026 08:17:27 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:5225:2a2e:8e7c:13a7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb88bddsm19887805ad.63.2026.08.15.08.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 08:17:26 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v2] i2c: mxs: fix DMA channel leak on probe error
Date: Sat, 15 Aug 2026 23:17:20 +0800
Message-ID: <20260815151720.3757460-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_081729_748551_1E10D75D 
X-CRM114-Status: GOOD (  14.84  )
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

mxs_i2c_probe() requests an exclusive DMA channel before resetting the
controller and registering the I2C adapter. If either later operation
fails, probe returns without releasing the channel because the remove
callback is not invoked after a failed probe.

Use devm_dma_request_chan() so the device core releases the channel on
probe failure and driver detach. Remove the manual release from the
remove callback because the channel is now device-managed.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 62885f59a261 ("MXS: Implement DMA support into mxs-i2c")
Assisted-by: unnamed:claude-opus-4.8 typestate
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>

---
Changes in v2:
- Use devm_dma_request_chan() instead of explicit error unwinding.
- Remove the now-redundant manual release in remove().
- Add the Assisted-by tag.

v1: https://lore.kernel.org/r/20260814134033.1386874-1-ruoyuw560@gmail.com/
---
 drivers/i2c/busses/i2c-mxs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 4e07babea9c3f4..eee4fdcd9df31a 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -839,7 +839,7 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	}
 
 	/* Setup the DMA */
-	i2c->dmach = dma_request_chan(dev, "rx-tx");
+	i2c->dmach = devm_dma_request_chan(dev, "rx-tx");
 	if (IS_ERR(i2c->dmach)) {
 		return dev_err_probe(dev, PTR_ERR(i2c->dmach),
 				     "Failed to request dma\n");
@@ -877,9 +877,6 @@ static void mxs_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&i2c->adapter);
 
-	if (i2c->dmach)
-		dma_release_channel(i2c->dmach);
-
 	writel(MXS_I2C_CTRL0_SFTRST, i2c->regs + MXS_I2C_CTRL0_SET);
 }
 
-- 
2.51.0


