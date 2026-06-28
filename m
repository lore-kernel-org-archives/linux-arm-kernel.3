Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0315BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 18:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=; b=oRh92+afzMzYOIcAJ2T4kWkdm4
	fo1b2LLKoj/tYs4/RJer6LJ2uben7Z7XqanTQoZBDgw0IT2HQBFNlahmGjN8UbplfFYwAx2wq2WJx
	fhA76n3X7SOL0N8xISInG5chEH27gzqgeEN08CcWopwfPsLHj5bdem/RINxM4XggsjOFIFG57W262
	2VOfnKkLORpzsRUUnX4KcQwLGceeeMTjyMI/Yp4tNWIyNeaX20uYlD6QF7UNfgyJ0DW3diz/04qIZ
	8GmemB3Zx9CU6gTG/GGrpZwjgaCEDv4p/XE8OjzE8P4nDs5P1iPr8B8k5Lh++P1ntaFMAH3BSXRPN
	aP/9JKHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduBH-0000000DGli-2nfD;
	Sun, 28 Jun 2026 18:24:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduBF-0000000DGku-0vVI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 18:24:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHjiqh450912
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=; b=b7gI6+6E+IyJ3GMr
	JGNhNPvvWEuhGi2oyJJfH1DTEQHSNX6FbL0eowjjuI7VjiPh4XSwP7BLOWIIV8Rl
	A5H5QngRwub9KeE5tQw3SGiAAmKJu7prlKkvfGpNEUOOhu1aXTb8G+1dF39AbnKg
	4oRKopXTA/yYrMhvmtRymFr+cNs73lhBW/viD4ZGf+iYgNkZ1dgWeu+0Z40228t+
	DYBk8Md2Oe5xrscuUVFHeMtgpr/2kGYIYYQc1AArU103RO2M5jNoOdoDohy4Pi1j
	ChZgXuVhK9rH0fi/9OIhe9/AqvCbRqFlok0YejzT4ajEv3X9SkySW7YmraHOTTvp
	+5ggHA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8kew5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:24:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0a27ad86so5673477eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 11:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671071; x=1783275871; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=;
        b=hqgsL5sqyAiPXlGC8RQkabsF6PxgidIemjlnGa8bFtdfblrpQvBc3Z7KIKgtvfIivk
         5ziTyuDHrQi6VYvM+yP4galim5C4o+koPnUwge1YNIRcTu/H8lgdNZ9/5P8Ik4AZfTwG
         H6c2MpHuI8OhEiMyIKjuQFpTuPrVmnkWZnNKBPMByMKl0GBvnnHHqwkB38Zu1kMyIoBZ
         OvcOHrqv6DyexcWWf5m9CipeJ7B3jv0UXa9mUYIat5d574g2+mk8f7Mv7c58U5etjKfJ
         acrMI5dRDm9gOlARHJ2l0HZUZLaRENhaEdw/CxK3Sm/3nDzXuB3JmFOOyIntEio/pugu
         nmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671071; x=1783275871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RJNbTAj+jMFVYX4XVSum5y6+uZsOGvYQPlgU5ZiXWP4=;
        b=YsgU1SCgieIEVe7e3ISBGCivqDFWNIT9o8aGQpbsTSyI8vHmEgU53+RX3kJTvdBsaF
         ZTnSlgy1uepLLZfeBi8CdwOV2YgRjxJkmYR5iBdfRXMErL39iUhcsHtwxYjha9ONbRW+
         sBMes0v6xurH+cUzoit5TENw/kilsFpx47ylbjj9eops2l8ynZaq7f3ykkQDfKjILbFd
         5C4eo6XkBZs2xFS62O7Kgzej+bUxCA/NqKCHEUCHnmnn2uuzH+wRcLl6zJC+e/F+Kk1H
         87+jPQ5fvsEtPBO5vXnom3Lym6DanED+keVlnSVqYM5EJME3BTYlDE0n0bSXCY/H7Pip
         24xw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0RU+6RvSGfx5oveRM5zlrqKhDJ9qfyW23ewGYCa6Z3qa7rNhUlgIHtnMJ2cjLuBwqa7clm2vATntbrQxpgRyd@lists.infradead.org
X-Gm-Message-State: AOJu0YzFNZ22viGJmNfgONQdiPFW3tdl+PbhNUfb8VIeuegUcV+XW/5A
	7CY16ujqPCSVXOCUGDT4nocvxpFEAeuSutwGnRjIFJGRkLECy5I9IEJq4HwWOogi7vY9KzjmnwN
	kRamhmbgs4pNLpv/NDDmPTBuEFOu7nenlU4TQUFHfVG60bsRD/TuBfhYHWHWUKyJCYbQr8n3E/U
	cb4w==
X-Gm-Gg: AfdE7ckz4peH66hyQC+Qo5n34n01mHi7hH7ntCGLYoRO58m/kAfXVDQuk0WImdCV0Ow
	hY3oZkMexGYU7mnJw6G9nitT9xa95O+kWAQxK7I5UWnG785AiNoQFxV8yjg4GX6NSFwWHUCRe38
	sGOAIsKLtM2DDR6tk4Ub6dLdYM0CkJUpxOBcVyEvvSbMvPr4yrVfzWIWagzpJsm6MSuHwK/hpt3
	Zs8Sl1WQWMpx4TnRk0zc21tIGvBMuj05hFNxgTVfzwtSirPsz1G9qCpbEqQdQnbzYMRFbrjCuES
	cAHCAGnBCVrl8iu3J40U4xrWW2C70Xv8/Gd7ZCQifwdG+MqZ1nM4+VsEK//WwZp8+/HwkuXTgWK
	8dU55ynbYaX0bGdABj2GFleVLDEmntxVHGuE=
X-Received: by 2002:a05:7300:7fac:b0:304:2176:a871 with SMTP id 5a478bee46e88-30c84a265a1mr13670320eec.0.1782671071202;
        Sun, 28 Jun 2026 11:24:31 -0700 (PDT)
X-Received: by 2002:a05:7300:7fac:b0:304:2176:a871 with SMTP id 5a478bee46e88-30c84a265a1mr13670305eec.0.1782671070686;
        Sun, 28 Jun 2026 11:24:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:24:30 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:54 +0530
Subject: [PATCH v3 1/8] dt-bindings: display/msm/gpu: Add support for A704
 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-1-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
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
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JBJQ6bZjxqgxmRsc6EMGB+P+JygJ8pgGviEVLPjhEKI=;
 b=22p2wlSkso0sZ4PEQ7LITGuwdJa9RASM+Jq+223nG5cAcH8yMmpZFDMuD6z9JBVhrbUJh2aE9
 UR9CUdoJ8n0B5yFmfy5Fk5N6AuTTQsx6RktlFU2oCAgzHBC3Pba4JXE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX/n9vZ37lGt6A
 Iq9SJk++0hBYEbuLrrhPGiYgIDpF0ZQL5zdeARvf89uiLE+6NfSaQwGnguk5Y5jrVpUe31PNGf2
 ez/TfBzTesGEoyRDKIRe8XpNR1mRjP4=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a4166e0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: LnfVZzr8Y7yczXiFAvkO8KufahaPFjI8
X-Proofpoint-ORIG-GUID: LnfVZzr8Y7yczXiFAvkO8KufahaPFjI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX/B83o39cBUAZ
 t2jxtgAZhXZsGDr5Vv4q8Xp63rMfo64SDeqG3ni64dGF2XUZKC34OBBk2bF2GW2sNnGtIl2AhtU
 f6CGfsh/mJqVM6xwuEX3mgXmyH/tcUbfZY/Jvah+tDT5Tdm7O1z6jqbpR+pretu/8h74gXeOGIq
 Bnvpp3GaEsUCbA8VzSeRuITCASMBpQl9+xS6sZdVt4WcEp95rt7PFxZGmoQA5V+9XgENayy0iKM
 g9jtFLVlP1IoKtBOg+DBQf0Lb0o5U/ffkw0WTBV2Ceqpho6ZX2Rnh1O4VQE2tNKnhRxQeMq0wKH
 H66pwGxjrcJEHOPIULUHRdv8rM2uIBtH/+lC3/u6/iy2NmqsWR6q/9AJa+7FAeL24cEAAjW09Pj
 fKTXY9/IK6FD/7czAzmHM/hixgB4a9NfOc/DAkfwzkK7TFhvmU7OLVNAdO4WNQeLpnzwzVW/LBU
 OaOIwIDNv8xEpdLrN1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_112433_386260_57DA2BFA 
X-CRM114-Status: GOOD (  12.27  )
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


