Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC64C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 06:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEsRntJMT9GLMPPJGd/kwW2aUYHVVekfdk/685HavFM=; b=kssDp2mSIlIYuYNtheNG8kS2b5
	fdHGfv0bM3BZPrF7HKaqIFNugE7Nqg7PCiTjUHvWmWaS3ad43uHYMiF9RVTeZDKZgfNw0AIWrCV4o
	8sf2HNXY6AzamkvSBrhB5lQu053ioD2knd2NOvpj3I0yiAmFjQ95FUoixrxFtdGnaVssq2x2QARcA
	ylmDHAeZOqAltjMl/ZARYPLsSX8iitNLKJlnzI8Y7UK5Py4dZDzpyuEwBlzKlMuKbTKEWVdNRetOK
	UVhjVtPPXBUFBydn6guRZmnQIaIcalg/pf3fixIWKYZB/S0foZiX1p2WYnDQXi2zWhV0fBnufdIBq
	oO92tmXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEVq-00000007CPa-2PfH;
	Fri, 07 Aug 2026 06:57:02 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEVo-00000007CP4-2PIA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 06:57:01 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d032846c95so38405085ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 23:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786085820; x=1786690620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NEsRntJMT9GLMPPJGd/kwW2aUYHVVekfdk/685HavFM=;
        b=UQbbFJ0kRvUF664sDqroJ5AFyHmgx7fIDVadvEhecvV3N4KwotNzCpBidvOC8PHwPZ
         yGnox4v5b2y+k7I3BxW789k4in5vi5xzAJOCiyoBDmokf0M93lWt5MMlHJW93I2ysmOZ
         ZQWTUpyD4oH/nBnDBwbcherhnwJfLVbP57iZh/wmFRp8aW8xl2DkVhNqnhwLYKNSLicN
         h75UAMAk2w07m2OI/iwxMoUgwlr9dthO1sOXH7/NChoAtDFCRAPlQAk6nRuwJ52GqgS2
         qOAdXFSKG5FIBj0w3B+r2ixu2Q1ZR2cbpKmCCYWgGLpoCzmef5o4MHyoXc19e9z4Lgqc
         bBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085820; x=1786690620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NEsRntJMT9GLMPPJGd/kwW2aUYHVVekfdk/685HavFM=;
        b=gZd625mQOhd+j7FIHD76+IRVgaFcpQEfil2hg/Excer5ScC1lyuw83GACepQPFvQqT
         ezvHe8FZJkoDg49Y71nfOs1ZpzwLKBXzWUFZ73nmJ4r/hxKsOrTINaipnV07Fi6QSQwx
         yHz3OPQz6dU43XD0HtnKThKFOrK8m1Z78o03JN6s9xOCqa48Sv22dTL/Yq3JYAKhR0l8
         3d0+dXkEHqqSAoTkydJLQTiNud+K02wkFwY0Mw6ZfzxDjFXQhI/hf18GPKGezHh4bBRu
         e52B9VRt0zhzIPyElLXTTDh6iSISmZy/rLN6YHGlLJeRq0WiPQyWLpb2L0pQ4qd4o6jQ
         ZfVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7S5UWDk4cBEl5pyum6rPf3TJEK40jdNITETEWL96c5lvU3p9Vjws3ZJDJ3ZZS+nDema+R5N4X7BX/xsFjYgXK@lists.infradead.org
X-Gm-Message-State: AOJu0YzR25puHNTkU+RYiu/UC72I6R+9/rEUsssMl6XWC9Fohji0Effe
	HBmYdUv/CwVgLw9pWZpYfAUzCs//ByqYER26imm5g2fjk3msHb9Z6+EE
X-Gm-Gg: AR+sD13xIP3RhXkAqrfPdA87kKKgiZ7y/Bg/durYNTKmbqqK9LYBZWR/G8lIg5tSh1Z
	APjEKRnX7CoC607L7nKaEQEUNJhwHCi/ELa8QNw1thrn3hxEwKZ3fgdSJ3268nZwso78YizLSuC
	Ttp3jhptwiQ1wu3lwzeFNfLqZS72IXS8rF1VstbXqmZLRFrhkkTGr/iorOUz5AmPsFrHiOl3WQk
	VfpGw/jyVt/It863dCcdNyUvloXabze9/GMnIkKTdE+yUIzgFLDTsqTZznbsFSModghG7h1ukaq
	3fAjqkmCFr+lEXFgPb0I3JwacUBX5hCZrrJuPUWzGmvIDO+qJT63VWYAzSaE/zBlg0gaCf6veJH
	xevtlEiQghf06IkUJv/155tL+w3spv9sKleDZIGpM4tW1/YJN4KPozJJW8irfIA4yWr0PfbH2O0
	STjt4n2XoJHgurhrz05kpKkYOTy7b/Vr4y1oaPxdxcm7J20GyH1dGgFu/9hQpixklwtLora/ZR1
	ScH1xSOAT4kFaZvV8HLJwJFNXsRBeE13oaIHzVXgnLWNjhzocMelrzf0MBL4UJ9EoCYHqBzaivv
	8PGKVxGKXBy1QXY=
X-Received: by 2002:a17:902:e84b:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2d0ca76a3bamr221579765ad.12.1786085819613;
        Thu, 06 Aug 2026 23:56:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccb0b2dsm4420185ad.3.2026.08.06.23.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:56:59 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: [PATCH v2 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling when creating IRQ name
Date: Fri,  7 Aug 2026 13:56:19 +0700
Message-ID: <20260807065619.30604-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807065619.30604-1-phucduc.bui@gmail.com>
References: <20260807065619.30604-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_235700_616175_8F2AF44F 
X-CRM114-Status: GOOD (  13.19  )
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

devm_kasprintf() can fail when allocating the wakeup IRQ name. The error
was logged with dev_err_probe(), but its return value was ignored and
probe could continue with a successful return value.

Store the error returned by dev_err_probe() in ret and jump to the error
path to propagate the failure.

Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

 drivers/usb/chipidea/ci_hdrc_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 7387c9903e80..ec2280ae82dc 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -532,7 +532,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
+			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
 			goto err_clk;
 		}
 
-- 
2.43.0


