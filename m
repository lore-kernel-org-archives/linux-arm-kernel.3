Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EAAEE6441
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 21:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j99Q47GdEpRT9D/ae619Fkn+XOqqqjjTPDUmDgTYPwc=; b=47A60E7v9ir9QW3tf6LFmVhkAy
	E4+lRR6FVpquXnm0WLGAdb0KaYNo6atz2tUOTz1M5lpCcZoZChO6GoARvblzyYSGhLEEmxZ+51Qab
	1QHkH3FNrzn3uD/7cY3R/8FLkh7CiCqxbuMd3KEp26BVCfCVTzHWxZWfENCLrDz6UEXAyIUNiMmv2
	RtGUztNGIWND64S8k48wAbyyTy9VXSb9JM86106GnhodbZ0N4l4KALVHxIFymjQ2oC5InesfLNJRn
	MBE2YoO0wTTzLvAv4HdRw8IUzZ4hotE749TRudTuE5dHEuCISDYrVDvdwj6GKJa3qNgkQRm44Tj1f
	zlhfBaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb3m9-00000006M28-2be0;
	Wed, 31 Dec 2025 21:30:37 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb3m6-00000006M0u-3s2e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 21:30:36 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dhNRB3pFQz9t46;
	Wed, 31 Dec 2025 22:30:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767216630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j99Q47GdEpRT9D/ae619Fkn+XOqqqjjTPDUmDgTYPwc=;
	b=QKuZX1a8bzocV5ijaLkKXrmXX0hI/s/Bq2+aP/SCcLnZOschHg3du5eONYmIsYnShEdyzu
	G05bnEjxQWnnKvA33L0n0azeLUOd57XGk/PeIrPKjyEQWquuk0xVyrYY6Oyf0IlOGIE+z7
	BavW8R8x1HJHQeUwlw0Xnw9Jrzm+Hr5+FjVbzGKWzIhkTydcrtDLmYeko7seBMgUKqDNG/
	4yB5o2gKlSQWbRoaYUDFY3KyAHLWHMwCeEj9z5wAwWITvpjkhdg+sG9eHPqaygAtoExxm3
	SZ1X/KhdHI8HuYI6VsAaEAw0ZeOvYOoPzW0kryzzfwHBiuvdPIoSIew8hSoERQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767216628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j99Q47GdEpRT9D/ae619Fkn+XOqqqjjTPDUmDgTYPwc=;
	b=sPdAeBZh8ViwiKqaFiXRlH7hjkWHKEK9OLcNI2kjZFKEnUbDiG53/wZqN4uIG/SHmnfs4F
	ke2P8ZCs0uA+rh+3szq9VmGvwOeS5qbwLZp5kLiR+NgJCobNriLRWcZ0dwSf/SFSQH+kLp
	jTCcnWu/shhoIflUhhMBz1US6gHKD7YbN806vFXDuZCayLPFHBufqn7hUyfGZsBtHUq4uu
	Gd5k9aKCrD4dn7wE4FqEPZBZP9mTzT0xUHEe3Z2Ny54408p3NrLozmYsFpOw03zp0hJyLf
	hwOF+L2z4EEGNEbO+OuyutRY6k4A8iUxUkUH8DW+nKphDCnHskR8RHNE1ABDmw==
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
Subject: [PATCH v2 1/2] dt-bindings: firmware: arm,scmi: Document arm,poll-transport property
Date: Wed, 31 Dec 2025 22:29:18 +0100
Message-ID: <20251231213016.185575-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ksanyuhgeaad8muaa7msk9yjryisdh4e
X-MBO-RS-ID: fe2f78a35cf7f8eb2bf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_133035_108058_E38EF10F 
X-CRM114-Status: UNSURE (   9.44  )
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
shmem based implementations.

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
V2: s@mean@&t and limit poll transport to mailbox/shmem only
---
 .../devicetree/bindings/firmware/arm,scmi.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index be817fd9cc34b..f4bf4173c5c7e 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -146,6 +146,13 @@ properties:
       this platform. If set, the value should be non-zero.
     minimum: 1
 
+  arm,poll-transport:
+    type: boolean
+    description:
+      An optional property which unconditionally forces polling in all transports.
+      This is mainly meant to work around uncooperative SCP, which does not generate
+      completion interrupts.
+
   arm,smc-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -379,6 +386,9 @@ then:
     - shmem
 
 else:
+  properties:
+    arm,poll-transport: false
+
   if:
     properties:
       compatible:
-- 
2.51.0


