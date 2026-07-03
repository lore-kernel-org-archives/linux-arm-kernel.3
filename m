Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6DDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=; b=EDc2JY8CtiKvWfWBczYBYNE3XK
	EBBvlIyyk5D0iwwWjCDmqoYyTR9FNrdKmsSvNjRYB62B9efkDAaL82j5qK+NnaLiZdjEcHAGFpQpz
	GB6Kjpc9g+6wit8AcFmU+ajAFlaigZeIR+Ql1GkdzjbazQqmupTG06n+vBp6lI10Vye/FfmAtz/bp
	YTP8jbA0uNhC0E6mrNoEw5oV0FXaOKOZ2dI6Yc4E8aj3OhwTQicA22F3OphpViVckY+Aw4C4BqgoJ
	SPoiQIQbc1xOO+jL0zKW8W0Fvpjdcj+RzreSNcoZfaNisIivf1DcYHub+bJBJDY7yNH3M1jXHELjR
	gfjJNkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkbh-00000007rty-3amj;
	Fri, 03 Jul 2026 20:35:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkbf-00000007rtE-25b5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:35:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPuHj1031407
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 20:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=; b=bkVbzb/m/+c8R/ds
	OquV2I1Ep8YCvaIC++gxM4vg7K7PZSyc4jMj+AKyLx7efXnU0ngZBlfbyE/mz8zx
	QoBQ5aHHH4Omjfwr6F1zNttJLcZsyTllra9bIKwHyEXb4rO5nagPVeFhUP54TACx
	BN9fYt8B7UxDdMnN0szkJvvg0GJLKEAjAQ9/9220RZT361nl7NK6ut2o/3loNwy9
	ohJeLY82VilBIvVO6UhCaERmW7I9zGtDYy86C6yqUarNARTNCN+WJ3Btlw+T4040
	eI4rQ9QPKPG5sicGAXAes68UDQNbBYYCHYOHpDUt2rb4I3IVUCtIxAimKEXqF8P/
	pa15gw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5bw20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 20:35:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811ae55313so776815a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110926; x=1783715726; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=Xqs7OXXCQsJX86nI8xvp3bilhUHFY8X4Uv7+decXPT+PtdxM9XwXfw1AtUmMD6Nh2z
         /K6ZT3WY+3L/hVbOiMC9gmRk0wtAZitTpO0gNJJWMO2SHMNZi0uQjqkhdR3jQVGC5TrA
         neBJwB2FBfSeotLwg7FQHDSGvwbJZDGClyQxEY0t+aTYQ17LNSUld6OF5S5jQ1HA2lr5
         eaoa5iue3ymAF+/hkMmvTXVPX0arJ0KfCXIo9UAc3Z2VXJXTqSqijGZ6pikHXBf65JLF
         D6nwp1nhL/d9zTad8rZQVCqdC4Qn7Gx+wbsC5HGUMDKHDOIlNsCsLW3MDGNbBKZzO0YX
         k5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110926; x=1783715726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=LRnMB02vjq7+RkEv47IcWzX/bDFByV2jcyx4FXGQIARFGFlD2cuXSTj+aPT4maZvhr
         GF2b9f+1ckDp7aZ8e1fr9b9Zs1/ZOlVsjoeJOC66XNIIxMcfjDcz+lKAcXG3qN9U9EIP
         ulZKGLOlI8F+WYp7aHitOO9tJKTpykzJ85FxfpiYE/ZWdEmKbY3uudZI8wFUONzvVUHl
         Rg5/CS2vme6Ae83dl6L3obdsshNKayYSKN7pDHd+DN+zg3fVdk287kqcV/8cz4jmPJqy
         0Sc7HHhNXr7GSn3CdrvoZURAQ2LFkH/15LkqtNNnlypzVYKk5Q6i0nQy8jiQBsPGwdBn
         M1bA==
X-Forwarded-Encrypted: i=1; AHgh+RqKJEyCG8RrgXs59SmAW6ZP9IZWrV20ZzXnWS+mHV4/yW4OVD8G9uCYbg5HBjHSq4D5sNH04BPLYhmjGqQXcHoK@lists.infradead.org
X-Gm-Message-State: AOJu0YwufvZvI7iyv/sV9oKw6r8VXsjCwhgGqrDA/hKYTNG4J9wQds7C
	s/Spmn+OVulmZNFJeowoBk7HHy6XtFyIDCPG1Dw14k5ca6BILOKDCJPaNWdMHoWwPN+N36F92H2
	TZ4Ei/KRoesY3MOHKePJEt8INDXcV8g9c337INKDf4MSZXRcCM0+JBNlxERAsa/jXYsImH7rXqM
	8Xeg==
X-Gm-Gg: AfdE7ckXG6yNdZCailJjtDTk/SD7JWAA6oRHpfQCuWy5bUvBv1uTXIu1zX6MkBGTIum
	OHT4db91uls1VFHAZgEmDE/2xHfF7MICoioJAizYkL9xOJAJ2s8YdQtJ9o+wWJLXs4E+lAnffB5
	lSQpYMnjdi/EgIaDa3+8aIbrxqOIbY9CMP03jRYnnC5w3fr5x2F+uplQeZhGEknq5LS2e53tFrK
	+yIjzywJ9dQcoFJPn4nZnVGYNTFv7OMgE5gVQEznszxkrnOYwH9Ymnihapc0thsd5cx64Y74Hht
	edPqWC1jA5xqFJhmKtVoinUasy6hQqiPQ99fs6iTmWdt+vg1IlyS9kmUkPKs1Z8d59zXI8R7rsD
	lChyuAFm0DJWm5WpAvlL3708oz9z53FGTFGg=
X-Received: by 2002:a17:90b:4c4c:b0:37f:eeeb:646b with SMTP id 98e67ed59e1d1-382800d2225mr1038693a91.3.1783110926359;
        Fri, 03 Jul 2026 13:35:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4c:b0:37f:eeeb:646b with SMTP id 98e67ed59e1d1-382800d2225mr1038664a91.3.1783110925866;
        Fri, 03 Jul 2026 13:35:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:35:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:27 +0530
Subject: [PATCH v4 1/9] dt-bindings: display/msm/gpu: Add support for A704
 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-1-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=e0reXjU4841qQsB76OT4bfKmGmY/z//RRWVRYHDWGzM=;
 b=366NlHMFnKH7Fuj62J9JVaF1Nr8CsES6ABTopFiQsD6b4y9xxXYodoaDhxIvDxQzXBPtTPNRB
 4O++nujOYdvChSFrKzJQei8xwwbHJTOg5lXp9iD3kMBWnYPuMWgEJpm
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX78UTbCz0V6Xj
 JEyrOuVMNlmEsWTM1CJVb4Yb3m+lZEBOEVREFKS94TEK/PyEDbCxlOW+qAqiCI3uyFxNHtozq1Q
 ZXTQNBBFACYvIK89ulkKk6eX7KWrRJc=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a481d0f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 91T-h88tVtsowaqMqKA8A2uMb4iL5n9S
X-Proofpoint-GUID: 91T-h88tVtsowaqMqKA8A2uMb4iL5n9S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX2tB5jO2ZU/p+
 1FKjxeCOgeGzJ6S/H5P4nKtcK/v7Br2o+jNXVZZUOXMsJBYRqmOXWvfW1+f9vmP6sOjAF4QXboc
 D8mHM8NRTVirum+Up2tKDZQx1Z5Xk5+wGEdAtK1DK+3XxTiq0+0oFBS7dsxs3YUtuBfinsQpRNW
 kbw3OaZ2Pthg5ca14Xt0Hu037Cat6eyx6eDOQYbyWpSS2kdJ00Rxpq0VtCrcTw37/HodTPwx/6C
 7160kVNPYua+HEHUfsqHB+MRPgMgw9jM2F4xTnTOs4Bgcnkqu6hMDeIiJtsleHjeYLbhw4CQsiK
 gIQK/XuSNPsogpa+oUUqxoQyXQDFU95/nC5PBrCOQvjUhbuDt1XPjwx0wmjoyeSLuAka6iSqRI5
 bohabOZrVwRfFm7xrIC3eWMZ42gU18A4q1MlM0KfLQlvLiK9VayXL+vWIvepvSn6Xg3gq2Er8Lk
 zbjc5FNTZZs2YpYzMCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133527_549239_865EFFA1 
X-CRM114-Status: GOOD (  12.09  )
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


