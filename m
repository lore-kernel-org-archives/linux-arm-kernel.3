Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A01DC44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpSk/sxlXac8sHwGv3xl9A9ZxePRN+0nqtegrBdDwFI=; b=X/6EzJRD+RfXyy4vDbIf/KGqpJ
	S9/Cwzr8r/qqKL9Vl3Mjo6xP6w7FyZiHHDKVsS3CqLQdMihdcJpNEPxC6JGBjPzYdwRXzC0ftCn/D
	3Bf5Nhcbz8P/VJaofQ2lvjgRXxzdcOdXqPp5754Tlj5tzbIwDphlaslFcExiVE70vhheMjBXV5saA
	BSQP9eegvdHZ2raMEZwwHSx/B5/p800kQvfIl8mGiRC/1jBSwzC7GNhmLyjZki14KtyVmR5HALilS
	Cw96YeypeUpd/AZsvlVDpbzVpVoEMRWPnvJyadB3IeCQVlqJrOhIY3BK4XmP6ftCyShhR6JYQVbYE
	UujxW8YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgI0a-000000096Vr-1x4Y;
	Sun, 05 Jul 2026 08:15:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgI0V-000000096TV-2NiC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:15:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664KY08R3976388
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IpSk/sxlXac8sHwGv3xl9A9ZxePRN+0nqtegrBdDwFI=; b=GLqsR38d3s0O+C3G
	ha/Vk5wbBipwboDBHv0FtJMt7TquCLSezQRxS1rHaQVrLikPi+USFxAIofO8X2Tu
	G33bNA9Fh1OPc+7BmajK7Bq5kQTOIbqwvVkPtnXUBAbj3nZdEzquYpZ15MFSuFqi
	10egRU1BM8d/r9dhlPKw0QPcOiLj98U0vd4w9IMcWg0/7YVCt/0UWC5oSHbu/H/A
	+I0atb2HmOOJQfgM89EunmAdHsdDG2qKX6wybRS63Y0oEQavoHuPJC/3Qx1duOV2
	3Tn9Itr4lXKoPb6rB5cBI81q5a7ZgxcjXcaTXQGwTuzqm33d8vcJ1dmGLYPNp/sZ
	RW3vvw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3aaqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:15:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caf4173b1cso33799375ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239318; x=1783844118; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IpSk/sxlXac8sHwGv3xl9A9ZxePRN+0nqtegrBdDwFI=;
        b=XdGVHIyS7Fz/Tg4r5A4gu3Vf5rj5NaPyQ/ZzOSMPdE2NXAJFPzk/GNGpb/cVoEq6TA
         m6n9HEsVMW30sy/pV/pSivox+c3+dLTAwpWn4tv1Jf/IIlO3OjEJxOVWG7wfjRsrebht
         +ud459DuIffigXs73C09wQLGCmS9VW7LzWEbKVZlFnEAWOMsd86/MV5cBEyaowrAri8N
         ozww9aScJZV0+EAWilY9nFCjn31HemePxVxlXQnvq9OMd4LYwOHZxTGmkvLnAKtgCitF
         SbV3JcA5Zy/TdbbeI9t7ZYmkxPDGh8p53FRf3/M0lglVc4hZicQIBwmPunkjOShl+w6m
         hzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239318; x=1783844118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpSk/sxlXac8sHwGv3xl9A9ZxePRN+0nqtegrBdDwFI=;
        b=DLOZWyyUj4u7DpUk9GlRkMVkje8TwHC+x/mdRdCwl0vcRTxN7dD4RvTxSNtDgBbnzI
         kJFXvcABvibZsgNzRZvK1o0OPfd89DipvCdNzpDaRTlVwB3krONA80EOPvkC2q4J+5OT
         UxmQ3+8vM8T8R84bOKSUcWB2zrKWC1SZ+7IvoRKzxQK7Ft+bSiw8Os9hjchE05MVVFzQ
         MEQJYXCmcnH0D9HCeO7UzAX16GyYTpPm4zs4ggXePsCyu5vS/0+ADcy90vPkegpNh9X3
         cFgvXUlyYCpUhr67WnSKak9phRc6lClJSSrluu3hLCSPft0gkngtG8qOnkukTJJDZyDC
         BZBA==
X-Forwarded-Encrypted: i=1; AHgh+RocIVdKir6dCPcFsrfQ8xcdvw9A9bKGiR0RKf5QXTLFllkAIi1bse1Y51KVS8wPBz07sxz508P8jJHwFewJqDyh@lists.infradead.org
X-Gm-Message-State: AOJu0YwH0918MoWu4+DE6Q1P0Y3Y5HwjnW+JvH7tRUQxu8Loe/azDzQz
	s3u5eTIkCicAF/ovCZG8kyhHg4BmUDz1FkxPSbnXXS87U3vSpNPZ3JMRxxd/a1RG1XwJXC+sbVZ
	D0HtVzCVJCDZ43gNVgn9QvOLvam8jhyaOUM+lgmM5GVxGAokEp8ZNVPjUqX34SrF9VFBCJBzHl8
	pkPw==
X-Gm-Gg: AfdE7cmQa/TGypJA4t+Ssh8ErnlkV6k8Y9yRnwTWpfXetXzS5bA1nEvO1yi1PYxm1yt
	bfd+tHE8bYDor9bdMXYIzCRJVEWy4In+jqXoIIfY7R7O3VFc4TdjwhQr9k/FfTzmTo3DhKxKbnW
	eyyWRXRFxrfmxHfTBjdwXp+HwFF59Kyg+z1TmQ7A2ACxXhXOurFz5h8yMKfYmkLfK7qa/sqE2/f
	CRPK5q2KvOrQ8r8qTdZAdtOmv4Im/ea+4eGuXAkbL5oXBgUJZmTx+wRbW2CJY+n7lSdR1RBwUE6
	TeGUz/8tK8yxbsT3E+r+J8bLVYixtQwtkJOzsk9zh90W5siU2FsyNvSzYnc1M+7wBpkeIlOEgFO
	JiMUtF4TgQuzKJzVFrIqG0BvRlB7lbjmvkNA=
X-Received: by 2002:a17:902:ea0c:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2cb97e432afmr54557725ad.3.1783239318303;
        Sun, 05 Jul 2026 01:15:18 -0700 (PDT)
X-Received: by 2002:a17:902:ea0c:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2cb97e432afmr54557425ad.3.1783239317878;
        Sun, 05 Jul 2026 01:15:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:15:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:20 +0530
Subject: [PATCH 5/8] dt-bindings: display/msm: Document Adreno 722 GPU and
 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-5-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=1907;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=SYs6J75vDEjoACg/8a3Xl+R9WIudj3QmUdBCIW4Akd4=;
 b=pgyLEEFK+ZpQAfr6m8Tw3cgMFBAIXB4mjqFjEtA7wyC8js//XGYK0pV9c7S79qGFwGMWPQOEd
 aGXOOqZhfZ2AqPhfgXlTvu/igiit7d6XcfyE5WWNIIiLyd8Zzh1MKgx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX39wVTIrOqZlZ
 5OSt+6CnA+9Tv6/vboydy0R38x3A+zM07AB5MXmOAzaVXUMUkVrDgAWc187OIqWMyFqLXUYbSV9
 f0Snq2TpnftD2PP1DyFWL5EzKj9gsiI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfXwL/tC+i7Pz9b
 jrY7Kc3mGP7f0IbaUTWkvNzLweCW+eRvEpUx5UYv0HrJXMBBVEztP6IMU0eTtQTXDpzD9pm3Whn
 XJQsU3EPLUQpF520XxHA7jPsemKgKpVpi54wm9fWftOu746pSrCqmXQJtFW5UhI+UPzbiCIgy3J
 kK5KllVjnz9EiZ0ZBRocsgBavFmTlck7JAi2ydABKbhrvF7NBcO6VUVpbj/TwLF66l4ZcizJpnG
 Jq01syOSytulfKq7d8fKg/lhjNQ3qs6I+tKQMO54mBP3sVqFnVe+AjfrqUE7/yuxYlVZlsOyZVz
 wCB7H4YqbCD9EE3dDQgwIcV1bz5hL3TPqyvJJRJGnEwdS8Iq0sY4eZNzZgY+1bpEOZG93xPMEnd
 RPehIuxHgd3adSjDk34oNnz6Deoc1So5hvKGRryX2N56N3rex89Wgn/jGzqE52L2jXy1XnLtRGF
 nxASYJUoqtnp06H9qAg==
X-Proofpoint-GUID: hy123Zx78QfT8PZ6UizWJzDR3REM9tAw
X-Proofpoint-ORIG-GUID: hy123Zx78QfT8PZ6UizWJzDR3REM9tAw
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4a1297 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=byR7QgRKzgUKQ7cIeKEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_011519_642693_26478AD4 
X-CRM114-Status: GOOD (  11.80  )
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

Adreno 722 found in Eliza chipset belongs to the A7x Gen1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include lower cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

Update the dt-binding docs to document this GPU and GMU.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 8578c2f8122e..9e459f12ce3f 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -262,6 +262,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,adreno-gmu-722.0
               - qcom,adreno-gmu-730.1
               - qcom,adreno-gmu-740.1
               - qcom,adreno-gmu-750.1
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..d096632694c9 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -443,6 +443,7 @@ allOf:
               - qcom,adreno-680.1
               - qcom,adreno-690.0
               - qcom,adreno-730.1
+              - qcom,adreno-43020100
               - qcom,adreno-43030c00
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01

-- 
2.54.0


