Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505A4C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 21:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9nHFRwj5WZMgtxSElXWFmj51/p6cjmuUXtJwmUNM5s8=; b=seP/+gW8pz92n/IH4bSnFG8nPW
	eKBA60DDyZX5TP91CJrHEuSwgglzvEY8qrcoc+nyZ0BRmOII8Ri71PWb39MOSXgJE+Clw/ltTysgQ
	ka7kvAPxNPz6wfBAo8beLRpaDmmWxnBdkFVidoMQgxXBphA8u+EkLexvd/QJ77rOUB4rG+Z9OWX4B
	iUjSwIkbios0HkiX82msl9WRT1ekwVovLPh+jAyGSAXqEYQZWsOvNyd87LToSPGDOS/7Q80yfpZtA
	by0EDzRURqlTatFkeVawuTke2BUllzuwDY10kTX5eBWCD/GNd8PbnUKruqzGEDzt1Fm+pqYT1K5em
	gKJXsQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvkp-00000007yLC-0sTO;
	Mon, 20 Jul 2026 21:42:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvkm-00000007yKH-1Gef
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 21:42:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3366143D;
	Mon, 20 Jul 2026 14:42:17 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DC563F66F;
	Mon, 20 Jul 2026 14:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784583741; bh=7GPCEpWSp6hdvoiZp/dWDlRlQZkpNncKgtqSVs5WpVQ=;
	h=From:To:Cc:Subject:Date:From;
	b=l8iAgLJzV7Gh3mwE/JMxyp/TMqv1GUgNiObXadU2jzw1/5vwKGwxnPdQewXZ9dYDu
	 WjFH5fDtXjJQN8vlY6tcX3U9ypgFZk1wmHI8SjrQSnCnB7AGmkgjh6OmhIOtWeLD24
	 /eUxAXDjbLj0L+RW23StDNOoNAUYlriflwcAUjpE=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: a523: x96qpro+: overvolting eMMC
Date: Mon, 20 Jul 2026 23:38:32 +0200
Message-ID: <20260720213832.3763-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_144224_468548_E114A17A 
X-CRM114-Status: GOOD (  12.89  )
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

On the X96QPro+ TV box, the eMMC wasn't working properly: the chip would
be detected, but most requests failed, leaving it unusable. Some
"solutions" were circulating downstream, one "popular" one is severely
limiting the clock frequency, with a drastic performance impact.

Instead slightly bumping the I/O voltage on PortC from the canonical
1.8V to 1.9V seemed to do the trick: the eMMC now works and reaches the
expected 120MB/s performance.

Adjust the respective regulator voltage in the .dts to enable eMMC
operation on that device.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

I am not super happy with this patch, but it seems to be a pragmatic and
the least hacky solution I have seen.

Cheers,
Andre

 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd5..5636e95312218 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -194,8 +194,8 @@ reg_bldo4: bldo4 {
 
 			reg_cldo1: cldo1 {
 				regulator-always-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1900000>;
+				regulator-max-microvolt = <1900000>;
 				regulator-name = "vcc-codec-sd";
 			};
 
-- 
2.46.4


