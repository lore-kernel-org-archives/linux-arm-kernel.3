Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855F4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gt1vxrCSNrq7y97Hv08uirOBPw/48mufLTobNvyzlTU=; b=wr/QuUykLjQ5uxetWLJoNSd46e
	+SMlVKYInJEryeS40unsUzsQWh9Z/+vKlUZuJprcWzyB/pgL5d3LHmk53eVzFGkOLiMXGTPOgllUK
	LUeE2lPGxDtdtZxiUSzVwx+iVEQLBlXKn0KlXXTFHFOKfgTPn/76jy2FbcdZTmCWoWkelh8FH7rhs
	65B/cex3t2HdbVAUfUUjTNPJwq3CJTPXSStoQMvx2J/zju08OWLicJAeZVww5CoL71ks/WW8Lx75D
	h0jGJ7NoSb65heIorV2zlPVpKphl61tLK3e/tk9IQz9h6wdGxL7jM/fIIqfHeSh7YpsANaeIeq77K
	esgnrHAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnf4-0000000DHsQ-2PTe;
	Mon, 06 Jul 2026 18:03:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnf1-0000000DHrp-3UQN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 18:03:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6UR982427
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 18:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Gt1vxrCSNrq7y97Hv08uirOBPw/48mufLTo
	bNvyzlTU=; b=giDj9PJ9BabyIlHd/8JLoqHNzisAjKoD89j+xblWLHWKkuhKLfJ
	taYJtwL+pERpKqRr8B40no+92AM7AFkIePyjq04RKbNpdF1MulaR0DthtZHnA64m
	lNuwEul026dzZgo2CVW5+EUoRtL8edXYnKvPr4RQbV2+F+T10G/HqYYftbg7837m
	wbpR2XWOM/rxC0Ul+5ugVl6ITXxmrcydZhHRLNfPlOACJDoWQCNg+TxBCusv/us1
	w+Sz1M0zUqbOzYIMGCJkzrbspc0cvXMbFKK9SlKEq1mIZu4M4j3JDqCnb6GxaJAi
	2GUHFpu3bzou24UcAznr5o1atnZqiW3i6Fw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpjann-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 18:03:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5be3d6de82dso231914e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 11:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783360994; x=1783965794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt1vxrCSNrq7y97Hv08uirOBPw/48mufLTobNvyzlTU=;
        b=VivZyTd3UfV37K6U3t+vZqRWedrJn4kaAHcjA5KFKGeeTsyHTQopP1HqeRwG8z3G5a
         bakWEDdI+vIT99RQiVWzp6CQGTpsr+MIdC5MHrA/HF0CoFpkPczz07L6xyaYqCmRXnrZ
         mog7L0Ua9FNpH75A5MLOINSJHU3JJi5rHSpHSBq6Y044OyleWfgr1WQzzMXDisNu0VQJ
         D06dZtR2hI/tRZuWyhmpe4ZjHX3GtcBxtUARsq85A197ekG/xZ6p3ECtKFAUIrpUDKeO
         jZhDYC/qEqNJ5vG+rOjxWCYaY/IzeS4sG9xQXqlWd04GUtW1jhmER2wQgEXUQmveZZT3
         litw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360994; x=1783965794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt1vxrCSNrq7y97Hv08uirOBPw/48mufLTobNvyzlTU=;
        b=BFOHnia5CIT9vOEuKuKnT3+b6oqIwYOVWCQv7R0bmDm52zYCEq6jmOz8tp24fzhr9V
         tDGxqH1McFVNe7+mBUzL5+L9LrG2KYycqy/7nvx7rItGJS2uuQL637vTmb9JLCojXwBq
         XOWmSPBvlD0ny9zJB6kCNikHC57Sm4ZAVVpwJfyY4momhcqvBdimYIw0/15H9+vEuqmK
         Ap1tGPoetj6jCrXuSIKAJQ/63K0hquuGjg3UNqzQS6VKk7eVH1nOBi2aqZgRWTC59q6P
         0tu9U6sPexI1tR6nBZ1I0dahxB6t4XnDQrYsQKzk4PX+v5SK42xUHQkCX5XRdhLoxPVJ
         aVnA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4DMtamW9blrwaiVSmPk+fQ94R/P8xmUAuMrRUHeInU/v4bshSLN2FxljjGZdcXNICMS3h4uFA9qt9boEpHxSv@lists.infradead.org
X-Gm-Message-State: AOJu0YyhitBOlW2Y5Vvf+ayfIuPaIptOKOTo4KPYTYZ2t+0prYONcW61
	QP0uwsd9UdxNpIEEtENgqay6LYQZGLPV6d8rmORrIk2/HqSXnxOQGXbwkc1CpMJSD3ux1NKK7Eu
	w8Nb7MqFmaCH7NViGOFlm3qOZqwwtykrnXQwJ7YfkuTBt1l4fCluJqt4XAQMYdyKRHarwKEPR7R
	vqTQ==
X-Gm-Gg: AfdE7cnjOZc5m+P1mhD4u39JnqHoIysOkRjHKlHKQ2vWZrym5vrWMFKdYVJ77PXH5ZW
	eY9MqbTzezW8FtFZwq7aaRywAltHfW0Iti6PVTKeRZd6d2gsnDYV5Bs2V8tlmqiGYJWSliHkEAG
	9GPpfQZ7svO4plVL9N/YnuL2vfs8hm5KyUEg6DEVADCFVTiQ4hSK+VSh01rS1Zpn7demaiOPE4G
	mh7krXoVaL4UiAVC0h9QdcXQOLzEdTTWNjF9rPtYIRb1GL0PgkHY0Hg5y7rUOgpUJVa2AzkT/Me
	rySCO9IKr4JvdrPQAXXSBifb8tD0bml7rXpFu9SZ1fjUKfvsv4nrGyTXQFzc+sgqVUM/mM/x1xJ
	Onif3nHdKz3XefXPpKB43zb9w4Xw=
X-Received: by 2002:a05:6122:e44a:b0:5bd:c27a:dafd with SMTP id 71dfb90a1353d-5be89e1543amr904414e0c.3.1783360993849;
        Mon, 06 Jul 2026 11:03:13 -0700 (PDT)
X-Received: by 2002:a05:6122:e44a:b0:5bd:c27a:dafd with SMTP id 71dfb90a1353d-5be89e1543amr904332e0c.3.1783360992942;
        Mon, 06 Jul 2026 11:03:12 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm27356538f8f.11.2026.07.06.11.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:03:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] ARM: dts: aspeed: Correct indentation
Date: Mon,  6 Jul 2026 20:03:08 +0200
Message-ID: <20260706180307.635369-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=15384; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=LdhjOdTRiwYN1T2j9SwCfs17Qi6jkgIysZsTMSeCB6I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS+3bzaoCGnhqEtDlbcaXCaGjDv3ej/HylA87L
 9qGEpCaeeyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvt2wAKCRDBN2bmhouD
 1wVXD/0XwHSBVLnre+wUfDtHq73rhECaCtvpphs+di9tMlTnHNoGaUK79LZ6cyNfpeE7YlQ/hfV
 SS8yDulpkOmnV9EE8nDp3tfgFWmmjFcQWpOc2yS2DCd7FieT/VH1+AzY7fOuRyyfyjXshWQaGuK
 r+aziQbxvNlSAc124vLbX44DvsN9dVomyNIFc2llisb03yALRgm9w/K+ZT8jKfIxfneZou5r7IV
 0h4yEXV4jfAzmicPci4wfbu/DTmTcYPZxanYa0FGSr45tXT/irdL72murxQRLkPbYl9yk+Hiamh
 +yxlj23yk0YJKHEzMSBYebr4Ay7SUpcsz+Nb/eCKAxNu5Y7nP2d9CH2yCcV7sHZJJ26Kwd6S1p0
 yPfWSSec7kHMElqFmbBGmvcdKYV4ZtoHFwUW5Ip0qJYHjxPsa73IMg1lwuTvgkPT5WIgH9C7G/y
 4VsCktVQuNrLZERzhn1gqYYdYzr+kSv6DuuZj3zkGn4m55avw8B4aGREe6O8Mr22eqdkkWU1MDu
 +ftCZVUo5krjQopsXQWOEsF5+OHQrI/45qyrnpa2INwukNzYkYFj0OkkUlC4ylbFyT/IO7XkULQ
 +Xdu7Y/1j4QONfFjhcLvzbmgYqQYeWuPEDePg8/qkP/ePIln2vAU8VkRuUVYRAhRGlcuwGCfSAh sRDD2WMu6Cgnpwg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bede2 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=EdFd9dCIzGFzXepkhT4A:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 7bm91n_lYi3AofY395Hp08t8WEF20ov2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX+BnRT7O9GDXi
 dv9gK+JPSndu0rDH2w5IsFXepjjIx/BA0lU4y8oYUZZXJy9wkOMm2z4iTh7ll7c0xG/plxZwK4G
 6kE2C1YpX7t7MVEDSnVLoG3LLgMydfzkycdTCJ1e2I5LcP9NZ8izk0e9P/Unzc13qp5alK5g/j1
 /FohhHTUC0+hto8KKTpWI8OyODiVN2tRbruhGFWM2GV03yo6hZk2sPiWU3EEqyFPjPAMtFNcbpa
 q8xI+yxbmFTWFrMjBBz9s42FHfYEIMOpJ7H6PSV6y5Y+bCR9JPunk+mrJF594vw+WLb91bw3Oog
 hoc4jkfONUw36AJNtd4PtVQlbopTQObV3OoPpyE67595UXYOo41I0Dca1TDjfJEvYqTcdLDNHtQ
 jr4/rO1IlVzBbz/QlQHXpp+6G7c7PREGzXsejHFLdJ8VlfX1opqYpGnNK8zK3mw4QxeE7fBszgM
 Q61msBmkJ8tJAQBVw1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX2qO9PzDpmwUQ
 McVgXiKh018eCf9zNzcRURCC2KmDECxV6mV5nuuu+0ai2isNaPcG//hkOAS1m0E/JS+zBUOvCvs
 bvGnPqnkN0JOg/GSKbU/2ZFjWdjRXYw=
X-Proofpoint-GUID: 7bm91n_lYi3AofY395Hp08t8WEF20ov2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_110316_117743_4385177B 
X-CRM114-Status: GOOD (  15.39  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).

Changes in v2:
1. Fix also arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts
---
 .../aspeed-bmc-inventec-transformers.dts      | 432 +++++++++---------
 .../boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts |   2 +-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   2 +-
 3 files changed, 218 insertions(+), 218 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts
index c713cb7a6187..45ee0f2cc2bb 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts
@@ -9,320 +9,320 @@
 #include <dt-bindings/gpio/aspeed-gpio.h>
 
 / {
-       model = "TRANSFORMERS BMC";
-       compatible = "inventec,transformer-bmc", "aspeed,ast2600";
+	model = "TRANSFORMERS BMC";
+	compatible = "inventec,transformer-bmc", "aspeed,ast2600";
 
-       aliases {
-               serial4 = &uart5;
-       };
+	aliases {
+		serial4 = &uart5;
+	};
 
-       chosen {
-               stdout-path = &uart5;
-               bootargs = "console=ttyS4,115200n8";
-       };
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200n8";
+	};
 
-       memory@80000000 {
-               device_type = "memory";
-               reg = <0x80000000 0x80000000>;
-       };
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
 
-       leds {
-               compatible = "gpio-leds";
+	leds {
+		compatible = "gpio-leds";
 
-               // UID led
-               uid {
-                       label = "UID_LED";
-                       gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
-               };
+		// UID led
+		uid {
+			label = "UID_LED";
+			gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+		};
 
-               // Heart beat led
-               heartbeat {
-                       label = "HB_LED";
-                       gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
-               };
-       };
+		// Heart beat led
+		heartbeat {
+			label = "HB_LED";
+			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &mdio0 {
-       status = "okay";
+	status = "okay";
 
-       ethphy0: ethernet-phy@0 {
-               compatible = "ethernet-phy-ieee802.3-c22";
-               reg = <1>;
-       };
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
 };
 
 &mac3 {
-       status = "okay";
-       phy-mode = "rgmii";
-       phy-handle = <&ethphy0>;
-       pinctrl-names = "default";
-       pinctrl-0 = <&pinctrl_rgmii4_default>;
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii4_default>;
 };
 
 &fmc {
-       status = "okay";
+	status = "okay";
 
-       flash@0 {
-               status = "okay";
-               m25p,fast-read;
-               label = "bmc";
-               spi-max-frequency = <33000000>;
-               spi-tx-bus-width = <2>;
-               spi-rx-bus-width = <2>;
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <33000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout.dtsi"
-       };
+	};
 
-       flash@1 {
-               status = "okay";
-               m25p,fast-read;
-               label = "bmc2";
-               spi-max-frequency = <33000000>;
-               spi-tx-bus-width = <2>;
-               spi-rx-bus-width = <2>;
-       };
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc2";
+		spi-max-frequency = <33000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
 };
 
 &spi1 {
-       status = "okay";
-       pinctrl-names = "default";
-       pinctrl-0 = <&pinctrl_spi1_default>;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
 
-       flash@0 {
-               status = "okay";
-               m25p,fast-read;
-               label = "bios";
-               spi-max-frequency = <33000000>;
-               spi-tx-bus-width = <1>;
-               spi-rx-bus-width = <1>;
-       };
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bios";
+		spi-max-frequency = <33000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
 };
 
 &wdt1 {
-       status = "okay";
+	status = "okay";
 };
 
 &uart1 {
-       status = "okay";
+	status = "okay";
 };
 
 &uart5 {
-       status = "okay";
+	status = "okay";
 };
 
 &i2c0 {
-       status = "okay";
+	status = "okay";
 
-       //Set bmc' slave address;
-       bmc_slave@10 {
-               compatible = "ipmb-dev";
-               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
-               i2c-protocol;
-       };
+	//Set bmc' slave address;
+	bmc_slave@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
 };
 
 &i2c2 {
-       status = "okay";
+	status = "okay";
 };
 
 &i2c3 {
-       // FRU AT24C512C-SSHM-T
-       status = "okay";
-       eeprom@50 {
-               compatible = "atmel,24c512";
-               reg = <0x50>;
-               pagesize = <128>;
-       };
+	// FRU AT24C512C-SSHM-T
+	status = "okay";
+	eeprom@50 {
+		compatible = "atmel,24c512";
+		reg = <0x50>;
+		pagesize = <128>;
+	};
 };
 
 &i2c5 {
-       status = "okay";
+	status = "okay";
 };
 
 &i2c6 {
-       status = "okay";
+	status = "okay";
 
-       tmp75@49 {
-               compatible = "ti,tmp75";
-               reg = <0x49>;
-       };
+	tmp75@49 {
+		compatible = "ti,tmp75";
+		reg = <0x49>;
+	};
 
-       tmp75@4f {
-               compatible = "ti,tmp75";
-               reg = <0x4f>;
-       };
+	tmp75@4f {
+		compatible = "ti,tmp75";
+		reg = <0x4f>;
+	};
 
-       tmp468@48 {
-               compatible = "ti,tmp468";
-               reg = <0x48>;
-       };
+	tmp468@48 {
+		compatible = "ti,tmp468";
+		reg = <0x48>;
+	};
 };
 
 &i2c7 {
-       status = "okay";
-       adm1278@40 {
-               compatible = "adi,adm1278";
-               reg = <0x40>;
-       };
+	status = "okay";
+	adm1278@40 {
+		compatible = "adi,adm1278";
+		reg = <0x40>;
+	};
 };
 
 
 &i2c8 {
-       // FRU AT24C512C-SSHM-T
-       status = "okay";
+	// FRU AT24C512C-SSHM-T
+	status = "okay";
 
-       eeprom@51 {
-               compatible = "atmel,24c512";
-               reg = <0x51>;
-               pagesize = <128>;
-       };
+	eeprom@51 {
+		compatible = "atmel,24c512";
+		reg = <0x51>;
+		pagesize = <128>;
+	};
 
-       eeprom@53 {
-               compatible = "atmel,24c512";
-               reg = <0x53>;
-               pagesize = <128>;
-       };
+	eeprom@53 {
+		compatible = "atmel,24c512";
+		reg = <0x53>;
+		pagesize = <128>;
+	};
 };
 
 &i2c9 {
-       // M.2
-       status = "okay";
+	// M.2
+	status = "okay";
 };
 
 &i2c10 {
-       // I2C EXPANDER
-       status = "okay";
+	// I2C EXPANDER
+	status = "okay";
 
-       i2c-mux@71 {
-               compatible = "nxp,pca9544";
-               #address-cells = <1>;
-               #size-cells = <0>;
-               reg = <0x71>;
-       };
+	i2c-mux@71 {
+		compatible = "nxp,pca9544";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+	};
 
-       i2c-mux@73 {
-               compatible = "nxp,pca9544";
-               #address-cells = <1>;
-               #size-cells = <0>;
-               reg = <0x73>;
-       };
+	i2c-mux@73 {
+		compatible = "nxp,pca9544";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x73>;
+	};
 };
 
 &i2c11 {
-       // I2C EXPANDER
-       status = "okay";
+	// I2C EXPANDER
+	status = "okay";
 
-       i2c-mux@70 {
-               compatible = "nxp,pca9544";
-               #address-cells = <1>;
-               #size-cells = <0>;
-               reg = <0x70>;
+	i2c-mux@70 {
+		compatible = "nxp,pca9544";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
 
-               pcie_eeprom_riser1: i2c@0 {
-                       #address-cells = <1>;
-                       #size-cells = <0>;
-                       reg = <0>;
+		pcie_eeprom_riser1: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
 
-                       eeprom@55 {
-                               compatible = "atmel,24c512";
-                               reg = <0x55>;
-                               pagesize = <128>;
-                       };
-               };
+			eeprom@55 {
+				compatible = "atmel,24c512";
+				reg = <0x55>;
+				pagesize = <128>;
+			};
+		};
 
-               pcie_eeprom_riser2: i2c@1 {
-                       #address-cells = <1>;
-                       #size-cells = <0>;
-                       reg = <1>;
+		pcie_eeprom_riser2: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
 
-                       eeprom@55 {
-                               compatible = "atmel,24c512";
-                               reg = <0x55>;
-                               pagesize = <128>;
-                       };
-               };
+			eeprom@55 {
+				compatible = "atmel,24c512";
+				reg = <0x55>;
+				pagesize = <128>;
+			};
+		};
 
-               pcie_eeprom_riser3: i2c@2 {
-                       #address-cells = <1>;
-                       #size-cells = <0>;
-                       reg = <2>;
+		pcie_eeprom_riser3: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
 
-                       eeprom@55 {
-                               compatible = "atmel,24c512";
-                               reg = <0x55>;
-                               pagesize = <128>;
-                       };
-               };
-       };
+			eeprom@55 {
+				compatible = "atmel,24c512";
+				reg = <0x55>;
+				pagesize = <128>;
+			};
+		};
+	};
 };
 
 &i2c12 {
-       status = "okay";
+	status = "okay";
 
-       psu0:psu0@58 {
-               compatible = "pmbus";
-               reg = <0x58>;
-       };
+	psu0:psu0@58 {
+		compatible = "pmbus";
+		reg = <0x58>;
+	};
 };
 
 &gpio0 {
-       status = "okay";
-       gpio-line-names =
-       /*A0-A7*/   "","","","","","","","",
-       /*B0-B7*/   "presence-ps0","power-chassis-good","","","","","presence-ps1","",
-       /*C0-C7*/   "","","","","","","","",
-       /*D0-D7*/   "","","","","","","","",
-       /*E0-E7*/   "","","","","","","","",
-       /*F0-F7*/   "","","","","power-chassis-control","","","",
-       /*G0-G7*/   "","","jtag-mux","","","","","",
-       /*H0-H7*/   "","","","","reset-button","power-button","","",
-       /*I0-I7*/   "","","","","","","","",
-       /*J0-J7*/   "","","","","","","","",
-       /*K0-K7*/   "","","","","","","","",
-       /*L0-L7*/   "","","","","","","","",
-       /*M0-M7*/   "","","","","","","","",
-       /*N0-N7*/   "","","","","","","","",
-       /*O0-O7*/   "","","","","","","","",
-       /*P0-P7*/   "","","","tck-mux","","","","",
-       /*Q0-Q7*/   "","","","","","","","",
-       /*R0-R7*/   "","","","","","","","",
-       /*S0-S7*/   "","","","","","","","",
-       /*T0-T7*/   "","","","","","","","",
-       /*U0-U7*/   "","nmi-button","","","","","","",
-       /*V0-V7*/   "","","","","power-config-full-load","","","",
-       /*W0-W7*/   "","","","","","","","",
-       /*X0-X7*/   "","","","","","","","",
-       /*Y0-Y7*/   "","","","","","","","",
-       /*Z0-Z7*/   "","","","","","","","",
-       /*AA0-AA7*/ "","","","","","","","",
-       /*AB0-AB7*/ "","","","","","","","",
-       /*AC0-AC7*/ "","","","","","","","";
+	status = "okay";
+	gpio-line-names =
+	/*A0-A7*/   "","","","","","","","",
+	/*B0-B7*/   "presence-ps0","power-chassis-good","","","","","presence-ps1","",
+	/*C0-C7*/   "","","","","","","","",
+	/*D0-D7*/   "","","","","","","","",
+	/*E0-E7*/   "","","","","","","","",
+	/*F0-F7*/   "","","","","power-chassis-control","","","",
+	/*G0-G7*/   "","","jtag-mux","","","","","",
+	/*H0-H7*/   "","","","","reset-button","power-button","","",
+	/*I0-I7*/   "","","","","","","","",
+	/*J0-J7*/   "","","","","","","","",
+	/*K0-K7*/   "","","","","","","","",
+	/*L0-L7*/   "","","","","","","","",
+	/*M0-M7*/   "","","","","","","","",
+	/*N0-N7*/   "","","","","","","","",
+	/*O0-O7*/   "","","","","","","","",
+	/*P0-P7*/   "","","","tck-mux","","","","",
+	/*Q0-Q7*/   "","","","","","","","",
+	/*R0-R7*/   "","","","","","","","",
+	/*S0-S7*/   "","","","","","","","",
+	/*T0-T7*/   "","","","","","","","",
+	/*U0-U7*/   "","nmi-button","","","","","","",
+	/*V0-V7*/   "","","","","power-config-full-load","","","",
+	/*W0-W7*/   "","","","","","","","",
+	/*X0-X7*/   "","","","","","","","",
+	/*Y0-Y7*/   "","","","","","","","",
+	/*Z0-Z7*/   "","","","","","","","",
+	/*AA0-AA7*/ "","","","","","","","",
+	/*AB0-AB7*/ "","","","","","","","",
+	/*AC0-AC7*/ "","","","","","","","";
 };
 
 &lpc_snoop {
-       status = "okay";
-       snoop-ports = <0x80>;
+	status = "okay";
+	snoop-ports = <0x80>;
 };
 
 &emmc_controller {
-       status = "okay";
+	status = "okay";
 };
 
 &emmc {
-       status = "okay";
-       non-removable;
-       max-frequency = <52000000>;
-       bus-width = <8>;
+	status = "okay";
+	non-removable;
+	max-frequency = <52000000>;
+	bus-width = <8>;
 };
 
 &vhub {
-       status = "okay";
-       aspeed,vhub-downstream-ports = <7>;
-       aspeed,vhub-generic-endpoints = <21>;
-       pinctrl-names = "default";
-       pinctrl-0 = <&pinctrl_usb2ad_default>;
+	status = "okay";
+	aspeed,vhub-downstream-ports = <7>;
+	aspeed,vhub-generic-endpoints = <21>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb2ad_default>;
 };
 
 &rtc {
-       status = "okay";
+	status = "okay";
 };
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts
index 8a7fb55ab489..5a3e8a3941d4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts
@@ -82,7 +82,7 @@ &fmc {
 	flash@0 {
 		status = "okay";
 		m25p,fast-read;
-        label = "bmc";
+		label = "bmc";
 #include "openbmc-flash-layout.dtsi"
 	};
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..edf4b74f5aba 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -517,7 +517,7 @@ timer: timer@1e782000 {
 				clocks = <&syscon ASPEED_CLK_APB1>;
 				clock-names = "PCLK";
 				status = "disabled";
-                        };
+			};
 
 			uart1: serial@1e783000 {
 				compatible = "ns16550a";
-- 
2.53.0


