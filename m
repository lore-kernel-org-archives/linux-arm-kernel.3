Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865C2CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6WkBUEsZXrdSrWtDBY0p0szZixzCZ3r/xfDV1TsjmXc=; b=1w70xUWa7mTPy9zj4qPYB2hOXd
	8rf5seObx6IJ9HXDIsqP/hQVH2JJ/Kc5m6GNhZucnVhMxmH3uYQmeWsjgWe9ybwRI47S1IlykPpgm
	EEkmdki6KJtXztrh8aACzOJiDxQ5HiWTFsw8qaesFsg6Xqo37Ely2kt4h4YHLZ2IMOSV3M87UUuf2
	WA9qM4cPyNhK6SJsX3V6i+/H8nn2irtA1eiXbqL0b1UBicMtbcsp9T+tUmoqNcBwC3Q6eGACmGbJc
	bpYaLje406n0zIPHAOBDytK4dHl+GXIeUiOn6rFsrMAAXhv/YnDsom//aM0LTlCt48jMlDRVLcAG4
	NXDGx+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuZ8-00000006GgT-23Uw;
	Thu, 23 Oct 2025 12:37:14 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuZ5-00000006Gf0-09Q2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 12:37:12 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cslsY3Nthz9sqg;
	Thu, 23 Oct 2025 14:37:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761223025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6WkBUEsZXrdSrWtDBY0p0szZixzCZ3r/xfDV1TsjmXc=;
	b=f7S/AOfUym2WSQJD+wd5aCNm4AcP9LB01v9Bhh58ON7xu620sLvUk5ROwnxbwmbLhN1Z2+
	uBKqjPaqP6E/0fLu5zEEqrzO1NTJL9dQCffwu6oeCeKaT7B5aflKzAVxujWNjk/vLa3d6N
	JvSp20fGFIlPFVwuj4qeenp8qfF7l8Xp4YfTI0DIQ1swq/yyQPf+wR54F/h7zrE7CLLvMH
	GseK5unRSS1qw1gy1npHN7x9ojq1YT1pjYTJduGGBJ4VBhIdpdOVXqIhFyoUZ4t3inBk8M
	WVTxFLE4zcZTaIaEcO4TcEZXZBPwHw2v1W0DgJDZpMB3IxqYPjTi1uLyACnrhA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761223023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6WkBUEsZXrdSrWtDBY0p0szZixzCZ3r/xfDV1TsjmXc=;
	b=Wn5Nl7G6hP6vmCoD+qRaXIEZCLFqbYiHMmh50h/DCfCsq0FFf77PcNErjp1nsPCPWtK0bD
	60bl5kL+31jADa0JwZOhQJNr3xg/aw0oBdNPn8eUocT2IPmjsw+3XuzxJ2In4m9AqpIqsc
	DxAITUnhaly7YVw9rEQELxPUWmtYChtKxEW7sHbtjWO7cO9mnYARLYsQEKFWtII/hHLab9
	0L5bF7OrZ3XjrGmTbLVTyrlHVXvYx1C1FlzAQeMOZ020fOuhz2iZwyroE8FiA7cm6HhdAB
	hnApM0vnLoHJulQXoP/lP3Z9mQgTPLqBQ/XFfBQIxx33WLjNAD1/Mn+qzbAz4g==
To: arm-scmi@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document arm,poll-transport property
Date: Thu, 23 Oct 2025 14:35:57 +0200
Message-ID: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ur38htuptdf9d77rhncyiu8mnbh67gm1
X-MBO-RS-ID: 946e3c1781cf93a3546
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_053711_217218_75504E0C 
X-CRM114-Status: UNSURE (   8.41  )
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

Document new property arm,poll-transport, which sets all SCMI operation into
poll mode. This is meant to work around uncooperative SCP implementations,
which do not generate completion interrupts. This applies primarily on mbox
based implementations, but does also cover SMC and VirtIO ones.

With this property set, such implementations which do not generate interrupts
can be interacted with, until they are fixed to generate interrupts properly.

Note that, because the original base protocol exchange also requires some
sort of completion mechanism, it is not possible to query SCMI itself for
this property and it must be described in DT. While this does look a bit
like policy, the SCMI provider is part of the hardware, hence DT.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: arm-scmi@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index be817fd9cc34b..b53754a318ea1 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -146,6 +146,13 @@ properties:
       this platform. If set, the value should be non-zero.
     minimum: 1
 
+  arm,poll-transport:
+    type: boolean
+    description:
+      An optional property which unconditionally forces polling in all transports.
+      This is mainly mean to work around uncooperative SCP, which does not generate
+      completion interrupts.
+
   arm,smc-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.51.0


