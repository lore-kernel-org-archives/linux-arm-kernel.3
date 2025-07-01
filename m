Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97DBC83030
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 00:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WjbfLs8DH6SSSqq8mb1Ox4C8jBDdt+sgOqlePr+W3eM=; b=SHVZ4uRdIckMVLx0qnWxIMZb9W
	ikr3nuPxZhuVxAsXjj/Ldlu63+lKKUgLUSgBXZf915iux9lBO/460o83zlpzM0AEFmcXiwyjf/aLb
	nn+I8Je8UQBI0x4b3nrJbRlReF9M0txtYi+O6tDSt+fj/GO6wMwHUDH6s0TD4g4qnXo+MtG8Yk7vH
	ZxDPJrtvvAjIKLJaj6aONESJgNzQpRLet1rq+z2BjUpqX9AdFNchnde3QqH4e0zkjDitCFuAX9y2c
	QqwpZk/+XXNco4+9nLjrTsD9iXcgfTrd2GZJfoS8n7c2s0JvZcg7oLFDzHMQvIMntprtMI7o8Xh6j
	+zBWuobA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWOpT-00000003ja8-2CZt;
	Tue, 01 Jul 2025 00:26:31 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWOn8-00000003jQU-23i2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 00:24:07 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso5455579a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 17:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751329444; x=1751934244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WjbfLs8DH6SSSqq8mb1Ox4C8jBDdt+sgOqlePr+W3eM=;
        b=R2MfG+6brnszN0ISZglddzc1vkOu631wD37826T6+Zz/g2jGpwtDhIpuALy75gYMNj
         ACI6BeMt1Uggm2qgjjHZtVZK2UJJ1SMlC2lUWVW+xfnZJkWM47Je3TQ1PQPwMn90QpGd
         c+abEpBFLO3yUT8U+bgYf0hbkCU2IXxpQiJcrijtKHbap/DIjGJF8CJXYHKt4tunL9DC
         Dkf+8cpTjn9IdYw0Xu4kIa6ZlZaQCLSC1kH4ymEF4XNxkB3k2+nB/cNmi/zrsVrJvkVl
         YVlQ5xC7l5D4O7wiZOxB8imS3eVv13N3XXiqgKCw2dhgaS/r0rw3O7tcQI6u4fq+QiWd
         xjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751329444; x=1751934244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjbfLs8DH6SSSqq8mb1Ox4C8jBDdt+sgOqlePr+W3eM=;
        b=pZ6CJ8is5EkbYhcIqKvR5jIiUk7k4LAzBbVcKhWpWAJVh21ZRC64ugeZlO1Hzk/fgl
         uii53cTT5PzijNIio+zHV0GmtpUgul7kacFlkq3JPxApAMkYSeImMTHP0HMSc20Ti27m
         CDv9DyJMgbdejmEKUZ1jhLnuqxQNB07Xvj1gdAUvfCLY738AhxbwTGxXVk0WeLpc/YI+
         /E4NxyZ3XbeSazFFe00jQzUIq9FBS7/k0cxoEzmypQG5Gn1FqbVZLKcFDkBFb3/TqdRH
         sgsSR+NmXrOdpO/XWjXGbH2iMGSC4ktAKmF2vadhmU+LipQMHQGAmvaHNG5nWeyPfrQ7
         7RUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhNIfZBg8r0UpoZCxGENac0TH97HGRQKdv0+QXl112LVLPZraj4TyhZIkWQ/ld/qVsC8zabSQ2pz9A9RbOEsYJ@lists.infradead.org
X-Gm-Message-State: AOJu0YycHiRjiJs11QE9eax17RBo8/lZJtfhj6zT7oDbSczvR1m5zYCy
	VqgMQCo9eiMxUIsNRnH3Eta2VXwoZXrZo76Jn9mN9VdnDehFuP4UtpG+
X-Gm-Gg: ASbGncuOHi309K/mrGSd/jtc2wTQW0mxyp7jigZu5a2cs1Cf1hc2hzXRXh+rw1G9u2g
	Rzs0+A38/23GDq/L8r+aNGhkQg/neQxEeD6IdpNLeidpinJD6xXn6CuBCUkjnfgkwe2df1rmJXh
	mR59PJsNBArd41WJAS2wRYKR2G6/1CLw0mEvA1SbvegXxaUYwdWqpO/tLLaymBrqB+W8fML7g0y
	C40t8j9Tomz1HNrurQueFze72lp/soJYy9j9UUfnjeUSDbE5hfdMjMyDOU9PMbkeqx1bjaQvAZm
	Y5Zqkl6HmUBZeb1ILIizhHvKlwfWPua63tskPERLZ48PenFadzIUWFkineMfx/zfGBNi3n/YuNj
	v/Cs/fYdfnFWGM3RJaEjDxDA=
X-Google-Smtp-Source: AGHT+IFFo6r4Ry+EiPmDe/+U6PesB1h9GLgYS0w9pmNsWBBj4w9MeTRZATpmZ5/qgVzTD5pNQ/SjWw==
X-Received: by 2002:a05:6402:510b:b0:608:3f9c:c69d with SMTP id 4fb4d7f45d1cf-60c88e61654mr13152295a12.33.1751329444447;
        Mon, 30 Jun 2025 17:24:04 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e26b7ac4esm979532a12.7.2025.06.30.17.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 17:24:03 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: support the i.MX8ULP EVK9 board
Date: Mon, 30 Jun 2025 20:22:37 -0400
Message-Id: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_172406_531749_F513DC80 
X-CRM114-Status: GOOD (  10.28  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add support for the i.MX8ULP EVK9 board by introducing a new DTS and
a new compatible string.

---
Changes in v3:
* change order of the board DT compatible inside the binding.
"fsl,imx8ulp-9x9-evk" now comes before "fsl,imx8ulp-evk".
* link to v2: https://lore.kernel.org/lkml/20250627142645.134256-1-laurentiumihalcea111@gmail.com/

Changes in v2:
* introduced a new compatible string for the board.
* aligned the pin configurations to the same column.
* link to v1: https://lore.kernel.org/lkml/20250623150146.1398044-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
  arm64: dts: imx: add dts for the imx8ulp evk9 board

 .../devicetree/bindings/arm/fsl.yaml          |  1 +
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts

-- 
2.34.1


