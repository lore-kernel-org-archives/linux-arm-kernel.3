Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD6EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWOn87f8FIIe4C+aLOBOUWqe7yflMdB9mmXK3KEpF0Y=; b=niESEOboCaC4Id82swN0gFKE26
	zVmU1Yl22U/jpzde1hqr1F6Dr96CA4r/c1XfahCVuRFhNtAkfgxAQdID2jcL3D1jeSJrwMEq0HcRc
	8FnF2c0uP2zHstWVVfbrXNU4VK+r86p/ITUF1kqNzZLdWj6ebahiFtxjPUSjq9FLW6qf8ApiluLR6
	s4Cx5ygwETkukLCgIm9ciOPHoEViuNQBea4XxTsv+bqsPWxdAgx2H5WVEudDKLQrypDUUHTKUuV0S
	pNT95DCiWqaBKnqUhLz4gpWEFDAvMbOPVR1Qs8A0cvxwRarGMn2cLZfQMPShku/0H3LozVV90OY+N
	TNED6uEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjl-0000000C3tW-3gQz;
	Mon, 06 Jul 2026 09:35:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjJ-0000000C3Lp-3Dkc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so17674645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330508; x=1783935308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWOn87f8FIIe4C+aLOBOUWqe7yflMdB9mmXK3KEpF0Y=;
        b=s87SLnObqkXqXgzJvbyS0qNxbLeyV9/Ov/htRkqxifSrHYp2XW7AZSn2vDzDBzt6Ld
         1kOL9Egfl4F4Ph1ulGYYt6SDIxZvkS6NOUNrQx11Avhr6pmalE/h1F04egdYYgbK4DzC
         Msw4o3ra/8SN1i39vNUjViDvQ0kM/yWmkEYclM6KUWCoekOyNM4aJ+XSEB9JWzkNQrrM
         8jWNkWIDe2x4jXhLY2ZwrP7qGRoQI2qY3ckTpm/eU7DUWK0aUiEcE2iLU0FPmRHU0qWO
         QcONI3kdzT/YvH6Y+W7Qha4jXahqRwdGPy5xWLRZkIrCDkxcYXCkfrLcGT6MofPAabYF
         vzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330508; x=1783935308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWOn87f8FIIe4C+aLOBOUWqe7yflMdB9mmXK3KEpF0Y=;
        b=O07ao02IB/9Slr9fYNESoKiuj7CTLu1bkv/HINWxDtWCreUMFMdx/A+stL4v3k6x94
         WRlKz5LtGH+xUeDfkCDVo/2CF77u93UW8kFOprwkWEnkyfuHtskeysSV9mohtgQ2CLx3
         x+FtelK+Up3ixfL3NzYDgf/bklgD3I/K86r899fkFU+QoLjCn+iCy3OIj0FoI4RQeLm/
         ALv+uZQuzB17tRETW72ixvCgE57opFeIAeuhbgXEKLjtFrbjsL6ZKCtsYdaV3A6rasjI
         THaOKhZ0HSdYnY6CmlS1IUKVbVsdL8n5NsfZVcmeX3MauqYKTKS69SwFvAS6MRDPn/M+
         SzVA==
X-Forwarded-Encrypted: i=1; AHgh+RpY+ze4EWhkXpNiIBM3v1BoaStV6lE0c0Xt6IYWnCDoWOybGcqWL3zo9QEQWvTbIcP9YZ5SSxaahOEXYZx0R1a+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6KB56cjtDhGLpzOESVFL4L55qOgnONZyxvMAtR+hf9DAY/wg6
	BVzIzaA4qwjxUcIw5/WvqRiTZO66yZjV1N5HWWMo3BFiEaJXfMCXHWxL
X-Gm-Gg: AfdE7clYy8J+wm3X9g9nLCngux9E7y4x9aZIsVMhXXISuAe4KTzOHeyfKg0ytxAlUP4
	QkUq8vU7vy+ekcyYe4HCgZnoh6vlPG+9ps3MAOfA3E2KXMzxw+kbmIIX2MvrXjGq+20WZYhfVai
	w9wARwGlmCclOYYTphWCuHcZFsfF34dugIQUu3OjVecThV93gRpYogpJq5dpVn7FA+HmCWcB/6U
	bIIr+dqL6IOXXOYI2n4YyvH5HPvBEEkFoK9Pv06/C+3LaAKyuSOsmRTHIK6dww36sbAaeOkxQjH
	zUnVR6/pWvOt9mIFuiND6dWGFPyhHH/EotYcwQmBL8WdJ3lENwB7FzaXqCoooFHFQYnGDQU2WK1
	UXBaTFe8CsfYDQrnCGRNh6s6KBqcb+AMlPRF31sHXu+Wpp2hXUXchOAZ7elKV5JNu4RDaexP6Jh
	D5USRHRxhc/KQ9iMwURJTsz5cBtUOc0ECHVuA4jWSIKMVCy31j7itDpJm/cG2wojnPL/Hv/WzC+
	leFTYHqmaVmeVWAl4bZ6mAjdw==
X-Received: by 2002:a05:600c:8b33:b0:493:c2ac:58f with SMTP id 5b1f17b1804b1-493d128b68cmr99027495e9.8.1783330508009;
        Mon, 06 Jul 2026 02:35:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 15/15] arm64: dts: imx8mn-var-som-symphony: Disable internal RTC
Date: Mon,  6 Jul 2026 11:34:45 +0200
Message-ID: <7a31f7ecc4fbe9ea009dc7c5f611105daa989c7f.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023509_825888_9BE5B165 
X-CRM114-Status: GOOD (  10.69  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Disable the internal SNVS RTC on the Symphony carrier board and use the
external DS1337 RTC instead.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 2afb5b438b68..364127257309 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -223,6 +223,10 @@ &pwm1 {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.47.3


