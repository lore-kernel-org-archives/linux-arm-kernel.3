Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4252CC55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 06:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ThpIqXt70NKGj1QqvTU1nb/Wuyf2kshXu9wY3Wj5zI=; b=0ZfgXgI4uigx9sWey5EI+siREp
	2Yd9JEmQ4cAYHamQAXKP/Pbt+zWeMN0TU1my28j+Af2ACv6AsELfQHHYyioO9O6xk1iTkgRUoekD/
	K9kMd1TxQysbh16X7LWNt9XJAiVVtYhQRVzFtRwGvaYehJIe23MzUnnOT7gTMIL8lHgEsb1Ykh2cj
	3Wz6LtA4lKtREaoGtm5k/EkcEglrh2ogclt/TWIRfGsXKPQpxcvw3wTlrp+TsLVs4j9TmlPFERUfB
	Q+ahnGXSZ/tXk05bdZJ/YbzZmdk/M/yRne/TikyC/hoJGy32KpseetnDH8Q2qpQRdqrLPPkr/d9vy
	3NA0BXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqm1E-0000000GQyS-18Mi;
	Mon, 03 Aug 2026 06:19:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqm1C-0000000GQy4-2WFB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 06:19:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVYl62941302
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 06:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7ThpIqXt70NKGj1QqvTU1nb/Wuyf2kshXu9
	wY3Wj5zI=; b=SxP5i/FtxSpu3O581zT2BBUCC3f0kU2Mdxu9DAHKc30WDkjQxzy
	L6AOgtedeGvpWQumGzjLTqMxLUh5GbF8npGhUrbCf+xiTUU4Uuk6BJ1V3kjRScTc
	5NAa0Jk/tUtaI/6S8t6eSAzdTxA3GUhDni1dRIykggHJCQqvCasdbABuT2LxegrF
	mjAaR931ootwJ0XGdaRjC/3d3uUmOeKyLnnkUwQbetzY+qOmzJKTASVOvKIF1HIG
	/vChA+vhBS0NGfpegNg++4KxPo7acpI4CyZEDU2MdnyK+ZSqDp10Qm75Lgqdg8Bz
	DN027KJaW6zmDqEQIQY/1lK8rWaOlbTmhOw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs911csk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 06:19:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso22571871cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 23:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785737960; x=1786342760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ThpIqXt70NKGj1QqvTU1nb/Wuyf2kshXu9wY3Wj5zI=;
        b=bgarNkRMlGJZsZ4K7bcDysndp5cONJ0YqINWyAHoBiaffxCKXbPn2/5xcUOiqnZYDs
         S6mKhIsAdA/Io8aarKEDhUAP3ftQrSxYAA1HoB8Ve8Z9CCyZf4134K5bT+Ss0gq+GIzT
         kmP1tBLAcRuOqmF/xVGlOFC9qDknHRq3Ch3y2h8698ccfu0Wm0L0w1vEwMUFgdFnKuvm
         NW3NdiG0bzrbIj/rqCQbAZx70JRnH834u1IfR5UkUDMC4w/hUkpuNTlxRN/pWmtDsnLQ
         d5kP+z1GZrubiAjV54oP7vH4PXYSZvKryH32xtCWdL0IVSYTPXnZe0hqxJy+wvNciUNY
         J3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785737960; x=1786342760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ThpIqXt70NKGj1QqvTU1nb/Wuyf2kshXu9wY3Wj5zI=;
        b=tSbK97oV1A7AEo6o3J6y+Fg29e0GTXoqdFoXmZF0v2iyIZNV5HeV84b4A2AaBhuACk
         TR4+isJ/IKwarO2QQ9cag4/mjbja6N5ZYW2pGGVJwa2doZ7UGyfhr9k0NEZl6K28A4ZM
         glb5WI/Ro8sIDppZLOgs5SWZjqEacMapkJfJfQjgkQ4djpCkiLL1rS3rHb3tUChcP8Vi
         7j7XWxB2qlzRB6Cx7qPWA8dvSqQrIHnin1txrx1Xv6g1qzYDi3dIZ+x+zmJytTfBWpup
         SlKGIIIZ2pB7O6UxXKPPPaH0ElagqdatUMKWhyyUDMkNVOSzlxzsWFf5bO/iveim02Zb
         yI6A==
X-Forwarded-Encrypted: i=1; AHgh+Ro5UuxIUsKpfUh0N9m/ESbZCfDGwL+hYEy761yY5xiRTmKSI4pKOZxGFIG9x62E/0hJ5q9+rtaO71p8y9/ICCkf@lists.infradead.org
X-Gm-Message-State: AOJu0YwqYBEwHHiS+Ie9HMF1JJqk3i5+I7WigwpndUMsC2Qgm3ZAN7n4
	mZkdKYHQnEpuexVbiNXhr/J3oxeqd1ib8ENZmAmrsan1l9hzJQNhPDj01GrzGGurYnYXF/28jQN
	3Y+ntHKR66hWK62bJqgXcZFVqhtTqnzxu0vur8sYKYYPwjmPDkLI++vObRl4pj+cO6czIyidEeo
	ZoWQ==
X-Gm-Gg: AR+sD11wgVLScvu4bN3Po6gLw18PyDWlTxSTZ2xFMPP4jSQggJlUh1FiKRD+DRmrvoH
	yOlIaWJW7951nsJlDqzedxG1Mn4vCAPUANLofX3BPsdrB7kIe1WBE2r/4HtUpYNwufrFd6aAKr7
	IwVuSrbaKMHBvJlE77zzL64A/qGsrjcXSduFWAJhmzEizUfeeN9NgV7ETzCI17gR3EUAYwrIVtS
	cbQGZ05jO3XFCKUsfqwji1Cvc163R/RwpTvcm6V5lKg4lL7RQpjDMF9YnLwTQb1uATBjZpDyhWV
	eN1uAluAbEQkssHzSxJHIh6td/BC9/kX+4bywNc0RQaKtKAqYuwdg9mL9EGFezfT4sHXmCfmbIB
	lNSPcy79co9byt8eS
X-Received: by 2002:ac8:5850:0:b0:516:d83d:b28 with SMTP id d75a77b69052e-52b4c5ac831mr158017731cf.17.1785737960234;
        Sun, 02 Aug 2026 23:19:20 -0700 (PDT)
X-Received: by 2002:ac8:5850:0:b0:516:d83d:b28 with SMTP id d75a77b69052e-52b4c5ac831mr158017591cf.17.1785737959807;
        Sun, 02 Aug 2026 23:19:19 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b917efsm318457575e9.11.2026.08.02.23.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 23:19:17 -0700 (PDT)
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
Subject: [PATCH v2 1/2] ARM: dts: ti: Correct white-space style
Date: Mon,  3 Aug 2026 08:19:11 +0200
Message-ID: <20260803061910.13973-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5031; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=KJ34XveyoFveUmNZXdv/TomCqWADn2408hBhMRZcLws=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcDLea7N19wFo345AadZ40uBD3Hmf+6yXi2rrM
 2tHizHkFYyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanAy3gAKCRDBN2bmhouD
 18yGD/9qwDViIqJPqzR7UKW9w4lk1xVT/qtuFdpnrSXa/ynocX1pKovJ1mJOd3Q0p785W7dJ1SH
 AlBy+sPqsohOYnFGuvmKhIMg96wAy6a1t2+4zuFjCUCHDUovc0pzBmYuec+TctGq/K1rr2MuZqa
 T5YwcAVr7NQmUbVYhbTNDmV0ebmcTY0vcRdUqDB6TQ7i1OvKsL/6jy7UzADyR6wBuhPB0fU22ig
 nSvtl/cxdeRP16ihOWxugopQg6QFcPSKYJaefWhc5Dbb+wlagJdJrmSNF8yz0fepqNHD0A6HYDz
 VfnzEi4ssZoehg/obTCbLVV6UlaUxsuwnwiR+rPuME+EMkRL2R0Nrz3y0UDrv06U4pf6fEyQx0e
 XNKXxdXvkjJZj700zU0joZUF42wrmnm9MfauSxjumkoch8uKv+bSYmcRvTzPRsVuHtodn0DkxRf
 DiYM39C6oQ4zLJHSk+1qxFEzSCDmt4pipEeExpJqShG6ddXdwc0O75YPSIrvBsMhsnR/UhLviHf
 O42TZXV8SO3hS0DNd4d86ScMb98IDUVwAd4xBYchvq+gOOHbkeSieXghM8iNn+5d+6ZzF4kqYJ8
 rogft2/lWUJostfOAd7gcxLie/gRTgJQoO4W7iNOnGyqs9rkNJAIf3fNJXH3ysNgOU9F8Wxx7lI dNhtF83x+RdzEyw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA1NCBTYWx0ZWRfX/s0icUkIJv5G
 NMTo8G1RJvA7KL63gDTBNTZbbHlLvZV9gN/topSUIC9Ap9YM7L3sZkMKxK9gTYv/en8uCS+RMrk
 2U5l8bXjz2B2w2l1RjwjKPQz/HOuq3c=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a7032e9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ZZM3ETj0FquT2mearPAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 08pl5mNYxg40IGIEJleBldRMvYDo9R0-
X-Proofpoint-ORIG-GUID: 08pl5mNYxg40IGIEJleBldRMvYDo9R0-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA1NCBTYWx0ZWRfX0v9vDgVVmLeU
 XRO+NEYWXOtH0O+4uWtep7/flyapwd0o+7MzFUMuUrGrV2yCmL6bu2ag8mbiOLQw/GF9+OCsqj2
 t8HEwQKFssgYFsOIAjcJSYNfsNMTNo/7xuZdWlPx7Az3IXdaReZSPPee4T3SAyeGuY7lM5cERWs
 3ytd9dcjd+AEMlhHQd6Y+cyAatbP9GeKXdO9NjjGadxF4iHEVpjq2kmEikjhtQoR/avO4S4NM00
 VG+l1XIpVmGriZF0NFxYmBXCcFv6ycJdDssRN45zHJ7beXRGRkFU5rl94Bh+DFNl/BEIu+e5ZKH
 iKn3DOEXRnPxXQJmG09dFVxHJdq0b97b2Oip8+DBFL8wJGFgWF0fLPtBlN4heuD45ZUlVHEftu8
 6LcM+UFleGJN+pAkIE8dN2KVgx+iMkHv3AMZeQV5GqRpgaOdzo8k7Q3faAhTYVoqPsbjVNHtEM+
 l0FHus/36oAdIoBtwgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_231922_649016_8BF3893A 
X-CRM114-Status: GOOD (  15.95  )
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

Changes in v2:
1. Missing space for serial@2531000 in keystone.dtsi
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
index ff16428860a9..cff549c447ce 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
@@ -123,7 +123,7 @@ uart0: serial@2530c00 {
 			interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		uart1:	serial@2531000 {
+		uart1: serial@2531000 {
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


