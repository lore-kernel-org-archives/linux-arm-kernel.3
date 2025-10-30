Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEBCCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4zFQ3e3A9iazkDCS1HKUeYMC1gBPcCfcKqKlQwEs3Q=; b=f0N03b2DoOXMD0jRaU/PHsLDBy
	j14uhdBmKRyaPmw076eMe5mqJQPm5NrU6Qke3/8IofILIP70UpU2LwvFiBMGcVA+8ifqyhJYRDYGj
	HcNyQ7Othl1Aq6vvI1H59/gbze0Lu0h4CEMPrgx/1C5bJf2WV3a79jMzwQAL3LHLbVE/gsAqMJbnD
	KNG1NFb2n41+y2r33Uc+mY//r7NlOabMtnKfGD2KDPhHjSG9lYl2aUSebuUQekzbCsuEH7uvK8Pza
	GBkCjfKogjdimojBFOeCU4ZrVgv/58D7rckeAhBfVxjFXAOOEH8HONSNBvx0phwfSi26Mhk3CgaoX
	RCAKB9rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6u-000000049Ee-3oaJ;
	Thu, 30 Oct 2025 12:50:36 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6l-0000000497N-3mEv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:50:29 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=y4zFQ3e3A9iazkDCS1HKUeYMC1gBPcCfcKqKlQwEs3Q=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828616;
 b=iXQVlh6uvBgOO3tFGnSCFHmwtM8AdqTbIxwEBa8KXr9MLqC5o8U+xrQ8H315b7RgszhLL7Zw
 LcwCKyx2sLl1jXynPVXSGXETUHjD+P4tEzUSz/aOQhzpvlBicVw2iRQWav4Qx6zQbivyauJS4nB
 Pmordirj2bGQrQdx6Ab2ROh3Mmva7Aq1aFlGql/+fOW/3THznpAVXp0vuEjMBqC8IXAhcteWecu
 mTrzr3ccuLdAf0OewrV9h9Dkylwq0I9rLd3kopkOG1VvP+RxbcZTaxqPQ4YSda1jgeCd29VvT4F
 p2ee76YJqsCDv0Lste6vxrzp/ryAz6J4OPW8NfqrhrOiQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828616;
 b=InJqaoQSwH0JIHQ76VkdKlltph+BMenYZDKkUIrZ0gaDLGFwK96B8USXVdbo852zD+Ky38hF
 cbFfCUHM7ZBa/iWCgJztrWrB9uPuX8rIMj6hWPwJx7ZuJDTUksiwQMC0bqS+yv7nVWrwWuM8YRL
 xqLOfQ8QPvXebMPqmWL5/MFgOTdGXGBhiJhg+vhffaVE/TwjUP7srTE/VbMcLkorgq3VUkmGBlO
 XZpLNddf0EjW2q97gMekKaBB3we3TszeNExt6e1iC66lN/gUlWKA3Zm5LflHKC2Y5qavuMpxtni
 Fnb/leVUBOfZ5oNmk80xAbYNrennTh4fg7mAfeDB8Nn3g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Thu, 30 Oct 2025 13:50:15 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C48DD220BF3;
	Thu, 30 Oct 2025 13:49:57 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/19] arm64: dts: imx95-tqma9596sa: move USDHC2 config to SOM
Date: Thu, 30 Oct 2025 13:49:13 +0100
Message-ID: <20251030124936.1408152-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4cy3qB3ns8z4Mb38
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 441aea839c344cb72b836383b2e3b063
X-cloud-security: scantime:2.677
DKIM-Signature: a=rsa-sha256;
 bh=y4zFQ3e3A9iazkDCS1HKUeYMC1gBPcCfcKqKlQwEs3Q=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828615; v=1;
 b=GXV+woqVudO9XuHDTSoZDaRCyvsGajlEqLpQHlhtHhGz2TgtM31VIFlZnwnljgYZqNaa1el0
 /g/wCQhvhjfn/lNHq7R1VjBdaSXuNcbuxvZnX77UwkLyEHM4hSWHOrFvRmtuUIPdO/Gu7CPpogF
 EdZX4OKyHfICS8Sw6T91CSbxQV0qZwt3hEqiPlQ0z+Vutcmby345p57032e5LaOdzvKw6z0USNx
 23hTK1GosI3lLkn1fL06qaeOnsdieOtwwscbrio3cizURMhhi6av+HiEhvBKtX5+5bR9bEWLfYN
 ptwPYf0lDmvyT1pYxNaNyvgx7qNAg2gk+eOrlvDMoTE1A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_055028_086606_B528E0D6 
X-CRM114-Status: GOOD (  12.52  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The muxing and other features are mostly determined by SOM,
so add it at this level.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts    | 10 ----------
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi  | 12 ++++++++++++
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index 43ed55e57d2a3..02bbaaf298930 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -301,17 +301,7 @@ &usb2 {
 
 /* X16 */
 &usdhc2 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
-	pinctrl-0 = <&pinctrl_usdhc2>;
-	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
-	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
-	pinctrl-3 = <&pinctrl_usdhc2>;
-	vmmc-supply = <&reg_sdvmmc>;
-	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
-	no-1-8-v;
 	no-mmc;
 	no-sdio;
-	disable-wp;
-	bus-width = <4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 8da9e368c1f4d..166439e251c53 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -453,6 +453,18 @@ &usdhc1 {
 	status = "okay";
 };
 
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	vmmc-supply = <&reg_sdvmmc>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	no-1-8-v;
+	disable-wp;
+	bus-width = <4>;
+};
+
 &wdog3 {
 	status = "okay";
 };
-- 
2.43.0


