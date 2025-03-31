Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498BDC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NQQM3Yu8f39BKq2Mg/PjZ0Uv+SRmBe59/r9UjuQMsco=; b=AmpDq5SzM8BMWCt5s1TEVVg/Aj
	lSk/WHKvHeFsdN/YmE3DrZus5aO4tk4m/VbZUjsSGoHtVUj/fksuAGSyX3RlI0jwg7ugGMtOvDWtG
	at1m/PC8RbH4xH07x27x291CWHSm9TWYEQI0rvO/OAdvpbwRD3A+5d9xCGph+LOKUJas2rqYeMN1z
	EmJ72PYUgbwkuR0DyhdvsyJ8V4BHYANU8EJKKezny9wRlUgL975n/d7/fKY8m5a6vsxfD5/PmiNUO
	RYJ3aUYrftq6dfmbOl+8aPYFqThGWctugTvX8OJtfnb177cgb/de2kMEFR5/z8RYgT6mgPBOOPUMK
	8F8x7o6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzD1j-00000000BDT-32hI;
	Mon, 31 Mar 2025 11:09:59 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCzz-00000000AT8-3rSq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 11:08:13 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-224171d6826so52618865ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 04:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743419291; x=1744024091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NQQM3Yu8f39BKq2Mg/PjZ0Uv+SRmBe59/r9UjuQMsco=;
        b=GStaADdSgmJc/JXcL/2tgiIW/iyMT38KYzajrcNPu538ffccEzeWQaVgiBrjd98wey
         fE6XUtyaX5Azejf+CVyZaUGqMx3KuBvv10DT6LTP7loXcq9mf9dwxfcbtlJD6orXVonL
         HZ5Rk0M+ZXf1VNLz8akrRT1FNZrYTTJ6Ss4kDkDdULFYetP/UV5kpT923eMEuqj5scRq
         UXEU7z2MoRef9Tton8I4LXa5p3kgGnu2EOvw+W5Ye6pamNihWTeqy/wBzkyM0I3HFeZp
         XQIpHYlrREVMZHrauIQMWfa7xb2hvpXMkysGlJhef89WdLdeo9Ujnm32jH40WxUYgvWO
         Ve+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743419291; x=1744024091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQQM3Yu8f39BKq2Mg/PjZ0Uv+SRmBe59/r9UjuQMsco=;
        b=gk/tv2VtuqrzNOP+Mp7oUoTwGSNhdMnYDl1ajEEQoOwfDfdpcC7raLInTBhyUzUFQf
         XBmxqaBOpo0bDuzzdi3TzgCQuaXNx4snB0/qnFszmaCREY7DOeIMVDfltgc2o+p67uMu
         Nel0MFsxvlpV4jGRMjY5FPCQoIj3r4cRPF/YAGtqcaAPTtLwRPVMWjdGVCCmiMINblRJ
         UJ33LrA6JRqbIb7kBw8iYLh1MptVGWFbslt/Ya+qsO7QygRQfea2Y/a5BKl8IBsKCfYD
         hzbXxYVEfn8Oe+mnhbaP/h5syyCoC3jXfQf/EhC/jo21CI9nwGD6EwboJ1Bp9G2pb8PZ
         cwYw==
X-Forwarded-Encrypted: i=1; AJvYcCXcb2ZwlOESGNIeV21l0cBXB6oHcjk4xWqhVDXC61wgnmtpeRu4teAHdsg1RGJT1VD4JmkVbQzfRDM7Qw8ETVG7@lists.infradead.org
X-Gm-Message-State: AOJu0YyGYcbs5cl+MnROhjfTgQGWeGWEdA2BqE1cy3KmTYAkZC0BH0jy
	MrZPg0JTH7c/b9gA+YCPs9bxyFTHmmka8FNFpEoOgv1UAmwIuX1X
X-Gm-Gg: ASbGncvrN+vOrCA9Izs1h5Cw5jkYRhjKVYsMKVRqSJQowDTx9gtJ3mWjhtAMjUPqi9e
	IF2rrcneWLqqvg4sJeo0PYoGiH3f2TmTKoDsigJkvx5BfeaPIb7DB0wqjcHDeK/HbQOdAZkMlSs
	gZ6wB5E/UnW/0f9STMGoAzBZycsNmy/ZgE5yP6bHUbOocIOL/DDzHvps7HP2yz1epRH7k9XF5dD
	qzoh3j5KMHGbwrF+/D14p5/WXCggUP3Vm9AaPrHSFooWejXpAV3TBmOTl2FxFkvo0lZOjjWyM2u
	zrjKmU6EPKC+NyhmKH/ySgRnRqLUo7Qo2vouqAGrRGQhGelBCqdt57Sg/FAQE66tGGJgPOg=
X-Google-Smtp-Source: AGHT+IEfDTgHboSZ6iP2dwOP4vEW2XdDO0sbdpyybIi/mimcrNizy0gR6Y/LkkD3gFM65fgc+CAQ5Q==
X-Received: by 2002:a17:902:c408:b0:220:cb6c:2e30 with SMTP id d9443c01a7336-2292fa010cemr150564165ad.49.1743419290986;
        Mon, 31 Mar 2025 04:08:10 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dfbb4sm66890615ad.198.2025.03.31.04.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 04:08:10 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: djakov@kernel.org,
	krzk@kernel.org
Cc: s.nawrocki@samsung.com,
	a.swigon@samsung.com,
	alim.akhtar@samsung.com,
	linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH] interconnect: Add NULL check in exynos_generic_icc_probe
Date: Mon, 31 Mar 2025 19:08:02 +0800
Message-Id: <20250331110802.9658-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_040811_979676_4317D514 
X-CRM114-Status: GOOD (  12.84  )
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

When devm_kasprintf() fails, it returns a NULL pointer. However, this return value is not properly checked in the function exynos_generic_icc_probe.

A NULL check should be added after the devm_kasprintf() to prevent potential NULL pointer dereference error. This is similar to the commit 050b23d081da.

Fixes: 2f95b9d5cf0b3 ("interconnect: Add generic interconnect driver for Exynos SoCs")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/interconnect/samsung/exynos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/interconnect/samsung/exynos.c b/drivers/interconnect/samsung/exynos.c
index 9e041365d909..3dccc84f72cf 100644
--- a/drivers/interconnect/samsung/exynos.c
+++ b/drivers/interconnect/samsung/exynos.c
@@ -134,6 +134,8 @@ static int exynos_generic_icc_probe(struct platform_device *pdev)
 	priv->node = icc_node;
 	icc_node->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOFn",
 					bus_dev->of_node);
+	if (!icc_node->name)
+		return -ENOMEM;
 	if (of_property_read_u32(bus_dev->of_node, "samsung,data-clock-ratio",
 				 &priv->bus_clk_ratio))
 		priv->bus_clk_ratio = EXYNOS_ICC_DEFAULT_BUS_CLK_RATIO;
-- 
2.34.1


