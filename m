Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9062C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 14:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mVbqwsxzgFPfZ9lDdnu8dfGQADmGRwdt2QEaF4tnGI=; b=CEcagPgVXO640c78sBBvQIZZcL
	H0b8i47ZaElMap6anIDZgPggTPX4CiMBlIhafMCtp7FEGpJpsonVI9w5bt2xSXpDuJU0Z2uN5rntH
	7WbL2pM7u3I6cTJv3CYcWQgK4652LqV1gYS3uDw39H3wMqz+5dqmzEEDGh/1xRnxl385Vrq6MUjpI
	8hZxg5MnGGTQe2xjjvkAxNur1V9OZ2GotcI5zdoploKhgTe+Soga8oLYy1fAN6YXNsHMzBc23mVcj
	XG3QcJKJNzyYj0pdv7TmLJHk/fvxioCvpewpELgXAAdB5zhIq7GXWP+QdscB+SdgaXUzeojVYJxTX
	tblYlY8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBaoL-00000005RTz-0cfs;
	Sun, 04 May 2025 14:59:21 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBabE-00000005PRa-1vb2;
	Sun, 04 May 2025 14:45:49 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so5247687a12.0;
        Sun, 04 May 2025 07:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369947; x=1746974747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mVbqwsxzgFPfZ9lDdnu8dfGQADmGRwdt2QEaF4tnGI=;
        b=NppcLZePDz5GdRw+C4Yh+33QwWZ6fNVGYfRo/QMgB6mbqC8qctgVuN2H00kcLp5AKm
         /r5stPKKjmzDFhy4AJ4SJTChmXHHV+zTZRpMdvNSAmMoxWRTaZSI8szEZ+1VFH1vZacT
         Yhqkj8Nw/uPkWw/dU2vEUCG+HNecqFEtAp7sgc+qizmtzOw5hhVfXn3VCrlLZSJUyzJk
         vqr7mhfGG4vomT8XbsY4U6MqGo1CCwQU2xGf31NuKeEy5PUL1bVzGaZuOjyYQ+9jG1uz
         a7Kh+6hXgKrmQFb7dub5cix4PM8D6KQ6KDqRp7K/boCh3Dy/IEwmITdZsTPJ0p/g32mz
         jtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369947; x=1746974747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mVbqwsxzgFPfZ9lDdnu8dfGQADmGRwdt2QEaF4tnGI=;
        b=KL10pEv8VHlc6Bxs6uwrfUfItvG7bIzlMc0nKYUqtewBU/6oAvkxw0ABe6pbyF0DQC
         rL0dq3Os96wMMZvQfDf4+4I7DCXTuJ19oQJsqDMjiO1cjx+IEGk8OHOLAYzRFVTMSCvc
         vyZ7PDF3LEMecN+wUGcjT3iXfL+aM/btv4b1d7coYnas/H3TDLrKvj/Nq30lTQfiabGl
         zUGouO6sG+c06JwgH48w/6hswzclRW6K0g7S+RFDGjgQc3SJbPtmCKjjcFGbM5H6bCOn
         QN0hhnfz3bFCUGriXiyZg8aejET6yaMbgl8p7DSVophGhCEy/dyafoOOL418GnGa2DLA
         jpqw==
X-Forwarded-Encrypted: i=1; AJvYcCU6LLWnsCmiPiRnwjJe8Q3rpYvrHfWBYGaeoHaGsebTiDkFI+XasZir0UEU43ORMQ+tx6JX4q/u2K1Zv3XLBEQ8@lists.infradead.org
X-Gm-Message-State: AOJu0YxupNpomKbPqxoF+ugdu1TJRzPOTlMSMoKr97M/Xd6UWuiBhPQe
	RGt7H+0Qm5doPlXbLeUnh6B2n15fEk7RphqGQw6rOsOQllk/rT5M
X-Gm-Gg: ASbGncvyZCNOzMpeibZBXW2UAgLOXnpRkqd+bwFQU0rbWhA+vUs2NDV0Ocyqd3Puxco
	3lnMTStjCc2oebweXMzvWC1AeplwNIml3KKjZklmoloKnVJ24wuYU5D3y/bCyjNyNH1lip1+bYm
	sOlS597BPxDzAkxEtMx0LmZvr0r9Ie8CkjrsAj2YSOV4HXGgN4durMZRIWIx0P4JtLjWaVALMmi
	zGPmE0PUdw7QwcZqyJokchbIlt2Q/U+/bP4vY3dtKupjY1DuVH7fbx5oeGIBuXcO+WgzRX/C+X+
	PfSVsWf7fXCPDoK7k+P37Om9GIChmYxAhUmI/RbNPXtZlD2KZjleu3Vzq+DAan9vfLE3rcK89Rc
	APDegi5iRyrmi572E
X-Google-Smtp-Source: AGHT+IHjuIKWNJgawIjtwOkw8F15EvBzNiKAf12L7CVkflrKlhADiuEJeb1zBKuZ3rg6km845Z0EJw==
X-Received: by 2002:a05:6402:2707:b0:5e7:88d8:30a6 with SMTP id 4fb4d7f45d1cf-5fab057dce4mr3636267a12.20.1746369946576;
        Sun, 04 May 2025 07:45:46 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:46 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/10] phy: phy-snps-eusb2: make repeater optional
Date: Sun,  4 May 2025 17:45:23 +0300
Message-ID: <20250504144527.1723980-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_074548_494868_630CA945 
X-CRM114-Status: GOOD (  14.79  )
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

As described in the device tree bindings, it's not necessary for the
SNPS eUSB2 phy to be connected to a repeater. In configurations where
there are such instances, the driver probing fails and the usb
controller does not work.

Make the repeater optional to avoid that, which also lets us use
the eUSB2 phy when it's connected to a repeater that is not configurable
by the kernel (for example it's missing a driver), as long as it has
been configured beforehand (usually by the bootloader).

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 1933e8440..4094786d2 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -426,7 +426,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to get regulator supplies\n");
 
-	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
+	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
 	if (IS_ERR(phy->repeater))
 		return dev_err_probe(dev, PTR_ERR(phy->repeater),
 				     "failed to get repeater\n");
-- 
2.43.0


