Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52414C61CE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hG1eT3fJ1eqCQJYwPDPHrvuaAvm8t3qbFfmktADncGQ=; b=CldVpGLXARNXvhlve7bmR+PDA8
	vKnVYKp9+6eW73epBUP7bxEF8h6jqvCreqNtC3sb/+nijEN8av2rIAIPoWXo2DZfD/XJdpuihjYLH
	Hp8OjrLgQOmbLPuxuMSmnkf70n2Up2ulTQye5If64UfmyyGwDl27gjxzNGmMDOOPRnGDOE4bIeM+p
	kW+fhlXzKw+cVudiURNnnKJzXWNdCQcMX4laTJPD71yOa44G7/i0pW2xSVP/m8B09GjtwIwly0Ovv
	uWvmzgJDhg56+xjhtgLDHBXJrqjoghOD/5CxWmoh0LTbS1uJUmMs4cTZc+SCFy0sW9f9GOwDXYajC
	JSgohQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPOK-0000000G8k0-1qIB;
	Mon, 24 Aug 2026 07:46:48 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPOG-0000000G8eu-31b8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787557604; x=1819093604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=shENYTa2oPiiOJhdZNkTjFnK33jhWrhsujx4yV3HpSE=;
  b=dvFSm8MmUZo9Mh/OsY5zZr+bhaQpvhcNuHCoOqLB2EcfPtyJBYJxCUt4
   Jn+9GkULOFSXmqEQS8RQ64zjMxL8eSLfemJ3b9Y37e59ZiTfHFbIqvSGW
   YGalUc5VtWlGIzsJ45sMi8hQOJUocFTu+WdUVyhIoU9ZiAw+fdo6LxhWR
   e0gCOPJkP3/I5/1eWRiJNq3nmSu0z4wXsP6IJndeqZxdf5Ag1XNiSdcbV
   Pbro7eDZT5/gB69sd5eUmCpMToitflRYu7drPnFb9XnN6QMq0pIberYrp
   6H8BWG+DhU0+9etNmwaoHOd27h06iA1OSmJJ42TiwPYESzwaLv54SqBQf
   g==;
X-CSE-ConnectionGUID: mbB75kKUSXqzwIzpRFKT2Q==
X-CSE-MsgGUID: 9xULz7KpScmTyDBWMsCKOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88203136"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88203136"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:44:31 -0700
X-CSE-ConnectionGUID: XUSh7ZStQ3y/GQjWBqS0dA==
X-CSE-MsgGUID: JLOlDW5jTxukvivMpH9cMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="268887918"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 24 Aug 2026 00:44:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C55ED9D; Mon, 24 Aug 2026 09:44:28 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>
Subject: [PATCH v1 2/4] gpio: shared: Replace open coded fwnode_is_gpiochip()
Date: Mon, 24 Aug 2026 09:42:33 +0200
Message-ID: <20260824074427.3226457-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
References: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004644_822914_5FE8A4A1 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

Since GPIOLIB provides a helper, no need to open code it, hence
replace that piece by fwnode_is_gpiochip().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-shared.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 495bd3d0ddf0..be90926dffcc 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -203,9 +203,8 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 			if (ret)
 				continue;
 
-			np = args.np;
-
-			if (!of_property_present(np, "gpio-controller"))
+			fwnode = of_fwnode_handle(args.np);
+			if (!fwnode_is_gpiochip(fwnode))
 				continue;
 
 			/*
@@ -222,7 +221,6 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 			if (args.args_count != 2)
 				continue;
 
-			fwnode = of_fwnode_handle(args.np);
 			offset = args.args[0];
 
 			entry = gpio_shared_find_entry(fwnode, offset);
-- 
2.50.1


