Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B90F532D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 07:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bkhe969jD/i5vePwaEZL13x2IcLfYmNd4gdEpHS4cvg=; b=TgNQrJK1p2wpMAiFHRMqekxnkj
	zkL+2x6jS9WZSJLfyUr6/kvPD5TmXQBAPbKNdHjPSsDLUENzSXFQc/HcHrCfAUN0RFGu2i6nOgHEu
	iO1Lg3Ca3rcoqyEXToa4MT45IcbFtMUeGWtMM/HAPZlIg9rCp2fL0oqgYgKhAYaQvj+KYSAPiYEFY
	PD/9yMsz7RviYn8/6j4Ks1BSyBSSXUwINRCEcpbBiqTED8eMpugX1SXjDsihwVl43VvWFeLGD4X+P
	u1ap0iOqKAyqu6ak5Oe3xh2sKoZxOELOKhURyP6B243YYU0PbFvAcDQ+meZcX3Z4/y92Az5vRjhWE
	YDoAXA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vtb-00000000rfj-3cbG;
	Tue, 24 Mar 2026 07:09:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vtY-00000000ref-3q0b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 07:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1774336183; x=1805872183;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bLQt8fxJUw06nS+6jBdAfNbnHH4t0Q8Ek3Fdb97n5Mg=;
  b=LvHTrriJCtKi+H+NBCClIcXGAnoU6yiGL1bB4c2PHLP8ix44nMDasoEL
   6xwsZ6EKjIjrFq9bO0FF/2zxRJ8+YtHb4vGdtiV4RQlbvODSLx6Ocl/lE
   sK+ndQ+I8b8OhZguBy/opz0uToN6HKcQT2DBYzSh4s6wtwmQc4c6Ypba1
   F78MtySqYT+sFy3Y7F0ccV5a48NLaIivTzFOE7QSev1Y9Me6Gi/gVQVQX
   ODKYK3ybZq3cvkJSJG6L7N/kaUGQMHgVLgCpiTwsQ3GVWdBIQ4/Sq1Hak
   wa+YIzkNUVI1M5C2gqcfQ3cmm6wgJeG+lUraHfZfopyRmW1C9qWXYfJDH
   A==;
X-CSE-ConnectionGUID: X0VdBwDUQ7W4LQldQe+uSA==
X-CSE-MsgGUID: AMxJHc3JRHGY00R6eXHVPg==
X-IronPort-AV: E=Sophos;i="6.23,138,1770620400"; 
   d="scan'208";a="62806825"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 00:09:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 24 Mar 2026 00:09:38 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 24 Mar 2026 00:09:36 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 0/1] Add Cortex-A7 PMU node for SAMA7D65 MPU
Date: Tue, 24 Mar 2026 09:09:26 +0200
Message-ID: <20260324070927.1496-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_000945_072364_5687FDC5 
X-CRM114-Status: UNSURE (   7.66  )
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

This patch adds the Performance Monitoring Unit (PMU) node for SAMA7D65 MPU.

Changelog:

v1 -> v2:
- Remove the interrupt-affinity property

Mihai Sain (1):
  ARM: dts: microchip: sama7d65: add Cortex-A7 PMU node

 arch/arm/boot/dts/microchip/sama7d65.dtsi | 5 +++++
 1 file changed, 5 insertions(+)


base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.53.0


