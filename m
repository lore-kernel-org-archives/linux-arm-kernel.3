Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9E0D3940D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsX98dYaf7fHr800aVFe36pJn1lSFXVN/+2ZuPJfZTs=; b=csdf3o2LYrg72bEGPvaGv/CrQG
	swFxcrNgwhXmtjZbu/6JdBPGOnsOmvnwoBHVDqXJV4sLRdnHOYMYIR6Y626FDFKuwBi/MLsWIqXzs
	duVG22umov2/4VXgFXqlv4z1Of34J76FhA3giOtl5OdL2nARW79icveYTJ+bcl7fvVmUNwN8l6ECb
	QokhYOAAaX1twWviwWYKjb7LAuEc8xe+RUKOXcocTRT24M9M2L98pBpyHuZS6flD0EyvNjl9JNv2L
	7yblR9XsXexxF14+zOLCAuINOG7ylzGbWFwzOqYzm2qSbrJdLwBwlTbWQX/TEDhDdRrSAn3ZjaY35
	6/b03jFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FjW-0000000HSha-0avW;
	Thu, 02 Apr 2026 10:57:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FjU-0000000HSem-3DCh
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 10:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OsX98dYaf7fHr800aVFe36pJn1lSFXVN/+2ZuPJfZTs=; b=uO1mi9ABabmz7kae++kENEWn0I
	Xgo0s9yMLw0sROlIgdKQRX3PyA8WTa1nbhclxDMt7/m81IGHu+cECTqnHa+1Op4HFzoG1oDD3HjEA
	VFKg4JqBla9JPCkd9VZH79J+MN14Dc6yhhWHsaFgYH/9+jojNY0z+x2AXGDDJBJWhDphxx9KHXnU/
	1K0tMVs1lfjvEl4hLBNNhGijeKNWX90HSu/rmfAxfQPbBNdpPHQIbWCkeUJ7A5PpdOssh0hVukWEs
	3dcAL1tmd4r1plf7Osieo6JTkJT9rqlrLTQaHNJcYQgpwYU5DA4xe1fbf9kx1nbNPfJCgbRd26AgM
	CuXpEkPw==;
Received: from cp2.siel.si ([46.19.12.180])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FjQ-0000000CADj-2IMR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OsX98dYaf7fHr800aVFe36pJn1lSFXVN/+2ZuPJfZTs=; b=gUSz6tHxzCusqmIdBmBECTwvIT
	i9ICORrQzUkw7UBZtB6RKqpgf5QyqUzIh44r++vBeTlNawSg9PBrGy1VY0WNAVotXo/SHMik6+WeB
	/OIVPfXy55kqn37cK0ewFZxt8NVCFY3pfFOY2IHSfGxetRUFlPjF8alqkEWka9+4qf0SxRdsxRPei
	jSNw9CMRk7p9itEujlbW80HDf4UY5ZzPtMj5ju5HpB2cO22lsZTxwgflmpHGKadeLLO89TQ4gqOXN
	UXAEu3xrDnVAZUlqN2w+Xc7JC9Ls6S+0giGA46vRydxu48dDGNF1D0mX3XobRb2zME7px/jZaHhZx
	APLXHN7Q==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52086 helo=florijan-nb..)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <florijan.plohl@norik.com>)
	id 1w8Fig-00000009fYO-2rpF;
	Thu, 02 Apr 2026 12:56:14 +0200
From: Florijan Plohl <florijan.plohl@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 2/5] arm64: dts: freescale: imx91-phyboard-segin: Add gpio-line-names
Date: Thu,  2 Apr 2026 12:56:10 +0200
Message-ID: <20260402105613.1303871-2-florijan.plohl@norik.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402105613.1303871-1-florijan.plohl@norik.com>
References: <20260402105613.1303871-1-florijan.plohl@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: florijan.plohl@norik.com
X-Authenticated-Sender: cp2.siel.si: florijan.plohl@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_115700_888722_FFF0B9CB 
X-CRM114-Status: UNSURE (   4.67  )
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

Add gpio-line-names for GPIOs with a defined board-level
function on the PHYTEC phyBOARD-Segin-i.MX91.

Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
---
 .../dts/freescale/imx91-phyboard-segin.dts     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
index 7b18a58024f5..8b19fc17eacd 100644
--- a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
@@ -137,6 +137,24 @@ ethphy2: ethernet-phy@2 {
 	};
 };
 
+&gpio1 {
+	gpio-line-names = "", "USER_LED", "I2C1_SCL", "I2C1_SDA";
+};
+
+&gpio3 {
+	gpio-line-names = "SD1_nCD", "", "", "", "",
+			  "", "", "SD1_nRESET";
+};
+
+&gpio4 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "CAN_EN", "", "", "",
+			  "", "", "", "RESET_PHY", "",
+			  "", "RTC_nINT", "PMIC_IRQ_B";
+};
+
 /* CAN */
 &flexcan1 {
 	pinctrl-names = "default";
-- 
2.43.0


