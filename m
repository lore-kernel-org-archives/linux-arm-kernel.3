Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE35EC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZY/BPGUq3Ubcc1EeSRezLJsNPAz2hAnhtWpk8PGcHQc=; b=gXVPdRMzYGm8E7nmmrqJchgUHa
	/0r/XR61VulWXOaddoJpH/Zq6WUqEfPg436UtRCsDtVOrtCA2/3NLU4hSS9xyswW/itIhIBrtYz6T
	zmoeI5zYyijTaf7okkmujf8Av9MIyBYF+M8FQjpxntb9sMLvjDh0Y6PfeH2j25/G/dmHArnCvctKI
	BSiddvRKjhl87I1CHsujWo6luLz6qrjfbFTHMdOED/aRYWOJIM9DH46JALbYLTuVxUgFG8egdaNmb
	Y0iMi88O1xd+i/KoYX92nrQ8JtbdoXLDuEXhzagmEyeC1wc38oK01dVMk923Lv4YYhqD4dICgDhJ5
	4q3t9+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJIu-00000002Xtm-1iUv;
	Tue, 04 Aug 2026 17:51:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJIp-00000002XpG-14vX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:51:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H3XxE063345
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 17:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZY/BPGUq3Ubcc1EeSRezLJsNPAz2hAnhtWpk8PGcHQc=; b=hDICPmfb85OQAWxJ
	HMas3ybpGQiq8vfHcD/9A9Zae+K3CRJhUqIzU6pCD4QIIJztFj9CHzS2htlCsjGC
	XBa0Zhf+BQW1I86xV1dFHvRJQ4tZDg1FrKre/0fRzdWvUvbEJ+FNihXD7USxLSJR
	idfkMFZJAJPZL83aPFPP/KcDrWVxD7oOsNQF4AoeafWisW02GSgWOCzMnNV63T/1
	DhjK6aYAEkDhHeGswc0yOq/uZrlw7zNV9/CIcaGwqSDMPB3qXUmtLdtznWqIezN/
	+EH9NntWAQ5XIa15JvuqUity6Tq1BLPLvAw237x+DQ8EgsFDUd82nrdTw6RdfrJ/
	GaevEQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum5689m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 17:51:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca3673560so2168705ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865905; x=1786470705; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZY/BPGUq3Ubcc1EeSRezLJsNPAz2hAnhtWpk8PGcHQc=;
        b=cfnrPdijT7/RLOM1s2Q7kEOeB70xol/CV7GRAbw0r9Y0T6bPQvIyaecDkizFTrlt3T
         HCIaUW2pRVCxisznuo5u40o1lOV1OOAXazk7AOk2DJoqzJ4BAk8Er8b7WWqdASZZrtkq
         3IigVMOirT7d1gWztfYoK2+a+I1tULymRe1mdiBz+GlDsBIQuPBLKxZTEA92rI0OiWZe
         epri9y2879DVbSVetM/aJXxJCJU7FeYH3cnthLeQgvhZf8jXwvjoNgSh7dGrqEIhmqwq
         lb0O/IKga2//16WOoFa4+SnMYlgiA+q84hsmqiQGsdkurFtUd6O08/pXeaFGSbmfIm7z
         zUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865905; x=1786470705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZY/BPGUq3Ubcc1EeSRezLJsNPAz2hAnhtWpk8PGcHQc=;
        b=DXbEsRnmRuaJDplOnA/E+G0zVRGLKzCjOm13dmsT/PcUuAZIvuI1/zp9lNxS5Nlkoe
         51VXSjho5NSXaxyiEVIsg0fH9XSre7Uv3Pef0mcFepb02NuKTYwmH+8wD1Xo9Y7WGjo4
         sPBfZO6tQEMAyPVq5XQlO6uPG4f6uOfy6gZuSV7ndJGUsummmRwEllYCWH6cp5OtDSnY
         FCiqoB7jJMSpBa4uzAPDCSFLh/QYg2bzZe11kugfKmd9XBUfJYNzeVYyF1wGcE8yeb8v
         0cLSI5FT56bpf1NidzDb5va70gqpuH1XX0bAw2LODPHyBEdO+7OqghxHUoilW9QYGvTM
         r/rw==
X-Forwarded-Encrypted: i=1; AHgh+RoYY8062ppN/I9rKUlaS6Rdxp8x3/I3gRADyaJmgcKWW5II13uJX/pN6Ah/RhrtTOfFJa1RmTcmZAq2RM7z2Rtz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9SdiBxE03RFwXhU+dBVAQbH5eXMOUXlY7sSfrduyVXWxzVZAm
	ZAoo5BiLMp9w0JqYOK1wnSk58MgYV1S8+EW+fvI4TSrr34MQewhSPp7u8CweFESzn94mrhD7zin
	KmAalB/8pZ9twKwDlzq2ImFcH98T2QdYxinmxnPgqNpF8aw1uvH6xTgstnw87n5q2DML8xw0GN1
	lmPA==
X-Gm-Gg: AR+sD129tTuN1I+BC6njBETiH1VvFR2dqwN0CeUWDQ6zWmNDE4MPnISL/lxHUXEsZX+
	7q2daZWalV8MuCyNVHYNHbCe0ppipBZOtjlImWBUv8EzOMkZ2NWCSkiafJ8Au3WPbelZl3hn5/+
	UCzDln8tK9zqJh/vcDdRUSI02QGHSybFJyaNmS93uxPLo8p29/7O4aPs2tyrisVvZynoCHvcgxz
	dtAiVMEP5Lc4EDIhWoGTS+pTDH93CxCsqhupT/wsNOmdl7ggu5v/UPzXwegiJEBNUmPaIKJJYdE
	D8U5LMh1lnljfPU4+VX5ZIxlLESKj48nzMDhyZCTUsnceVz1e6Kg+hEEctoO08c/8exgBoPwRyL
	j7I1pAulQgFPdV1r0w5NwQUSC
X-Received: by 2002:a17:903:17c3:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2d0ca165189mr6792525ad.0.1785865905230;
        Tue, 04 Aug 2026 10:51:45 -0700 (PDT)
X-Received: by 2002:a17:903:17c3:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2d0ca165189mr6792025ad.0.1785865904794;
        Tue, 04 Aug 2026 10:51:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:51:44 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:23 +0530
Subject: [PATCH v9 10/10] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-10-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfXynezMRMR7LO+
 yZYHwzHpD67DTO+tlCKP5B306Wj+JQAO2ynPB6eL3kK93tl4icKGec71V/Cuf4h0T4JzenWh2RU
 8a6Mkiajge4G3wTU7nU7kaKl6t+nRkHWWSRX/arOwNahSutB8TYHneckaStsY3lfxMH7zWorxWZ
 GPw5SO/muoOPN+5JqVpM4fkBSTs1URkt2cORSOzDE1+gUCXUbMBRgE97Q/LtyG0hrtwVKKdqVLX
 aB8uGU9CXvnYFuyFaO1nPNrwB1AWIcOY3rOoCwn6kZYmwgUulV06CgenBQQ8xwrf0O8rMkwIq+T
 n+vcb7jF7DHG0t1KqakfFCZRDfscn/JyvhIDecp+eitq5Pbd8OR6s8yHoN+kPX/gseWwW+hFsOA
 p+BQ28sNmGHIqoYPEMuPs7DzrFbxEUgwd/c+cjlftX9OrRhxe8CxdWiNI88xxKkyqvvT60q+fPi
 0PgX28jbJGPIUEIYhnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX0h3HGcyAHI9i
 2fIJQwMEwfybgR0NlHkrfT7ChY19SwSNwc/E2StRVuroZIIO6ICJAwsWgj9vYy1soHmUuH7fuEW
 hyPnCYzRL4eCvTxnhij61wtCmGGWOGs=
X-Proofpoint-GUID: l1OZLbhM46_QWI10FXBjqix7qZ9_rU4N
X-Proofpoint-ORIG-GUID: l1OZLbhM46_QWI10FXBjqix7qZ9_rU4N
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a7226b2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nFpjIs4uCRy3fSY36ugA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_105147_568859_FE155981 
X-CRM114-Status: GOOD (  14.45  )
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

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 76 +++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73a37303c1875361b7c03f09d58432..e8ff212c295e89bc7d418519d142f1950fbe126d 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4,9 +4,13 @@
  */
 
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-dispcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1787,6 +1791,24 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -2893,6 +2915,60 @@ mdss_dp0_out: endpoint {
 			};
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,eliza-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1


