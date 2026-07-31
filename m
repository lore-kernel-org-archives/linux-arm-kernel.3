Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C31C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDzVbcLKcPv6oSc5KVtpGnThTEkbSjdGeapuLqqH1HI=; b=rnSk2XAoRURaHZNa8/c11qJY8P
	ohtKzO7n+eofGFkT14hVFcLDd8C13gIDRpeMQArXATTxOAGnxWmwV2/MM+7qVblZWLGfPo5d1M8eu
	OpzjC6Yh7shr9orAJI4wU0570tKAOH15mSUZA9fsMl90CyhMwUJmNxzqyZ/BYGTdzJmyWgrbO943l
	lVQ+xQNo2IGkeX0awdVVz+xwFTQX0l4Zf6i7bPyazGqHlVBGXexzD3/0lvmszQ85NX6AKe/TGtD0x
	JE0VHDiCHGAfQKnDvsn5hOvZU1pDd8I/N0JCQdTyVZGZM0SgCBy53IH8ws63n6PKUAcGlM+n6y2CY
	oxRWrW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpruE-0000000DM4c-0nqy;
	Fri, 31 Jul 2026 18:24:26 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpruB-0000000DM3V-3pGd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:24:25 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so1006137a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 11:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785522262; x=1786127062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDzVbcLKcPv6oSc5KVtpGnThTEkbSjdGeapuLqqH1HI=;
        b=DnDe0LYc/RiFIjBNcST+6ghCPlXUp280Bqx/nZq84YoXPt7Ov9HL10lhRaioXjxDTo
         v6+SyYlefCAi4gXxt+VHD+He6MoT6oBkpGYQ31L7X2oZC0hZ4Z3JFPWiz4PtfnZFaUlz
         6QTfWa2lGIQVKTIOrrYVP5yhI6x4PXaPJ0Z4ibOkVKuzgtE6yg1Pmna2TF3BX2YiDQYB
         KhaGmmRk1/w7GO4gsskh97JeDFnOAxAWFefCJMwIYnpuIC3s93KMiosswPP5gOBkV/ba
         x6VNkE5K84kn0cfW7h8WJrzMQs2Y2pStsbKEgSroZraHDoRlWIvaUb1e1O4GoGfIy8bs
         io0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522262; x=1786127062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDzVbcLKcPv6oSc5KVtpGnThTEkbSjdGeapuLqqH1HI=;
        b=EojR7UqQb+IV2qOjms/x1f3Fg/G9IARTvZwybjFVG8sBLRf5Ci+9qVrQY7Kz1blqqr
         nSS7apsKSEMrzejDAOrQvk28hVFawf0AcYqjR91VqBHT4VwvizJ70nh+bjoq2spf3EeI
         4f6JPOpT1ASsmhk0IFeHN7z9pen2RnVmHcb4wDN/0iW5Vt5+tcff20x/1ilZe185rzdS
         df1SUmXndNU0QFRH92sBR1QMOFSMncGYSIsDVjmeGYKAWlL5PEQHBQRff8eGMzoJuuNw
         FS64YUybiDPPlbLIsd0YvWGn5Ziy1dMzJSEiKcdETEAwo1qESETsEB/D6Mlytgzi/78R
         6Pow==
X-Forwarded-Encrypted: i=1; AHgh+Ro8X5MrhD0q6mtcJjrPU6Fo2upy8Oo3j1V++kSMxltHm2d6aFEPEqLzB4Q555F49Evjiwneoj6MMR505GLsGSTN@lists.infradead.org
X-Gm-Message-State: AOJu0YzyuDv1m9kfgVcNhV26GufMHjKNpCBG2DTYnAkkEkF+Pssy+B1m
	edNCOIvZdl0+7evbtzDgA31KTqyichLCod5LZI4YOCnslg1RsmQbg6Re
X-Gm-Gg: AR+sD13hD9CnX/dn7Mq0wgvL1X899+u4KXe+yxv0t7PWKcR+IZ4FLNEecG0E+NuFiyV
	+9pMOsIOIQjVZ5AMYyFIDOJHDXtZaNmKzNrqXt2GtgXKFz2+n4GJx2ljutec4olfrFVOQBhuJQN
	jhah9ewckTHj7DvWq16AwXhi5b7mwwp8J6ukEsj0mAi59xtuRaVSkVVU74Zyl5TfyQnX5M6wFK6
	t0BNlmIXvbyl2PBk2U95ei0Fkhgo2pu64cSZSLpM+pYVNfbuaEf1NCIGQAkMC7bIi07GoHd1+lU
	R6iC+gwol2nXQAxuMUEK9l/vIGfKGz81E9Ex0nbWnphhiJb9v+CIrEp7F0w7GJl5SbrDusGcvVY
	HDj74iM4KABIj/lYJfNi9I4p7p7SZm6wkUHyHEO0Yi54hzAbK1gU2AeHTtIldmBOzQMFasvA+UE
	CqxcXPOKLfEwa71vqz44jMVTzWoCjzV+YUZr3nQcVk4KOdG0ZU6LLvZqeQzl0=
X-Received: by 2002:a05:6300:6684:b0:3c3:c080:71ca with SMTP id adf61e73a8af0-3c92a26b14bmr795433637.0.1785522261990;
        Fri, 31 Jul 2026 11:24:21 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:d69c:7f00:28b4:311c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c1casm8400785eec.10.2026.07.31.11.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:24:21 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Joshua Crofts <joshua.crofts@broadcom.com>,
	Broadcom internal kernel list <bcm-kernel-feedback-list@broadcom.com>,
	David Lechner <dlechner@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v3 1/3] iio: adc: bcm_iproc_adc: Remove redundant error message after devm_request_threaded_irq()
Date: Fri, 31 Jul 2026 23:53:45 +0530
Message-ID: <20260731182347.42888-2-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731182347.42888-1-mdshahid03@gmail.com>
References: <20260731182347.42888-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_112423_962289_1C3CFDF2 
X-CRM114-Status: GOOD (  11.96  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

devm_request_threaded_irq() already logs an error when the request
fails, making the explicit dev_err() redundant.

Remove the duplicate message and simply return the error.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index cf4738b16e62..1b0dd654402f 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -551,10 +551,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
 				iproc_adc_interrupt_handler,
 				iproc_adc_interrupt_thread,
 				IRQF_SHARED, "iproc-adc", indio_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "request_irq error %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	ret = clk_prepare_enable(adc_priv->adc_clk);
 	if (ret) {
-- 
2.43.0


