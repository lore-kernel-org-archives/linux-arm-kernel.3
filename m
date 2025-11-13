Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BC8CDB464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbqxdCr13kMbVMqadmJF4CnX3GwPJlihXZxUWaf1cSs=; b=TQkKb7dpDoqm/T3ATG2kCJU7Nt
	x1Nuv7keKesMOqkyhFMjOtBCx2p4N79KXQ4E5k1vZLYFJOdEZsnd5Zaflzrtz3EAsLZnUQSx1WEuL
	viSzvN5OEk9lvot4knMkUQDmpmbG9pjM+RrUMq6pv/EtnseTWy02YbBYua59qBUTq4InyCDqCReKP
	2h0JJn67z5/OtpxSJ0U8hgPsyv3l+eI6rA3iz5aX+GVtAtd31AGRbK2L1hXEd99SMyPa/+Ul8fcga
	phh4eC/m6XeeN4t/jJdk1saxbROtI4LIH9iQu4ZdflccVun+jvvCajdwNWj00xGRdojfx1ZaJLder
	uMvZcT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJglI-0000000BGVT-0xbk;
	Thu, 13 Nov 2025 23:29:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJglF-0000000BGUU-2QJ6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:29:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMbFZx1497489
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DbqxdCr13kMbVMqadmJF4CnX3GwPJlihXZxUWaf1cSs=; b=KvOv8OPQjRl0Yk6N
	GG6XOAzcr2BgYjbcy3Hs5UNvU9iudmZVNrf3cQqHxVsQKx2A7PqUJRSKWEgRRLTF
	XLIOfAXzjHxgWMwdeuhLCThWdMaEJ+tLP0qgmN7G+qWSVjwQtpkL8ZAhLjhz73lN
	h7cgTQz8EDgf/V1K+WSOaWCz6z+hLrSL+RZuaNpSUvQ8IsJTLbtBQJijIMNiB9qw
	xjqSh9DVrZu+8NeGAq8aD9usSriFtPAOCOwQaiOrOfHxUuEqrrrbDhZF+4YJL5qb
	9xS+KMZ38VU++4KwUPUNNkpSvydDd06oWAUx55m1StxImY7kVw1mZ3b9LHpKPgJ7
	U8qA0A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hr3wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:29:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b8973c4608so3534207b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 15:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076591; x=1763681391; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbqxdCr13kMbVMqadmJF4CnX3GwPJlihXZxUWaf1cSs=;
        b=YXqulLX42xbM66Kt8XVb8iwQGvrfyaOaPz5MWwdaCBVhpKCV3KrK6UYPbROVZvK2Xt
         Qn0Rzdednq9lNFd/1MgfjBM0E0faHZKxJpo8oY96H8lyBYlzDqUY/pwfQsJw2yUH8cWJ
         2OjeVLsLbqeHHdGdIAPYjAgp2bo5Cy7Yd3t1kfv3tL+sHqqTbLWXMnzUxcGbv7lgktyl
         mjp1Rn+W9gtuO4guvGmCPujdZaqvf0c4ymWIJg9El7HDNo4iYAwO97sl2f7eQntgXsCl
         mdqKMstelyPt2sC/BSmo6OAY6ZGdQ81YidCf4NaP9ofpha/I+WFZ6EED+05zl4wUh7ID
         wDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076591; x=1763681391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DbqxdCr13kMbVMqadmJF4CnX3GwPJlihXZxUWaf1cSs=;
        b=suhku6kPHsLRiHDlLpReTKCSK1LcBIkZMgbYUhJtqXcRyyvE612yu18+fkLULlbiPX
         5zsv6wt9SUMBdG4DsvAn1AFCBU8pHYP1uR277ulGqJ7KjzyRCIL2dVM+LIUocIjXR4L3
         OD+vNRoqqwJQbrd35X+yx8tkSu81mhrlDmfuxR4kNyAXCEfQbOsarGRMqemEaNq017yl
         hv/RfUlZ6aDwK2EtmbNx6mOYhxZxrDibcFjLL/Pm1rVyU5CxqcEHwQBdvTBa7ZXFwioK
         JbRQhEWkyNVdfRsbAoccWDfXWdh8BMVLIZJjoluXfFzUIloMAM+n46DpTNRxUyrSxCyx
         eQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCUd8dQUhoZwIlPxdmbZi4C2+xCXDtSFXenYRyk0xZebscCcrBXBwioHxcIRHVhq8cnKF1sBTS6dr72nwbW1MjMM@lists.infradead.org
X-Gm-Message-State: AOJu0YzSe2juunxHiizHYLEXc22EhUd72xSRPVxeX9OCOCa84b4c+T9i
	OiyMJNn5/x5oinh/hZk2mYbSs1SZ4lUKEc6Yxq862Fjps5nm7zboPPy9pI8I4/o2e9HRjGzp9VU
	VUS/Yw1tXJj3IGSeoj5naZXRTSRJMLuOHnEnCEArnhw1PjvWRr0zV8zPZEfsGRGgXAsAzS0cyuB
	YEkQ==
X-Gm-Gg: ASbGncs65hc/kd9N7NlM+KkWosNsSD4Lok1zqdQsy2TMZHgFzajsUiiqUMA9h75GEAv
	ofvgxoRVDviI6BkxFiN9g5un/ad25bEPR2zfyW4JMiMqu09kJwqUBhzcuXWTbTDXqNOAQv+o1Kp
	PlBJkRk/Ks+1EnH8qjl/B1AhZdGbKKVqb+ft5zirrhSeVXsf6/HC8F44fIjg+8Y2bwHVqhtxpR8
	hUTH38eSJpDxiyc/ETXUvVF7IsvrVi7s6YYBRa/htbNkJYyAJODwi2T0vVa8PAJfQ7KPULcMxV5
	dNX1B6cg/74GDvysUfQFc61rGSM0HE2W6vSm8ukijeNTr8rAhhvQrKSqr/hfa2aMcUely2ZGeMX
	2pe4rNPYo8e06LZqigx6s20g=
X-Received: by 2002:a05:6a21:999a:b0:34f:ce39:1f47 with SMTP id adf61e73a8af0-35ba1d8b9femr1418088637.38.1763076591303;
        Thu, 13 Nov 2025 15:29:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeBbGRvCFU+UB+lpyJ3viuKd80lm9qg/SW6FqrTQPCqEVq2jmUv7RyRXNmK9UZPN5Ft+Hy5Q==
X-Received: by 2002:a05:6a21:999a:b0:34f:ce39:1f47 with SMTP id adf61e73a8af0-35ba1d8b9femr1418047637.38.1763076590803;
        Thu, 13 Nov 2025 15:29:50 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:29:50 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:58:58 +0530
Subject: [PATCH v3 01/20] drm/msm/a6xx: Flush LRZ cache before PT switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-1-92300c7ec8ff@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076573; l=1701;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=P0TGR9JNBdFdJf9lbTMB3me/b527sl6CR0hvyTZlFRU=;
 b=I95TcxJrZo5IfCg2YLag6wnr+kCPKB/xqUAfc8bUf+PfKRdx17k8+cUdMO4lgWu4+f96+05+p
 nU3+6ArVQ+8AtFUkQwj2m6kgMzzvLE2RHpuoKjwRJqkhXIvMDr5t/LF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 6FzRZO0-Grag2jOdOgw6XBEBWSdfPhZY
X-Proofpoint-ORIG-GUID: 6FzRZO0-Grag2jOdOgw6XBEBWSdfPhZY
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=691669f0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bBR9okFf-Jgdumx6fEkA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX/YHa9EEqknNS
 skS7YhFpbRLRwUInNxdOoPo7ZO8iQSnrVQLZbTdpQ1E5rXkpT9UTYuHi7dSgSezIbaWbiATFM6h
 B8kiw1lzSNdvPyNwVH3Kx71BPQ6ILp73FArrw/aSlHpOKwd1o2chvtluflLWm7J8j8rdyiNCojq
 VINL5y1bkE+0Vd/iDWowoJyZwlzihInyyNNN11YhUpwCwcyq2ByPyFiufyYd64pacG40uuSfClR
 XC7F9eOzAn4CJDD0B9NN+9fRq0Ggmc+2bxlDXAdslnq3iJsZy/0piniZ2I9A2pdBfKdR1nrilY9
 FXL08P2Fp1KVzl3qmiQoPb3K1/Pb4hc1VsgdJ7b9g6kii4qtmpOb0Mokn6G6N3UYQ2E3KXdkraQ
 /bDasCOwtW8zWRLSADFHJiGA8IAteA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_152953_745624_BB494222 
X-CRM114-Status: GOOD (  14.30  )
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
index b8f8ae940b55..6f7ed07670b1 100644
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


