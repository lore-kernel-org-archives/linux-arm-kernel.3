Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8971BC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eglGoRr46S0QXsG3q/hnCjtc4IGj4qTm0VYKUvrdsl0=; b=kz8QObziR4HK+WM3fNrucT/prO
	XvGdCu6VuyHFmFsGXKczptaIGqhveXiLintr+sK6+bGbS8cMdRbz+gH56Olr5asmHrsnJy2xIkV1S
	dQ+aM9Q51s8Vq+tARDIdB+VgGYsfjgjmlR6udjD3rGiP/OsN9GkkipEx222X2mLPImg5XZN0tbTRL
	wXTeDc7hy+N0pvaBFyLmHGp8hcK6p3pJKveQAO9+lqPdrvwcyihs8QlOZ04kKar+3h2KgKFwN3sQv
	Q4U4qa7WmU63tZGIn+epSuCQS8SzJB59TzpFPySetR+pkCMEkVLv8LqSZ1u+dvawpdpjc/YQhwGJ3
	X2usS19Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdhV-0000000FByC-0C0c;
	Fri, 21 Mar 2025 14:50:21 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdXs-0000000F9cv-3EO5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:40:25 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso2067797f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568023; x=1743172823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eglGoRr46S0QXsG3q/hnCjtc4IGj4qTm0VYKUvrdsl0=;
        b=mMqttNVKcDMV0nfG+LKgeAvMP/dG87r/e79edbq+CTRRI4YSRT3rKLXqYC6H9hksch
         iovuwoWIzTzXM+9tQTmCc7b/fnlWNiIRTCYXJLf8J6GKVWEy8a/ilN7LVoi57G+Jyinu
         zXN8X0LWDlFih9GIcT5o34/1tOrodMDZGuWQLo8nE2GRAuqPy3nLwbV1D8Tg43QIaqzF
         6wb+QozLL77w2y0IId2EZjDcF70jER/ZkEsUN4JtiZ9n9bWvwHNGpJ1QuakD7oM9qZd0
         GPzXbjeuUDTqzbtKc7wR4yCOyG2/y0xOl3wj9cxu+/aHwiJXHD1uYsGWn+3BroOKhxgX
         YAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568023; x=1743172823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eglGoRr46S0QXsG3q/hnCjtc4IGj4qTm0VYKUvrdsl0=;
        b=wKD9CJakNEBVfrkObMSYJk38N9kgB8XCUobD0LLk41w78zEmX+61RkVb9r3JG8ggkj
         H5+Uu+U4YhVGzGORXndMiBTXybtcTQb1E0ba45fmhq+5/9rj/zcXJtoftJgFnns9O/0v
         uUA6khtbH/SCslN1Cf5b/6zknjMUwFo2Yk/kh174Mv/l/jp4Cpw+YGmplgZDlb/4RWQe
         xNXp+NptxOxMb5v78J7K6o+lIIuyFW+IjfoJvf8ivgBXhQRtffY0L4stQXs6T7LIshuk
         joyhgIMj/KTE7RWgBPb6dxca8M4FqYIw6+vljQHtB8US4qufYoOaXAwV2f0wblraMKNu
         zsKg==
X-Forwarded-Encrypted: i=1; AJvYcCXeEt04GUq5/AY4VppgtJSAnU0b+bXV+aYgPusCGeCm5T1iLCbahu6vCx/NRoVy1ah88h1gz+rTo4YMZ9ojQzOK@lists.infradead.org
X-Gm-Message-State: AOJu0YxxnZd6eZHzuZcI7eHe1UICma3Vs2/xwg23ZYzb+BsGRq0QdqQX
	rxkhCAsoJiwQ3RmYIGKkOZJrZFPtc8LKg5PSLdsbUNEGbAcDkME9
X-Gm-Gg: ASbGnctjVtYwjFa23K9zi5ZujjAa//YAn/2i6Q3ROP3kKGNFP3wxoY7RGl0Of08Ipl8
	8+9Jivt2i+YkvC72ni2qU6e10+ed6N7+33pDTR5L9oMqSAgrP25bx965uuZPeML1HHAxes8UsvN
	Z6CZWr5uvgh4aqjiPELn5wxgEe50riQxvHEf2d7JKISbm2mmKoOTu3F5hqAK01z0kkkEVKZ9oID
	pWmZKMuYCDU/L6qKBPxRkPyccKwvzDgn/ev3yvzBuTERDZOteT2jcL3CLxP4/7ozFFqdANCIgyj
	k49QuqUdzSAedhONaU8tS6/ptVOdYm5A1M91YDWMhBDcf75YAMwf+jM6OEgjHb/Igt3OWMyxm7M
	uHwyFjT0j5EJnABRfmhAO
X-Google-Smtp-Source: AGHT+IG09EROY+oEC6yp/vRny6rDAviKeZX0i4uUBWkSOh4NQpHpFy+lKrIENtHAQqslPIXneUrUTQ==
X-Received: by 2002:a05:6000:186f:b0:38f:3224:65e5 with SMTP id ffacd0b85a97d-3997f90101bmr3184130f8f.12.1742568022883;
        Fri, 21 Mar 2025 07:40:22 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e65d5sm2557156f8f.64.2025.03.21.07.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:40:22 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 2/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Fri, 21 Mar 2025 16:40:16 +0200
Message-ID: <20250321144016.1434848-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321144016.1434848-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321144016.1434848-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_074024_816683_E4A28626 
X-CRM114-Status: GOOD (  12.11  )
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

Add Exynos2200 compatible string and associated driver data. This SoC
requires a Link interface AXI clock.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index f5d963fae..aa22265c7 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -145,6 +145,12 @@ static void dwc3_exynos_remove(struct platform_device *pdev)
 	regulator_disable(exynos->vdd10);
 }
 
+static const struct dwc3_exynos_driverdata exynos2200_drvdata = {
+	.clk_names = { "link_aclk" },
+	.num_clks = 1,
+	.suspend_clk_idx = -1,
+};
+
 static const struct dwc3_exynos_driverdata exynos5250_drvdata = {
 	.clk_names = { "usbdrd30" },
 	.num_clks = 1,
@@ -177,6 +183,9 @@ static const struct dwc3_exynos_driverdata gs101_drvdata = {
 
 static const struct of_device_id exynos_dwc3_match[] = {
 	{
+		.compatible = "samsung,exynos2200-dwusb3",
+		.data = &exynos2200_drvdata,
+	}, {
 		.compatible = "samsung,exynos5250-dwusb3",
 		.data = &exynos5250_drvdata,
 	}, {
-- 
2.43.0


