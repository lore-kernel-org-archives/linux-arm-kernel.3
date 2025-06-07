Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D262AC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2nJaAzmCmJpQHSs08XFmrbpQ14EhvsPNPiNTSQUelY=; b=sHOKxG318wv8llACMFusNnqArI
	go3zaZ1V32/gkbIIC7TAXYumNcwlWZ+XK1prSWTEkP7tBntGPnVaLgxY6TX4ytPHvtsq5hYySx4vW
	mib0WaQffGSi3a2hG84VT2g1WIgHdUkMESXEvarL1hWRnxErJLY+k2lnugEp8ZKuJUk7HfEOOIIN/
	7yrYsTogxf/QlJqo0Y7aK2J6OQoZaI9j/sgV8SnQn5giq5Hg+HRhpx15KQ7n/PO8enrXwrZrIfc1I
	LA0jHBFMLaxMrLbgG3n/+S3M33NBdccdb0WIV8K6KtTHhHA/w68fxKIZQG8QQBXmtshrNcbfZp+nd
	DIwdCpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNuPC-00000001kxM-3tg2;
	Sat, 07 Jun 2025 14:20:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNuKt-00000001kXG-0pak
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 14:15:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557AtEpf028727
	for <linux-arm-kernel@lists.infradead.org>; Sat, 7 Jun 2025 14:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2nJaAzmCmJpQHSs08XFmrbpQ14EhvsPNPiNTSQUelY=; b=jZGHI5nLZI5hGMaR
	gCxGHxaLP5Y1D1HwZx4aiDNjMae6QwfLi6XgAto57v8VLKsrSKKy9SoH8h5Oktao
	fp6lEIqMepF7jpd7hthOuLbX/BdQsJPvrWBsIfuoAFj9K8TfmuS9jqL8QGNBqqXK
	l0EPCW59iAYf0tYwu5HUujjbGDVLK1dS70Dq2Abw8lArFp2/kfQbYsLX4x94tOmx
	a5u+RAeupT5VKJ4c8/aYfvTMJI6sK3bhWoukt91F2ncPswKdDCYdptPU4Bx2aa+T
	VW3W1AeJsWzU6e6CgZv211VygoZ1F5EzRbb8yQOlW6qfvfvIfJtY1tZYej1dZU0U
	pkg75w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474asrgvhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 14:15:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235c897d378so28424255ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 07:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749305749; x=1749910549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2nJaAzmCmJpQHSs08XFmrbpQ14EhvsPNPiNTSQUelY=;
        b=hEoHS5cjrmySBOGqvWBHPHLcCmIeMjp8jigLCSuxaSsz44ExsG0xDdFfbgs7jMU/qd
         ErqBRVlrITqXnWR5Tf7b7JRZpeFqmPjbnibNUEYv+VALun31L6OaGt83pZlVyfrIXEBe
         EWvyacO7LG0k+QiIwqCVUmw1BzX7Oq8HOhqIc8EodW3LdVWVrjynt1dLjDlwYrtIYi24
         pjqJlUPo+JSlXsbk8bbPmvUd3YkctwhdGna9duD82lqMHvJTSV6xiYQcMU+wV8cKcoQu
         vqxqtJP6baj+2xkYbwCdV9dvP+7Z3/ByqOcnzXS3WjhbZgIJcydzb5Ns/4OJ0ooTbs1q
         QCLQ==
X-Gm-Message-State: AOJu0Ywnt6Bs+Lt7x0iNOmrXBB8OgNlpMKzRamETut8r97z9Nq5jF2Vp
	0BE5MPpcoxJCJ3r4oep92iCWuUCqJ7krmNBL/z1jacg0vAANa1r9ZLGWH7qi2rmOENoHfEHYo2c
	AXgV8yuvRskOQ4ZHbjh9ND5ol4qDM4AFqinik1l6/+OeDGSqnOwa1MTov7HYE2KdMGOlsvFbkTB
	PmWlrQh5eO+g==
X-Gm-Gg: ASbGnctMVoKwygLbsqEnxMLdzXz8f7AcY7eP4sbumYudxCmiFix7OGAk6M9j9n9c4Fp
	hThNwr/cUJ5Jl42TWv1ihNwV7MaDLUY+kbugGVCmw69W0Pn0jTm91fdo0ugSZITzcsgYXvcaBjN
	TiPSOi7WEX7MjFIrUSkCdMN5ZzpWjxo21guxQkvFbZV0XH2bTqQrOsJGGMAvs3sqqH9rrROyc/m
	K4mYbqRdcx+i65CEd8kkJhbJPfj1ed8CaOgstjwKCsOTahIfxlmLfOehWb31oJOJhvVWmkoJq7S
	2sfn29+8b+VdU89FA6Nfzw==
X-Received: by 2002:a17:902:da8c:b0:234:d7b2:2aa9 with SMTP id d9443c01a7336-23601e7f4eamr98882205ad.29.1749305748840;
        Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHd4AhO0+uyFenbxz5BoU1UkltM+5rAvhX1ayslAlVrN/dKMNnxfksMZHw0Th/YAjYimUSGQ==
X-Received: by 2002:a17:902:da8c:b0:234:d7b2:2aa9 with SMTP id d9443c01a7336-23601e7f4eamr98881805ad.29.1749305748452;
        Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 19:44:59 +0530
Subject: [PATCH 1/3] arm64: defconfig: Enable X1P42100_GPUCC driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-x1p-adreno-v1-1-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=768;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=IqnVoqmB8d59JEJdsGY4n78aKgioKIUNfsYGLkBpCCY=;
 b=orMoZgj6M4ufoVDkueL+fO7/LhI5JIhY3qZdqVDmIqEE50/Kj3kw5xT+6x+14Co9K5qyeq0t5
 mqNkL9pGnTGCbInzyOTHDsuUrJiX9j4N5pxuICrEcKGcCO12weAfn8F
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: PRvH17Vude8wJN-eqfVYiz9eoD3w_h__
X-Proofpoint-GUID: PRvH17Vude8wJN-eqfVYiz9eoD3w_h__
X-Authority-Analysis: v=2.4 cv=AMUSjw+a c=1 sm=1 tr=0 ts=68444996 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1cELwbfB7FenbO21xW0A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMCBTYWx0ZWRfX7SA60LJ9dBvx
 VkFqLo3EjUsqEgIxHK5qRzLLRE6i5g4w2+AsmuK7ME8HdRT/YGttUMfP3cP6aBC3/1fB7wGZ3Jw
 bVLHudeZC02yizc6nw83wrkwsozhJ7GVv3uo5OjHHybEqBChg+wM+yfcRMSvg/2aRusmzaDS/j2
 34+tVJDgWbc/szLpz349zu2ox0OJhg+dmFRKYCEfwC/4NZY5AirColaHIJSKR3UKP71L+Qe2G05
 a2IVfMwn3kbWvQxdEF/Ajpmtd30UjdrTdcd6ZkIW16Qa8fZrfZ323FDWTI/ioVUqgdWMUiQiHdx
 3rypS1xfdta+lcfBmnPqysYCNFzyqfvG/dibdxYpI/tSFf/klFl/8l05wCx3YVHW/wdJsiU/coD
 1KrWXdOgMTuxKTSfge9dlaLqGnu3mvcgfWXlUWgh5Ltn9+GjkBjmA4AJUrnb39W/yBtQ4pwT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=647 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_071551_358783_3F8449F7 
X-CRM114-Status: GOOD (  12.41  )
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

In order to enable GPU support in Snapdragon X1P42100
(8 CPU core version), enable X1P42100 GPUCC driver as a module.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1817bac291780dff3823dacd72510..9cc473fd0d3308f7869d00425e17b114c87093b2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1350,6 +1350,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
+CONFIG_CLK_X1P42100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y

-- 
2.48.1


