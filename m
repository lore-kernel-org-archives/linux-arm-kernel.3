Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE209CEBF91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYiuMB4tO54AzIeDH3kmJFpjruAX6cuTTrgN+LVCJSA=; b=T6iaxZijxNUmvcoFVYyy+b1s/N
	CExxmh+Glcg1Xb3298a4PwlVPjt0lBAxDd1izwVGWvPFXk30x/kBTLl+OanYPifsu2tfqXAv6m8VP
	brtECD2E9BeKD+YpMAu41Q6e7na8t7309vbmW35V+x8THp8Pn+4/QgPcMBwda3lZKSc7hsvTD7AZN
	Dfe91OPFtlnbubkz79NhoZq4cNnhoU+rIy6ZNLGp0KyByzxbWrFee2Z0428Ll2Kk7ParrLc23ZvZd
	RrrDBjOUgP+02ldLlHE4hH2WHriEY6/aKgzSPZCzQsAmTB7pWzjx1+Cl7j4HePmZQGGL+k+yyuuOc
	C8DscHxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyUG-0000000G4vP-1tFh;
	Mon, 17 Nov 2025 12:37:40 +0000
Received: from mx-relay157-hz1.antispameurope.com ([94.100.133.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyU6-0000000G4mZ-0ZSk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:37:31 +0000
ARC-Authentication-Results: i=1; mx-gate157-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=yYiuMB4tO54AzIeDH3kmJFpjruAX6cuTTrgN+LVCJSA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383037;
 b=R4EuhSJmjH6/gYupupQRN/nKeGLmAadbnMq7XQIK5f2d4imGVhGMQBoEbbdfimFYeQgxeHuu
 L7eDiPkjq/RNNUhiEAXLIoH1/lasdzk0p6u2n2rDZktuc/t7sZX6j6LlLGfoWy0X71RQJK5rI0F
 rtmgbkvnNuQisIDVkY/Wm8MCtXI7vVl4URI37nnFSnoNgZtBayrlLdbtJOmG1xpIrZkZwfaxCTa
 SoHG2KY0EHdZzH4tY1cfFK+hc5v/TaJScC/kodshMcTgnf9DH0xCoe3fYMkmwJzsJ+tkXn4IMIa
 lvylGUj+Ax5wKxGvc6W0xgeH0W6VaHY8gmvxeg5q1+gFg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383037;
 b=aZRC1p924u/yIj4Ua/dBKxMhLmUMgw1OKGUpMpBzYCo8YzidyEGVRqrNGzVd6QCfGpUd49kL
 8l6508I5CUFWaUQoppEKW9GV4lly/lKtvPU+4i2OxWfiLLXxm5rOLVZBD1a5nKPq+WcQDtakgY2
 Ci0FzgAOektVK0xF/uqFqYWt07Eren8e7CiqHre8z/Y77g93g3t3QInZ9Kj4kipCMvja4L+lsGl
 LUj/vhyxFMrNTbWCiZ3B+xvm8SrbH2FYG8pp/ovKAsIuaGavOJtu0iu8GRfosHTAX8vlJonGBf0
 btoiCx80rA6+YP3U3qRT1oCGhsb/GmUTIoiTogD5HgzAg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay157-hz1.antispameurope.com;
 Mon, 17 Nov 2025 13:37:17 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 031D9CC0E95;
	Mon, 17 Nov 2025 13:37:00 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] arm64: dts: tqma8mpql-mba8mp-ras314: Add HDMI audio output support
Date: Mon, 17 Nov 2025 13:36:35 +0100
Message-ID: <20251117123643.711968-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay157-hz1.antispameurope.com with 4d96gx555tz1nrwT
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 022db60f12a529ac8f262cc02b0b2722
X-cloud-security: scantime:2.246
DKIM-Signature: a=rsa-sha256;
 bh=yYiuMB4tO54AzIeDH3kmJFpjruAX6cuTTrgN+LVCJSA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383036; v=1;
 b=erZsIWqQcLHAJ481LpMz96MlSnBzn3D+awxDQVgbydrIl7UTFX+jIwxgk5iEkHPSARQqyecr
 ADTkUV/9nCfgF/2rIGC6LixDvyknvNobwEq51X4XDJQpuN51dXA+22fbHi5n4BiRE9OcBH9/duI
 2U971jxjvo/E/lhPn1nud+Z1KeIB7yscORhyGVaYBJfuwGD3lElWLfY6VYiq1JmTees2GyLzGn/
 YNWwB/a/QQGB+DDwfgfpiZNSgz80Dutfg9xREZRSKXPhDjkArdgXhHB8yqR7gZCSm4wOjp9u8VI
 AMAN3QSgKgDIpf6fec8y/VT8bqrEY8q4LpkMbzBwuKGOg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043730_315990_1741F29B 
X-CRM114-Status: GOOD (  11.01  )
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

Add the HDMI audio soundcard and enable necessary nodes.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index 30f0e81c4be00..6e927ff1e967a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -159,6 +159,17 @@ sound {
 			"Headphone Jack", "HPL",
 			"Headphone Jack", "HPR";
 	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
 };
 
 &ecspi3 {
@@ -335,6 +346,10 @@ &gpt3 {
 	status = "disabled";
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
-- 
2.43.0


