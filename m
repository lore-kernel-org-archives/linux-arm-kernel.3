Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A33E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 11:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9J38BNMU1Uzv4f7FCoN1Yfwc75lF73CELPPui56iYw=; b=Uax7cMRBn07rB3xdixmq/Khc1D
	pwIEpv7d3WXtMVJThMVjylPySP/LpP5/nWsxcSrTif+k7roayZGQsx4S5KgIoby1xym0smQm+Qcrl
	rbw4+PoRNGw0RxRHmsk/Jg1KhjTv8n87ogM8qRrbpbmz7coTOxktQIqKfZBSAbvUR/Fm2gpJ9W+Ru
	sO8QHI5CdDxluku+qXI4o7DdaSa0lzX9b1U/TJjPK80eoS/fSyYKbVTTTCKL6bzdOB1RgRpidoTxP
	0W5OSaZvDdr9oJEWNRsOc7UjQaHKgRTWZUQ3SrCwtFJkI+7I0rM1vw2BKuXF9c9LwT8NTqo2pGrAW
	mH5ZxqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRrJw-00000003Jxh-0m7I;
	Sun, 29 Dec 2024 11:18:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRrFR-00000003JQ4-3pau
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 11:14:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21669fd5c7cso107668105ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 03:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735470857; x=1736075657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9J38BNMU1Uzv4f7FCoN1Yfwc75lF73CELPPui56iYw=;
        b=e59aRWI3cLf5nT225Uws/B7FUQDBA4x8lvFEiCmUIuhEHQBZBLg4XckdIArVzmFpH8
         Atzbat7q1lf4bDKxS24sLFMN23pguQAvkGfT9LmbZzCqmQpbYUYcN4NBIookSyjbo/VZ
         OsEihCTdt3ICgat28kbRTa3RcQ5UoJNWF1tLWlUxcDHR+hB0F3vrFvnXKDlR04lsReN0
         MC1H61FMhH2TjiJeiZc25ydIjCT7C0Eawc3bUbgRnvALg5xoDASAaUYSNeYplB+oLSCz
         P7cxITXAjuG2eLbuK4SLrAX8PfjJoNktJ3sOzbzEULngGirfSjvchyKUzlS2HZsDPx42
         q8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735470857; x=1736075657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9J38BNMU1Uzv4f7FCoN1Yfwc75lF73CELPPui56iYw=;
        b=jvqhE/JzUgbO88E/COe4YRNcLDYwJm7kenS46q6SqCsNY0eRtdMEobtdvYr5KYvzQk
         JDbS7ZZxXDO/fXxZ2Pvr4dFaQdfrvlwBlBuAI4WBbgCAZDzW4Ec5e4ABFJlqin5ExjUu
         s3jsF+FTCo3FctssfufPPIfpu214AV5IU5ybaV3IdhD4ElfiZy7WSWmjaSiRSWq09NDt
         teHpjqy3+aiGffHmtdrKSuQ5YNxjFQZpl22onb74mdBAmy4OELDNhD6Zda4W9E3Yw4t+
         Qf0EY1dh66d0hDoN9KCG2V7ToTfjqarG6og1L7Wb9Z8VbNSdj46EgMhG0FPxeK5VJ4zO
         2WhA==
X-Forwarded-Encrypted: i=1; AJvYcCVeif0lSZZDR98AfwxUIuRAMrdZw2/kdzBiqIviqFVDKkQxiYjD44PaIW+2PRnHsxvYqNUatudqvJT0X0ZGWzB2@lists.infradead.org
X-Gm-Message-State: AOJu0YzD3A0L3f+J/0302OSmgJFgl0SD/yr1GsDg3jqGqPj6uWW8lKJ6
	Bh45ygfGh3H4Mh87kUE/x87xGbmyTmg1+5JOO8O+/q66tYuynoxZ
X-Gm-Gg: ASbGnctbY8Fb8LpGmtC1U2of6zGMUG/SEIrHnwH1tY/kTuOTtw8tFtD1vJiJHp5cwjt
	dFAhTPfM+oJopmbqDw9aqbXGtNU2MRVN5Pzqx8EGGeTZhdLhd/CS0BKpsnLEKLDrFcSz3wfP7uB
	Ix+oAlhHEN3agkwYIjGDyTI7eDDIL9xA1ZeI7g7YQeo+9TCrNSRP34ufRgx2wRgUmhvLYv0DKrO
	SMaMYER3jshvJz6R11FK217Zs3MrK+WnadMu+bca2twUbS27E1qlMT5dg==
X-Google-Smtp-Source: AGHT+IHj1y3F1X3HGHzS3Px3LuQKUEyT2NVI7IfSKzHwkiIrQ3sJyJpJf3UtrIia+cnNqjNTX6LRiw==
X-Received: by 2002:a17:902:c412:b0:216:4972:f8e0 with SMTP id d9443c01a7336-219e6f2ffb4mr459732985ad.44.1735470857377;
        Sun, 29 Dec 2024 03:14:17 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca02544sm161655895ad.255.2024.12.29.03.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 03:14:16 -0800 (PST)
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
Subject: [PATCH v4 RESEND 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Sun, 29 Dec 2024 19:11:19 +0800
Message-ID: <20241229111322.4139-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229111322.4139-1-towinchenmi@gmail.com>
References: <20241229111322.4139-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_031417_961985_380A60F5 
X-CRM114-Status: GOOD (  10.37  )
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

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..54a6c8ca7017 100644
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
+F:	drivers/video/backlight/dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.47.1


