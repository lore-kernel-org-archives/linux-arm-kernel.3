Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB79D5AE60
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 06:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALXydKzISbFOwh8LfCoyMfvmblNdzLozEw5VVs994Xc=; b=t7MA7ZsVZk1xwrdyllS1T2dAqu
	lexXi9aBEfEtSzFvM9Sxi/4XyFdjxZPEo+9xMKGa7/+OZ7qND+e7sYKJmI+ZAkGq9pS1CO3SF9zll
	7dn4F82lN2klIPPDcx1d0OVFvJ5UW953wk69RZFF04nTCCfko0gvZ0VYRpaNlAEu89zCBYN84IEtH
	5WI7U6ylcRZ257lUR+fiMjUhmvW+HIaC/pP2KOR+HaaKH7ZyOPvutejYUImFqzlCJ9bMxD2cCV7/W
	pK4NW6zCUZb601hOosjxInyOX17x9JY4JqfBq1d4ff/EFXfC8RQ+/QsoVl0ligI3HOCvvR8UY0x+G
	PkBfaFBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8vnM-00000005oNf-3BXp;
	Thu, 07 Nov 2024 06:15:04 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8vjw-00000005nlS-3PM8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 06:11:34 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso6261185ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 22:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730959892; x=1731564692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALXydKzISbFOwh8LfCoyMfvmblNdzLozEw5VVs994Xc=;
        b=X/h0im1HmBI00sM20sHUHQxHUw+pnqKlvS+nH91oYKW5bipx9B2lujbmr8ssED/nUK
         0XtVJsr6GdBBbFPiKSmxmDTsngZ65tvKiVWF5FGdMfKjVkaJVWRqmG7G8nux2/MC5HZP
         15ZaXg/h5Jk+JCUJLmBs34SylVOheopt2uKNap+pwriCNfmdiEl9BYJCwV+NLkElSVFA
         YXDFipsUW69gK+qYzbdmgmFnJY0bhmRdj9/gAd/ak4NSbujY/bGm7tcXH3CdfWRV/xzd
         BYRMisbp/NN+Tu35GACzgZbs0Fmi0NgC/hzm6xQ2Wo3B1KBttLjl7xZOYjpCAULFbaZb
         wiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730959892; x=1731564692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALXydKzISbFOwh8LfCoyMfvmblNdzLozEw5VVs994Xc=;
        b=X5ZUDn8OaPfBGQc7ddA+92zSxOJjOklkAAjr0Tdsvi7yODZuWb96WrSw6W4HG8inCZ
         Et6j4S766bD8W6KSwx8TA6ayuc4VcltwnMTBeMwsM93a52bX/p99EsVu3Clxq8VQNx3r
         /dtjlPglA/Qu9QtCh6bKYiMkyOJeFjwFIcH7loWBHfcZoGKxUw8BvZmdbcHc7aQEeHnh
         wjS8q4IYMUnkWe75YA0WGl6vxCRPc2y4zxcpC/xcxJTuIN/Q3Q01yXaXSiCKQy0sM7oG
         GwAveOzJKFTy+1ItBPk+HHsWjuTL6ikDgs2S7S4hQZGa/wbAiNQ3YSTEIbAZRtrAbOXo
         rHvg==
X-Forwarded-Encrypted: i=1; AJvYcCWT+cLiO4UvpKJ+fCA/+4lddN1AzpzWc205KEuNiPEjoseaxDSzNtV7ymawXx//UIYBgEgjcORgSHr8HqkfYlgU@lists.infradead.org
X-Gm-Message-State: AOJu0YyA99EM/q1QwxIyaLP8pbefj1ABAWPXtGtmvMzHHdsZGIl3vfpZ
	5dGK+lXRZMlxF23zxWYW9TvNQIQg2K6M2UNTPWaeTc3XU47YJ0aA
X-Google-Smtp-Source: AGHT+IH+74hwtw/dolRKBe95lMKx0IkBL+BrHnQnQvcxznJIGMkm653MQz7fgmgSPs8j9V5HslOTGw==
X-Received: by 2002:a17:902:cecd:b0:20c:a97d:cc7f with SMTP id d9443c01a7336-210c6c3ec78mr584066825ad.41.1730959891752;
        Wed, 06 Nov 2024 22:11:31 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc7cf8sm4652465ad.34.2024.11.06.22.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:11:31 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH 1/2] Documentation: dt-bindings: Fix repeated words
Date: Wed,  6 Nov 2024 23:11:23 -0700
Message-Id: <20241107061124.105930-2-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107061124.105930-1-xandfury@gmail.com>
References: <20241107061124.105930-1-xandfury@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_221132_881605_7F83DC8B 
X-CRM114-Status: GOOD (  16.19  )
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

Fix unintentional word repetitions in devicetree binding documentation:
- usb.txt: Fix repeated "two"
- mvebu-devbus.txt: Fix repeated "from"
- gpio.txt: Fix repeated "Both"
- pinctrl-bindings.txt: Fix repeated "device"
- cavium/bootbus.txt: Fix repeated "one"

These issues were identified using the checkpatch.pl script.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio.txt                 | 2 +-
 .../devicetree/bindings/memory-controllers/mvebu-devbus.txt     | 2 +-
 Documentation/devicetree/bindings/mips/cavium/bootbus.txt       | 2 +-
 Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt  | 2 +-
 Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index d82c32217fff..530420475a4f 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -304,7 +304,7 @@ pins 50..69.
 It is also possible to use pin groups for gpio ranges when pin groups are the
 easiest and most convenient mapping.
 
-Both both <pinctrl-base> and <count> must set to 0 when using named pin groups
+Both <pinctrl-base> and <count> must set to 0 when using named pin groups
 names.
 
 The property gpio-ranges-group-names must contain exactly one string for each
diff --git a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
index 8b9388cc1ccc..1983d7eabd2b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
@@ -43,7 +43,7 @@ Read parameters:
  - devbus,bus-width:    Defines the bus width, in bits (e.g. <16>).
                         Mandatory, except if devbus,keep-config is used.
 
- - devbus,badr-skew-ps: Defines the time delay from from A[2:0] toggle,
+ - devbus,badr-skew-ps: Defines the time delay from A[2:0] toggle,
                         to read data sample. This parameter is useful for
                         synchronous pipelined devices, where the address
                         precedes the read data by one or two cycles.
diff --git a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
index 6581478225a2..1bc655d285ce 100644
--- a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
+++ b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
@@ -15,7 +15,7 @@ Properties:
 
 - #size-cells: Must be <1>.
 
-- ranges: There must be one one triplet of (child-bus-address,
+- ranges: There must be one triplet of (child-bus-address,
   parent-bus-address, length) for each active chip select.  If the
   length element for any triplet is zero, the chip select is disabled,
   making it inactive.
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index 6904072d3944..500b76ba2ab3 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -18,7 +18,7 @@ states. The number and names of those states is defined by the client device's
 own binding.
 
 The common pinctrl bindings defined in this file provide an infrastructure
-for client device device tree nodes to map those state names to the pin
+for client device tree nodes to map those state names to the pin
 configuration used by those states.
 
 Note that pin controllers themselves may also be client devices of themselves.
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt
index da13999337a4..682db2b561bb 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt
@@ -3,7 +3,7 @@ Freescale QUICC Engine USB Controller
 Required properties:
 - compatible : should be "fsl,<chip>-qe-usb", "fsl,mpc8323-qe-usb".
 - reg : the first two cells should contain usb registers location and
-  length, the next two two cells should contain PRAM location and
+  length, the next two cells should contain PRAM location and
   length.
 - interrupts : should contain USB interrupt.
 - fsl,fullspeed-clock : specifies the full speed USB clock source:
-- 
2.34.1


