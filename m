Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C8BC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VagdqhLUqQ/cHTS3wCaLxpv5RxPWVf0KWqzjzsj4gTk=; b=a9njkje6vgsMPKIsBp0eZBXY62
	g+idJFcrf+VDvuwtLut5ukDEmWzmF3upSsGajFF64r/QL4tUhI9b6UgtJvYh8D/guVQkK0qEmfNGi
	aB+lZVfgIwf/0F8LbIoK5wuixi4SwN7kPhrhxipqNlvaN6l822UUYwhx9gsUs1I7LWu/8ZCvslHyL
	dd4gUWaz2u3/bw5mGouGlNjEnzs6pCWLXzQnXtDim41UlFoqR7W06kwXwaZd6/wwxvlEUaVShyR+P
	YWJabQgYG+clDxMc1YQLCuK5Kb7BVzFxUD1yTpFhMLJbgAQ2gP7WCOOwY/WQHfyVi8YkDeqj8UbXQ
	yEiiFipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Zho-000000086Z1-0brp;
	Wed, 09 Apr 2025 17:59:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZXP-0000000852s-2ZCu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 17:48:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539H0JfZ006744
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Apr 2025 17:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VagdqhLUqQ/cHTS3wCaLxpv5RxPWVf0KWqzjzsj4gTk=; b=VvUtVBGptRZErBVd
	8QANgRJCQNYcuAXAdwJDUKfBGephgEpA963ww4JlR+B3FBzaHpmhHNGBTNz96/ei
	EdCNiP8WCd8YOzxxCWNfkLrbVCBAbi8x9Pybt7oE/hT/DxeENB1pS9Jo76n7ST8b
	4mQcZpEb7UOUARmq2CFT+zAS8e4JdhKyLsKRphzhg7FoQSFlI1mATjf3up+WsStd
	unXkGp7A9bLo+pXwvH/2ZhthA7B+kHrUoPZMV7j8l4tLuBtBMCXwbrQAU3WZH6H4
	yyhDzs2iht09oZfJkRGfUvVpJkiPu5LSmvRukh0jpMfho9UEBHD1FmK4TL9ceZib
	+ExFDw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3m8ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:48:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-223fd6e9408so6865925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 10:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220913; x=1744825713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VagdqhLUqQ/cHTS3wCaLxpv5RxPWVf0KWqzjzsj4gTk=;
        b=Ua3oWHiG/yx6e4vsXMDcdv3lj2tlOLdV/uQcrhQ8dPTf3bQ6G4rMSjF+zMbe/Rwqfl
         XF4o+hXeUewqTxw77e6m9EtCUfsyCbeaerWaqqXVB49lrtMYP06EIg6FXaQvRB3GcXBR
         Ke3wWLNPgkwkm/HHg0T3tDHgcKcOknOFocvph8XGqKzlk/prmTL3gNX809fE2HQhZQ58
         KVZVnH37KKrUJ/YF9uz1XewiW4kNzKE2croN25lYYEcWFY/iWgBYQjdUC0um7JwHGhOC
         XLPKKUfnd8WBJANIhCZW2gSNSTvzXo+xfsWuaeqHU98MD5TwXmWsBZD3Xm2Q2tModSRx
         hRoA==
X-Forwarded-Encrypted: i=1; AJvYcCXpAbDqPDaHHRrTa9ht+FogChHL6z+fIDcSea9OAC8o+jUg8g0hJ0Pt6EBQkCAiaX8sATIQP3PDU+oIER304MMS@lists.infradead.org
X-Gm-Message-State: AOJu0YwMIb5j2NhrjzNkTINPpx/5y5auQq9fLks5Y2sfOXoVXNQ9OFy+
	2t1ltSQ4ElpYPzQmGkCNnzyQ5m/d6QOQiUBf2Gzz7yRLZQ3M1cn1CHtzbmmfRz67OrMDxdQEKU8
	HEi0HwUMCYBoHgfg18ZPv2yWRHfa0xwTa4p+dCqE9lA1teQOjAbZTvKn1vYSQEcr2nZO+c1olFw
	==
X-Gm-Gg: ASbGncvZ4dmeDDqDgYM5wS6xFtV8fdd/+SKAVBalfPBfY//8mVTEGuvzg7gfUVvkZT/
	X+gIcFb88RqFWSAeV+sg+EuWkbIWNU5T784qpoiIj8tw7Zez7VmjBSHPXr3RGxUwiapayQTpGYO
	PgKrp06vMBxiz7PHOQwAbJF6rX6AirKByj40A+m3f0ix0XEMS2KCGme8UEQ8BkQ1BEZYh3XI1pX
	kTmO+zz0Z5ycITVFzEd5hq7FfoBcYULLW6A2LB5+0/OtHO4tH1OcMgzKEQaY2OuPP+2FCy2t3BZ
	kF8RD0L4OIf4gCbwHylOY8OSBudUZqHsz19NLms86zYr7ljdx4zTwEsfC72nDunQ5qY=
X-Received: by 2002:a17:903:90d:b0:224:7a4:b31 with SMTP id d9443c01a7336-22acfe92581mr4893845ad.6.1744220913243;
        Wed, 09 Apr 2025 10:48:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsG92ws/nA3ox5Fmzps6PGoWhZkEoMYDBBjXWPelVVnEe90k6uZhmPJS67No7KaKKDplowIQ==
X-Received: by 2002:a17:903:90d:b0:224:7a4:b31 with SMTP id d9443c01a7336-22acfe92581mr4893535ad.6.1744220912893;
        Wed, 09 Apr 2025 10:48:32 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm14964005ad.148.2025.04.09.10.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:48:32 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 10:48:16 -0700
Subject: [PATCH v4 05/10] phy: qcom: Update description for QCOM based
 eUSB2 repeater
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-sm8750_usb_master-v4-5-6ec621c98be6@oss.qualcomm.com>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
In-Reply-To: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744220903; l=1432;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=4Pr6BN52SExwCz3h8ri0CiEwnp4b1SW1BiobceI7Ft8=;
 b=i23jhzeTsiK6PFNrYUYQ3S3HJO3uyNXokW2Ua3kOkY4OMdtdhsrt5b9CWvZvlUzzMpMndpmv5
 GwelesiEFTmDYEuIhlfB//FgZH094PA+hyNHpjmeAVxwODgJLkQiumU
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: UXetDOYZ3nKrIEthP6DFaf7EaJVUUf0K
X-Proofpoint-ORIG-GUID: UXetDOYZ3nKrIEthP6DFaf7EaJVUUf0K
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f6b2f2 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2IHzoM5ujN45o2WKKn0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=926 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_104835_777284_67CE5A4A 
X-CRM114-Status: GOOD (  15.24  )
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

From: Wesley Cheng <quic_wcheng@quicinc.com>

The eUSB2 repeater that exists in the QCOM PMICs are utilized for several
different eUSB2 PHY vendors, such as M31 or Synopsys.  Hence, the wording
needs to be updated to remove associations to a specific vendor.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index c1e0a11ddd76c2056eb2e72a287ece4def2cf5d8..3cfb4c9d3d10dce49bb93b241f9b56c75b934601 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -135,12 +135,12 @@ config PHY_QCOM_SNPS_EUSB2
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_EUSB2_REPEATER
-	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
+	tristate "Qualcomm PMIC eUSB2 Repeater Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
 	select GENERIC_PHY
 	help
-	  Enable support for the USB high-speed SNPS eUSB2 repeater on Qualcomm
-	  PMICs. The repeater is paired with a Synopsys eUSB2 Phy
+	  Enable support for the USB high-speed eUSB2 repeater on Qualcomm
+	  PMICs. The repeater can be paired with a Synopsys or M31 eUSB2 Phy
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_M31_USB

-- 
2.48.1


