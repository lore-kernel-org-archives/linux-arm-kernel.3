Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A5ECCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnIuiwyqQKsNxaCMen44jTAA0px2zVCsntf2UHUmosQ=; b=o91EHHickvktLU+LoUb1Tt8dSa
	OOOOJkCE1a5fi63gkHvt+4VKRhrpVWSGWS95XLDGUM/DvSGIqYLPrWTaX22S4hgMYwG4M4Qxr36ll
	1Op9ZUKvalNL6xSeFT1rMF+cIipamFmWKqy7Ci5ODLb2J1xMdadlRfyrlx4i0kgy/LwImNZrBxzJl
	ZmgvuMa3hAK/Gb3iHiWWVCbDufkcMs09ogchlC2ew/yFsIqMqiZfuE77eVtPQaWFgVYwD3Yl45vH6
	ckzVVOnCSEtVOZLVXw7tJDLMJ7bf5XIh0nLMtLIMYzYu6GhJq1/0hWupEG3dBe5SSiXVfgN++vxgi
	YazG69nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET6E-00000004FIm-3D7V;
	Thu, 30 Oct 2025 13:53:58 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET6A-00000004FFR-3zka
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:53:56 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=AnIuiwyqQKsNxaCMen44jTAA0px2zVCsntf2UHUmosQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832424;
 b=WqxugXFdo2KwegmnIoRSm+UFExWmsDcaEouMsMjbQwh7pUtn0rTe3lEfLC85mWrLMIU9WzO3
 mXClrI3QkzAQ+7Bo/AovMbhisduewaK69S90idEyyC1vQTPbcLZrLM2QA5fRNGNmUaPnjmXT+pE
 tMBS5u/zGVygGYzt0va8Hx0GEGeCtjTlPe3+JD8kgbnggJJSfaoaTQeUHzk7ivvNS1gHkIzoaLD
 3s38S8A/z/2vQyPfJqntQIPpWwKmVbvr8mayJZKNd+ZvValqeaYECQXbwsRrcHaMO8Cvz7g+P6U
 tPoXTPiXnWuTfKJSCSE4m3l2pWbFbKBjU8+yYCHE8YYQg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832424;
 b=fPNBkimbcXHmXvBCzaphqX2Pa+9aLKMTziebN5PdU+xvV+1rRBC6jU5S7F709rtbsnfl8YMT
 4+SR8+LqrQDuHkjOQ6w6glzhw/PWjjrhr4qbgdyXWMMt5eJ/GNtUf8dZL/jI91Zo2kHBFivcgfw
 qntH9y6an0ECY3Xlw2+WVctbwpU8dmTSPs8zyccqA8qussGHcUWUQpb3kGgqkshvBbXHLHJ2qTd
 bRY3EJc+ORHmSLD4ssQ5V9i3QaISqrLxtFZ8S4slFgfpf9h0iHCOSpRcU09Q+X/R/f37UDzdGKt
 b/oSEPZvwPM2pZK+S6NgcshrooUbR2rYnkWUy4FJQa4YA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 30 Oct 2025 14:53:44 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 95FA65A0A3E;
	Thu, 30 Oct 2025 14:53:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/19] arm64: dts: imx95-tqma9596sa-mb-smarc-2: Add MicIn routing
Date: Thu, 30 Oct 2025 14:52:58 +0100
Message-ID: <20251030135306.1421154-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
 <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4cy5DV2mnCz2nGl0
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: af15caf252ad1b03706cb5988fd6514c
X-cloud-security: scantime:1.978
DKIM-Signature: a=rsa-sha256;
 bh=AnIuiwyqQKsNxaCMen44jTAA0px2zVCsntf2UHUmosQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832424; v=1;
 b=M/qwillfbRg0ieLDT3rhbNraSHhjpJJ1w5FF5iZlJFg28jODTgmYp1oniOfmvY8s/EodqVpK
 eA/SycyUJf+R/c7Th5/uSSrP99VgSCBAR2gmddsRG7Wk0NiSCFt62SgdA/FSIohymeJ6HPs37qx
 y0dG3Ttp8yd2BzzZjqBdSRERIZ/vqCoOqLkH8x3AryvcNrtwtuD2YjtMlOZo04KSgapcgIxEO0g
 ULPdolB+y87qUxv35TFfhoMOf6TVirVH6IlT5cSvIIF9rwVP2tnyI7baoRAJ/SgVOJvpOCR3LFB
 QkwQ6HhMHilEdXeW2XyetbXBbKU2PB4EItEogrCyOn3Fg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065355_129908_64A83F28 
X-CRM114-Status: GOOD (  10.34  )
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

MicIn is connected to IN3_L. Add routing including the Mic Bias.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts     | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index 8caf0c68ba9fc..d1c3d55b14469 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -144,6 +144,13 @@ sound {
 		model = "tqm-tlv320aic32";
 		audio-codec = <&tlv320aic3x04>;
 		audio-cpu = <&sai3>;
+		audio-routing =
+			"IN3_L", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"IN1_L", "Line In Jack",
+			"IN1_R", "Line In Jack",
+			"Line Out Jack", "LOL",
+			"Line Out Jack", "LOR";
 	};
 };
 
-- 
2.43.0


