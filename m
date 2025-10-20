Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D247DCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 13:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1W2HGikbIJzfaYIFBM5i8Nyqmn5OY0xo3QvYrQaWSv4=; b=SbMz2GTlO9MwGpazFdzpUTDZTC
	zXCqv6domzbOdFH4X438Kgq9IttMVIr77dPtr1DzMSrvNYpthPinzzwmwWxa/b2sfn2nf/lSnwYit
	iEqOI98KGmxhnilMWoSxXYiH79UXy4H7/UDKwF1YBrftx2x1K4DJhtRrC5lWhuuHmnANkjzgSsbS3
	rRQQ3YuDihuBlIhIn9aQnxNkAds5lixWrWe7ll7rKspo+pMdhlEeFqHGrYvM8waoKaEnrcXYF+Xyy
	BHkFz3TegmNrpo8uM+8rRLknIDM8Ax9QIeWuL3InMjUNG49lF+na+IyE3PYsmdbD4uWoacq6/bzsy
	gK8v6NnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAq3x-0000000DoS4-0dFc;
	Mon, 20 Oct 2025 13:36:37 +0000
Received: from mx-relay125-hz1.antispameurope.com ([94.100.132.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAq3u-0000000DoRE-3jZE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 13:36:36 +0000
ARC-Authentication-Results: i=1; mx-gate125-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=1W2HGikbIJzfaYIFBM5i8Nyqmn5OY0xo3QvYrQaWSv4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760967366;
 b=j7xVhvYC+7ewBJ9+8pxSkjbclCC5zNo/jk30+12ZBIw23IedCd9dQLR9b0RRfO9p920d3NV8
 WY+L8fmKIQ7KdTadCvPYwcDB/lqLqx69TqRP73jKgjdnmzjifvmaaLPirwiU+FXPLQx/TnGTMAE
 vySoHA3M0ACZGer/C6XF1nugkpg9DOLP15cNPwv+NthAOqNeNO9bTm1mg70okO660yMkYipfnN7
 yJCASRopMUPZq6cnsP4W1wbTWbOzco3JzSYGHeQdoDBFIV/ux6/NWj9XlXHdRAyoPabh6qql2YE
 Ebnjh3pz8DNkEdwsoRi4TGn28gbQ5O7rosZkHIFkzd9Bw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760967366;
 b=oLFRw0dvSwOm+ILLsgg2Z6jt0mFqim8n1POgs8/SSaL2VYabLXiKmm7YwWTArlnrhU2n4QHI
 Lk8S3z8yvcwGOOedk07sFPra5lm1lc2TqJwNG46ru+Tnw6xtwurAR8a8KuqnGmR3tbC4G/z95EV
 K+6fg9PgeqfTJbTTMX3b/j397qwbf85MAS27kMRIkcBD2uf5ASdICmnJ+ZhU4hf2KQiqzuMuImN
 FNXeJPq/edIhpLsm7ZTkNTTJ4LJwKPe0SFYZJI3ESRghV8kGsq11sMUhv2GOc0DRP03NGQ6mui+
 v0iB/2u0otsweennuAM4x/xywfUyTPgqZaqoM4xVOzcZg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay125-hz1.antispameurope.com;
 Mon, 20 Oct 2025 15:36:05 +0200
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 90AD3A41252;
	Mon, 20 Oct 2025 15:35:37 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add TQ-Systems boards MBLS1028A and MBLS1028A-IND
Date: Mon, 20 Oct 2025 15:35:32 +0200
Message-ID: <20251020133536.303471-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay125-hz1.antispameurope.com with 4cqxJV37nmz3jhMp
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 130be11a8cc6b50305d6fbf7d7b2b905
X-cloud-security: scantime:3.047
DKIM-Signature: a=rsa-sha256;
 bh=1W2HGikbIJzfaYIFBM5i8Nyqmn5OY0xo3QvYrQaWSv4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760967364; v=1;
 b=n4fGYe4XTxuZPtwWnp7t6trakLMHvpGImp2AcU/W4oh998MlwJ8yInkiNDZCDfKP6rebr0lQ
 lizERdaW17feAG4+PBvEBPGhgps5BBXUlWshumCwso4c1jX8hrahjIvVnGsQgN5RCGNX9o++FD2
 igR8OK4mXMnn50UaRF0AeU7Iyv5uq+imorytlgS0EGseoGFEhcC2wu4NiLp6cXHQEfQ9gXAdjv2
 coMWFIVgwomcJfIK0O+jT31yB4AeBBrCY2jpaoIk2mKnqHGEbMOtxTDujuXtU/Bp6MOkZujB8fw
 vRBu8NSA0RaIlEBodMNBm5uWkySCj41HToV4Lg1URjkow==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_063635_067288_622137C1 
X-CRM114-Status: UNSURE (   9.25  )
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

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

Add two mainboards for the TQ-Systems TQMLS1028A SoM, based on the NXP
Layerscape LS1028A.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Fix indentation

 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 34c822a52a5e3..12bf25fb0a97a 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1665,6 +1665,15 @@ properties:
           - const: kontron,sl28
           - const: fsl,ls1028a
 
+      - description:
+          TQ-Systems TQMLS1028A SoM on MBLS1028A/MBLS1028A-IND board
+        items:
+          - enum:
+              - tq,ls1028a-tqmls1028a-mbls1028a
+              - tq,ls1028a-tqmls1028a-mbls1028a-ind
+          - const: tq,ls1028a-tqmls1028a
+          - const: fsl,ls1028a
+
       - description: LS1043A based Boards
         items:
           - enum:
-- 
2.43.0


