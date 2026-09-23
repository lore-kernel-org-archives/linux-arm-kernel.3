Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2CCC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 04:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZwzH/kmKq82Si6b4z1xfCq5OCxq2lvwBX5Dwr7r3gc=; b=xL5By1j52VH38INyEOeJsZ+sfo
	nGnd1V1lfzfUlpAqfDTNLqsdMhXti913VsZPv1fB+0IXssoSPyNbRiBVqOCTTeoW3NOjU4oXKfqIQ
	oJTWR0BopG1628217HP8hSJqSGY4+TIQQ4wjd/OJOPwJP1dPExT4Y3+ZR6liha48yH+6O1mUbWeb7
	Pit0RSAaoCsL6dPxfnGNNBu4hmeANg/WILrtVCNK3imb+b6dxYqHFziReyU4mxtnsdbRBLdQlveBW
	gjuum/YSxurwvhf21qlmMLsfTK0x8T1/7Obcs/Fifj55Ch7gKfviCxeInGmuJHYFrCCkQFB5JmO0r
	CsnnMECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9F3T-000000078mV-3KS2;
	Wed, 23 Sep 2026 04:58:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9F3R-000000078lN-0tXv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 04:58:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iRDo2571431
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZwzH/kmKq82Si6b4z1xfCq5OCxq2lvwBX5Dwr7r3gc=; b=Kkixp3ddWNnEuA5W
	Lc5FOZx7+iY4PnBXqXwxiImtPgsNhU60R51BS+NlqmkBZe++zOttyfqQcQ/42qaW
	GMJRbd9rMaT+z89S5K1mWETmtULKYe1fEJZWi/eSaP1YUrZbunI1BZkg50eTkKtS
	VLrDoYiHzQoO5KtzAylQvqlDPV39v9pbb9Jm1hnGFFpq10sZnaCzY0OsK0GJG+3j
	RJPjeC6m51N0ozLQ7xfc7JeZLrI9T7KO6k16pkQTV8M7sS8KQuQNUuKJAIU+DPIF
	Zkgg2bKfVZZ3fITa1bsVDnBjuCQ+3W3Z1Y8wOZAcnMz9zu/SQYDm14QIerQgOgiQ
	WgNtNQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux862jcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:58:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3284bbaa89dso1976854eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 21:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139479; x=1790744279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZwzH/kmKq82Si6b4z1xfCq5OCxq2lvwBX5Dwr7r3gc=;
        b=fAXPjSFpUGdwO2W/68XjqY0qGlNxeK5kSxU4GCjPF8oL0Zvg4/Y5jLKsPLJjVJ1mM+
         Wh31TjwDVYdGnD91mVD3KVRBbXwUVrUrhgUwFmp6GyMselEYQOnyYkvkNS1rJ8XOuKtp
         ZiiJ/gdSCR1U5qVT2/IbVgP3j2v4KxW3zsOgbSZnhawMGSfhFDbfKBlF3VtAC80FRzSD
         oKSWyjMXx0KzVQ6h2Yh2AKSTWrv1uqq/ykNN1zMZVKDODj+fs12uCdScM3SWYUSfcfsJ
         8+yv35PkySBST6laPMoxffuyx79DH2wXoMEk4LQZu9y2+Bgt6TPW+luttj+zuZwxWDwu
         kEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139479; x=1790744279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZwzH/kmKq82Si6b4z1xfCq5OCxq2lvwBX5Dwr7r3gc=;
        b=G0KErV408KjZRw61k5vevlw0/EvWizz4OwxJy5K67qtCQj+Na2ptmUrtI8RNxsYUd6
         VQ7HijWNJFxPST0rc4hfkgvl61H+0TxOq62oiMdWHNh9785382D5Xlfd/UdWSg21IYLQ
         s0vss8P6gBUpxmhNcMuygGr625haFmcH7XxbGqwGcZAfbOwJzLvgwiBpSGjxR5xzpLBc
         IPSoNTb2u0yLYOYDZVjDcNYZeel6xu14KyUPvAdrFTAKp3TKRD7q+H1prL6+4hxy8M8X
         Y4JrTOcYO90pnLXiYOWOiG0noG/hqVc13EvGJQrIX3hsQ045mcp8iXzSLMI857GLkb63
         noFw==
X-Forwarded-Encrypted: i=1; AKwUvBzK7YD47ovz6O4pFW1Onu4z37AXR1iFhJ4eDRsx+ZrgelZUbM1pAy5+KwCHN+vugA6m4E27y1xwu0/16ah1AVSX@lists.infradead.org
X-Gm-Message-State: AFuF++lB7XgxH5KTQ9so6S6GERuyA4hHEgHss2SDXvIqPntwsgUs4hzX
	8uwgsgdVI5lSMRIVwcETy3vxPD7mKhT1FOceyG88ZdBGt9XNRP3hgFUgZohtmU4WJKQlLdMdn3s
	gwQwHFBDz6zrZZDQcMeeqlZCVpgU8snfHFdYuAK9R2ccYcPuJv7BLPk0qWtj2CQtddEi8MyoTk4
	4FgQ==
X-Gm-Gg: AYBFou2VvSahlR24vzit5P1t078cV+F5M6TNLd21C0eUn7VeAsH+bDPpjN8nBv8aQ5E
	EEbZ9+bEJkXLlVFN6+TEjPlmHu9x8FXdMNMso/1OVlasRd/QPsFI9H+s8HPrf3Vhy1GE5DTgJUl
	l0RW5XvJCtamesx9EUfmFZMnijGv/0OHzWvzHFxQHAEnBbSwhFjNltzLXOzBaGHtr7cDlMponF9
	gASjazsdwQoir+bvsJOb2+z7AKE/p32YZbP0bKYzQoCUzruCI/y5bigrM1u+f90GIzBGBAjM2C7
	AN3Hiq7c/lcQakMKGFHcr+cesrP1+CBxTW4uzkL2acWUYPZ3zDUEa3XS6fqZ50DBzW6fw4d0ufc
	U429RM4zBKwn3kEZKqegbxTFV9KkI99+iuy/WyiVd
X-Received: by 2002:a05:7300:e9dc:10b0:33c:fd92:a7c0 with SMTP id 5a478bee46e88-33e8e3b02f1mr1606955eec.39.1790139479260;
        Tue, 22 Sep 2026 21:57:59 -0700 (PDT)
X-Received: by 2002:a05:7300:e9dc:10b0:33c:fd92:a7c0 with SMTP id 5a478bee46e88-33e8e3b02f1mr1606927eec.39.1790139478690;
        Tue, 22 Sep 2026 21:57:58 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:57:58 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:27:29 +0530
Subject: [PATCH v9 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-shikra-camss-review-v9-2-09f5fbea1309@oss.qualcomm.com>
References: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
In-Reply-To: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=2875;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=9xs6L5gfHSY6RV096mPtEk3wrh94zC1XZp1H1XF/ohU=;
 b=smun2pIGogLH/CJD0TSq3e3BYkkj5MIp1ViERJnL9Tmq5aniQKV6AO1lx9QdXs5lfGep6ktpl
 C8uYzB6x3vKC5/RhqrG8XKAK9a24+7/QU4HP5EefYVHW/PlfOPs650h
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: sfu_Y53QGhJM5yZPpEj8jcJ4lBKqGOQi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX80whPxpjL+oM
 9YmnWHPWRVdlN+8W05bte6ziUiG6JDpDupAReCcYEEYlj4aUG7fQN2g2nEMMJ7rh3r7fMqjXgNT
 Cfu1gN6hdLXPuE3/WOVS1DlHDg9tK5g=
X-Proofpoint-ORIG-GUID: sfu_Y53QGhJM5yZPpEj8jcJ4lBKqGOQi
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab35c58 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZbC1Des45MQyGPwI-hwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX1QJ4G7bObmBU
 NOQkqtU+wpRI1rsWOWmDmJWGqxNVkAFx8EHt+0OiMJmc3Kz1ZB6vR17oxSOI/ftLZX121czDlBr
 FRcJ5/EAnzawwgJMvv5wXnITMap4aN0VRcffQbE2ItHVA+RsygSaN6QNFpSc6wRQaTynhZCluDV
 x3ms2WFYkbBU76zUJ1NYERMTsLU4no/QwolfgU3qsONKvrTyxXGQJ0RKDwUHBTSQshHI6zr9Vah
 fXZv25pNi9zinCYm5d2M3CLFdfys4hmeDmfeeqXe5EOFToCtDews9IK0qcbZpOtzosWHoYyJ/YU
 eXv4JhKZ5STCN703xhmwiuQgkLIyirRXWe6O/7Jye3Jb69NjzyAn1QsUb9Nbv39zyKcXTSIDwdd
 r9rKAKuDryt0mhEJ1qGAwmUx3cY6cuqeeyjkjnjpOhF1v+4fOOJO89SrIQufsgzGo1TkKlxikQW
 ExuQSE9n6gfNLUM7Ygg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_215801_380623_F100F111 
X-CRM114-Status: GOOD (  13.64  )
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

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 469023a22818962abb394f3ac02752f816efc839..ed73603c3dd81d92d84c91b57e33154a6fe5b470 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -892,6 +892,38 @@ qup_uart9_default: qup-uart9-default-state {
 				bias-disable;
 			};
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -2077,6 +2109,43 @@ camss_csiphy1_port: port@1 {
 			};
 		};
 
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1


