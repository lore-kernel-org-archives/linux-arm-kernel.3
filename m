Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCCDF3D32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 16:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0bisfPLoTg2XqRMiZbY8naTl0HU//YMfolzvMIjdGgk=; b=oeB9y1/QMRIqZAQ2iF0qsCX7tl
	buy5EIiJv0ZBipXnF+Swdj6EYx0W9HsW8MromY/DjtgUi4GE8fJwqNef0YluQCoKDoqVBznBEwt7X
	nguf2DCB6bgwqUirFvtVaY9kpGnqKxj3w+iNdAZfHAPpQBXpPneBVyIektDCybOptToK0+oNgahXi
	eT81cPgo0vGj9GvMoXIEIkK004yq2h6ZMYMewyKNlsRaBFiKh+nbgJGXTtvruie8fwP9kycF7ZWYA
	nAA2t2zO6TkSfrFE+SPYIxrxGzRxz0X28ddAlb6U/rznZj/GPftWNvrd9SpPp2bboZXersQKsXDi9
	5MPbWJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBmo-00000002Dzn-24Tx;
	Thu, 05 Mar 2026 16:42:54 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBmj-00000002DzQ-2dNo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 16:42:52 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=0bisfPLoTg2XqRMiZbY8naTl0HU//YMfolzvMIjdGgk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772728959;
 b=cauFo/mBaYioXvE3akjAW1tNJkBk3DZo1ZgVUB3Gmsp1wNlzk74kaOJKm8mY6eo+qjtGDmco
 q6JcgxEwFreMO3YoS1mOE+NpdQTpTmJVYMFKKjmQ4I80cv3iBDwe9GSGWS81FgDvlfN31bqw6VR
 XZKJz1I0bXMHqO7j5SMT018i/D+Bk2+9ONX+KZkFtDqz0YYK8H1J3Zrs+xufUWRHAW6yTmwZrCl
 0JUK5z7F2Yl6Srehns682/8N9gwTjyiZLLYPPMUBOwLjeZNxgv5J3VihCGOdwEJWvxgwMKQg47P
 v2OpqYWrnV81C9b1MpxKyb47cIM5Qhqv+idT4gtVff+pA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772728959;
 b=G1v2Vo/YrUEgBm8EGVQUeyx0TVTRkru42cgFc4+vzVS75Rq065QaauWeddBPNOCaMaOwM3xd
 MqmLhVv2F40amTjFGQ00MEazT+DUPPGiHzDjoWCAQGiAd/DHwn1hF7nOjVFp0QTx4aB4PChaSSC
 YJRJ9poiJM2sV/IZu+OYUwXiFzEWKy9wXJc3eP5iES7xZqwGy9gHsHKxpE08udmBuAGUwuWx0Cd
 pbSj9Xf33z6+HjLC7t1Yek8XFstjNB8sz63OPr7A0TlNyB9gLdgIhJ0pdjgq8EVRFijQaK9mjld
 J3/7MliOvIs06KnkNcZNJKSUV7fr+eFRjKngBwJpPwihA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 05 Mar 2026 17:42:39 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id ED36ACC0D36;
	Thu,  5 Mar 2026 17:42:25 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: imx91: Fix TMU reference
Date: Thu,  5 Mar 2026 17:42:22 +0100
Message-ID: <20260305164223.2650908-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fRb1G4hfBz3yX1h
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 571ca73a620effc4570f7a8b5f908bd5
X-cloud-security: scantime:1.761
DKIM-Signature: a=rsa-sha256;
 bh=0bisfPLoTg2XqRMiZbY8naTl0HU//YMfolzvMIjdGgk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772728959; v=1;
 b=iLmAX8i0lDd+psOD8dz9x5fsaWCLpG425xWqtyw1JEgjNGFhkCsUC3Ll/GFXPGYo5c6Yo+zW
 4nsSAWSwmJeoXz2uLYXLcxRTz0XJCGuVFv80VqtcpMpJoxgqC//GA3BxcFtlPWb/tRH85iOQnGc
 X1JxhA4qzHN1xU3kwHM5dbJHUToAaEv6Ku/AiLmX7jLKSIYrJ/VXSH7FKNcwgLBDy4Saj1Ww6sA
 PWtZwc8PJClkdkUk3ClViB9L2Pp5yCgIvqZ7TpIY8Cs6MsHxNwwQTy+XbynFfSO4pSiInsLzJe7
 cpMQleFemx4fUyy1SQTTxisdm6GX/kupSegZor3Fjrsqg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_084249_836973_1934614E 
X-CRM114-Status: GOOD (  13.93  )
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

Currently a sensor ID is added to the reference, but
thermal-sensor@44482000 has #thermal-sensor-cells = <0>, so parsing fails.
This also has the effect that other hwmon sensors (jc42) fail to probe.
Fix this by removing the superfluous sensor ID.

Fixes: f0ed0e844452 ("arm64: dts: imx91: Add thermal-sensor and thermal-zone support")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx91.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
index f075592bfc01f..d63569b39bbc5 100644
--- a/arch/arm64/boot/dts/freescale/imx91.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
@@ -11,7 +11,7 @@ thermal-zones {
 		cpu-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <2000>;
-			thermal-sensors = <&tmu 0>;
+			thermal-sensors = <&tmu>;
 
 			trips {
 				cpu_alert: cpu-alert {
-- 
2.43.0


