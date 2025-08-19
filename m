Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C60CCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 06:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae35zkKIC0CJ5nbsXi7yf5SwcQqgHmGyPNS8+VvWx1s=; b=LgCJ0tyKwMj7b5CAIYtJLWw3IB
	yBtIfh4O7qEVCGybTvHM3jSkYCuOVT2t9g5wIUA0bdIpEI4AQwojlqKerzTIwjHo06+kfKiX4Bid/
	zOPIPIcbHZb4VtHNIaPrnOc5TQcGaDw7d79tKChgx+MTw1YeivwV6zFwZ0aiySRxNkh57+pf3jRxO
	toEKw8wm7cHrfGd0Gw1tqesfhX7hzayu7ymoH1pP86t8Wdh33cfjHBKhWXJhZ6sduSPY2Qrop6KVz
	RiVw2hqey0G7vvYLixZmMDvdIrD4v5gUBBbPZTOwDs8J8Mag+2N+gw7z2RIBbCWfmCTEd7siR9q3H
	3b+jhPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGDU-00000009aPy-17j6;
	Tue, 19 Aug 2025 06:53:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFxu-00000009YNR-1KPF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 06:37:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2JgNr016705
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ae35zkKIC0CJ5nbsXi7yf5SwcQqgHmGyPNS8+VvWx1s=; b=ZVEiNzhE+Tl4Rj0R
	WulZY0o88RbENvsUmd0z/k3HgdH2FwIr7UOWqe4HWznqHxKNw3veSNzHTlo/6KM3
	Z8aH3SMpTRqAr60UMrisijuT5gL7edu97lM1rq9ubQ/LY+yeWp4E/2CI9dScNIjA
	dZqQ5Ayx/Hob80EpiF/kF0fI1T+JRqACqtYH70xH6NgKgQeScquJy9RpNjOscb/N
	eYoulDAagOm67pDis7TBMpcuDTND1IkySdHNx7AUFGOhkPjisi3M86oL4bmbJken
	HPVPmzX+BBiflXxhz1DZcGZI2t423A3J9YTJt/1mSmYfr65OuoCe8WpWRvPSN+Fk
	mR803Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mfcd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:37:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4750376ca8so762165a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 23:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585421; x=1756190221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae35zkKIC0CJ5nbsXi7yf5SwcQqgHmGyPNS8+VvWx1s=;
        b=f73v+z22UqJdV2+q+0NumkJ384cz9rJJ4LsiNDTCOaRlh68J9ulvVqrCVPesuA6UY1
         mq9hlPrYpuKa4OGVEJ2w5YeiYkBU1ZpwkYUO2VTnmKFdWRkxr3EwWxKHSDjzY+WzTV2G
         lwV0Ud3WuRWzEUGM+Ywfvo8OEm3inJM1/H6en9UaVDwLEUEQNNBsKgTuSX10uarlZ6gg
         /be4VSIiU1GBkDu18PQZx6iJJS+gMtE5VsRTVEcMHXYrJef8bueRsfOCC27GpybIPDTd
         zGbewfd9wsT4vIB93++kdy6xY9rL8++TKgzuHWYP4ygz/LPcsrcZt++ZmZDF16fT8nov
         K3ww==
X-Forwarded-Encrypted: i=1; AJvYcCWncjk2jzfxtKv4JZYzxhR6YImth/ZlMrX36z+0S57pS7bApzupjyUsrzf8fdzSjAmlNb04HLIDmVKN3xvE77Cr@lists.infradead.org
X-Gm-Message-State: AOJu0YxSMOGOfOR2MPZsoFJRSVgvr/FLpQjsT/CGbkkr965MLPuu+EcF
	SSIn5QuyXAREfdBZ8jtCtAD6UQvKd6IvvplbSZ4py5gmGxA2Y0IKbp5Ir2CEn66yljRt/DkgX/p
	6RqUE5HxdBZBFD7OvsXEBKBdcVLXV0xw5fmttqiWwnZ51IPA2Xp/Bcx4P/Zin9/srMZHs9cCK9g
	8Hzw==
X-Gm-Gg: ASbGncvMhuTL8tSsrR5ZDwlEXiBio6JudgqZXIy+QLHkq/nvQQOWMD7IPIoZPnw8BGD
	RO9iemFJBEjpVz0du4yyUE4HpTEpE4RYCl9U6XZ3cykjK1qRUVORY+uQOHsWhll+P0P89BZqkkG
	ECoIp2madL/aiYuFvNP51Zmw2SYeHQ43trebKweN7uxUBKY2qRk+zVGh/HTXG0uXhN4HSuHWBEY
	+2yICBQzaoExWTpG0lYy4z+w4q32xpgwVjb4PhgXgczwZAaJzmUO6H5MpDZxPhnkaoXva8vOGLH
	srKqPydUybAuSz0Az5WwDdAuuqBZgkGOntfycXAB8LnbqZj3IfOyqK+LYM9HTKXDmgvcZR0/DF3
	Z92F/hmmk84Wsdlf4Ip5CHARD+t9/X9huDQ==
X-Received: by 2002:a17:902:db03:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-245e0488c4fmr19904815ad.35.1755585420859;
        Mon, 18 Aug 2025 23:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHplGjIOsxjG9ywwt+oNjQuHnKblFHJP7DfxgAQ8xey2qyG+dk48tjcBRJvmxvcv4HDGKrHbg==
X-Received: by 2002:a17:902:db03:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-245e0488c4fmr19904435ad.35.1755585420372;
        Mon, 18 Aug 2025 23:37:00 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:37:00 -0700 (PDT)
From: YijieYang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:35:59 +0800
Subject: [PATCH v4 4/6] arm64: dts: qcom: qcs615-ride: Enable ethernet node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs615_eth-v4-4-5050ed3402cb@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
In-Reply-To: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=2876;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=SBNbTe9YfI7ypi1j4e391PPYp7WypDnpFergOj/Dd7Q=;
 b=Y2i2zXFfa34tuFIzyhBVHW5D/Xyb8q0LcUejJetwkYc/LdcqZOdTvNtFXsejUdHPb7YxeCmqT
 1jqm9QwQyuoBnMs4I9qAjEVJHAoEMTcRllDLyPQmrgFZ1i3MufhCX7L
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a41b8d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=FOSVMqNBLdhn2M3QeyoA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: R7Zv_RVK_H069e5zRhwMIgTNNImhzRxY
X-Proofpoint-GUID: R7Zv_RVK_H069e5zRhwMIgTNNImhzRxY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfXwkSTMOZXtNfh
 aiUT9njxnsBxloIRvlx09o0IVhY/5QAqf7/P61+r3uiBd7uV9oyfn6RFh2bQ11+btmF+0NZu9ij
 IWSfMihZt4W8qF8f2WoEJuuaMJKlQwHb6I+GqxBOY7qGaaKCEudNLd62S1jvwg2U3LWwu1I/tMN
 FurZxk2yCsBbo49kV1fYvSbyY8nWnPeYuHAS1s9Nk2fl4Mb98LqoN8G8cTbDYhouGIs6H42Vgc1
 3dFDvnvvMM0XZdSu6c7K1zmCsZv2GbUnHRbxDLSAlq/TIjwg9HxpshzZB9KTFic2grGybjBEXe+
 qJwEzLsfrdiFW3sU17v7dZIh9vyR0Qi6c17vy7ayBhkvm3vXb659nftMNI7aL5H4pwprPQQ2+Tv
 MleIznIp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_233702_367138_59D40D18 
X-CRM114-Status: GOOD (  13.60  )
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

From: Yijie Yang <quic_yijiyang@quicinc.com>

Enable the ethernet node, add the phy node and pinctrl for ethernet.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 59582d3dc4c4..05d8609c0483 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -288,6 +288,59 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&ethernet {
+	pinctrl-0 = <&ethernet_defaults>;
+	pinctrl-names = "default";
+
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-id";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	status = "okay";
+
+	mdio: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rgmii_phy: phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0x7>;
+
+			interrupts-extended = <&tlmm 121 IRQ_TYPE_EDGE_FALLING>;
+			device_type = "ethernet-phy";
+			reset-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <1>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <1>;
+		snps,tx-sched-wrr;
+
+		queue0 {
+			snps,weight = <0x10>;
+			snps,dcb-algorithm;
+			snps,priority = <0x0>;
+		};
+	};
+};
+
 &gcc {
 	clocks = <&rpmhcc RPMH_CXO_CLK>,
 		 <&rpmhcc RPMH_CXO_CLK_A>,
@@ -446,6 +499,57 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	ethernet_defaults: ethernet-defaults-state {
+		mdc-pins {
+			pins = "gpio113";
+			function = "rgmii";
+			bias-pull-up;
+		};
+
+		mdio-pins {
+			pins = "gpio114";
+			function = "rgmii";
+			bias-pull-up;
+		};
+
+		rgmii-rx-pins {
+			pins = "gpio81", "gpio82", "gpio83", "gpio102", "gpio103", "gpio112";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		rgmii-tx-pins {
+			pins = "gpio92", "gpio93", "gpio94", "gpio95", "gpio96", "gpio97";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+
+		phy-intr-pins {
+			pins = "gpio121";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <8>;
+		};
+
+		pps-pins {
+			pins = "gpio91";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <8>;
+		};
+
+		phy-reset-pins {
+			pins = "gpio104";
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };

-- 
2.34.1


