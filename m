Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FDEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6D+Duy2KSB23Y0Rvwa3w0ojen1q7SpzhhAe7Fua6DI=; b=OcnVCLYBVzmWy7czcA7LEouSdq
	n07bVZ+iFwFgyF6DWz7niLON+WXPMjiuuSIk46yhkDFPCiM8B34zjs/DpxOSJ2Z581EkhR0agXtwd
	7DHcCYvS46TT4WAPz8KH59sWYWE8XLpbA0xJoX5unNY/vu4MiDF52YGujXK01QYf19QQea4GJ6uAL
	RhAy7uFSQAfMACwigIRpzF/iPlepg0CgWI+hbmzkqYgYoogwgN++EwdfRv5jbZxxSUCJWB3GQ04m1
	/G6NJHajD8gQBvAy52Pl74CONOn9+k/RkI588AWRlDtf+ohwgAP9VRMIO8wDaWbwbmS9mIC9mwOE8
	Hk1E2dgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCie-0000000F2J1-2bti;
	Fri, 10 Jan 2025 10:58:24 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCe8-0000000F1Vx-03X2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:53:45 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2165cb60719so33201365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 02:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736506423; x=1737111223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6D+Duy2KSB23Y0Rvwa3w0ojen1q7SpzhhAe7Fua6DI=;
        b=ICLqwIBEx3hps65sXMlywnve+bxyUlrZH0rucq24K7+YINfmtXXrkSu/5h8Q5b86al
         wAGUASEli5m7v75koQ7oDzAv4AMbyB0YY1dA9I7Tqids/kHa4UpukcO1C0ln2A6Z6xKH
         JUT5wzDUQ8mITqizBcVecdUntVCwpYKmSKDT4e0iTUL6JSFhzWC49p4OKVdXSVN6Stl6
         Zl7bnr5b9OtC6J7F/IcypQUOkUMQwcWRfK5X4jJU/Exoj4uNCtHH1JPV4eV8s+z6/QUs
         iUWeJoZ2RVq32nR3d1xjDUvTQbBYhBqJmGc+456m9UO2G2CohO+7rCX1RRtTOdP4h/Z3
         B2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736506423; x=1737111223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6D+Duy2KSB23Y0Rvwa3w0ojen1q7SpzhhAe7Fua6DI=;
        b=CWpacbAt5JRBJej7ZZ5jxcl9JKvPqmFX8nZK4OH/S0NOx5m1kn0ot/tWnRelOhExxR
         bV7JiszTC3JA+O4QiQVMEQdXacNFoc21Po8fa0HxSyySX4w07jxKLwwPrCnusuJ2xY7+
         Q6FCR8OnmW01QoOphPzvDfDpVQd5no2bPk2nf9LouJS0pLlV/PWXDZkEoQuTCoCf4jhH
         RXd/1tZwV4L2mMOG55xjmxsI/36g/tq743/IOp+bn4qb8T3wrEAY7jdvirvyGYUIB42h
         AhsPKglBjtwbT1CS4nwIKtDvtvI3/EohpkcIVzeDBK/Bsbi22ZT6mtDyZljjmH7l5ESc
         tiSg==
X-Forwarded-Encrypted: i=1; AJvYcCVOtbgQ3h3JOkFXqwvfQnxGR6ViV1GvkVv+KnUzfoP8b+nWRwZw9BZMQHsDlnCRrZNVQtSm56DtUKas034B/GAw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8xKMG/MKYx4azT9IcJ4FaFTf/eFN8q8yv1nM2Xbu9CNKIDO+B
	L2/tkP2BBIE/CXKE0MDHkF0X2P2+CSjZfebi6bFnTHBSgeMimAtp
X-Gm-Gg: ASbGnctp1cS4acaTFtg/JW59mlFVtBM9DZl3iGb5NpKOBIWU02dBWjKHuQAnZSU+Z2q
	KaPeUJxTBeOz/ybt0SayVqcMwadlCwlBfVbKJba8ZKNxAFBAlQPiEwEpukxeSaAtCibWuRbrJs5
	YpEMODODRDeoH2hKEdq/pcTxi1aC+nKz20HA6wDuGZ/PO33FS6GI9l271DzCPdfvbzbNKxSNeSi
	8VUZHU3Ga3gq9ESiVbuf8aXqbdUNwd9H0KIhSbgqKYzHM/bUr4WVKy7Dw==
X-Google-Smtp-Source: AGHT+IEXc3zedWc5CeLrQUkadcVEzJk8eqcEuyttO1WR8DTZLahGcQx2U529vW48eyEGuwRsZNX9tw==
X-Received: by 2002:a05:6a00:2c86:b0:71e:e4f:3e58 with SMTP id d2e1a72fcca58-72d21fbcf06mr14713527b3a.17.1736506423154;
        Fri, 10 Jan 2025 02:53:43 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d406a57dcsm1333403b3a.170.2025.01.10.02.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:53:42 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v5 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Fri, 10 Jan 2025 18:52:06 +0800
Message-ID: <20250110105304.71142-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110105304.71142-1-towinchenmi@gmail.com>
References: <20250110105304.71142-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_025344_048733_540B7965 
X-CRM114-Status: GOOD (  11.25  )
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

Add MAINTAINERS entries for the driver.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..67ad74f987c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2196,6 +2196,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -2221,6 +2222,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/apple_dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.47.1


