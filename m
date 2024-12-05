Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB62E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 07:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=; b=YNML0YFRsLmhZ8aINij/Bj7qkp
	PQrBb4QcgX98v238HV4i6CExi3suyUbJ9Y3MEj5WWaAWuq9iBiCVtm3ABA+99Va6bwKF3KcgPrREL
	zG8qmOgKkfPqTeHAgo6f7F/Mm1bReZtKfj5V8URZcIhzXnnA3bfsIOKEY9K59Mxlh/LyUw6bOlNd7
	iKlV7ciVqJVcQKDMSXP8BJa+lmXjKpb2aRWSznFotJy37EACp1dxQkBkLRee/Y+D3hYuHOllCK0Ca
	2BJzSAj6vtv5c+3kH/vSR0uasrE3xh9p+tOjZCcGhJ8o7bZBXvVW5qNXegTlFls/ykX9+lUdbXxop
	0g3dwqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Ul-0000000F47s-1ULn;
	Thu, 05 Dec 2024 07:41:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6MU-0000000F1lv-2zqZ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 07:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=; b=Xb+/jnMXCthj7TpNnJL+MDEj75
	8kS6oX4NkvUji1GbwhIfgoDvsg79/HzLcZNlAFASELhgC6CMKQ5LuGGDQcdMK1M2n/zhX5HhVOGdi
	CJN6/p2R6d7bO84PoywW+n52245Q8eCzXQU+dlx4vyt91LrLCVkXd7dlzul3i7hcaiZs881vGQ+QY
	Z9r/d64D8YaFg+JSQHfaJPOHIbLUfUmfGEC8po3kFLxCwt7CnF9LUq2JNMqLCrsmHzUpEtywbCaiI
	W/sB8niP9WWSD39kdOZKmkr40DVBn2Iou9cRBBQM63BqM0+3zrMbtyz1Zg4UYdXIUpyqgbq6ObG4h
	1N4cx+vg==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6MQ-00000002muA-1FWg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 07:33:21 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d0d71d7f00so850562a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 23:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383995; x=1733988795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=;
        b=JsgpgvOzJMAAt9tB4D6BrR+EFUm5MiuTQISUS1gu2Ysv2l0DXz1uf9Iwo0S53cYIl2
         FE/FkoXSMT9E983IMiWDj7/qtYA1UjTwe74c5o3sB2mrxqD9I6jL3iGtGHGSW/Iu8/d9
         GXiGKVOrle9/O9l2LmZ89NnIHnRh7Yb4W5LBJ6HzF3r55re6vCOmnpA4yRVd9hAeiDN/
         3liJH9+JYq/NZ889y/z1nzqESShT3bu/vQVEfHMnffRiwEl+Zl6SiE64EecGDIDWpDCi
         4POloZ5rjAmTdM3Fn20JDWzKTGPkxrqhTP8VHpiWyWKRPpuO7IH41A0yxCWgqrWwN3GL
         oOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383995; x=1733988795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=;
        b=e6Yt1phhc2NlqZCdATzDBsihk+W2uNVeJYYhoc9qdq2/hqEnD4BdknXyhi32mP0UZb
         6YXU/EuBfs5hvELwnEILUMHflhXpN3GUbyF4fWz8WiWVaMIcNFXgPm74z7lOMaqf9BHy
         qcRXtnhQurJhuHg7azOUqQyIZ2BJYpk/HeXaSgYgDDiIHdcMVeFSfm8VJ1vtqt13I6IH
         UG5Mf866BsW1CKHziksXeYuh7ypjCGsxnHX+DnLcYMtu9Y+nVT7WnKqsv5YKsvh9jM/U
         /NsJvpI7Sf76X3pZydySgJVjow5KVDmCyEet3YiiXpME7WzFMUyxlHaZO/e5naS4ZdIC
         QX8w==
X-Forwarded-Encrypted: i=1; AJvYcCUp2O6oNIwjqwFEXnaoQSRp5ZPbgd6nLCqcnx1ipd/PEQ7D3EMnkD6FP303/DLBy88qPT9cGtEJkgF/7NuNDShO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/eMlRiWjxXKoQLS0WxQPwkxOB3W4rXje2yDn3EelnK63UjEhk
	NgfoiBL4Dsn6dUHVcQy0T04YcU3VD/pyKyqoTt63iuzJQAr9/SihAYOtwCxqtFMVesLfiFSFK8y
	d1WM=
X-Gm-Gg: ASbGncv3aopgPZef1Vcx2HE9OQPOkADhd75YtGv/W3ZVHjz330jmNC30L8SelP0FDXo
	YPuss8VI/DRT09ONM4yjL/rwhKngXc+nmLAFrYqHZINlU0Xyrv55Enh/PClRhcmMw8mCUbkGbBG
	JEp726UIyg/B+P+938YHBygNv7A0E/AiJJrh9MVw51xqtoIfzCIZtHgw/AV2v7k2bqD2TrX8WMu
	gY7vRlR9USG1rIeHEFhZm9Wo5Z5e/2p2sRu0KJPgS9vNVquhXnY4XR+cfos+GpfEZK3wjen+lEe
	EtKRDi1jlJnb01I6F53LVTL2bx1Q7EA1oQ==
X-Google-Smtp-Source: AGHT+IFgMUVAtmrSp5P0iX/M3Y79q6BO4G1fv1/OVbYNaTflw37THP1LL7lHyOBI+yL2Eg8TsZ7fqQ==
X-Received: by 2002:a17:906:3d31:b0:aa4:9ab1:1985 with SMTP id a640c23a62f3a-aa60191ef15mr658488966b.51.1733383995541;
        Wed, 04 Dec 2024 23:33:15 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:15 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 07:33:15 +0000
Subject: [PATCH v3 4/8] phy: exynos5-usbdrd: fix EDS distribution tuning
 (gs101)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-4-32f721bed219@linaro.org>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
In-Reply-To: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_073318_520626_24A893FA 
X-CRM114-Status: GOOD (  14.23  )
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

This code's intention is to configure lane0 and lane2 tunings, but for
lane2 there is a typo and it ends up tuning something else.

Fix the typo, as it doesn't appear to make sense to apply different
tunings for lane0 vs lane2.

The same typo appears to exist in the bootloader, hence we restore the
original value in the typo'd registers as well. This can be removed
once / if the bootloader is updated.

Note that this is incorrect in the downstream driver as well - the
values had been copied from there.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* collect tags
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ceae4b47cece..2a724d362c2d 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1510,8 +1510,11 @@ static const struct exynos5_usbdrd_phy_tuning gs101_tunes_pipe3_preinit[] = {
 	PHY_TUNING_ENTRY_PMA(0x09e0, -1, 0x00),
 	PHY_TUNING_ENTRY_PMA(0x09e4, -1, 0x36),
 	PHY_TUNING_ENTRY_PMA(0x1e7c, -1, 0x06),
-	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x00),
-	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x36),
+	PHY_TUNING_ENTRY_PMA(0x19e0, -1, 0x00),
+	PHY_TUNING_ENTRY_PMA(0x19e4, -1, 0x36),
+	/* fix bootloader bug */
+	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x02),
+	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x0b),
 	/* improve LVCC */
 	PHY_TUNING_ENTRY_PMA(0x08f0, -1, 0x30),
 	PHY_TUNING_ENTRY_PMA(0x18f0, -1, 0x30),

-- 
2.47.0.338.g60cca15819-goog


