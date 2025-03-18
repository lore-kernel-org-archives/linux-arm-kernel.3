Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6210FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJYkUWNjRf2lHN3v+SqJGHc1Rc5rAnNwgun/cf+0UPw=; b=RS+NeFCS5VGUfusnLUXWNax/Tq
	GWuS7c17aeEomn5+Jf9othkXt+RWaanT/9D/Ik6TwlV4FYogcdtnPEI/nd2WSncWvxP4Oh1afK+wi
	GslPu+yW77HVVUFreRR4S8aYCmaMdWAZTlKVP5c0BpFktkRfxFrN+q1YmweR4b4LZxZcSKBWntI63
	7Adrayp9H69P6RDJZMGCvpHMVUZRrg4kYGyMq75s3RutLSyCboi5VBe1J63n6SuK2OH5lacZMM7Pc
	oTlweyBRtiT7+aUR/Xcefp3NH6m1DLbtL2DBEW1M9MBcWL33nIIjcsIMGTv2xZ7PulEEJHV01k3Tz
	/JCjhoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWyP-000000061Aw-1dAH;
	Tue, 18 Mar 2025 13:27:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWtR-000000060KK-0V70
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:22:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAqfxJ010232
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hJYkUWNjRf2lHN3v+SqJGHc1Rc5rAnNwgun/cf+0UPw=; b=l8DnY8QjMamH/A7a
	ZR4YCcEwXfOu8vgCL6lyqv8+oV/adaiRcmNYiDhoWZWekqywKmoCMisbmaDtjtlM
	B8wodh+sCKx+jn9LwrX3DpFb1k6NeUdJdaHkFerFIxTH1RNCXmpTNy9WNJnj5Cpl
	ofr4tVanHkGLv5+RKy2a4QP69Ztlzzmk8njk3uOLeqAPWah0NPXmoiNtftBKhsH3
	IQTpk0vh3iEM1oe8BDUhFTwXa+RBN40NK5pdM0F4gEU1divoKzknvm1z1IgJShfy
	0iuPEhk7hOm10+fkhe81MRVscpkseAUJ2GSqZoNNHB8HypevmvD/0foDQKJn6oHC
	hBMH3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exx32088-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47682f9e7b9so98270421cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 06:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304123; x=1742908923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJYkUWNjRf2lHN3v+SqJGHc1Rc5rAnNwgun/cf+0UPw=;
        b=AZ1yRa1Wvv3jL/ntB4iyreutY/KJGhEQUniyxiWPOeB1iDUhx2hRqOCKiHlf5RMtkK
         CuNeCmR2S4whY407xpvIJl1P/3xnF1ygY9/7xGbXxSScjWjaupkJYhrWl1BhoQcMdLQs
         6VWm5DLteaNG9pz1hmcxKvqZ5729Ojm37CjI2qufzPJIBC0pcPUDTEsOVtDvcF0VQGLd
         S35oj66dYB//IilMKaf6WAJeRsAZsMxgxSIitKMagBdV07V9cF+W3KRsbor2U3hfZVqW
         MTOTbDceyJPdbzWvoJlcqicLN7N/WXPd1+b7w9qzLuxXawEkcaBY27gBUFTgEaiu7kbv
         BHGA==
X-Forwarded-Encrypted: i=1; AJvYcCVqmDchXbDbuwOGksi1vQiqpZkiSd6geQJLzocw3YyM7XtRSLTJMUu0jq7bA4diEPurMVxFUJ9kZvdcc900Be1X@lists.infradead.org
X-Gm-Message-State: AOJu0YwpBn1uLdRmNc2v+raUL5YOVJvYTzsfJee+TFZmDlIz/nJHx87Y
	HxFGuuI55tI+fKY40ivvEY+euqEtyjahCBQX3efmmmMGMYFNfxtVMjGu5LYLGmMHPyGn4LEu3r+
	AWjwACY0QmD7cxJNue0gT8oyt3E9n8issJP8WyF/q5oTRUoK7gPW10T+vfqPcdErT8xA+x9cqHw
	==
X-Gm-Gg: ASbGncusSp73vl0EorLd1ywolg6nsWagEMavqhBlIkOXCtG24AYpLMXdmaugdd7qwm+
	7gkwzhYkt+MsxsYpdLFd5UoE6+D2tnXLlbcMYdORTKcmkj6hHm/SUeavKLRTwP7G9CauO5Zopif
	v1MacyV7RUfEBSoizetduEqPYDLv7lzoZPsX4fBgyEeB+cbw2/W7OiVORxAP1o9Rx+jGmOntduO
	yP3gZPfBmdQ6j907N6qqj57J/qV/ZrY0Pm8xhPDBOkoWqLPc0uecGqJhLmz0xYp3bYrxrvDrh8V
	hvRylkjgQYjTPIRSpqe+pqcm4pwrNnqUC5p4XiVlScnz0XB50DqzD/oj7cujb599094m8cfyCIO
	Q7HaXZa2j5ozATwktqLEnOYYmJaTm
X-Received: by 2002:a05:622a:47cb:b0:474:fc9b:d2a7 with SMTP id d75a77b69052e-476c8133b81mr220273721cf.6.1742304123367;
        Tue, 18 Mar 2025 06:22:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuJjxkEkxA8YscofES5fAkHCi2UaKSLt9P/+qAvQZP4SC+n2yCqtqbSZ7p5iFpKiAenmtJkA==
X-Received: by 2002:a05:622a:47cb:b0:474:fc9b:d2a7 with SMTP id d75a77b69052e-476c8133b81mr220273401cf.6.1742304123036;
        Tue, 18 Mar 2025 06:22:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:21:55 +0200
Subject: [PATCH v2 02/10] dt-bindings: soc: qcom: qcom,rpm: add missing
 clock/-names properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-2-bcedd1406790@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vnLn5IBvIwlEl10it5qDKQb93nGa5jYtIoo2fd9uI58=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN0wq2uVR8NFiSnsCPte+zdnqNwfwNEJwiFt
 TzD1vCua5KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdAAKCRCLPIo+Aiko
 1VZCCACRel74Ze8Ri0AQEaQbxA+kwaLhzmoIWbaj8eSRfGEhssdcI8Q97HHQ1FpY7hszLgiPent
 YsHwEykVKF3suWlC2rf1yoq++iyVHPmru0gdq3kaSvzIN4cv4Qaf1jIVD4NBJPAonrCo7hJPZ5C
 5R+Eb+zxt5wuzsozs7hhvGsLYr9BA8fKSLEigE/AKUFsuEmhFLp42QGcm6K9RuLB+KrmpG70zor
 3Ic5SdGQ9I9ZrlkHlo6HWrokR7ZJWB0cqXDhHOm+1BGsS8hZLJY6iLVqnxsHY5WMHBfzJHwPtGD
 RDyqyzTb7eWl+0wbG2bq8e1HLxnD1C+Uw4Zjyz9EljAkbxVu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=b+uy4sGx c=1 sm=1 tr=0 ts=67d9737c cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=TCbcYKr47qonvmNniLkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: I-LX7-zyhK2diyZoFh97oH8JF1MjrTLn
X-Proofpoint-GUID: I-LX7-zyhK2diyZoFh97oH8JF1MjrTLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_062205_167777_B26DAA5A 
X-CRM114-Status: GOOD (  12.10  )
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

Qualcomm MSM8660 and IPQ0864 platforms use additional clock for the RPM
device. Document it in the schema.

Fixes: aa0c4b815045 ("mfd: devicetree: bindings: Add Qualcomm RPM DT binding")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
index 10956240df0856a4241d6032d3aff7d447af9ce6..3e8d99cb4dc368ab6b31e3e60eb5f7e082cd312d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
@@ -36,6 +36,13 @@ properties:
       - const: err
       - const: wakeup
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ram
+
   qcom,ipc:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:

-- 
2.39.5


