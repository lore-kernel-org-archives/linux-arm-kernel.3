Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6327CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5Zt92XUDy5ouQWe6YZM2smr3YjZQjLfBRQBMqLOYPk=; b=4i91gz0uRYxk9KrJXHECCusMuG
	hROaEg2oN6u+K90hwQ483nKOY0xG2XNNMtENR5Jn2RclYg2wXM1jsnIgy0f7ce4Pr6wfX4YCcFP7N
	r5zZthj32VNrlwHDWbB4BQlc/CHpzWqxijHcaGA0l3MDbRKU497fdt0e9t/n8Z97cxhHwfsprCFEV
	c00aN4uZBBgpLywFpyQ9Lhk+l5rC8fDYz31cN3fX3ejGEw3HbBqqjLJNX3mjB89D8tTtCHA3U0EgI
	QAQZbhOzvBCepU5tTuowOOpK0mBP0xjBGpeIjHVHuNwphJittXx2y4U09JxNDjDEcqarHa6pkPjCP
	RILlJs1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWwk-000000060rG-30h3;
	Tue, 18 Mar 2025 13:25:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWtQ-000000060Jm-0erU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:22:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IB4ijX023271
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5Zt92XUDy5ouQWe6YZM2smr3YjZQjLfBRQBMqLOYPk=; b=ceSP6CvKjtr4DnXn
	lLv+pgcEdqXW0ymxnBZkOsD46u6qzGTH7kayqPtmBC1tI1qXtLJXY8ugSjSEXddO
	womshixQfmptd9rDO3NXuWaP00TDbnw2RqCbuuICwaNf/c77F+Q2/M5C9Zweuz/T
	iGkkIRwjGOzJ3va/g69in4rVzNKHzLfbjrJkrgZC8F2Gp2DJX8HqS+5/qMwEOLxv
	crJgf700gt4P+t/GXSVtOpOs7cZ/v742UIG/m51iM4q8BUZzY9jZVD2L2mxBSHZk
	/3FQgFChGkZUVkvX/KneGT6BE0rIjyThwIiC+p3tyCV+ms+92lv28iSaB+0CQ+fN
	fJdcLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx1y72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47693206d3bso149613841cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 06:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304122; x=1742908922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5Zt92XUDy5ouQWe6YZM2smr3YjZQjLfBRQBMqLOYPk=;
        b=F2NtVdQiU6AT7pb+ogWOQLzAplhxqlbd3+DKyfBjXvclekL8wRiK7Z+7nFMNkelxQl
         6iN+a8YdlFTgrk+flSP2zcXHXHJHnagbl/M9yCIY7x7PhE6UHhhK0lC9YrxGK9cSrKzr
         3kFA6XbNM5wCARVwH6ZVlXjUft/n7JMrLE4lbVG3G0bD6Fk0+Fn8y0S9XpcVujQNlFbM
         Recxv/o6HePvykDA/2l5OS1BWMKu21uiGz1nXZlljXAN22WR5X9WmCQWMYn9o7Qjuri6
         aisULRbLHHhXmnOUA3sSP4S48hbOAg2XsUNTVaJN5UcEfaxRNlqX0qRv90kKpixm/TsW
         DBNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+2djOA68BhSEKWCXheQhkFQn+Ou1iLmmx+nStSZa6EDkM90SSN32z3tpdhkoLQ2OUiR8hyXQsVPN48NNVykxl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9IVPsSsB8KDUBFk3i4G6Y5VswDr1HgVaNo6k6Gv1aixD/2aXf
	29JHWBfc9fwmGYe7AM4cEmD+9FudOpJxpqhSDVPigUu3gaPJKWdAgOaW4WkQcK2tFp83O387QIf
	+LmofxiRu7ep0/JaZhaCRnj2gBQ7syKuJgr5V/fIxlgfXB8vqyCqsrDfAoaQGClANjnlE/xrW7T
	avEcHyL+QgMVk=
X-Gm-Gg: ASbGncsBdbDMHBaemj1HwQkLo6ZqyonYh9O0TXCdEmrSCzL0IxlSEZ/224fqHamOAqk
	9k3yQ42pimD7iBE4nupLikJQCvkhXIVn+yehod9CaGLpyjC8ArpEGobA1Q+TfzXwR+ZcbokAmyl
	pFqjeSTT3EqRf8tOXVRXOiX2gSN5u5FyKLs6SDnTMlfNkjbiGle1J8VH7vjRpCCMYLQpvU9e3x8
	BFqKwki83M+Osc4Y/Nujt0oKu9lqxpDfypfJuO7XEQh/TIAscJWCubw7u/uu60C84oKzLtbBOTs
	AxS6qfjOxErTCSuVJv31IJwyn1fJCtMo78PqF0TyXWFFH3KpsYi9YJ1PjNx6SHSwccaw5/1kvKL
	9u4lGkPTO+lXaDRRp0xfeDFgCK9iG
X-Received: by 2002:a05:622a:1aa4:b0:476:60a1:313c with SMTP id d75a77b69052e-476c81be73fmr272683931cf.32.1742304121721;
        Tue, 18 Mar 2025 06:22:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMDX9YCPE1SejzEThnKhge4s5KldlhhfyHRYQcza/O5nZzlD1qSBcGR65zSvjafi6B4G69YQ==
X-Received: by 2002:a05:622a:1aa4:b0:476:60a1:313c with SMTP id d75a77b69052e-476c81be73fmr272683291cf.32.1742304121211;
        Tue, 18 Mar 2025 06:22:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:21:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:21:54 +0200
Subject: [PATCH v2 01/10] dt-bindings: soc: qcom,rpm: add missing
 clock-controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-1-bcedd1406790@oss.qualcomm.com>
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
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WRG9dHTLQ2jwnkCiRxmgtVZUE3m+6omsipYnyHhT2vg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN08jOJNuTwSkced9eMV/MJFXViOwpWGg+uF
 Sug1KvNIAuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdAAKCRCLPIo+Aiko
 1SdnB/9UibMVLZAffmcCMLl2vNveRklOZJhQww/w7wzU49Z/XM+FndkKsxB2dbQjyoCtVIk3vXi
 CnfABPrfYXfDbO8VK1/uySV7lLKSorOrPfBtjmbIjjiRL7Qa5J4Io/RQr4KJ3lXZnAq1NFyr1fg
 So7Imex5ClHXoBBjihMKpx+RO0GRjvHpfPsKQ6Iwhk7K2MYINbx1TupiqopZT2KF7T7mPZWz/hS
 8XjB12n/Vda7Lbuj5Z6I8toKbGuOzwjfvTUtCNFjUZv3qg0Ojcu+sukhqgRURN/DTYEhKqpZDlb
 /UVPGfxHD9DzcV8XFQ2PviA7tfEJdbToJ+CGmaQ3dijIcUIG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 0c_F61UeBj8Tgm3rx9cia0umuCCxjg_Q
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67d9737b cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-Z_mRg2wFor0aBS9cE8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0c_F61UeBj8Tgm3rx9cia0umuCCxjg_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_062204_203665_28FB3B53 
X-CRM114-Status: GOOD (  13.12  )
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

On Qualcomm platforms in addition to regulators the RPM also provides
clocks via the child clock-controller node. Describe it properly in the
schema.

Fixes: 872f91b5ea72 ("clk: qcom: Add support for RPM Clocks")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
index b00be9e01206d1c61802dee9f9ec777c4b946b7b..10956240df0856a4241d6032d3aff7d447af9ce6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
@@ -46,6 +46,14 @@ properties:
     description:
       Three entries specifying the outgoing ipc bit used for signaling the RPM.
 
+  clock-controller:
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,rpmcc
+
 patternProperties:
   "^regulators(-[01])?$":
     type: object

-- 
2.39.5


