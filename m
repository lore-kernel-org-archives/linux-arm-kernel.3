Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A776C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 20:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oMCTnT+32IM9esGcJfKCDgJ9Xsu2sOgKYa59IiET8A=; b=mJbosKyAeMsafFdIGcUQxjPCvA
	rKHmyiV6WEV2TmEAwXVb0LesL2fNuc4Xg5pJaaDCCAWX4FlOrxztwVoO/kHzf2zVaRh0eko8ilf78
	1kkjqGdtwit63Z/BfBRs0DCzKqy2SesmxQuDOG3RBkyifvd6KQIzG6tQ+N4HI0PL7qlBaVtMt1pfw
	HFwxYZuRp7Hdgb12t00SELFI/bzsReJGbXLVG9M3YDuSum3QtYRaECP3djjTeBf4HautzA91cmZ+u
	fW51eojkeugu9IMWrOCMaZkufCzWBnQ9tzBv8GQPqYclQFbBAgzMODRgg58M6iPBhJS/S6JAQL9QX
	Go0bshMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8wZ-00000008d3J-2E4P;
	Wed, 16 Jul 2025 20:41:35 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7wg-00000008W7y-2yTo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:37:39 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-40a4de175a3so172470b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752694658; x=1753299458; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2oMCTnT+32IM9esGcJfKCDgJ9Xsu2sOgKYa59IiET8A=;
        b=hYn4C88OJKRdGq8N2tXR2xxKSxffh8t1DlElytqlLgHHmrPwUahVrGQilDguaUI0KF
         7BqoyOCrkBd+1jT5SPfpwTnW5KiM3ytfTHfkCso1ai/VP+U6sQF1LXl0a/0yy9tF54zt
         fRKmJ2S/A/ohPG6ZrNf1LQnc1S6BcAzKUP4QV9otLiMHqrPPoAKlLYIhL3a0MlNxHvDc
         BGbqcHDnrIZzmSkjq5/cK3jNqqMD56VOlFxTvrwxaoNISeHMX8DHlj6gv1poHzs8M4Ic
         eUFaGG8JAKftHO2+Gcq4umfFKuN4dgrIcpoA6fU8j+VvN0YNhW0vddm9RdJgSVLnknmR
         2f5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694658; x=1753299458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oMCTnT+32IM9esGcJfKCDgJ9Xsu2sOgKYa59IiET8A=;
        b=SdZoQHhmC3As/4dWRf10N1FspNPAVOIwPdnfFtsomp4sWfc3DT6v0x75bk9liB05fU
         iTg53/trWWaGxo/ITq4dATW0/LwZ/7HC2+C845g4y9cQ3dForpmfEaBuxzZAUqOlOOcd
         ZmI0nBmckVs71KyeQyBSFsNiES2c7VYQavwXAGKMgK1dtqqJWJU2bCY23t9fqPZRHi/4
         DSaOmB7LaKDPkb+22UBvj0KKRlvFfJfvBg6QYFz6zK0b4nCYwnkn0yOF4FPWSWG8X2ux
         nlVR9VGJCZkGs1tHcD6R4JVAw5//QU1D74tUtuptEc3z6e5GMJMUJLuNUrXaiVgYnwDF
         SOBA==
X-Forwarded-Encrypted: i=1; AJvYcCUPWvKjMwgRVc8hUH2D4IdOB0Ayl+blWzmEg1EGYwS8jOrABj8GwaskDP0Q8LN1AExZY+O5NDm3NWY+U9bn/Ya3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa77mWQ3oNlsCoHQu42rweJLB3QuJCYMz4fLxw1Nmw8eJwG82e
	5s7E8obTZi2cFxZGJa+NGwNe50JRVOzSg5EglSKYzf/jkps/XF0DXo0WgHoDqheahvU=
X-Gm-Gg: ASbGnctqe5cDIlHI9BM9YCzpi/i0BzCXwrSWM11Ay8oz7FHRdZfcgJZuK3Ztu8tCtbZ
	RLjIt1EjnrqS9ehPhXlgGBi+yvhKhI//eG4GffB5S+owWzu4atYWJ0I5SlxKY1vmgSmQ6ESNqti
	KThUgc+GRWTf9G23XsA1B1bPQemrA1JwIM67U53VKZgpkgJiJ6Kh+h3QwhzHBng8FaajTXBj6kf
	v2/75/nQm+2pEY6Fi54JECODfGAqWl8QkvoxxFH8r9NVX+6L7Wqf8Of5OQQWc0p0Q7bzfXp7PQ9
	dBgSNRBAGG5reEVCNnbUCaBMDhLAuUUWBo0jOaR2yYIAFWFjo6Msf95GxrJX6kKe8mWBVBJz9tj
	atglElkVK5UYL0Pht5XNFEnFI+5Rm1w==
X-Google-Smtp-Source: AGHT+IFLqHzqE9RAjaUQtmkmTyBsanwDkOziNViHSci5VEacsSRMTXfSAsTY+/VKxminqoHkU8HVdQ==
X-Received: by 2002:a05:6808:4494:b0:40b:441e:3a5f with SMTP id 5614622812f47-41d04d8a574mr2528349b6e.25.1752694657838;
        Wed, 16 Jul 2025 12:37:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-4141c1ac4f9sm2992626b6e.37.2025.07.16.12.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:37:37 -0700 (PDT)
Date: Wed, 16 Jul 2025 14:37:36 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] irqchip/gic-v5: Delete a stray tab
Message-ID: <3f4e6446-6a5c-46dc-ba87-90e1d6968008@sabinyo.mountain>
References: <cover.1752693640.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752693640.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123738_747003_47E1EF5F 
X-CRM114-Status: GOOD (  12.42  )
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

This line is indented one tab too far.  Delete the tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/irqchip/irq-gic-v5-irs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index f845415f9143..ad1435a858a4 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -568,7 +568,7 @@ static void __init gicv5_irs_init_bases(struct gicv5_irs_chip_data *irs_data,
 			FIELD_PREP(GICV5_IRS_CR1_IST_RA, GICV5_NO_READ_ALLOC)	|
 			FIELD_PREP(GICV5_IRS_CR1_IC, GICV5_NON_CACHE)		|
 			FIELD_PREP(GICV5_IRS_CR1_OC, GICV5_NON_CACHE);
-			irs_data->flags |= IRS_FLAGS_NON_COHERENT;
+		irs_data->flags |= IRS_FLAGS_NON_COHERENT;
 	} else {
 		cr1 = FIELD_PREP(GICV5_IRS_CR1_VPED_WA, GICV5_WRITE_ALLOC)	|
 			FIELD_PREP(GICV5_IRS_CR1_VPED_RA, GICV5_READ_ALLOC)	|
-- 
2.47.2


