Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C61C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lEdztFo2bCdgvgq+SmdX/lBDeTodlOJ5UoO+aB0wLTE=; b=fuza09pUNa92wgiakZmNCq/VrG
	fFgYJ3q57INoc/v+wfEweyYaeDZNEtO95Jz0s4HMfecyAWmF1z1gSQUCP9jcCzcHwk8x2vgXp3syM
	bAPyZCvgQc1vOiXyKj1R8zJHw3HsFcLVGkzGmX1dCrpIY8rapgpEKCbQ2BFkKsu2oLrFSHkSp/oIb
	/pTwRy3zM4ZHX8zj1PWDWb4/DMDFlKbksxFunVp107usGSmjb1G0geFh8P6xFT0vkx4kaFoaVC4Xo
	4f+/VPU3gpO0X/fw70BGyVh1GLXUQ/mTN9IBC0R78woFVpe72hp0RlqhwrTaulIOqPPQVRQ+Dcg28
	aql/qMSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumPB-00000002A8t-3WMg;
	Fri, 14 Aug 2026 07:32:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumP8-00000002A6w-318M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:32:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QUSX669157
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lEdztFo2bCdgvgq+SmdX/lBDeTodlOJ5UoO+aB0wLTE=; b=lnISA80pp0MtFeSl
	U3EVZCDo3EyOfVDx+/TsveQ+mF0Y80K29xOXOoWi1R5pdsmvKV4nWFDlMdiAPt4E
	GMt8xvH/Q0S3H65lQSunJmrYJRwxhsktGq1WjVY65fbpS3u3xShbRsjdzi1fg0Ms
	bShujkqlCcPu39FC0AhkncONkQw7VNMeuegIvYDp5Z1CUXh/c85OEs4O3FK1E/YA
	llm4S3UPMlKy7CrbyPw4RE0GXSv10BffY/lQc9pgYzxnQCrZPPG51DIN/PB0u1pz
	LaYeHglputGmjijYFnQsjyMiblKDbZVOtqFhF19RwOyHVlKC0HdIjvY2/8oEggSf
	Nt6I5g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h1uua59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee894b3d8so13322765ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692757; x=1787297557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEdztFo2bCdgvgq+SmdX/lBDeTodlOJ5UoO+aB0wLTE=;
        b=MAkREOL3ZRi5phS0DU7ThmIr+eg2SEfwvPNqYFlQ7kcSZrFMe8adG5nH7VVe7+fYub
         Kq5HyLkTVuRsR9pw74+kxLfbev9mG5SqSlzrGeJ4fIC/McRpS0OLFNBZLPFSrSlU+gXk
         7tOD/BQvIkHMEthw76bIXlLgjzxoRM/st/OVP6XkbawUKPUPODk9szXdOOMhBEl+Wxrp
         Ylc89MRtaic8CoKsRVc/s7zkPaxiA2WGsoO2UIIf/mhUk/B1ivadVMvDe7tusV5qcyjJ
         tzyJKRltlGXb2jhur5y8Q6X9/Mb0R4ncYNY5sdeMmPJCqoUcocySswKU/lEkt8BctKJ2
         vs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692757; x=1787297557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEdztFo2bCdgvgq+SmdX/lBDeTodlOJ5UoO+aB0wLTE=;
        b=m232BXDq3upMsJdi/IUY2XsSVGifRUGRBk1hgDYn6VNVLHNFYMHantanUy6yxVnUbF
         bf45LR9ZMEIxREUMjvBD8R1iJ1C4m9TbfTDXyhcOZHbHUCQN+MjomHIrGgJ4ptAye3FN
         hY32GHnjGbb8qCkB689dzUYYLW/iXg66WeQHwpY5rVfXz7R5gZk6RAdcdYj+8Z5s7MpF
         GdIgMgrUFkH+Xp24WN/BHxKVxhF0+60X/ogP0bPQbLrcCXn77GG3lFPzz0DNHTlwveM2
         rq9twiFvc3aGa0A75aM+fqsncQb30yl34xZZuhyLgb5Kasphsp1MCNDVXqoLvLZWdmlF
         WqHA==
X-Forwarded-Encrypted: i=1; AHgh+RrzI2lYEnAvxnWcvLKBwnJiTbHqvamtk2RxZ3ijkYiVH9SzNBF0R7ggEWi92tptLidB92KFqmpB/DhI/Y3GdDUA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg+xcU/HoVWFxvyE+tAAoL31rzrGYV5nGSl/97UeVgfeRVXHeZ
	t/ezp5bT99Ev0sTZADcuqrQww5dR0W2AQ2lK+JD/GdYLa3hTGpa3ipXfv63AQdm7It/iotU36kz
	r4rieqs04x2lpYzCUkNNOxVdUEysSY4EGe012X69ibrBZRzwiNI7fdxI7OK2/xyrVTtH64/C53+
	iP6g==
X-Gm-Gg: AR+sD10HYclG+Xzo5DhzZfDBwE2ctF/6IA77dRHzH/hNi2A9NloyISwHYRUqMT/m0HD
	89coFijwxFwIp3C2pSOF/kgXCMoghYEvQxhFr6VY3y53n3v2BEJIcEdSLrNG5KoEtRd1A+As5lD
	6gJqqjf0cENSGSlYAt0k5Isa0zqQrvsk1Qe9IllobWXebwDNF8NfxJuv+8PLSt9U+KCuwQ3j+tq
	1pCgfzZNNLChr6/KuyjwiWNKYhpGydgT/IHq+dNdVhU2bVaU9M8R4YT9r1uZkecqVxMXiGEcv1G
	Mv7PO7qHVb36oGZVQWwWbcMs6Eg5sPgQfmNgELYRuQ8/ONGRKs687nQcf2XeTuHgCNja5o5wPKF
	IYqi7Uj9lVi0GihALQV0LBL4fCqyyZZY5/GViacTLEC19dEctqIPKMv0KsXF2hTbXzdQOLRCGrc
	zrGoLsjP69Jsk5xBVdNb7pXss=
X-Received: by 2002:a17:902:d549:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d3b0c6832dmr44861735ad.14.1786692756413;
        Fri, 14 Aug 2026 00:32:36 -0700 (PDT)
X-Received: by 2002:a17:902:d549:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d3b0c6832dmr44860775ad.14.1786692755732;
        Fri, 14 Aug 2026 00:32:35 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:35 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:35 +0530
Subject: [PATCH v2 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-4-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=832;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=YcUBetlcsSXeTFWwHSGREMaHV5BuwRS6tuHjLEZyQ0M=;
 b=m2FUOtKrBcO8lDcVtLcayWa7nyzy59baesSptJr8XNM0Qaura5kGzPtzto+lk9HJK0wo93r8l
 uo738BHCf4uAPc/1tAGHJokyJx9v32/xEviKMqHgfKVtEhcUdhQDE0+
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: opd_MW-NK6Cp3wBkORvGjOzDu5ntjs5h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX3ICAFu4ibE0M
 Gi0v1BReqngRrSl2M3Y6O0TQxDG4j+UVxdvXNRKi9VEmGH/a/x2J4NtZ8Ekc+JqBOjkXiy+iOIb
 eC/vng7dTUsb16t78izxRpy1ZgiRO7gA5l09U6aa4YpY0n3S6qZ2IwyeP6UcFsRBU8NP4YPTd4T
 aIn3LHRfKiE7xf5DlSbuNQ4oLq/eygVkOyjVONo3A4+R7WxmZ5cRVW+Be6/rKGJpIctEvdKfczw
 8rYLwEWUvwxYJMxVocGFM0dsblmdZ4bqeQ2r92L5dwa/0ii/lTIYFHRKdcWQKUzffgSc5K0FhW6
 wXtQwUljGqG5OnwsDRnY8T1uy1IBBSGKpvQHy2b+6kUZJeh4NvJJcyfSbpIFtQdfR5uKQMCNNky
 56I6d8KPWSUVGlsltIIjt9HZJQFKrCyma7HLRcfccolu/j4zykPSn6DlHrWBH3eBzb8tq0lMjHA
 ZbPwOzjglSIC7H8qnvA==
X-Proofpoint-ORIG-GUID: opd_MW-NK6Cp3wBkORvGjOzDu5ntjs5h
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=6a7ec495 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXxMRm4QBEIGtf
 ZxbxBiBhedYky8x4MAcNjSBVuVcBMbc5C2/7Siypl0jeYf4768fWFDyWWgKzAnTwX63FstZTUAx
 lHrtc2/Yt8wkSa0u+E12Uet7FFmzApk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_003238_882404_43EEE162 
X-CRM114-Status: GOOD (  12.13  )
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

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5207..9d521ac9c33f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,glymur-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
+          - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk

-- 
2.43.0


