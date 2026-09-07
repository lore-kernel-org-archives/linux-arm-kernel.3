Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDA0C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvKdQrCWkYxqdOjbu2Fib0GGvdK3uXcjnoDDmIYN5Pg=; b=aqb/lHcp6z/dNucLf51hYG8K44
	kZoGX8Q9j06Uioq49+6AXyAMg727PkDapQJnmeFhankdh0Xyj/8/fPE704s/nkJCJTKPgPvntlFzE
	sPi1nttuZqmeapdczeXil3XibOYucZ9U7ivJ/I4K4lg/qjasuVmfty0FQb5tR7D841EiPSMlB2/Ls
	fta0obuJGE/ras9ybAP5OnyHhoQDAZ5P0mISnsDOCGDL5LttVrVFJS7peqIkO2QYXok6BZ7cKE8Fu
	NJgMwJ51+MiCO6S4z1tMFcm3CRNV8R+AwbCNP9VPERmXqsDcNxTyPUHWoSiL1XvtvOBzXyb4wJn2z
	xznYZUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b6v-000000078C9-0wK3;
	Mon, 07 Sep 2026 15:18:17 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b6r-000000078AC-3wSJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:18:15 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2606875a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794293; x=1789399093; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvKdQrCWkYxqdOjbu2Fib0GGvdK3uXcjnoDDmIYN5Pg=;
        b=ZCDW5iwH5vg3hlwtGGiR18hCaROmR3HxPGw2EuldSa2RjfGdNsjqDLs/gkoQYSF5td
         9AfgEVYFTTRebwbIuvxFNq1AQ9d/5miR/BXiJG2x0Dsnvwom/WbUMCYCjrXdrj7yJEIb
         HhGokK9gPB5V1Fdzxtclq1TJwMSBa/1I33USDk6l79DS11mke7kT99Bg3L05voyGDCQA
         Kue4s8dZJzPen9rzpGExF02G2gpjtZfepZuLUTn4wVdS3D+TUW4DiJst74YoSCtuUPRS
         u4hdn8iE9VVENak3mk+CpQqQmGwM5U7oHHLymcj6/VzEZCVB79eKb7gbff8KYpm6uI93
         Ek2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794293; x=1789399093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvKdQrCWkYxqdOjbu2Fib0GGvdK3uXcjnoDDmIYN5Pg=;
        b=OyaKdhbj+C5sdGKBRXbbAsUdxIAfJY5AM16H1VnbzLbLSioZ5fogdih/tOJ7msRBLX
         SOPF/IHNYZNzCq1Vj8NprZQeDN4lb1ytft72LGXBqP78gbkyPMbwK3wShPUuVdwm/0T/
         9BDBDgX5PnF3ld8ThsK1VMC2xlIzwpjs6zWIw0YfKXhhESkjpMosDuOdTFNQGtEEKDJr
         B8GJ0czKuYEBo9B1ajcdrNqxpd3JWnt/VYu+mhptqw8sK8AY8QNV7xHfjIaSLm8XDKN+
         kaSqXisHOkv70FUrGxOox0zqVCN8gQtJe5H9LxmI+3FmZi2urcRI/3vCAVx9hPP1xMV+
         jmng==
X-Forwarded-Encrypted: i=1; AKwUvByHm+AxKA4LeISK0HFTfCoN89Oc4P0/CokDoxiFRLe3zUdP94HkVW9ebdtbJmJPwycghcAgbfiohAmExXOCK0a3@lists.infradead.org
X-Gm-Message-State: AFuF++lY+N3p5ZDy1D70VIm90y8kYFHdtnEaQVll2tfAL5R2cMH1PyEi
	nDs0jf+pYBR2Ja3GkvhYjZoWBHW8sbKoG5SqqUkPi9j2fRTAGLImVVONEh8ZE3VM4NE=
X-Gm-Gg: AYBFou22EuGxoqsAxdpu+Hae2ZhDEBMRbINMyyNlKx3R4wMu/diJScUB0lh51LQ1D3i
	TL9UbELbZbbXs4WR+DNQxRl53OCiFb71PmGingC8qWT6k2xuS4lOLnnx0qCiQHOQhyVcFwVWbZ7
	/xXnPSDv0nHjlYW8FbDb63eEySpG062gjMOsU6cTh8f97w9I4+RvQwbd72tPOg9Ag8Wx0f3Udmk
	K2ANv/DQoNhEB8+OgJlx2g78VX0PiEpK7f9KVyCw8p0pMzyXOjfRu+xNOwkxLFZNLo/Fhj9o+GC
	O979K3bsWWgMUiepu23Kagox8fZmFn8zYjHeGRVqMHMXQnK3UTs2oiRVFW3jcERjtTFijkUsuYg
	fXLLfBTHRakvR2V/PKPSZx9W+++LYfV/p89OqBUYIKYMOfFdieligfTQm6qz6Y9UM3FWSwUJDy2
	nOyB/pSLCdZW9d99N9/EPPZx0cu/jKeWcsECMCG1c/CrBK83Gu1HA/Ce8hUEcnPCdCnK5bUP/9+
	nNBWFq3th9V3hR+
X-Received: by 2002:a17:90b:264e:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39b262e28cdmr37304540a91.22.1788794292966;
        Mon, 07 Sep 2026 08:18:12 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:12 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 07 Sep 2026 16:17:45 +0100
Subject: [PATCH v2 3/4] dma: qcom: use named initializers for
 acpi_device_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-acpi-dma-v2-3-0ffe4a007992@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=1191;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=fh4C/z0gOMcS2SxNxy2cC8TlLYkqOtVy2+16qwp+aMQ=;
 b=lEzBJa92p79RXBpbg9r5dR33uOutrn5E0hxQ7UxPS98ZaD2IkJ4e/zkFY35j88BW8cf9ythBf
 J/jneLU7bDoDs7qzGYXOIFNTn627bmSfgSTZmlRaZKicK3+XFUoz2k/
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_081814_002474_C3529BAD 
X-CRM114-Status: GOOD (  12.68  )
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/qcom/hidma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be21d..1349066b1544 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -935,10 +935,10 @@ static void hidma_remove(struct platform_device *pdev)
 
 #if IS_ENABLED(CONFIG_ACPI)
 static const struct acpi_device_id hidma_acpi_ids[] = {
-	{"QCOM8061"},
-	{"QCOM8062", HIDMA_MSI_CAP},
-	{"QCOM8063", (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP)},
-	{},
+	{ .id = "QCOM8061" },
+	{ .id = "QCOM8062", .driver_data = HIDMA_MSI_CAP },
+	{ .id = "QCOM8063", .driver_data = (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP) },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hidma_acpi_ids);
 #endif

-- 
2.43.0


