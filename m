Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB30E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 13:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=moWB21d17IXR2Ld3TZN2U112qJtHW3wGr/Qsd74h1mg=; b=yz5/URenaJIQ+03VGGeA1mPe6d
	AsqPphyt8MvVfRK31oZ6Hy/tlFvxOMLiBhFVa7u+uF3CVi6VjYYeXwS+z+S4+/Xa0c4Mt/oCSnn54
	Hdb9p9QNHBMfoG32xFbS7nc8o6mkM2wrEPQzcBv20V39Nc4ZNBE4ltcEVnYPtAh1QZ4CptBRihuYg
	ZRr7QnFuflpaY4gmdxYik3VwxJB6aSoL4Y13Ys/Xm2tuNnYnoA1pTRyJFTvmpAIJicI9T0gkJahOr
	K37DgPJNlBi978tO108yk0X9rPtq1pqWl2burlWm5h6KETPeAQxzgquNJ0DI0OA4SP+0QnXP173YI
	xN7VH1Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJuVS-00000003xt0-0mg6;
	Sat, 07 Dec 2024 13:05:58 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJuUP-00000003xd8-23ZK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 13:04:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-216281bc30fso7985985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 05:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733576692; x=1734181492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=moWB21d17IXR2Ld3TZN2U112qJtHW3wGr/Qsd74h1mg=;
        b=F0la3EnLT6y7uV0gYn1fyVtFCRLTV58/QZ8CIKzEpRUMJzUq5Xi4NjkujCSJU/RW3f
         X22WkcHMzoADbMd3jumo7W2TADhQXgWlB56fnioH4BI93YbqgUNOk4Dq6JOqfU2XtqUX
         iQQSc3m9JMkppN2rkBBcFzaIyOwfdVfAGlTolNUr12/eZ+hFCNc6HIaRPQ3nynYWjU6G
         ZePBqTjUO2GWHxRVMqLLm/9oQrSFpaVYpN12bYq/Ucjvpsjh/2KQv+jVp92NT5REe3wZ
         wSpbqe7lDZ8DtTuvuhnl6834kCKZTN52uCs+XZpibjQAJmHlnKuu3O9Cw8yH79SKBi+M
         AuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733576692; x=1734181492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=moWB21d17IXR2Ld3TZN2U112qJtHW3wGr/Qsd74h1mg=;
        b=Wd9wSa2ASvnQHrog+1FRwPAoTALVHhBHdtbN8cOQGKDot206HBYvqJWnK41i5WTHLa
         eQeaEJs0CiWUOPmmc++dn6gXE0Xqol3gqFNvtUIgiMva9LqEAysalFTdeMFiJ37lUz8+
         SqLLeZ05bBuhbCawFTdyaCVnUV2W2AGEmpdrYm3DenS73LhDzwakfsEKO1DdU5hw6xi+
         ecPni4NbR/krzS4C/NZcSHkJHaAiq0JYcqUnAjTMxKNZJoMzONtWrsyW7gJtY1mY8mMJ
         3hU+c4KDjXTKf3ueedwY1bszfx6xGoxzXEW1lMr/ybIIImW5ZUQIzhL3r8J48bpuIW47
         PIXw==
X-Forwarded-Encrypted: i=1; AJvYcCWKMLYh9K3jSOcE8cUiRN24oy8wutKiIfrKGv98iJc+PCFgWuYiIJDItA5QAXTyrezMaukV1ubmztFsC/MMe7Se@lists.infradead.org
X-Gm-Message-State: AOJu0YwYa6lmRHr7TTw8VGCXIfLLGR/XrndAXivSAJac0TPhmXedjLiH
	7VdfHRHRg/t+mC+okm1binM4wCj364gkfwz7bM8tv2eKzQrrUhz6
X-Gm-Gg: ASbGnctqW19iZsFCPcWLUh+qCQ5tTxZ5tFShrVYUdfOuZISmnxLKFnGWqiWtBdFtQVz
	a8nLVK8J842FBbuzIaLQmvAjoL1DGEmpK2/bpU2sey0Ex9sC59dKkuzhDiUKr3gooBb5A/j/7A+
	ynwKIo3ZheNQhwdGMxbt8iW7f3P+pj2rYnCy/Va2oFXKzOjp77cFiJz1XczTQLVJFXPSbb/x0GE
	+5xqm3iEvgSXLygQR/2jMLpS22DOBUruBonY1zAngq4Scvjm57Qjv+010lJq9ojkg==
X-Google-Smtp-Source: AGHT+IEXK6h1lriVkUgeA8NkzsgEpDjD4uXCqmEP1oor2nMQ4lKCeHQ2ggi4Xw9LEbdrlC3ZH0E/BA==
X-Received: by 2002:a17:903:124a:b0:215:5ea2:654b with SMTP id d9443c01a7336-21614d5435fmr111914685ad.1.1733576692163;
        Sat, 07 Dec 2024 05:04:52 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628c59730sm12779715ad.105.2024.12.07.05.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 05:04:51 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] Apple DWI backlight driver
Date: Sat,  7 Dec 2024 21:03:13 +0800
Message-ID: <20241207130433.30351-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_050453_554425_50B95C1A 
X-CRM114-Status: GOOD (  11.38  )
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

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T

Nick Chan
---
Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI
    backlight
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  54 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 124 ++++++++++++++++++
 5 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.47.1


