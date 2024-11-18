Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F90D43FE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 07:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mLliVVW6iKzF/knQYa+1jIwAJwPns2cF/3h1Vv+nTM=; b=IEs92F4lQhP628XH4hwBR60M48
	iVLd9T8dMEy8qrGZTGcCXZqSus8L8IWl9gguDPOFAD11OcUSS4p+quIVK6SGUvPhiLbceq3lg9CLY
	QJX4bDXaMBMDjSF+Kq+GAZ282mLZ9pLwag1vRVM5Mr5aAc0DTHO/bc+5kg9olIjMIZg0DU6Y7ahKw
	Q6B20hgLISqP+fQqRH/3cx22467/2ZdDJ/4eGGXnMVTI6oKDZV+gcTggexS7dzmvJFRYe7GEWw/uq
	u3dB7VcjHHTCQe37H4CX4BetQMK6rdUkqrqWFmLW2sVszR4g+FNjHDFaOY0EdQ3Op7sqeXsG/ggKE
	gPU7tsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwGR-00000008f5s-0MQD;
	Mon, 18 Nov 2024 07:33:39 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwCu-00000008e7f-38Y0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 07:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=4mLliVVW6iKzF/knQYa+1jIwAJwPns2cF/3h1Vv+nTM=; b=FscPVe
	7hhkydcZEDUwMG+waEjWQO34MFPUqqriDrdsi1a9sMTYwbpkfpSYrN0SMEoTYmUk
	q07IUE0NjY8yxgsvgRlfLaeufpSPfupt5m75xUeXi+SdVX83DJiOz+NCXrmHlex9
	NhLSns9tipuAdZKRqASyf3qfiPA/VClH7Dv3iZqy6olnvuUtX+IcETOltRlQ9zSN
	iposHpLllHC9JWFV6PW533ERc7d7stHGRUId5ABD5SWhmBsS6A+YFUkkmLvHJGcz
	lSNNq+5h+S95i+mOfSaMhVNl9R7RNdF+NueIgagkNBlT892RmIjJG17Kr3QJ45dV
	FdwwHpRB14eHczAw==
Received: (qmail 112590 invoked from network); 18 Nov 2024 08:29:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2024 08:29:43 +0100
X-UD-Smtp-Session: l3s3148p1@QLte4SontoYujntT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 14/15] usb: typec: tcpci_mt6370: don't include 'pm_wakeup.h' directly
Date: Mon, 18 Nov 2024 08:29:13 +0100
Message-Id: <20241118072917.3853-15-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_233001_068990_BE6CFB4A 
X-CRM114-Status: UNSURE (   9.51  )
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

The header clearly states that it does not want to be included directly,
only via 'device.h'. 'platform_device.h' works equally well. Remove the
direct inclusion.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/usb/typec/tcpm/tcpci_mt6370.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
index 9cda1005ef01..bc5fd2557e6f 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
@@ -11,7 +11,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_wakeup.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
-- 
2.39.2


