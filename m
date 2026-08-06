Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393CEC5620A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+DaEi9tZFH7+WbTZzJJhm6BRZ00c9mpRzL/KVHxRUA=; b=KsnJ1FKLD2aqgxoDqvLtfE4ULz
	uH+FjjB8tmpPoOpofp94W2M/sVcv8AApffPHT6sa74TDGa0JYdQyVQlRhGhzMEMF0rv36JZNMqv9B
	TeMjn0j2xhLjZr80uothMq5pPF86+vfwWIEo783bw8c/EH+AITRwWjGVSDBDAihQ+Tac9b5uwnlzD
	kp5FT1CtUI0MoxCj2D28Njzws8VDcypNmSBAivF1NoKOe7IRSVt/dM4MuFGNm5Yb82OZgCCQOqkBg
	dPlGp1S5fGyN0jh4VWe2Zz2cVmoSVSPynFjhS+K/NHUTB+dluXuIbK1pqO5KmFt7aAT8PEJ6hW8ii
	AckeflSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvR0-00000005YY6-3gif;
	Thu, 06 Aug 2026 10:34:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvQy-00000005YXA-3UNO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:34:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769neia1277819
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 10:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+DaEi9tZFH7+WbTZzJJhm6BRZ00c9mpRzL/KVHxRUA=; b=kIUVcA4U5LN0GORQ
	4c2QAL9bZIUlCdPy0vuK5NqcfVguc74Fu7TSad1DKqkpZnHTJPcatgLn4GRNew8m
	fE9Us1/QLcWbWxI+qV30l+/LoTeVvHW/JS478vl5To43+xfdyZadRRVHCYwP7ikL
	bYVVgfmy9YaOipko4t4vOR1g6FQetTC9vz4QfElTo/1B30D1DWWAolUNCWIC5x56
	2rthSH6OG+WmH9V8zQFomyMDkZqIWZDTxTtK+0ddOmFnS1zr8sDT2DWOPeZVyh4q
	lNwAyMAps3U6Gjif9FDg7zpJMEcR9EKKigmZqnAVAMiRkCYwvB3/1zGnzZnYZgLH
	UaT2gg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuehjjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 10:34:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8486ffba174so4490405b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 03:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012484; x=1786617284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+DaEi9tZFH7+WbTZzJJhm6BRZ00c9mpRzL/KVHxRUA=;
        b=VUWriqki6eQipzcLLdjg/odo8iRcU0FPivshAO1bMpNM5wa+q5/UsbtSXjENfgRSYY
         sRNz09vI86Fpo/2nYjgRJbGhBH8RRTc+YvteH5AHdGcoCvzK2V3XG16Vn7X93as08cdi
         OJJ1XXsGhdaKbLMXxbn0pyhH+O9+1/n/8Ritad8diUNYyJuAb2VsvPfwVYqjiWjEF/7E
         /l5muk1KTur0QU13zCh6UarF09RwVc4K0iwHnrjjYA1CHOylUfBGUCHmSdNxX4nK4uIM
         Fko1x7lL8b2/r1W2Iww1RPu+1sCYvOHCuJLR9UbNRV+66zgYSRRXyHmX64RLU/doT3FI
         aU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012484; x=1786617284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+DaEi9tZFH7+WbTZzJJhm6BRZ00c9mpRzL/KVHxRUA=;
        b=L1VpQJXa/lq4MenC0tyyDyt3FP04bjZjqL0cz0Xes9e7zo+9vIfxyIa7wBo8qbDkh7
         rkUTAAo698AYibZYXee9gJRGEj134jginU8wsDHHdl2fi/MeWBbrrISM2nqaWfl/YqH7
         xa/UJwDZ65/qHmNtX0DQHaxYy+VQZ2sibGIfd1oZrhPuCaydS/08TmxIAhnESywEpq5s
         18/CEpy0bZ1TkBuMdhwhJAYGreAyE5LTzgdVWR1IBKa6BKztrzhecfT+dEnparNz5Nu0
         3KXjuH4sgDQ01lTNMh1kQUlJLgWJ5lctXf1SVAoqb8ZQQ+PmPyVDmaqQR8vJ316fwpe7
         JZAA==
X-Forwarded-Encrypted: i=1; AHgh+RroaPSO16PoYV61UEbmwrY/e035mD2s1DhBe/M1DmhkOtQ5sqPVknTlaR9SQ+nfhs3grBzYJcDn5G0HJu0WmBG7@lists.infradead.org
X-Gm-Message-State: AOJu0YyYFBoF/X9rwGkc0nHiEstWh5rk/Om0HB7DHbtB2kwg7VeFb/qu
	dPOBkLoIjvO/FA1ZvhsPC0rjRg3Rn/hpGtTnrluNhTf5IFsV9cp1DVzox2iSNnJiTqR7hXD/ODU
	3zDmD45YFWGb9yUPBEKkPBXPd7MLoc1RgMuxwsBai0DCt+rj3pESSlSP3SgHQHGMQfJz/udHFg0
	dolw==
X-Gm-Gg: AR+sD138O1iNnk1dSGXbMIF/h60zGy7elsiSEb8T7wmuiiWPIdqyj0ySJSKsmcaZtXu
	u9yfQd3SWR4FCNMmBLe2Nsu2kHR8Ha7hEXCpsbdKDt/LQ6eGXBLWfR0OFf9d08zS+CxyP4GCutX
	eM8GOB5Mkxm/HVzSEM9SqxaFwj+ph2g2VwNyX1m3DueOMTIr75fUiqcKakWsJXIc3Ew0pA2P+bX
	vP8AFX521BbvD/+1QMfHWeMdzSxGYK0auVbspEs/y3ZS/fi7KBhJOTzdAAlMyQmezvUgc+xXgCa
	7dNYq7xjf2kJDWDFvZe77ojpP2Qu3f/OFbSuXloaBfa9WrbrDmZMGxJLcVa+xwe//W5zRlaGL5T
	qZov2n/n2BhKwa9gDFgIzUmMu
X-Received: by 2002:a05:6a00:a247:b0:845:4126:222b with SMTP id d2e1a72fcca58-84f2e00ea1amr17821006b3a.28.1786012483562;
        Thu, 06 Aug 2026 03:34:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:a247:b0:845:4126:222b with SMTP id d2e1a72fcca58-84f2e00ea1amr17820877b3a.28.1786012483038;
        Thu, 06 Aug 2026 03:34:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:42 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:08 +0530
Subject: [PATCH v10 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-3-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a746344 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zrNp7rCLQDew2w7GYOsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: yDc1LzRNqiXipTWmt3Y0D-GOt4YQ1J8w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXz9LLbOjhnH3C
 HimCUSAvZJixG0jtMNL1nIF1Og3g2WJZbj77I5wfnjvp9+xNmgglCbdEc7Y01ENIxgkwa5/ObMd
 HMCBLuL+X5d5/TtP3cKip2n6u6JzVee9WNxxwlkuh+aUH7WkhTfeAU65Jep9VehuQnBilk0DkTP
 lT38oCVfamxakzNuQryB3L7BzQZfwTLYpzj9xzwfSQuwbFL/D9gv8fR4X19X8nS6uX937QnEIPy
 qDwhSCDt/sbj1h1l6EbnRCVVDGwWe90DeknMMD5q+7Dn7EI2MMMoFMHYIyTrSzuh6e2730430HW
 bbmiZzAG1hpv/xEC2iOxGVifnQPu/GaaiSeR52jDA3mYXs+KGb5cmyDvl4dkuPejs0syIM7c7UO
 NKHimh4O03fvUpbmGnS/I8Q/6g88NEwYlaoMG0RMHN5QV0zpA0w9s6r1FBPRWh0nN3x+vldatXF
 PFOEtLbDNsrt/a9omRg==
X-Proofpoint-ORIG-GUID: yDc1LzRNqiXipTWmt3Y0D-GOt4YQ1J8w
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX3oa3JycVJ50T
 Ay3l2qGTNgOFAOsYG4T9gtfeU/L7YuldyGSCIGKjAmUX4r9Ktk1CXZO/BlFI8m04hz0OEQo0mFV
 sNMvvTXM1c/AFIpQLl90j1HEV8EhkPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_033444_878653_C7298A6C 
X-CRM114-Status: GOOD (  13.26  )
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

The Milos camera and video clock controllers operate on the CX and MX
power rails, and require these power domains along with their
associated performance state votes to be specified for accessing the
clock controller and its GDSC. Add the 'power-domains' and
'required-opps' properties to the camcc and videocc nodes.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index aad8bf6789162f5dcabbb7d4a8efe180f86d4b46..f3af1d759e09837de457522af47c74431e8d3fdc 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1949,6 +1949,11 @@ videocc: clock-controller@aaf0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -2031,6 +2036,11 @@ camcc: clock-controller@adb0000 {
 			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
 					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1


