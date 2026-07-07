Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2F1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ht7oYlNkxKe0u4wT9G5Vg+QiDuKRglvW8oxmwk7HV/U=; b=uKkcP2MMQHh9cpHZyInf4u3xJ3
	si2xvBKU7wSSJYwOYtHALOIhGuOh9jZbyXVf42fOsneut1wtv9wQyaUsXduNxWiIfyEHtCWU07fks
	wVKf5om3kpgtTUWZTzxMBbZyaT2q+h7znam7aGIx0bYn993/QVK29qbhTlFnyr1GDDxwhGDitu+hO
	NJrzsRxSC9cgl/LPQCjqJ/WcOs6TtceBw8Kl8xcVENCEqD7/bVVBxBMxyt2BTJne0tuRmYeK/CTW/
	5EHdeG2B42QKOkWw+xhUvyrE1aHj7Jm+sxdv4Rv6BYSlkSwu6E/S1VkYpAUM6vuJ0jIG8L1qEAg2N
	eZc+XtSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1on-0000000EaMu-25Rk;
	Tue, 07 Jul 2026 09:10:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1oi-0000000EaJT-2Dyy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:10:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EP2N3204014
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 09:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ht7oYlNkxKe0u4wT9G5Vg+QiDuKRglvW8oxmwk7HV/U=; b=p6mu7xrSpOVnqEKD
	x+1QKPDsyxlqNxgFWL5b5Ysoqut9dajtbw6tBQytMTmhdo74Gza3NrM48xAwNgxT
	7ZXmyXQ5K+cPLIX1UI9mAX5NJgiBEC0tse/TGsmQUt8t/q2DunqDedhL1dpQJZVQ
	31fru7plv9DHRVbMaf7JEccJ7ZtIAmz5e/nzfxJNMmDj+BcnN445kvVERPuBoKbE
	3Fc/VStikqxouIO0HKzHoRdpJ392lQXypcsxLCSJzo7Z5q5tdKg2bVwnGLT7PG4Y
	pYvy7S7fKi6vd+xi1NqfDywgjewz93Q8fER4p9siJDZiBigW3LHSEC5kFEssBjzi
	W3W3pA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a8na5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 09:10:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8478947e047so7723017b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 02:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415410; x=1784020210; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ht7oYlNkxKe0u4wT9G5Vg+QiDuKRglvW8oxmwk7HV/U=;
        b=kkdlqPwN5WQa22iqvo16FHlHyATdLt3tYVP3zmTqdYLq0QpJxuMF8u5PsxMef8ChAW
         pn+gvX2/YNq4R0QcIAr+IUQzDm13XI4mjkU3epCmOHmJAJ/Md1tMwPk8zu+A+L2+UYYb
         AZHrsZFAc4dj5c8FaorI4Ah4sx5TQ7q8KCjabMqWlbsVSxFnbP+Cfp4yxkB8k3/x7zk8
         C5EZMHpa/XGCDDuBNv4snb35zrwsvWTM27G7xqjiRLcgV2MPwkvimL1gyh2cMDx8Tm4g
         pawohojf9t9rcr2eJUAA7JIeBnDY0Lsa/eRreiQFiZhPsO6l0a/QBW5am1s9H//ta9rx
         jNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415410; x=1784020210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ht7oYlNkxKe0u4wT9G5Vg+QiDuKRglvW8oxmwk7HV/U=;
        b=KdkQAYhLMNvyEjh9h4XOSG4EIfWAOCpdXRalcO830vhby+enc1CVpv1EQvzGP0bmPG
         X0kAGz5x0Yj7rssGm4jN9rjhehs6ss8faRdcKlAG4haO+DkpwY7IyOk9etAU6U/uf8Ww
         HXbDayKUJYJCoZLyMDr/oaGkfXvaKWD+KCQxNq3gx6I+0MN0sCsZtB2fOvwjpdEowP0O
         UAZ69LBGQnEfCw8DPhT6u9tvoOEjFfo+2+8Ru/+YpPw+Zu8tyC8D/dEZ3jyQRuEqz/rI
         txVctS7e05yY+tHBNbT7jTDNC3LyqurWet7EovGzWUn66cc/yWTxyTnH6wXd9uwlkoS+
         td2g==
X-Forwarded-Encrypted: i=1; AHgh+Rrvzg51vGXO8l5yOS8k6k1MIQxAIw5srxCiIpdBZ0hAkQYbRUzNzLVTAT12/g5bBRw8Vj1ZohnBalYVMq1FJp18@lists.infradead.org
X-Gm-Message-State: AOJu0YwvqQqCRVMoJeQAsLFG7IL2KSG1eKdWk/7+IkX/RTf1juv93xNA
	cfGBoaSSeB32v4ktsG3G0iAK/uBwkdFnIgQ8kD91zha2cjWk1Vnblo0jL4xC9ooToVK3M8Iv+Cl
	moLYv9Pm3iOlbuRd6pJldcqrI3secDESnwuBLoWa6cHeGW4j8G09Z9uUmakdCXKZ1l2i4bDFPS3
	hBtA==
X-Gm-Gg: AfdE7ckyxOCxv/5WGlYzZIgNNerHX8tNvywz/1itPvJQvLsOqPiL6dDVDWaPCURl4hW
	aVr8tfAnbfp7rqdH3ltyOP0wmOncXhpLWXYCOMIifO2i4sZ/1AYmgZaAWwu6DJDIeGMKN9KTd+V
	8bsxGpnHVU2aFCG3mjJeUqxETbcSI7w7IJydg9X6OMifTNCDdKGISti1uxlL8na+df2ixkASSFh
	vmCGCey3s5c5q6hth3tJe87AoD/PzrGYUO3fmDZgXGXHK30etpuErdshVMQE4Ylopa5EYcuYOOy
	e2TyK8rtzMjh8QXnSCZB7fx4gOPlWSTp5id7c2Us9McOy4Y/vrvtVR7wBZ8qRHXMID4UXc3azTG
	NNMK1Zt083JJIFMxgc5/bvOtkmutiHrWxhgHiTyffQbD3GYbv4eklkXmsn0e3jQfmjJMMKU/x0w
	==
X-Received: by 2002:a05:6a00:22d6:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-84826bd9cd5mr4293113b3a.1.1783415410406;
        Tue, 07 Jul 2026 02:10:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d6:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-84826bd9cd5mr4293077b3a.1.1783415409905;
        Tue, 07 Jul 2026 02:10:09 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:10:09 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:53 +0800
Subject: [PATCH v5 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-5-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415366; l=1695;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=pqcZl4dXfI3xeUcINWwsjZ78bDT6nSOItVcnh4qNNIs=;
 b=5HHJnkm39slqQ9UX2bJHvZpN3UYwa7J3cDec9uIf8brWFiKJYlFxocFnTmcXBeYVowQ/gttRb
 YcS0kEcwribDZi/1DH2EgK2KkuKfaA5wiblQ548vOtqjYaLqsXfCfyl
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: Nw-oWx2S7iVM36fZWyNMT6Ir8ABu3cUW
X-Proofpoint-ORIG-GUID: Nw-oWx2S7iVM36fZWyNMT6Ir8ABu3cUW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfXxIn405JMisxP
 B0FdW+nmgM7sl8v4WD07DclvMH+PK1P/f0wzOnW0ye7hoBANKJJSus8xFgFE2MrcSGt4xEUAG0Q
 aSUZSZiuQMgqSbsbuBYZP4O3koVxNoU=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cc273 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VopqNUcg1dr8wGNk0jsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfXy2jqv/k3xCuB
 rpyw+5CaO/V9On+udocDq+9yptE7AoTnlLD4akia+kWLVgSWkBYrIc9ob9zdNRsJakHDUUfGY1+
 wAfz51n0VQ6w0XS21VaTkd+LRZGgU1zDFAxjkk9jTVWK6Swd0BPEBmc4HQM++/1xKDw7ZTGdSU+
 lnn/yfqlZnP9PGBIvMP7lW9OCYwEWUb06lIPsmRsG9z8gc592yEnIxkm4fXi0ElaWZxEA5TDMCW
 2UT4WOFklvhhTsaljjWZuookQQ9wcrWryibtARSSiduskxXQ2rO05nk0VSaFPi4JzW8LqKpg7S1
 8FFs/m9HUJEmBAeAT/W07S6ndj7nB9kVVitgXqiorG5SPYx+teJNCAGX4Aa2MNVzyJpIPiG4zx6
 PvJkQkINQPqF0M4mWSOQ16aoKGvQgl0EDC8So3Qmn9sNXL8GExcmC0s/vjyUCPRd+MdLkp50r75
 HgTu4rQV7AYBR7bPriw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_021012_694295_FE0E16E2 
X-CRM114-Status: GOOD (  16.00  )
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

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It is marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never
assigned an ATID. As a result the aggregator has no trace ID and cannot
tag the merged trace.

An Interconnect TNOC is a subsystem-level aggregator: it merges trace
from the ATB sources within its subsystem (TPDMs and other ATB masters)
and forwards the combined stream to the system-level Aggregator TNOC. It
carries no ATID of its own, because the Aggregator TNOC downstream in the
path already owns the ATID.

Switch the node to "qcom,coresight-tnoc" so it is described as the
Aggregator TNOC it is and is assigned a system trace ID. Rename the node
to "tn" and use the "apb_pclk" clock name as required by the Aggregator
TNOC binding.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..0c04dca5e557 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6038,12 +6038,12 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000  {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1


