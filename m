Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC24CD5BBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 10:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0hk/9oKjZpX3yolBpPlN0u54kAbbIh38AdbzQ0+tRw=; b=a++lqOCANFlkEr+3WrJnfHj5C+
	xVHcScMMGk+9t61nOFo/xnBJPd12xo4XLXoJIVgOCRkalGmItVpwBcdGFNbEutYV8Q9x2tkqh425Y
	Vorw04X5LMgOiIUaR4XSi38/q7GPcEgd3tOCf+7Q9r7hE6AnMf4sELyC8xXX8cXOn3NSRqzWsrqHW
	fjcgQz0ow5CoClDY9CJ4vAJSjZkVRdMTNLJ5E+JzKk85/rMQKLf6LeqqLPgrr6ZLby9ccdte68fj6
	PVAVcCWO9A2YV7pLQsD6WSkJO3ABPVRSEX1eIgHel8oWVUlEpzhkiAK8qWLVLEEkgydMKum/7TOjU
	ZsC4/YDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUtW-0000000AJts-0bJs;
	Thu, 13 Nov 2025 10:49:38 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUtT-0000000AJsD-0o83
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 10:49:36 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=e0hk/9oKjZpX3yolBpPlN0u54kAbbIh38AdbzQ0+tRw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763030962;
 b=fJyKx0K4faOEIT5CcqiodpJuWHx5psSjMLw0qDRu3e2awsqePn2Q1DOmIlfJVRAG4TvppZxM
 lWH1FZwZXvCMv+/HTqDk9gZsma5EA9kS1p4cDqYSbCirZo6DPX2pSj6NqKKgwnFzcJ9DaMo3aLk
 96wxk461PVKEIME8iqHV2wWytRmuibkmY1l1m5/rigN/YJQkecOgUuopeO79XtALYVcw5ChJvNW
 004r2UWzIkV2VdNJxNtq5AxHR7BP0d7YSGDpb4NPvv/Z/2cmX7R6PvHoua7FlCaEUjlgTgpaKu7
 7wYukjKkYZlG/+0ont5if/BTEse2rZvl6/d+fm6ipA+FQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763030962;
 b=RI1EVjL9y9JbnRrpyZcvXWrMWqcYgq0dU6WuT/+bA0Gpu548rPMIxoWjc8Ve7tkh68qTbTmt
 n0HBsOXUjHpIi4w4GvZkE2dxgLBdt/B+K+PRRwqW6OkapuF5OxZG1opVkOZdSw6ZPXrR6MZYD7I
 V6JIOaLSanwgOd9/+yHZ3VlgE1n5+rWWBZT9dhFBj19TtRna/M41P+eCHrqnr6VOcVhtBM4Vmxb
 GVnnaot6T7Gh/m/vHGAUZ/xax2guXuNH0KSuQz/WsHOVdlmTXAcWMkRWWHB1YNqd/MllgasR9iU
 gUnjFdlomFY0U8u60pcz63+IslGfmvoUwrCbU/J59mJNw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Thu, 13 Nov 2025 11:49:22 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 7DEC75A0FB5;
	Thu, 13 Nov 2025 11:49:05 +0100 (CET)
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
Subject: [PATCH 2/3] arm64: dts: mba8xx: Add MicIn routing
Date: Thu, 13 Nov 2025 11:48:55 +0100
Message-ID: <20251113104859.1354420-2-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4d6cTG256Zz4MJ2w
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 38de7fd8ba10c26054d70621dd57a3ee
X-cloud-security: scantime:2.335
DKIM-Signature: a=rsa-sha256;
 bh=e0hk/9oKjZpX3yolBpPlN0u54kAbbIh38AdbzQ0+tRw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763030961; v=1;
 b=B2a8L8RrvFSXVbZxOL0b6RM89loEqFRAP6TNQoXwLfxKxecoamLirMPqeSXDkBVqZTZ0a+9s
 8u+PWI4KvSDweVsYE+rlA9UEBT9vWnXsL8J2DOf+qWD4JMn19EkSzYgipCO6IskqznAiAgdpcZf
 3LRWxctWrU1wTOWF8KopsbKaTjwxH+eQvPCmGXSjoa0nEDtdD+KTKxmMgt8M63El8bO6Vl4TzjM
 nClAzPLP8xBs/ULhJea5u2zigzmsPPFzz+gFKRemeccjKnl6RMUO7uGOQobcMcVMIU+IwwLhcAW
 WTVGtotgyqDAIDq6RwIfC4if8to5yqk06silzl4XhDl6g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_024935_372520_66A9F404 
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
 arch/arm64/boot/dts/freescale/mba8xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
index c4b5663949ade..f534dab44e8ed 100644
--- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
@@ -128,6 +128,13 @@ sound {
 		model = "tqm-tlv320aic32";
 		audio-codec = <&tlv320aic3x04>;
 		ssi-controller = <&sai1>;
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


