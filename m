Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F44C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUQuboyMNJgx1gV4X+dcroiSZBt7U++vQNPSBw1f83E=; b=PGhxyWAu6FmR+5H2vh3dY9mbmM
	j/wJKtYgCZjVu87Ol/70jirJo46RmtAGWbd265wmgV3yYDc/WlzL8gC3kVbQT9PZHGra2LDYNc3T+
	MAKprACMKe8gXGGYxp/wnWxE2x1/X70XD56bt6SpWZAPT4v1ELE7RDBf0291DuOJP+3RNlCCDiLX4
	mzLMd3LioyyyjmQrfvSgNL/OuzKDiWGIa5FbwH15S3ggKuAOGCg63nkiC6d5RO9INbcyFzt9KacFt
	aT8ZLft0G8f3GhAsuW7nyXwQz3FHIOEmZK3eermDOXyL3Eaazuts2Ukq5XrjWsGH+XY/eWDZUbKii
	pIjteY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UdF-00000002LBV-3SNv;
	Fri, 04 Sep 2026 14:11:05 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UdB-00000002L7z-3Nrd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:11:04 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c255c58156bso199406566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 07:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531060; x=1789135860; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUQuboyMNJgx1gV4X+dcroiSZBt7U++vQNPSBw1f83E=;
        b=mb8XRrk2N3Yidt0awPPoLVeN7Rrngy54ibXfLkXMBaZ/UGkM6hQciegNtwe91we9XY
         PeXT10dC5BTBbkqs/XjkT8n3Pz8vU38imNco7JSe557jazTOtkyikb4xaqtD41QLEXzp
         SlCpkgY8I+vTF+61KIjabDD4/VVQOh6PGgwHm+UU+sfHYtYgguXNZ78g8bndJHO4A+Dg
         o7Gi5ya4hKm+fs/FpeM5QAKyFrpRMHxhMgraJryX6bPh1ewQYEYPZA8oCxRhKKpS1anf
         R3bvW55ZXeNRQt3UXPpmVNNuO+zCq+4DJdgv4NJ5606lYBP+3SJ0yW/qtFrnnKG+lzk1
         stTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531060; x=1789135860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUQuboyMNJgx1gV4X+dcroiSZBt7U++vQNPSBw1f83E=;
        b=eB5tq5wlzVXoOPJXuKkEYXjFRdP1r2e0XtQZvmVvf4PkLOuJ7JkKtstHQFtyDckqZq
         IjkZ/1+Nd8ACMRnyRyHpHi/BMDjZa90o8lLQ0kaz9vHnwEEdatvUQSpO6isdU/EnALNX
         0QUoveeZ/dow857ry5dtT/HnOFM8cG/uMSN+eN3u00NLiSVJuJK6Pti09FnEvY0Kkmf9
         tILQ5iatvOufcL4m+HhI42ndA6YbIaV5HNlchfGn/4toxhmTyTFbTnjxaO3ikzWNXTm0
         184SCVTLakQOG3c0cL1D/xv0hLa7Db6x90zv2vxmNWuHsHVAwbMOjc1uYwbG12/qh9Tx
         AoRg==
X-Forwarded-Encrypted: i=1; AKwUvBw2ZoRzFeByo94FjZ+klB45BJm4L7q7Oguyzse598JAlx4fhCoWwD0qvaPBc7//8t0TUEqp51aWLri7Au/IAHsF@lists.infradead.org
X-Gm-Message-State: AFuF++lxsqVUZYhZQ3z2dvatvAaKrZDFsGbH1t0/hj3khF/F8nxGne30
	GBMfk6bDhfeJhwE9fAC3mKM1nZdg2YyUY9+fEBQrp6w3NuMcFF8owWScdcy6Km1IFgBZh7Y4s6R
	Ify6f
X-Gm-Gg: AYBFou0pXQydLEzbgDBq393dHsWDNwnlx+ytbTZPkLzLMpJ2VFPgGoCGnR07apdciso
	OH/RV+v6FjZ7aHYwxtLsx3gNd1+6RD/IrXpBPTXMfqVRw7rZQ9pw3hcYwL48KKjNfnZij2kbPEG
	rpiSApERWTfKXkkTA2HfBQ2NDTHUH17j2jR8IP6S0gbVcxSLEd25Kb+0XHUuC03VDSKdjwLEoph
	K1oijDGmLcatmaiKBneQtJE7fHcbk9p8oRTWPqupmnQljHzmiRW2ijU179gUY/oiKJyBwOrSztz
	T3R2CFqJAGaDvpxoLoZrI0dJjGLdt+zRhAf9mPxKgUddK3go8t3JfP0oFna63Yl//fSlzdzWzOW
	lAA3OiVqhagP0flR5zGDJrFc8Jxx8xrANnjToKHvDkPG0/FIPJuoJmGUOOim/fi82iTWxW+Vto5
	4/gRcWgc6mcyp6qr9yTg5q/fCe7MToEEOPsMYbE9CdKhzPrxJkKPr7+IuN0SuFGl0=
X-Received: by 2002:a05:600c:608a:b0:49c:fc6c:bdfd with SMTP id 5b1f17b1804b1-49cfc6cbfe7mr36426485e9.20.1788531049864;
        Fri, 04 Sep 2026 07:10:49 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:48 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 15:10:42 +0100
Subject: [PATCH 3/4] dma: qcom: use named initializers for acpi_device_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-dma-v1-3-0fcc63d65d4b@thegoodpenguin.co.uk>
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
 bh=YI1OpqXpFveygflyZ7spNdU2ImPBQOBvJey4mLcCyjE=;
 b=+jWpb9zoHZPf04DHZ75KRlkA9qQYrBTOnieAY7Gxd2mvQ/1U/LI4RfXElHT7e7IMRJ0Wf6aYt
 fAc6tSNVnY1BFsbQ5LNTLeX1XyLY/oK690JWA0i99VWhR2UDOemWfcG
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_071102_716728_5FE321F8 
X-CRM114-Status: GOOD (  13.17  )
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
Also drop explicitly setting fields to 0 where it is redundant.

While we are at it - unify the list terminator to have
a single space between the brackets and no trailing
comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
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


