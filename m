Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699E6C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xc02KBsQrd1xdK8Ho0VEf5G63Rz5XQrKjQwFcbcQ37E=; b=v14c/csRchPraMeaj+YYGp29S6
	RNgrMlImIlDd6NOw2rV+thaOtHNNDCSWaE++1ZDa4pcQm+FeOWoV5bg3IEsESUbCqUyfUZ4QYNy6C
	oCTNEYhXqGLu1esmGvU0cM2U+Utw5CCw8t4f2tgPrAHN3OhqLs/7eWhJc5oXcS1tWWv5yfB/DhVcY
	lftt9JQ5Wcnz06Qls16qSI/UYGNK9tKqdo+gfNAnPdmGGZXbncevsBAI14mHgVk9+Toa2Bq148jBp
	3LlB0uOle46DzA0OKtuNK2FmqQ5WkPdY5+lNxuEPG0d6LbNCY9uFpkZkhKEfXTdJ7huCzSHeZWLIk
	7vbECb1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4NX-00000008a92-3MQP;
	Tue, 21 Jul 2026 06:54:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4NT-00000008a52-43sb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:54:57 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cacf197759so124508185ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616895; x=1785221695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xc02KBsQrd1xdK8Ho0VEf5G63Rz5XQrKjQwFcbcQ37E=;
        b=E+mkBftsiU7Rs9hAgcfN+Oqdvf9H685WvkxlVtHCu0xZMPoLzuh0Ug9ALpywfnE3Cc
         Hx5STbHLDePUQDljPBTczH289ByODgWjLgTgKF9OHaxm6PmtkhvuesAKCzSNUeh9pUQe
         ctB1JfhaquS2rR0koJYHq1oF4tK9xRo3De24Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616895; x=1785221695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xc02KBsQrd1xdK8Ho0VEf5G63Rz5XQrKjQwFcbcQ37E=;
        b=oW0AVW0kjJaJLR3WnbPBZsPND6OdZtpBkN8ovEgxdozLJLrrdgyjULYMscxzyzcp++
         wqTpTVWFr/u2DCqhlvWyvVmOGzEBHL9kdiy7MWSSXSxePchDjKUCvCv3xE1yzjkeNW4F
         vJ8KuVz7ElxuFlZu99Z1FCq9/9dL658WOce8kbCPsdfCHfCq9lYw/HrFwqT/K73gKyWz
         5LuTfwsmg/5sUHqQzga6TJS2MBhZSXvZTLfKkQPUXGRPYwN89NRcxtFlmf/7IZYMZMBZ
         HqQ+KASSoNZG3GtUSf/9nOfTu/g91THp73pdMfmmD2dxtB74utv/VlWRTVv5DfqdDub4
         dNVw==
X-Forwarded-Encrypted: i=1; AHgh+RqVyTRGRb7zEbdLjg+GcG1wvr6gQKeA08LHRmvfdpxbv7B9mhbaVAe5D86mDsb244ig8q2+C1LC1z9LQ2AYPayl@lists.infradead.org
X-Gm-Message-State: AOJu0YwaddqA2J3+4sZDBchJ/0K8CXNMPKunM85bt5DGPA3X5qqp0wZ3
	k/t5ImKsBHecVrvyNnXqNT6xkhPWCaneofTyG1v0BwkHDENZYkh3Q+ptbHAjTAo/HA==
X-Gm-Gg: AR+sD12S2nXPN94tMK0q+vvh1jPGfUC/2oEz4fyTdRrOuMIP53Si6JBHxL3SgfigdkJ
	Dhr1xsAX5HAvywTg2YcoxK5fK1crMbRe3zE2KQhItYrMDMCUUEnbFcW198xUC5ch3z/TkzwqXpa
	uYATrgHBC47mNMmAMjz1eVJiqjnZTbtWshsuWml+qBC3RJCLrK/1vorYv39u5ouiFyKE2MwJVrO
	nJv3ctgSZbRWBlx40x3vd3HBpWT++hycS0hBvZhj69SOOWRzp7mFT+FAe9ftOukU7Gb/0UWhnXC
	OhIZaT79HYvPEYbCWhLFQX+LwszWxggI5badieHyTiXgIW7S0t4Frg3gr0+yf+4TUAugywhzDUF
	T97Jn5a5TME2h0Ij8M+ViJdJThmRki7P015jxyUbq143ZVb1pyKJbKMQWquQ/b8dJcf2tVlPgiS
	cQGmivHZ2nEsDi43bDDq9OG0agj9KwX3wnCaO8IIsLr7KV1n2rSPkeq3K22B4=
X-Received: by 2002:a17:903:41c3:b0:2c7:1200:bd7e with SMTP id d9443c01a7336-2cf3486b0b1mr185750155ad.18.1784616895361;
        Mon, 20 Jul 2026 23:54:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v6 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Tue, 21 Jul 2026 14:53:59 +0800
Message-ID: <20260721065413.2306137-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235456_015717_D00C8082 
X-CRM114-Status: GOOD (  13.65  )
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

usb_hub_set_port_power() open-codes assign_bit(). Just use the
assign_bit() macro instead. This makes subsequent additions to
usb_hub_set_port_power() easier to read.

This change does not introduce any functional changes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Attributing suggestion to Andy, since the change was originally
requested as part of a review.

Changes since v4:
- New patch (split out from "usb: hub: Power on connected M.2 E-key
  connectors with power sequencing API") (Andy)
---
 drivers/usb/core/hub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 2cfe09a141d8..715f26f05a31 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -899,10 +900,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 	if (ret)
 		return ret;
 
-	if (set)
-		set_bit(port1, hub->power_bits);
-	else
-		clear_bit(port1, hub->power_bits);
+	assign_bit(port1, hub->power_bits, set);
 	return 0;
 }
 
-- 
2.55.0.229.g6434b31f56-goog


