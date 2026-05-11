Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA08ACD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 22:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1Ik9X4nwCWuWmFkc7YBJISS24AV0UyjAE4EfL4tKIs=; b=EFo4GXoD12Htn0vWchM0NneHQg
	QvjJpJe3DZwwKTqS0U4Ka/C/7VZ3sQSOXxXi4m5WH799kUWXuU1z+59L9laMgNOjaOwibtvrVbaeT
	breBsFbHM4yIvB0KfJ5TmEIte0yk44buwi9qpZQjt1gykElU5WEv2MqYqmJ6xR/ctCRphHpDIVLb6
	YtkgGR519JMkYJnBgCI/Rt1Qt50hL6dWScZ5TopkwufhjQAp0+Ico3MlBUdGojR6UUTZhWFINZAby
	JXEMbqDONQODaybZaFGk7cOocGK6Qryn4N1YIgTBSNOmEKh0wPpn73y+MFglQUVl4sCovYOG5aX/5
	GneFsO4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ2R-0000000EuQO-0CU1;
	Mon, 11 May 2026 22:23:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ2O-0000000EuPM-1oo5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 22:23:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6aNb2518217
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i1Ik9X4nwCWuWmFkc7YBJISS24AV0UyjAE4EfL4tKIs=; b=hKo9MRf3/BMSbuvJ
	o8LINdzdvxd16Af2Put7T6zzZBBUBCJI1tB5ibOUFOhmhaLx9iirsACJRiU2fHj9
	mphD/eMOE/pybz9LFSFRLFTnrpfZuM915o42jL6vn2kmsrpO23Ap3NMwoZcPtStv
	ko/waX+jd3cegtaEimjRbEQ7uNwFH5raSxLj3ECssCrZj5QOupsqKjdRUPhshMEg
	76ECORk0L+sioTLrAdxa65fWi6PllGBYSv4ktJyHsm0+2gxquJ0ZDC2pDkDkFbk9
	c5NDnqy6nCJ5L6bp/KrXE2hk4/y/eSiVAgS8OH8rjFHyMM6/Jj6DpkZuNJVSM0U9
	7zpX/w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1gfk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:23:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c828f0f5c23so833055a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 15:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538222; x=1779143022; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1Ik9X4nwCWuWmFkc7YBJISS24AV0UyjAE4EfL4tKIs=;
        b=U45hmgOu0mVhLipfWdAVpLHIqGQmrYAgJoqm8K+IobKj+vYQ3IDJYiUFXxGIXov+Oz
         KJhGhz2G5VKsW3WvQjHoY8DjoDo0viVLtpaHHvZh8jrFHd5uOXaBQ2CbWc893aFcx32M
         oHBJNRiqjOxHUX3BFcugPndVXJOrZZ1UJgHMGuCQVFWWBPnXDnlx0jml4qsendZt6AKZ
         rlLSqRG1If1nkiLPfNOXF8GSn5ymtV/1yNdur9OPOddUoXbB6zink4ZQjks5pAj+Kx5b
         8nZsllyqx7knE+RnE9NqJNub3fCLG7NB9pviQlqwhZI7jh9EVBF4WpSEKQ5h+SgRSa+r
         WXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538222; x=1779143022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i1Ik9X4nwCWuWmFkc7YBJISS24AV0UyjAE4EfL4tKIs=;
        b=lt7OGE50R7JodqsVQd/14jL0Xg5GBCocH5IWyuFKHsmAwdsR+PsJvftqkmruQqrzUN
         U2KKsNzBktrXNp8z2WDZ+N6Vwzd+h4XnYfYTlCWMWJy42Mkcg0phUXFOTuFFaI8bdf9D
         3eHsAqwwKcRCZUaU913lobNyDLQ2hBR9AVIcmqAK5XDTh4L/uaVs/llgWpaAHj70sm8y
         1N1F7otA3SHUC+jH0h2Ma/m51FKvWjAt0YUb9WhGrkpkjVuiduu1cYmpvEaqHgXCtk3G
         CyKuFnBagHBdspAo5LHYWrlVF5u8mwfZsgbWS8GtaaDGYguWG8Q015vB2vqqKNGbptXd
         e0cw==
X-Forwarded-Encrypted: i=1; AFNElJ8n2k/leTUftRKI+I79xnz0qbR0e9zP6TixrW3MqG1QUHWJ9DkrSuy5G4cCJU3xIIJlrf3asUcJwxw45dSqQEP5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm0lTrkefONOdjpzAaF3rq5dZFVDwszZYo8j1BAoRpFFFI0PFe
	2S3SRuUN2l445u3bsPvHHYY8mGO3kciOUF5ZnZfR5erEdQp9Y7Ekhvu9B5jzr/GmByhOCIJFfOV
	Hz+FjhJ0dJrw4unjVLpyY8RlL3h8vpdHkDJ2kPhozELvJalR7ZOnxk5kiHMjfSXNnvwF7dqyOBF
	JZBw==
X-Gm-Gg: Acq92OFp3qiePHyV9kA6XZPuRHu82G5eZztKjBbmCSYNVkBjAqnLYmdAlbApvNQqNUa
	reRI7t3HMy1OAQ8Hik/o6sDNYtyewnX8+DRtXxIR8xAreaiiObTaeVOPfYBmGxfH2nYAHIqR64L
	5B545pYwfpF8NoMxRPuyTrruvJNQl8hFVJt+unB/CLky43PDKEm10PXG6gJTv8ycRgfoAoiRsYV
	L5X9s2cIuPjDurlVRqs2Lmvc7a269dhlkrSC/HoIASBOP8kmNFZVkSaYoxrE05gy8JD2244WMd9
	oSnmZsJlragc6290k0EupQygEUrixhwnrcTc2jzu3cENLGlY2TRfif7aAvs9kxeC0IhaXtra+q7
	1nwa0ndvm6ez2XhS/o9KXrFV0BSLDMwjyIVgaOLOL3FI2Vw==
X-Received: by 2002:a05:6a20:12c5:b0:3a0:b781:4c80 with SMTP id adf61e73a8af0-3aab12e2f4cmr17859619637.4.1778538222146;
        Mon, 11 May 2026 15:23:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:12c5:b0:3a0:b781:4c80 with SMTP id adf61e73a8af0-3aab12e2f4cmr17859568637.4.1778538221662;
        Mon, 11 May 2026 15:23:41 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:23:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:15 +0530
Subject: [PATCH 1/8] dt-bindings: arm-smmu: Update the description for
 Kaanapali GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-1-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=866;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qFEjGgC4wb1fvQfsiuDZ/uQBzV5scQmb40bLkCfeBGg=;
 b=63jkHzMyfC934McaMS72qQzI1obDzNntWJQBUz0AVtE273amGFUWx7fovSDObmw7m1nz/fPSz
 r8jcxbe20XFBLRx4d/OizdOTrANdLrOMhCUnnVRkTpMBeNetRGijKeL
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: CDyTlSPyLL_i3qnR4ACwpvVfEf2kaIFm
X-Proofpoint-ORIG-GUID: CDyTlSPyLL_i3qnR4ACwpvVfEf2kaIFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfXwrHwh2Nrn6p7
 3AFB0DRGuNT3CMsyLmeHuA4p1gpxwxGN1U5BMfjzTJKyDow80dQOEpPwfEmNrxEi48pu0MMzCV9
 0ZciYLtJjntsE+XDWjKFBG9eu/avxmCPIVxgBCz7iytVxnuLx4eUA9Q18RNxxd2QsyXwH7FVicC
 rOCERuZXaAyjBgwh2jaJGkAGjZFIFEqX2hYHo6y6NhlgSlRy8iXjZOEOnXaLTULW3uYHBjw4JdR
 h30C0/mWAL+mkXHsdCTeflSxWyoFNbZWBS21KZ+1T51pCs1CSEY+cqgCQn0ix6sxD9SHTA3VPWl
 OuK+OfiuEAy8s2H8Myq1ysB+cJflZsw1/gIoylGEfQVMJC07HKTBmzq8pLWbEAX5+doHvXSUV4u
 zG+pJAoWDW8NHm/qmadHl+nhIThUBgJ5POAN9RuWL8xJ4lT7NpISyefGZvRx8eVgbo0bTns3WYC
 hQRmSLU/vpkRcNHWv5A==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a0256ef cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RQVZ3Ks9ONUmwc3llXAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605110236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_152344_600862_FD529AEF 
X-CRM114-Status: GOOD (  11.86  )
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

Extend the sm8750's clock description section to also cover Kaanapali GPU
SMMU since it uses the same single "hlos" vote clock.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index b811ece722c9..d1330fc0178a 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -568,6 +568,7 @@ allOf:
           items:
             - enum:
                 - qcom,glymur-smmu-500
+                - qcom,kaanapali-smmu-500
                 - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500

-- 
2.51.0


