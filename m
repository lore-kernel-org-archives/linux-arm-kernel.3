Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40D3105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Of0tCyi4GhX/abWwE5gSOLlU0u1QeOv0uyKh7x2z7GA=; b=j8YWedViLZ/2o6y/8ZoW9ZZlPs
	nI1mqGmhKp11WmAU0UP5OIL3OTASRqbbFs7jjPVAV2GnAg2vIR84jUVk7S0gjiZs3SmiDmdGMNDhA
	H9QMkaYrv/n2En7UdDF+sw1imLJPszBM85KwN6PcyPtxpkZ+ocK9uT30mbi+ngl54CZATVN7Xbz9+
	EQmF7g27M3356epQPQ9CWvwJ59m2zpXOh0OP/71Y2wKTurtIpohZJ2kfc94fEB6DTwYtXESSxJ4mZ
	1vRQvX+O+Z3DC3FhiNvlqimf9IVSogUuQgbmAJAFeayRUp1kc/MXstKQrWS+5utPaMUQAPONW/Rui
	coNGWlGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13GM-00000000LSM-0U0k;
	Fri, 13 Mar 2026 14:13:14 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13GJ-00000000LRh-32D5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=Of0tCyi4GhX/abWwE5gSOLlU0u1QeOv0uyKh7x2z7GA=; b=N5oZlpC4c7lz2oq5wDywJ8W9WT
	kGe3L6+PURFHNg8xB38IVfVktpybqfpW5jtwFt7qrClJcSTcJqwxtO3KyYLq1wsTkFgccczZAAbw7
	ZbDv4C+yiICq+kx0EbL2DfBnqoxbKdtKV6O0oPaULb3WDA0aWBtQjFH8akfvw7QQBC0uTxNOIfF4a
	QnUnkLKsH+iPWvm9j8lrOVKkU2R8ZGGWeXwQWe9xqk6dIQFtdJltoY6sZsabc90fNgFxBDi9rFGm7
	ERIMtNalekbHNvCQcZ6J0LKkdKliJnVUd/lBjG+gdsN/cbhg1ut6t/7QRbX2wDv9NWj1dbV5sstUP
	/JqcPCwQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w13GG-000AdF-2Q;
	Fri, 13 Mar 2026 15:13:08 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w13GG-0005rF-1g;
	Fri, 13 Mar 2026 15:13:08 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: imx95: Move funnel outside from soc
Date: Fri, 13 Mar 2026 15:13:04 +0100
Message-ID: <20260313141305.1844209-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27939/Fri Mar 13 07:24:42 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_071311_870854_B9CE7A95 
X-CRM114-Status: GOOD (  12.15  )
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

The 'funnel' node does not contain a register range, so it should
be placed outside of the soc node to fix schema warnings from
simple-bus.yaml.
Change is similar to commit 9cfe3c892b761 ("arm64: dts: imx8mp: Move
funnel outside from soc")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 92 ++++++++++++------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 5f61866e9df9e..e5f0053b5e168 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -391,6 +391,52 @@ scmi_misc: protocol@84 {
 		};
 	};
 
+	funnel0: funnel {
+		/*
+		 * non-configurable funnel don't show up on the AMBA
+		 * bus.  As such no need to add "arm,primecell".
+		 */
+		compatible = "arm,coresight-static-funnel";
+		status = "disabled";
+
+		in-ports {
+			port {
+				ca_funnel_in_port0: endpoint {
+					remote-endpoint = <&etm0_out_port>;
+				};
+			};
+		};
+
+		out-ports {
+			port {
+				ca_funnel_out_port0: endpoint {
+					remote-endpoint = <&hugo_funnel_in_port0>;
+				};
+			};
+		};
+	};
+
+	funnel1: funnel-sys {
+		compatible = "arm,coresight-static-funnel";
+		status = "disabled";
+
+		in-ports {
+			port {
+				hugo_funnel_in_port0: endpoint {
+					remote-endpoint = <&ca_funnel_out_port0>;
+				};
+			};
+		};
+
+		out-ports {
+			port {
+				hugo_funnel_out_port0: endpoint {
+					remote-endpoint = <&etf_in_port>;
+				};
+			};
+		};
+	};
+
 	mqs1: mqs-1 {
 		compatible = "fsl,imx95-aonmix-mqs";
 		status = "disabled";
@@ -537,52 +583,6 @@ etm0_out_port: endpoint {
 			};
 		};
 
-		funnel0: funnel {
-			/*
-			 * non-configurable funnel don't show up on the AMBA
-			 * bus.  As such no need to add "arm,primecell".
-			 */
-			compatible = "arm,coresight-static-funnel";
-			status = "disabled";
-
-			in-ports {
-				port {
-					ca_funnel_in_port0: endpoint {
-						remote-endpoint = <&etm0_out_port>;
-					};
-				};
-			};
-
-			out-ports {
-				port {
-					ca_funnel_out_port0: endpoint {
-						remote-endpoint = <&hugo_funnel_in_port0>;
-					};
-				};
-			};
-		};
-
-		funnel1: funnel-sys {
-			compatible = "arm,coresight-static-funnel";
-			status = "disabled";
-
-			in-ports {
-				port {
-					hugo_funnel_in_port0: endpoint {
-						remote-endpoint = <&ca_funnel_out_port0>;
-					};
-				};
-			};
-
-			out-ports {
-				port {
-					hugo_funnel_out_port0: endpoint {
-						remote-endpoint = <&etf_in_port>;
-					};
-				};
-			};
-		};
-
 		etf: etf@41030000 {
 			compatible = "arm,coresight-tmc", "arm,primecell";
 			reg = <0x0 0x41030000 0x0 0x1000>;
-- 
2.43.0


