Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98D1C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 22:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lllgZxj9IlpQkvyLsX6w5NEjjZcmEQTTD7hvtYVHWic=; b=TuvZwjM/bi8xkxF3rzzILVz9JM
	fPpKCtz1iTEGM29gN+nQ2W7vpISvCbi7grFKZQX+6SCpCcXJ3bXktkxCEuhs11n9oFhCkH9YdsPl/
	NwNXbNwmpdQRMLssNRVRN6A1xQcA1JYfKtCAhrnJl5fKK285I18d34ZQOkCAUw018rjnVEoZpk3Hx
	eyjg4c89CLG2CQtKUiuiJCdfQKciwgmjqyG3bpEmQePHW6GnNZGGZ2pweGve4Pt2WEpsZdXmSO+Ox
	DWbCGoMieV627isstVVStuj9Z9Kdktffy1xV8LmEp4wh+DSlg5rJcplsdleZHYBrzFfYq9otCGPVl
	YQalMErw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExlN-0000000Dd7R-24RO;
	Tue, 13 May 2025 22:06:13 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExf6-0000000DcNh-27rV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 21:59:46 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxa493216120;
	Tue, 13 May 2025 16:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747173576;
	bh=lllgZxj9IlpQkvyLsX6w5NEjjZcmEQTTD7hvtYVHWic=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KaWNy2Iw86bB8Yo6oY4YpNNspjHbr5MxBhVNqsQRHQBMLhYmPX/oeFWimHBtc5wdc
	 W/7R96Bb/0QzZp+dPUsxsCCUINq+EL7W+DuUhWKoqFtb7mfetfFD/xPIecHy2xXu/O
	 qyU+hbYv2OfiFJXIFw261U1Rkpi7d8vdhBbHDn38=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54DLxZ8Z1005888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 13 May 2025 16:59:35 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 16:59:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 16:59:34 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxYdD111031;
	Tue, 13 May 2025 16:59:34 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Bin Liu <b-liu@ti.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Andrew Davis <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/7] dt-bindings: soc: ti: pruss: Add documentation for PRU UART support
Date: Tue, 13 May 2025 16:59:29 -0500
Message-ID: <20250513215934.933807-3-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513215934.933807-1-jm@ti.com>
References: <20250513215934.933807-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_145944_634565_977F0508 
X-CRM114-Status: UNSURE (   9.57  )
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

Add documentation for PRU UART node which is for PRU serial UART
based-off the industry standard TL16C550 asynchronous communications
element.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
index 927b3200e29e..54397297cbf5 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
@@ -324,6 +324,13 @@ patternProperties:
     $ref: /schemas/net/ti,davinci-mdio.yaml#
     type: object
 
+  serial@[a-f0-9]+$:
+    description: |
+      Serial UART sub-module. A PRUSS can have a serial UART sub-module based
+      on the industry standard TL16C550 asynchronous communications element.
+    $ref: /schemas/serial/ti,pruss-uart.yaml#
+    type: object
+
   "^(pru|rtu|txpru)@[0-9a-f]+$":
     description: |
       PRU Node. Each PRUSS has dual PRU cores, each represented as a RemoteProc
-- 
2.49.0


