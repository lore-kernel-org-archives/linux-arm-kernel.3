Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BDDD5E14A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J+XQ7ergPVCzcXY29psvIoBrucP9oMPTCH1A1rkDzxM=; b=WqD0wC5NVFfQzxIYVocDbeAeGP
	eV/QsqHHWj5g49IXV/L7VMQWsQrkaFpPK/pQwufDbKGVJfpIKHzUVJRa9Iip01iBuVHlOOzYZJbWM
	gUnvYyyPCxMLzoX0jYTB7PVhYGSUS0mXZqdIX9uvGQkmsrtJgoZMOFfxos3lvTynxOJzRvhtCi4N3
	VYRgRQX08rv5hVwyZS68HTX+8mHUVT7BvEF7X22+0/MS8zyao7OJ2D3AwUFimirc9rcRYvNTiSf9P
	PHNwGA6SPrDt/g7ZHZdkGIcZ6Mp9rFiFtqJ8lpPkeMYmubCQ9u60piv8cM4Bx0OlAkHUR2WoNKERT
	ygEEaD3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUuG-00000005EeK-3na8;
	Tue, 16 Dec 2025 13:16:00 +0000
Received: from mx-relay21-hz1.antispameurope.com ([94.100.132.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUuC-00000005Edv-1dyS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 13:15:59 +0000
ARC-Authentication-Results: i=1; mx-gate21-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=J+XQ7ergPVCzcXY29psvIoBrucP9oMPTCH1A1rkDzxM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765890946;
 b=UHp7neGDYOoCn5NlN+NBub6pPRzmuHdFAySIqUjc+nTo8hASg6/lgxme7CfZsQjmuFxBkaG/
 3MkZm56HsAkn2FyKPHcjkapFCJPkJwmXYMV35ld+9J94lGBtNS/6LeME6aRQTDYFOT0vQ6p4JjJ
 33olXRpTjhsei7BM5DAFoijpZIrLB0m+MG76OhEIOu1qbf9f9NSpxVCPOgYRQJA0WAyLIPWhbfY
 RKC773nHT4tj3+kvmrVoR+xE214+/geaAx/8awR9NwK1A84e56fC35C4pkjsN4T+V55ilbkhIrK
 gOirromMt4ClvekSie5oRjkvdPrfWnxwKiH5Jx4FV016w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765890946;
 b=tP6gQL3Fnv+r6uYfynSycjAszMjy6bITcE9vNCGOcxFXI/x8LIi5ZNZES1j+A4ui06mT3gSc
 1lS3t15J1RTBjVO4UlKiDK0SfPgY6sOKTioq72iwakI2OhdImVBJqSBdTmbwf/orXFiSr84PI9v
 h4TuUWCOfOWhMoHS4TicItGJC/FeS2nWIrsoRH0eGOrGnMIYKKxtSOJ9urOFJ2blgGxxKiEH7sO
 f2TX2oXgzH4wnmEl4uYjWtijpTHScFJBJ+Ohq+bhnWWpU6XKFoeBbwQLa+OZgnNZOzFG9Vh58jX
 gBnjySV8nZU4gkcid0PYQvQO87VOKvCP3uknHZIAJl4Vw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay21-hz1.antispameurope.com;
 Tue, 16 Dec 2025 14:15:46 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8B5FFCC0E8C;
	Tue, 16 Dec 2025 14:15:33 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: mba8mx: Fix Ethernet PHY IRQ support
Date: Tue, 16 Dec 2025 14:15:28 +0100
Message-ID: <20251216131529.886546-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay21-hz1.antispameurope.com with 4dVy921b72z41r9H
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 0fe9136366c4b6928e5776230e78d4b0
X-cloud-security: scantime:1.648
DKIM-Signature: a=rsa-sha256;
 bh=J+XQ7ergPVCzcXY29psvIoBrucP9oMPTCH1A1rkDzxM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765890946; v=1;
 b=SBjgPcvT9Cd4BelWU2QTztzVlXRyqfETo0dXeJfCV48SXzW5IdDdg6Q6PWp+qQImXHDSTME8
 XQAGccbt11f/+zJod9OQn5sdes9cg4hxSRF3ziZYul3A5sP1Ehqe4GkyWzyk8C0qw5s+rnP8dkF
 iJyzEopY3NWJCY46aUaM9c6lXaq+8e3mTqFKLjzJnnF6N7Eq0Ai+CnK3Kd32l/W3a2rf9ySqNL/
 WBZj2j92XAcINWg5ND9QDAiJXoEu8+S//d/iCfiV6arDeRVAEtFAtwrQWCSdpJCpsUm9uuWhksh
 Mt3H4KgyNwK6UA5hg9/+u2+a/pTE998YuIy406Ff4eqEw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_051556_891217_F318ABDE 
X-CRM114-Status: GOOD (  11.72  )
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

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 225cd2f1220bf..10d5c211b1c9b 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -192,7 +192,7 @@ ethphy0: ethernet-phy@e {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <500>;
 			interrupt-parent = <&expander2>;
-			interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.43.0


