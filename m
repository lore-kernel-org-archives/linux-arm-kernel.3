Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08584C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+l4S9i2/odgsmU25aLrv/j0FQJOeyHwyvML57y2qNw=; b=QYwMtkLLT7XspCRe+Tbv3yDt01
	+fANHA1TMhdVg67hQ0YqJr3+Bb/uia9DiaT/qadWDaTPiEyy8MKBPlPcBKuYy11mNJnwwICTZ8lHt
	HqAjiX8jYnzXrpC3slyRS244IlwX8UIzOUCl1Xq2nCXWQOGR+DHvxwIJbgGSPovjr7QIovRsy41Fw
	rb7vUd4DECSTALYK19TcwZpGY+OnYrUuItioh4JULjOO6TAikYWT8RNWcmbfnicvug2OEImJuEL5W
	RVX0UeuMmWnO0hlVCCmN33uf3WG/2BwFQGl+PqWoN5Hu32eOmgHf0oHLcXTyk/ciR3b7MzZYzH5Z/
	jEJm3r/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b6p-0000000788r-07D7;
	Mon, 07 Sep 2026 15:18:11 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b6m-0000000787j-0J5S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:18:09 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6b1b766bf01so1517843eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794287; x=1789399087; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+l4S9i2/odgsmU25aLrv/j0FQJOeyHwyvML57y2qNw=;
        b=UatQMC5/Dci+/Ax8I8Xbx0W2lI8ZuvdMA/nckr+mON/VWOGQ9jA45/isqDrLPUays5
         l3Vt96G1qZpY94O4ztUkkDBgTEdFML402Yzhxc19vjSjtRU4CCu6eJ4owWMLZwgfh/+I
         N/u6hw/CoOKNfvEzt/CT6zE01jfcFi/fkkdXfg9/CC5SprxL7yF8rZVeyfYhhYKwU1OY
         whWJjI8mZqRKcLHtb+L4XSOzJ0eNPqtg+JsCkhDLdo8pMN5+w2gi+ATXJZ5P4crLd7ii
         ocFe7F8oCs+K4V5QFIvbVaCCSM8ifqB2ep/vRCw07guB5l8cCvFTZNcjQiI3mJjMbTxe
         EAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794287; x=1789399087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+l4S9i2/odgsmU25aLrv/j0FQJOeyHwyvML57y2qNw=;
        b=lDaZ0lw01V0VPYYVEN1FJycGcVqsR9klcYDPRbb6NcRnpxCDrWVyhyJidOL5Z35Th1
         nXTADWbnKmRAm688sD0BT0rtWKtcyFgRnsrrhhDWLkDHQmBXNHDnqodZdXKzq02xpcLU
         23qF3S4t9svt+1qOLX/8NBme4hxCkXCt5r+avadwegz1uuJJBL2jBUpCCSSMUhea51Lq
         c960e8K6kiCL3dXqU0IGQkNtyywl5yUqe5GeA0jxbDZ4vCx39wqyfvtwVgkb//LtCzK/
         aGnerPTn/0POkOUdUerzV0IMAm9tIfrLR8SPkUfkPh8iG/EXRRpwjrYSgmWVMoumSyfE
         2kKg==
X-Forwarded-Encrypted: i=1; AKwUvBwsCm7AqgIGffzvpvaG3H1eZ+/yKMKbNptmUlD55v4UyOGfGQVHWlOPte1QKRAxod5OpNWJ9fBOSg4pt55c3tPb@lists.infradead.org
X-Gm-Message-State: AFuF++nF6jTbniEI5oP1vsJAYvlHkSsah7Ir0bSddX1zGmm5fNm80qSK
	x05vJzYgAJBGhDYqqCimjLjTko4rBCqzOjX3KsuK9v8F0nzuPJB6ZO+EYkNk7ymdDcw=
X-Gm-Gg: AYBFou1MTiI/FaALBkcshFjr73tfRqepvJ3pfQ/FI9ONWa7bQQ10Ewme9ecpjlqniMw
	ftxkJWxbM824yDjPw8EbyAW7CjXF29NGSMYtyldBzmPUB93e38AsRatMBu6lDYjysCf4mp3XiBB
	4AmcIvLIz70JevGRWKsqInh4RoFhhBmF+T/Q0h0b2A1DADPmb3+fMzHy/qV97vpH1ckRWynA/PZ
	zPLwsvhZoxc5G82+aoISx+haszxcjSZhwzm+ckX1BXs0WM73Ys3I8S06Ew4P/JXC+MsC0gO4kz6
	zqzHk2CT3/Ab1yAwlYlNIoAsXe2T1HiiMYUcWxnyZIiHQjMIAJbczfCquFM6wqrccnVcJUq/l9s
	FlfXIMUe722a0nKetKWLqpuhHSWS6XPg5QawnbgbZPgcrU3SbwlpiAKAAOOqWwUD7jA2t1V7ZKu
	VBVGOqtxBCMS9xZS00F4m71bCsADf5JzXCYFxyAo4HAAHXvEHQh77w0C2WyWmJft7CnqTICtrCy
	R5oFg==
X-Received: by 2002:a05:6820:2014:b0:6b7:8396:f3d8 with SMTP id 006d021491bc7-6b78396f894mr11053124eaf.58.1788794287156;
        Mon, 07 Sep 2026 08:18:07 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:06 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 07 Sep 2026 16:17:43 +0100
Subject: [PATCH v2 1/4] dma: dw: use designated initializers for
 acpi_device_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-acpi-dma-v2-1-0ffe4a007992@thegoodpenguin.co.uk>
References: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
In-Reply-To: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=1594;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=va8ns/bBhpmYtLXNPiYEfLUAZMKLwaGubpO1KCldYUk=;
 b=TedocPl1NreIF92NrfJkqDUsjvEsPgxpyubESs8DTRbFl2CC9mhepRIdAzRhAo6g3W9NBuj1q
 76+8Ig50mOpD0kUrR3X3JUTL5YwCFkjht9NSZxEezIGieoocqZ2v9m+
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_081808_484322_90915AB3 
X-CRM114-Status: GOOD (  12.15  )
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

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/dw/platform.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index c63fa52036d7f..5c1c97eb28a4a 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -141,14 +141,14 @@ MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id dw_dma_acpi_id_table[] = {
-	{ "INTL9C60", (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ "80862286", (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ "808622C0", (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "INTL9C60", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "80862286", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "808622C0", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
 
 	/* Elkhart Lake iDMA 32-bit (PSE DMA) */
-	{ "80864BB4", (kernel_ulong_t)&xbar_chip_pdata },
-	{ "80864BB5", (kernel_ulong_t)&xbar_chip_pdata },
-	{ "80864BB6", (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB4", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB5", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB6", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
 
 	{ }
 };

-- 
2.43.0


