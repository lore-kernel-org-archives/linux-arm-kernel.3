Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF3BC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uflEmef4MtYYw+1F8mYKPDScXOvOFf6c8RC8L2klIpY=; b=Eci1Q8G6GpSz4w4kXhDIUXlvjz
	bnScFezLxWiAOsFjiZu/0EjRgk2EDtBOFFU+KQ0y2FrTn440kuIoQG5/Z8aMRrdz3qibLAkZm74Sn
	LXLV+TVLr+AMqH5YDb/+fjPihzud3PJmKu67rcmlcZx5jLlfKRzD8PtOm26gf4iq3K4SHyUn7gE4w
	nzL2OIQgi++4+AwK5Q8iSkW45YfxEpoa9awTwwUfnLv2NRQr03C2EYkDTX6+HgxkiHJdttR3BT4DA
	1XqdCBogsZGYlUccdAq9kkAO81kdaQg1lYeLWE/oblXkWBoGkVMwMkq01+BjhlQAjVR3tzLFE1Ia+
	W0tTi7zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDPV-00000001hk1-2UiQ;
	Tue, 04 Aug 2026 11:34:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDPT-00000001hj6-0qyA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785843255; x=1817379255;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=IZcSCPqZO3l5d2iyZ0Qc0KOp1vdICk1AW9fpfanl+M8=;
  b=nJ/Gt2wgf79ZoYr0mpijYTZmo9lCibZq4aPFZgIk0PNrLX7IpvnOduCQ
   MxIygkGwaRLGXJgIOzLkJzlL1n5MhEqiKSd40VkvFYt/M7aBiAIpTfStE
   m7VPJrsuajQTr8xUxI+kKGjIQmSPBI5NY7efdMWZ1QZdtYZFzKJz6vr47
   PPw8IxU7fKyu3m3lefHmDhMZnX3E+p8AHOpIr0wghurMAq9sVehmCTrSf
   siYzVgf8B2nWTsw0Th4TApiGNgvnxWwYCVuq8nT5cN7lQb9CZfKKAPKyY
   LKXfeP9x+F3fOJE8ydC7IbhlKlOT80V1mSgOkrJJafgMD2bSPQYXGcQjg
   A==;
X-CSE-ConnectionGUID: 4yFAMHBdQxOTpCoL0PKOLA==
X-CSE-MsgGUID: 9bo6NXMARqaViXPRtBB6Qg==
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="61629495"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2026 04:34:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 4 Aug 2026 04:34:13 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 4 Aug 2026 04:34:03 -0700
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
Subject: [PATCH v5 02/17] nvmem: add DEFINE_FREE for nvmem_cell_put cleanup
Date: Tue, 4 Aug 2026 17:03:23 +0530
Message-ID: <20260804113338.261782-3-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804113338.261782-1-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_043415_243540_56F95D9A 
X-CRM114-Status: GOOD (  10.53  )
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
 include/linux/nvmem-consumer.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index 34c0e58dfa26..35a2ea8b8957 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -9,6 +9,7 @@
 #ifndef _LINUX_NVMEM_CONSUMER_H
 #define _LINUX_NVMEM_CONSUMER_H
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/notifier.h>
@@ -54,6 +55,9 @@ struct nvmem_cell *nvmem_cell_get(struct device *dev, const char *id);
 struct nvmem_cell *devm_nvmem_cell_get(struct device *dev, const char *id);
 void nvmem_cell_put(struct nvmem_cell *cell);
 void devm_nvmem_cell_put(struct device *dev, struct nvmem_cell *cell);
+
+DEFINE_FREE(nvmem_cell_put, struct nvmem_cell *, if (!IS_ERR_OR_NULL(_T)) nvmem_cell_put(_T))
+
 void *nvmem_cell_read(struct nvmem_cell *cell, size_t *len);
 int nvmem_cell_write(struct nvmem_cell *cell, void *buf, size_t len);
 int nvmem_cell_read_u8(struct device *dev, const char *cell_id, u8 *val);
-- 
2.34.1


