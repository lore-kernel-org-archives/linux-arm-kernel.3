Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2CCC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bma7Qezl2UbDO2xCAi4cNSVueFgJi4IcQwPGvmhljag=; b=XVRGMxAwf89nebSqKJEL7iVFSl
	uazp/FFCKESzKmnzYDc581rtkCMf2t175k4QTp0Wm6cTm3bIMeC3x0OTN/zd/ELi5sEVC7JfmFKKU
	wkl/QtpjgkIP/gQG3xITDSsfX4yBvYeEKew+YIlRxae597dmokNB4p19SJJLYeapSjeWpq0lmtJGK
	AaUVkiW800e7kII+Dz4MrCFbVNR+jvxXil7uttHgPue3AKd39d5NyQa6EtbK3X2BU4+UHDqYvamvz
	mRyWc2abjfMtz9Qfu5sApJwY3oZrE/dDylUlPpTO8PjIHXEY749+lKjY+And1BaqM7PcFv4VZ9bHA
	rNAWoEng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NUf-00000000Uy8-30jf;
	Fri, 25 Apr 2025 18:09:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N8r-00000000RZv-1zlX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 17:47:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwwC011522
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bma7Qezl2UbDO2xCAi4cNSVueFgJi4IcQwPGvmhljag=; b=WtM1uIpRxYSK3lr9
	N99dqcPmaaojzAXob7daZkOhRfvoaLxLy7nPGWCrxq04xB4A0RuZYNyY53Br98ZX
	QjYPTMLf4v9FSB4Z/aJbITpNn+yjZI6fb4pX2MmnkacQf/A+LNhE4KCl0UaUIujd
	eb2oGAR9p9dSv+B2F2eKPKzSdEYlGUCixy3THvnoFhcgZWVwZ7Jzaq13sMRzZzKi
	fptzoVMbmWK7iA87/3dZaubEkt7buXu7cTmrcZtKs4002C7pu2+ke/3M4YVnfWIx
	LwxTtgUvEo+eYpdfE/12dMB846gyIe+tg+Zj88/o3YZAuUlQMCxQN/MDoGDynimB
	2Vp3MQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3steu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2872e57so434623485a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603232; x=1746208032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bma7Qezl2UbDO2xCAi4cNSVueFgJi4IcQwPGvmhljag=;
        b=CVgyaDryWHvHJpUn9LCbAakLFy72Da8WtUwgTaxwBZJ7S7Ajx5e9qzv0x/qUMQAYIi
         +oThvQ+z7RhU7+cDyr9rtDKj2YOe6ljCCvONXr0gV9qTAoe545r8/Wufdps9fX3mDQx7
         vgD2bNi0Fn0jJaMjcR/PUCKCpcmJntHQmeDBDkKqptMF6ezBWV5rEHEvNr+A5umLS1hr
         kHshY3XEasBKk+R/Pq7u/3cXv3WnjrUUwcS1LXbBWxXg+7qu2vjmcioKnjoA9g8SmJRC
         BSvK+UNxXnQ/G1elbX5wlIAyOClt/qP1balnHNLzqTfG4EVYHL95ZORt0oIXwtbDh0rM
         58YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Vpvww2fF/+j9TWzm30oPVQl3sHoEESG+PlXVmorCXmUunIhdDgOxSk9q6O7uygS0yvzC3w0Cbdn6SnJeAVnr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4D4wi4OO/vqCe2l9hVnHIoy+dSWRkEHBfmQLRmnYrFXo2pyAs
	qjw3NrGVvLNXf36TBa1sXVnkzlI7qqsTXCIdejh2+EGQ52H+VsauuILZha0dm6XU7h3QEalf9oB
	D0OZGUjyI5LSREJoku/zwbZMkmjJLS/UoWLm+BldQJxc/1m8bD1g3JJylwf35AlrqKKRI/Tuymg
	==
X-Gm-Gg: ASbGncvlbrJoneS5CTMLbSHB110d4ym4m1B/VXDCNnriuCYCgOTIJ3so3jD45hnupRU
	4WT+Nj0ABScsEE0Bu406iIAZ8r57OnUgB1dM1qwpBLLTgw3Zj0OB2dNW3MTb4SShUkwsVtp8tB5
	SsxAXxk/yEuUL41A7SLwBO9287qtPwcb6Uh139rEGGmoEDVju2WK6F7i398ktW0+rrzUlqgcXd7
	bBwTLQwCG2OU/CbVOG3KO/RTUtdQ7cYhXPrmarKQzQQtNCLMQtw1TDZXZyFvQGNVhNACWqLIZs0
	8tNcRLGxog6g20+2LdEnsTJ7JVMokYVX4MzlwSQfRIMxlxibKmFts1Tc/o3cR8Q5oHSBym97iUY
	+XjHYk7IaHkcuFsUn9H4mWr73
X-Received: by 2002:a05:620a:2706:b0:7c5:54c9:3b8a with SMTP id af79cd13be357-7c960711409mr486803885a.26.1745603231952;
        Fri, 25 Apr 2025 10:47:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGt7mjq6OlQQ/4tvC5bPzsEBKl33M9pb3uOW3cET3lS/vXO07nVvqUKzXnJ0oHD+s6vc4v/bg==
X-Received: by 2002:a05:620a:2706:b0:7c5:54c9:3b8a with SMTP id af79cd13be357-7c960711409mr486799485a.26.1745603231631;
        Fri, 25 Apr 2025 10:47:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:02 +0300
Subject: [PATCH v3 02/11] dt-bindings: mfd: syscon: add
 qcom,apq8064-mmss-sfpb
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-2-da4e39e86d41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mUif3lR0PSG/HqgcZ2ciRfdEjndZCJLRXpKX12Gx8Ek=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qaxqK+xV3BgdhsGl58HMTGWuzF9E7yI/Ihk
 ecnNjK9hBSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmgAKCRCLPIo+Aiko
 1TivCACR1DBER0+mwSrW1ZxPa0IuIF+/ChpFy4jZhNybfElF0UcC9oECBsobIAfOSoCjqpnpho5
 3+y5H98SNTuoshl17dunWSasvvftwR8qyHFFNhZ2Iqynwly85r56rzI6FWk52p1RzKcaMJIXkbK
 RiOirQXcbmiTdRknSyL5ruVdebZv1fg2uhQ9nx2bw4kncqFCqeEqdViFJR4JWwX/S+cactG9Fnz
 DV8wJ3vmhGABfMd3nEeoxVRxd5yeY9kfUWt0zt6JUr78I2xsHRd7mKlEBwvSx4ry7/fPb3un9YL
 t6h8wrBNaXzCZDULJ7ZhWsd69yRPeENUivZSgZOd831ku8Yx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: SUSTS0SDFowgFnTFgR5t_XuJ4VwvVusv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfXy06Dcl9s+X0D s4RYypWKr9+r4s4xU0QApK8rx6CnWl8Wpw8m+8YKuDU8bT/CNnCm2S8f4rflug5tl2604PjWuFO 8bjmWglFi3ew2bumevShNXbWuzxPtmBEzjoiFMZ5mu7Q9GHC60V/vxXg4HdqrmzymZx+Dcc+VxC
 5Gif7PNqsh1wZzU874qlKJeZP5og9C15GUpY+zj1iM/IZ92I2vqsfSBOMsfT6pniySXgK/5pSXK JdvsL9sV33gDl9GD9iGFfxisouw8ae07LwaOjWoFJSLMmo4+OJIRd+s+TdRmvGLNhIVz47SV3xe 7l2T/Bqa5Ih3FUB1bqklXNhRevQglsc8/eT0UEUlt9Q0X9Qv2e25XcJg/WRxc6B79y76mh8LI/3
 TDEU7YHE+qwR5mCQ6bndWWddFYhVzq/SyXzS6pvqiomdlLZILPhn9tLkCgosdsi5FvWPPa9Y
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680bcaa0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gjla_oY5Z_Fy-GYXBTcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: SUSTS0SDFowgFnTFgR5t_XuJ4VwvVusv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_104713_667085_7211A8CD 
X-CRM114-Status: GOOD (  11.78  )
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

Add compat string for Qualcomm MultiMedia SubSystem System FPB.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index c6bbb19c3e3e2245b4a823df06e7f361da311000..0004878dd0da7e9c84675afcfad7a246c561eee4 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -98,6 +98,7 @@ select:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
+          - qcom,apq8064-mmss-sfpb
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -201,6 +202,7 @@ properties:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
+          - qcom,apq8064-mmss-sfpb
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos

-- 
2.39.5


