Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14A2C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SRIX/FvqDap0SMfdebaXOrywr2NEUWz33l2V3WObDM=; b=qMjEsa2GCVfQpy+AJZGESZK9WM
	d31IU9kjNCzqnfMqIhJkVDE0uRHg14p+gR9Qzsqtgyrt6cPJY7FKjFjA4tnkLbb4+qQr2KPpPuqNC
	+wFu2fhGpM9fQdn9lwnwTsEuSMle/3AixYGdmgS6BzkTlTtwvk11svxkMtq9pwZZQ7BmNBEzjhPy4
	tDpUmu/gjUYrXcgUO2lfGvtmNKD/Xa7l+cR96RhKiMKfoVaU5FLAtUbBN9mHcda2++Y4JFAej7Twc
	qzGbM6f+iMPdmcV02iXBSKhoLyG8xPyZVBXK6lDxWExrSw4VyEOvRMsTO/qHlgYQjC7s/Cahnr4r9
	yNNcyvwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trLfs-0000000102P-0yEK;
	Sun, 09 Mar 2025 18:46:56 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLHL-00000000xS2-1aX4;
	Sun, 09 Mar 2025 18:21:36 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C71EB120006;
	Sun,  9 Mar 2025 21:21:33 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C71EB120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1741544493;
	bh=9SRIX/FvqDap0SMfdebaXOrywr2NEUWz33l2V3WObDM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=YorzCAHKzCsMS+6VKaHX0r5RlLmFzlEIJ7JlD7IdXHtP6t2dQkz5rKTAn6n9WEed0
	 A0itdLoQHIZ1yhLBh1dp5TrwH3dOlIgKYnPI2bh7P1EgtOCg6hhQir5E05QZynCGtN
	 ucBR150JdDS/W0FC7Stg07gfPUSBcIAbiubk1hK6p7GZUd4SJrWSD8qNzY06C0F68B
	 VveyE1XQkT9FHVlmgnDdJzasMNk80iSSgacrKyg2XDh4Es1e2GSjfUituMKr3fkC70
	 g9GE+Uu0Fq0AF3daNHcEfdUmFwdQGKXvjXjB/6Dz8khv5ox/ISc4uGIoOU5wdWQwJ6
	 a4e20yZHnPqIQ==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun,  9 Mar 2025 21:21:33 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh@kernel.org>
Subject: [PATCH v2 2/6] ASoC: dt-bindings: meson: axg-fifo: claim support of A1 SoC family
Date: Sun, 9 Mar 2025 21:21:23 +0300
Message-ID: <20250309182127.1322890-3-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309182127.1322890-1-jan.dakinevich@salutedevices.com>
References: <20250309182127.1322890-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.64.252]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 191599 [Mar 09 2025]
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_smtp_not_equal_from}, sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/03/09 17:28:00 #27692143
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_112135_808031_85BBF055 
X-CRM114-Status: GOOD (  10.29  )
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

Add "amlogic,a1-toddr" and "amlogic,a1-frddr" compatible string aliases
to "amlogic,sm1-toddr" and "amlogic,sm1-frddr" respectevely.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 .../devicetree/bindings/sound/amlogic,axg-fifo.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
index b1b48d683101..1e809c7c2179 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
@@ -25,6 +25,14 @@ properties:
               - amlogic,g12a-frddr
               - amlogic,sm1-frddr
           - const: amlogic,axg-frddr
+      - items:
+          - const: amlogic,a1-toddr
+          - const: amlogic,sm1-toddr
+          - const: amlogic,axg-toddr
+      - items:
+          - const: amlogic,a1-frddr
+          - const: amlogic,sm1-frddr
+          - const: amlogic,axg-frddr
 
   reg:
     maxItems: 1
-- 
2.34.1


