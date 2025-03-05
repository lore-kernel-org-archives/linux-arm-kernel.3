Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCF9C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvJR/UgWbB0Y95dY5yTGqu0cAZl3JQBaXRQjPSUU2EU=; b=E4U8vK24iS5r0qRhK/YtyfnnSG
	Yeug+7rSFmphIv7wsDs3p24WejLjBC+dZO162rEp4XH5vT9WwV7kIR+7o/bihWtJ9x63eDDxYhpUc
	XE56YmMRctu9SmwoG1Ff00IhZu7uPBMI7JlYX9A0KDmHjDZqtJRdOm5eRaOxkQRb+py75MIjUEU5U
	HpYTM67YrZe3+Lxdd/NLKN/knUVq8zZElb6pCH9+Qm2sjPeJxSQRKnZFAa6az7Zg3WggVgkeFdevq
	ny/2F6L0Zdnv8pfYXDK94vRtms7vfQ028SlMmwieZmCgbiNm5x8EpehU78CsD3JMLkjSPOITFC41k
	Grr4eMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwvJ-00000009Rd7-2pLb;
	Wed, 05 Mar 2025 22:09:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwXV-00000009OXd-2ySe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:44:30 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43935d1321aso8948895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211068; x=1741815868; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvJR/UgWbB0Y95dY5yTGqu0cAZl3JQBaXRQjPSUU2EU=;
        b=xeS8Udbx0kNtGjlEXgBeP940KExNhqvegKy+M1PvBfw8RuEmnHThXNnD5RSMHc9b/I
         ynPGFo8kM7e2PLfAuJHRH9C806la+aW5WCrY6/Wbv31cBTTXi7cssn9huEAoI3Mb7uft
         JVeLteMuqD+RuC/j4RxnlP5S68QJJFn37Ph7BJsEuNhgK++umkaC4Eh2Q19k/HbDWuGr
         hQVdi4wfdMYfJMr1kCMg924XBQDKHO7ATWBQ95njBmf7JnAbZ9mxAvm6ULu2j3GAGayg
         CRiuynP6bUCIxFxVS4ghnTvnknb0jcNlMR9nj4fcXUA2O1gNGc+frPle1LVxIRru5Cvo
         rzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211068; x=1741815868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvJR/UgWbB0Y95dY5yTGqu0cAZl3JQBaXRQjPSUU2EU=;
        b=UJJTGH0IgZ2P11xt63wmgWc7y5Qf2raHIFGsy5DAGPsJUNnfivHI1+90dHQpjKrgu7
         LTmI2p8pM+IMdUcPzJID52oygLbmgyEw2AFTL5gEW90dlBnhiC6yQQb113fjeazyvBxG
         331r587DEWtm4zlovaWsZzWbMz+P6OZGZdmfNkbN4afV9B551VVaTHKb4y6Osll1sU/L
         VVMlwV5n4ErrUnexuiRkVWJYobRO5oO8cAQtH7FNGAjkqKJ9dTCUAA67awt0t6ojI/Pv
         3v0+XC72SqQ756Bk5Qi4KSnLHAA/O+nZecoXd0U30ZoMR/ncKeIPs34gDQq63DXJiFfC
         J6lA==
X-Forwarded-Encrypted: i=1; AJvYcCVFxm0rrv6dCwClKbB4k72T7E9OFdZrP/P2Z6oebKobIShBiPkVQI1PxIwxnj2/BzMPMCAd1SSIbSZkXS2+135H@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1rgqv/Ze7AkCxeDZzSfNzU2LMGyKlBevyOxC4rO1nkxf1yE/+
	Ws99Ztkv8+LoaHaoIboR4KCbj/uXsQ/rOcQqP40KjeBU1XWzeELTJ5h6tc0vd8g=
X-Gm-Gg: ASbGncuyO2nhMiAUUL8y0mfMtN0jkbJkzx0jt3OAsSs2cKlfdxBaWgkn0DPcCV3oaZM
	h+6FCMfXeT4h3gpdrJ3z310HiWNddXNzwX4zukeLzxjRDVN7HpOmiAMl25esu+QZ5+7bR8uO4B+
	U/B5+i46UlwRfTgRCLB3XlMv93PD6b7j0F5t7FjBJHUquxVGMagIXNX7PfsiOq9X/DrFQY7xVAU
	d9+RW2KptaNCnTBx6zuC7fCMCqOnqKexATmWKskIWL7i0mtKxUTx4waSalG0TyebqYYXprmJKoc
	9xy8YC6FB4EwJyc1ydbGTesXPUizad/pfciNfSJAbTlI4b8kNWivC+sHP1sE
X-Google-Smtp-Source: AGHT+IEfiEgY/qQPsjfAHwqPHWvUio4LKVVsu3dARLFG1Me4Rjq1M/OsmWBaW45+uUzbWFMumgrf6w==
X-Received: by 2002:a05:600c:4f13:b0:43b:bbb9:e25f with SMTP id 5b1f17b1804b1-43bd29cad91mr16171735e9.6.1741211068217;
        Wed, 05 Mar 2025 13:44:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:46 +0100
Subject: [PATCH RFC/RFT 11/12] clk: samsung: fsd: Use
 platform_driver_probe() to avoid __refdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-11-a4e03a019306@linaro.org>
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=89/UGmIYFussasYTXbt+ZbFvalxApAT1GYVTM6AOduE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWgWFJDkVQCc1i+yhnz77KxtQ1OR5GmvrUN6
 SM+Gw/BWNeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFoAAKCRDBN2bmhouD
 16FCD/47aZXBychgEdxYVzj4yl6nWtAn7j7AgmJ19ALj4jYRy7GP98BquvEZ/MwMqJWmGuRqI38
 w68R1AeEt4tGnzHAbwLWC1j6aHlUYHJQEKFdcuSCxNqcYz58kednws3q2nlx/lJK8L3H4EbrRN1
 cA5eaX94yDhniAi+F6+c3eF9CKQZjppPlt+Xvkkp5+MKXRi7088qfarLELdHzHS0pkhFfNfGBd4
 ZtjQQFwh3ihgXlxL2ldzAOaf3ZJiDahHSE3jbSwLNc1FwgWmkwk2G5uHTrmBZfQXFEZNpgea021
 ZPH5JvpmFDb63GD4oUaqpKB5LwEhGWqyZyezrK9Z7wEyZT/0N87YWV98g9RgcOn0AHu57cU+kGB
 UoQXmHtf6YrLMhGxEdtZ+lGX3dqeL0Uuqhj8TaoAduRNHmZij5lBQjr1MQbC9sThhJKoEnJK4KT
 d+R7LYdGdWFcpUY0Wfflbf+43xkB0vsf2v7tD7nGedHQwNIS3YxctxaUAYkBOEsJJghHJd9xn4S
 CZNeoJaJimg66/qCwMXQwPUsU85qbAccdoiBn1pJznVrzQJndUdMrUaK+ctWfhIKlNURQ0L9tPC
 QyGmbRa1G3T78984UC65tN5neyDkVCzYj/LctW35YEBODWjaclmdfw5FHn7XwZ+sZakK3dZU6tL
 5v632bqkGzWCMtw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134429_750615_17D5B546 
X-CRM114-Status: GOOD (  14.52  )
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

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-fsd.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
index 9a6006c298c2a80da0e29aeca3b09cc827caac0c..bc0287c780bfe3a68a38f53f554440b3000b1ca7 100644
--- a/drivers/clk/samsung/clk-fsd.c
+++ b/drivers/clk/samsung/clk-fsd.c
@@ -1794,17 +1794,16 @@ static const struct of_device_id fsd_cmu_of_match[] = {
 	},
 };
 
-static struct platform_driver fsd_cmu_driver __refdata = {
+static struct platform_driver fsd_cmu_driver __initdata = {
 	.driver	= {
 		.name = "fsd-cmu",
 		.of_match_table = fsd_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = fsd_cmu_probe,
 };
 
 static int __init fsd_cmu_init(void)
 {
-	return platform_driver_register(&fsd_cmu_driver);
+	return platform_driver_probe(&fsd_cmu_driver, fsd_cmu_probe);
 }
-core_initcall(fsd_cmu_init);
+subsys_initcall(fsd_cmu_init);

-- 
2.43.0


