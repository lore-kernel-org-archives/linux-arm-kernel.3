Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E44CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOaQn4zUTWP9GdeQhCdCgUXwFC1T+DHJft+KqyFqp3A=; b=noUWrMipfTmQzM5rd5uGT1e6CG
	+TbE4Ogv/38BRQOn1dH+PXkvBO6jy1HUw/CNQO/OrGNulRPaBwitn8SjCUDRh0VcPalPAFMeezcfX
	ACIoM8PmvPj/YeV3smWUbph7MfFHJWVbNiIzS88zWKKTb4JArFu1Bj7sKGFpEnlT37fzJuQahM0z8
	FPXZOWCjospwbxFIm0aUrtWvcI0XcH31x1hp8FDyaTIldUi/85O+XHVhu0eJ/f5uHwFlVPcbsIG7n
	yzpAHrUhoqxh32AFTDhb/uNKoFnhHGzxyucJr4wIbVHJl1YO71HwhDt6sdvaUmKWba0KKkWF4Q+c0
	Jps2/9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET6E-00000004FHU-0Vvj;
	Thu, 30 Oct 2025 13:53:58 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET68-00000004FDg-0tgi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:53:53 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=kOaQn4zUTWP9GdeQhCdCgUXwFC1T+DHJft+KqyFqp3A=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832420;
 b=FSUz8MFSeFmT6VzYXWXY/JftCEpMHLtIOs+TtMld1ctM5jX9P5WdAQ3b41NjsNoFR0P75nPN
 ElptoDH0gtlIYa3KEOLcDEUW6LopLtDxB7K8L6/TjI273IEAOfYkVp7PY8IWP6dzvh08q7I9To5
 goJ2YS6NFtH8MB94GQm7IprstzuVU8osY7riWJyO6MHNW7uY9iepIjkP3ln5LB2wYYd0M0NhfZE
 HEdtlF9o/PTwiWxPIpBvu/ae+MgaM8z7KJ75ozwWmBs56HGhIRTrforuAY/hOH7owwTMFfYfVRO
 Xe1A/liE8SgpTqAGkSrZgjtAd7RcCSy8sr84mTQ28VlzA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832420;
 b=BiidDcPFwpO1j6JMlANrP0avGO+BunAH3APe2Gev1EK9PyQeUQWC7iQzNfbG2LjHIWC0Gcf6
 mff8trVclg9neMnMdPTh+aIORVHEz5e0bNPcx8gfMcfKaBOhog5r86/hOuLO2SED6KALgv4OnWI
 1xZVOlJ5poit7E0fhxjMpywbpBnkhG+v+fgt3ubwcFVZgSJMu1jf6k+yvfy5jJP6ATSy64BUR5h
 aR7mvWqBvAPCdYruVaYzF1cU3awXwMyQVc3eRDoczwK0apWdohKMEZYgJF0CAIlC+OKwJ9CdeSq
 C+OArLKOJxozTTHG1DDQvTF6hjIUy0hpjfPfIa2RnnywA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 30 Oct 2025 14:53:39 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 50BEE5A0994;
	Thu, 30 Oct 2025 14:53:15 +0100 (CET)
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
Subject: [PATCH 15/19] arm64: dts: imx95-tqma9596sa: add EEPROM pagesize
Date: Thu, 30 Oct 2025 14:52:57 +0100
Message-ID: <20251030135306.1421154-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
 <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4cy5DP37Jqz3ybG9
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 1c794a8416528de567ccb6017bd72231
X-cloud-security: scantime:2.053
DKIM-Signature: a=rsa-sha256;
 bh=kOaQn4zUTWP9GdeQhCdCgUXwFC1T+DHJft+KqyFqp3A=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832419; v=1;
 b=FQxf0dkARuwxeTOBVJVmw5vVn6+x39o/jT998nJsaCdQIO6XadqRWRYDZpf1WW2LmWzzdNXd
 /uldGBu1JWMTbNZGCue84SG4/4pSoDcy+U4P8qq9CNl2QjCvhe/AreAzTJVGshSPDpG/f0rdl3N
 H/qukDfuxpomxf+NKZlkRgoa8uuDSxc+ND5Xz7vxEcVajYoMKIL3LrPJihs6oAC6h2UeWpzm+hz
 NQZCeML3XjKFkdkvOddF74oDr/Qq8MWlQrJtDk2YOlyHXInkuK7ayI6HRYG/mnjkqWZ4dv0lNDq
 Nb+OKbSrLT3COKEXooVQh0nfpHp4F5VY+10fh5iDKokjA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065352_394357_33A1E3B3 
X-CRM114-Status: GOOD (  11.51  )
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

The special ID device of the EEPROMS needs pagesize, too.
Otherwise only slow byte write is possible.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index a4c6083ab43b1..43418844701b1 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -203,6 +203,7 @@ m24c64: eeprom@54 {
 	eeprom@58 {
 		compatible = "atmel,24c64d-wl";
 		reg = <0x58>;
+		pagesize = <32>;
 		vcc-supply = <&reg_1v8>;
 	};
 
@@ -210,6 +211,7 @@ eeprom@58 {
 	eeprom@5c {
 		compatible = "atmel,24c64d-wl";
 		reg = <0x5c>;
+		pagesize = <32>;
 		vcc-supply = <&reg_1v8>;
 	};
 
-- 
2.43.0


