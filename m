Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77348C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 19:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5AhBtS2Vmk9tVlC84l/9eOTIRqJEcsajn1eqDXBo5I=; b=KMh/KnAvto+Thpwm5nGdr9grpQ
	HkWBKHs5LxBABLxaXYoFRw8OnsFHu6e4zrtLuqDjnS123DZj8EwkfaO0qQBPV1R+dpKTO2T5xYqai
	fc8VUpJkEuOqThzOHF3eCOP6LyXS/ijnOIcE4hcNgLiEY2/MfbO1t8FTx5yq8W7lCpriAZmzMOrGU
	z+uxIUF4mSOFiwt1Bp7w3TJfFMGwSBbdc7MuEehZXMlGipcuLtadX5mA0FVeuAOhA8z1RGFHjFBee
	vFWjvc7/rS5uL/1ylWQ/RLYWUiaMitbPIODSCQYUzftIdbx6qBBYAR962C55v3nNdC7Vl2u9kFoFF
	g7UGnQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFkk-00000003mJa-1YBu;
	Mon, 17 Mar 2025 19:03:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWF-00000003aPG-3Jc7
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Mar 2025 17:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=j5AhBtS2Vmk9tVlC84l/9eOTIRqJEcsajn1eqDXBo5I=; b=AC/7B6yRw3JudlsEIsX/CKdFxG
	m1gtLpjv0H65Zd4BqoDB8iKmUE7ydX56PVseqi5n41U8MmVBp8y1r3lmJjmmI49UEOa7nChUu4+Sr
	V1CZ51aM65JQdcxhAarcjb+iS14ZKOsvH9zl83ATdUPgqO9O8pJpVcnpZaE/07TouJ+FIjaSY/J1/
	79e7xD67Vp6/ojbfTWCUPXOn/A2eqTyTK9WR7TjfvMYRrp0rxlIWNxypeZMCEIRFiuVZ4w+rKzL10
	FdI8saC297jhdInAv59SeDJPxvI4PHBDMAiYwu68OAzKuZn/WR1HMWA9aWqkwgP+TCRrXGOZqbbCl
	lqXxHJtQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWC-00000003Wxs-2qK8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:44:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HA2c9G026976
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j5AhBtS2Vmk9tVlC84l/9eOTIRqJEcsajn1eqDXBo5I=; b=Pof6fHhQoFZBhks2
	qKgZwUqsdkZYD1Lbm9OqalOrwX8wgWg/FtIFRRBYaY8AF8qYYYc5QgSWmdPbzRAI
	klwrwWxIbYDV0kkl49pZO1O7McS9SoFyLP6WN9hUVXcJIWy7xP627uFk04PYdqGb
	4lSWPERjrHSBko0eIl4OaE6MeW6HR2HhF9n1n2RKZnjOOPVtNaEqJw11xPfyxQxR
	Jbo+mhuhqRyspkTZ9H1op9kYLkyzWdRB/ha8nqmB75vBO+roc4kdEriW5YgkJvPz
	Znpa1I/O19NihIo5QIEoyKFRV3fxoIEw+LWijju6FfWLWUsJLbypWYJ9FhCGM/Bo
	imsU1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1tx5faf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:44:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0b3cd4cbcso482174785a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 10:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233487; x=1742838287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5AhBtS2Vmk9tVlC84l/9eOTIRqJEcsajn1eqDXBo5I=;
        b=UPLZRzONvHSmkHmQjgaVkRg+puOWk1Uit5bYjX+BOoW9YEhDaAqZXz9rDR+lfo+NRt
         MlZ2F6d0ZPhyajFyTUOU1NgeViX0+NeY6mGFy/2NGg0k7dkktF59ep/G8/DTs49bpS6/
         OGLY9r//eNfoz1IL6X73NLwcEWzp7oJlJdTdH2T57SUBaEXxIraHTNEe6/ZKLUjaABRm
         A+cRNh88DjNdjmzrWOiqPWAHm9V9FmXEw7krNpxyS3FORmsvE4cG2gA7h8QQBgde1aNs
         tyXzwi635QjshtXDiGGVlbb5wL74coHuBMJ6g7+jBVmmwdrEHbRs5CD9V2V7oiEroFLz
         poSw==
X-Forwarded-Encrypted: i=1; AJvYcCUfPL4eWLX+7nMyppUkqrFDRoEOBuPea2GZJFZObrClk7QmgoahWp4KygziA8YPt04WZ0SvOQW9R++USGb+xqUq@lists.infradead.org
X-Gm-Message-State: AOJu0YzPup8MOsVxLQMRjXGEkyavdviqLtBQAnIPTQsIxsxtAMqb7zU5
	ySk4m8TzB/DUSPSEGzUdgmCQobCr6hvWt6twAdQuBeK3DWS6vaQumPb0if5jBhiKTsZxI2+5P5r
	xaOHH7v/RVFa3gGIlDteG3Y6rSCWr6S1bleFdXloYht57TWNYjFFz5vrDHUr6C6wxhA+omgd8cA
	==
X-Gm-Gg: ASbGnct/6Ev9CaHwecPi6Rjn0PiLK6XOVKJny8vn7m22i06hrn6fkCAvh2cxi/5k/7S
	SZJO5tVFSZgZLJzF2A4LU/Y8YUVr+ZaR7svYRt60TrxOM0c+t1O7re7MLW19So685amWMXTfW6V
	CieqxDJ+Xo92UfIN250HAjZvgCRwrbsN3V7nEelDZN7N/4+5qQNgTFj/sQyBPhT1Wjj3a3wvozx
	PwfqmGc68yhKSJZyfrvAT31aEuYU2slO6CKMcOnCrBKUoWpzMy4vVV0S+NdeU9ZudzxFHWQQgN1
	+P4rhGUvnmWqN4VzbIWnKdRCEcn7Np0Wu+02tHTKu4EY2qKUAT5uuLHE0gH3OgHae2czvP65Mc9
	0M+vQQcDI937YgiLVwnqodWOnLQTJ
X-Received: by 2002:a05:620a:470e:b0:7c5:59a6:bae6 with SMTP id af79cd13be357-7c57c73d882mr1684574885a.3.1742233487119;
        Mon, 17 Mar 2025 10:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBxYIzksBGnChS/AovmHUHeN2e5lmyChYe4xYLbphU3GfTQPEwubfYg38kAyG5wmIS15rzkw==
X-Received: by 2002:a05:620a:470e:b0:7c5:59a6:bae6 with SMTP id af79cd13be357-7c57c73d882mr1684569985a.3.1742233486764;
        Mon, 17 Mar 2025 10:44:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:44:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:36 +0200
Subject: [PATCH 1/9] dt-bindings: soc: qcom,rpm: add missing
 clock-controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-1-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8nULrIfJrBwoVzJEZHCD0NA8+LCu25kRS1unw7M1muU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/qN+LY9vVJvvG4ptU0UP+XAEbBBkuv81pfWVQtnCtYn8
 HaJzWXqZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEHvxg/82uqB/ctvpQ4b6c
 83NYnGQkyqb+n36xhzFCP/kYx89ch/jIla4+v5L8ldoUHVIjRSUWB6jk2KQdKnhz7GtObPC67t1
 pVd4/LV39cgs+bDlwYkPxb9ONtmc/dUfda+7bELRWz1wl5c+sjQ/dE9KfbeBcy6V8ujKFl3u5VO
 yCr/d2br7l7ZafaHksyNzDXHy//7MtYv805qnuEffaon9BnEPTQP9uTPyEBpYUwQvffkewHhBkt
 T2rffSG+Bkey8/KdcFiaft3p3ea14rxCcuWc++9zPf0g+Uqt9Osvftfz+oqLj099/XRWYpBnfXL
 P0vJxtvwZre+evbh0lH2mkl75ygb/J13/0Qb/wWDnHu7AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W/I4VQWk c=1 sm=1 tr=0 ts=67d85f8f cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=-Z_mRg2wFor0aBS9cE8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: iW4L_31X3ecsjIAXx5WxNLJyQPdSQXrh
X-Proofpoint-ORIG-GUID: iW4L_31X3ecsjIAXx5WxNLJyQPdSQXrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_174453_035422_B88BB595 
X-CRM114-Status: GOOD (  12.39  )
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

Fixes: 6b42133d2189 ("dt-bindings: soc: qcom: convert non-smd RPM bindings to dt-schema")
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


