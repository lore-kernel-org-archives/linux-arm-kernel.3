Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA33C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5bTy412Y1vhXJTfNgCTR4ArCx+02iQwz6WfyoOB55s=; b=IviaTqolZjPfVC8xPSieOd4bm2
	4Z24ijZasYa5j2iIcIaRLZAaCijPpCeZCzWHwCeGYZPyD0xnFsIca3HwxdgUeI/UUjMNkNKNShnKR
	JzxEdBraF71cTqzimsoETSiAIBG5XIHtLVUWPTMIa1EMsJL3YFxuPVBl6DrFAZzP+t6eY3+9Gwyh8
	ddzFvGEkxPWDMJDmSreBAQDdOCz6JE7fvxRb4aNBeM3yTbQzUOu9ijCl2N+uzPcn5JUlQv1wE97MG
	iRyhr6JR65J/dNdxB8dlf/3ndQHGNLA8pFcb5UsQIfDC2hJI7ReKhtvveXw0jwXRf65IdoQfr7pcr
	adKqX+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcocE-00000005Lxz-0VpP;
	Tue, 28 Jan 2025 16:39:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoJH-00000005IiB-2uhp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 16:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738081171; x=1769617171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xAN7a6oWJ/faFBXINVOwCwvPImMYJ7LDRygZd/fK4Uw=;
  b=rVc8QZChwKwQIYc1N9uVLzEhm73wyznl9fY3MUM5hzm4IhRhxpBMWh2o
   enPn7Hd10rMlfRPLtbPxapcoTKdZZQH06719bwJaawwUiMPnjRV0q/BzH
   +uiBomNYOyl0IUNRef4SRVFDsPklaH3Zl4L8ByyLKIapa1nyUZaBwwN+u
   jSqdMtgm9F8ZjwRBoYcBTjsIt0C0SLlxAe4Wvj6xWK5SFdbCCNh57tnit
   76NHbC6pNbNC0zI8nViv888iq9BmGvBnsUFiCr8DtASMm6ZtPp0xY562H
   UTCUG+C1USpCGhkCWZ3e2Q99Bh3Hb+nVXaLK9Qs9w7FNc+Ypcux38379f
   g==;
X-CSE-ConnectionGUID: rTeHIQwwTUqu/R9nCe6mbA==
X-CSE-MsgGUID: lHmB7LlbQNOu07BKr2GUHQ==
X-IronPort-AV: E=Sophos;i="6.13,241,1732604400"; 
   d="scan'208";a="40982601"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jan 2025 09:19:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 28 Jan 2025 09:19:23 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 28 Jan 2025 09:19:20 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <broonie@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH 2/2] MAINTAINERS: Update the documentation file supported for MICROCHIP SSC DRIVER
Date: Tue, 28 Jan 2025 18:18:45 +0200
Message-ID: <20250128161842.44541-3-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128161842.44541-1-andrei.simion@microchip.com>
References: <20250128161842.44541-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_081931_735993_55763262 
X-CRM114-Status: GOOD (  11.21  )
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

Replace the documentation file supported after the conversion of
atmel-ssc.txt to YAML schema named atmel,at91-ssc.yaml.

Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 02430335012a6..113a2d17fb8bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15633,7 +15633,7 @@ M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 M:	Andrei Simion <andrei.simion@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
-F:	Documentation/devicetree/bindings/misc/atmel-ssc.txt
+F:	Documentation/devicetree/bindings/misc/atmel,at91-ssc.yaml
 F:	drivers/misc/atmel-ssc.c
 F:	include/linux/atmel-ssc.h
 
-- 
2.34.1


