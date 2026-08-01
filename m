Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2F2C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IYU4p83/F7Wb0HbkIUcvVF1Yepq2STjSMJSwB3bRmCY=; b=15jsPN9nn+ib9XLy0lUQXn45y3
	H4dx6nv4WKQhZa1/fU8GCDBDnDAgQMfUFkR9h3MmjLFq+Th9l9GkdTcyLxdytDjdTu93DIiaZi+LY
	j3dvMpKNtglG4YhdgDyP7SW1t3xdw7zj9RuKCYdFU+nCVgnBW0c8A6IfLhcbhgoDPClldVKTdcyGy
	yFIES0pwKC7gW+0pDEGNIAEXTwfAPNejE/2zzBtuqSliPdoBIZcKhJbsOSkpgcive/lWkecqsgWWD
	DIgxXUbNk3yoVP1S65ienK6q5sCwE6PpuiUcn5sfzFVYmKzA+sOKF3zoBBty/DgYdIamYgIULCcux
	TZ/F0EEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGsS-0000000F4nr-0IMu;
	Sat, 01 Aug 2026 21:04:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGsP-0000000F4n5-3skk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:04:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxO5V3907945
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 21:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IYU4p83/F7Wb0HbkIUcvVF1Yepq2STjSMJS
	wB3bRmCY=; b=DRIkFRmRcQJXkUiHWaABqfEJuimGa4JqcJN/70kLPP9HZX9mxgo
	2MUpjKdfMRPPVQC3BxwRNyqOE2gsm3OnEsTiIFhUvJdQKt3Z2ssH9+fZUbKmEKgT
	O2kTglFwVlj8QJrLhYNOEkTcoyZgPnpSEHKV+tzrLH6X31VUupG4U6o6OuaNhMO7
	1sz1hc1pDuhBvJyUrpsKyjvv7SGxaaKGvbVK4UalqbuZH/hRXVs2n2emcprswy6X
	27H6t5ukYofiRsT0Yn7xL20TkfgwMTBImfGg5GuHOKX61TlCC/J1PGiI6l9Z4XZC
	/1GyHPfi9GlgMbMUq1W/C0zSratP0AhTgrQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9119n8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 21:04:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ac0a54110so229362585a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618252; x=1786223052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYU4p83/F7Wb0HbkIUcvVF1Yepq2STjSMJSwB3bRmCY=;
        b=fs87VzO5qeDNsefWpn7yhGRQ4GB2YHl47Qbd6snxMhaYRUpnF0WsSLNDLKIZUwzYx5
         T1g+R7MSV2dCU+lnwS6TCwU1O3WqiiIbX8xfveLzNHWkPJjTizgXJUDO3C3NUuWhhadD
         eDBbE2Q5gpNw0Y44AmgVWbJOPrChwUbpDH8qUB7QTnlkBot2KAiUeCT7nxrj8CAa55IE
         WOFixaWpm+UEoUI/ipxda2OSoLTiJnlHy/bbJHGr6demsoj5ZoRYRg4S8Fl7XPVp3TS5
         trWiltDlZjkZUkLsv/DCK1Nq07LgQCMhpQQbq0FogRK4n1Lsjnf6zBB1GaYlq0OPplCo
         jNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618252; x=1786223052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYU4p83/F7Wb0HbkIUcvVF1Yepq2STjSMJSwB3bRmCY=;
        b=YYrtTQxoON0wQETGnon8t8qrO5/rxlGP1NHY3ErzIbyND5A3qs05g8i1vhaAP3RDox
         SzEmxN93S2QMgXDdOd7ZPQh6Dkvm8yriZQ/PbwwVHOLtlFCTizm0hU9p6OIZDKjz3w+s
         jEGEdmrVvQ87jZC+bJXokc7N+Ka1iz1fprZ8ow0rE8CWPFdmrwTync4MKI8CMu/+KKa8
         pofrZeVHMJwXyWHtKybLQVWvAR8o8CNGsat0Xd+XYMJJb88cwpi+k2h3xJMvx7CSrNNo
         DUd3Su4p0v84nKdH64fDdclTBWpZCk0Pnb+WbYSRTjC2y+TcxcPWAcylTZIa1lAjfHIw
         tM4w==
X-Forwarded-Encrypted: i=1; AHgh+RpAbKAa179We1iKgQTQVXcfs9uoKgW4wv9sSccJ90mJr6khRp9akFs2v2nRh9epVYTG+BABqa6xg2h6CfhqYVJ8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1RcIIWUgZr2ro0e+bJGaGmt/P0UPT1GTAH5whhPg6MZH+Bket
	ECYDlZ97iaPcPZrky5gTg0dPCrInKSoD24pzW5giu+5PsBJUSWHBaQbXxot8msiVfMEdy1H+L1T
	3+yLAoyf35ltuW5aYNE3NYAhZ5A1sZkBqX6JzfHUUL5EZ5SaehyTFUk90M/WNlu/xOxrgfNWXuK
	ZkYw==
X-Gm-Gg: AR+sD129VUhmHRZf2XU+/qzwh/BpbHlPRQJjS5aP+tZRHjod+N7nAFtkAdXe2mdg14t
	E3vnKDJYtPx+G1nJSUSlB143uv1SDOljTI9Ds4tU68h1KUz/7xJwJ9suWYHjpIH5C6FcMQQgRAL
	49lYv3oufV0ny9IPEOSY6W8OObiL6FRN+muXrjDfh0UE2HJJXx3WQc3Sh8T0/UjZG7Nir0jN1Ba
	0CyXY97rVHkRretqswzYpfALniM5RY7+++eYsI+fgtPx35IhYBqgCkcDSP45EWdZm3YM138ktvN
	zAXwuL6v492N2u+G83ARKnZMadEpAC62FgCbmzVmnYn9MuFHxinJL/jWF+VlMe+6iCnHYVJurxf
	Z4mhq1TnpDydRr4Af
X-Received: by 2002:ac8:690e:0:b0:51b:fc67:c73c with SMTP id d75a77b69052e-52b566dbe08mr113251961cf.16.1785618252404;
        Sat, 01 Aug 2026 14:04:12 -0700 (PDT)
X-Received: by 2002:ac8:690e:0:b0:51b:fc67:c73c with SMTP id d75a77b69052e-52b566dbe08mr113251141cf.16.1785618251686;
        Sat, 01 Aug 2026 14:04:11 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm133984275e9.13.2026.08.01.14.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:04:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: ti: Correct white-space style
Date: Sat,  1 Aug 2026 23:04:05 +0200
Message-ID: <20260801210404.383925-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4951; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=vR24UIDfo/Bw6iKO4QYnVk6wQDa1uoWMTvq5cvEfc1o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl9EpFsSCxraD0XV9IpYfa+i9uaLlrTz1EQmc
 cSZVgXywFmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fRAAKCRDBN2bmhouD
 1wekD/wNtdAS+3WmBikDsQTLvfFniofxw6ZmTCNmSBEuW52fXMYJlNeoUbUxqHi0932yFjP6ZFW
 o0WOyHfKoC1tQwk+eGRghCw0LDyyPmbPQivfaODH+39zFLmb4E3hVb+yQZAYS+vGnnrxM7zeA2V
 oDR2oO4LFWTGKDeRZQGtpwTIe3vrHuxoJIco9dy8LUrzFWE6IBvomANMTtDfGig2pX9OVkwI5pZ
 5TWRpS2e8SQjyCzSJAAo2JR0OYOOdjQ30eSwe3cYRa1FrEMuzxQ7HRv3cMOWehUbzrDPOouMocN
 svjqpSPLGFO5ltG7lRRGAT4VV+AdIlep6UwzOXTDwGezyiorGXuh1xAEvfSsvgB13CNPoolVex4
 mHm/ZqB+R5QtY0fxKXZxs55heFIiOU5SLfK30ChRlCgB0FQ51DmB9dwjPuphPUuaJffJHOaxYCb
 dIwSISFL0qc0uwE1y2hQclvVU5i2Xjr8NST3QQmWMe4qdLduQZVi4uqMKrAgt8ZZ2uppbF2ZQBb
 gK7JlPKGCnJjuYu06vHGAigeEMbnVeT9j3+sjzAmncQXHLOpqR3l8v1+51SvgF8e2FDuuFtwsK+
 iX6C5B/RBFYc3CWT5fqRjZtuMKo6qMfv+6QC88pjjUWiIfulhU+hRvQ0ZLw/xYkN5d7jGi5IPyo /C8/iuegvNP+kdQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX2f6uIuOub8Fx
 bu+5xSaGtCD63a0pdxyGTxypoIKgMYGzT6S4fwJ1Ds94DrqA6j4ajQzvfcvVHoYAWpU0U4OQpbW
 JeDOg2bL6CBqqH6T61LErC5dU/45abE=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6e5f4d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Hx2NUBF34izpMPi2HQAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: UJnlTayvi6mKB0LUSmvxEVxmcZFqUiDc
X-Proofpoint-ORIG-GUID: UJnlTayvi6mKB0LUSmvxEVxmcZFqUiDc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXwZo4KH8jyuzk
 heq5WJBENW/GTjJwX3PkD/zgiTGyxXS/YGfa9J5wVOq2bTUltQw2Ez9iYxnRXnsgCePU2OOpwS5
 VkUt56IFMOScN4BVDH3GOQeR64oQZwfdDnCTC9C5QHS9dPgSyiQlQFPgcPZ0WOJRoj4lrQsJOnE
 IXCBKGdxrYE5ZsDm2/1/B3raWpfY7lWbBbNdCmQdhSCfd4Nh6/Nf7jib4y8yFD8ghTPCok1INXs
 T0bpOEAuBt2Yx9FbJxjnDCwVH0u60njIdtddvqPNTdxyqyBaRkSyzPMCBkzwN/P0Vl0104pNvGH
 pxCg2MkRiuDFVANbNEYJqol9oufN7mMOvWFWaKNDGANpsXtHU19/n9zXdKaiik+0+1+cG0B6+sF
 ++DVG5PxjiwM0nLsqbq7GLFeICeaJlsyhyODvqyFNdbmGfTylKnZDIQjWWN9fdxYvj3cWyJklpg
 /KzE9P8vneY9zLr3qSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140413_975250_4B4B3173 
X-CRM114-Status: GOOD (  15.41  )
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

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi             | 2 +-
 arch/arm/boot/dts/ti/keystone/keystone.dtsi                 | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblack-hdmi.dtsi        | 2 +-
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi                    | 2 +-
 .../arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi | 6 +++---
 arch/arm/boot/dts/ti/omap/omap4.dtsi                        | 2 +-
 arch/arm/boot/dts/ti/omap/omap5.dtsi                        | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..d91a23bbf6bf 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -51,7 +51,7 @@ uart2: serial@2348400 {
 			interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		uart3:	serial@2348800 {
+		uart3: serial@2348800 {
 			compatible = "ti,da830-uart", "ns16550a";
 			current-speed = <115200>;
 			reg-shift = <2>;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone.dtsi b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
index ff16428860a9..22c8b8b04340 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
@@ -123,7 +123,7 @@ uart0: serial@2530c00 {
 			interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		uart1:	serial@2531000 {
+		uart1:serial@2531000 {
 			compatible = "ti,da830-uart", "ns16550a";
 			current-speed = <115200>;
 			reg-shift = <2>;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack-hdmi.dtsi b/arch/arm/boot/dts/ti/omap/am335x-boneblack-hdmi.dtsi
index 109f08fd174d..c52bc3324dea 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblack-hdmi.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack-hdmi.dtsi
@@ -99,7 +99,7 @@ hdmi_0: endpoint {
 	};
 };
 
-&mcasp0	{
+&mcasp0 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcasp0_pins>;
diff --git a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
index 30fcce33f4b7..9745e0d420ff 100644
--- a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
@@ -902,7 +902,7 @@ timer2_target: target-module@40000 {	/* 0x48040000, ap 18 1e.0 */
 			#size-cells = <1>;
 			ranges = <0x0 0x40000 0x1000>;
 
-			timer2: timer@0  {
+			timer2: timer@0 {
 				compatible = "ti,am4372-timer","ti,am335x-timer";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
index 06651072f000..07c76a80cfff 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
@@ -16,7 +16,7 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
-		continuous_splash: framebuffer@bef00000{
+		continuous_splash: framebuffer@bef00000 {
 			reg = <0xbef00000 (1024 * 600 * 4)>;
 			no-map;
 		};
@@ -117,7 +117,7 @@ reg_espresso_external: regulator-espresso-external {
 		enable-active-high;
 	};
 
-	reg_touch_ldo_en: regulator-touch-ldo-en  {
+	reg_touch_ldo_en: regulator-touch-ldo-en {
 		compatible = "regulator-fixed";
 		regulator-name = "touch_ldo_en";
 		regulator-max-microvolt = <2800000>;
@@ -153,7 +153,7 @@ button-voldown {
 		};
 	};
 
-	reg_lcd: regulator-lcd	{
+	reg_lcd: regulator-lcd {
 		compatible = "regulator-fixed";
 		regulator-name = "lcd_en";
 		gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>; /* GPIO_135 */
diff --git a/arch/arm/boot/dts/ti/omap/omap4.dtsi b/arch/arm/boot/dts/ti/omap/omap4.dtsi
index 559b2bfe4ca7..c8eedd33b5d6 100644
--- a/arch/arm/boot/dts/ti/omap/omap4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4.dtsi
@@ -590,7 +590,7 @@ target-module@2000 {
 					#size-cells = <1>;
 					ranges = <0 0x2000 0x1000>;
 
-					rfbi: encoder@0  {
+					rfbi: encoder@0 {
 						reg = <0 0x1000>;
 						status = "disabled";
 						clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>, <&l3_div_ck>;
diff --git a/arch/arm/boot/dts/ti/omap/omap5.dtsi b/arch/arm/boot/dts/ti/omap/omap5.dtsi
index 6a66214ad0e2..07159b97f504 100644
--- a/arch/arm/boot/dts/ti/omap/omap5.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5.dtsi
@@ -536,7 +536,7 @@ target-module@2000 {
 					#size-cells = <1>;
 					ranges = <0 0x2000 0x1000>;
 
-					rfbi: encoder@0  {
+					rfbi: encoder@0 {
 						compatible = "ti,omap5-rfbi";
 						reg = <0 0x100>;
 						status = "disabled";
-- 
2.53.0


