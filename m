Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB16C982CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=; b=JMYQiP8TN/hWX6PZZPXqTkbJ/X
	QRbl2TAmYA9VDOVcgTU5uZnWr+kYeqKMwATqq+GFnHaRYiMGrDwHP79MBR6SW0n49YEVpUe+cX7Ek
	Abb+HClAoIsXlYDiBCD0ix3jFGO76Yh+P20k9mygtJxwbiC0Y5C6CillxNMAUR5Yg5qm97/Va+ntW
	28HYSv1/U/wcqxr8WEie2AnYv+XtVP7UHnx3Z4PWUoJHgyjcrJD8dpRV7dDL7yAEIfFV1PMubzjLR
	T7icXaBsEQwqThu8KfcOq+qKpMhrbqGjjlT4tSK7rlyRqtp9OTQWLl8nQ3dA9H5XiQt0TcE9neIbY
	4JPJLh6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rYR-00000009aBy-15cn;
	Wed, 16 Sep 2026 15:28:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rYN-00000009a9a-2IeL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 15:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=; b=M5hQIzbD8EFKUNebMGskGQ5Ao5
	i93yACByzWY4+8jcJClo5VBJX2SBLHEpedewyQqqRr1tzSRiwfkbBpbK3hRPxkSg9KrDlckp7zNIO
	2oQZzYUV1i8EhsKpk7jvWBc55VfXPLY3UXOC98yEahq9Zmw5v/9fht0cwzFsO5Gu2IdCW+okxd3/o
	uBK2Ci7NvZFjjrxAgm8o8j1XyIjqvT91TWjGsufEpaRh+1G0Zm4pOtR16Lpb5l5ErErB5iZULLg4R
	bTJ5yD+pzb7MBhjvUBA4NEIXeMfRTFuuUGSNbp2fNqg6+oAtgLGOsvlvyTJU3CA+JoypYY/BFBSM1
	nKgIE19Q==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6rYJ-000000082Wg-2Z4p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:28:06 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843172bff4so557766f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572481; x=1790177281; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=;
        b=r2Q9uLv93F4M0Pr+115Ne4tSXEZ9Ynss1y05VHRJ9BoiFJj8ZXa6fPyaW/X+10cjlf
         ajtWw7pgGraSgOUCciE9IlRiVoIwBdDAgUKhfJA74psfcrb7CgtBYhutS3nNKQTBHbmY
         f1uPps0SnlKNE22XjWQgf5eWwme6DVVhdFcJ0q8UjPNIeJE6Ou9Cfqj4u+N/oMdw1hw3
         1hTy3a04u4tpV63fXuO4+KxoMjNEe6CHYfSIX6vNN27EMSW/H1Ek2R/3Dv8itjvDIeTL
         lgFbRZMfkkRO/W2Cw1Dq/bLE0hZgA2vGKywzOSEGziZsMEA1/YD3noziiZl7cNnB04Ue
         /Amg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572481; x=1790177281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=;
        b=17b2u9s9ulVN6hjeZ7PqW6GfQ8ZEInX60oBc3whcUXcMkxPlfZ/cXtnhXNgBRhNSKT
         7BhEGKe6hSHdLCGilcOTKhar34e4pSifHOhUKWfta6e6pKkyWOYzVzVfI1pksvgNCyih
         ZprcScBcpQ4xwNEzsNfI9edHJqEGkmOPHYTtdYXusxdGRU4YoPFscQlM5s5y2cIj852n
         E+P0dHOahtmbPpI27rcyFldO1s31Fe+wB+2NggD4VJ4IN99RTa0tbtNXXSOkU/E0uOlK
         X1Ow41ygYOgLEfEWuAONM/pafwZvoDPE0Yevy7uVHeZvJKrGlK6ToyJ6Sv7TdNbrdDJG
         TCNw==
X-Forwarded-Encrypted: i=1; AKwUvBw5Wx/wFzwd1N46PMzSOD58QzajMS461LT8ANTO6064iRiGD0VDx1qkxkd5Edo8rWjcacucWwWQvOlq2/PHI15v@lists.infradead.org
X-Gm-Message-State: AFuF++mCw77J/L23QznYV6W6SCjdlRK75e1T+1uIhQGL8rblZ0DZsNsJ
	718+ms8MMYlStsTAo82JBvVdIHY9H0CKiOBn0eJqDwpkTWphu5CZF18lSo0NaoBa8ho=
X-Gm-Gg: AYBFou1DzRZW7OqGo+Dq7bn/wBA4Q07bc7/ZACzuP/3WdjWc32hbwC7Xysxsre8EX/W
	+6vzUy8dw5jTNNRzw/EoaHasw867dmVGsYt3QicfXeJS35nZF/87WhSasS7ev2tLuAiJ56+KO0y
	jtwB1F/m1Cutp98gS+mxzEuY6cH2w+YrZYrxAB1Vf7y1lfSVpWxdEOG93VhEgJAY8V1FxFo3TLi
	qcmXnMVjhk8PIMa+JL4CoqYT6F4NE8ApmWKzWVVWPXycwOCTv80APVCozxhVWodhjmAYjrf2d1N
	6/iqEA4RycmLH+soq7ib6oqluvRXmowqQr/70zlXi7KIYGj3AD8L7IUPB39NJMqeMdVtuLZVHWG
	DUSLtErDKec+92TcbJDd8ym9PgcRea4iD+fnPXgDgkPEdUlyw3rxOavgukEKJQtNfy1VbOqGgFu
	04d92GMk+3B0njG3j8WW0i94c9q2X5Dn394a80eACw8pSr7MdQZtLJgF10SFZxySRuSHMfhhfob
	B9KpGfKDNKWF7Q=
X-Received: by 2002:a05:6000:4690:b0:487:d2e:144a with SMTP id ffacd0b85a97d-4870d2e14damr2660370f8f.4.1789572481423;
        Wed, 16 Sep 2026 08:28:01 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:28:00 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 16:27:55 +0100
Subject: [PATCH v3 2/4] dmaengine: loongson: use named initializers for
 acpi_device_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-acpi-dma-v3-2-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
In-Reply-To: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=1307;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=mcQe2swm15Nmq8Y4i0Yhh/Z95MEtTy60FNwFlQB0qyY=;
 b=mCAMVQGsOjrzZnlE1KDLWefw6z2YDoXVc9+9UX4SNJa9SUb7C+WIzubLJibyTbBdmwrLp9uRR
 BUqsHUJnqkiCke3WPg7G/XSghdGEVnHkp6NzQewgkYj4D37bFTu/4N1
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_162803_736935_D0058785 
X-CRM114-Status: GOOD (  13.33  )
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

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
index 1c9a542edc859..70880625c6e92 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -709,8 +709,8 @@ static const struct of_device_id loongson2_cmc_dma_of_match[] = {
 MODULE_DEVICE_TABLE(of, loongson2_cmc_dma_of_match);
 
 static const struct acpi_device_id loongson2_cmc_dma_acpi_match[] = {
-	{ "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
-	{ /* sentinel */ }
+	{ .id = "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson2_cmc_dma_acpi_match);
 

-- 
2.43.0


