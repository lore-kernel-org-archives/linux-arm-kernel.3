Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA122CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJHpFB1M0Fa2jX7zQfciXysNKzSZz/9fw/KmefWGV18=; b=c2VHia/bU80r1YkZ5Xz4Bt8BuH
	jUF/9CgAbE88OA3KnIC8ASAwo2HeXk0oTcdWkly5ud9n2BlB+Ns6p9ash2X1mU/DNwNM0vxr462Cm
	BDBYESPX0FyCQbHDMcuRS1GH8LtwU+2fMaTZRyjWAeB1EjlsFpb880Korbgm3nn6C6QbCJamC1lUa
	+b5WEL7AADMz+gdMA7iTNTSeiM7lrSJVNTL8Vkxngrgq93pducBUQHI39ZJ/f8tvorejTYbapWqDk
	OFKvRx8XATSg3GMQZogdV1W7OJGyxMPeAv/1gBdybat4YFUQ9a3cIZB8ng+nj3zfhmPIbo8mSweCD
	Qc5p+Jfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHSa-0000000067A-3r0E;
	Tue, 18 Nov 2025 08:53:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHSY-0000000065I-31AM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Nov 2025 08:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gJHpFB1M0Fa2jX7zQfciXysNKzSZz/9fw/KmefWGV18=; b=SDAyKJWGutfZJT+7w3ZCJtibMD
	sm7HZOJUZHboa2MBsNREhQnO46a1i9RRJM+I3tn1jCeShPkRWBZhAZyN1lF02kyHehPxEOMoDBop3
	o5OCN6l6TnlG9pEUENOtufXzg+VgEzb5kWZDvkQjA3UXHlbNgdTCqSnXpey5h0NfbtgTIGpaqZqqS
	dFVcetbM9DF8fUjMUbO1PDZOa6MLe19nq5es7imWT8jx2eD4Z14csIbKOcN4Jn6kAs0ItumWsobAP
	E1YabZWunNaQM9FIZfqUcTHHxdIJuAmqtEwPPne1fCdSHHOK2RIX+WnDdl5LHMLRwUKoVibkc6E/W
	k5TYWw+g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGap-00000009CdV-0mBR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 07:57:44 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI64Zgn4107441
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJHpFB1M0Fa2jX7zQfciXysNKzSZz/9fw/KmefWGV18=; b=ZuqEM5q6TvySaIKR
	5lCog14AuSxrpqezfJkboiAtujg9sl2IpLDzPq/IFCefNyrWj+mpQT5e5dYkkZbH
	edfYR5pIkTOel5xq5v8WH8rcxavAU4Xl3JqTeb1Sq0KubAJIQshAFxJkkGZvY527
	DYV/EPcwXYBuHLSEHRPpmFA7x48ogCl2ORCn0ISVNVoTsgijI0gwV9X895SVZ6Ym
	4JLEu9HG1Hzxx1Fy7ub5wIJDs6RRt4S7L2za9za0bb6m1uq4VDmHusCps20xfWVU
	FZvE0eUXiys73xhVMpGj+eWz4JZESZcOvt75/ppyPnhoL5HPSTaDCoIkpYkehruk
	LRYGiQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hpbd73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:53:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956f09f382so46822955ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455979; x=1764060779; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJHpFB1M0Fa2jX7zQfciXysNKzSZz/9fw/KmefWGV18=;
        b=FULPWuH9vYYF20mRHCUdVOnerJnTc462ylxbsOmwGyss0VHuh0GSIFSeg5/5yuRPrO
         11JWZBCQ/eGQp4zfCjsh+OmL4dpYtQayzsigdh3JwyaoGzNhOdMbNgX9f2k9wXc2tCyX
         UAwAA7XpjVRe5U1M1DKpVpRvp1dImESC/de9WNREfy/R0m+Kly6hbHvSEz7idkkRRtR4
         zZ9etWX3M3ZiFhhZJ6g5FPs/ThuXxibjGDWeD7188sMPAa0OX2x4BNiwPHvJtbVOvZtN
         7/81ijWq1CeJJSXQig1F0FUZMrbAOT4vGVukC/V6ru+lySwK6zmy4dHnXtbGOkBqW10E
         Q7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455979; x=1764060779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gJHpFB1M0Fa2jX7zQfciXysNKzSZz/9fw/KmefWGV18=;
        b=nk0rSTme1CGWZr1e6xOHy70LjS9ph9RZN09j5hE+Qz25ww5sagtbQstcqNOwzbV+/F
         ABcDgD2s0zRxnbBoWcAUiW1jaQZhwke5FrCwgzX1A0eyavK86I5K7VyX1WashCPtfAbU
         0LGs1WIIdbr1Q0z0oQfChL1QwYwdOVazfMcqZ+gcW/YxJWd+f/UXHBKDX7aVZUC1siqT
         IU7hXbtw/MFP7lXu60NqAuH6pycLIIxGnaMjbhRUsGLjR6fllrZjDYh2kL38l9hxCOqO
         ni5lkRuQseQj5nNbU/E3Vtwi/ouHnvwcOf9YCfyT5ZR+R/M0CjKY++i9y/kOpDYJUQIu
         lPoA==
X-Forwarded-Encrypted: i=1; AJvYcCXgY9pDx8ylHIRvVJie5pegu4gwjR+4UoQSuokjg6+1e2FuORypcK2/IHtJRJDaUsQ5a7uSm8ITQJSQs+jdXAQK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1OKxILJ8wL96iZZoVEQddhLiJ9nyeMd082m/FKKsmOVf8gueN
	XbsA0tcvVdxPkKKDF2dnBIEpDziwBpVrraFB4Y9Hwa+IMbEEpCgH1VwaBsfgyuuWsbPwaKF2Szt
	8qUYxcrrozKRv9M+O5ak80bj2h64CaLn6kJ6krtxft52/nS4jCMqBIK9DpHIYK9XTkM7OuoHr2l
	ff8zVrJOJ/gw==
X-Gm-Gg: ASbGncvdjooWYNHdXO+I5ivLtRn5BmmBboC6RFRX8lxNRRn0uAJJyuXIMV9o/2ZN40f
	juSCdL+7goNznI2Wxljq5Z0s7cGSMx3AE5DZ0eS9g+UtcNdyAu3fv1wI+jzGRg08Kkenx2BEg24
	tkAzv035gE1RLmiS/tyzNY7rtp5f1RBz/UGPeqjBKloS3SGyA1SfhccllxvDuQVNRvHy2Jes4os
	OWQmiqD6Lt4Hpbny0QgIXbKBcyhJQ3GQHYhq2k1mgTJUqkuiloNL/L8Xch9pSavuZ0oOqcEv2nl
	C4QnXLwVl5tZbWFFeZURmYWpypF3dNnLydMZrivTOEOCGj1ieA+3A4rBBx+jttZVT0bol9o0Tl1
	KtMooZhvcKuS/K4E/utTZSI8=
X-Received: by 2002:a17:903:1448:b0:299:d5a5:7e with SMTP id d9443c01a7336-299f5587d6dmr29425835ad.15.1763455979206;
        Tue, 18 Nov 2025 00:52:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXHTTncLm+wwNsQtax/ncNNDvvaKtLHgtViPzEistOPdMAF1zdbYET87bo4fTF9/xDBrWiLA==
X-Received: by 2002:a17:903:1448:b0:299:d5a5:7e with SMTP id d9443c01a7336-299f5587d6dmr29425335ad.15.1763455978576;
        Tue, 18 Nov 2025 00:52:58 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:52:58 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:40 +0530
Subject: [PATCH v4 13/22] drm/msm/a6xx: Share dependency vote table with
 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-13-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=6424;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=DEV55TnpxC+ZAc5oDFgekUuq413l/3/UK41L3U9jZiY=;
 b=Qcn9XMDdWDAliWUeS66kttJUuzO6qdmx47XxB3qQH+8k4C9wsMVO8Xz6ePGlqUJFDv5VcDd6D
 evB2LIuW67ZDt97vKaX3ciTLZsHvaQXeTY0kX0vrpmjyAbZsIQznJNf
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: B-HqH6XgFq1kLeGqjcxyqeUMBfWnUdBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX6RA1agmfy6va
 2Vubmav5Q+4mAjCLAl2LM5J70hwNNEamczOaofLyZplz3LzVKfEPRUOaz7p9UOcGS1bzplpojsA
 HTS+sfa+o5iNA8aY40CXbCVhqNdy9tTy5LDJvW43wp1HCU5EGD1zXbvqiOh6n+k7nE42yNzmYob
 56od3nyh9cgzK6I+alo//un4QOBYn5G8KMYV+slEpaOEA+tOPaeaCua1hGLPfJp3vp3A8QFwG9+
 ggF03oS4ET5a6DcC5VJS2pJo8Js77eBqqiwR/7VssDIhlXpn8tDQRw0VWM4ltM9VQBNfAqhgxbx
 G2NKect6yHkpUknanldRjd3SaDpVdKsPMkAskTM2nW7A/USGwbTMqtFoEysCPbxIKAkhHGa4wAL
 aBP+ylFJ9xyVKAq0gYg5q0iZk6d2iQ==
X-Proofpoint-ORIG-GUID: B-HqH6XgFq1kLeGqjcxyqeUMBfWnUdBA
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691c33ec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jvJuTtenM57zLa_9FEIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_075740_141371_4C5562F6 
X-CRM114-Status: GOOD (  24.63  )
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

A8x GMU firmwares expect a separate vote table which describes the
relationship between the Gx rail and MxA rail (and possibly Cx rail).
Create this new vote table and implement the new HFI message which
allows passing vote tables to send this data to GMU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 54 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 53 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 17 +++++++++++
 4 files changed, 125 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b76960c6d444..cede210a0a78 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1616,6 +1616,57 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	return 0;
 }
 
+static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
+		unsigned long *freqs, int freqs_count)
+{
+	const u16 *mx;
+	size_t count;
+
+	mx = cmd_db_read_aux_data("mx.lvl", &count);
+	if (IS_ERR(mx))
+		return PTR_ERR(mx);
+	/*
+	 * The data comes back as an array of unsigned shorts so adjust the
+	 * count accordingly
+	 */
+	count >>= 1;
+	if (!count)
+		return -EINVAL;
+
+	/* Fix the vote for zero frequency */
+	votes[0] = 0xffffffff;
+
+	/* Construct a vote for rest of the corners */
+	for (int i = 1; i < freqs_count; i++) {
+		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
+		u8 j, index = 0;
+
+		/* Get the primary index that matches the arc level */
+		for (j = 0; j < count; j++) {
+			if (mx[j] >= level) {
+				index = j;
+				break;
+			}
+		}
+
+		if (j == count) {
+			DRM_DEV_ERROR(dev,
+				      "Mx Level %u not found in the RPMh list\n",
+				      level);
+			DRM_DEV_ERROR(dev, "Available levels:\n");
+			for (j = 0; j < count; j++)
+				DRM_DEV_ERROR(dev, "  %u\n", mx[j]);
+
+			return -EINVAL;
+		}
+
+		/* Construct the vote */
+		votes[i] = (0x3fff << 14) | (index << 8) | (0xff);
+	}
+
+	return 0;
+}
+
 /*
  * The GMU votes with the RPMh for itself and on behalf of the GPU but we need
  * to construct the list of votes on the CPU and send it over. Query the RPMh
@@ -1649,6 +1700,9 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
 		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
+	ret |= a6xx_gmu_rpmh_dep_votes_init(gmu->dev, gmu->dep_arc_votes,
+		gmu->gpu_freqs, gmu->nr_gpu_freqs);
+
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)
 		ret |= a6xx_gmu_rpmh_bw_votes_init(adreno_gpu, info, gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index edf6c282cd76..2af074c8e8cf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -97,6 +97,7 @@ struct a6xx_gmu {
 	int nr_gpu_freqs;
 	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
 	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
+	u32 dep_arc_votes[GMU_MAX_GX_FREQS];
 	struct a6xx_hfi_acd_table acd_table;
 
 	int nr_gpu_bws;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 206eb204cea1..53cfdf4e6c34 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -23,6 +23,7 @@ static const char * const a6xx_hfi_msg_id[] = {
 	HFI_MSG_ID(HFI_H2F_MSG_START),
 	HFI_MSG_ID(HFI_H2F_FEATURE_CTRL),
 	HFI_MSG_ID(HFI_H2F_MSG_CORE_FW_START),
+	HFI_MSG_ID(HFI_H2F_MSG_TABLE),
 	HFI_MSG_ID(HFI_H2F_MSG_GX_BW_PERF_VOTE),
 	HFI_MSG_ID(HFI_H2F_MSG_PREPARE_SLUMBER),
 };
@@ -270,11 +271,63 @@ static int a6xx_hfi_send_perf_table_v1(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
+static int a8xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
+{
+	unsigned int num_gx_votes = 3, num_cx_votes = 2;
+	struct a6xx_hfi_table_entry *entry;
+	struct a6xx_hfi_table *tbl;
+	int ret, i;
+	u32 size;
+
+	size = sizeof(*tbl) +  (2 * sizeof(tbl->entry[0])) +
+		(gmu->nr_gpu_freqs * num_gx_votes * sizeof(gmu->gx_arc_votes[0])) +
+		(gmu->nr_gmu_freqs * num_cx_votes * sizeof(gmu->cx_arc_votes[0]));
+	tbl = kzalloc(size, GFP_KERNEL);
+	tbl->type = HFI_TABLE_GPU_PERF;
+
+	/* First fill GX votes */
+	entry = &tbl->entry[0];
+	entry->count = gmu->nr_gpu_freqs;
+	entry->stride = num_gx_votes;
+
+	for (i = 0; i < gmu->nr_gpu_freqs; i++) {
+		unsigned int base = i * entry->stride;
+
+		entry->data[base+0] = gmu->gx_arc_votes[i];
+		entry->data[base+1] = gmu->dep_arc_votes[i];
+		entry->data[base+2] = gmu->gpu_freqs[i] / 1000;
+	}
+
+	/* Then fill CX votes */
+	entry = (struct a6xx_hfi_table_entry *)
+		&tbl->entry[0].data[gmu->nr_gpu_freqs * num_gx_votes];
+
+	entry->count = gmu->nr_gmu_freqs;
+	entry->stride = num_cx_votes;
+
+	for (i = 0; i < gmu->nr_gmu_freqs; i++) {
+		unsigned int base = i * entry->stride;
+
+		entry->data[base] = gmu->cx_arc_votes[i];
+		entry->data[base+1] = gmu->gmu_freqs[i] / 1000;
+	}
+
+	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_TABLE, tbl, size, NULL, 0);
+
+	kfree(tbl);
+	return ret;
+}
+
 static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_hfi_msg_perf_table msg = { 0 };
 	int i;
 
+	if (adreno_is_a8xx(adreno_gpu))
+		return a8xx_hfi_send_perf_table(gmu);
+
 	msg.num_gpu_levels = gmu->nr_gpu_freqs;
 	msg.num_gmu_levels = gmu->nr_gmu_freqs;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 653ef720e2da..6f9f74a0bc85 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -185,6 +185,23 @@ struct a6xx_hfi_msg_core_fw_start {
 	u32 handle;
 };
 
+#define HFI_H2F_MSG_TABLE 15
+
+struct a6xx_hfi_table_entry {
+	u32 count;
+	u32 stride;
+	u32 data[];
+};
+
+struct a6xx_hfi_table {
+	u32 header;
+	u32 version;
+	u32 type;
+#define HFI_TABLE_BW_VOTE 0
+#define HFI_TABLE_GPU_PERF 1
+	struct a6xx_hfi_table_entry entry[];
+};
+
 #define HFI_H2F_MSG_GX_BW_PERF_VOTE 30
 
 struct a6xx_hfi_gx_bw_perf_vote_cmd {

-- 
2.51.0


