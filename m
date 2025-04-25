Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E02AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8yxRMa5j4oUptRKWHe6HWZoaMIYXuESwxb2I3uAvtU=; b=fI/zY+5c+xKd9RKk0JFMQUkrEc
	hwJcOU9ubHCanPs46o+bEeN33/i4C3xQhzBtFkow/H2vwpf7Q/HvIYEbMCDKuIIRuRH6up68fRH8u
	wNk3H/Evwcz7HQbvmxBo9ThOgNPK4IkWshJvPFK/V+MTeXMSFt3e55Ob/iMed6eNw8JtIf26ocExg
	VVi3WqZ2VaD08Lg3WjS5G6bdxURdkvGYGDB3DJCdsvGJEPTxl6NI+g5klFlQALQMkVT4vH3V/HdBM
	JMnKHu33yq8x8AQGzkg5UR9zyetvcqL1nZFgrjTNhpvqh2mjPBp7t/KzPiZdjY+2zCaZ0RRpaMQkQ
	nbKOv2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NhV-00000000WYH-2DKU;
	Fri, 25 Apr 2025 18:23:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N96-00000000RfW-1Y2Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 17:47:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwGJ032085
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L8yxRMa5j4oUptRKWHe6HWZoaMIYXuESwxb2I3uAvtU=; b=Xkr3egGPvQBMqfvZ
	sHfJnV7mOhh9cU8rDpnIyogIh5trcjpGubkLRxGW6stErGedhZciMiZf3SzO2grS
	l9RQ696ISHdprxMvlgXp12YInFEXFWmCP9AqxUOPAhMSx5Kslc4Cj6bb4BKeTmHt
	I0LP3aLbpYOtkZqFHgxfV4rIEO57oAPRUBRFLp41+kLLdqt1n/bjHP3xrP2Bo9rE
	hBGqKvHszSrOA4DcIf/mctY1ytr+0iHf4031VExvKaDyWrgyQemGhsU5r2pJCsDA
	qAw8QTSwnJMWGr94lmcALuRsOqppXmbg85a5p/7VSdYjLQwT9qcfoTeZToBApM42
	Bz9vmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh19r8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c92425a8b1so419610785a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603246; x=1746208046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8yxRMa5j4oUptRKWHe6HWZoaMIYXuESwxb2I3uAvtU=;
        b=p4xxLExz9AmSl6Lrj8X8nL/L6v5m2hv/chThAUvG15F7h6E6/tzY53LfkYizy6OwDY
         b0qv5l8mx+0skNHnElO4572WXYaBd6A4LyXNfwMfurp3tTp4oV6ALCPjSIzMmacHQ9lA
         n7ESNU+HOSyT8PhNSfbby+9vXFrPPW9I1K4IqydWnvVRtgDih0jCCFSkK23Qln5JTgg/
         q7BdHousQxQXwjl30XYCy295hDuoIVMiGaGn4GaTTAATpNqUv/tpZh8TCfzfDybeMMiC
         hFCEUYpiyW6jzYuAdE4whhymPSM7Z3h/w8OrN8P5JFtElKHxiZ0sbCENq+tQLKDxD7fW
         6xkg==
X-Forwarded-Encrypted: i=1; AJvYcCWDLl7hNrnvFB+dpW803rkmJSO5HFf1+ygQWQ4W57iqLbgqdI/9sw7sXiL7gM2soXjG6TfSkom6ae3cCKHhPKhG@lists.infradead.org
X-Gm-Message-State: AOJu0Yym0YjCzRWk2PcnLAlcOIDeu/gU7lRGc4sUWargWSR724TCfWMJ
	tS+Mui+IL68EEsUhhubQTywJVqhyuFcQagJHjDSOepQX09ImMcTMraLbV9Q06cw98sPoivyD6LE
	Lm/5DNGlkVbkVHpi7oQ4X+94fjeKk8+S8iUwXsX2SVJoTYK0hQMmL8K4T6s/KxLNW8ubPi8yzag
	==
X-Gm-Gg: ASbGncuztZYoBl1Hze9PnMXdP938ZIPtj52FsmcpIbRyMCLmQw308yzCd8CYIW9Ki2C
	FbWqWKDRvjj2moWb4UthTTpANkpkLHeHtHJsthY/HDtjb/ldgUDWBE4l2GgzNAeg19d96EvwTn6
	/ifukksGlwY14rAXZ2Sx9xb4zv5Qp0kjxyTFjdLkbpLYUiuD6DljrJ+Gm54U5OnKrV8R5rcTm8B
	m6CICWzFxiIw7nSe1GgO+ZXWzR1tncXe9vH+Y4l65ffGf/LulQCKKAQffOG1AOx+ic3xuoeOowB
	WssBwLMtLHVliirR3kb5vr3ejffFyOfKllEkuafbM/besUN99Z9HtmM2vnHRfuBH+lXlPD8YuWB
	mrLYYWK+S1gujmZYfaZarUPyf
X-Received: by 2002:a05:620a:2806:b0:7c7:b570:e2b1 with SMTP id af79cd13be357-7c9585c34e3mr1115673985a.7.1745603246469;
        Fri, 25 Apr 2025 10:47:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyO7skjdxEitddsiiY5N9GZywVEp5UO6PuVT+RDOkZj0UhA+nqJkEF2t1jDX/OPZY2TrG84w==
X-Received: by 2002:a05:620a:2806:b0:7c7:b570:e2b1 with SMTP id af79cd13be357-7c9585c34e3mr1115669185a.7.1745603246100;
        Fri, 25 Apr 2025 10:47:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:10 +0300
Subject: [PATCH v3 10/11] ARM: dts: qcom: apq8064: use new compatible for
 SPS SIC device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-10-da4e39e86d41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rGO8ljRJj2lTMiYab3pEL79ThIPqrqw2LC84J1Wlwas=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qbH6ks4F2IG+geZ5nLFwIQL5PdUZWUhGgvS
 bsECHmZTLeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmwAKCRCLPIo+Aiko
 1W81CACQKxfSv9/Wvb30KQhe+Zl+zbWPGvxuxRYx+QZjGBjGlV/G5PTEoRk4Zun3MN2GndY6+1e
 mkHqQybOLnPd/UaztNZPBj8yYPjC4KLEYzL2ftMjk4uU2Ytjuiq4/RI23IGqgFN5HqhdeOhluFW
 GB8hEnBc6FQBDM85AJ+pZmR67gt8249s0UYMW3YJwH+90zd8x2VzUE0055ywB8k9HIUmzlSsMjZ
 8kEZ3O5+fOHj3iAU79FiGZloQdwzcrFZ/3A+c6k3RFDLK4j3ZyNbH3V6zUvSEcDK8JiRpFxm7RJ
 5586h8evUzfqCB92ud4/C8JvIPndzud9uhp3vVGfXeKMlLcV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: oIfCBNaCOzM5jnmpZlZXMON0-_6noIO8
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680bcaaf cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=p_EMIZExALG5VSdhSekA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: oIfCBNaCOzM5jnmpZlZXMON0-_6noIO8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX6Nw21vgIPijT nccj6nU9LDbmAnTJ1Ns1K6HwgCmTb5c/PStAKwDbP3gp8gHOtesh4UukRro7EdkKa5K6xb/4oT/ lyflOg1bGMWRPxA2EW0/7iV6082qmDc9LAnJP2/CUQjbCIr3md7i0/pU/VHiAYMZKXQ/5nXZnXa
 QmiFKSyKg+xO+Kif1njDTsnaZ/RukOTe7zWYBu4zW8SLBQZ4emTdhSuc1V1r/9Bs44axEvnkoYe Ylyj4qutZ9cydNcnz0mT4qg5KtDculAYKVUk7xUWBgJKnyvwMGQYDtezZvrwNVlgFHF4JbmmSd3 ALSJ07v2FYVhXLy4zB9km53FslpHdkfhjywVsPdt5vlmhPI1yHtdyd1ThS+QEiRx3go92rw4OPY
 2m1BgH/z+VDXkoTHm6mahMRJgqpdGD4G9RbUni6fmuSFgKEmcFJfBqqdJIztLFpAnvlcMbM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=629 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_104728_535354_3A0837D2 
X-CRM114-Status: GOOD (  15.59  )
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

Use new SoC-specific compatible to the SPS SIC in addition to the
"syscon" compatible and rename the node to follow the purpose of it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index a5aad4f145dd368aabed44cf520ffc037018b37e..b6533630e347c8fc5e3f0791778cd05760b3f3c8 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -402,8 +402,8 @@ saw3_vreg: regulator {
 			};
 		};
 
-		sps_sic_non_secure: sps-sic-non-secure@12100000 {
-			compatible = "syscon";
+		sps_sic_non_secure: interrupt-controller@12100000 {
+			compatible = "qcom,apq8064-sps-sic", "syscon";
 			reg = <0x12100000 0x10000>;
 		};
 

-- 
2.39.5


