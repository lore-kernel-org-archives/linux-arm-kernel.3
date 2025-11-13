Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A424DCDB463
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogd55nO2nJMubbd6drWs5Znn7Ejg1QAMnSKWLgnRFIU=; b=V1AJTvQCaUFrz17yWySTYdXA/O
	4gxrvlRQopdC08yKYhuZuc0p4o+hCOp7srg20HwJ2cVpe3v4hRbfc+vryBth6m0WsIuOpU2gXUWhG
	w5sU/T8nljR039l9w4D1u8/alFvDU3FhCsJeHgzwMFG1avRN6OmYWlt1AuDmQWb+G60rLbh5O+qYc
	U+mmy+lxb/LNMw5Xd/HNU2GHjRAnaxD8RsghQnxDd5ZW2vJpwew1kO6+EyduR4FMmRFg506FnZsu4
	NcAkhvgrszhvEAu6QZRpzSSbYxICk2hNcWG69u+Zc9O0i3vMLwahnII7oQ7MKd26wAaTjEGkc5DAG
	ZT/YV9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgmc-0000000BHEs-15Pj;
	Thu, 13 Nov 2025 23:31:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgmV-0000000BH9o-10wc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:31:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb3vL1590811
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ogd55nO2nJMubbd6drWs5Znn7Ejg1QAMnSKWLgnRFIU=; b=dcmpx79369qnBr4c
	+yDP0pXqwJYJZ3z8L+GDq616nmiqW8Qg2ScL+qoEIf2jnxoIUYZJZaHtOvT/9F72
	12mzK9VsMrKe3e78AZ/opjEFYnwWS5brVEoy67HQwAoRcjk+fU1Ksg+nn2eD2IZR
	kwoKBY6zD3f3Qs7Zu9mEr1t2nlmVtnKiWxl6VjogbG62ykWpOl6CZzK7nOeb1vzo
	j+7COuUwy1YBGWT2lJGc7yNvu3M2yXzFzszpOo3NLQtL2maeheQhr8JAMgJOSfGZ
	xxtW7dwzoOgmeg0DXAkuGFdAvdprY0WOLiKs+Gy8mhs8wMzWS4LimAD/fyD+ivit
	xbHaLg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9fr48y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:31:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3437b43eec4so2377625a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 15:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076669; x=1763681469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogd55nO2nJMubbd6drWs5Znn7Ejg1QAMnSKWLgnRFIU=;
        b=JtBfF1a6KtFEDcYSjIttFMVrMt66oNRzjP+ntu3Dy23VMBbl2BEHIh1TThOEoG0nd4
         OvnweI9zN44sSUyMzPVEvlqeUWvGnFEAU8Lz24RrYS4g0/QvihQzQlXwW9X615IGP3QW
         CibnRgnkPtJkck3qpWKn8dpovhtpKtnt0dZRRzSvRpVa2c8uezZH7j66tJgzZkZ705UR
         eSu2W5R7YBXHtTIa8UEl+ql9MF7S6B1Iq1UNcfKDQi3oMAEQI85JqMI6xwpQJCuQ/emm
         xiVTRCAWBAT73qWky5idmenQ57glSyAhrnM4u0KG/tpwjPnwaCEhgmSBKjfWUAb9KhhD
         LMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076669; x=1763681469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ogd55nO2nJMubbd6drWs5Znn7Ejg1QAMnSKWLgnRFIU=;
        b=LfRe56j5QQ500JFM6HQYZWdLNzKHxJjHdJsARax3pIs71dK3B0wcTGXKoggC3acuZp
         peKW0R+5bIo4MFCwuXLSh5VWOWw/FM+LPv9L6dpQYN/RjuW3Jc/ZsvihIvyW7N9WH56H
         sx1NBQY+gRs6XbxUO97uby6cxf/Tq6Ig8mXALWQ8VOZyD8xKXOdPJE++CKW2f4LZmNBP
         ozAxD7Fd1zMNRqbYEI+BzoVLyl6TufMeB4BtDWLsKs6k5Da4GHaB4xNWVfMVdP8ep2fw
         unNE/cxOzl0b5369je1Vs3wTj6QMddzfRwL2tzWAuplR3m8viP7nAVtNs9iPl0x8J6TY
         4MFg==
X-Forwarded-Encrypted: i=1; AJvYcCWkPveFltLoc5glWMBjsahR55LRKvM26DXqMIWwEhu+VQtUjKiYqmag31w/0Pf03BgsNO3h/OLstPiEA/zbzyVm@lists.infradead.org
X-Gm-Message-State: AOJu0YwRa24nDfIYVAOLW/bhsnuMh2hZ1dQZtg2Ik21BBioZo2wKkQyv
	anL0he9AKFTLNobsXZ9Zl+jNgeQMrsyanvXrrCoplYTL8nHaSC43DIt9Cp+vS2M/XYhJkMOb7p1
	VAkMWX5kJYJIHMvIJxVn1mOry5lCy4e9hCTOtfVmBhKaim1ZJT6aOSslWbRgEz7Jp5uAGoqieJl
	XgCA==
X-Gm-Gg: ASbGncvbBdxHPrJJ6dnkc1K0M2EYD070kclhimJLTNTXwdMeNpcHmBAP8bL7WxUSVy0
	65zNEoO1JS4VgqExgKiKNHlEmk6es7fyo91+Md7BNmjrXWVP3g3ArXwNNEpJJ88WwCxcV2osLqM
	zvesFdLG+tR+PnIeak9+Eq/IOzhrPrdKGKJuSAUV/dWJhDSOdQ6C9LQlUmWor8CJ4S5Wk37KRej
	y3DrJji9kpUcwN82stONMXaMmc9t4swFWfRxN8Z16EWOi2lhK98G538LVv0GbWDJ/xWLyQlJn89
	AYaNyJAvxDr7y0jQyv+GUKgDgATAPsmvt6/4dk5t7LVj03RRfQHHUOKO40vmqUftvzAZbL3QPP+
	9dUW89QKILgYexwLOiSBuyIo=
X-Received: by 2002:a05:6a20:3d1a:b0:342:2a1b:86fa with SMTP id adf61e73a8af0-35ba1b90665mr1474089637.45.1763076669005;
        Thu, 13 Nov 2025 15:31:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELj1AccU1iAtNlF/d1rwvp3D0O0GtJ2fmP978ebIYh6+n2bRYHdSZZAqBoSZaQIswf+5R01A==
X-Received: by 2002:a05:6a20:3d1a:b0:342:2a1b:86fa with SMTP id adf61e73a8af0-35ba1b90665mr1474054637.45.1763076668465;
        Thu, 13 Nov 2025 15:31:08 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:31:08 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:08 +0530
Subject: [PATCH v3 11/20] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-11-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=2950;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=6xiTxu+QK2g5DX1T1txHhYRR5FauCvoidVNtsUXBMYQ=;
 b=IttmFcbenAkdyewwx77FnOo0XWIhoBfw7cDraxU2XeqU/3OiNFFUAG7R+9K8RedUjOJawDXlp
 Jb4HDun0pjmA42rV3ROB75c/jOtuhSsvRqvyUfDYw/rz2cgt1d0uQGa
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=69166a3e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=feIks7WodE12ze-Om1wA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: xT4rRCpmYPPiVV2maRLUkGISx4fJ4swH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX1eTAqCEqCrBr
 qooQUHmA7O2DKJI4H4craDYisIUTAfWvZNzOOOyexXk2wgi0Yz6RltRFhplFSAgLXyg7N66VkuG
 tKB1HwlgbbEDihXf4MBYHHxuta2Iwu59Zce42wU6folP+mjlWZZDyjfQrQ5OffmqF0G+aeagdMY
 pNMgHsXyfpD4tF6NXkvYN100qSNYJGGVg6VYKpgSCDHrieIJi849xXO+wC0Xo/OMoo+MqTlr8pV
 Oq1tp0s9nwcj7fm8fUe5/WtqdU1S47OBWL51eU61AxXeEp7cdj+XXvw2zBHpWz+8lxoa93wrcJk
 evTaecKAVk/d8qA9wGDX7W/jQKFyubLQK5yeI+WfDdVf26WjIvNiOjGXNeluj96Z0ObbJCU4Utu
 2JkGAcq17S2YLpkLcwk+QGZmzdnbVg==
X-Proofpoint-ORIG-GUID: xT4rRCpmYPPiVV2maRLUkGISx4fJ4swH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_153111_429007_67DC870C 
X-CRM114-Status: GOOD (  18.61  )
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

Current logic assumes that the voltage corners in both MxG and MxA are
always same. This is not true for recent targets. So, rework the rpmh init
sequence to probe and calculate the votes with the respective rails, ie,
GX rails should use MxG as secondary rail and Cx rail should use MxA as
the secondary rail.

Fixes: d6225e0cd096 ("drm/msm/adreno: Add support for X185 GPU")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 53461be14dc3..f32e1aba146b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1518,13 +1518,14 @@ static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
 }
 
 static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
-		unsigned long *freqs, int freqs_count, const char *id)
+		unsigned long *freqs, int freqs_count,
+		const char *pri_id, const char *sec_id)
 {
 	int i, j;
 	const u16 *pri, *sec;
 	size_t pri_count, sec_count;
 
-	pri = cmd_db_read_aux_data(id, &pri_count);
+	pri = cmd_db_read_aux_data(pri_id, &pri_count);
 	if (IS_ERR(pri))
 		return PTR_ERR(pri);
 	/*
@@ -1535,13 +1536,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	if (!pri_count)
 		return -EINVAL;
 
-	/*
-	 * Some targets have a separate gfx mxc rail. So try to read that first and then fall back
-	 * to regular mx rail if it is missing
-	 */
-	sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
-	if (IS_ERR(sec) && sec != ERR_PTR(-EPROBE_DEFER))
-		sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
+	sec = cmd_db_read_aux_data(sec_id, &sec_count);
 	if (IS_ERR(sec))
 		return PTR_ERR(sec);
 
@@ -1609,15 +1604,24 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	const char *sec_id;
+	const u16 *gmxc;
 	int ret;
 
+	gmxc = cmd_db_read_aux_data("gmxc.lvl", NULL);
+	if (gmxc == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+
+	/* If GMxC is present, prefer that as secondary rail for GX votes */
+	sec_id = IS_ERR_OR_NULL(gmxc) ? "mx.lvl" : "gmxc.lvl";
+
 	/* Build the GX votes */
 	ret = a6xx_gmu_rpmh_arc_votes_init(&gpu->pdev->dev, gmu->gx_arc_votes,
-		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl");
+		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl", sec_id);
 
 	/* Build the CX votes */
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
-		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
+		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)

-- 
2.51.0


