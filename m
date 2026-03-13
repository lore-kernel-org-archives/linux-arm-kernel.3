Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6AD106FD91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fskU8s/y4CPwfkh2I0PNDuKk5UsSC1k3XQLvILrKupE=; b=IvtAzlfAp9s/t/nu2rPFREW9Di
	MB1rib8GO57w52Q7/oQNCChuTsdm20mfyXjRKi7swz22Umvi8w3vba/xXeY6XcmvjW7DLGv7sX3jp
	zhUbTblAXml51OYJayyFrTPHQ8X8/gHA3ch1imiJP2DtgE4Lc+/PDU1eWya459f8dOUKkpXoxm09d
	wfK7Mtyrz3hF4p0kfrENqQj/H/9EwZEs4jDJzKVrj7macn2U6w46aXIAM5mZ8kWOo7hdxrpljCh8u
	AtKDusxPE/yk9yGrN2oGqstA5rCF57+1eur1/p53huP0S2PmjBZOYi19VJazmEwqZ9foiiaYJx1eR
	xWiUb6dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wfS-0000000GzHa-1BuA;
	Fri, 13 Mar 2026 07:10:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wfM-0000000GzD8-0bd6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 07:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fskU8s/y4CPwfkh2I0PNDuKk5UsSC1k3XQLvILrKupE=; b=dMUljj6NSUxq5PbD7JX1c07EZl
	DKcPGs9ZQyCRze1RT132oYLui1v147BwSiXkrdnzVgxw3FUagSYpmYi7lv+kOv/pr6ij0pMRnGvPz
	imDZpZGcJCL2IeQzqV8OoPefDxiCy9v9S4FuBo6f5Li4gWQOn+r/54cdWjyp+Ek3tuJucIp5AxuaN
	DHvo9g112ljSVrDCj84uF1ZnPkx9QBXmY6keOxNPrfKKLTAWcoG2Mawr4+6gNOhM9A/Aqd6IA9QJB
	AOnV8IllfAZaHC6XC2nbIvuMJRVVlmRJh8uGHreL4qSctCnHL9j4h3a0DAvqUtRtuAcPVijMXtjNy
	Y8p/jfiA==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wfI-00000002jDH-2mQs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fskU8s/y4CPwfkh2I0PNDuKk5UsSC1k3XQLvILrKupE=; b=lfV24ZWA3fGDw+KHJh5ch3fQfm
	ViWFmz71WF2/i77RB8OwD3pLGhpv/2Eef/et9BUJ6HvvE+FB/vX1vYQ4Vx58XH3BCSn9boErjuXC8
	7X1OoUmWEDJA3Dn4rnphkmVsxGd1Z/rCIWqJZXtaCLmNKvjyXy0FbbpheQ6T7o8t4YO+3PIAgDrBr
	Ef9afSVK84jbVCB0ktaG4qKdfnzxc1ikfHMSvGs7RvhMw62CPfQDlpdghzEu9teC7kh9G9WGKLltO
	cav3CxYrAOxrHZNkT1XnVa6tvtNfD/f5cWYSCNJBNg7b4Hk1aqCPUYwyNry5SrtWPK9qCqbY73U+e
	Mt+wxtHw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wfH-000D17-03;
	Fri, 13 Mar 2026 08:10:31 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wfG-000Eou-1V;
	Fri, 13 Mar 2026 08:10:30 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: imx8mm-tqma8mqml-mba8mx: LVDS overlay: Reduce DSI burst clock to 600Mhz
Date: Fri, 13 Mar 2026 08:10:24 +0100
Message-ID: <20260313071027.587992-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313071027.587992-1-alexander.stein@ew.tq-group.com>
References: <20260313071027.587992-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_071033_327797_74783546 
X-CRM114-Status: GOOD (  10.44  )
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

The DSI burst clock frequency is too high resulting in flickering. Reduce
the frequency.
While at it, remove the burst clock from board configuration as it is
display specific.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Improve commit message and fix typo

 .../freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso    | 3 ++-
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts      | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
index e5425653ea7ed..046399a455ba1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
@@ -32,7 +32,8 @@ &lcdif {
 };
 
 &mipi_dsi {
-       status = "okay";
+	samsung,burst-clock-frequency = <600000000>;
+	status = "okay";
 };
 
 &panel {
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
index 8dcc5cbcb8f66..8490b7b04e9bb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
@@ -76,7 +76,6 @@ expander2: gpio@27 {
 };
 
 &mipi_dsi {
-	samsung,burst-clock-frequency = <891000000>;
 	samsung,esc-clock-frequency = <20000000>;
 };
 
-- 
2.43.0


