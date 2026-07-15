Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408DAC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYICwpllA6REcHU83KV0EGKSQt2kKv+TAZuxEKEYalU=; b=Tcmmp6GgXFO0UCvlJsiieTdkbs
	+b1xuWUOEKmf2rxSgMZU7FPs8IyfFd+rRg5IXDwiHix0xFK/o7MNkUlJwg2RXV3/ERnbD3gtwBa7G
	1wVDOPDTKKf3d29vrucfqPt4Pq5gA346bda1462CWmvgd3aqNI1+QWOdvcBIjMQuPb7haTPrk9nc2
	vYD+9IYjPR26TlXsR28Bdsd0V+GxiAzVqB9ZmlkeSNNPiObjaqGeYJkdqQVgA5G9JZYvOmu1PGDWV
	oden7mPWRtbr9Mp3nOrMLSCThRg53BKUNo5rO48BToXXGDrq/WmtlkCYs2ILfF+MdeKE06SbUX4Ft
	nCrC/YHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvO4-0000000EDYm-03sc;
	Wed, 15 Jul 2026 08:54:40 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvO0-0000000EDVr-2LdR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:54:37 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso1731824b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105676; x=1784710476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYICwpllA6REcHU83KV0EGKSQt2kKv+TAZuxEKEYalU=;
        b=caJVJcxTlPAzGJC5nEH+B6iw1sKQ9TMBOzESSlLXuw65eYLSTB3ufNN9nqVgEoNcoW
         utogH1Wp89khqUU1nmR7mZTcb5nYYfqa0h7FEdY/IySqyikT4WjAn/MTKV/wDpMKQ1BV
         8++R4Dp6+hEY4wS8PAya11A4h16Soc0s5DKdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105676; x=1784710476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYICwpllA6REcHU83KV0EGKSQt2kKv+TAZuxEKEYalU=;
        b=SWykWfDf9NZKmEK1QNpY97xBwngvizOvYD4ZDqIy3l9to8Tc1PolzhUMKxPQ/urXha
         IL6i5hXzOKc0Tg3T07M8OXRBw8um6cuV6O1Oksw4OEwHntZVBv7wCXYxeQHoQ7tiG+jJ
         ddx53l5NQbWv0o1PUnq7zWkReUml7+aA5mlsz9BKL2t/XQBfNrYMRivjFZJpdyPpM5Qh
         r4fygg92J2hTsBomevWS8Cwq5bFPqpQpOmkKQJ3DpkK6xCmtotqe/rBaDq4WLfttPAqG
         zwmtm+ynZpJm1SF9Wn8zwv7jVSVJzohW9EV89mrQroypdRHSP/P45rs7xufvs4QnWEja
         r1Hg==
X-Forwarded-Encrypted: i=1; AHgh+RqxFLDoQgrr+dgAeDS7R7xki4Hrz09sbqp8OjM8EOqVXExeL+am5D7QmWO5e1eiY67HYmUWjaN0EKBZ3AuIPbvO@lists.infradead.org
X-Gm-Message-State: AOJu0YytfF8WL039d3bY5TOXtzN7IfXbVTsGlnIsqXFlOXW5SmQiMu4h
	U6pBzkC6mJmAFL8Pz0w3l3V6jvk/Al8xINrHK6RyNcxEOHKHdCPE/fEu2XboDEaHBg==
X-Gm-Gg: AfdE7cn9UeHA+brgF1FdLW1BAwTK0+KBC3D4RKGEyME0IGW9MAs731osbx4AmriS/T3
	B21hIV8sVTtJR8RCH/ecKquVbN1Yhitc4fCSdI7gY5WkufFdW3C3G6MLhiPs0kErWBIBQ8rAkUB
	yzWe2oMi77XcMyhK2AxaeVGvea9UCuL9SI5w7ALePBtMXSPUDRy5czuRhF7OIL3Hoch9XQM7ymL
	4tAlN/7rtVOV/oioTnUIElumsXJ9N2ih3bxchfRRAB8I8492SEJCAIznyNhUURXuuj7NerZ87UK
	dTvgT4OvKe4Uj5OfkHD4J0hCcYg6NlrHExklsnTT9q6bSzE7W78w0nWz06WUCZLz0kLUeuSuyGd
	IJXz6/VG+0yXsDqtBlVDFteuu6hHVNM90vQyUCaoQXa5WWYQ2s0XXIJLQi9WQzbIwlH3ivikIBS
	lcDkr5cEwWezZZeXtAAw7OBnzi+91HmfbvRzodcZXAzwTw/ULwaTpCrp55GTFejg8RtVfoj916O
	ERx5l1y
X-Received: by 2002:a05:6a00:17a4:b0:848:88e6:95d3 with SMTP id d2e1a72fcca58-84a673928d8mr1756444b3a.72.1784105676023;
        Wed, 15 Jul 2026 01:54:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:35 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v5 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Wed, 15 Jul 2026 16:53:34 +0800
Message-ID: <20260715085348.3457359-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015436_608867_F573E47F 
X-CRM114-Status: GOOD (  13.15  )
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
index 9b2bf608f9cc..36342c5718bb 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -896,10 +897,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
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
2.55.0.795.g602f6c329a-goog


