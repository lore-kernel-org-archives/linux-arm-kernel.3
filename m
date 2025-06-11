Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D64C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3j1uc9440Aqe3s91zqfhD9O3nYuGwVY1biiyW8GV5w=; b=nbSlaEwHFx8XmqJlM/p3PknXB/
	tzPASijMmIh3cozQp3dVIu9CZYpfT1fpAbRVDpbYZ2vktv6q3lgYa91MRo7KChl3mvwG0EBNR4ftq
	dosqz+iothbQjPEXOwgW92jKOuoYQd/H+hgx0FCuOnKrBaoC9ErmoSVf4QWPYMkZEwTXZGKOr4KlE
	RdEpkm7fv9g+/2N6MwaCkP8w12ruyCrrrSujcFBG0j0KNe4wRDHFF4MdmZ994D+YpslwUQm/oJa0z
	pJLC4zzlEvU1rHcMdTw0hKl23xLLh7ah5UVMgPEAQhwCB4o8iHX0MaEyZv6RXs/jWKhRp2IJ8qqpW
	DgJD6DsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMpT-0000000AHLe-3APV;
	Wed, 11 Jun 2025 14:53:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJRO-00000009jG3-1FON
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 11:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=V3j1uc9440Aqe3s91zqfhD9O3nYuGwVY1biiyW8GV5w=; b=OaydgpMDZxnUW0I9C9NNSh9WXN
	CUjAXIbcW0O9oDjNghGyp710hPUiWmvqV0J9/9bF9WRU8rWGCi2zTIPkk5hVoVlMSfEdh/TR3ljSY
	+ozfxIQgKgleRR3Et/Gdj1NUGmhmcR5BWw5jbezVStD036WkMJv1p629DLn+RiZT6vZ6zi0LwK4QW
	oDtvNN5e1ZC02Pb/tGB52AkSAFJERspoHL/+CJWLKXtV6LGDDLtuZN5d62ZJ3JulIXppBV6O3BenL
	MsTHGfDSdw+ihnYdpzyhoXrYGAyUdqKn0Cu3L1pmC2h2SQmlhgXeE2XfyQsbMn1+WZP8AcETiQcnW
	syj40LuA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJRL-00000002LP0-3wIp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:16:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DEaN026015
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 11:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V3j1uc9440Aqe3s91zqfhD9O3nYuGwVY1biiyW8GV5w=; b=cQLqZHu4SR959/cD
	TVEoC9cM62pYtKr1pOEuu/dPCBJVrmgCV6r3nt+B9H/IJRBngV3bpbKVaauWrxOX
	NtI1FB6Q6bB3lP7NKFPMkU8JssHjvBolmsvNzUfGKlFAULd04wl1UrbHMZeCVVlF
	IzmIwYfEmm1NEwm/iB6Ww8iyai/spB8TU/Jr+ddaClhfyh6KYyzpWP6BZWG6OiFo
	AQLFwV/ZNvBF1HeEYsRPEIi+o65cNUhxxyWJs2KIOgu8OG1iq3iMKUIq/q+7MViH
	weR4MJ5JpLqaEqIMbvol54w/Q/S+Zdh0lg7VziYOsPT2Zk3QfxgZKSmmCwJv3Mhz
	VNY2Ww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y7jpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 11:16:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-747af0bf0ebso5132780b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 04:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749640576; x=1750245376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3j1uc9440Aqe3s91zqfhD9O3nYuGwVY1biiyW8GV5w=;
        b=bppyqEU42KCplGh9bd/hHw5Bi4WV65xNwzMwn+Mj0l239PbdNPCwHQz+LphCrpTxFm
         nrA+Mwswn17+YgEwTxD9jEFc82MyPfMBHi9tkYIbasrBB/z+A1qIj/Hqjz5wy+CoBkdS
         HXi3zFY17DeiCBzbHFAmtYXQQzZHD4Rleqn19jQdp994eNEco5mwKNYGdO6hAB4RYM/1
         8hBOmqd8UN8BuLIo+1clmt0BEGettuGhUr0wIjxn225uAoBttwBsQ4T4LHU9wp/KWSQu
         lMce7+c/kUajIBKlvJEnJVgx0R5S5xngwutGtKqkB6qKdOgX7kHyCnn1MxCe/hiPvdI2
         s2Iw==
X-Gm-Message-State: AOJu0YwOWyzLk34dzwf1lHhy1wQ5JcMVqyCLgisYYWWPTh1Whgvt8FOi
	1vtq1IkBefjHZdoNKGXPTXAqB8BJ7myEnRJEXzyC5YSYXsm21R6ybaxFcNkR4GevFqysctlxDRL
	pda/Z9gwOVy7lT1iVgRd7Xz/oHaPy7POH8tcGfZl90QB3i7XAPeQTW24AUpKD/HxgfET51hntQ3
	aFQw==
X-Gm-Gg: ASbGncuhm8dv+9CSTTABMEcurLp+xbOH1X7uxgXv0kwO3K1X9gb6iaX7b/hmZkPPp/O
	D532QA2YiIpbAznf10yK6+/P+AMEsSYtd2OKOyNxO+icJw7W5VAUNWhzX9WXA2VgZipcbrtsZ7K
	6PPDpEApeMWtV+eW3quuaXWZC4cMpEhW0fvI4QQ1hoiS3UXO5JmbUyJR3PaQQxqlGhLtQ7ao5Kh
	QDmId7BX0tv6us3HLz3zFpM3ufWCnDNIaM4UsrLPZBlFU0EGXdAegm1aNNWXwrsTjTG8dLMyBCu
	yyYXsHMXKp6tyVaIeNVGnM95hunW8nbG
X-Received: by 2002:a05:6a00:3e18:b0:740:aa31:fe66 with SMTP id d2e1a72fcca58-7486cb59a04mr3951256b3a.4.1749640576336;
        Wed, 11 Jun 2025 04:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAG34Pvkev4y/hpRlus2OjuQHXtSd81WCCELRlR9luC9dphyxucxaLNk7Bj0pfHjdJyK31pg==
X-Received: by 2002:a05:6a00:3e18:b0:740:aa31:fe66 with SMTP id d2e1a72fcca58-7486cb59a04mr3951226b3a.4.1749640575915;
        Wed, 11 Jun 2025 04:16:15 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0e9d57sm8820772b3a.160.2025.06.11.04.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:16:15 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 16:45:33 +0530
Subject: [PATCH v2 3/4] drm/msm/adreno: Add Adreno X1-45 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-x1p-adreno-v2-3-5074907bebbd@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
In-Reply-To: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749640547; l=2022;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+s4ITcXnEPYZYROUKwHmQyjB4wKU/KPjLzqOm960DLE=;
 b=1BufoQl+K2Mq+EwIqeygORUYFrLK7REnSATB3nejAesVra4H4dodAXHO6ddF72x+zhVjfsmKF
 jPpmZU5C+rVDlrz0Lfd80Nhf8eY9DdVkZHaoRrQdu7TxWUm3e+ZDLWa
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5NiBTYWx0ZWRfX1CCv26DeiGjK
 qkWI6eeuVvNvRrFWveI6G2cdIRFpuvCZKgB1+Gn+RsedA4a3TpeG6hAgWr67c+gCSPCINPghx6Q
 Zel1n/ifoQf/ktxTkg3KBvAmhFj5OIk+W3RrCjnOjd0xQ4kdWIp6C0FpcY9dyfVFEOMBaqbxB8h
 4cc/78y0jTXRsPjF1DQksRzhkZ5ksLb4ET81Asl1+WRZ7PUieqyTrSZIXpyPSP9/sV6e8FxOLjP
 KtcJf90WBsKuakmV8P8dfDRjmN7Ui1s1sysJQTG2R+ekFt6NiGYi+8s3DW41nwJKeA1KyCfE9cv
 nZIv0dikr8OvOpdQtpcsGYrK/Sp2/IHZXOTr4fzZSe8bpFQFho4wQ8C0UGHix3qpOubiwfP1fyC
 Lslh4yOwjLTOh1nU84y1+wWFCN/9mgPoOtU4yQFtDaf9/8f+aA6LSd5DJJwbsSHluOPzwgPy
X-Proofpoint-GUID: Vld-xbuGv4ZYSkpMGKoyNBBdYuC1L6MG
X-Proofpoint-ORIG-GUID: Vld-xbuGv4ZYSkpMGKoyNBBdYuC1L6MG
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=68496581 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=25T8ekUwwafyqMypFLMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_121620_470956_820AE41A 
X-CRM114-Status: GOOD (  17.40  )
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

Add support for Adreno X1-45 GPU present Snapdragon X1P42100
series of compute chipsets. This GPU is a smaller version of
X1-85 GPU with lower core count and smaller internal memories.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 70f7ad806c34076352d84f32d62c2833422b6e5e..2db748ce7df57a9151ed1e7f1b025a537bb5f653 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1474,6 +1474,44 @@ static const struct adreno_info a7xx_gpus[] = {
 			},
 		},
 		.preempt_record_size = 3572 * SZ_1K,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
+		.family = ADRENO_7XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
+			[ADRENO_FW_GMU] = "gen71500_gmu.bin",
+		},
+		.gmem = SZ_1M + SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
+		.init = a6xx_gpu_init,
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a740_hwcg,
+			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gmu_chipid = 0x70f0000,
+			.gmu_cgc_mode = 0x00020222,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 4192 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 294, 1 },
+			{ 263, 2 },
+			{ 141, 3 },
+		),
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);

-- 
2.48.1


