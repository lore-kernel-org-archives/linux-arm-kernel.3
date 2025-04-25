Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BFBC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjF/ocdHV2gAOAgtlX9D3SCyO40KdLlspPA9rA2BnyA=; b=VGS55gkhgy4KFYbZIDU0A5nrDJ
	1wsYkkn0nlRYBPnjtcT+SbfXzYt8oOP6FzfFgAJ3js8cA2SZYPvZl9W+nDg+jYDggVxsuzf/KuONZ
	5hC1/2vjqBw/KuiL/MUZkaqoIOF0pKYoCkNlilxvQpypYPt64t6k8978zBvlVjdekaPYw7Aujy/Af
	VRn59hWZco5Um6q1Mvn7bnRINE/gaNj6NUF0YLPkl62IAZznh4wQNZ8R+hatiyyTYEGzWcrhM7S8b
	3/i6WeMF2nu/7WWilCq1Kwg9D5Uo/V8baziB8MTtKyOacbLd/X6j0B+6tgWgGzcS6KvjmZn0tVi3G
	3020K+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NWV-00000000VET-1xIW;
	Fri, 25 Apr 2025 18:11:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N8u-00000000Rb6-0TKh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 17:47:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJvOA024825
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BjF/ocdHV2gAOAgtlX9D3SCyO40KdLlspPA9rA2BnyA=; b=V+Bqg/RcdzT6KK3c
	cQIkvHWyFd1pkKlywurOaW5Gq1aQBf6cVxTCqBl+1M5kn2Aq8PwrUzQk2LaIrT+o
	bF7zlUe/WuN9vewYuvt/ZYAiYLjL3KuLaXq5eaUqxR+os53ALVovZjTOKQhg69jI
	QuKCcRm0ex9yQoSstYEBx8ZyuRP6x/0N8vjLHBG0TkMxzpU8KGe5OKK2v/TopVAZ
	eLOuw154spYTmsesDJ/PT9J9SsVXWycJK4fOWiM96JecChL2IwkShS1OgcAcUh2H
	LMSNPB+sPaXK4K/PDTl64NpoRIFJEaBoeZCa0DLczYw1oD2h63PwA2e/T3sEKXNP
	9UXJvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0srcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d608e703so460069885a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603234; x=1746208034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjF/ocdHV2gAOAgtlX9D3SCyO40KdLlspPA9rA2BnyA=;
        b=HJFBfJX0Kkv+hLnyEWT2FiP9RzEMRYwQR2UzQMHVPyd+aghKl6cJ2JAjBZ81gB+cnt
         NhjwghXJqhGlKKwtah/g1QE+RdXx+NxxqnOtoh/+26CaDOONPAgTUP8qQnX6ouna5Cax
         6o1Wx2qeXPwfh3JFUxPb0AB4xFy0ZhDXmQ9MZZV25F48XYCnuQv3RWke6bpBhOA5tK85
         WRVEpOlbgHYvZutySPuT3JPSp83P1FaXSmG6g5EELPGK//i5gNu+QTtMA+z/Beb2z3SO
         fDEGzG1z+5GaBtAWPAYF0sfM8HTc9bLsmodlp9fd6EdcGYfBr0eC3BOvWRt4mhit3fuX
         16KA==
X-Forwarded-Encrypted: i=1; AJvYcCWb26GvyfJ/7J95fNxk4sa2DcgGEgmRWisntekS59Oem5m+QwPplZoxrfOpCkn81cvH45uTfsTcMNag7T5Myo9/@lists.infradead.org
X-Gm-Message-State: AOJu0YwcDUeBdJywMZJ9j6pSLVBHaXkBNr41J3ln2ghXHV/ulwAxQmZK
	4sZZUt7MPp2BcYVsm9MIm9lrDJmLC0AWti7ucnLqoKyKusYl02/b0q2AkfZuitoXafzzWYHF2VI
	5s9Axh08XLMs7CWf48QQtxVYF6hJThSGEBIywP0VTNrR5IM0aMTtoa7DxI+loctMsDoP5R3ISPw
	==
X-Gm-Gg: ASbGncvjhZZyUwAj4PIQL8sSv8mLTjgNkDN3AtWaLl3DnQj8Ldt+ucTkDfn7ro0EmSY
	hw6g6DUy1tuN6LM+iYNBTXPd6PPPTfX69YDrpW83UZmT3qmjslPaDzRZC448Ify/AB/BprzT13o
	HvWmgo6+pY3oNKPXXMsh3iDMAO2MxYXEo1C2ZmwLzlcJjXK0hy1W5lRSG4JGGoLSw+TyEnWQNvt
	ycYmZ5GItQHlsNeeRd5nVd/e40R/EG4qxq9LDjyegq0ZXAqWtAi2xX2528g9cUVtlUueLc4xWoU
	RU7Buj4TT9BrymIr9fz1I2xwpAgFDjw3IWgVVsRnmxELp0VspxMYD12MJF/GAytb85Q0FMY+apx
	skPwUhu5nq/hQYUwxVv0ajsmw
X-Received: by 2002:a05:620a:1a0e:b0:7c7:b5cd:51a1 with SMTP id af79cd13be357-7c966863fbbmr83347285a.6.1745603234504;
        Fri, 25 Apr 2025 10:47:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSC+mrQTmJAdkiOE3OXc2MIEiYkLXFJcskPVPXwApFb7peHxl1WSu9sWzzLaO/eLY6YEKXsA==
X-Received: by 2002:a05:620a:1a0e:b0:7c7:b5cd:51a1 with SMTP id af79cd13be357-7c966863fbbmr83341585a.6.1745603233997;
        Fri, 25 Apr 2025 10:47:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:03 +0300
Subject: [PATCH v3 03/11] dt-bindings: mfd: syscon: add
 qcom,apq8064-sps-sic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-3-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j8aNBL78dlGDp6ubghqzb5EpCs19vQB7AjDT5wAScrc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qa8ztCVKYupyqz1bBx2SuD7HM3caM8S/mFF
 uCH0M57RpiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmgAKCRCLPIo+Aiko
 1co5CACoMpRjnOWlxUFIB8QW1xMsYlnZVHnVraKNEOF0xjhWGcflfIJyz7mCkSMMlavmMOoSkJe
 yyw4PQ776bnlSBEoaSGfg0znia2ydQGfobv64XjpoBUinXAV4ls0Cf2z2vjOFpZ4rXU23pgEgz5
 w+czwzZyUOUs+eiyeaUlGR8Oi4UvPkEZXW5BR1mpse2zoGgmJ9NIZU0FycvbWmxiL7jX07cPkpP
 LUrMZ7toWp17izg4e7giy21X2M9YsiVnD/sNyEwKdEn9+Ibd5gsDGND7ZC6FShE6wxFI7C5QGLt
 qU4S31Y1M1/mQUCDWKRMjBiJ7HFJv8SJljn5Kt9fABNdhq//
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: bnpC9IuymJHE2wQdNHH2Ywoxs8KeqfJq
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bcaa3 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gjla_oY5Z_Fy-GYXBTcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: bnpC9IuymJHE2wQdNHH2Ywoxs8KeqfJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfXzYm25fQei5qd TykBRi5GrCfRQUfaGYsuEm56AMwDy3vs4hfy5FfqVDyJbTkDMt7GA3NKGDzYt1Yd9cjUvCyZwLW do5Wq4St0Y/0+pldURM03mm+zjCr5XQG/431iYPGhPbUSJCzVRyh8Ak3FujsUKOT2IP+tLKRQns
 qzjsF9Oe8pvrO/shUSgwWMin1ewY4RnrgFfg2G/m7kItYVgpj55Fu81ztK58/r+niudQfMctga0 FGFnTjrdkAQM2CjhX7VUvCHhaxVCBSnMd4fyNlAAacywumGLSGs4USTFOmcA7LvfRNFBBR4HgF6 j2cHRo750SJDUgZbPiUC/YFDCUdxKQtWKEQ71+d3qy+Qq+T/bYT2ubsSlSun1Py76JB5G4Bmt/z
 kkkaEfX/G96W2P6OSOmtVDVRU27JRIWaOY6VtvjZ5DIvT3ERN1YeJJ2vQeVUJFqwlaDTOsGf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=799 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_104716_277398_AC8782EC 
X-CRM114-Status: GOOD (  11.71  )
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

Add compat for Smart Peripheral System (SPS) Interrupt Controller (SIC)
present on Qualcomm APQ8064 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 0004878dd0da7e9c84675afcfad7a246c561eee4..b600edbeb56a5d1a95e3bd23daba677fd1437356 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -99,6 +99,7 @@ select:
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
           - qcom,apq8064-mmss-sfpb
+          - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -203,6 +204,7 @@ properties:
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
           - qcom,apq8064-mmss-sfpb
+          - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos

-- 
2.39.5


