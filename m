Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8662BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=; b=HKKj+MxXZq3LAvd8Met+Phk6Fi
	eq3ZNo87FhqPaS4Ow2wfFUkgkCdeOKpm8DarwBRh7TVlFs1waoBBYWdsV68cA1mPwdIDCjFlar455
	ow83g08A1RRBOV3WeRTpiOvRyq22Vu1XqFi9hWsHexfneONxO55FsyHhqjPrGC7Fm/ouyTpproeeP
	WEgx2+AJIGpbQ9Vd99j8oHUbauDArnfTt8hv0iKLy50rKOqGObI7NXhCE0MDdrq1eeNYV88+6dryW
	3cxv0ZPpraPhi6C1fjdjRCwuPMVrUX7IV6E5VtChCuVr1eFFXl+XEHQOlfBIlyzi1R4+HRGlV8qrX
	QQ7HzbXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tev5K-0000000FId1-3Xqy;
	Mon, 03 Feb 2025 11:57:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tev0I-0000000FHlG-1LoU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:52:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2161eb94cceso49914825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 03:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583557; x=1739188357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
        b=QvQOeu9ORRwUI4derwKZFTO+1bawyoH//2U7PlzKP0zcvI7kJsKVYpM7Rdwyz8ec1h
         YnRtChXSwZRvj+gUhFG8o7uVtsbkULKQWWHHswiSikfch8/BY3jEyr9OHJE8gu492Izj
         mkBTwC1wzHpkTv6cilrMwGY4aarOE/NCo7ulzhr39z5Fp95NM0l19mVZC4qQPgjRvGqr
         /We57DduKyq1zqWL/4ECsLLsVNLRfvRX9vb+CHRepzh5UUt3KL3egW9o9ETmJZvTS8Sc
         zVwfwODqkODavNer/sbHH3+0EifrU1e09mMhQicySx2FRJe8QWVRCBjZo0XMKIp52ipP
         wt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583557; x=1739188357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
        b=L+aBM69Y4YdUD0d9VOXb6/lC2NdzSA/aa0QDnEn7paXyW1zottQbypJ8DEHqGjpAIR
         IqeeS+cUWQ4UoAX0TVserOFvy6nwTVRhVIA/PqMVNqdgt6JwvWCHzzA57yZMM07yz4Iy
         d3eTGoeJ8x+k9G0Le3ov8e4zA4LHwMI4BvqfcadbT3q2v6LX3uaY0KRxZtJzPDTseucV
         x1wqCO5coIQAcV8ZNzMfzTSGeYQkb26df2fusVE8iSvFtlVOD7wscFn3ooRTKOUXxTtF
         AJVu0VcxmCi+fm0uPbBPH2DzxoynV2nNFNDfHItsGurDdYQaWPP0S/IxSjuRfgeRHBU3
         VXsg==
X-Forwarded-Encrypted: i=1; AJvYcCWp3DAfids4J79OyoxKpjE6vjrluW9IWssVW5LbpwSI/eb8Am5l8SaEoIebrRw5iViZvO89lLmW/HwkUCMYURFI@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ+UnqkATBmvFlLjp1ylNyahAQ8e5jPGm1wD9ho3nd9W90rJhX
	iX/0CZEAWHLXXg++q4kyW6TS9gJlygg7jMH0+oGabNlqpIdDmGjX
X-Gm-Gg: ASbGnctmhjZRhWqeOWxyi8YXgeMi31UGs/G9PJHJ79Jv9LmE9ZX4aTkVb4/uB8+x6+w
	r58UMK8zH1UOJUK8P56AUQ/euwbVKWKSlQMeh1vKBYTHPe7bDVnDJ6smF74QKHVfBiDOMCM287N
	neIZCzPixtlT0Pm/9s++hRzYb3vFwQgXaKz9oRFZuohnIu2KLgbhLxDEz8RNiFh0i3OrdQSmgja
	L4OP2+y3Y7bcmBGTYoJDjWzJVoHbrMgFr9tLqexZ4ZRfeS3ytz5Tnj4Be1/6EwU+PkRM/emG9/G
	T02h2RfLVdCBqxxl
X-Google-Smtp-Source: AGHT+IG9OzjbgkvCS8tq7nwliRQ7D0GE7eIK1YFb7OgjbU/H0UhSsEr4jVXSBegVQdOpNlym0wtPBw==
X-Received: by 2002:a05:6a00:4642:b0:725:f1b1:cbc5 with SMTP id d2e1a72fcca58-72fd0bc26c1mr38178820b3a.3.1738583557299;
        Mon, 03 Feb 2025 03:52:37 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72fe631c039sm8262408b3a.25.2025.02.03.03.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:52:36 -0800 (PST)
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
Subject: [PATCH v5 RESEND 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Mon,  3 Feb 2025 19:50:34 +0800
Message-ID: <20250203115156.28174-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203115156.28174-1-towinchenmi@gmail.com>
References: <20250203115156.28174-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_035238_357395_0BD657D2 
X-CRM114-Status: GOOD (  10.47  )
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
index 896a307fa065..a576324807f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2228,6 +2228,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -2253,6 +2254,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/apple_dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.48.1


