Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D746BEFCE20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6+ERZG98Y+SteZfiVlR3jzzX4R2QxjyojMlsxgWSx7U=; b=g2O6i1nWSfrVRADWrxf30TR4dr
	TMM1MN3lWOlGxfOZkQMke8p+Svwg/mSTO0lhy+pKD4tJjfFCfaQZCgiiPKHiKPPdbZvT2hhsNOqDQ
	VNN7pYNdYEBUIKmz26LHTujSFhUTZM5Xg1o9CK+i/L59iP22+x57KuMJijcSssozYbLJ+VLThekmR
	nnRKP+i0x/WM+TmoMmQAjQDqnmNbILVLG04jyV5YDFIwYymJvTGcBOAUC6lIdHwMYqWXE+OUNdEFd
	sYDg4IOYNsj2dwwkLAcLg8ifnOq59AUhenz1AbgmHe8SMlTpLIFvu6Znwdo933rqDl5yR0mgWwUZ3
	hCfrl7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpkz-000000008r9-2zrb;
	Wed, 04 Mar 2026 17:11:33 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpkv-000000008mM-0dPn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 17:11:30 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-439c92a193bso860014f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772644287; x=1773249087; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+ERZG98Y+SteZfiVlR3jzzX4R2QxjyojMlsxgWSx7U=;
        b=iRofe8kHMs7c6izuCQpDRUCPtW9OC/SZrxViZ2NP/OIsgZWpI/lmRfK9zYdb71iObw
         4AZsQ+voZlAzuziyUU2EsgQCOJORbKexvDE44atPwnuQpD4a2Af1v617VxIs5fAk/bUn
         AlNm1UQNJaz0ml9GFUWjm5F/6ReS6zUTyEaukCZTbInQyyr2sL/hLCxd4/14GJj03vxj
         3JAwsKYpq532NEQNtvgVmNoITn8SVoqnPT+wXB4yKyuiT7t4hebrOuI29A24SQ+LSthz
         stEnt2X67GjvKBuGnyvqFGWYM5z9t3fXBowmlsCIYoKntwOuAWSOVoDqhe/eG9SRy7f6
         rsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772644287; x=1773249087;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+ERZG98Y+SteZfiVlR3jzzX4R2QxjyojMlsxgWSx7U=;
        b=ruvZex4ta3Jv5MuurwhttC7SwkmRvE0pqNL5bzSjE7/kVUineOTs3CYJ7e5Nrv/2j0
         0SSIiigYwZCBPjQ9yCPjqB/NWH3J1s+0UehVQs0koKapWr2hy8MWHatLPUo3zgj4H3gq
         3g4mFXa5aEyJ9v3E27mfYS5mpcf2UaFijAuNnJsBUMw2Q1FSSfOeXMJynJG1r/ZQKG25
         ujh4t2y8yg/mOnBZeB3gsv7zETrZvc72LONl6FKnBZ04VLEkovxaYwb8Bd44fNVQrnUl
         B+W0b9gjzhOfsO86vb67ZUHJ3oMnSsfZtkqIyT8jgqzS8KqbKsfp6ZTObA3dh7dJ+M9O
         z6Kg==
X-Gm-Message-State: AOJu0YxRZtQD/20GfGkGClMURM/v/TX+EkLZ0aXtPFX0mQXoqq5gO7XW
	01k2CB21a6glotLBuZelC7sHPFxlPZHUgR+/Jb5pm+0cCf9aL1mfPDn5
X-Gm-Gg: ATEYQzw0RJ+NXng31j5RUUATMJanPPDSevlDQkF6TtJ3g01sifyXDNcCCQ4i9VwJ9CK
	xwYDKLgT5sGF3nSW7F45dRWKoKeo67cxf1nYUiOrjkl+SICTAPxHhW2u6/6AlukLw65kMqNjHVO
	f9bi7UEb4F9g6QSjU/IICX6LnORc3H6c4h5Ln25bgMZFhR529zKjMtU+T/U7dcmyhEmCUqlsayu
	mlP/XSAqV1+BbqC13/YVCnFAib++fBmrVMqyNp0JEqqGstCu5h+xEk/CcQDDM6v5lYvviwgcX8C
	Tz3oaiFASu4g2Zas/uABqWB/yISHB6Tp35xmN+1dI/H4p8q9AF/8SM1WjAXalwHZMukwZJqPauO
	SZwGqUSzcyVFM8+IMLndXzsYE0JyempeSYtNUhsfh2aIC6cbdJVLLmHBXa+OY7CRuEiVLC0EBT5
	lLcJ4yk2Mz4EhzzmvnWM72T8fWQ+jwDA==
X-Received: by 2002:a05:6000:2dc3:b0:439:bf38:16f7 with SMTP id ffacd0b85a97d-439c7f7e3aamr5793716f8f.14.1772644286733;
        Wed, 04 Mar 2026 09:11:26 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3007:da20:bc65:66ea:698d:4a44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b130abfasm27138542f8f.34.2026.03.04.09.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:11:25 -0800 (PST)
From: Amin GATTOUT <amin.gattout@gmail.com>
Date: Wed, 04 Mar 2026 18:10:42 +0100
Subject: [PATCH] fbdev: wmt_ge_rops: use devm_platform_ioremap_resource()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-master-v1-1-2bfeb1b9559f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJFnqGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNj3dzE4pLUIl2TlKQkYxOTZMtEY0sloOKCotS0zAqwQdGxtbUAA9j
 Lt1gAAAA=
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Helge Deller <deller@gmx.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Amin GATTOUT <amin.gattout@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772644285; l=1961;
 i=amin.gattout@gmail.com; h=from:subject:message-id;
 bh=fvm+1TuVEfBZgWEioDiGHAQkV9PHuQ2+SLQAWe7HMDg=;
 b=iKDzURGU6c9p1RaVBuYzo76POHmO10cJlkMXVJt7qWoZi/pfdEawYK9LwvspVtgF3iSrXLohY
 M5lAcaB+zeECKSvVIgxHTKrJ37eI8XvJ0JFwlCpZmwOaJkDiLWf7nBg
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=C9HM6Jf5d9dPl9fnP9pM/nhMwm+c280ldqYZ0ESu3a8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_091129_215118_A9D49C2D 
X-CRM114-Status: GOOD (  14.94  )
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

Replace the open-coded platform_get_resource() + ioremap() pair with
devm_platform_ioremap_resource(), which requests the memory region and
maps it in a single call, with automatic cleanup on device removal.

Also reset regbase to NULL in remove() so that the single-instance
guard in probe() works correctly if the device is re-probed.

Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
---
 drivers/video/fbdev/wmt_ge_rops.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/wmt_ge_rops.c b/drivers/video/fbdev/wmt_ge_rops.c
index 2bd26bfb2b46..0cf78bcadfa6 100644
--- a/drivers/video/fbdev/wmt_ge_rops.c
+++ b/drivers/video/fbdev/wmt_ge_rops.c
@@ -148,25 +148,15 @@ EXPORT_SYMBOL_GPL(wmt_ge_sync);
 
 static int wmt_ge_rops_probe(struct platform_device *pdev)
 {
-	struct resource *res;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res == NULL) {
-		dev_err(&pdev->dev, "no I/O memory resource defined\n");
-		return -ENODEV;
-	}
-
 	/* Only one ROP engine is presently supported. */
 	if (unlikely(regbase)) {
 		WARN_ON(1);
 		return -EBUSY;
 	}
 
-	regbase = ioremap(res->start, resource_size(res));
-	if (regbase == NULL) {
-		dev_err(&pdev->dev, "failed to map I/O memory\n");
-		return -EBUSY;
-	}
+	regbase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regbase))
+		return PTR_ERR(regbase);
 
 	writel(1, regbase + GE_ENABLE_OFF);
 	printk(KERN_INFO "Enabled support for WMT GE raster acceleration\n");
@@ -176,7 +166,7 @@ static int wmt_ge_rops_probe(struct platform_device *pdev)
 
 static void wmt_ge_rops_remove(struct platform_device *pdev)
 {
-	iounmap(regbase);
+	regbase = NULL;
 }
 
 static const struct of_device_id wmt_dt_ids[] = {

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260303-master-4dbb344c9a39

Best regards,
-- 
Amin GATTOUT <amin.gattout@gmail.com>


