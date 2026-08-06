Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCFEC561E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQOyshubmd3II5JPZYzSG8PmUXKBg7qiWMnSYRPVtSI=; b=XJ4m+/RrunxmeDVelJNH2HNa9k
	COozi22gjcEtXExd4guLLihCzJJ18Oz/u798nLHu++JG4Bp6mQhLancvwdsqzzJ/jFvm4ecf/3K1z
	UqjWniZ2c/kHHcbLfiHtYUspz3ddV6jTe96xOWfffzyS6oyXsnpokgp8Cs6BCrEgx0aGMnQWpwwEu
	jy8wdcYP/KL+xqA1eGlli3dfPwMJbELT1wok1UQXQt+dmSFMTpYvAIMNWOQsZDLrQ6ZWtLELNuzEV
	hE5Kc+45uCuNoJPvDv2GQn4BzRB7NkwCbUICoA3uGuK0RprI19j4By4urcPPoMjsnP7YftOrmA3gX
	IOSCQQ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtkp-00000005HMb-0tja;
	Thu, 06 Aug 2026 08:47:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtkm-00000005HLl-3nil
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786006024; x=1817542024;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=MgNz0ew/hB8/oQgEHR3uHQozOSw31+4UIzG+VwzCIq8=;
  b=Fpz1tCiNhGQmgP56aIdUMZSi49QCOOhYrIGe8pB2mmFzJwuF5gRlKsEY
   /PAaPabYIg8bCs3wJY8nIabK8o+0udM1aYsBRLWWrQWl53o80LwRpr7ct
   jrGJ51CsIuG5RpEgT6Clt3GmoCBZA8+G3IoScLfMHQKJ37MdnYf+M3Oa0
   Krl6Z9SYIZHRZm4mtKRSYdLq81JjD8OeZlGkGFZxTOToNDtS7/vFs4afl
   UE26HPVnvRH928a/NuwvFTzUOC/by2iT7wnOJ38cBfzqcMHLEGWGKC3nv
   WUlUGRPi3z+MQGWtLO6KMxhhFjpGEE8MMHQf7DMMyvej2RGKfJu9ukGca
   w==;
X-CSE-ConnectionGUID: feqVjCi7SHWDKao9a8++uQ==
X-CSE-MsgGUID: YKrLMB+nSSiAs893eQV/cQ==
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="228880353"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 01:47:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Thu, 6 Aug 2026 01:47:03 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 6 Aug 2026 01:46:54 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
	<joshua.crofts1@gmail.com>, <jorge.marques@analog.com>,
	<Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
	<antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
	<mazziesaccount@gmail.com>, <varshini.rajendran@microchip.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 02/17] nvmem: add DEFINE_FREE for nvmem_cell_put cleanup
Date: Thu, 6 Aug 2026 13:10:09 +0530
Message-ID: <20260806074024.531259-3-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806074024.531259-1-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_014705_002420_26D18974 
X-CRM114-Status: UNSURE (   9.55  )
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

Add cleanup.h helper for nvmem_cell_put() to enable automatic resource
cleanup using __free(nvmem_cell_put) annotation.

Use IS_ERR_OR_NULL() since nvmem_cell_get() can return error pointers,
and passing an ERR_PTR to nvmem_cell_put() would cause issues.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 include/linux/nvmem-consumer.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index 34c0e58dfa26..5315bd862f5f 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -9,6 +9,7 @@
 #ifndef _LINUX_NVMEM_CONSUMER_H
 #define _LINUX_NVMEM_CONSUMER_H
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/notifier.h>
@@ -243,6 +244,8 @@ static inline struct nvmem_device *nvmem_device_find(void *data,
 
 #endif /* CONFIG_NVMEM */
 
+DEFINE_FREE(nvmem_cell_put, struct nvmem_cell *, if (!IS_ERR_OR_NULL(_T)) nvmem_cell_put(_T))
+
 #if IS_ENABLED(CONFIG_NVMEM) && IS_ENABLED(CONFIG_OF)
 struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
 				     const char *id);
-- 
2.34.1


