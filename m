Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610F4CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 21:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=; b=Lcf8DD82cYFEg5NfWzFL+k8+wl
	dNbhCFuItiD1a0u89d7az1DB9Y2CJ50VGXrXtvpU6A5uGfZb0/ow9qe92qXbmUmAs8iCNXc5BNLtn
	/DGlTuQGdffSKAkCyuIGq/K5pQ3az5ifNYdGAr1rA8ZwPs4QS5ZTLmigukqrYkvefDS5T1lA2z8iS
	ngyOEimi7F/uoFmts01oMCIKsrAzu/LM8aE70/DjPGwZSxQFV55ECyUoPqOfCs1RdQ5AEJmrAhHqd
	8BGVjbvo+3XgjoLJNQcpRAeAtxCyPQAc/s29W7ACYQSDwBXEwJYS2Jp5JRvs3AioCNr+g6VunDYdZ
	OWGK6/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYsSI-0000000DImW-3ymC;
	Sun, 14 Jun 2026 21:33:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYsSF-0000000DIm4-490q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 21:33:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELETRF2544530
	for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 21:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=; b=kZVvZP6VJrKoSNV7
	LKhWeEnDvy8IowCzIt6/hmnwStxg4uCjdN1GlRDOcsPizXajLUvfCBEdbhYJR5ut
	bWBXM/xGfnVx8JP3CVlt48QKCcU0uI5nCar9ZL/AUh1ImXT6vzSZ1exCyc/gNLgA
	FaBJeKjOdHlqowWqZF03bGMYMziZmq7WqJ2bVZcE2L34vo+p4gJjRBFT94FtlxBu
	3QgMvuOhG61la6WPdSzn0KK3/7vM2sgfuBprK1zPpE+qZqNKAaZJOYRDqgEiyrZV
	Gxb/jUlrN7AlSEZjIQqv55kFWmJwHOOxQ405eb9mMaRSCr0p+skAWRSbClUnGwou
	9KtT7g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6chj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 21:33:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso72837275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 14:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781472798; x=1782077598; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=;
        b=ICDorYPaHAlRT3eZRu/GJ4xgVOW+3ykM2o6wYIv6d0JBMqOqxxHdE9GZOS7FD/3MR+
         ExFqWpxddOcUp6CRZX4iIInyqCQDm3CBh0611+fpGzktmUge79qvuqp/cmsQ1E9ovGWl
         /8CSZmBALXcDwkFVKnU/DxaWo1E/mV9SRHFtnXSRtp8llO6UnSKm8cmp+w7XZGid7cVS
         4FokVON9JSJHBftyprC+2xud/DkXV/JPoXOIrh8++SQRf9oMSpxv7M1enL+YjY3r5u6K
         YrlijAWR30D3I3qya+4iJJnogL6a3mImNC9cEX2lu27MKfaJee5AAAC6VqVNPUtZqA6A
         4tZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781472798; x=1782077598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=;
        b=IlHkE8M2S+xKVRvokitftDNSoa95IrMZasBgFXrQopFuFXyOuJcKLiZbvzrM8FhCCi
         0rRv557qonFurKyPIVJX/G2HmT//ubFzo1YJ1xMdKj/Gzu4/9vlcgIDu/zYnPq0uxRKi
         Ulqtlacjc7W6Mkzox9atRmK+9hYIon6uYvSjQZ8T0IHlV2VJAGmtccYufpdl8L/VdZmz
         HrhjICBXYSdAKHzL38ZFbREtTptA25HZonWsfZYGv+EPG1CHWX9MfGvTOn/ifHFOG+Cp
         uGRzDZt1HHXzUU+78F/TCAt+PjVOU15XtYpH+FWZ60dSz6Imz/MMdkkKS7eJ70oml7Ll
         ec/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/7kw4P27iYhZcgLB6avLPGN+mwwbisndSoq/CAiikn+QGHpgIOmeJVkzHKDMc00K4WNmLxEy0ror3Ds2yBVM41@lists.infradead.org
X-Gm-Message-State: AOJu0YxWgdINzgBrwVcpOUpteO/lm3B17uY4dbmk5ry4C4glMeds1T+q
	6ouA2khfDCMkFFrmHLaZ0cLBQDKxiIemB+R8tmfGmdQ0FCWNREdv2CdYA6DYMiH11LVAR/zxS1v
	JscRvFDTKVBEXtV2xQpcMDzytE4W3XMjqSTNMB7IMngNwBhksbkfRw7lrAp+YS40Ja5+wVAuW2h
	xR8w==
X-Gm-Gg: Acq92OH5jsxJibSZcOLUINJK1/85AgjyucEo4oNoYL2uZI0iaRtN8KHt+1Dd7wm8czf
	J/dR2V9wKq+eJ7iBqk5KvIRSl3+8uWVAr4N1FiYZUdWzlNwrus/bM3mhjfH1lu4k526pT3hpD9y
	OblAiDphQCjhaItqtOlsHlF6NMAocyUD4by6NapQ2unx9Kpjtu3hIv12XPA7z3U7b86zQJFfFag
	gs2Z/Pn89Hz1ReVBXY3sXH7are10gdUQT9LIWgKAK7QuMR72jTTPiAATqo5uLhsSaq6xyxyVLx4
	LBcb6rvo+iMVdw3OVguipjQuufHRDvqQVk7ceK/6m6Lw7CrdI1jrUJjBeEf+wV9pKgD1jY6q3/H
	1g3GVxTOuc6d1HihXLVnx7cEIxP2oai1heDrMUVpbDfgWmA==
X-Received: by 2002:a17:902:e54b:b0:2c0:bb2d:a314 with SMTP id d9443c01a7336-2c4129391a8mr131369475ad.28.1781472798098;
        Sun, 14 Jun 2026 14:33:18 -0700 (PDT)
X-Received: by 2002:a17:902:e54b:b0:2c0:bb2d:a314 with SMTP id d9443c01a7336-2c4129391a8mr131369115ad.28.1781472797754;
        Sun, 14 Jun 2026 14:33:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c5dsm78385815ad.21.2026.06.14.14.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:33:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 03:02:57 +0530
Subject: [PATCH v2 1/3] dt-bindings: display/msm/gpu: Add support for A704
 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-gpu-v2-1-2f2d1347c3fb@oss.qualcomm.com>
References: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781472781; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JBJQ6bZjxqgxmRsc6EMGB+P+JygJ8pgGviEVLPjhEKI=;
 b=9c/Nh5M9LMZTEf7PKcK+5Hqv/dWjx+aNYHao+IXyE9Lpi8hX9zjkIPm1EMl/8kFjmr1IfHoDb
 QnNQYN//NpABbbG/pAJC2eLV4BL8orSO/XzLvu9r9mMxo4M1FCp7ipD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfXwGFUbWy1bT0K
 urOtH3Nvs8MxuLed/KgcMPr+GH2BBA3Ze7VzeDdibyPPkaQOEwTSmN1JICWs56erPU8msSsAiJG
 x7fOxLKX/dJZOgUaSoPVpttMFGzn8ng=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX2qE0EI2KUpcZ
 fbRE0wjzgBCwBv2ujLNDnroUxeUr+mUN/YuMiozCPTo9UgdkPYpjZJEi7DvQiFA4IGp2aUPpD2I
 3sBL572MUEC1boKd9ogHiBsvQz2al1OsYQpwZiUi0x+tNpHFBMIkhepeEnroJcC5uQ7o6TYNkov
 bq8xdSrf3bs1LI7K+c9dUhwxd7gAZObFkzRYYzXQawD8N08W9uB+eB6a5rX3doH0SMoKkrfkgj/
 MTEgdz80pvtguzMDc1gnD/q2LoiIWDUCkfWmpN6hQFMVeMrEiKL3shCKOaZsscc/mFXIIvHgR+s
 ZzjziW9K18r8/vIR1QXWIkBtFMuC6PQI+yQIXb1Qs/xGifqCgDCK/jM4dMX9cZj+JW6/9Z1n7Z0
 N4eINbInZyPzsGhBB1QKfFquctOsUu8d5DZ4wUkaYFxMubCI1OP/47Yf7FpATcEjEU4wx8jlTDP
 WgMmrhxcgAZub+M7paw==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2f1e1f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: HKUruE_BHfRQo8Z1AX4XX0SFd5DOkW-v
X-Proofpoint-ORIG-GUID: HKUruE_BHfRQo8Z1AX4XX0SFd5DOkW-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_143320_153934_7127DD76 
X-CRM114-Status: GOOD (  12.26  )
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

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found Shikra SoC is an IP reuse of A702 GPU with very
minimal changes.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..8e648bfb3b23 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -353,6 +353,7 @@ allOf:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
               - qcom,adreno-07000200
+              - qcom,adreno-07000400
     then:
       properties:
         clocks:

-- 
2.51.0


