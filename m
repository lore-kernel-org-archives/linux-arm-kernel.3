Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6E7CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=; b=JAigS/TbH7HyqbjMmygVT9ipyq
	Ayqtox6xlRFYCku5ya8yAn4r28YtdmIZdjtdl3mJKyKf0taTZL+qeyi6bfG8+w0Ro213+JFlG18sj
	xoXULt6qqHJqhHyAzgULFrS4vVZagZroZSMGzszISWr5xsugXoo5YnMR8gR1HkjQINlK66JrSiEim
	p/XGjECEEXcLPc2TTCHECsKwe/HyJZTmNrU5MeaR6oZJ4Uck0xA9dchZAV8m684kcenkxtMsAOudD
	I4ykDHhVGAMI0hdEqMc4W7Uza/zfIG41aZ8oLm32n6eZ+HNeuiEWfK36TbIfvkUhhMlEQUgp0OTI8
	FVxZQOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUuT-00000005oeA-3xJ1;
	Mon, 10 Nov 2025 16:38:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUuQ-00000005obU-06lC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:38:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAFhn4d3985676
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=; b=pefX5QbFhFPxMWvq
	WEqX56c2bZF/NoxpQmnZAWt+Lkl02FkvcTAAD9ENCMOl+gw+syWgArhpcatRaVhz
	OsLx3+5UGGqGP6R4HIkcKSErnvRAi9C70jhwOWWFmsthUI6n+4BodjkgylCjZWjg
	JV2sBIsricxd2Jzi/iKtTEPxeq3fLTh2m7UYRvGVEyntoCWkYNiqJ/T/9J7nS7l+
	NUBP0qlH0EIDVg1pCVWKs5ZgD7c+WZGYCqgLV0kjXGXC/JJJRdLN2fI1ybHHiJKd
	cnTnG14zAxscCkqswdUccF4fNv5g9EUmqg49u8aCIgtxvTM4IQKoxvcbuAiVodIc
	JbU6lA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjxqg6nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:38:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3437f0760daso4372654a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 08:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792704; x=1763397504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=;
        b=Y2YP9iph6zAp/uJ2fUbBUdDB60eGBFlGGnNo8Id9yrYtuUR65ClEeSiIDWwHK/CpAO
         hdgjCu/vZSwMJlnHWAQ748BAdu+ajc24mQySuNf5GM6QzSh7mA19uPnBU7UKmmPajLyv
         GNEqUBHCgstjQPvVlP5RUyZk7V5/6w66mgCqK1YnR47TK9tlWhPS9xiDp5+XiC5KXdKC
         H/6iW7fTuuo4ljUD/IcMdZ8XH5TOyeSIPOhpT80EqmuS+pgiPd4Yw29vvmIPkyxyN4UN
         VpO3/YkbQ4Lmlq5YK1z0OA87lr1a9uOCAMeG198/18ib75QMg1J/0MYvisWQ1BfV343u
         8pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792704; x=1763397504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=;
        b=QiOMcaMfFYEPWTrU/VUvhAJ+LXDCBbthUQHksRZ3H8dYDhnAV0UOHDkpLjTgmWZAae
         X/le5kQGnH+BJ8L9xjFshAvMESU4bWTLZv2Di86IJrpLwXVlQOH5fB6+bC6biB0TVp+0
         DJ4kG7GS31EmKAC5++BKy9Cv5PORW/W8/yb6Vcs74oqtlycPT+jt7bCIRIHDW3bYKIQD
         pxPBYtH+NcA6BxMTovcyGqzobJDluD+DFtHeZJOZB9Ru0f5TvzNXTjJ/t0IkUsnyEuk/
         McHOgdT2Qz1uIwTLHdJla1rKQM0WHnyuXKfVXdTrbjI3YVekbYq82+yIWDv9sw+X1DZC
         Mp4w==
X-Forwarded-Encrypted: i=1; AJvYcCVn12ipBrVQtF/M/Zc1ttLCcnqJwqIJoeyH21gwBS5NaTWAl7B5MZNEsKgK6BoHMn3i7xb0sXZMDSWeYNs/Vomk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/ooOyMEAt7r4Q3sWRHUuk+Lyox3zpjCnsrzbWNCbdiy2kte+4
	F9joCTC2qBr4sZoaInH5C8+MDDfzy0R+1csJW0McAiVvE7anbgqRaddYTr852w5pxoaKA6hmrYG
	GbVAhx7edsHCohgsOByh50Rp3lNgdMATtgOAi/Mj6L6KkJFOzFWqIF9cOHmA9GYRlUBIZWE6Du7
	jFDg==
X-Gm-Gg: ASbGncvIo2QEVshq8ZnA3aCFx1jMXraT4Er3N4yle6D+g/GN35+uVkz5C8s/BvCs2Gl
	ZWgr7Hpo3crohACj3jrUGCz/k4bCmFiIijMlYhsEpj0HNBFU8ubaZfyiCoPXGHOqlLdDKgTZECe
	aAneabWX7YdoaBDkH+s5mnV32MtdIs2eYVOqc8V1xoi+mdomaKlB758zMN28+xXFQAdgXrc0Yrm
	FaSt1p8Sa6b7JhWKPyVwfMJMRqi3HZKgxsXiJ/CsQecmL+A2AIwWD/8TLbE9Bqwp5yfj2eVVbcC
	MGQFEoFTX1NS/jeHOHy+WinowXGmFOLoNaxVHuVa798zSvsTn2IeQo6/3P6+L9NIwXYUGGUhj93
	c8GahEKn9mHnDm02AMvQj558=
X-Received: by 2002:a17:90a:ec84:b0:340:b86b:39c7 with SMTP id 98e67ed59e1d1-3436cb91cdbmr12379120a91.11.1762792704058;
        Mon, 10 Nov 2025 08:38:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoVMuhMcPsQUnqMT/Oy8cOyzF5h70KIN3Q83LoJcFWHaGhmdTuOn6UcLQhDffxl/Uu5uGmCQ==
X-Received: by 2002:a17:90a:ec84:b0:340:b86b:39c7 with SMTP id 98e67ed59e1d1-3436cb91cdbmr12379065a91.11.1762792703541;
        Mon, 10 Nov 2025 08:38:23 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:23 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:08 +0530
Subject: [PATCH v2 02/21] drm/msm/a6xx: Fix the gemnoc workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-2-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=1529;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=B0t21POhzhnkPllkO0aJhsfTVayUVxYvYda/rajz62U=;
 b=5LGxm8q7C7nTAl599JSjm02h9F6JnfyOhlzuY9M+RH/QtTw4F1E31ZgmBsJOxt67zTsOJpNGK
 U43gtcuNh5UCTjwVDvswqSwaglhNGbvuhplr6cbwINEpI7UGgZnf/qy
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX1fgXxSdCCuu/
 FAZASJ61LtmGyucH2LVO6coMOYf7RNddrlMs6/qZ+KHpc9jsCE4zJoSRIstytxwHT1lfrQfy7yZ
 ko2WZoo4+0AcKYkD23ei6jx6IMmKcNZRjRsNq86w8d6yplWytWvUrJN/6Rv7Q5bF/BTW2QcyrDa
 DhAc24/I97cHEDB4lHIBvuKD37z2ZMr2iu4Q4xpXi8yIxqx+6aSQB9AvtivIqrzyxXwhCnvHmA+
 zYYbmohbtG2nUVFAbuH0pFaDNnsnoLNX3cT/RthvcH89Rc0jfoxDypKhvSI5Os2c5ing2h2ksy1
 zYFj89iVljjk+Kps10c/JzYBOa0N3mnyZZsKWxX9kd1uN3M5eVDquWdRhNdEIJVw1hZICAqrfga
 PilSrF74nkFcr3PcCUP7Fg7btcw0OA==
X-Authority-Analysis: v=2.4 cv=CsKys34D c=1 sm=1 tr=0 ts=69121501 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gggc3m2WwWe7Cuz57AEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 4U5rVEa_sud2JxVSo_9FXvCjtToxscyZ
X-Proofpoint-GUID: 4U5rVEa_sud2JxVSo_9FXvCjtToxscyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_083826_248054_A4F716A8 
X-CRM114-Status: GOOD (  16.27  )
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

Correct the register offset and enable this workaround for all A7x
and newer GPUs to match the recommendation. Also, downstream does this
w/a after moving the fence to allow mode. So do the same.

Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 4e6dc16e4a4c..605bb55de8d5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
 	 * in the power down sequence not being fully executed. That in turn can
 	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
 	 */
-	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
-		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
+	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
+				adreno_is_7c3(adreno_gpu)))
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
 }
 
 /* Let the GMU know that we are about to go into slumber */
@@ -522,10 +523,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 	}
 
 out:
-	a6xx_gemnoc_workaround(gmu);
-
 	/* Put fence into allow mode */
 	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+	a6xx_gemnoc_workaround(gmu);
 	return ret;
 }
 

-- 
2.51.0


