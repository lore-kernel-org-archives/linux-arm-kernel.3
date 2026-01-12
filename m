Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A834C9EC93
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ckmRos2OAgMm2H7B68f5iy8S3ZBKtjS9ZYbxKUXmKoY=; b=oCNt7iOy/cgAgc8EXcx9OXatNR
	vRM8103pvrk9OLKt9sJlZYv7vmcrH4+Ojgjq4proCp9OdUZzCvnzcu0MiRwna/DUtTzi4Uqiuv4n1
	MSl5+VDL2W8XUOZm2xqjvotGXRM8UwMbhPgeYli4dnf91HYfDnhPDXd+mmPV9yYTXPDck16hyHASh
	TG1aTq9Id5nidkfnktwUuqXLaEFevqwxJe+LcKE9omU+A0gn86CbgvQgC2Q7KxGBolJZZ3fw66cDg
	9LUEonn5qODp59qIM8tJoHB4jzxHwdZl+jNUwxEs3RbjW3FWdVxaSFCv7gU9+efBevVq5tUTVIJs+
	rcNVbeVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIX2-00000005U8v-1WJy;
	Mon, 12 Jan 2026 14:04:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIX0-00000005U8L-0Mrc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:04:31 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42fbb061a08so220178f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 06:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768226668; x=1768831468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ckmRos2OAgMm2H7B68f5iy8S3ZBKtjS9ZYbxKUXmKoY=;
        b=AnUh0CiSJtHMxrVuzlSrhgDyAVqSowWoZPg23zwMtYpjW1R3N31ArYMW7rELJqBdT7
         37ER82oTVqaLl9iSr4o40KQsm5Dk0+YpcE7MLNaLzKfXE0AvICE+cpbyYVmPIbdfvn93
         qe/TD9byUbrXzX10FeddxrHWjZe/+j5w6YnaPE+04jZ8rpDTQiwCdBm8AtMXCS/M1nlV
         QDfDLcF0cp2Hi9LjDw7X1Rmd7WlvtPi/onLLgz/93ed9YfWAdcslfILY/z45qCJgfCYm
         w02dRX3Z5/qWK6IcpNmSYCQQE09p1HRBsv3bVpJgwAqL9tLtLBjN37vQnForAT0xr9II
         QzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768226668; x=1768831468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckmRos2OAgMm2H7B68f5iy8S3ZBKtjS9ZYbxKUXmKoY=;
        b=GEfd1JpkNLWuVAjqGdUU7HjhpgUGwbDDuraIlPJRPAxjDn6E4a5RdZzmC8SLDYv708
         rVi3UoNNlno1DFm9oMuBRatsWCL3nQaRFQZpNTNfC3bHTo1O3p1z+cWOAr3y9m8MWDUV
         68extwfYHdjyUhKdYvShrHf5/jLO04Wc4ut6uhEeFsPGZ6nWci2Ta+AGXDGqAm0pfZXP
         hJHJhXUQEu4a/Y876Y+yEYgYl+d39buJIMMrZDwrhqIrLbjC1Emx8U8whA2/QQB1yUPB
         RzqcyZaDXm3dmR+MV5yzqa5dVNRsuuu0jz/81JCO9ieY7jocUVFbZ8/xtIgqdEZ3Y4Cn
         Bb5A==
X-Forwarded-Encrypted: i=1; AJvYcCVrbkp750xhuj2eLR2aVDfZ7Clbf8uaaUWS4NcyX+Ak6tYirgsdcthvz2TbtQR5TiqQtXTrHyKexhXTsjWteOoe@lists.infradead.org
X-Gm-Message-State: AOJu0YwRQcAGVcst6x3+y1mOZxf/mEbejnVzufkGEInK/L0HHXP7kyG/
	4fWb6/pQd+VnFwcRyvFOHuY1mSJpX4bPxn6Rr0sYQ5V5Kr8d9H5dc+wo
X-Gm-Gg: AY/fxX4A5Yp0KQmxTZS7Qa1x4Iy/ON/IFsnuTJYMFdz78wxVxGItpIESMRARUw5Es0J
	vf07ISmfRNojOMHhuzewckhgAFRGpy7npPZkDR0A0zG0gxVl/Aq3e/6JBXqTTYvCm/p7jFOi7O+
	CvIx4ozIEbia1zm9tscNkkTwim8c7uxFHj5oluA+d/b/2nxRnJYsf87znHQizpcpT1PcL8z5ax0
	iI1VGVkvqcrRKTS+3a7sqjw+RpGt+iTNjhL05ziE4uz2hIsmPJClbvWWzzyCI2l9qqq7try8Fzi
	rmlwwSwwCtAeZYLMxhPuwOh6wWmEUpC7fnRmhnMaAqNWv/NTmtYfpgHu6zbYvmwGEOGTttIvDT/
	2CD7t0vlYmIC51z8cJnI5JVZ7qGHtQtBcFV8IDr4sVq7V/HChwy4bzEHBNXpwQ0E/8UHZp6gM4U
	zW+sFJ9K0GvuFtEjz0OMaUntNftK98UEXDAHW3rchlGj6JHdkPsAsETPZnQ/hg/cyd+fJ6DDR8k
	THvxn4=
X-Google-Smtp-Source: AGHT+IH7GUSAAsNDPqrKUndihq0lAKqsPDKz3kaDifL2lP8tPCtWl0A1pugqhFaqlY9nRll5jZEn6w==
X-Received: by 2002:a05:6000:22c1:b0:430:f718:23a0 with SMTP id ffacd0b85a97d-432c39ded43mr12214129f8f.6.1768226667344;
        Mon, 12 Jan 2026 06:04:27 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-215.paris.inria.fr. [128.93.83.215])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm38643537f8f.25.2026.01.12.06.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:04:26 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Tony Prisk <linux@prisktech.co.nz>,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: vt8500lcdfb: fix missing dma_free_coherent()
Date: Mon, 12 Jan 2026 15:00:27 +0100
Message-ID: <20260112140031.63594-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_060430_139582_6C043BC7 
X-CRM114-Status: GOOD (  14.66  )
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

fbi->fb.screen_buffer is alloced with dma_free_coherent() but is not
freed if the error path is reached.

Fixes: e7b995371fe1 ("video: vt8500: Add devicetree support for vt8500-fb and wm8505-fb")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/video/fbdev/vt8500lcdfb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/vt8500lcdfb.c b/drivers/video/fbdev/vt8500lcdfb.c
index b08a6fdc53fd..85c7a99a7d64 100644
--- a/drivers/video/fbdev/vt8500lcdfb.c
+++ b/drivers/video/fbdev/vt8500lcdfb.c
@@ -369,7 +369,7 @@ static int vt8500lcd_probe(struct platform_device *pdev)
 	if (fbi->palette_cpu == NULL) {
 		dev_err(&pdev->dev, "Failed to allocate palette buffer\n");
 		ret = -ENOMEM;
-		goto failed_free_io;
+		goto failed_free_mem_virt;
 	}
 
 	irq = platform_get_irq(pdev, 0);
@@ -432,6 +432,9 @@ static int vt8500lcd_probe(struct platform_device *pdev)
 failed_free_palette:
 	dma_free_coherent(&pdev->dev, fbi->palette_size,
 			  fbi->palette_cpu, fbi->palette_phys);
+failed_free_mem_virt:
+	dma_free_coherent(&pdev->dev, fbi->fb.fix.smem_len,
+			  fbi->fb.screen_buffer, fbi->fb.fix.smem_start);
 failed_free_io:
 	iounmap(fbi->regbase);
 failed_free_res:
-- 
2.43.0


