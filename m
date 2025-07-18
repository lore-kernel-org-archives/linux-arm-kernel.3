Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B262C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPCXaM2fReTmTR1+dO9f5EB14T9FRoV7tVgoNxuKveQ=; b=39ffbAX5rfQWYmyifw+cFPxQcR
	wrnd41SEWz4HHmH1S5BCtKQi6S7nI4+5YCggxskgAnmjTI6mppNwQJlRgC5Ol0w/yJidkxWxSTo0n
	/uwCVYsTLX36lYg1AgmEo0YeNqbwJKHIpQXIO47X1ma1CjvRDvln6cpcGuWfR2/OC7684FMVVBL84
	+8C3a8KJPS+WFdN5grkSiy8yRiiY2FoFRma4fuUoL9XzUQ+geYZ3zr8BsFHMNYVul1ojZZKgGKqQL
	PzyDL4vD08kuuxhsHG4Vx6b7H9UnpXBvqSGYyvVC20ujz5Rfn1HCSquHSJJuCOH4QO8XDfL850Lf9
	G8IJqP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnYr-0000000D26Y-1i1T;
	Fri, 18 Jul 2025 16:03:49 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmxx-0000000Cvvd-3qas
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:43 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so1134402f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852340; x=1753457140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPCXaM2fReTmTR1+dO9f5EB14T9FRoV7tVgoNxuKveQ=;
        b=CDFbSWixwXMFTLWUWFKjtqRZ8j3Gh0GCZZ4l96PzbSxbQIvxBWmPSIYjj6hmOQqoEf
         ZBO7qd2JItG5vqBTFjJkL3ThwYiYi8znQVEE+oKrf7anAv50OneqIHb1gf/DqN2evP/p
         TMxjwblmCq0MXII9MtsJTpUgIcIIREJRbnUnCS6ec0dHgkCRdczXYYxhNB9SWHhhxX3a
         FP3q8Fieh7WvzyiiAnp+7pS84CpzEpLEWZXzo1tVTB+rMXPGNgkIdys3+IaEx1tFyxlt
         krW5UEKaXC1rm0LWOe2k7zOQJroDqP74zvtaWR3+9W+7m9pjV9S/BAkjMnBEmTmi4hkr
         koQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852340; x=1753457140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPCXaM2fReTmTR1+dO9f5EB14T9FRoV7tVgoNxuKveQ=;
        b=OS4pHWTMdOLufLs4DpsZKVXRg6toGoudZ9IbLcwv5SfAh7EIcRToQGPkDRj/dceBYe
         GbtdBwrb6iMTqft8Fnks77Ngxzt8pOtHf43JKoCB/SXnMg2PrwZjTZMxH29XjDhU1mSY
         ce1wmKwVNqtr3gyAW8zaOaJ2K89q/f3Z3CkUnysJYcv6kfTW2nRj/OSp86tSyb5j9E1F
         IyAmmRy8GY+6r/Oux/FkrI9+ALzNfsXYE8dRqIO/Wefn+EpF5bfYUHB/Zg12pcZheXp0
         pT4mF7jVnK0b68LRHleCl2Z/yb7Re1Mmz0ySoLkkOlD3qNlbfkV8ksXZsOBAY/vxHpMJ
         IDMw==
X-Forwarded-Encrypted: i=1; AJvYcCVE8H+ZvG6em6di2p3zloj3QEB0Esb4znsyP/7p9OaqpngqxlGU7GmnkhL+0boudeW9h+HZzFZ35jUbt+jpepXE@lists.infradead.org
X-Gm-Message-State: AOJu0YzZji5rPep0SArvCoMvi5B49B+JAHgbudSEXSXzgJM1efr7kkt/
	2osduPxN59ERTIjuRzKK+huJDZHJkVGUTwFZXZsA8DzL05i5gEn4/Wsl
X-Gm-Gg: ASbGncsYHKeV0UXjYrD0yd4akfEA9R+sGMqCTsV3RqB0VHePzsqMe9BwA6LDcHCEPqg
	jxaKXNHlKHMZIS3Y+EYiirfci/J/siqEDGLn9Q7lH04B94U6IANrARA/rNqnTSn8tfURe2ezSjB
	I3kal82byVWpTIwpYvaPHwbyLKE89UFWUujTxoChGnOizu2nDtGcIcIHwgpUll+ExVgpLmpc8cv
	cnAkbBqz9wqDD7WAPd4HMjHUDipHdt+yqS13yQVgScQz7IR9C0Jvt2AdMMuzkENXFaafepeNU/J
	zJmWD61BCysiIyIWvwKBep9RhF9ob+7PACXRuF20zc+6Ak9N1zNbDMCb+hGFbLdM1nqSo+z9aOb
	Lrna3TBpJW+mdGHO/lYQfaU7LguR65MyVZEU=
X-Google-Smtp-Source: AGHT+IEZJvH2brWPqdjnylH1nGNNdQPMn9WAZeVtiulFy8Wb/LXo/qxYfZZtxFSL21iJFnc7/1b8ww==
X-Received: by 2002:a05:6000:290f:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3b60e4d0841mr10146216f8f.20.1752852340160;
        Fri, 18 Jul 2025 08:25:40 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:39 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v7 12/24] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Fri, 18 Jul 2025 18:24:48 +0300
Message-ID: <20250718152500.2656391-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082541_949211_E0327163 
X-CRM114-Status: GOOD (  12.28  )
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921b..f53c72e5c5727 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -8,6 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
   - Julien Massot <julien.massot@collabora.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index 3117345d0619c..93e22dfd61c17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14755,6 +14755,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.50.1


