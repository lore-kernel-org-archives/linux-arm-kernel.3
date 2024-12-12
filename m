Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B62E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fzut7xbqOYPi19sCzyZBocxByvsBqwohQ5FyR54rsTQ=; b=uxi1E5uXDRJxOHY/TJ5z7l6UPW
	YwkW8cBVMW1bdX3Sics2pZAM0JPCp+1lfziuH6LtI4m8Erof2rtADjpHw8KGVGxKVGkQPvQFa9RYC
	mTnE0cV3bQUuDAMXvwJm1qhkFAIG9EsC6ZJfGj+7vDFkq9R+XQ//oAw7tkgO1G97w2eAOYYz5KigQ
	9Xq97xU67cRnNvE4P0ns6xWLbh+5xV4RjeV5JwzM4gcPWxBrc/qTKGCwx6913ZQzFHuHEGhZf2uq+
	K0BjdtPA2iSKUs4ngMpoPjXyDmhKlp9rs6VHFuqxqUuazXPLLoskzCtWPR1Kq+60jNJqHhXv3oSLt
	cjUp+S/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLotI-00000001eDy-3UWV;
	Thu, 12 Dec 2024 19:30:28 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo3K-00000001Ry1-27rI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:36:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-434ab938e37so7205685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028604; x=1734633404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fzut7xbqOYPi19sCzyZBocxByvsBqwohQ5FyR54rsTQ=;
        b=YnKBya86rq8IjgWoZtfAplZThRPzPeT48olp3pknHtesYbBS91bJPh6C2crDMnUF23
         vNYq1kD7sV+95tRKj8NsC7b0Wo60yBe1ih05KR/BnaxQocdmHEzF1fEPFIZpl6JZ+Mt3
         OuFlM2RuyHP3XzBUvezh8X3bZAt9jF4rtPu9AhThj7AfyoF/UFmNFWFJsSUIwWXF/4of
         9yNYUyYEgNKAKmhIVpjTYS/m2bB6AKVmxXxESqJvZnorAXlssOFecRAPaYU5DtAEHkwU
         Cb5tddOnVpiezYxIKhYaQGNsD7jhI7e8Eh9yLFN6Kp8H7iZzJpWGHEPpSWyjMo69TTu6
         +DLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028604; x=1734633404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fzut7xbqOYPi19sCzyZBocxByvsBqwohQ5FyR54rsTQ=;
        b=BPq9Bll8/zMDt2W4HTnJmJdagARrhVxlNXr5NUzcStugOTSc+MWApcgoeAh5IsCtfH
         xYtVnL+umKmT5kXEco00MF8QY0uF5gS8PSuAqxtUlr1dCBH1wn7A2n+f7uSUsk+Qw7JK
         YPT91JD4tVUBOHT6QQZZ08m1r6ufgsuwB/+EuA/jPO22u7Vj/nLykHvxr/uzWYo9QzRa
         CdS7yJ8dlXz8kSQn3lo++lobujkoemfFMaSCZ0te8vBCa1T3nOxTNvORDiIS5uqyBEAx
         6dWMciR0ZEYcZt7yaZ7fpnZ98K9/yfBEr+YHKskot6z7eImlg9xqDm6niZtu72oKQsq0
         do5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnAMAeW8cpJHrlkrNJ65rvzFKeZi7kvVz3RNeO44S4vQYZSz6JweysTX/iicMLOL5vXPO7A1kAux/mCG9Pk+rG@lists.infradead.org
X-Gm-Message-State: AOJu0YzhWykM65D5WNl1Ud3b7tjq1+ydR/8pO82n4TwKBoQpxggIYfC1
	FGpQEAj8tXXhiWnjLnbFJsTfXTY/59q7Th/YP6mXUcOBH1S3BA9jSo/1QTm+eMg=
X-Gm-Gg: ASbGnctY70CNjLhOPSLhUR/p8x5tlYr4elxGaLntiSmnrJT9girDkFZJS65NmCSV7B6
	9SvHA182gzuKIXIYER9Ck4m4CPSxd5pDEvLJ97SX8S3/2zIl9c+9qqn/ai8BHYU4mUn4YFJVgyy
	r8mghettRfYNXsZjAWZebiuSoQ88d/q2R04JG7+nQwr+pZmhv4wF7WOcIpWQSKttmLqttr1QZwX
	TzCawiNXZ1TKVSMqzWnewURpFnjqd7hvzHGeFXyeSj7wDWJ
X-Google-Smtp-Source: AGHT+IFExc0XA8Xy/C4Mx5wK8VZwnwxFl/5BahFWH3EA4rW9cmekl8fnISqr+JRBJqWQX6UGHfnMOg==
X-Received: by 2002:a05:600c:4450:b0:436:1aa6:b8ee with SMTP id 5b1f17b1804b1-4361c346a7emr72222265e9.2.1734028604531;
        Thu, 12 Dec 2024 10:36:44 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:43 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:30 +0000
Subject: [PATCH v3 3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
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
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_103646_536013_81AD713E 
X-CRM114-Status: GOOD (  11.55  )
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

gpio-line-names is a generic property that can be supported by any
GPIO controller, so permit it through the binding.

It is permitted to have a variable number of GPIOs per node based
on brcm,gpio-bank-widths, so define an arbitrary maximum number of
items based on current users.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
index f096f286da19..fbd69b4cecc7 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
@@ -64,6 +64,10 @@ properties:
 
   gpio-ranges: true
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 128
+
   wakeup-source:
     type: boolean
     description: >

-- 
2.34.1


