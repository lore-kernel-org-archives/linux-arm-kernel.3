Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE3BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34tkOybolFeFR4xz/8UROd8qw51PLcgbfayePQcdJ8I=; b=kIjpfnu7ewrUjjlmT5dkJmvmGj
	b82bRW7M66KdjJOAfYP3BLpHJgyoC8euVCjAm2n3R7aYgNibZU2Cc914tO9pMfRXRXrRR3xb8zg4b
	lMdV2E5wS40eWZTvHcB4yNG1jOqZFOe6RHq9BBKGj+X6zQemL+cnelyhzz1IZP/XoBlgSt+u60+81
	2+/svSKhPtZxjj2DRhdE5W/UE8GWRVK5y0+iGdTN6m3r8bjyTSNJRu1azU7QFx0I30B2EsBttp+14
	cV/cbogWzkS/gskcNJlNqsoFrm4JXmuKqUEqtpOr/Goow3E0r4+fUL/f7J72Yr2dq1BFSyenRUJDM
	vo1u7i+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUvE-0000000GTDh-1cyE;
	Tue, 30 Jun 2026 09:38:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUv7-0000000GT94-3cfw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782812301; x=1814348301;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qPxtI+f+BE5aWVid8LOQEajXcJY4oSXCvUiv/NY6ixY=;
  b=EGKMhbw1DqyQ0g4WNq5jNCEL+1g9wc7nQeL+g2zOYsBce7L4WV1Qi7Dj
   aKxVNWtavPqdZPMfh2+at5W4nAJ5l23eIsIf/jXnczv3XeXioyn/Sqjeq
   toOiCNF+3n8cWbzHCJTs+KczP2kISk9Id5T3JVuV0o488261dQNbHv2qu
   o71/Q4vHRHoV452QNxwoDHKNyGZ1IzATNE9qUoEKFckJu864DbzDNv1h0
   nmhzOGyjlDtdBVkBXKSaiMqMbu7i6A2OwdnIGZ8Qihfd3Y/cXrI6ayjM4
   Ak2S5NwVy0q7CmxE52x16KCm9VW7+UIBw0jOyxeNro7TVVm8FGSj1auaN
   Q==;
X-CSE-ConnectionGUID: DMe9/CRHQ/yCFfdCFRbxVQ==
X-CSE-MsgGUID: P4Zsrn08TZebKbn4DPHosg==
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="59032715"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 02:38:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Tue, 30 Jun 2026 02:38:20 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 30 Jun 2026 02:38:12 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <jorge.marques@analog.com>,
	<mazziesaccount@gmail.com>, <Jonathan.Santos@analog.com>,
	<jishnu.prakash@oss.qualcomm.com>, <antoniu.miclaus@analog.com>,
	<duje@dujemihanovic.xyz>, <varshini.rajendran@microchip.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 11/13] ARM: dts: microchip: sama7d65: add cells for temperature calibration
Date: Tue, 30 Jun 2026 15:06:01 +0530
Message-ID: <20260630093603.38663-12-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630093603.38663-1-varshini.rajendran@microchip.com>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_023823_963804_2E27010C 
X-CRM114-Status: UNSURE (   9.01  )
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

Add NVMEM cell to ADC for temperature calibration data.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 5867fda378b1..c336f863406d 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -323,6 +323,8 @@ adc: adc@e1000000 {
 			atmel,trigger-edge-type = <IRQ_TYPE_EDGE_RISING>;
 			atmel,startup-time-ms = <4>;
 			#io-channel-cells = <1>;
+			nvmem-cells = <&temperature_calib>;
+			nvmem-cell-names = "temperature_calib";
 			status = "disabled";
 		};
 
-- 
2.34.1


