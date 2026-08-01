Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D929C55179
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTUNuN1/8ESsUUmXgeFtwpIQ1cpP4e3GVEtxRYxw+YQ=; b=dSSzcKFrCyNeRHbfwZ6H+o2Nzz
	GliAKA17KFJ3BC9O/shfFrB6n3K3nhnR6Hf/mf7D6UsyOEAzajYHdy6AP6enW8NWYHe2zOzccwF+h
	ZRLENUR/0iZ/c2geJCQsyF15EycuwxjKjoIFnPDGHhX6yyAMYhbgc6eH6ULsxa5iHksB0/KpJOnKe
	CRysSVR3aa3Pgh2z1CUrCap7jxNrcWWpxsPJ9NueAtSgJvzVo3Q9B+3gXeaU2QIwvE2VIPCq91al3
	CIEu649Nxc3X7QcbfHgHyILx7SlRcacRojGpLsVFUOcl5P3W+fCn7Qx3HyYvVAlkuGxN83ydvgSGr
	uvBJuKIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBJE-0000000EmIQ-2CVH;
	Sat, 01 Aug 2026 15:07:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBJB-0000000EmEf-1rDz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 15:07:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CaOpg2394028
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 15:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JTUNuN1/8ESsUUmXgeFtwpIQ1cpP4e3GVEtxRYxw+YQ=; b=RI7L4u08Rvw7Fy7C
	iOzqqfOlM+8TkdV6M97+/sb96Oh/NGNoPHpcyhDXnve5qUtBZgepeKd2OT94hzx7
	83wPCqm6jKCr48WBXb7mc63FRHtMXAz83GleCODnt+zfcbhCxEMCMQTMSSAgCO2o
	vfNTAaLsCKVkyeAvkDQ+m60fvjOLNcvO6FX0KjIUSjLRpIlji3zHSU2LzYwXBXBE
	nvOX8Z3QB6I097s/D6KMKSHYd9ParVuWhI5yM8nodGyDXOIGHBR0N6xhojIgTDAv
	kVigCxJV8QPbJg3rcToXqvCNAP7zlUH5e/qf2fiE+er6OYwba9HeFwo1L1llwgdL
	1lxSSg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9yggxpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 15:07:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso14565071cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596848; x=1786201648; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTUNuN1/8ESsUUmXgeFtwpIQ1cpP4e3GVEtxRYxw+YQ=;
        b=j9092P3aVOzb/k3V6qSZD3UNezgaXvheZpAb/SUCKOz/lrQPYsPih/B5xqgFsLGhhD
         EbcwvYDKw6KQDPDZi2juQQnsxvObOWHVTAuST6OUx64YuQ6mpyDbB0VH61AjkIIOEN+o
         yAyHpLMRpKQoMCZ22ZelQ9rpVNxypHHdAFpXvaq63N6xBNqKDr1h8PjfBLt+vCqpdptR
         WdHNTwmJoR5e1BCYRqxNCg6VQWHphaZ/4hnOJxCfcQGemCkmJJNP5XshQXVDx2Qln2h8
         9/KYx94+YMmNaO92YQzBFHYFrN+c6pdlNzOsdZKJR/0iksCTfluWhpn/KEfSDJZd9FOG
         oiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596848; x=1786201648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JTUNuN1/8ESsUUmXgeFtwpIQ1cpP4e3GVEtxRYxw+YQ=;
        b=SeDH4ODR1Bij96UY8854DNflLmD1TCb9sooRpAFWzH85J7jyBhncHuG0I7SytVDSrh
         GVfNHBMMDXW8m1yiVuT5dZssqHMAjRPhtY4CI33rmbiqO5jSWzD+I1HeUKMAAUsQtThF
         PEdfbbBGmePKaC24hc/XF++andR+Z4BpGCscxxes59fe9N1bUF9yVAzDuW1WjM/yBzfI
         vmmEV49PQt6rBGbjs+iY6Ec+fN/ojRaYYSW2SzHS6N68mI7laKtl9JmZRzDW/q+x9Puu
         8Kfh9g9qUkBmU2HVIAW+pkFL/IIq/T57jy6PC6hz9050bD5R398cC9A3mI2CFCh4tSu+
         pQeg==
X-Gm-Message-State: AOJu0YyNW72BxpcMsAOgQRagVcYdZoppnGvmuSx6pvi7vuJtf+guoQ2O
	J/7+WPTE4WHJEd9uHnlBODAOl5676WHHwPpPgjphDZiNSB+CL8aFjdh42sq0ovQxCRG7cCY3zLC
	CSqARjmq8dRnDqbCcWV7Bj+i/8JTk57F95x0RiG2oa+8gJTbDvrchfEcyT/C6TaSEaPOSRg7WdM
	ZU2g==
X-Gm-Gg: AR+sD12r5KjgebDL6Dmx5Wb7aeUW36KEZpeZuw00lTJTvhpQapMA/W+u/o1V9e7AaFP
	aOzsnZgRRLbrGjyH91E9orWLbe4cOLLE1XimlRvS18sQdns3c6QTcDVG1N5w/Kq6apFt6ArnPar
	D1JFPrierZZimv7NjF/0xiCJ3MkNXpM2f54GcHzUNXZaBdLJPry/dvGcZyc604xS+Qxq3rqs5fn
	sakd40uMBO6+UyH63lq11YAKa+y/6KTQU8mkGd/0P5Pwg8PeCyPP1bYyt4P+J6+tOdbxlKkjQMo
	NWjdet7exFW1KDXSU4eS88SwF6AYcA1ctxoykIxkfqbktCl5TK1w5+bgJXH3BG1NbTlT/D60xoi
	I3eVWsuPCmsPrndEQEbvXs7pX
X-Received: by 2002:a05:622a:580c:b0:517:63df:91a5 with SMTP id d75a77b69052e-52b4c5dc695mr87180651cf.19.1785596847764;
        Sat, 01 Aug 2026 08:07:27 -0700 (PDT)
X-Received: by 2002:a05:622a:580c:b0:517:63df:91a5 with SMTP id d75a77b69052e-52b4c5dc695mr87180021cf.19.1785596847372;
        Sat, 01 Aug 2026 08:07:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm16005222f8f.37.2026.08.01.08.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:07:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 17:07:02 +0200
Subject: [PATCH v2 7/8] arm64: dts: fsd: Move 'status' to the end to match
 coding style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260801-b4-dts-coding-style-strict-v2-7-f09a659ab80d@oss.qualcomm.com>
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6130;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KafFn607twykEQnbRM/XOk9qfptsuPKINmLe6Loj6+M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbgub8iXXMCK+PQR9IniToLvDNRTslgMN9i6rq
 gRNMOgmaz2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LmwAKCRDBN2bmhouD
 11IfD/9HqryBeEmp61exX7+aVNDjPT4Xk26jcy/YcgWSE0lP1nQYwvlCcGqQge8YBx3NAr59EMx
 bEyz3iKK+5O+oT2cVRrOHQ/K7ZBl+PXIRnlkAGCbINKFW9ROjhIYPN95+MXZ1VKDJOwOn5kD9q2
 Zg2qoKMIGtC0ShOsIZop46CVxkYocmUbguFgbDgHRmvmt/3DaLYl9gDDDCfIWWCiAnV2GSgxCr0
 D59Ad9dKDKZZT1XXIytuiv6UFWmBHTyQ05SFgi6VWHbGBUItEcysAIS6Iq1yWBIROHdshJ9likF
 CGJAZrbxHOnpbQFaID81+HpoXV9r22z6Wbhf6ZaCCkGMICYFfVOTTCDt72ogoJvNvTYwBrSPzCA
 rGMHIKpk+Lbx20w12C19h11UzzdwYQ5Wh4nnGMDt02erh9a4lmYoUkfHHtAwyrUNepmHsF7q3A+
 DmZupZDtI6a/qKD+aAxdYVClWRmU7xdqpQGMfzl4VVFXmAhnSbvrXvMYnXZTfrNBLgnx1EccZrj
 zEfXXcGqI1AssJLY+rv+XjrfwgJnLUo+KJa2c4VWE5a7wG7XMouVtD+0H3+7uL5bIJsoWVqqQVp
 0V3CFd9sktayuRW4g9l73QlntzHW/rbSY+/nKymFuaHlvt0st3jcy/hKMGq3n+xuX2gHbvUq8F+
 xhXWtIluRevWAHA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX58a9lsXjWX+Z
 g0l2WOSPFwOeLwEZra845knN0kWRLzP9bgSvQ7HdSeLXrmXsVGM3L+AikpaTLwiuFw5tdduH4Zd
 x1qD6pwndtcsJhiGzpJIZLaVG5byOS4=
X-Proofpoint-GUID: S6JVZMn9ssJvPJc3t7aNd6QqQ-iMKJiD
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6e0bb0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=vEzWEtAh74nsurIt10gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: S6JVZMn9ssJvPJc3t7aNd6QqQ-iMKJiD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfXyekGxK98FfxR
 VeFzqClgF5An1EcY1UJQJNr3FYtQHVoTmr7B/pjWq39OnjoIcCrtBocfQG2yh4dpPg0UDiTaA+1
 pWuHYB4r8ge5TPAZjrlLI1QTnM0gMf5QMqFQ7hYZGly6qlvu983r40dq5bk6MjISHowMKFT5Q7Y
 lh/YloK4AodPogqxv+gygYzJC8jeWo0yXQLdRGIwIwVu3H5FBLC85QdhrTHvVJC/poRw0IR7l//
 dJzPTbVYulxR7ySro5iQ0aKKW8xMlEyNRvQVDkBzXj/LjlrOVeSao1ifhPQnV/Y6o8woaFiE8e9
 YS4KC2XLGmYWmi4pd05udhcESc7+e0l/E9CC9ceRCSvzNEN8zLj1hxqPbEmn6B6QukXpHbpbGHU
 b8/Xn9synm+Q+OmT/px25Ol47e5VgrgUVxn/t1YnLzXyIJ2Qn2tMkteb2fG5ZArZvXYW5+cotq7
 AnV1PSXEmmwF1eKu7fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_080730_171551_F9BE6FB5 
X-CRM114-Status: GOOD (  15.11  )
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

'status' property is special, thus DTS coding style expects it to be
always the last property preceded with a blank line, as reported by
dt-check-style:

  [required-blank-lines] "status" must be preceded by a blank line
  [property-order] property 'phy-mode' out of canonical order (should sort before 'status')

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts |  6 ++++--
 arch/arm64/boot/dts/tesla/fsd.dtsi    | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 9ff22e1c8723..73b6a25e0e4d 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -65,9 +65,10 @@ codec {
 };
 
 &ethernet0 {
+	phy-mode = "rgmii-id";
+
 	status = "okay";
 
-	phy-mode = "rgmii-id";
 	fixed-link {
 		speed = <1000>;
 		full-duplex;
@@ -75,9 +76,10 @@ fixed-link {
 };
 
 &ethernet1 {
+	phy-mode = "rgmii-id";
+
 	status = "okay";
 
-	phy-mode = "rgmii-id";
 	fixed-link {
 		speed = <1000>;
 		full-duplex;
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 5b06e2667b89..214d33ca7177 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -603,6 +603,7 @@ serial_0: serial@14180000 {
 				 <&clock_peric PERIC_SCLK_UART0>;
 			clock-names = "uart", "clk_uart_baud0";
 			samsung,uart-fifosize = <64>;
+
 			status = "disabled";
 		};
 
@@ -616,6 +617,7 @@ serial_1: serial@14190000 {
 				 <&clock_peric PERIC_SCLK_UART1>;
 			clock-names = "uart", "clk_uart_baud0";
 			samsung,uart-fifosize = <64>;
+
 			status = "disabled";
 		};
 
@@ -658,6 +660,7 @@ pwm_0: pwm@14100000 {
 			#pwm-cells = <3>;
 			clocks = <&clock_peric PERIC_PWM0_IPCLKPORT_I_PCLK_S0>;
 			clock-names = "timers";
+
 			status = "disabled";
 		};
 
@@ -668,6 +671,7 @@ pwm_1: pwm@14110000 {
 			#pwm-cells = <3>;
 			clocks = <&clock_peric PERIC_PWM1_IPCLKPORT_I_PCLK_S0>;
 			clock-names = "timers";
+
 			status = "disabled";
 		};
 
@@ -681,6 +685,7 @@ hsi2c_0: i2c@14200000 {
 			pinctrl-0 = <&hs_i2c0_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C0>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -694,6 +699,7 @@ hsi2c_1: i2c@14210000 {
 			pinctrl-0 = <&hs_i2c1_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C1>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -707,6 +713,7 @@ hsi2c_2: i2c@14220000 {
 			pinctrl-0 = <&hs_i2c2_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C2>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -720,6 +727,7 @@ hsi2c_3: i2c@14230000 {
 			pinctrl-0 = <&hs_i2c3_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C3>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -733,6 +741,7 @@ hsi2c_4: i2c@14240000 {
 			pinctrl-0 = <&hs_i2c4_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C4>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -746,6 +755,7 @@ hsi2c_5: i2c@14250000 {
 			pinctrl-0 = <&hs_i2c5_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C5>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -759,6 +769,7 @@ hsi2c_6: i2c@14260000 {
 			pinctrl-0 = <&hs_i2c6_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C6>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -772,6 +783,7 @@ hsi2c_7: i2c@14270000 {
 			pinctrl-0 = <&hs_i2c7_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C7>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -789,6 +801,7 @@ i2s_0: i2s@140e0000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2s0_bus>;
 			#sound-dai-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -806,6 +819,7 @@ i2s_1: i2s@140f0000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2s1_bus>;
 			#sound-dai-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -840,6 +854,7 @@ m_can0: can@14088000 {
 				 <&clock_peric PERIC_MCAN0_IPCLKPORT_CCLK>;
 			clock-names = "hclk", "cclk";
 			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
 			status = "disabled";
 		};
 
@@ -857,6 +872,7 @@ m_can1: can@14098000 {
 				 <&clock_peric PERIC_MCAN1_IPCLKPORT_CCLK>;
 			clock-names = "hclk", "cclk";
 			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
 			status = "disabled";
 		};
 
@@ -874,6 +890,7 @@ m_can2: can@140a8000 {
 				 <&clock_peric PERIC_MCAN2_IPCLKPORT_CCLK>;
 			clock-names = "hclk", "cclk";
 			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
 			status = "disabled";
 		};
 
@@ -891,6 +908,7 @@ m_can3: can@140b8000 {
 				 <&clock_peric PERIC_MCAN3_IPCLKPORT_CCLK>;
 			clock-names = "hclk", "cclk";
 			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
 			status = "disabled";
 		};
 
@@ -909,6 +927,7 @@ spi_0: spi@14140000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi0_bus>;
 			num-cs = <1>;
+
 			status = "disabled";
 		};
 
@@ -927,6 +946,7 @@ spi_1: spi@14150000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi1_bus>;
 			num-cs = <1>;
+
 			status = "disabled";
 		};
 
@@ -945,6 +965,7 @@ spi_2: spi@14160000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi2_bus>;
 			num-cs = <1>;
+
 			status = "disabled";
 		};
 
@@ -1007,6 +1028,7 @@ ethernet1: ethernet@14300000 {
 				    <&eth1_rx_ctrl>, <&eth1_mdio>;
 			local-mac-address = [00 00 00 00 00 00];
 			iommus = <&smmu_peric 0x0 0x1>;
+
 			status = "disabled";
 		};
 
@@ -1026,6 +1048,7 @@ ufs: ufs@15120000 {
 			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
 			phys = <&ufs_phy>;
 			phy-names = "ufs-phy";
+
 			status = "disabled";
 		};
 
@@ -1056,6 +1079,7 @@ ethernet0: ethernet@15300000 {
 				    <&eth0_rx_ctrl>, <&eth0_mdio>;
 			local-mac-address = [00 00 00 00 00 00];
 			iommus = <&smmu_fsys0 0x0 0x1>;
+
 			status = "disabled";
 		};
 	};

-- 
2.53.0


