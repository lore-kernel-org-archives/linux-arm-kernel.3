Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F82CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8PgB48It9l4+bkgeIQSRAK2mU0wwCQ3DP0FmhMvQ2U=; b=4vYCCBuI0obP/TwE5jBaNhJv44
	MZI/adyryB3jQn/vj9Dni1s9c3QlthgX8WZc7CCjWKhTfNO6ZXA2BEmxo56CH8h0/r+suq54tyEhP
	WXSxFPCd7I/LeiKyN1HyG8CH16eqQMFqGpv697GQ88MntTAdh5SUHIbCjDeBwj0oVqp2SAUdpfdH4
	1hef5pzE0wBR96Aq1bo3yAOzAbOrEDG8PnPI6TULgIuN9UIqkDDTUoagU2aLr5mGNxzshKtdbFEXt
	rbos9+rqt8D7bSjsHNdPFH4BoKrLIiYzB8g9xslJQYr4nmAz5PwjubZY77Dr7rJZBVdnXKuLGgSMA
	TKqQNq2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHR4-000000005A9-1njq;
	Tue, 18 Nov 2025 08:51:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHR0-0000000058q-0ggg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:51:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8Ds8J2194195
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8PgB48It9l4+bkgeIQSRAK2mU0wwCQ3DP0FmhMvQ2U=; b=BGCKO1TTAyU069p/
	i4rb15w2jCE/nVofuquIXNRUsAqggCHFPmaCEjpn6NtGJYbXj4aJf7ezqTXvf0H0
	2aYhQ13cJNQxscyaDZn+zuEuAGFxzVKJi8LoWki9L2Ex1Xr9gQPTrCYDcyUS5Vvo
	UfIzKwpQMphc/UrF7lKMV2kwV+qvZS5c91nU3tDte9O73C3LPKyd1nO8Nf2bL3F4
	CqBYJgzeHVjdhFR2sUfwZXRrRhB5szA/oYEjgcbBst4y0crwdxl1OkKynAXXmqvf
	7Gp81+i7JsItbb2Mp8ryR2T/j8UnFWnI1dG/HZ7GakP6HxYbjF1+sWtJcvEANy58
	rJefgQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y83df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:51:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297fbfb4e53so94965365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455893; x=1764060693; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8PgB48It9l4+bkgeIQSRAK2mU0wwCQ3DP0FmhMvQ2U=;
        b=Cyf0odtJxv/4Wk1YnzeeBdRGepA7hobWnnwypGgqLtVz9NCpW5wApF3Thk1EYXMz/N
         14pRJxxGVnHxx4UpG7ZcxBX9h5Rx4hkHJKNIM4G221gMcG5NES7V0e7az+fdmBZsef0w
         9UzwLDa12A+P06xYxVYg0Uw2Jor5rDS9rV+EX+/39md7Ok/w/AMGTi6iIZ/y1PP8txiV
         mrRjtE4NUqifaRiqo8hoi5S9eAVswralG7tnC1L1LrwMkNV8yo78+2cpOHbO4A2GAECU
         nQX0sY54/N349ksqhABxC46McI8r20PRayMaVAQHavL0EiCFh5mBm6EAhrP/+Ae6KeXU
         ZBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455893; x=1764060693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n8PgB48It9l4+bkgeIQSRAK2mU0wwCQ3DP0FmhMvQ2U=;
        b=fd6K7Z9WkQoVgUKxfss3E9BP1gEzvMcp0xuhkBQn2YnFOngDOr8yapc2KRdTZjZ+b/
         Ir03FPRhWj4R5YxK2nq9H3+xyGVve6lKTeXLZ4dWvHBCVOPNmDYzI3gbOgejgqbF3pa0
         3X9t1HeJWLcI1U0sxr4H3L5Ci2LSLCthl9+SOKhRbWxCMH9ZQqi1eetr1wUZKs3eASoF
         BcchZA7+B8bREeS0oitMPHJ/FSbLBxmHaF8RhHtSZfjh26AQZrFDOjBBJICo+ygA7IcB
         tE9f+auGMIPJeC/aCBIOLhxBWVEPFFRX3TEcMhscw74nN7091+mg60CYVhHTJEaYmfWo
         QaSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL+64Eoxe+/xeWmcNJniGH8BGFCGLVskU5zM61R8fpExdorClIimZGppFUs0uTqK24MBUPSEoVlVpys8e/inq8@lists.infradead.org
X-Gm-Message-State: AOJu0YyvyerRDY1i8/zvGx1JgDqMDg3xtmOmqX4YQO8WxvlcQzPwwsY6
	iH1wdi0GcjnlW4HWb4aW47V5OQE4FnjyfyAbo9g7UP2EIAMGaCxIud9/5laU6U/c93In3BFHyuh
	+JQ6d4v+B6BVtbtibE6NvtF6ct0fkE6ONg8s9xtymtW9UhTJXhQM/calOfpr92XPLrstwi8/Z4S
	Horg==
X-Gm-Gg: ASbGncu/Tcn0ZV1CUp9wH64dnAv/UiHlDObmcY9pqi8r3HCDJkq3emxYoIPkZb52Mma
	vByrRz/6o/T0qeRJg9miSSfDer+RsKBVZENTEl35bmsftQWrxqTFpFxG0DhC+2VNiWu+B0K3Jkz
	uQBkZllgtOD8AIS+Jyjr9Idsx2BLpQAQdi5lhgO9n0Pi5EjEAC8UqmoIckhv8WQjjz5yunez3UF
	a1HH1LlKv569XHozJ9n3KuwiFy4/XYLPFZcJPLG9mQsVBLWMYIpUF8zS0TapmENCfcxz3rRneze
	wTevkOBGWO2yz3YCaq7/D+Pp9lEfZbfet9Dhxe5t/YeIyrV7NHlQEn89nKQ5FxilP3hWeEwe8QW
	1717JyXdGZKdYG/X+jEXHOxA=
X-Received: by 2002:a17:902:ec84:b0:295:269d:87cf with SMTP id d9443c01a7336-2986a6b56a9mr192322485ad.5.1763455893002;
        Tue, 18 Nov 2025 00:51:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/1w2jno1zLyed+Q2GzLtuvbQPSdeph5rJVVJKuzROZehmddk/3K1qPE4B4EcyW57S867iOQ==
X-Received: by 2002:a17:902:ec84:b0:295:269d:87cf with SMTP id d9443c01a7336-2986a6b56a9mr192322055ad.5.1763455892479;
        Tue, 18 Nov 2025 00:51:32 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:51:32 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:29 +0530
Subject: [PATCH v4 02/22] drm/msm/a6xx: Flush LRZ cache before PT switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-2-86eeb8e93fb6@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1701;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=U6hCxZZPt/0oNlBV0Loqbw+1ONR49vXzGV9kkJKQhe0=;
 b=C/pQ042VX0YsNIUePu8RhYDT4KrYwopA1aJuj7t79NKSGb6UQ5wtIm4sVjq3irgGDqFwMiXFh
 6bDOXlnFvndDYd0I6mseZ7fkw9MQk6CD38MF/bxLZlvdHiqWoo3qp2V
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX95GfQ0mKt+jk
 xVCCzPZf0J6E79DGysJGHMboPSKBbOyXCPKEruVNQfV8Y7Gy9qGy7sVvyx56EaCkeAysNY3IVLF
 AvYpD9ZJNWSm778K1p+HPMmwBBVfPBIZPnJqzLWDXciyBMbb/hWZFJ29cvo3KJpO9CvVLrnYrGO
 v4cGmAks97te/N5c9tIUVLTsJEke5f0Tog9Y/lBp+32ySog7IH61D/0TrXmq43cgZiGA/rkv0hv
 5KSRuSYm1c7xz1DwVrPWd5sc/DTGxGcJNk4VSYO0/UDxYrL9Oh/HjVFvMLyXvaHo9QS89krlA95
 Ez2wSXuAmb6h7GkITAIYqIqJ9Dccjj/+k+uj2g4qbgQMnwJ4+Or9HdjEArEx1+uxoDVjKEiMG67
 1kjUWJazbRtKwvzwFjwPAuSPDoErug==
X-Proofpoint-GUID: wBstGiJ8dGp0R8P6LY-mNJmmzsV5hABT
X-Proofpoint-ORIG-GUID: wBstGiJ8dGp0R8P6LY-mNJmmzsV5hABT
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c3395 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bBR9okFf-Jgdumx6fEkA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_005134_340130_63D040A4 
X-CRM114-Status: GOOD (  14.95  )
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

As per the recommendation, A7x and newer GPUs should flush the LRZ cache
before switching the pagetable. Update a6xx_set_pagetable() to do this.
While we are at it, sync both BV and BR before issuing  a
CP_RESET_CONTEXT_STATE command, to match the downstream sequence.

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 779c1da7c46d..e6393ef0fd78 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -224,7 +224,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		OUT_RING(ring, submit->seqno - 1);
 
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BOTH);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
 
 		/* Reset state used to synchronize BR and BV */
 		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
@@ -235,7 +235,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
 
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BR);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
+
+		OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+		OUT_RING(ring, LRZ_FLUSH);
+
+		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
 	}
 
 	if (!sysprof) {

-- 
2.51.0


