Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F98C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=; b=CLyUh24Bua9O+ktLCXTKzcwL6A
	DvfwA94o28nMVpZqHmZi2lrKSyXOgfaat+n1x9Kx9Jt17ly2ia79YsL3rvtZJTWxmkcgjuBXnoEfy
	OJan4uU19oGW9265eTe2BWpI24VR5SzdpjaRtoZ33Ns+woEjWn5RAFHHEVooEZJlTfhI/RiBVxVm9
	ANlJGLudV2C0jdoOwJe2p0L+P3zcYhe0WDOQ5cqc9V4dHk9n0hoel3qi0+TzSEqV+AazpepQAUyq/
	g++WXk2QGmXxrkWUWW3cOKxC272vsAIoEqvSXrsBbCEUjb7OrUGwFqHBsgVyQnM00bvPfsn2Csyhu
	mqeIpcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b6v-000000078Bp-0YDn;
	Mon, 07 Sep 2026 15:18:17 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b6p-0000000788Y-3POp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:18:12 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7ee37dc91f5so2126175a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794290; x=1789399090; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=;
        b=khrr27eTwMOye0eXfYaDGEbNcyFqi/npQ+io305GZUoHIFGLDZI1wEE8bI2trztoFe
         NlGaZNBLtAh/pkNaNmNeJRAO78psywF4eKIiNgU7NU2BKcnrPtLf5l2dQnPps4dyaqxb
         a49k8NfDy4tefM7AA7CZzDf5UtmlxbDKaUhAAkVQgdZx28/Ujf7lIQuWTkoiNTFB0wWC
         NGet5FkxbmvxUurOZ+BMrvJOu+bGjTAQg//YTKvIkx2I02QTDNQmZI2E3PAfWbtdgNUY
         tlF/Bz71OzCoezmETER5vRKa6m8suLrAMKIsNzfTR0VvLPkXTU4jQvB6n4nPVM4XBIFF
         26Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794290; x=1789399090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=;
        b=nqefXbx/1DKzBE7vd4ZuReyXoYEV0YPzx5tc641Az45SX977H6JfzNsdFxDTa3yoXN
         wC59cRirPq+59ysVx+LpQBHLQih2PTmIeP60C/AAk/chM1MJVx8sBMSTfYjRvAx6+y1L
         qRpFXSHKK9vNQOzCiRH13cVBi24FZ8644BGQQ62LZTjr4gXiRkxSPnCrtZQ6B6dd/d7/
         fzNIfjxPgAOReScMlwUfv3ODqhXxAXrhdXW7W0t5JKoJwVvZC/UisaQekMyuEbMbI9UU
         4G4PhX5JZ15pnmawGDmfZz5Dz/Uh8Ll8hjfL/mVnlxoYOaMFPqqzFEDkzHO3aPo58YhS
         d6Nw==
X-Forwarded-Encrypted: i=1; AKwUvByb5ZGNhNqc6tU/v7UpFsXKCFhIyzddIwPkoo2h30Q/fiO2LvZvAr2zAiU/UFepXTrYmDPPJ2JtFFn6bOYob/Ot@lists.infradead.org
X-Gm-Message-State: AFuF++lC/aw7QZDIgfyRwPEazv6tOo8iUBAMuhKgPBIK6gd4XQ4PhMWY
	i76r/vex99VNDFcYvLOW4zwKQZyXNtnDsvcd9uzez1B+E00EFrs321BwcSm0wK3nKUU=
X-Gm-Gg: AYBFou3w7wpKFXRltYrXqzaHn4bK98gKc1fpkO8xm5oViI+cVUOGGmMAGmeGsIhwrsA
	uoGhiLu7ahMH9DRQF2JKNG6IC09+XT/8rzCS8YZs4ndRv8cq7JnDWPk8mxql+yFTI0VBynVqr/K
	nhKjq1cHldki0i1M31PoNnL6MhSYblL2megFKWXCoFdk57rP8Gxv96yvGJ3D8GBaYPckCFCGEsw
	bxw6cB+oGvFOkcgszdPBSg9S9pvdeL4zn2cf0/tbn60LL2hcUG7ANNMknSj8i5HONFmmuhriIhD
	RVdpQ8pPxcIfcMPjLheY75rgRTCCZEiD9sjmyc9lHUzNbQQecfMxowjUsVzWnc/f5OqMUJHNAnP
	EmH0IBI1ZE6P6yUL2GmPoYRS0/WEEYGF5hYsTTs5BJF8amGA6U2ZP9Wlrb5LtXv0BuZ1fnd1+Si
	Noa1KN/2dt4dZ5zsjbaE/plwPqaLG5QvWYOX0xKJxc9P1dwoJPwFxP7NHF+23vkfKXKGYnSem71
	AOgZw==
X-Received: by 2002:a05:6820:2d0a:b0:6b7:46e9:970d with SMTP id 006d021491bc7-6b746e9a2cemr11233302eaf.61.1788794290114;
        Mon, 07 Sep 2026 08:18:10 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:09 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 07 Sep 2026 16:17:44 +0100
Subject: [PATCH v2 2/4] dma: loongson: use named initializers for
 acpi_device_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-acpi-dma-v2-2-0ffe4a007992@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=1307;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=mcQe2swm15Nmq8Y4i0Yhh/Z95MEtTy60FNwFlQB0qyY=;
 b=pszIBdV0kK1FUCRktbAdGOChrW7kK7Mrhm9RZ+xiLFOk6gHbzZ0byKwiP/SEuuQTnubZrHIKI
 wm5fKOJhDzlDjf8gv7eIzW7XEibz2iIYboaTNCrbKOe1r2p7eKDdhSY
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_081811_865412_C179FECB 
X-CRM114-Status: GOOD (  13.75  )
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


