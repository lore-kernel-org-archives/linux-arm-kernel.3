Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE7DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/FB2kx9I7szAacRUGhC1WVT/Af65I0UeWspZWSP7bU=; b=HmaRUItedQ0AXwxqySNF1bd1du
	3yQHBKxDWvi6AsNzXuuxRG1WBuWWUp9UQ8lzIqFi0NnzL/+Gm6GjZ2qpUhifY3JsOKazYCdVW9pyF
	pWdLWF6lZ/JiaQV55QL/i8HFx9ZWbCulV1IhqI53pqkhJ7h6xFNi0RNkejvhorG9FMvUu2lYzC++r
	wIlvsdfQtf0LpDtP8fu4pe+Nffsh6oKLY9PNuwwPnSN2tnqDXDGVIpGJ1FkVKqfpAIeciKeJmEEcA
	TY6ZiczsNTL5w9peXi2M2XIDH64iX9UmVPeEam0sw2s5FxlxIFPsTyS4yInmTm25VIh6K5/ltQ//d
	3WOMHdJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJIB-00000002XML-49wI;
	Tue, 04 Aug 2026 17:51:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJHy-00000002XAS-1gzJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:51:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H3cv2404785
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 17:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e/FB2kx9I7szAacRUGhC1WVT/Af65I0UeWspZWSP7bU=; b=ORWeJPoMLLMepr1s
	6QcDItsrz8IeEeiKKpbYuinRlbUWgarp5PqhYIEXVCdXs4ZL/AAK2zqrcqC0PlPy
	QalvuIo518qoK+vjrPAo7K95YAsTkV9JzGLvLl/EXCcD65DLwpe8yBwPeCbAVdDv
	TO7vD6KL7JuXxythsAfUdxZE4JyD1H1ncmwwQrfaDgkhqpBc6LZenRJMPbaxjyjT
	QPk2XGTV82DSy3bbxluKpLRvQIQeCo1DftwxphQj1Kiii/y6kxWWv2VkYr0Iag3q
	1/Tx8G/5cMZen5yU7oc5GuKK1zpRaThXyvh0cgAxQWYfLVH7ajW46LDR6GaYCmaI
	cAtKqQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56g7cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 17:50:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso61643a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865853; x=1786470653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/FB2kx9I7szAacRUGhC1WVT/Af65I0UeWspZWSP7bU=;
        b=JShz6jNkBCtQ+cus/e4SFkLpQqN+QE92ZyYQg7R9ijdjGwYsF98AskECmJYZ5gYeHx
         WYd4qUTGx3ymdbUDES69W8YyEAyzn58MV0Sa+6bB4DXN4KmVjeufoQwtX5PZQsjPp/Xf
         PJhDrcM2dwnJdEw0QZkS+/4pIdDCgrA93OR40J/dnp5gA3LgfSa70rkWG7QdlyrzRfp6
         JWGkB8t0HPOADxT5RZFraAtv3mjVYlHwwAy9g4KeVcxEsDNQILxDycwYd/nY/DKv0Ix5
         erLCD5MPHAaBHtD/jPe0Jf4OxYM3HF0y2MRcN+r5jC9IL6lMQsgRzh3tiTFl+CHmQ2Pf
         TnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865853; x=1786470653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/FB2kx9I7szAacRUGhC1WVT/Af65I0UeWspZWSP7bU=;
        b=hlMbRZ8S9D8vmZpCerwFzHHHJ6RlSfRTslRRgB80q0p9t7jpHkZBwl3GrzqVvRVSsU
         vtVyfUM/Owdd+BmTAuwSCqr+EqwWMVilQk+6RMyLvpkOwoCEtj7H82rFomOd3yFtFJ5V
         I3iYvwObyezhH6mb5+KpCcl+IXdlK4cnbrmo8g7P1fA35x4iefX+/F1+8gvBdCN/ErxS
         12+NALLPFDWYzi5X6huYudrwdjs2DjWzUx26PujL5ZFJSXjcB/dJg8rPmLDmCFeBfQt2
         PJwIcf6Gx9Z6IS9Wv/BXwzNYxmekLgE0eGFENZnJ1CROGvkCQ9QSg7qnEPKZKF1sOTTa
         LJUA==
X-Forwarded-Encrypted: i=1; AHgh+RqJ/dRoF1LLxwW8jmGhHHbD/TGuuKDtaFB6GKBIPxHcNtTVuHXWBi3L5XiY1KR493XFuknAqM1uLgJm+pqv9Jd5@lists.infradead.org
X-Gm-Message-State: AOJu0YzdU+NoiM23qSipPggfQtpjC+2LfEDKXS0gOXP46mSa63A8mUvY
	j3DWQ6sodPZGwla0N1F2tOozjZafJT5W+U/ZlS4dBBKaAYlFSaPiMVv+IFmazShob+Rgqiczuu5
	neuuhkjThxiDHBNa72ZaPRWcdO3rmsxZ9CcvxBbZdm8V3pCRSLB0uaNu4ZZsk/tyXn+SeYqbAxj
	Ig7g==
X-Gm-Gg: AR+sD13oQ7h54FR3pQsvu6/pu6JZjGeDhrLwYbcu8DDoLPEnFzIAWSR/05YRMEyjexx
	tZCLun1D47Vv6sry/NroAKP66wYjWuZqkRVUslflnra9Ghdp8mIxGwcOnVtxhyts4avu6iordC4
	smw66bwHARCuTKzLGlELENi7GLUx2YYMbpzfsbz60bRIBc3TvyIZWaStNdT0MaczkUAvLow0Kqc
	lGTf7hJdK+NuNFAvT+FKBpQtMEgdVQpGOOoDQQaToQb1wuUDM3XHUwDUxLxCW3bulWXKd7ZA9QB
	CU01gVycQ9SoOly12SqcPfmZgW8SOKY19+lnSeseY/pkis6pHgHKYbITJivyIofVjX5/KPCqC/D
	akTZMFU95XnJGxx0bEfmzjdcy
X-Received: by 2002:a05:6a21:a517:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3cb85fbda24mr449918637.44.1785865852794;
        Tue, 04 Aug 2026 10:50:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:a517:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3cb85fbda24mr449891637.44.1785865852402;
        Tue, 04 Aug 2026 10:50:52 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:52 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:16 +0530
Subject: [PATCH v9 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-3-39067760dc3c@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: jaO_EhQuFhoAuHAKSO18qVgHw0592vzY
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a72267d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zrNp7rCLQDew2w7GYOsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfXyMA5fDyD46tg
 aDjCBk/9BbtWjykCL+0a88NbUZCNLlImsZ0GGWOGlYKD7ExFr/dLJuRv3CTfc3vBfKAqMDUhMtL
 YbqIk5eD5J4ruiI3v8732hV5kXHLdB8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfXzFIGq4ja2z4u
 LKNVBcXX8TKex99W0CKY5wfGNMkLT3QQk0ubd4vGlaWQzNXUUCyOZJKgezzO2Ea4pEny8oSFxyz
 eXl5qxYoEgvz0uHF0ohUDMsmEzUzpGJ0FBkJU/50cLtmJYOLk8rj+5DD/AT9De6SkmWyL3d4qD2
 OCvbLYKzVqiQ8PCl/z++U17Ommy+CFug4FS5lmig3fD/wPvMQ4xDB4XehPcMf7GKfyBR8q7EncJ
 NwPafOtbxz+LKvxFZFkfS8qCenJXPkc0HvF6IyHS3NFBl+lIbhOwbR6NU8gZCHfDsMcCCKLa111
 ok0iQH3J+SrSfslUMvCptuy9H5O2yNu04br0hyxf7Z+o5DShGS3T2I/A5fdqYKaNzqSvWcuLr0m
 565jYO7I4121gCYA9hIYItmpIprDxL0ewFC0JaEbNyC65IoQCJZWtg5GMx6y7+h6lnHtBQ2Hsty
 +8bC2rrD5oJ5B/RLxHQ==
X-Proofpoint-GUID: jaO_EhQuFhoAuHAKSO18qVgHw0592vzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_105054_473886_9E6761F0 
X-CRM114-Status: GOOD (  13.92  )
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


