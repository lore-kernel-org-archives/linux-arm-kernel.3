Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5B1C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEqUQC0KLTMrpqR3R5TYtWC0wMSU2dt7BIPd9pMyARM=; b=1wv/klMh2lCqlozvGSqQsxvYgZ
	8Dakv9oOp+QcTMQ1MKY8Mi0sYjCdllTNiuDeP+6CJ8TVR3FMJB3AqJBJyi8Ue6O3kvJtCit8Ajchy
	dsxjdi+tncVlycLg2nXqVIQFd2RK87IknKEWsbLjVwOzkqkrrc0eM2BEithMHDGwVWF4oDmmgyQp1
	LE9tbXoSdMurE631UgKQ2TF1WImg90cnRsHrGvaC8QEvqAErLqeX0+wCQHxD9wOaqo17LIS8UG+tl
	GS5WHNuFU6VQcEDm599K7/TVamNGRV2M1VrIS68VgaCDHcrZXwpVWMBcVdg7Os9Wdppyl3qhAYC9W
	ZuicVg2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UdJ-00000002LEx-3qiY;
	Fri, 04 Sep 2026 14:11:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UdH-00000002LC9-33RQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:11:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso8800235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 07:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531066; x=1789135866; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEqUQC0KLTMrpqR3R5TYtWC0wMSU2dt7BIPd9pMyARM=;
        b=eEwgXryAJadfbvIkxQ9phl6LPybUhWt+C+Wm048gECcv/2SbgA9fZ4GrICpc6drla3
         3RUVw9IhoVRekISNyjeiIeC/vqFtNULX+0BnxYhOmzoiTWR/VdVXr4XLSjOJwVd2nstW
         /pBDd/ECd+Ub+8oZLzjzQL9/BTMiU5Wel3TcY1OSV4l+4yboaKFspT5ZVN3z3ibjQtdd
         vXQxbkPgiGq11qOM91ODnwQUEFdsNZTjgdYffENUkZYKE8ZR2N4Hq57z14WPO3incqVy
         6lfpG8ia3AAYskYfiKXNs4NrtfkDQJDCiXHExT5kJqtzgqcWJ84WoffuNRVpUPZMOGXd
         kyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531066; x=1789135866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEqUQC0KLTMrpqR3R5TYtWC0wMSU2dt7BIPd9pMyARM=;
        b=m7OyBq9GCkCszTp1LHsGLLY+d/1hVhUomTt/ZdJY41E6loK+iSirIU3WQ8BwaVAmev
         7WvjHcy4QZA77HZbMdWLqKFG4I88gcc3upl9QdbXLnQAJZKW63b9PZgHqgBn619CC85e
         kJ6ltM8zxjbBmSYkaUeJJoVsdGR84hSOlczU6WeyARbSWYE6Z560dgRcYE+XwDPJjhqY
         S3fvYVd275vrO+0Psd56pbcn1vXM9ruEWFSnUT18vhOYAabOn+Ke19EjHkyE1ai8FogF
         yWUmFXVCK8hEi4bhO/mE3E67N3nHCm+NV84j4vetkRA91VIQBQYYav0iE22Iu1uRw1Ed
         69Aw==
X-Forwarded-Encrypted: i=1; AKwUvBwm6CUqv6R6cPqOOmcQ8Z6PKSNI/dI3r+kVUZ6e45CF3LIzTX2TF9L5cO8N4VPBaHaQkoju8igS4wTcFGYpW9mc@lists.infradead.org
X-Gm-Message-State: AFuF++ltUZbtyN1xu7booEWmTdkt7/IypaLj2I0KLwKxQy9BGw6HlzNf
	MKf/mh/twTmpUGosX0kEMcNDPf3M7P9KHzA/nFgdQtIIUeqgN49mWu3wJnEetb3cF7k=
X-Gm-Gg: AYBFou1P20c43EBC3OFVq0j18e2/8S22IbiF9+FqVILzFIh7RW/x450qGpoKl+I3hTn
	iQ6binY2ZGKUASLFCaJQc9/QwSbWWNFdPk2Efs+kPKL4n1Izv3rX+o3cRYyJIqD+O+PXt9USPQS
	/2F6IhV2WE+S4/6XzLULCKOv+Fzkm0Rv4ZwhkaeeIz9jV9fZmvFRyJ/KaX6VIuzx6gz6Wv7REit
	ZQQj5YwYibykMOxIBU3v+YlmuOYeymcWzAL1xDaXBLB5EE/Qy1ZRI8zoHofYCsqxUAEtL0M7w2I
	yq1vTIo50DxHSvfhjBtBCsyLnvB7GaHEF/fVWShmTf1B6Tl/uxLuEIgkmq9rO3DQaleBtnDeA+X
	6tEIFmgPF+kXrIepzyOWD+/Cz8GqCgvl8MnaIKGY0ZY/5OZAsCE9axWOnQiQqXFVZJge/lwK0Wt
	gh32jNH+cHc5RksTNFEK3m6ytveb2IwoBcI21PZag6c0F+js3aeEvxLKZ4WrJ5C5E=
X-Received: by 2002:a05:600c:a087:b0:49c:f467:7ce0 with SMTP id 5b1f17b1804b1-49cf81dc377mr57050405e9.3.1788531047704;
        Fri, 04 Sep 2026 07:10:47 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:46 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 15:10:41 +0100
Subject: [PATCH 2/4] dma: loongson: use named initializers for
 acpi_device_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-dma-v1-2-0fcc63d65d4b@thegoodpenguin.co.uk>
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
In-Reply-To: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531042; l=1212;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=HLpKxIaKGd7G1q0JMJ/3LmoPDegXjEccp9RbG0O8P0Y=;
 b=VUi6AEMzf8WJnaEudtuz0IHlOiaxvFSP7LnEodkr0pKvhd111g4p3/8O+pPvejHm0kaaH4H8x
 WiqccCXL8MxC2XW3/g1uTW9wN47IBEzG2Ky43NlIT+FvWjMpNrO6Ilx
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_071107_794145_61B1E25B 
X-CRM114-Status: GOOD (  13.66  )
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

Use a named initializer for the acpi_device_id fields which
makes the code more readable and consistent with how lists
are initialized in the rest of the kernel code base.

While we are at it - unify the list terminator to have
a single space between the brackets and no trailing
comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
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


