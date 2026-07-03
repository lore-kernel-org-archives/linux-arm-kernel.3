Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450B5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3Mr60y0+dO9JKpcFRd8+KSXVcXHZQThl+NbZHMGx/E=; b=n1ZfkVPbw2RfdiTOvfx4FnsbYE
	HaC3e/jaAafV19m/9XBH2tdqfs5bTflLK6Cs7Duom0EcwPwR3UY2Y+pQQML2NcgKNNXMEFdl/OkRI
	Rx0baf85AHTnDibm+Ob36MbVeBTPF9p3fO4j6zVWFCQGpHzQZLidvco7tA68UAMXXCIsZRZYnrX9B
	XKsxTl+OyxQvjAbOOi/afj540mMyC3vEcIV8fJ4mcQJmfWLUnctcdStm1Zoc0sUOFDUafgXN87n7E
	ZEyVkoNFbFUSLDf8a2/EXFEPwGlHCqexg8huaVh2aKGmn3BaMI886xqBoLnTyo0ryp7NWwYCctUS3
	xCXQ4OHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkci-00000007sQt-3V3a;
	Fri, 03 Jul 2026 20:36:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkcg-00000007sPL-1GHA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:36:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPn0W1019926
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 20:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I3Mr60y0+dO9JKpcFRd8+KSXVcXHZQThl+NbZHMGx/E=; b=dveUoURlYPAM5nVI
	5PErai44qS1UMMuNlvsWX+1GcwixZE5ClKW2MidRZEDujcUNX5k1DLccb/+8ixjm
	4Knjeh7HodckZpt8JkQIn+WOG97zt171QbUAn3uQjZ0fTK1QZ6wE26QuxLFBRoTx
	ZHL0QxBC1J7naXn7Xq7c6EuQpm1tmTI4BzNVDIUAhPpKDm146kTkisdrRoA2rGFs
	W/ziGpTcnX/Tovv8XR800cxXvTp38Kp7ZV8ZxcPOdht8VlvHqEWKAmpD4mr94jyJ
	v5fAUBikl/SyskA6uCGhGVo/qUsn8GeKN9XMFPP4zcMmUHMQbHFMhrA1F1F15fZH
	gHRppg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj1ngm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 20:36:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3810e5c5871so1434929a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110988; x=1783715788; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3Mr60y0+dO9JKpcFRd8+KSXVcXHZQThl+NbZHMGx/E=;
        b=JAik0QJY51A7ajYEylucS03GCY+ynYGmMb9ksG+7z1PKhZYKdc5V6o2AFibI8lA4ky
         4D+AIu23IzC3MgR8VMwM3ZLFuLuCJ64ZKnKsdUB6glmg1dyh0/Cek9J51DW84HNThWFt
         rgQ4R8EefCuantJ8EqMOxERLlqRcX67puM18I9cZ/0Fh/CP+ajb3+lLdf1goxn2Urquh
         JsXGlhb58ujBoD8dx8X2Cx69jVeRPLEkTuWmfFjYgSsDiaaWuE4DXnLaPWGqgtAIdZ7P
         bz3J1mGutH6sWDtAOpavwsCg7YdGOnfuGHTpVCqrogIPD7YcUDT5plgmsmcYWsMb6mxB
         4o4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110988; x=1783715788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I3Mr60y0+dO9JKpcFRd8+KSXVcXHZQThl+NbZHMGx/E=;
        b=KWZcApU3nAUDtfEdkb6oH5amTYbmW44uGUeSF82dkFf1ADAop3z9Q/0FoX3AoewRe9
         91rsDkOy2gXrEYBxBcv3OfQTmWoistTEm6DxlgpYJi03pmMID6Dx6xW/VPwRjr5I1usx
         VsOltkEx71fhHTt6nNBG1f+Y1Fz4LGiHi3ZgpltxUwZPLdvL2Y/tgGNINsRg1YGHYTz6
         rdFocurTW4j6Jk8BkGlDgdfEdxFj11RFBHxJnmYPRhDyKRbsRUHHEDvbVt4H8yggvjf0
         qW0jyvYiS7rHVFv+fr3YtKyUYf80SxNP2869iyW89TaRuXHq77B1SAA7jLAD5xBGLH5y
         sUuA==
X-Forwarded-Encrypted: i=1; AHgh+RrIRXnWHzxEboOTOTloFIb8aRC+6erX5BLoOyGd7mf4diM76LE4h7ZxkqPsG5qN5NRj0+1dpKvNEFHoZwJWYY8a@lists.infradead.org
X-Gm-Message-State: AOJu0YzmSCRoM/0aSV0C3weoLXnVDsavZltGoSDjQP07BzkfaPU0jcv8
	hr8d0dlQnjY+cE5s+qtCDwEr9QJaAcmSIyWZfgrd5bUKXtPKRmpezuh1tlZ5NRPz9P0jBkORBkn
	GD3h2JYy9LbAR6K1rGgu4uzAtE3JNQ5Q5nfgRF0gahiG/mroK2YnlMudYE28uomcS+SSI1ayWTg
	K+9g==
X-Gm-Gg: AfdE7ck1lMc44h1M/11mDGe6bSqXwmxd1ODIZ0Zt4MiLAR/BhuIZ/OtP+JKL/L7vJca
	zhQeopu1ExcIRVyPwp5ziIK0bbwTl6TXzgqMK3DuZAoR6QyO5ZpZlPLivwoTTzYtee0ZAaNpT+E
	q68/ddilah3SNUPrR9t7fJbrYE1u2kZEBMk5spomYnRS7wxYGTKqsaHSJNkM63axuiCbeJyITZe
	eetQACd8mRE09Y4ufA1/PT332GvNvRhIc9qB3uUgibVqDLSXakQRlcoon52LwXnvWntJ504U81k
	GA5eufZug61OlRVlVVx0kv/8cElDwBUTcpfiY2mq5MRkJRbhq1bjOCPibqY9W/HnX1mKqaDkbjh
	HVYw7158E9XknjLSA+xtXfv+5MS1G9A1fEWI=
X-Received: by 2002:a17:90b:51:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-382808b43cemr879972a91.8.1783110988391;
        Fri, 03 Jul 2026 13:36:28 -0700 (PDT)
X-Received: by 2002:a17:90b:51:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-382808b43cemr879934a91.8.1783110987939;
        Fri, 03 Jul 2026 13:36:27 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:27 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:34 +0530
Subject: [PATCH v4 8/9] arm64: dts: qcom: shikra-cqs-evk: Enable A704 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-8-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=894;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=gfyhHgOTYf7Emr9cLrvSN0kypJSlIEIIltSML9/b06g=;
 b=K/LDEKPGoZfUeH0tbE74ajfDKOByD2ZHrcPWd7L5t+EUoogX2zIW7VdSETU2ARUATIH0akAMR
 AAKcD2XotdRCPLTyDSnzTY7LWtZbQ9VE2nior29pU513KlghswTzcfr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX3dDuwu/9m1ui
 ypznTJWiw9nNjVM7czfGGHxepMRhuDpOCtkrJIAtfcY6s6fjBatHtR726z6gjdJF1gxVJJS76sA
 ZKOYJ20GczUd57yk8bGBc8k77X893do=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a481d4d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JW4bpjJLMT2bmMDKeKQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ZGoClO0Mbcj8eQHFrB2vnKie5tuHM_pH
X-Proofpoint-GUID: ZGoClO0Mbcj8eQHFrB2vnKie5tuHM_pH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX8KZMXbCWVzuO
 Go4T3vvACXBNMsQr9dVLPZYUN5/9QLQYCf2W5mIgNCH0KfRAejuHMm/rvX/BltM6QQFRsWJKh0f
 IfZcgD3KbRHxgxROy3EuL6nQUUGXwVnGz3rw/RXcuO9ncAkJ+qtWW1XbLVYEwAoJl+D1fUjIXjd
 m6p9fPhxIA2FMFhyz+eHRnH914HAEWjibtE+A52lq2i07JR0fSuSrE0cobowsDAix4hIrOYo60T
 oGk91lcMI65YLEDfsbqfKPQjkP6xyvURWXJpTV20kxso3/ppJMjGIvOJmsiXp5XXIdIssfe2l4J
 ECpdR7IjWi/CJ66vDCj7lUpARkOjFaDh8qWg9RdD46xGsmUNMIu+C26EjggLxyNv05X8tE/318y
 QOu1RVuW0Py2+pPIVFUjHJ098cjZvGT54TsqYHfWg7jhcD9N3J0yHB4lf6TT2DEEIB2Ho3pxmMM
 SAsIFs+WTxThM9ElVWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133630_466798_72DA6F87 
X-CRM114-Status: GOOD (  12.02  )
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

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra CQS EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index ccf8f856e994..a95daed1581f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -50,6 +50,14 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;

-- 
2.54.0


