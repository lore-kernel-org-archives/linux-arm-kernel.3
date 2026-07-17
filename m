Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6749FC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 20:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+db1P5RhSgKDmUAmXoiZyavEFVSigUv3Np7w9qQeMU=; b=cso8DkNDCPcQ5YnP2fNUKPmD6F
	sYcYwFp+kssewD1k+TYBo/vFA/xJKqr+tf9Y2Br6DtWMYLJR7OKh2StMxwwCeLziywFA+MMyitqJV
	V6zeq5sJcAxFtEt2cVjdOvAf1WULQoaGPDTqnDDVVZEj0PTZ+nW/8pqOHXzYpcndd2yXzkoUBS1xV
	64Bd8cDyj2gRO86VdcFt1AWALNK7pVCJAH2oMkXE7e/VMXUBlZbCIAqANJzJhRnoGQnA1XUsl8aoi
	rWwygyCbmMDcJcUK4FjR9/4xoDP6nWE1MNjuCfKIY1m3g9I3zRovj7NJ4/oEe5dA3XE98IZMp5FKk
	JSMkOY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpOr-00000003Dtp-3Ktb;
	Fri, 17 Jul 2026 20:43:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpOp-00000003DsV-0p2Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 20:43:12 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtY1v2780252
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6+db1P5RhSgKDmUAmXoiZyavEFVSigUv3Np7w9qQeMU=; b=pjPVSzfULLlVIqYC
	KHI/PHlLgb+u7+xOpdqVecyBd6IinheCrfAlxjs8juOuAZhmn8PhDTF8i9ugZw+X
	BRPfy6/PSJhwhGZ+zfTBRWW8WlMQum9U0u5lYfcZ49UkRf+JvTSKs8Cna6kG6ZZC
	EMIW5Yd7nYCnutt2+odxbkgiJaWEsPGjv0IpbjGCIh0gtSFLPfpYRw8ieNAoGKhu
	+cCnT8Bv6cf0JiZ9k3GM6nFxD+WkMyJm+6ZTbZk/8Hb4q3Yovv/a8zeFbwM1M8go
	Os4bxaLk3C2xqaLBfHgjGtfTIlFSs/m4aarMT6+FyEpnNMrjJ3GFqmAHIfp03Voy
	s5xNRw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gu9b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:43:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38d7fcd1f66so12255263a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 13:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320989; x=1784925789; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+db1P5RhSgKDmUAmXoiZyavEFVSigUv3Np7w9qQeMU=;
        b=dcjFvwxpQmwZqp6uTDMDd/iNUa/nTxU7weDEfjtLRTiH9775ajdrsOT3o6dGudsBUv
         7++y4srWFDWnNxjqU8TzTHI05MK0EPJsltc3L2/lUfyMX/NQoz5UqyB6841/ITVUroQq
         nDXlGG7s2V00ZRiF3+wX+DAIrHNgbRIS9PU8cNu+RIQ8UCSjBwOxrj6zN4XhXtjijnp4
         P5M4uHp67b2ycz1YwU1eePNmbbWCf6sdQdKUr3zuj18mukRW2iBGCbBmgASR7nvg8LXu
         NR7Wo8kz/8RnutuH3SF2Na4QJHw8rGkvzUVJ2yGPu4bU8a1BCH1jNRsP8v3iYpmHFoWM
         kLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320989; x=1784925789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+db1P5RhSgKDmUAmXoiZyavEFVSigUv3Np7w9qQeMU=;
        b=KLM8VWoSENCOHaZ/0iPX46ixOTOzgHinz/ErKih3lQBxoGQm4IZs+44tOefXl7/VIQ
         i0Ne1JuXludxOGSfKUKb2JsvwD281FQOjZ0IJRFl13jp1ghGBCSXcvFzdx9B89P9LQFS
         9QfTYloHot0Qf2cAE0l2waZ6Cqz6cdzgVOqfv6Ak7P6g/0dihoFJVdAhcFC+HGVDjIHn
         DYVz59bLEKYBdMXPg85LzRNaGx5oQONc8GS0h+TY83GzA7XmbUZ2s4pUVXRNKdDH36Rz
         1E3U9Lrwir9ZeVL7uAffA4I6heXS8yOWcXwilOrPQqyJJ/fTjDaQdrpR9sTCQlO4cEwX
         Swhg==
X-Forwarded-Encrypted: i=1; AHgh+RpJzENkfc0lu7DrKm7RrI42Xi8Lw9QnKeXPhnBM0BO4GA6GskxbKrHv4mfUyEZJp6b+TBYGfG/u9cMno/2sA9Hn@lists.infradead.org
X-Gm-Message-State: AOJu0YwN5FdtIT5FwVqFVDxXrWZRgO9MqpNGnXLfMBr4gQxGfoGQhvEn
	GOoRj+/UCa/MF5tU4N/22s3qWn5Z76ebDyVgaI3y3xT74rhQ6tGAE3LQf6XtB2Fnuhb1rW4Gjpj
	HacdMeE9s3JMxvAkZQSJS73eQDf446ee4nx5hs4X2ZvrrcOND4HAryUWgNn8bl1sxZd9eYhbZzO
	7hYw==
X-Gm-Gg: AfdE7clpx8nMQwIUMhQOEtifZeoN0wCF40rOIEBSZFl3xdtjLwiJcuiIvX5NUSDd/1A
	/1gbOf+p4hpPcAhnt4WiVWcBkVtrJ+YGjfQZUypibxq9vZxKL8PDVWcX+A58yPZvfXwPSQBDzbI
	HZJ/kl6G/eJh8ZrFhc9g6RKLRLi3TM3Kvo7cdwiVZklECGdH1aaMjzKHnBPJ4aOddzgUGcMoDg6
	q3WFnNYCip4Vg3JnMgRN0QmY4hx04wpWfVran3dMRuCowB0Ry/m9QpFTA9QvFp1UKfVf4mTuzKe
	bBMcnY+7c1n4F66938e3rWp0yxYgaxR63UHGp9cMbRnj4M4LaRfUZvf7HRz0nfbvpdABVYodsGk
	B2m/qAPKFC4hqlzzi18E8h+cY
X-Received: by 2002:a17:90b:4ccb:b0:387:e0bb:57f5 with SMTP id 98e67ed59e1d1-38e4b57c2edmr4367660a91.38.1784320989062;
        Fri, 17 Jul 2026 13:43:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccb:b0:387:e0bb:57f5 with SMTP id 98e67ed59e1d1-38e4b57c2edmr4367589a91.38.1784320988324;
        Fri, 17 Jul 2026 13:43:08 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:43:07 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:34 +0530
Subject: [PATCH v2 9/9] arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-9-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=826;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=X8RDXfBHklja5EB34gmFlxaH7HzFaYeX4Z1IBHMoit8=;
 b=9Q8iDnAw0MhJOK5ZVzp6qxDBJ1QRxddOheLScWmDbidXJrIMQnonMmlM6v+PtlCEEzK/dtESK
 DatlP1RAZO2COPGL6D6h9BFfbWY7fTmJpoXiY4tftEFy1+oli76Z++j
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfX8VE5QFfdcdJO
 LlBhy+Dw2eA74IHB+GU3jPqS38knJPt6ESRvEHKhWZrnRiPJaR5qgRbwtxoe7XCjoeWKPAWEP4U
 /PMiBS9dBSvC3QMy0C7t5kK/83THxDY=
X-Proofpoint-ORIG-GUID: WSN2xzaXhtkYUAP2gc4djcGfRO_Pi9QF
X-Proofpoint-GUID: WSN2xzaXhtkYUAP2gc4djcGfRO_Pi9QF
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5a93de cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfX8Oz70ZFp7gZk
 oWqfFGx2aFNFhf7mGsBNfbavCmFReD/z6HbyyWg5dPn6Dq1ZRx1L2i/zTn0CnsCv2l+8FOPUCSE
 MbrF4HAhnPqDhbyXOOpcW1XN+9vfEQBM/Xeu3agX37nwzi84fMxPNhLatNA3nF71T9cyRoQ+DQ/
 rCQe6ZCURntBLOgB7Z7fekam32i+31Sh5dl9PD3k2Qg47rglmzB+ugwCrUp4bDvgkdTR2EZz9DZ
 4E3HDGdfxJT49HcQwNA67bPXyoV/BnMU2MquN/kjrrloRLNf5SHm48mMVPxVbDih8iLWzxlR8Cn
 4P9icLoRpilFp2Ml8/y/GhRnqJRxji1KvpI18QmwwnkdESi8fIHVOAkFQYtZNczBED7LI3Q7S34
 9zT1Jw8LMQOMqDrV1pdOIbXjCoYE0JQWzpJvt3cWMKRydF6DBT3H3jzX93+VZ4uZqZNa5/w0BpE
 oCjVWOzW+7nRAovGcQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_134311_357970_084B83FB 
X-CRM114-Status: GOOD (  11.93  )
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

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
shader firmware path.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 1374afd9d14e..a6e24d2e3b42 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -417,6 +417,14 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen71700_zap.mbn";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.54.0


