Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5CDD3B7F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDrALBEIHaOrNybjMAxZ0pEv7yfnFcCvcby1oq43AiU=; b=ZZMlsTwyGLyTA4yBTo03tv0JKs
	KJPqcMX64wDxUoTMp9SY0eMlRpalXFudIROUcsqtO+WG32v6KA+vPCs6CnSaXjr8XUrdmGbvnw5r2
	PMJSSk6LEXBmJabMX6rMNT+eo3TJxp5FaSx4W6y7nLLsR+SpVL0gFTWRcfBkkuCsAduRphW/GKZ98
	0nrTTGB3kq0jCF9VAHs4eywV3dRuuPyiCMfczil4kbGF8JVhnUKL09MI0IeoZafNCAAdmUWwzIIji
	HbKgepqQcaWNRarBDUM1z5lEpdJz8yO4STqsXDXJislw1LHPmtGaHpQ64u2+YB++4qlEPd9PqEI3G
	cwfYIo6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVTA-00000007Zo4-0HX0;
	Mon, 25 Nov 2024 09:33:24 +0000
Received: from mo-csw1121.securemx.jp ([210.130.202.132] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVNe-00000007Ym7-04sb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:27:43 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=
	1732526841;x=1733736441;bh=PCq/pu+QO5n9bATAUWThnGACe2nepbUSJDlQFbrVrx8=;b=ssK
	rD2dA6ydWDQ6pOMt2C5SL8sXLaAYRAfqPxs6mSdZYsTxCkOhnxEqJ5+gXjHoqI/vi81FEUxoFDrxS
	Qt3jLqg0153A6aZQq6KoE/jltceTLvhDyrw2K3d+zUMn31MZMdyCXez0RjnSNgOO4GJLcJuh4WddV
	AXGqimEQITHWVsUwf6hzcNHSxlQ0lVcw67zkNN5Juz2h4tqj0Z/atXbLe9KYGE127KhmlKTFQEd37
	yy5UBWaNAcpN1I2YuxfAN6UsIG1+WybisEaHoOLtszQ0hKd9r1J1lh/6hpNvErmBclKErBTR0AnkH
	5iaYi0t1Ql7JK04F6OYVQQ+U2Wd2anQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 4AP9RJmm099468; Mon, 25 Nov 2024 18:27:19 +0900
X-Iguazu-Qid: 2rWguDC9mIphlABSrL
X-Iguazu-QSIG: v=2; s=0; t=1732526839; q=2rWguDC9mIphlABSrL; m=k1DP3cEVolB9mfsCCNGe71tsvk/AiYIrIbXeZwTU+I0=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1121) id 4AP9RHIp297761
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 18:27:17 +0900
X-SA-MID: 35004190
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v12 8/8] MAINTAINERS: Add entries for Toshiba Visconti Video Input Interface
Date: Mon, 25 Nov 2024 18:21:46 +0900
X-TSB-HOP2: ON
Message-Id: <20241125092146.1561901-9-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_012742_292992_4ABB8095 
X-CRM114-Status: UNSURE (   8.80  )
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

Added entries for visconti Video Input Interface driver, including;
* device tree bindings
* source files
* documentation files

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
Changelog v2:
- no change

Changelog v3:
- added entry for driver API documentation

Changelog v4:
- added entry for header file

Changelog v5:
- no change

Changelog v6:
- update path to VIIF driver source files

Changelog v7:
- no change

Changelog v8:
- rename bindings description file

Changelog v9:
- no change

Changelog v10:
- add a separate entry of VIIF driver

Changelog v11:
- no change

Changelog v12:
- add a bindings description of CSI2RX driver

 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b878ddc99f94..b5c819e94e9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23430,6 +23430,18 @@ F:	Documentation/devicetree/bindings/media/i2c/tc358743.txt
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA VISCONTI VIIF DRIVER
+M:	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+M:	Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/media/visconti-viif.*
+F:	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
+F:	Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
+F:	Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
+F:	drivers/media/platform/toshiba/visconti/
+F:	include/uapi/linux/visconti_viif.h
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.25.1



