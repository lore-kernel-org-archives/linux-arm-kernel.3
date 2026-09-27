Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AF9C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 14:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhYOgaxRR7j4ejOJFgl1IvOss9RYAM+ujwKR+cXQZZ8=; b=Uy/vLEc5YF0RIl6h86nzOIUX0k
	JBvUE4EJQ35x/OZyRZeybeNfm3eYeKqNnbcFTYGL6zSR+LUadfd0RN1qjOQQqxLZHpuRtG7SDuhU+
	UyOg2ZXhJc+FWbLkqq4pweZM2J6GwnyaZOHXWQM2iosHvEAEtaLhliI7dWubDCGfmWneyUrlljtfz
	0WbwZhlMNUaBPtlv3TCfwaOUuYT1xWHx7xG/eRDExSi36gpOOUoNNjyU6BrLLNZTYZUDBnGKNnKMQ
	S+tPITqpvE598vCCTMe3RTuGe0TnXvAB3iaPZ6gCdZNPP2uP66i4I1FUUZ6l8rwXNrzaEkn6SAq4V
	Yr7piidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqIR-0000000GTGM-13k5;
	Sun, 27 Sep 2026 14:56:07 +0000
Received: from ci-2003i-snip6-7.eps.apple.com ([2a01:b747:3005:200::5a] helo=outbound.ci.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqIO-0000000GTEj-2rqQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 14:56:05 +0000
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-7 (Postfix) with ESMTPS id 3D6581801068;
	Sun, 27 Sep 2026 14:55:59 +0000 (UTC)
X-ICL-RepId: 01a0e35d-a0e2-7ca1-b5a6-946884500313
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhPAEMGXAVeC1YBXwFLVxQEDloDVA5cBBcbXwJCH1sVSzhaDlsERxQXG1wAFw1WTVAbXwJCDxwTVhUTH1RWA0gZEFYBWFZdBU0aXBhZDxwTUFZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1QG18CQg8cE1YVEwBeDw9MC0gBWwdSAEcITAZYBFMcQgpLBlkPRgFdTxFdDlIFRl5aFFwYQwJXAnkRUAFYHlZeWhdeUxcfSwBcRVoOWwRHFA==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790520961; x=1793112961; bh=PhYOgaxRR7j4ejOJFgl1IvOss9RYAM+ujwKR+cXQZZ8=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=M/G3kweicwFEEfe2xlpl3zsCBmHu9HjLa+G/bGYb45v61+uNErHtxe/O8jwlQo4t/olmmJoXbK2eBl90Lo1FGPThJQVcI5N1e4zpSLXMoXg8/f24YAUgJbW3blIkNA0JJF/3Y63kj2AmZCJS4/CFtJqvl8BrTuqCMV8l0jhMSLr9fzSjhnzl7KOT6/Vjc8IvwcHpBOiHoCu4JLAx5j1opFMHXIntMwLpje4WZdDbsIiucH5KNfFzJVNBMw3AFdusy8numDGUP8Z8bK/wxYpLnlDwlLcTduBa6T/c8Js4/hO/XuvFARFd92Gmu1gDinwLKlP5P3ncNQxltw0mX+yt6g==
Received: from bigre.tail98293.ts.net (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-7 (Postfix) with ESMTPSA id 2083A1801064;
	Sun, 27 Sep 2026 14:55:58 +0000 (UTC)
From: Vincent Cloutier <vincent.cloutier@icloud.com>
To: sre@kernel.org
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	daniel.baluta@nxp.com,
	shawnguo@kernel.org,
	agx@sigxcpu.org,
	angus@akkea.ca,
	Vincent Cloutier <vincent@cloutier.co>
Subject: [PATCH v1 2/4] dt-bindings: power: supply: bq25890: Add input voltage limit
Date: Sun, 27 Sep 2026 10:55:36 -0400
Message-ID: <20260927145538.233548-3-vincent.cloutier@icloud.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927145538.233548-1-vincent.cloutier@icloud.com>
References: <20260927145538.233548-1-vincent.cloutier@icloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: P6pgAecUhM4pEb_rI-AEGSwQPkMH0dde
X-Authority-Info-Out: v=2.4 cv=FdQ6BZ+6 c=1 sm=1 tr=0 ts=6ab92e80
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10
 a=5j__JWfIoqoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=3-V7KW_DX7Zo5MS4syoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1OSBTYWx0ZWRfX+DE8PropbEAA
 VCPkZNVjSwkwH0Nhc6hI07FGmcZorApVbLi4sCmhOiqxzn7fhhSsrwa4FQE4qAuPvRpvWjbsofq
 l+809hBV9bjBMyIdSz68WGzwJa0unsITcUxhPbHAgvtjCA0QSXJrxEgozHtt/jieZfSY+6hktHo
 Di7uX9DBHdCn2HtXcB2NikI8uqvs2QYodaIfTVaDdpEvHM20bI4s/DBaoemr96Qp3+5cA5CHl10
 51UmrFx2vxbTMAry32bOIE/S3SNl9Riea5EHwgSi8hAr6I+asr3boX2FeJt41mDJZj1me1WTF/7
 yT2CyMsFFebkrD++j6xyLUgAoZfail+Tb2e5cEd0OX7JPusHWamv0CuLjOzpyo=
X-Proofpoint-ORIG-GUID: P6pgAecUhM4pEb_rI-AEGSwQPkMH0dde
X-JNJ: AAAAAAABLirx1JOWFPvAiGSg/j+EDim6HyyuQtU2itYCM7VRT4nVBTyQoKsY9qHb3C4SQ7bEZddzQPzCAO8BLGqZb4OxkL0llBEGPFY906JanWmSKzubulTXJ/dLGKpDwd4eg+9jwwGUbjCAnuF3P8xr6f1ti8uATyBPDpmNjOweOYXW/ZzgQUOnfGKtvZYkFh4yYp7208dqdkMxvUYNm524qTU3PnbuTD+mOtZoEq8ti3MM5rVk0bUbw6QpP8JVtzjLciKzaFEgLUTJ8+78KdOqd9lKy5MN37SzWtwrVT+eabbDgM5Xg2Vz4uUp3qlH3LC5EurE9vA0R4x7CVSEzbMtzt616QGp3j85TKf8tN635ao/G9ouF4TfIPOS24SAwJGmayiJGeFN1OQRECifyGl3MO2CyKrg1aTrj0xwjFFLwxeVTG2UaNejDkjXmr5NBBvmOi5qpZLeixsuaM18xqXWjCH4O8Rclu4U10NPfgZk/VyVtwXVMKEi4hVwJNZRQ6bIQKHtYhIDeFXESLJRG1HjAFfEV5JbyoIl40jrW1xPPC5Agzak7eyMDK3wXrCnf0q2atW0jtsgmuRUMs26xikj7HeqqbQZFRLWm6gtGWL/O1MuqkGPTt2yG8J+A4mkYJ6nnR0RSlcIdVHTyhdywl7T/iHQ1nGXYK81bWQtvGW7O9CUd8GJLc3Pdk+Qo7fdFwj2smRNZ0J/G2Gw2otZoxSWGqUdKkqyfSyt8UHXn1n4z/5CGD73g6fdmu35V6X3GmCXl1wymVMBvBBnjshTlCdCQsqog6SgyEl9XZNU0lcnPoVjWd7GPV+QJRnx0ACqGfTR2MDS9drnhEUjxM0qTs1opvplCwmfqhixYDdJAkhz42D0f6vlj0IIGKtlmlDDbM9E1F4JaJk25RqvH4Z8TkZDN4I++MWTfDZHSnjnv9/juAZCpX/GXKZh+KT/v4HJBfHGKRQ2Hh4kiw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_075604_772611_78A1249D 
X-CRM114-Status: UNSURE (   8.09  )
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

From: Vincent Cloutier <vincent@cloutier.co>

Document input-voltage-limit-microvolt for configuring the absolute input
voltage dynamic power management threshold. When the property is absent,
the charger retains its relative VINDPM behavior.

Assisted-by: OpenCode:gpt-5.6-sol
Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
---
 .../devicetree/bindings/power/supply/bq25890.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/bq25890.yaml b/Documentation/devicetree/bindings/power/supply/bq25890.yaml
index 0ad302ab2bcc..8d1f27447cca 100644
--- a/Documentation/devicetree/bindings/power/supply/bq25890.yaml
+++ b/Documentation/devicetree/bindings/power/supply/bq25890.yaml
@@ -31,6 +31,14 @@ properties:
   interrupts:
     maxItems: 1
 
+  input-voltage-limit-microvolt:
+    description: |
+      Absolute input voltage limit. When present, the charger uses the
+      absolute VINDPM threshold instead of relative VINDPM.
+    minimum: 3900000
+    maximum: 14000000
+    multipleOf: 100000
+
   ti,battery-regulation-voltage:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: maximum charging voltage (in uV)
@@ -113,6 +121,7 @@ examples:
         interrupt-parent = <&gpio1>;
         interrupts = <16 IRQ_TYPE_EDGE_FALLING>;
 
+        input-voltage-limit-microvolt = <3900000>;
         ti,battery-regulation-voltage = <4200000>;
         ti,charge-current = <1000000>;
         ti,termination-current = <50000>;
-- 
2.55.0


