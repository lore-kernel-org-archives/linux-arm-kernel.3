Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BB9C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 02:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=; b=PllDO3H0Opy965/V5QjTwgGCRA
	LsLzqB6skC2PQYqCFtvro5k/R51TnTBmLJEbiQi54wNwAFqe1mP9EXTtdptzUtH7AO8/z/T1WfMsu
	6kStrKgasvJKVK/kUyhSCguaDV2DbiXf8n5ylkFYVLerf+L2avJ0K0rFveznzsbmKdHigDFXCGEVQ
	n+0OQs6x/BZPPwC5W7Ucb8Ms2m2dCOOgRdLua6oznsBets7m23invZpV3lCi9moKnGP/Bdvv0+tYR
	njUDEuGLse6TIvrdNQ/Icp3usf+BFH2Nk4wALDmZ7WKAQ1nAQhBIGITw75nfTKWwgdJrVf+mHi3qH
	yxRsOljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik8n-00000006JDf-0pFK;
	Thu, 22 Jan 2026 02:09:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik8Q-00000006J1d-1A1M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 02:09:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LLOlEB484215
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=; b=BZMT8Z6aMJtCZ+DZ
	wUklgb+eqJn24hQv0mrEEtwD7crXLJ6a/eRC63tiFNslClsoD58FML5FJmCgLPml
	+V4f3R/4f7IUhJEEvDsmom518hdnVAyzFZILBU9DekztZoGZZaYsxKeTWIgkWYVy
	Y+xOvKS1algFUWKM4Et3pkWLcMMPe9TBu9jLGFXVK+GEsThGuwAXMtNMrnpBqRQC
	cYGlhPS7yYd0QUIi5BeG4XRfCcRlhIVeGpL9Mgvh9cVpJQIyz2UayEF5vZiLSR2Z
	/wDNKY102NxP+Ikyp4blk2IuzQ1iH1mJLdFEh9jnJOTdGPlP6J6GI8BMV0ymE6I/
	vGcL4w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pj0n8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:09:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7a98ba326so4656255ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 18:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769047761; x=1769652561; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=GXSfn0KqTF+S7Srq+i/KJ7G/Cg1uHiKNR89Q/q5Asfw1wwMubXUOEbGiIV/hNBO79B
         YdRzNssP2Yp54EoaYwvX4gMIMoYRga1GrZjTm6HUSMiIFRQSNjti7CXWJgXrCft8Wl5D
         K+HLzELtiIaAUgpjpEr1HBvU2F+uNFv75sEUHWLnVr9uC5rh7dqXKIhrRIgi5+ESgb66
         WiPG5xOmW4e8ikevPxyjJclFERrVES1pXgZ1r78MiSc88RPOTvKX2H8pgjRVgAbpLzNg
         7reIPmN+S+PBU2JxZAzQj9MBGF6eZhI3SOW527VMLtTfTlj+mt6XVOXRiw4+TzWwN4d0
         oAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047761; x=1769652561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=Ih88JmWqterUlnoY/i05VQjAUI8zVD+/xVL1EADDc9RMMV3URpANJLePpNOo52eVqP
         Zojl6VUj/rzudrCPP9gK9RIP/uY4a22UAr4FFLtkrXp18+UD+3BQaCYGcCiH3ZlI7Gqy
         6IX35vrsOgtl2Gs7rXD+6sVZAEa57T0NlzzsYT5kTdCmo/8eDuJY+KfK39VQS4em9P6l
         o4fZxHKTut0/E1PiWiJJYobtTK3Mc2zd1KQJjQQg/shZg2Iqwa4Ayl4+hPqdQtLf6+pH
         SZ+PWVBT1BffksV5W3caX9omUcLmxXedUK5MTE3sqxTAYi5ivosNQosiSWLzVt5nZKE7
         oUVg==
X-Forwarded-Encrypted: i=1; AJvYcCWJcEUHQ1Yce3ROBxFOFCByd3tw7jNKsaQCB6MbRq+TRX4afgQQ676jXBH+2yxSFts1MWvy18Tgpiex3W+Ucv53@lists.infradead.org
X-Gm-Message-State: AOJu0YyoOK977tnfwViLEX+8DmLMzSxlshgwOdP7CzgywDOpH2rOTgTh
	ZSqGYIiXzuMW2iBd5PnsXz5ZXEV83rxMOrtHbCXlNH1Y7usnMw5CrpgZ/xLF2urMGX4riuQTPbk
	Oz2dV78CIc9oYZkgkcyEraR9LowLBzfYlZsuZao+OsSCzkwl+U+obLtJMFY/8Xq9F958gX2eLsC
	SYiA==
X-Gm-Gg: AZuq6aI9ylnGooQuvVsfwoFd4yiKyhWaUQXFkla2BVVrdzERrhGbNCjsgcwtb3Ly04M
	D5IMXttku2xRtDZWxgdWudL33SsKEUM5Wy1lpKDO+rFEm8lX8YK8A44WvfeRO1NqzuMDBrDJEMu
	j1FX4v3u9UnPxlNpvFDo1QEYpOfgNdKfYRLlC4ifIFEXWqKaRvofAtXH7ypTyJiPqOoK7u2ChZL
	H5TUwNvtRtbUpXcCoLCmVm15PQcJS8zakyUwdqP9O3uglkV4Hr8vv8SDXcp7y7pOaWaiTeZxXxZ
	ZQpxLllzdgpfCrm2xNuuuTt639q1eiPxP4g3HjGC46punwQYu+MXCeNma4I5uOel9KsdrOJwSqw
	aiiSdgqho0dzdkdVxBFDARqy+Z7e+XuktzHsiBwPlwGY65WhVXetDxXAKxne86M9/aMyTw+ET
X-Received: by 2002:a17:903:2ac4:b0:2a7:a6fa:eddf with SMTP id d9443c01a7336-2a7d2f47348mr14195295ad.17.1769047761106;
        Wed, 21 Jan 2026 18:09:21 -0800 (PST)
X-Received: by 2002:a17:903:2ac4:b0:2a7:a6fa:eddf with SMTP id d9443c01a7336-2a7d2f47348mr14194925ad.17.1769047760623;
        Wed, 21 Jan 2026 18:09:20 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm49710305ad.18.2026.01.21.18.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:09:20 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:08:21 +0800
Subject: [PATCH v10 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-enable-byte-cntr-for-ctcu-v10-8-22978e3c169f@oss.qualcomm.com>
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769047716; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=U3SBm8Q4F2Lqg46nftP77Qbyf63TqJWnGptxyfW3r6I=;
 b=b0vwksCJSZDVDR3oLaXtrkBBvR0U8dzLyYweInT8NsLxQOJVcZxRM7jEzAoSzriNC6jVcmj4I
 hz9WDiif8OjAXAC7wlDvD7OgH5Qyw+hXKLUZ4uHJM9F3pTHesvINDnY
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=D8pK6/Rj c=1 sm=1 tr=0 ts=697186d1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNSBTYWx0ZWRfXxgFc/j7RR1MT
 jSBBQaliaRM5xG5nfS2KyOYNJS6o8VceMBVG1RDFW8CM7HOBtrQd1wzCNZ/jTsmU5YXum05Pr6o
 p0YBvZLKkAfN4JjvdLbvMPVcSP/bhDaJdX2uXtVwEX0ZDVkdJq8SRxkBhY/meAs0pETIAySRLbO
 Tclhrrc9nOWJllufcET7YBQgnA4Uk/2ZZe2JiavCbeVuX9LtsTTIzCb20Li0jFRIRuXfCe2AP7T
 XEeRWQQ12B+RRJbOoAPCD2QABLlNMK7vhFYkBEDE4byFLH4543AMlSpinMlm+GHsvdNDpa7TrLk
 dbPrAAuI7/cp3b3LV/0Gt3Arn6jSOVzVrGEyWIO76ghBWXCeioHlaKa2jaf5T7W7lfUu/lIMW3S
 xSu8w1xgLGvbzKplYPuaDvqmcM/jSo6oef/bv3UnY6gQbMZsalKMQZXy27He3+fQn2ntgUyI3HD
 Zc1mezDLNml2gCO6O/Q==
X-Proofpoint-ORIG-GUID: s9DIB92248FeRLBI5mcUjh9hygYXJiyA
X-Proofpoint-GUID: s9DIB92248FeRLBI5mcUjh9hygYXJiyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_180922_338953_7851FD53 
X-CRM114-Status: GOOD (  12.86  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..75a468ddbf53 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2776,6 +2776,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


