Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063CCC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 09:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYMDQe/mQ1kKIZU+OHkaA1YB3avFSOAww6d1p3lXtB4=; b=em1DhhS+A2Fv5GcB+JAF3QASvQ
	8ZwF8qC0Br2sVVSX7lsKBYPgOJ7dGXIvKUHAJFFcAvQgTQd+aTiPOp9OpQ99INtIMqRAMjslMK5em
	uLzEg3QAws4phapSbluwe13tiBmS9VEYyD4npgO0Z/cqpNr6wvM1MlGxU7CnyrVWKcKd8+/Eoijps
	tgnECP1+hV5h5mG8vP03+8+nISe4wGVpAkEyANz6SDynKuiBD9+XD45QXF2SvP0K0GfsL/PpwLOYV
	T/M3YlZf+kli2od2VfQ9YkB6cYBvx64B7cfBFPAuVhLJOSLnl5Ec33U0zZTilv0VN9IfM+8DDaHof
	fle6g/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVn9-00000004VoG-0cna;
	Wed, 23 Jul 2025 09:29:39 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVHz-00000004Qsn-32SJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1753261047; bh=VYMDQe/mQ1kKIZU+OHkaA1YB3avFSOAww6d1p3lXtB4=;
 b=ivb9MIBzoIRxiXQyivSLHxAPfvevfv03Z7luln+MSjpv9422AkNAyMF3Y9zvU4xM3xIQLGTJk
 Iu9R/40zX8tpweE2+BRzsATvA3RLL/sq0Ed691E2A650KdOVbfkG+qnAxKBJ3LIjJh6Oq5Opym8
 ChjB6zwLNhKwYpbZP9eB3lsKVmPTN6+Z9ZPdSByFuYcyCHoJWKpIVXCd56ULe8xhffBOCaYRhoC
 RGpWoLBhVTdaXdIvZ4EiwnQ2TWyU38aN/g04rHo0gv332+yunIMUv1b86EVBrpVYVNEFaX/WGZg
 1+7QF1TMlcTi5rbh+Axlv73E+mJyx+eZrxsU9ksP7Yxw==
X-Forward-Email-ID: 6880a3ed144dc4a5e5baee49
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 4/5] dt-bindings: serial: snps-dw-apb-uart: Allow use of a power-domain
Date: Wed, 23 Jul 2025 08:56:46 +0000
Message-ID: <20250723085654.2273324-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723085654.2273324-1-jonas@kwiboo.se>
References: <20250723085654.2273324-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_015727_793093_CFBC4E7F 
X-CRM114-Status: GOOD (  10.45  )
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

The UART controllers in most Rockchip SoCs are part of power domains
that are always powered on. These always powered on power domains have
typically not been described in the device tree.

Because these power domains have been left out of the device tree there
has not been any real need to properly describe the UART controllers
power domain of Rockchip SoCs.

On Rockchip RK3528 the UART controllers are spread out among the
described PD_RKVENC, PD_VO and PD_VPU power domains. However, one UART
controller belong to an undescribed always powered on power domain.

Add support to describe an optional power-domains for the UART
controllers.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: New patch
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 8f1b7f704c5b..cb9da6c97afc 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -108,6 +108,9 @@ properties:
       parameter. Define this if your UART does not implement the busy functionality.
     type: boolean
 
+  power-domains:
+    maxItems: 1
+
   resets:
     minItems: 1
     maxItems: 2
-- 
2.50.1


