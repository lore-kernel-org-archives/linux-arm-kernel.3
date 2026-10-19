Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A92CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSzfousVUyR0QcxC05/FwldAp2bLkZ7kOB6zUGTvFmE=; b=Qn3AR4gFnfqINH7Hdo3pNCDW3b
	rejRff2ZPQ+cVNnc+oUby+/Rr5odDldB1hygGG1IFZlCdvxVtY+SzxzTXbNRbylrrWRbED06HKl1m
	GjyuQnKHa3Tss7dKh2rSB+wqB2ck/cEKWKp0ePf4NqQZhmuTL9/tBvbYVf/pq80JMdmS2GYOUbspX
	MT0TxaFfOf+WDBO3ivzesb+xuezCbc+rJRy5NqO41LVLyORxg+PKolX0cPlYxWP45qOrHU1O3UtGW
	tV+XzeNBc0N4ZRJGE97MPu84vlqjb3NrybKiaqyye4aSql2GLDzOMJvUx7So4NYqg7MO6q4dnMlsu
	D2mEvpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiOI-00000006pDl-2VVp;
	Mon, 19 Oct 2026 08:06:42 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiOB-00000006p9x-2jZq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lSzfousVUyR0QcxC05/FwldAp2bLkZ7kOB6zUGTvFmE=; b=EJa6c1A/Am/RiNjVExlN4xXIYI
	yWKb4vObp0EUVZLtKrNhqxgSIIjGClPk4szi2kQBmy2Ai127/uh1LJOwPCOuc30ZfdrPRUqzdFRRd
	4NjEREbjNSaWs+vei2Yh7mKyK2QlRVbeP8U1t+MHl4sNr0dl+BTFk0lEsz15W6UZKaBrAZQsQaqoa
	bu+D2sscT5q9z+KeBgT5C600I5Q6LUFz/TBfGiPbtaijztCsb5HL6trcnpGIFHkoHhjY5CpTV822L
	kKV6MCwCBxKoM1CkZ3dHupnA2gIpIqxwlSU7AkUgTR+4PeqM+PTqF2wvox+Bfe5Kw3USyFwj5zHfa
	kkWgUgww==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xIiO1-000DG8-2S;
	Mon, 19 Oct 2026 10:06:25 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xIiO1-00046E-13;
	Mon, 19 Oct 2026 10:06:25 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v3 1/5] dt-bindings: firmware: fsl,scu: Add imx8qxp-pixel-link nodes
Date: Mon, 19 Oct 2026 10:06:16 +0200
Message-ID: <20261019080621.194103-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019080621.194103-1-alexander.stein@ew.tq-group.com>
References: <20261019080621.194103-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28158/Mon Oct 19 08:26:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_010635_706361_319518D4 
X-CRM114-Status: UNSURE (   8.27  )
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

System Controller Firmware(SCU) provides access to Display Pixel Link, so
add the display controller links.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Use patternProperties instead of 4 discrete child nodes

 Documentation/devicetree/bindings/firmware/fsl,scu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
index 307f1c6278532..a00295ba965f6 100644
--- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
+++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
@@ -155,6 +155,12 @@ properties:
       Watchdog controller provided by the SCU
     $ref: /schemas/watchdog/fsl,scu-wdt.yaml
 
+patternProperties:
+  "^dc[0-1]-pixel-link[0-1]$":
+    description:
+      Display pixel link in display controller subsystem controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
 required:
   - compatible
   - mbox-names
-- 
2.55.0


