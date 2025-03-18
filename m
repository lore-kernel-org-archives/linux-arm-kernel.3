Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F371C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90Qa8a9JOpfX6xK3iRiQYBwU2Lz8sFA7p1khs43FFPw=; b=G9m0NDHAo8vvwvU6psVCQ7/9o1
	BwVyV/4uRyjlWCPYPCtLdhvSp+mu4407vx+20o8iheZ6sq0PYq5Nr80O1FWto75Uo8pKH9gZXAAQV
	Yi67A6UmwWUjT4e6M4xkkXCDUq7egdmcB2V8YA6NWJ513AKQ4I/Uh2GdcSCvkZBNWmVqzFlgDvUTt
	mVu6UdAesTkPdLwBSS1OTXGYts8xM++w998uFDbhIcCTkI1tsugwJFLm6IkiNKnUpN6wor43Tz+VE
	QtKM1+ESrwGfRrX1wA9wfLXTeBitKxRCSuf4oCZOVWrviCChPFUS9lrSRWB8FmVo9QGzeNfx7+Wxj
	3txyzxLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuX52-000000062CE-166Y;
	Tue, 18 Mar 2025 13:34:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWtZ-000000060My-32tY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:22:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IA4jTr027057
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90Qa8a9JOpfX6xK3iRiQYBwU2Lz8sFA7p1khs43FFPw=; b=EIt/uQwplWImJTR8
	9zCTrhS/qn82m3ayFhZvwjwBOyGJllUs94349vVEZZ4WpiezGeTrlxwrgEhlUPI3
	uoHOiCUwLh7qOAJhRgLzJefe15yvBE7JAMfLUR5M6oQov8V7Do0lLgc1gD5WW8GJ
	44Srqgdv8zgxmKOq3LEaSnEybTtBZfDGLe41LTglVDxahqnO3ZFH5q+Jl2wsxQOo
	9lkx5FjbsD5TvIkr0HSmD637LXhLN6CEblgV8J87pskJT4OQXxZkyBRD3VKlrD6p
	JkJFF+XC6IgaDHJgUM9it2UXjKjR03ov2/b6UF/DakvjqKXqLyH46AGlltGkPoyj
	CWA5Ig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtj1g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476664bffbeso110030621cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 06:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304132; x=1742908932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90Qa8a9JOpfX6xK3iRiQYBwU2Lz8sFA7p1khs43FFPw=;
        b=m7rHs2Ja/0wsFM4u+LvT6/aT9DAutItdnSTsIuoYi1+8bzEMXmNHLFgvaBckb4swmu
         k0IdkTQ6ZTDKyqNY/V2XiMBDZDw9UmucoQ3jnjptUORvQKakrcUDmATNxzrHgFChpppx
         DEKufmjVf+VCsHLaVFM2Mq4TiEX/OlVvR43C4NSl9WGHDgxgSf7obLWGhxMlWyK2Su8e
         pDUWWaVjRQgjTUZ03WKZgy5kvsBEtqhkw0cgU9kFZSiuTOw4u9YeKtdQo1YUWny1f/X0
         4uQov5wB1khLtkPBUcL+nOnbVu/LvQAwVCK4Mxf1a+1uJv2b77CrnAJpH0NuauatPYwh
         w5OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxd+xn+85VPfreHy0ATxSaNnK6Ie67shtFpsmhwA6W86g8YhinFzs/nNxoyTwMqFexgwQuTHmAZJSKe7nR49az@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjx3EKbsvSOslwquTLuOpBhVK+S2xSdg3HkHz2hC8NK+VQKDlk
	jgHgXOfU3y3/uHL4TtcQVHMlGZkt2bH/yR53cs0BnrQgpJAIXp25/DtXoHSzezWtCtMe/w4vObf
	4ABXiZUxULIqh9jg9R00MTtYXjcbAOlMd/ETmzUxnIQsk41YAHiwVw2aQKNzjQ8EdNKZpIjNcdQ
	==
X-Gm-Gg: ASbGncvpxjNLa9WlJFwzrwaz3b9CrLDgxH2/wvZ7HTW8hsSYwpukqKQdI55FYQvx7Zl
	SjFfcKQrRdJ7TfXLa5D/pu5d1oO5BYcAdZNd6hm28oDabv3o0TtKVsGanBKUbgwFlE/Qpfj6twe
	zJgijOoLGL4nxYYw/mPeD78FEFRNyz+g2ZCxXYbeHqnBImBXjr5mK5DF/N/F/nTxBf0H1fSYs2E
	hFkO1m9I0HIAWbYTVTVEgZnCWLObc9KfFtTN4DlIDvZRDBr9zfYCvLdwW9yvGNV2PUNX42HgJSL
	pgqummbzTJnjn06jZ4fyDyAjVD9xnyX2wz3Z7AmvbxbfR7bb7GrTcVLjcz+TBD3q0rhFg67D0In
	fWL/XQLkMH0smwwtuADrUF9f9vwNX
X-Received: by 2002:a05:622a:13ce:b0:476:a74d:f23b with SMTP id d75a77b69052e-476c81edf41mr217060281cf.48.1742304132084;
        Tue, 18 Mar 2025 06:22:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3cOhI/uaSCyn0dHPO8pflDCmqzgUPHvz/xK7Lgn/iw9/ohToEyaGvfEydfUSRss7Lc4O3yg==
X-Received: by 2002:a05:622a:13ce:b0:476:a74d:f23b with SMTP id d75a77b69052e-476c81edf41mr217059861cf.48.1742304131746;
        Tue, 18 Mar 2025 06:22:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:21:59 +0200
Subject: [PATCH v2 06/10] ARM: dts: qcom: apq8064: add missing clocks to
 the timer node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-6-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=945;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A5b+7PiOzdnEsoIXhJtEDtIF4/+zzwMq2jbAcRXdx6A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN1GNH7XEZ/cKYsIbOrr56agd3ol4ShkdTzA
 NU7LHgC1bGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdQAKCRCLPIo+Aiko
 1QSVCACCx/SRir78Lqxpwe2gj/DnNHmZ78WE7r/CnzspxSjw6HD62EeTXRvoWunYl67EbK+lxae
 64Mnsdd3r+qo/eI9qE+skbsKEG32/VGJy+58d/98ZTbBcy923r08CiicvsR+kDNCcdNHobyjaI3
 u+qm3Utr1pOvTz+Lh0RrCNCd3Zb8wmb3Vmomvo9w341VTwIIG2PXGmLs7RBm1Ppm3uhUYhcYza1
 0r6Wd/Qgq8ripF/dL25lQlAAIFSPt/IJzptrL24gjyLddCjdBadIdNqM78ErystrwTtLVpfSffV
 WUWaN337ADz2EGHX3c7Pxfz3ePYNK2SHrpSHBmbjiW4RzhUM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Q7MlF2TOVrRuHSQZ9B7_QslAGXk1HNBC
X-Proofpoint-ORIG-GUID: Q7MlF2TOVrRuHSQZ9B7_QslAGXk1HNBC
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67d97385 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=ZANWpg7mVWKCtM2BIo8A:9 a=QEXdDO2ut3YA:10 a=mjqSHpV9Z7kWhFShES6D:22
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=907
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_062213_760865_A2805C07 
X-CRM114-Status: GOOD (  14.09  )
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

In order to fix DT schema warning and describe hardware properly, add
missing sleep clock to the timer node.

Fixes: f335b8af4fd5 ("ARM: dts: qcom: Add initial APQ8064 SoC and IFC6410 board device trees")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 5f1a6b4b764492486df1a2610979f56c0a37b64a..ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -326,6 +326,8 @@ timer@200a000 {
 				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
 			reg = <0x0200a000 0x100>;
 			clock-frequency = <27000000>;
+			clocks = <&sleep_clk>;
+			clock-names = "sleep";
 			cpu-offset = <0x80000>;
 		};
 

-- 
2.39.5


