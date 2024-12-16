Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9E9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGBHS4QHf1CsUcSFjaZXRI9YWCCVYzt2h/iHstQ0laA=; b=P3bpahxKzEqFgW8kynSGGYPO5S
	xiyRlnFOaqGCgUytGQrR86lnKKvDLGM+nT8f1+ge0VDh98R7RAZOSoWc22SnTdX/H8Y4H5WJ2SEps
	V1qTzTYvzUST6dy10rZzi1oQ80RmMt9XtIns3GdDP0qoBiN30dm/T6Zxp857Q1f95u/pRgm0CwCR7
	CwAN3bFNGCd+RdhIMQW3F0OebuNCu4U4dcumiNdYicEhiF3/Mv0MRnaQSnmNpZHfbh9dKFXhIa+Cw
	SCA1uAIrvbbGGS9yr1mQMwrp4DQIUpgAmXkgxVquyQz8DVUKXFydj/I5PC1IBme+X6EFCcwBSunJM
	rmXcQpAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN77G-00000009VB4-3pNz;
	Mon, 16 Dec 2024 09:10:14 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN769-00000009V36-498q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 09:09:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso42274485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 01:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734340143; x=1734944943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGBHS4QHf1CsUcSFjaZXRI9YWCCVYzt2h/iHstQ0laA=;
        b=xwZ6w1zVGAa2zrodGlt9R7GWOB9oVYXyPXdknbYXdtwwd4PB02o6iBTzRiPcbSTsyu
         j9oqN0lOrWAe8FhcHyRWL/VKMSUgHibN62XXLAEvpjHAAXBi2um3Lp5+wB7bKx4WFzbS
         Y4tmqcZ+Ocbm9flFrRjFX6P0Gy2UP/U7Y86YFH3APxPPL90ORh0Cfu6wXfVBoXInNs+G
         rRly2XSVyqOP9E3Mm4Sdo2/thPlMSnWztwQYlQCqDWP9DnKoCGBufpuD8d2n5Qf3X7HK
         afjwm67zzxsnPZXbAatNp9owyeCkzgba1AU5LdMVq7zpSg9j46VQVWk0ouPUHDRhd1wA
         DCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734340143; x=1734944943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGBHS4QHf1CsUcSFjaZXRI9YWCCVYzt2h/iHstQ0laA=;
        b=OL8WA5EPqYORRe7tDvDyqJ26+pRa9iZ2Hg3e0gZLcdX2tdw7/IHhtLA/N/tctSdv7F
         QokUWK3G4xW1c00hTyv1YzdYYwYOsig/Fg5uqX37Sa5Z1tKJ17qLYMKARA8lZ5nrdbvC
         6yWYsLAStukyNHnuT2zQaLDwbBI2KEMbsjwDPHROifsaGtaENNRFbfHGU9aC5jVSq1+z
         cuuKuXqUr9YmdD+WZSsp0ZhbZ0nvm+c9ubmcQ0Ys6ynMBzDe1lQREDONl5PJc40jwzb6
         9PlTu6OHodmFndSPbqTbSBjT1LphC4bNOiiqbLSYnlOjJ0hHYGOcIHpZKAuwijtfc1I2
         /ngA==
X-Forwarded-Encrypted: i=1; AJvYcCXMeCJP+afPCMpigo+oVXZaaSRCxy0QSoPLmYG9tfil0RMog4eRsmQEy6+Jhb9gpMNQlUzBT/YKVP6NaFWZBDmB@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj7RfeLd1sVjZ8BYuid6TtFbLSsi77AmA4RXSIbakno882Yd82
	BEoBiHi7DF+fJLv2NaSzgW6MV2skvWwpR205ICLI0TU68C/Xw7T0/LcO01UeG+M=
X-Gm-Gg: ASbGnct8sV7850cUnt8GTtlCQ4qJLeJfjkYQuIpVlpV2uL0EgbrRHN3jSYLEIFsYoUv
	HVIh6jfEFx3vL9HLGqQJ/OL2rs7f6t+On8JTskfqQqlwmfPz4+p4SPeLg0SibATctAIRVEKOFZm
	yWVdEawU7mGNZv7F8JZWmfZj7Aq+yTvnynVd1SxsyUBHXpm64X9RkkaS5ClmmpCEmYgGix/F6xB
	1pHdq2MpO3OZ/bAPCwPpfqAwbFu/ltV31lNQ6S9LNsEsML0iH4nyHHK
X-Google-Smtp-Source: AGHT+IH72Dfr5eQ52hfcPTD2JDNeTzGbEvM+MfJLbWyJGQJuX1wyKsEB2Yp2W1KGB/T0MXX4Wu47cg==
X-Received: by 2002:a05:600c:871b:b0:434:e9ee:c3d with SMTP id 5b1f17b1804b1-4362aa93cb0mr85374005e9.20.1734340143532;
        Mon, 16 Dec 2024 01:09:03 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ddd7:943f:c7de:9971])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ef45sm133677185e9.26.2024.12.16.01.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 01:09:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-gpio@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/7] drm/vc4: Fixup DT and DT binding issues from recent patchset
Date: Mon, 16 Dec 2024 10:09:01 +0100
Message-ID: <173434013318.38429.808413721248542013.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_010906_031228_8D2A1D4C 
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 12 Dec 2024 18:36:27 +0000, Dave Stevenson wrote:
> I missed the DT errors from the recent patchset[1] (DT patches
> in linux-next via Florian, DRM bindings patches on dri-misc-next)
> as Rob's bot report got spam filtered, so this is a fixup set.
> 
> Largely it was changes to number of interrupts or clocks in the
> bindings, so those are now covered.
> 
> [...]

Applied, thanks!

[3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names property
      commit: 83a9752729c455a6bd9b7cf62198506180691931

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

