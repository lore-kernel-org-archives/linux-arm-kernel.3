Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A85C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=; b=qWMzdWF2FCmEjyK6ybDzzCdUqo
	+l59YJsWSlfjzP91BYedMET0Ugeda29Z5D5zc207AW7HyBTKWGM4ICvuk5Kd6C9abizv9NO43tnTx
	8vLb+cSJunk9olHl6yn/w1NJqJdDGCyfQGtGccpbfVOsVAAI3HLR7NZ1iKDQ4uZAZFLE+DoVc4JXF
	5KwDe2dloyXdMJMId2Ef5hg2C0Rd5FRkoImxTSn1pkH0vKQZ0MOT81+gYmPIKVniHdM7VOOlWEAXm
	wwXRYFH9FwkVnk0yF5aMWW/s8pDJsD9u7VcCtMfvYyl3HQ/71zcU+b3XqnOPLkX4e89ZIp7L/SBZw
	jbzsrTQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whti1-00000003HuD-1nkv;
	Thu, 09 Jul 2026 18:42:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whthu-00000003HlH-0jkV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:42:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXdiY2475550
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 18:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=; b=WXBqxrOaqkH3Gwi7
	ynIky3z5jsmrx6eW1ol8QXMfbBkHdq0Fo/t1FgDFME6hbvhhLUC3XFMsrar/swQJ
	FOQOjeFamd2ipwcVMyQnGiI5i0MkkINOC2QQqMTb2ei0OMkVCMzWB5f5A2rzC5O5
	8b6hyFb/D5Fic+DbEa/aax+aXxDqQz6Q94skVrr+LfXNp+sW0C+MmsrWUDMntbKD
	lu6cyJWPNtmdqTJKnZ0ON8c0W+wpJA6kcnMcMNvQpTJs6i4ToEIpmO8pAcIhQ6+i
	9ubALVyFK/yMyZ5llIbwQ3/ObPzRPtWItKkS4Y/e/Aj97o/JPSKz+Op0ipn4pbhC
	46qdVg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5mrp7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 18:42:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so204371a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622564; x=1784227364; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=cVYUQlp5VImM/O1nSSRtALDPjLtQBNkoKUeXAUJwtPmHsbi2jeVdbmSPtb6e8Q8jnd
         01Ive9XSd5Sug1i4XkVZ4Q7qeiyG2bTMmlgf6Icl6lKcolqGnLZRaB2O+MaK13USSVPi
         HDAUMVCCRjBO1M8V/PH8WGwy6WAgynO8AaGGCIMZ2LSbTbEJig2hbKAzJC50/0gQehdU
         f0iAIbWi0NUUo+lUVBG7sdIWnlHufwK452URPbqpKPbEUS3E+OvG1CRZolBQ4eJ5/SSv
         DxbuDVSvcU1DLRu+0rHARWaQiKcDXlEZ8WrWv61SgvRbkmFsONG8tLpr7yYCHx/TY+ym
         F8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622564; x=1784227364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=SFQxQI8aPsvnOoUigjjVjifULKBNpG5hVJS0L1rJOimI7qJZl72xo9GA0qqWgAKcs6
         mw9EE++w80vaH/gNbIZu28iPHW2T/Isb5GGP27sWtzPwW7lys9Zue2INVCiQ4yma3Jws
         ZLEsKon41DIvnFRDQIeFhbprP+4F0o0CQo5sz1XmLojqQpjRLLN1Pv0SKw1vF57xDT+z
         jFnv/XQEE7lgbpZxtYQ/Oj9RGTLh8St0UzlNhOU+JFvBiJ8xKmo4QLt+ScQvtJ2Zi0UN
         ETyCQEMMwUiKbpah5ssGsEhgIA+tmItfg5gx9UAAz5VUcv2qZdHjz/ZqxwSs7L79Zdkn
         JdOg==
X-Forwarded-Encrypted: i=1; AHgh+RrsmZswYuUl0W3o48PP+OvNDbYIGLrB6QnEsn9jEEjTv529qtHgA3TZkGWNoZl9TrPBW/7MD/Hqq9dPrPH9rEwE@lists.infradead.org
X-Gm-Message-State: AOJu0YyoLKVdY8MyDfv7/tnoSi0CGz0irGWkCilNfeL97O214dyYRt9M
	ASNytp7OxPVNWkmGm3b9LSpfJFh+29SWtNDB3cfi5orLEC8NRELltQOM1EejA9iKYfT+43I+Ofg
	6E3LgfvvzE1XltRjBV55xJyN0iP1QOH67Ncz6xC7MrL8gW9mj5r0EqoZRq1E+MpMaQdY1so5jSw
	0tbg==
X-Gm-Gg: AfdE7cn9q0odv3CgOgkN3m0TDbeSARILhn1aa5iC9PjJidpLrnrvcp8bvDzJGUmC9VK
	Pte9p/zCS3Qp8U4RZI+RwUWXEDxpPeFBZDUq8KSXBsSv2tJzf/TB0Ggo3ccEOsRZd/dcwC2t/C/
	DbXiI0perbS9lTIqZQGAKhCqkqVQkNtdEVXt1UhMgrLgYMLGBuQcz7/Hh7jTcfgoDG+Pe/dXO3p
	HoJEVbu7PMB3tbOyu5ylekEgxGhyYG1SPx9fowIInzni1KZxrkiK0bHPqK331kScaTU/YRC5xZF
	Lm21cBpdFhue6UF3EU7/Op6QFNLm7RaFpgdnFM3HjdgBJyPuhn0qThizNBmlRX80M5SVSynu2fM
	67OzumeSXOGKoXMiE20msRdVlx5E6fmC1c3A=
X-Received: by 2002:a17:90b:4d8d:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38942f7105cmr7852581a91.22.1783622564160;
        Thu, 09 Jul 2026 11:42:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4d8d:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38942f7105cmr7852522a91.22.1783622563682;
        Thu, 09 Jul 2026 11:42:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:42:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:01 +0530
Subject: [PATCH v6 2/7] dt-bindings: display/msm/gpu: Add support for A704
 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-2-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=e0reXjU4841qQsB76OT4bfKmGmY/z//RRWVRYHDWGzM=;
 b=U1bXBRrZl0X7p4f7phkaOBLRRIm0dBDAxAxqeraekRPEoZjymcovUAG/9AJRQPrN14gyQCzS0
 cOS+uX42ydIBnzzAcoCdQhe1IOFCJGt5PmboodpVnhVnhZ62hx9ApLI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: q0MimeYMCulWVq_w4nR2O3cq09rTBPxv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX+GH8vwfAF0Ev
 PXxoL1lpjaK/wdG8FCaLRdcT3BHracmNw4HlU3DjHqF7QAkSXdmfnWvhrZNTlkcCdutpzlPziSb
 DidXgveo+FFV6PRDjutBwva/BaX+MVU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX5tAkRHrY6vbv
 WkHvg+ONEx4E8R2iTU8gUJmPoLJ3GdNHIo341FnqeNFamg85jPZojuzXyfMudHIYpkqHpsnahf7
 5ZTPSWW+aA0TyGkvcU7Mq4awQd5ObDPiAemipK3RFD1818asbNhkbEFreLcHRHZMcQBWCH2Nr1y
 X4hjT6YeZPLB2RX9DhAxA3FAy3soFHbI+XQGyLFkNBaBtJtCt7qgzj8Qb7rvVMPWQPtW0VjR+MU
 w7pFclfMh49maT53LBjM8l4N8wpJ/Zimfp7/T01aoyt7OFJ0x8FbBq+z+Xz9PlUMS5mbYIoOium
 u5EFAgD5FJswbbH91o8DfBN+NKCEQz2WBFIxKwVXpgeydCd3wLT/Cni+LhgoWE1gx5Jj2Ejn8cY
 9Ki69WNbX8HViWeYHLcF9KD8zhIVwYJoA72haTxX1Aduor2s+QYYD+ot4fSpda/5qeTD/xXL4np
 sjqxXwb6LBMCNw4GJ4Q==
X-Proofpoint-GUID: q0MimeYMCulWVq_w4nR2O3cq09rTBPxv
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a4feba5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_114246_346120_F5C64979 
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
2.54.0


