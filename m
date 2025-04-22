Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60E9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi64zYGWTjyBdDF33eHKHjh8/xTghzVYD8WvMJ87Ttg=; b=TgOocJ4ZU6ZfXgvOjE6iNAmMXv
	VhK+LJA5P74f4HKjjEcJ/10rJ0wiNXEndqvNSXbgGk/HBToIrCYx+7FtNHtxHo2h0h7IQCP1dBtVm
	3uzUilOxTcp31B/v0yGoF4bvjcf8gxNe0laUi6j2l1XSHH8NwOwmiNyuVfnonUfV/O5xmIacbdyr5
	o+PUphnpBgTmGUfR93gcxxH0GnxEYi9+b29B/GhmScOdrgBbGosfIZ/q5mwNseW00qWUGKj0ODj2X
	HRWexMRAk9z+6lw7dDSKr2HYlXsU8ixj/UEUBCRQlsahUIGT9X7LwngeBMKUg5Ac+d3hUmRVN7H2E
	goLs0pDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BpY-00000006woY-0e61;
	Tue, 22 Apr 2025 11:30:24 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BJI-00000006qiF-1vE5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qi64zYGWTjyBdDF33eHKHjh8/xTghzVYD8WvMJ87Ttg=; b=a9lmirbJ73ZR20+q6Yg9tsW9JI
	lk6cmAuxLGpsvLy7+YtWb2Hn/0ZE8S7lYbGIlo9M6QCwEh6g0ljf4OGD7spK/fCByzUWaGwcx6I+J
	QbOIux1tfBplCHKmk+zh3Py5wOaKHV1HxebvFC+ra5FyfacjuPbQcz2KC3RTV6ek2orfGVLEhGjM4
	b8UgCDFcXyDAO9kXesZnd1rPGIhpneIUjuS6wqb0RFZ08/wi5+w9o6Tgar871FYAG2SgV0jJpDka5
	RH7KkEwBbFmcfjVwudTfuogGWPrjFhh4GhjTs9CCEZ8QEYDYgjH0MnhLPLLChWyT/2Jz3UT6I2/MJ
	45wUYJ5g==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BJ5-008kyr-1K;
	Tue, 22 Apr 2025 12:56:51 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v4 07/15] arm64: dts: freescale: imx93-phyboard-segin: Disable SD-card write-protect
Date: Tue, 22 Apr 2025 12:56:36 +0200
Message-Id: <20250422105644.2725168-8-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422105644.2725168-1-primoz.fiser@norik.com>
References: <20250422105644.2725168-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_035704_649843_23EB7920 
X-CRM114-Status: UNSURE (   5.94  )
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

Add disable-wp flag (write-protect) to usdhc2 node (SD-card) to get rid
of the following kernel boot warning:

  host does not support reading read-only switch, assuming write-enable

Micro SD cards can't be physically write-protected like full-sized
cards anyways.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- no changes

 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 902b523fc92c..3d5cd0561362 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -48,6 +48,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_cd>;
 	bus-width = <4>;
 	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	disable-wp;
 	no-mmc;
 	no-sdio;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
-- 
2.34.1


