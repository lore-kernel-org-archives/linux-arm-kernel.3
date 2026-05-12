Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DF0CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 19:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=; b=pkYXmo2mDVppbfBoacXpascKNe
	dtEzLjvlFddJkMGhmTdmMbPRXuJwNtRqIMrcmE0+dcradOL4JOgDAWqbbiL4ybeUJN9bREBaonI/k
	fh2A0Rfd4NsqnEvKNyQUm6Hogkel5b+yAQORuMvBtHwUSYb1saQ/MKRWBnr4bbUH4Igk781ZTAAgj
	a248d3E+Fq7BbKpuSGw7p9sG9MxDcC92vZz9TBOL9AHIL29PUFS5lpYgkXZeEpfEv/mokXFaIXASK
	z1akqLr0OObpaIr4emvvVet2kfJPMDfm+5zUErfBH5qmc8YagqvkDtfB3AeQkl/0XIXQe1hq5LmsT
	diAXsa4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMsg5-00000000CqE-2lsp;
	Tue, 12 May 2026 19:22:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMsg3-00000000CpZ-0U2m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 19:22:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CHYAl0591816
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 19:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=; b=fQ1PfBqWK4vDsgBm
	ASJFjwaLyIafukD8fECkcArllj+7wqOucIOdTZ9SaHXQVZhlxRgPKS3VZPkjdY13
	TieageF+GcI+pm7PH9pyulrrEyjtlzGB8hR9kb2lFK/WT0cvDoL4oi+zFvfXI6x1
	nr9HF9FtBP/q2pS8EMRbRCY8n2mqRj7FspPVyu8CdA9ONWKr+C2VBYTAxA9VCAvm
	hKNfIx5wS5SM2nqdpXQYGxviuDrsq8DNd/szkUj7vF/YgFavfaiPn/YVswi6vS/f
	e2kIR3rbu675gKQ4zKSwNp4NuRItafeSs4id9H9HXWoskC7B+BOKE4vitb9rWyWx
	0JTlKA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319t2s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 19:21:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8294d8c48eso1502438a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 12:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778613717; x=1779218517; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=;
        b=T0m9oB033RQG8vjH75Ve66rFtESY93YbDPMsgxeSbjm07AdX2w1FDC2m9o+bF8AK1V
         dAys2xMIt0o2cJA3FlBhfzm8yQ4PEogQuSk1riyGfStJyvYo2Q7hz1FmjAKFiamWYWVa
         10hI4K9Ilz7XHLKAi2lCv6wx8vSAAjTvSoZXYZz2s7pazG5Q6Vc3t122thVgD8Vb8LCM
         ylWD3xOaFjLImoU+QmpLAg6pRw1FkTGehVVDQrWjSVUroaaRVUjg1rr50WbfbYJYtEUQ
         MHYqrdzF76/+KQx+i+WuEm8zMLYlYkPAgR8fpOJ8gBphuiqkes74L8z3tHxMi/NAueUG
         N1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778613717; x=1779218517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=;
        b=Tme2ueO+626Z2TC7NuE/5npAswK9I+pQlFwTrPnZR+j/su6Ye2DNLnkgTgawlFuPe2
         A4Uq+0cqV22TO5eWqMFlcpUcOEaGxR5Xl/nAPwzK0TUH1LnH+Mf6VluowCEB+WgLKcL3
         97IT21OuMhIZO/gvBbvW1NcEizwc93H9vRWB6SzaVbcY38JLTfWDsmpaMTkAOxsbIuZp
         N6T3bbw88IsdQvY8zGjJRX2FK/hvK/OqN3GrMLu1R2Rp3OLNUSLQoiN1ZV55tCb06AnN
         q4sPW3yF44Qhtv9c4bodXyUk2loZzu+aN8c65V4cXDPjTBNIJHfwEU9AMCmoSxlyEkrq
         lrmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Dji7roBo08Axzo4wxHYHYr9SmbNy1ZEPEkQI/TWk0rqGDZ71vsEGL1INK6zuxbTpmZtP3Cs/tuXbCnhoN+bcx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2FM211mUD5CZ1BCJdC88B+LQ38S5Tuep21dy9Bb3Kj85eSHjN
	PBB04DBKSZo6Q0ST0dlhiS+9DpIwcB3iiA2zPGVmyJxep8V9eWNAACw2fn8ZxGnage2lhBJxm3G
	kKL/iB7/yOwtdCN8uxkiAUYixNpfawjI3nwt2LuVQKVPsUOZIJtrJVy2v09KwZLyHSjEqRA1Vv6
	OP4g==
X-Gm-Gg: Acq92OFsrM7NVsD1i0S6NCCJYDY1FIBpmoTgwF7c09xJBrWwGwi/Fudb/wrVHvgxQY9
	QW1wWuKgwGAcz7CHgNYPMsf5f5W97faIa2k6e8mK6Y19ghwiXE2SHgAWk4cZ0GasRh6LgZz67JH
	1MQ3izXWF43xAelYGQV3uuVTKCPeazh7Gy0Sh2n0n67lYAxyU6Gn1SBL8GZkHCnFE/c/aIT7mQt
	aHPL6Gfu1KSROhSmr5j4PJgFFwCoU9+DbC0nNkEH53ekgk3eTmbjJ+8drfhM/T2ad8RX01eA6Lf
	KGaSpRRpOySLtyXEv7zDDQgGaeV04z0ahBE69FrDHIyaqhGwbyL8N0NgOw18iRra2wErTLiVg7T
	XQqdWC81/2CGjm+WxrVn0du6pDQvhVsf4MFF8EOZgnOM/GA==
X-Received: by 2002:a17:902:768c:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2bd27133a91mr2513875ad.8.1778613717163;
        Tue, 12 May 2026 12:21:57 -0700 (PDT)
X-Received: by 2002:a17:902:768c:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2bd27133a91mr2513465ad.8.1778613716644;
        Tue, 12 May 2026 12:21:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm141250585ad.72.2026.05.12.12.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:21:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 00:51:18 +0530
Subject: [PATCH v4 1/6] drm/msm/a8xx: Fix RSCC offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-glymur-gpu-dt-v4-1-f83832c3bc9a@oss.qualcomm.com>
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
In-Reply-To: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778613699; l=1052;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=obY0yd9A9w1nKiCc00V/sWC5PfbbK/PzpgmtQExUcNY=;
 b=WFrdXoJxRMyXFTXXynT+vDwKDHONIdU5yJw6WcZBGk2wkEkuw18xTJtD0Ah268ZR+tV/3Pzjv
 W3m23loJVEvBmUzKN29QDTNc5Dv9Uv0e4liGaVXV1DuPDjaagm7KW4i
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIwMCBTYWx0ZWRfXwIbbVVhuRrcn
 5gPIUtokHWtvKd8ndj7+UQ5L2Nfvlv/BQ/I9LCk9KW3N6KmVQRTDFnxgvxBmqRJrMzMqxeNBmkH
 czDD3Mo2YCe1qBtrNBQvYXtjtSV/p9ZI3cFQNGJH16gy7K0egJ4gjVMi1gOhNbCqTbrVvoiiQ54
 ccFzg2Vqw9kjb5Bvp+OmZlgZN65SVUMYB0JFsUtIF5YE+hIJUVNENrHiDJDWBvP7SP+ARsT/aD6
 +1YR60gnaGaOCdcaw3gPfJc6Hiqzo9/TUuO+jjLHeaSxbA8JqDbZW0dVWJnFor6zDYynHQlzQ77
 l2zgHCGHldHwTGQc6MScja7Gb6NOkBw2IFlpyPxQyR77zeYY2Tm91d7sHxrrWUgeKHs1C95FCWF
 MQe1UV5iQ1scdxvVWdd8aVzKqHVNhY8opkvHYdUbBajI31LL6Ac+L2VCZtSXJDz6DTzCPuF0Lqj
 rYswF+gQlcr18lm63/Q==
X-Proofpoint-GUID: nkk_DwQLDTx6BC4qAOfmHMnhtQLv2Gm-
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a037dd6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4MPhRinBehVJTi7DQIkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: nkk_DwQLDTx6BC4qAOfmHMnhtQLv2Gm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_122159_281796_5C003D99 
X-CRM114-Status: GOOD (  16.41  )
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

In A8xx, the RSCC block is part of GPU's register space. Update the
virtual base address of rscc to point to the correct address.

Fixes: 50e8a557d8d3 ("drm/msm/a8xx: Add support for A8x GMU")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1b44b9e21ad8..cab4c46c6cf2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2357,7 +2357,12 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			goto err_mmio;
 		}
 	} else if (adreno_is_a8xx(adreno_gpu)) {
-		gmu->rscc = gmu->mmio + 0x19000;
+		/*
+		 * On a8xx , RSCC lives at GPU base + 0x50000, which falls
+		 * inside the GPU's kgsl_3d0_reg_memory range rather than the
+		 * GMU's.
+		 */
+		gmu->rscc = gpu->mmio + 0x50000;
 	} else {
 		gmu->rscc = gmu->mmio + 0x23000;
 	}

-- 
2.51.0


