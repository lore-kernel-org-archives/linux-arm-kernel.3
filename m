Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B17C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 06:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6h9TCw8eDVvs4kPXVD1hECd88bCZqNFEXcfZGl9xKJ8=; b=nD1f1b7GeDoQgp1TtNSkan6jCa
	0fYmp72mgOBDvn9JXjdwuZQ+kfc6M7ZFGG01TBmokHnQDmboaenOPLNLRSjg/Cox0VP6G+c9hqxDH
	11yTAfEfrsdqblGVFm/h5NEvncI++QwQF9OF4bxjwUdJB7gE/iiuG5A+JBaMPRzrpo0/TyO7ESs8B
	W9cX5uwZZhhzVLo9TR1X7LYk7ltSvfkaSDbAF4gPxD3SmeTd0kOzP8ltxlFLNAiIup800fv/du13b
	/SI8gOS5NtM8vkwX20IuoZR30RgEyX5YL7ForNgCiST4+7kqNambD3Yph/fns5wYbyIVBDMGsz6MQ
	pK9lMMIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEVk-00000007CNl-1kyD;
	Fri, 07 Aug 2026 06:56:56 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEVh-00000007CNM-3zsk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 06:56:55 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ceab75934dso39510255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 23:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786085813; x=1786690613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6h9TCw8eDVvs4kPXVD1hECd88bCZqNFEXcfZGl9xKJ8=;
        b=sF4sM0ErwAyZnv1+r6b/oMuoqKZgPpgCAZ73xe9iOIhmktX4jQWApeAQRTTMqTOUgR
         NsCl4OJdyY/6r14S+gyhI68ZyqJ1h+UNl2axIvw7S08vKqSAZooKE5WeMbpaujPvJrM9
         HeosbKf7aSOqAUsyqdEJziZYzgFTHvQY1IihR9/p5wsVSZm1/c0lhXirOZhcKYp7bb0u
         tqSUpyFytVGqh88h5COEc4NodiqEnOmkRyXZgQELIGM6VSeDN3HvD3F1pub7+zYdlSu+
         /yovCfyTWb+xJ8w0EyiOY5/RC1Dh8xiTXM+A+BPRXnqPCSzdrvx34pz6FG5FkPBiF1Jm
         nYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085813; x=1786690613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6h9TCw8eDVvs4kPXVD1hECd88bCZqNFEXcfZGl9xKJ8=;
        b=EjYBkygF4Nk8zFGQZe/tyaHoP85vb5HXONKzDdI/clh5JDHfOZhONG5NRpvo37HrOX
         NJqdU4wThNtGfh2crddh063GlVh1c4mbzp+QV3nqhh5KHwMKJKsEHc/of2PNTirV4fO9
         Qr6Eke3L/3OQ5mQxxRC/bKDE2fM9g0Q/XSrLUKK9+U+wj4aWLP4DSYTdjkgVYGhjK/Hz
         T3Ko4htAI/3CIZSNTvXkzSDVfS5Z9jE/zeNO6nfjoe9C3PB0D9TqmwYBouZEeJSlE1zl
         RCUH09SAVOImpirO5V+M2lHyaxLkdz6YqJBuGcowUQeClBMuUOwoWadK/GsaEongnwTs
         enag==
X-Forwarded-Encrypted: i=1; AHgh+RopeLlvMnm4DeZBhZGwiMl0iJAYYNhakjrWZXIYGC+irVJbFda9fmW4WhKlDA9GhVpvZTo8HVNVfP7S4IykK9Hu@lists.infradead.org
X-Gm-Message-State: AOJu0YxYRGhmVj4ebjx8/h0qpVBItcKKUaUkBNismrplhRaygZ2C0gDP
	EiW3+/JxVLxljb5+/DkGp4toc4XpIeNNFkEATV1cBne3i97pMPk/3K9V
X-Gm-Gg: AR+sD12hcoE13dR1191P7QoxKFpvdZA4puHqBWEzLLGf2uOAW+bOTxHlbOW+X0L8xSx
	7Sv7qelxAkECm6bZbzYW/lRHkj7umeREslzJnzAS/gdvGkDvuQHtgEZUlFt5we2lytLV8i+oHOD
	avYzYS/EfQ6z9Id101/FEUFK416hYlFkC07dH1Sf+zAMRG33OWwzCY+1NdpTaJq66BLvqmdKVqN
	yMDkO7//wtD/zHWcovYSoYzMV8SGF/Tkb8RJFIlKH9P2n4MZX4DJ6phFdtX0PFSaaF+TVVzNuut
	1Nq2Q18aAJLmJ3APSGinY7V1fwJnP0pVU43AW9xDpZuWMVRXUIKXBA4yEF2fWStmiPlwxnzj+N4
	bELsJvfvh0bB1ar3Ncs4Pu/c8N6xRt2lnaEE8SOYHHWG13sar5sXN1DWiYt4CX9qKGNuWJB4Ayl
	wT4Z4/C6mkKM1Kr0aquT9tdgNfIOyMgvlN0y5t/HJ+3K5qoqOMC0dW6L2ts00/lUZSsccsWhHIS
	DfdljBkoOqSRphfywHlB7SUQFQBnEa44M2QOg+BFCq3xAfjzeObLzmb7ya/hCHImoCyYjVy3aNz
	G5R0
X-Received: by 2002:a17:903:240e:b0:2ca:f8ef:33e4 with SMTP id d9443c01a7336-2d0ca9444femr245369825ad.17.1786085812605;
        Thu, 06 Aug 2026 23:56:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccb0b2dsm4420185ad.3.2026.08.06.23.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:56:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 13:56:18 +0700
Message-ID: <20260807065619.30604-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_235653_998022_923019A4 
X-CRM114-Status: GOOD (  12.79  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1:
https://lore.kernel.org/all/20260806065254.28204-1-phucduc.bui@gmail.com/
Changes in v2:
 - Update the commit message and error handling.
 - Propagate all errors from platform_get_irq_optional() except -ENXIO,
   instead of only handling -EPROBE_DEFER.

 drivers/usb/chipidea/ci_hdrc_imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..7387c9903e80 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -525,6 +525,10 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		data->supports_runtime_pm = true;
 
 	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->wakeup_irq < 0 && data->wakeup_irq != -ENXIO) {
+		ret = data->wakeup_irq;
+		goto err_clk;
+	}
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-- 
2.43.0


