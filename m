Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D24CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 19:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=; b=iTg58I/U6aHoOwNmh9cXk/Vpwg
	9wKtpSIgkhTC6K1kxK8sT7t4Az2CAnXTFH4VP3OFQOlceaQZaJt2IKPffVfAoB/xMWl8a7qwGS+QD
	QhFjCF7Ph5kAFVhCk6U3sllRZiLp5BDSmDEVkDZfy9W01M5qYIQ+HZRr04xxQ2UkGFx89LjN4mb0w
	dcqGF9gE8Ur1WuA8UWx3ut2xI/axth5eiixN7TTMTKGyXZs1ndqhqCpg0PK3zd5Mng6osez8m1sI7
	XcIdUYQucZjDfxKkYrGDVwTtoP4WLr2trmVYirii4UpMyaOx6jx7zpPtvp59qICltRjWPSJKM+ZUc
	pNMU7i8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKi0b-00000001t4z-3x4i;
	Wed, 06 May 2026 19:34:13 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKi0a-00000001t3K-2Tit
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 19:34:12 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43d7645adbdso54219f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 12:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096051; x=1778700851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=;
        b=HylhzUA+0rvy4+Rz+pVJ2X3mCIosdU0lickMGF8293T6sBkb5jxmATvr4SlJIgCIWJ
         w1MQvN0kFj2MuouosKqblg8C3rYBHAoyUdd8vE0gUAAwcPhI+9AB8sk+hZ6FjOmfwZkK
         TWq7qzC/wFVHxMHFB3H5qkoNiz0XaHNath61wFpVFeY/exM4gGSLvRUXb3LiPcbKAmE3
         fyC9cRrQr1w+7VGVIaVvaGn42Q5AjGFpu5jJbm2Gl7iVtRZQqZzpTGLOSsgkqqDZrrht
         F8UCACo2ym2OoShX6JbJRP+ht49+D8y9J890bhcLFaqo9Ksn0JdfD0bNSDKVa+aiHkuL
         WzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096051; x=1778700851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=;
        b=W40kYBoihteQ5FWJmnV82XBLEso2VNOarlxa1EQSD1s4N8inPAroLWmp69oo+Nxsnz
         VIgsMVKvbrmOekVquv+qiWkdK0fu3J1sV3ySd1VJ2GkzaTEu5K8drjSApoNG2ee2A4dg
         RIpYmrHXpQu96jn1IxgftNvdwBpTVnolhMIMoMGZA7RJrHtBVA9uN6/Tu7XkbInx1DFV
         rDVuq8WTbnFclantjCA3yzzAxWBfTuXHXIHOtNeAvRkp+TGSkd8rFS/yhD0LG7v+MEqa
         K+l4ZMUeX5y+dwdMUoOwAoGw8YfAVokWN8xuY+NNoj61LKEDugHbapNbSLVr9fLH0MWA
         MCCg==
X-Forwarded-Encrypted: i=1; AFNElJ/HOses/WSCM488cos+rNNdQYiM1sQh6NCY0YMm+49YAVSfUPEz6Z98NdABFjs/Vz7+5Rsu/qlDHD6eaPUavntN@lists.infradead.org
X-Gm-Message-State: AOJu0YyhZ8MN6l/R9g9JxsQlgaUjIm0RX3bDqRHV0REym4l7D4GOinYo
	5s7D7SvOHzqv3nK6pfTmVtC9qG9sc/3elhDctCfRoqmp/B7WN2/da6Qb
X-Gm-Gg: AeBDietITnHD2VMDJURNZ8XGMKpkka3MLeBEMPP+Y5L8yp+ouifQ1gp+Absaj00LZJD
	w6tEP6kaeCr8/dNVpt+Q8NsdtP/MERTqJi5h3zFtQzEg6g3msutHCLpyuqDLpgEQz1BcWBFYq0C
	tdEvm4Z6cPYcywLxIi8RMOcJStYUK17ZdWk6SSMj8N9m+27hRBcYRn6CpCNEdlHgjxUy7uLunkJ
	XQBRvvIo7/mLxJANRnHIfADz1rJUf1+w+ZR2ay0HUHZdyOSiIF2MwRv5Oy53m2u6zvgx/7jt9hI
	B2Ejl1ronwJ4l21SImJJMNzFeliTqDXhQ6vxhrF3lG8TLZatYgybdK1uttOcifY/JlQz78FqngM
	CAW2ZEZfV0WpYSgz7BpW+ahG+pCbJDqdZtk7neUGlNW3D58PX4bsTNYF5lcb4BxD/Y3MiZbnSKD
	hEu5bGGGNamcFZdVeky4uoHLpbwN9t7A+zHbBcXTF3QEw=
X-Received: by 2002:a5d:670f:0:b0:452:75ca:3fab with SMTP id ffacd0b85a97d-45275ca3fe3mr1840819f8f.38.1778096050623;
        Wed, 06 May 2026 12:34:10 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm14895673f8f.26.2026.05.06.12.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:34:10 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 06 May 2026 22:33:21 +0300
Subject: [PATCH v8 4/6] amba/serial: amba-pl011: Bring back zx29 UART
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-send-v8-4-f1bdf3243b34@gmail.com>
References: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
In-Reply-To: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=OFELZprfvGMngJiiwTNQcz/opzneDKzuYgSzdRQRbGE=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp+5eWEF9Smqy9/+ZqLj+fvYU3rR6MQcKz77DkM
 QtvC+gIXhWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafuXlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIx/A/+Jj3LBH9tnjU1WCvDlmvuDKP60pwv77H
 9cpKC5X8jU9Rk6vURr6BpE8J21cX+UHaMCaKC/Cf+xiQjWpQDugt4fK44PCsOUg6F7a7+jGOWY8
 LL8LpnoGzjHW1NVmdbkeIqLE5Z7NBnnIsVb/f1Rm+I/Tw0MN30e9KM5Xfdi4iXUdyMh3pLKzLY3
 +USPgYvQz6P341ijtBwuMeYsMccIDefew83LipWaF+qR59w2l/s5dZcZHpWddYo80R+tS5HSACY
 MDD5qa//5HcW+9N3ya2Syb+bqG6LBe7ydReM1FxRWUPxBmcSSOQSUaBncNAGvKdQmGqfk9EQCrV
 sveBZA+Gm42mHgoXEghXSHEtf7qtxmr6rIiim6j/+MvLnoruinWXl1ift6t+tNM+wzcbRVXN9QY
 xxflUe2qn0gUmUOAYSRP5Dp3hnWvMs1BGlVRZ+rRaqDrxGI3MX2KBKDiIjhZR9Mi+j+IdTXdJYe
 dWE2CP3QhYQ23VqOhadxflZUQTwJi7pdOndO6VpPcW4uMJ0uxIp8RprT04JnghBw8juuFGjogmf
 qFdCVa2SkLAjHfVIzqLJwt4vQpVMbX3bKKVTOEv4m+UEZUB105F8UckcQ94A4XmVy4NU42WvjmF
 cGzwd9WYmlmtk1x1/KjQgxjaMnfuCad5XpV0o/9care4lwus9wwc=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_123412_656628_EF48BB85 
X-CRM114-Status: GOOD (  14.42  )
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

This is based on code removed in commit 89d4f98ae90d ("ARM: remove zte
zx platform"). I did not bring back the zx29-uart .compatible as the
arm,primecell-periphid does the job.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Changes since v4:
Use ZTE's JEDEC ID instead of 0xfe for the DT-Provided AMBA ID.
---
 drivers/tty/serial/amba-pl011.c | 42 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 7f17d288c807..f24cc403d9e0 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -216,6 +216,38 @@ static struct vendor_data vendor_st = {
 	.get_fifosize		= get_fifosize_st,
 };
 
+static const u16 pl011_zte_offsets[REG_ARRAY_SIZE] = {
+	[REG_DR] = ZX_UART011_DR,
+	[REG_FR] = ZX_UART011_FR,
+	[REG_LCRH_RX] = ZX_UART011_LCRH,
+	[REG_LCRH_TX] = ZX_UART011_LCRH,
+	[REG_IBRD] = ZX_UART011_IBRD,
+	[REG_FBRD] = ZX_UART011_FBRD,
+	[REG_CR] = ZX_UART011_CR,
+	[REG_IFLS] = ZX_UART011_IFLS,
+	[REG_IMSC] = ZX_UART011_IMSC,
+	[REG_RIS] = ZX_UART011_RIS,
+	[REG_MIS] = ZX_UART011_MIS,
+	[REG_ICR] = ZX_UART011_ICR,
+	[REG_DMACR] = ZX_UART011_DMACR,
+};
+
+static unsigned int get_fifosize_zte(struct amba_device *dev)
+{
+	return 16;
+}
+
+static struct vendor_data vendor_zte = {
+	.reg_offset		= pl011_zte_offsets,
+	.access_32b		= true,
+	.ifls			= UART011_IFLS_RX4_8 | UART011_IFLS_TX4_8,
+	.fr_busy		= ZX_UART01x_FR_BUSY,
+	.fr_dsr			= ZX_UART01x_FR_DSR,
+	.fr_cts			= ZX_UART01x_FR_CTS,
+	.fr_ri			= ZX_UART011_FR_RI,
+	.get_fifosize		= get_fifosize_zte,
+};
+
 /* Deals with DMA transactions */
 
 struct pl011_dmabuf {
@@ -3081,6 +3113,16 @@ static const struct amba_id pl011_ids[] = {
 		.mask	= 0x00ffffff,
 		.data	= &vendor_st,
 	},
+	{
+		/* This is an invented ID. The actual hardware that contains
+		 * these ZTE UARTs (zx29 boards) has no AMBA PIDs stored. ZTE
+		 * JEDEC ID (ignoring banks) and the "011" part number as used
+		 * by ARM.
+		 */
+		.id	= 0x0008c011,
+		.mask	= 0x000fffff,
+		.data	= &vendor_zte,
+	},
 	{ 0, 0 },
 };
 

-- 
2.53.0


