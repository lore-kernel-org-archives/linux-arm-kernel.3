Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8E6C98308
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 04:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYbeAaBWwMNQyA41pglGGE2kILDe8d01HKFX1vOZUNk=; b=Xoz3H22OKNxj0fGKpr0zupdELI
	FQ3MN4VK8r5J3Iwmq1urAe73AjU1SeMvI/mOGyL0S3wF8jXmSSgUNIeX0AKBlZrYnjGJ14CrOJQWc
	H6z1Ilwfn9Sde7TfS8LS1f+5N7Dyj1jAvwLMtyOLvkBdJEX68ZD29ZHbFxkWat7H7cuC+lVPv3U7S
	eFWXSzzGd1Va5JBoEtnHCO1ITwScIuC1hhF6fDn59nrgzkjsDbm4Q54jH8RqZHsppuNzbRFO9WEQf
	xBsg2dOQ9Vy3K9VPWwzJPyt/aT4x2RmlwTOEbN3rwyAQev/bDZ3n+KZgieS/9IGGqv6OQSL8vGv6C
	nHT7t8mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9F3s-000000078v4-0VPv;
	Wed, 23 Sep 2026 04:58:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9F3d-000000078pl-0Gfa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 04:58:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iWNG2728527
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tYbeAaBWwMNQyA41pglGGE2kILDe8d01HKFX1vOZUNk=; b=C1M5y0fh0hFUgnu9
	qhDQ/pYNNM1LifxWbumiwvgC1iagBuzhYm2rdrKKGMkS4H+L0gkKc2aQRwcVm26k
	xohm+W6P/7VZ/FnmrNkTAfxl5831JPdTdiGJvTNLnhIW4F9oiNftPBKsgeA1EK3z
	cMSMrePk6ZOHmsOlFYBqt9tfKzl4PUPN7LR+2/Flfzaf+fD8xGw5o7RntYvQVvKQ
	AlYhDREz41uMaBgQOVMejJF4qWfKyYKnd2uBFKJkb0xhLXWYYE6HgfAxRhfFLh1z
	UjoMsH+baac7fiMjvBdj+XXJG0KC7OLM6WA+3/XajLclLgsRk9n4NAUYj7bj8vcj
	6RN7uw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xtjaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:58:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3286d2bac04so541594eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 21:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139491; x=1790744291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYbeAaBWwMNQyA41pglGGE2kILDe8d01HKFX1vOZUNk=;
        b=FLL6H5Kq9FApQB9oEIEFDDYC7a5U5UyaGA+XZtoMPLGNP4ObqK3fj4n538Z98ixL6E
         PuSULCLBHoCYdxOLTl6/Wv9P0ppRz7nrFlLksG6qzGrqdemHgcBEqORl1NrDx77KCCty
         Yqq00nBs90Y5QYZHAgppw1ZQs3a4seo1mGh9H1QV0a3IC4fEKnNn35vjpz6XUdq6JNU/
         ss87V3ULrFx30h9WdV4zdOh29lKxuBEzvnk2fmQn8+Qir4ZmZWVc+rrcoGaZfoJ7Vjaa
         3U3A7AgKX1qTkHo1loA6k/O4awSDhP0Miwmac7u6WeQ72YPXXyc14pK9xIt33tw1r4At
         /pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139491; x=1790744291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYbeAaBWwMNQyA41pglGGE2kILDe8d01HKFX1vOZUNk=;
        b=T/V0A5hKtvmK6+m/rAR031q+rWg4Mc/OvZXXq3lE2nlCjGu+dxD/0LCgJoiObAUzMr
         ahIFKYjv+E1CahyzMFfopn3mvBfZRCvH9I9M3whX7SXEMGro/barWNICxdzPswfmYzgY
         DkpMK9msbFuclab4aLqyQCI4+npzYBFKaujcTMwsOj+JuVBpCrlsANiZv+B9GleZ/Wh7
         IfPK1NooaWoZ0xaS39V0She+356CVI1YnLn1AIbziorrFyC786vTx4uIokrz5jD0T46q
         jTuy6c8vd16pDI924pn7z4Zuf1KGBp7e7uU5mTeQ0Scr1HCc5bpo9JXpbmY9lb86ZfqO
         i9JA==
X-Forwarded-Encrypted: i=1; AKwUvBxyR4Awu6OhIiyHkUCbmWRD3CZoug2SDDJajYJ2sTt6qSEl4JER6HhiWrtkvm2GXZPk4B2/22kTN4at36XiKDZY@lists.infradead.org
X-Gm-Message-State: AFuF++ljL+HVwHnDBh1odH0n3MZLW1pASwj9K8ntHMwRmgYRV4YumH63
	X52jLT/ftFYQaCcxTuPvkRrz7VydxnCuQBbz9gJVV1JSyYMQeDPZLpiqrlg9vQHylhlXkYFSM73
	R3agJxQ+N9hdCg3T4eqxN8R8/6QNhINPjtpEOFCXZX0IgxvrKFwNb4etIOR1s7+yEq1JdRbsz0B
	dk6w==
X-Gm-Gg: AYBFou15ODvCQRbjie4tV1q5f+0EWivrgqS1bJ9WMrQUkBjH5I1CEH9djKVDqGO71A8
	3yVBOv8PatXcdjHT1BaVbpPtc2MmrUjPigj0/obBmi8FKeMCNSbgQDT6w/g5eqbNTxIHigJRiB+
	/MwreRnzXEUksHDIDv1x4ClEbqiN9N/yjNYBkvmRGW1AJLhJnb0MqLvgEWxfnApNW7pAWvppAAD
	qITHYMXyWJYbcDVScnniXULVPvyipgifJCcnjBqWqvmrsesH5N75LWAtL+uJTlRoRP3gRTZC/UJ
	O60gxNLzsLIc1Ompdsg4/llaEr9R6lc87U9CU2q3PmCgN3d5i8yb08sMsH+/Iwq80rz0mKB1rOf
	oX51mkZ7I7kD/Aj9Fpnva9qJ1V12zRA==
X-Received: by 2002:a05:7301:4393:b0:33c:1b80:8ae2 with SMTP id 5a478bee46e88-33e8ea84a8amr1335477eec.39.1790139490896;
        Tue, 22 Sep 2026 21:58:10 -0700 (PDT)
X-Received: by 2002:a05:7301:4393:b0:33c:1b80:8ae2 with SMTP id 5a478bee46e88-33e8ea84a8amr1335426eec.39.1790139487882;
        Tue, 22 Sep 2026 21:58:07 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:58:07 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:27:30 +0530
Subject: [PATCH v9 3/5] arm64: dts: qcom: shikra: Add mclks pin
 configuration for Shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-shikra-camss-review-v9-3-09f5fbea1309@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=1600;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=oFU/9yPXbZMIVmz7A2FIB8gBUn8jREr8ifXNqaMGDK4=;
 b=cYQTvjOakOXRnxQNaRT5qnq52PSjoCveEleIHVwfp+U8xTSS09RmcpVRgqjUiILafLCZa6+6v
 pWU/uQDTAVwCJjt87ewggNrsjGJyQuO1rWfhdTti11jI5FgLPplQdfH
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: Df8MKK_CZVplvfsAIVWYsXtDHno4bm5B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX0MN1o3pP13HF
 bNWvI3ZoCgICsOb2bIsVnBRrKt5EWe8GNNLTWFbKlIRdVlUdav7/hfydeexh7B00Lp8PFcuLMM2
 uaMlaDfGJ4KsAq7cdxHQO/f5nRrTbkeSyYLglV42OAnOUp1Eb28qyHaD6CNgot+2rA5hnViYiL4
 G0gCZokWCxqL78Ty9G1+6EfHaolrI6/9d9LW2UK04T1WBfrqfkD5hgjF3KX/jfz+QzXheijaCX7
 HQVBADAs5F3Dz/mAN1UyGxiCmbt/AQL1BDOsbnhWYCzlI7NxFj1RBg1ZMA7wgx9ZXU6Z1nbW6Ux
 IX2Ql/+Tpi7oheSa7d0wZywc/ehuQ78GZ85uPhmR3yJu/cmDsM56zASqCb51bZMbm2C1RocrKNJ
 fcnhPicL5JCdycpkVytR7u6XWa6Iv7JT/ST6VZXlnx/ezoULqDCC/bljb2Qg5ui1WHbCp4zv0cC
 6K/d43N83jReOMhhipQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX/DSeDIEd63HA
 vL68I/cgiQ5F9tSTm1xc8HHPPkYs13276QRhKgFolauv03SjPu5fneyKiIRULEg3gEjmhmmYjZp
 YRF4/XCpOP57qh7Wcpga4JbvKqigbDE=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab35c63 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Df8MKK_CZVplvfsAIVWYsXtDHno4bm5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_215813_694177_89D4CF42 
X-CRM114-Status: GOOD (  13.66  )
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

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index ed73603c3dd81d92d84c91b57e33154a6fe5b470..580114806ccd0209cc5c4e4b05b9f321e6f77cfa 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -924,6 +924,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1


