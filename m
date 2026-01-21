Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B1EC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aMdXQSvss6tWFyMGcNBPhnc7uNK1YRXhNFqpjDjbWyo=; b=3lhbnyCSiOR1mqtkJqAllKAu3z
	V5gG4WQvQA9xUYyDyRy5AztyKIwNeEqaoD3HC1YLowqTpQmTi9BN0iNAVKUfrOdbCHPggzhowgTR5
	ZVgxlgXutQ+1rvHJa++bnhyKi1MgtXN/1aabarCdGIUBE18eSA26xmWuv/c7GOHeI+ilom1FqawFt
	oKJpTRTxkQhXP6xNZDpnrZ7+mvygYNyz9cMk9mybZVQlyZjohyT2TC/6BEPctVrpCatIuOhZMRijU
	yrnM06IwtbcDz7BUIVaR1tr4OHzvbbPhwu1k5pZ4G3T83WdtChUAjjAmzT+nxMroiq2YoVx0beRiD
	Sah6Pt7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viafU-00000005lCX-0xeX;
	Wed, 21 Jan 2026 16:02:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viafQ-00000005lBm-3QVe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:02:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LDVJYB3867424
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 16:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aMdXQSvss6tWFyMGcNBPhn
	c7uNK1YRXhNFqpjDjbWyo=; b=DxoGDr0GkOfW2gIbT31Uz4ZqrMqx2/E5LGQbyM
	RumwKOKl8XAi3mebUuhlcrDRXWDNZOS4zg86xfbrczh10X16bAi/DeYJxnvPDjTW
	2NEVeNvgp61UWDbaeY5pBfWpEcMb09Nj0xY7W2COoLuJ3fQyGmRA5geanm5BOGsH
	6QqzjpJC4Um8ZTypX72LqL4oJF+3g3IVeFeSHPgNL9GmT7BlrJAo30PWvR1B9r4U
	20YaugDfvhM8DN1FW9NT7noOwpZ7a1eJI7P5VlD+Xt0qHKMYSQR3zJyFCjg37yVR
	gNs/kwNV72K01edCnY1p3sFuZycL1olbFIM6Py/J2KqoxJow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btyrpgjpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 16:02:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34e70e2e363so24546a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 08:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769011366; x=1769616166; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMdXQSvss6tWFyMGcNBPhnc7uNK1YRXhNFqpjDjbWyo=;
        b=TIB+mfgsDxfv0W6ACaKW1a0Xa2wREoYGPXuPFILe4Lyv48w+me/jXev0Vs6aGE2POc
         rtwGUF/WpwRTij//W16xKCY3colG4zu8i26USVg0Ajh52bmThIiN5LWFjyHfw+RmJ/Ua
         E85HIm7Vh6pYthqdyqrO8GgZJJhFRRsFuHNqEWqJODaVRf/2zbTxk42xUo+xHz+GhXYB
         QXG9T06nr0dAqkqOBxF5JrYaojCSbvrq4pZqCCI/3pF3xPCtzj3eH0r893nTt/GBP7Jg
         TTcASGik9k/sjzsNZaKrmXOGQ+Yi/eMTingXNdyVuGyQszU9OKyhNAqO29BCwe82CFNj
         t+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769011366; x=1769616166;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMdXQSvss6tWFyMGcNBPhnc7uNK1YRXhNFqpjDjbWyo=;
        b=a5nu81ADck6e+cYSltyr/fCkubX9zyAwYfAQxd1+psLxqEaM5KovR9pt70r48ONJTU
         UUZ/KfdUgxZOE/7Q+JxR+HoKJWmU01SIAPVDFq7h/HXoPnIRxe0I2fTEQHbMst8VapY7
         Y8xNs3q+J9vWtocs13rPxFjvMDFxDCHrOQ11R6JGW3xW6vAcLnCRHNcFJFZfRlLt4Q3O
         0HuWzgkHtDcE0qCRjwNQEShP+zqR3twqynlYIX7jPuWLqh4Rkur9aKMIS1HFTuZ25gOC
         dFO5vc0Npol1nZlQw9dyP9RPl1RoI+pzMJi4+Nt8aiLPihdePrYmdz2veKZvOZQf2keO
         WGxg==
X-Forwarded-Encrypted: i=1; AJvYcCXARt2WG937gAkhX9Roc773Z2DbimswCTGiUQOQ+27J2upeFROdG/QQSKm7t7ILUpig9gfT/+RkKc90Cy9QwFK4@lists.infradead.org
X-Gm-Message-State: AOJu0YzpXQar3+EdJCq4vg9Y8iotGZPVYv9GDVOZCtfaKHYMuuIjBzal
	a5IxjGK7OW2rhyx4bgOGX82xKuG0Nc6bBpBdOLlTKCGu68cDMX6YXIfN3uruuXg8SsemuyY7at7
	iujjW4+4ISZT+EfHBdY3m9KHxuEV1T50v3jbhvEbmmlH16S87tfyAb0SNllTuAO6HLkMVt2pj1/
	4Ndw==
X-Gm-Gg: AZuq6aLsEKHrkP70XpcxoYoO2QalC/lH31EnrTl1/tzOsqFj6MCzhKybEc0p9GSk9fx
	EqzC5fMnxyzhuk3jzDSPAHoVlwVbFqChdLaxzFlt5idmLTlsxDQco1kg4W7nub3HCeX6xcVgiT9
	7OpElod/Jt3GcMnGe+mymkcIicg2akpADN8auugjaiCgLmGNf2TCFFhlo8U+PgyL/9rCrmKUDE8
	4paaipHGZA1FYy8cDb9t+r/yi0lNHEEjRpfMymz91bDvgYZ3WmTS7wv9Jzxn3g68W6fgT/Fglki
	VM8NmhAFX1kgiCfc/LduOmgiXtxwnWEfh3Qo1NLhK5ygPBXH/j5BDbPDO5ICry3YBkLaDzWt/vh
	ysVQn3wDDHRbqcYJbUoe4EI9JpSpXrg1prw==
X-Received: by 2002:a17:90b:50cb:b0:352:d59a:b28 with SMTP id 98e67ed59e1d1-352d59a0c07mr3968785a91.19.1769011366211;
        Wed, 21 Jan 2026 08:02:46 -0800 (PST)
X-Received: by 2002:a17:90b:50cb:b0:352:d59a:b28 with SMTP id 98e67ed59e1d1-352d59a0c07mr3968652a91.19.1769011363854;
        Wed, 21 Jan 2026 08:02:43 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353032f5e46sm1123495a91.7.2026.01.21.08.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:02:43 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 21:31:57 +0530
Subject: [PATCH v5] drm/msm/a8xx: Add UBWC v6 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-kaana-gpu-support-v5-1-984848af12e4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHT4cGkC/3XQzY6DIBQF4FcxrIeWH63aVd9jMguES0tmEAtq2
 jS+e281mXRBF5AcyP044UESRAeJHIsHiTC75EKPofoqiL6o/gzUGcxEMFGxVrT0V6le0fMw0TQ
 NQ4gj5dwIrhuruNEE54YI1t1W8/tnyxGuE9Ljdkg6lYDq4L0bj0UEH/Bib6KnPvk9LtrDbSSv2
 YtLY4j3td7M1+GtiWSZJjOnjNaykqxjNWNgTiGl3XVSf6/Hdrit6Cz+Ic55FhIIdWB5o7SpoC0
 /QPIdKnOQRKgVkjFdA/6R/QCV71CTg0qEmgNA10ArbXfIQMuyPAHCiVk30AEAAA==
X-Change-ID: 20250929-kaana-gpu-support-11d21c8fa1dc
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769011355; l=1710;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PaTkkbTLymilZT5IHeccGXhs5FbYXmRp0kXnIdLl+/0=;
 b=rXu9YJKS9ujSb5yaEUR2l2aYorjvlsWV7pynHqrZWZahhpAS72Vx7fVtv4Qe6+d7fBolYwErJ
 VKSvfw4oiHkCxTeAcGIyxWG23AW5Gb6Kk9n8pIY61s6/gq+UvyO+cuO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 1xF6bo2-jMCQRJHm-uLWiDOUhgX_llN6
X-Proofpoint-GUID: 1xF6bo2-jMCQRJHm-uLWiDOUhgX_llN6
X-Authority-Analysis: v=2.4 cv=KpdAGGWN c=1 sm=1 tr=0 ts=6970f8a7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dVXzBuOjJOJ3YG4SI_cA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEzNSBTYWx0ZWRfX2O5vYJr5TD5f
 4GcYgIFbf4gsWm3l7Xqz163yMKjzsWgFZgvYAnAVa37df6DGNZlv7e1O/V+sAB0Sjei4gSyR2ps
 iSchyNuiWFZH6YVyZH8OgtFYVqRUMl+typmawZmEt1YUdQM8yA1eLdopLekoHdiI7mYPoH+f8KE
 CEdHBbuxWe8xBEqmce6bSJqBHrtrUYvnaJGBg+dKfsfhnNCf/aFIRMBtYNwG2oKfoXnBSvZ3z1O
 xfOzvi/6JGtoE5Ud9kdtADvJtrF3FhOFP2Lphl432QgDh2yCneVYOCytsC25Scs862TZmasL76i
 m+jcfOUF7tiK3RofIkIIWfQhV/5JNwuhAU3idEUNDRrQekeALGM7PsWtjBDFdNT5UT14KQnogjP
 9GoMYcz/57dej74Jo0Lwg7LKFCfnxYTAzflXLnmL58B3xHSQ1opSMH7o+69HdYpoMozckzSsi9L
 xMeifYbfFi0wMRwHhKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_080248_870679_446E62B8 
X-CRM114-Status: GOOD (  17.00  )
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

Adreno 840 GPU supports UBWC v6. Add support for this.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
<< Trimmed the cover letter since b4 folds it into the single patch >>

This series adds the A8xx HWL along with Adreno 840 GPU support to the
drm-msm driver. A8x is the next generation in the Adreno family,
featuring a significant hardware design change. A major update to the
design is the introduction of 'Slice' architecture. Slices are sort of
mini-GPUs within the GPU which are more independent in processing Graphics
and compute workloads. Also, in addition to the BV and BR pipe we saw in
A7x, CP has more concurrency with additional pipes.

The single pending patch in this series in now ready to pick up into
the msm-next.
---
Changes in v5:
- Dropped merged patches
- Rebased on top of msm-next tip
- Link to v4: https://lore.kernel.org/r/20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 30de078e9dfd..5a320f5bde41 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -276,6 +276,10 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	u8 uavflagprd_inv = 2;
 
 	switch (ubwc_version) {
+	case UBWC_6_0:
+		yuvnotcomptofc = true;
+		mode = 5;
+		break;
 	case UBWC_5_0:
 		amsbc = true;
 		rgb565_predicator = true;

---
base-commit: f185076da44c774241a16a82a7773ece3c1c607b
change-id: 20250929-kaana-gpu-support-11d21c8fa1dc

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


