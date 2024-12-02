Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5784CD78326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezuuCfz4dXYu4hmKXltppQihukLHouMCBa2+WZneZxU=; b=lwds2mZYpo5ci8ynKrWjTD2dwj
	sJIBwdwbN+ofPD/QSxwEcf8da+VXxxny17Gloz3WtNgggTBk7aSIMVwbf1h99ZsiCwfZHAPerBZpL
	CQCnCu5yJXEGxaLHzenUj58vGI9zLX+imoRbQpnbx0p6B1GCfviHkcJ91ZHqmO+FnNrIjSBucypxr
	+FhS7Hggi14EqhRamXvkaNi1wz+IcH11jjqfWFG6NOSRtj+qZN9rRS/dYR7PDXvtrNXyVhSh5yObb
	NP6ljBJU+7pVJpWvFsBHFfxit47uH+/2q2mRFEpg9juITIAJa7YFqhJXVnPHOFGtLm3blriTtp9fJ
	BR1mlG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7YG-00000006Tj1-06Zh;
	Mon, 02 Dec 2024 14:37:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7TL-00000006RrM-2F0m
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 14:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ezuuCfz4dXYu4hmKXltppQihukLHouMCBa2+WZneZxU=; b=TNGma/AiQnB1GMuuTUPic3jfyZ
	oJ5Vo20fd0YZcTtu2wJVEEFnZwc3Q5bx+dU10IW/dzxl6hHFpZwQ08CarxVo7/OSPVautgDj/VZu1
	jPI8F3RsZckg5hhmS8nXi85sUTPw/8dukRx5bkTzkqei2iUWS3YVDcEd4f8UkCVSpdVFwS/9gNn6R
	34QB9Qh1I6gZmdg+5r22u8X60u6xmjC5KzTm3K8Xdf3lUvytAeA9yJGUu4V8GDhlre1Lgt+7MzUIy
	v9KNGLWk+yczujUTRnPQTJpUHEnKLkK6p9a6VdV/btBVxBUylACbpVEPrqR5UY8NCqRQs2CGmND8l
	Qw7Uevaw==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7TI-00000002BD9-2534
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:32:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4349fb56260so37462685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1733149938; x=1733754738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezuuCfz4dXYu4hmKXltppQihukLHouMCBa2+WZneZxU=;
        b=tek3Lx3ysRPym+pi1piKama6eN/SSL0K558LegAKbUp/f7MVmgST/JSjKzywCvjxoo
         rD3UkePYlLNoWH2BzNUTQthIEqThruFq4C23P8NkyZohbWxFhn84HO8+FaXPmmbTJK5e
         qJU9CLyWzYxZtAT7/4qINDnFOoJGpzP8hFaSYUS/QwB6QTq5kXIB4VC6+kBfow5BFqsj
         9DYsi0nle01/k4b2ufL2njKJQWJFvsAYheQUaJXzRN51uYk+F0hrvka8/zVa2cS5efTo
         HzRZFudk2aEberg3LgPDn8zolWWSxaRSFjsjN8nwjbZtnHASlNd35lOHeNN1S6OlGSxQ
         Ek8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149938; x=1733754738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezuuCfz4dXYu4hmKXltppQihukLHouMCBa2+WZneZxU=;
        b=Upkh5cuDj8VrN3VZKtzrWcSHqW+t9MfKBY1JRIguYY5DqDoTvUDpzJ++ggiHsvV9LK
         DFIKtDLxeiRHetFu7ao0ahpdW4phsNqLkbeyknKQ2RI8iBfRX69kiS1MLEUfs9ZbkuF1
         QBXVzt8k3kmoZwwBvOISgF2g+NTRTwdSkyv7x48vLlCE2whuQpMkNjSrAEIO/ETZl1z0
         idnAQIxbcfIQFusuIwn7PVEWB/u2syt4nYVR5IsRRLBLNVsqNqrjCSca2vm2P7b5finW
         o1cyaRGzsfhILiK8DvyAOwIiKGXaN1ymy74htU8lpGG7qBErv+eDoZPSZlxNzrEb/n4q
         3XxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQK0EkTMmgMyOYZYDg91uUu/NSeuvFtSNwp+cKhrNls4xFYtUJ5gPXahYEt4WvTY+HEmp9piSjtWiVAZGkMBwt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Hh8RG+gKs7d+Tz9NfjzlHUyW7AUnvuqC33jFCTWTBzLvvqaT
	GKLPx0DiqzaiZX2/d678P3ZLlI+GzAzDuqZCLHJ0x/Yj573TvseRIbe5FPReprk=
X-Gm-Gg: ASbGncvtUHSDh2YK2tK6l196aWqmVUQsKzkBJwuvGi3F0I+M1Zo1lTr5zFwOaXmw9YO
	Lc2QZjHmIE1F/AzIowmjssWbMMCaZa9xjLZEhaXUqGh9DmdEgpONqzwH0B2JE6W0ur/Qk1yLf22
	eRTXvhdgVX+MlsrVjZf2L8uAIqWeALHb1FXB45+f5kJZbYU1qcrV4b6vXpnsNyagQ963XwfuE5u
	lxupJCcsjQqVE4/h061bFCyo+fYRUM95hQMs9MoUg==
X-Google-Smtp-Source: AGHT+IFOZoOXIOMn7ZNkA2Tq2IsupVCxJJKuWUAQoyj7TMD84BgwJO2qsC/1IZqo9dXxiJ/IAPakGA==
X-Received: by 2002:a05:600c:474c:b0:431:5aea:95f with SMTP id 5b1f17b1804b1-434a9dc824dmr223443175e9.16.1733149938198;
        Mon, 02 Dec 2024 06:32:18 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:32:17 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:31:56 +0000
Subject: [PATCH 3/7] dt-bindings: gpio: brcmstb: add gpio-line-name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-3-fac67cc2f98a@raspberrypi.com>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_143220_662956_DEDD7214 
X-CRM114-Status: GOOD (  10.95  )
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

Support comes from gpiolib, so permit it through the binding.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
index f096f286da19..086d016df6ef 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
@@ -64,6 +64,8 @@ properties:
 
   gpio-ranges: true
 
+  gpio-line-names: true
+
   wakeup-source:
     type: boolean
     description: >

-- 
2.34.1


