Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4044ECD5BC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwZpnlL5PSUjD1ekyFYHL+mEFm8pXGu4Iwrph47h1b8=; b=VFHrJZnMBcJEFlkXNTeEnI9wZE
	ISmToxp15Cjd+gLqglbRZYHfPksO+Qik2cQgxMoYofAjMrD2E/lvIXdcHf7kJbQWJDyXmsFI3677A
	HfUGIDboV69U6psEll4MBz3tbz8n+Oek6mf45kahbIUJl7MWqvQprvN45iXBHH4dkPZdNLL+LoV8H
	rp9JsJHiu+0Ed5HwSakFv0Px+F3E5f5Da9c0yzlPHZef8MnxNbSPigFw3353MM0CVC6HXOzDcYDnO
	gY+vbn3srarYkz38MhQfH7HCcLlcxusFN1PBOIFh3oXm5r68BthMp7bOxTEs+GpkBQs7F1COBOCWa
	wW2poFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUtS-0000000AJse-3UJP;
	Thu, 13 Nov 2025 10:49:34 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUtQ-0000000AJrJ-0H2p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 10:49:33 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=HwZpnlL5PSUjD1ekyFYHL+mEFm8pXGu4Iwrph47h1b8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763030961;
 b=hJkETt9rFjy5wf3h2p2o7AW5PIM4D3os+AHQJrl9TRS5xhiK2JMwTuI/JVnJmw2JO5oqZy9D
 quPtSdrVCrJhy9DLeHUNajK/taLIbjDLpIsw2IySQIM4hZEqVtuJlq4EwP5DCX4DHFFzFIdUBEz
 2JaSG6g1ZqCepoXjELv5rh6aH36L7ObkPBQvoztH1I0y1JQ8wKgir+9YzTP6GvdW5ps4xhXUq+G
 gfuA9EBUMFLUCog8gHb7HBQtL99eit71U2AdOEbgmRXL4FiP643T5FOC+KwNLfguBE2q9cJAK6H
 XPqjPYqiftIsHgSjSYJ9qGS6ZG+eVTy0GDPtt+ustJfKg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763030961;
 b=ifFpTRGsXib3B09eti1mVpMaZ5c/HF8jewXTdvsRxxHkOEC1B1sUxfsUGZR3/w2lSV25L9vj
 KWF/h7J2/ng+VZI/gIadktlB+P2x0qoEimzdrEiXFm1lrc1XOTGSewnr5flH5INpxzZPuJ8d7si
 TTz6VOzHZ8TR0GWASGo4Y/SWYHuagXC+dtis9BDzj/eTssZ3kaOcRmUF/xCDB/qSqUTDflUZvdv
 3oLZaLnVg1ZSzRY+8R6fWhx5Efm7n4GuBD6rJRNEYVnN48TTCW9Siqw0+Zhzn3uUA9oaPD+nOA9
 WQ8nLCrScdLZ9U0UNaPou2R8KWnpPfGQ+1ajDzpjLWbtw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Thu, 13 Nov 2025 11:49:21 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C3B245A063D;
	Thu, 13 Nov 2025 11:49:06 +0100 (CET)
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
Subject: [PATCH 3/3] arm64: dts: mb-smarc-2: Add MicIn routing
Date: Thu, 13 Nov 2025 11:48:56 +0100
Message-ID: <20251113104859.1354420-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113104859.1354420-1-alexander.stein@ew.tq-group.com>
References: <20251113104859.1354420-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4d6cTH3cvgz1kPGJ0
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: ed014fac5779153bf3b07ca053158c71
X-cloud-security: scantime:1.897
DKIM-Signature: a=rsa-sha256;
 bh=HwZpnlL5PSUjD1ekyFYHL+mEFm8pXGu4Iwrph47h1b8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763030961; v=1;
 b=n7qaxs0KSZb0FxoiFscOxBwa2puDnMcXJeyTEk/Ewvkv7y7kCb1fhvZcSYJbTojaSGweMijQ
 TFav8+lONyK2lICFiCRITQ9TtuvNkOBvLWjHisQP5LHSjasXT8s3q58h5hJ9JHUfKEkIOgiJAhh
 CeKbVzLzOtMb4jlWJj31b3DB82l95mlmlq4PJ/Q4/eNH5VRBh9mxWvDEHtW+rvmG3A6rYInnQaZ
 tFgDWl3PjNc/qPecriBu7E/4PEtPMzS5ltm4mYxjpy/3iK4sy+W365X/Za8daj0Jolhpob9mDHY
 swSbSc30spiONSeXb1Oi3R3/QPTTcW4ceplPKk7e5TA+w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_024932_240427_159464A2 
X-CRM114-Status: UNSURE (   9.79  )
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

MicIn is connected to IN3_L. Add routing including the Mic Bias.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
index 478cc8ede05ef..3d20e3bf32ce7 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
@@ -98,6 +98,13 @@ sound {
 		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai1>;
 		audio-codec = <&tlv320aic3x04>;
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


