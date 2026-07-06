Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551C0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=; b=L5IdH8DsWxQFEPZU1cp+0lRJ5U
	AcgSO/IXknLzzxxLvZW0NovMrQ3KrIVcNZYJU6OzG2oleyvQPk+DKuj0Etg9JQ+qC4hK4ZkV1dsdW
	CCk8BzwkXFV/5Y0m4PBh+OlRu6pgbD0EU04OZSuSzo3BvtM5H1NAm7bhW/QdjZWE+3O8lpCmS6IQ0
	7zmIaWulablEJQuoGiygN9fYUqKmjDij7A4cxyDMm8yEuunhE8FBAHB0dkgiiNmg2h3Z7e8Zab59v
	GCuENfq21RLH0yh32rNLbYjgx6GumWf/NTtxkmUANn+5FqQJe4hXFaPNnIK7eG08IOZ8mYxqBRr6Y
	klNg7Qug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqVP-0000000Db78-3Raj;
	Mon, 06 Jul 2026 21:05:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqVN-0000000Db5i-12Ic
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:05:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KF2AV1642034
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=; b=Nfe2e3kBjn1flEcj
	9fCTeI8Psnisy1AXPGc3a2t5QPCx3o/OX4aze3IGnGTLw/W7oHQbVFny8/lWiokG
	jBNGIGUimQ98xkXAiv2AOmVBNnqF7X780OUA3zcJwXQ5Y/2mUEBO3H0Uvg6SHVeG
	zpS7ooPd5lUJ35xhwjS2anhkpvmI8Ng4uGuFKiaDIWGk2luoKo7N+hVyo/2hzOtY
	k1ewLJsHXcu7FzvLbheLXOeJXBH0Q/W5sC5MA7E6FP/hJ9/57cJVE/U+UD0erleF
	zjUhO2/MQuszqOdM262shEHp3EBhx/GorCp/N/+NNfgiBvnPUq2+R2V4U4T1nQxj
	Jj8LEg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r2u3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:05:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c860544c077so9544959a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371927; x=1783976727; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=TBSXOJaNLqQZ2b/DTDtQ6HBJYse63GJpQn47MUOweUZikqsGvhh71ap3uJCrtT19By
         QnXCcF0w4RclTrbHMpx2YWAAdQyhiRhB/XPi2sHbFFOwsOsPhN0lS3airCoXmpd9A0HZ
         h1GahJlT2gSVZSh1UST893qTTjC0j7RdojGaRmAQ+i+rAVdtU0R1AOdZG138p7PSeI88
         cR6mN1xAvmmTDKUWbEdU1EtorRcHb+nP+7VORXA4rrPbqZMSfITlz8MyoC0f4co4qdSN
         Xf1NUiRh90AXLjFRt10N4nSVBO233tcNJn5W1urAw6dB0Hfd3AfhKvxcXDV4mU81u1mh
         nwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371927; x=1783976727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=sqPvyU9RfsXx/ZTTmTUlz7+XVYlvKrbsetLyQZ8ROBGsORaaB052Sgb/kV2XtWPajv
         4X4Um3R0hhNncjINeL5JJqOqqYJONme8TqVdwm6ozwD+R8oLActlpdSv0XcZqJ9kf6XP
         11HAvuDfRvemlzb53/uZtYNMwYl3tC5y7J7cQwp7xM3SCCDqcSrVrvnDLzT9F7jMVi8K
         +SYmA+BjbVq0oC21XJ0G384HjCnctQ76cbpKSIZM+H8XSUcKPZ4FM7TohBchHrvFQvYl
         8n1BRaFGKHcqCevstdmAsOKuTEeeibUytby06ZEhgc+pSHl7jouxVRgpZSmOmw7jU4fl
         s4kg==
X-Forwarded-Encrypted: i=1; AHgh+Rqb2XyG2XVvC3YRmfV4GG4OqLNYILJiWG7Fjx2BTuJFVRJfKrxaxlfdrhZ/decCzeZI4qW0MH9y+jRX/CTSK8DS@lists.infradead.org
X-Gm-Message-State: AOJu0YzaU2hsgQ/EfCwKEx/pLGAw1bJCgSqYhPBQsFedMxHUsgOa5f7U
	ZpvYe5qvkOckCR0G8fW9sLyFLC4KtOddUDynp9hhL1plOQLqzek7Gml7ctPMD79fKz7Hx2wCkLv
	1nDHeY/Bf6AYZWQ/e6IXxsMj+gCZp+PTldW2xVXdMMyE++8nPJDG/1QrQ/8qsSi/oj61tARceo8
	TXLA==
X-Gm-Gg: AfdE7cm12tvtRepKZg5GUMGi9Apmc9jwgYkNrZfQUmWNScWlYtkAoklY9jennB+iXEQ
	u9lQW47gUEujQMvzLbWx5bGd80UrYtuHqRR2+HxM/zhjXjb+3Vglr6Jpr4giwcA2ayskrZpD+6E
	2A4Y3wS2P6TDdY1O9lgLtfKTxKOFhm17qUsDDIp1PHHZebimLxoGVJ17s+l90RD5bpreNUln4yb
	TPkZSTtKyDRaltVOZXO4qoM+wF5lAsnJ+fP8fAKe4SZNwfUOzIO5Tf3iN9vBI3z9wpTEBAmYo7x
	DOx3N4tJnjHNMs5u7vEdyEbmGDMdMh61zz12CRjuu7ReBJlGZJZoi0T+FAOEVh3I6L8lPjwdgiE
	xuoKSquqZujZYsbWnD/RLlDTixBE52xgsQHA=
X-Received: by 2002:a05:6a20:914d:b0:3bf:6c08:284d with SMTP id adf61e73a8af0-3c08ef83fabmr2831623637.60.1783371927237;
        Mon, 06 Jul 2026 14:05:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:914d:b0:3bf:6c08:284d with SMTP id adf61e73a8af0-3c08ef83fabmr2831599637.60.1783371926807;
        Mon, 06 Jul 2026 14:05:26 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:26 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:35 +0530
Subject: [PATCH v5 3/7] dt-bindings: arm-smmu: Document GPU SMMU for Shikra
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-3-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=1298;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2jQmU1XEfwX7ksFDjORvPn6m0bWV65j9hgt3Tl3GEMo=;
 b=ql7/qNujURK5g0Rtx0oRe5F0EU5W6LTR4C3UxuwOB5V3LYSyWrfhLBHWlDx7ojbZZsimC6+l+
 g7ggaP35tf3BZydN57xyWo8ihHxk0MOvYi4WuQM9x3G919M+PkRSAFe
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX/5TRA+Ccj8PK
 rZD9b3MM6JyE+XF8OKdtVKcOQ395LIKc2896QDzfvlKAro7U/7FwhtnPzrcvKVR9JhMwxTzkLE4
 udrCi21qkPRbZ0jU9PoK+jBzkM0x8Q3IybRF4p8ckIVgq/C95H8QvlyKJ61fHzra+/BHngjqUBo
 eUR5Euz4Rbv5YhrbXyuRZRZFXKILkKkw9KKQ+GcYXmYudMm+GKhuSuUvX8cLSc5zZ05wdBUGZS9
 NVE1nL0p4ibLvveGO4Gw7/XpDQcz+VgJ6O7ZBa6x+z6eSUWI6CFKQQ44rLJgJfMdQRWt4PMYJL4
 WilNfudSaAkFb/y0m5olRENTOhBuOzsZg86lePXsMz5o2w75qDFq1UDC6omdGqM/0T6Xrx7nbcH
 bDcmKWpkeaHUb9fdHukkPX0WHgjwm2h4h5uDQrWI86WVzZAzWuosK7AqDy6Hs+RdkYIhpJhMZ60
 SFFmNmm4Wmr16HBVEBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX/zi6Ct1+BDiU
 T6NobRNFsLWAbSL+FK+5e0JqpjZb4SDndibrlR8Q0NAp815l3sPsdNbQ0mh3smffVk+4IziyVsD
 sratQZcR7a0qh+DooHcBQI/r9fv2XSY=
X-Proofpoint-GUID: QXg9uOghTPJUzQ9TJxW0MDpKDjhutTCj
X-Proofpoint-ORIG-GUID: QXg9uOghTPJUzQ9TJxW0MDpKDjhutTCj
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c1898 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_140529_403141_6F59BB44 
X-CRM114-Status: GOOD (  12.39  )
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

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add specific compatible strings to document the GPU SMMU present
in the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ad15fda5c25e 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -108,6 +108,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
+              - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
               - qcom,sm8150-smmu-500
@@ -543,6 +544,7 @@ allOf:
             - enum:
                 - qcom,milos-smmu-500
                 - qcom,sar2130p-smmu-500
+                - qcom,shikra-smmu-500
                 - qcom,sm8550-smmu-500
                 - qcom,sm8650-smmu-500
                 - qcom,x1e80100-smmu-500

-- 
2.54.0


