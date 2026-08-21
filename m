Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715EDC5DF98
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=nDklc9hafOC52R33dC9pCxVRM9
	iUUd2qhCzNJL/UyALWVSCsB4jpMkoPuZoee4/PS+y0NQAyCPYAy3o8JS8UpeXfN3qYLJSB24sdSL3
	dvoK3iMhWXCKsG+0FfoEosFuSPL5G0YWc9Q/KAzpRhRr6svDv/w8KZ/mVcH9v1qLS1HTMCxt4n9Wi
	xILDBdjPtDRMh0i7oxouTsRmNe71ZXJwSO/pRX+86V8zXzM2lP/zTHeFknmAbZtpQtV+KhviiLRRS
	LO3t6dPuRR9s5guKPkvkYeRWKWXntOvQZgtAqgd5rG2F0zSma9V/O/NPTDxPGcKWb1cNUjtJMUSLf
	7hZGS5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRrB-0000000DlV6-43RI;
	Fri, 21 Aug 2026 16:12:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRpi-0000000DlHH-2N0D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:11:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmVRr1641181
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=DcrIhoj+gqo3VxAl
	tAgB5aH3Q1SeXxZuJe0u4LaSmlPLEOh63oYoo/ckaKBnJ3XJUkdDsz6hKN99ufzR
	4rfYJNYug5C7UvsvwIX45j1G2A5Hso7HenY0VGh5L3o8jqLhfMwBNW0gw0Bxaz4m
	oWiBlv0r7efT58Rm9tTWpn10p9fTpgNHi8glJjp1b68wNgK3pKQJV236uOh6K835
	kFQh+odBAX/BYl4UotEWrqXaCyYZ31Q3EMaFLpn5aXl5ww5RfZUBtk3TgWD+UPsI
	ay4aXM+IzfvcWH6dNW+zL4AV60tRtb4v3dUojZ3RysausmqtZ50bB0JwwOjw38CY
	H0eO1g==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebuttt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:11:05 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-49aa4525b82so1781185b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328665; x=1787933465; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=Pv/i+hHZ3ciunrvs7UP5YUqIiiy08iMAYLuR+5UlKFO73YS2cMSALOaFddUwGZbLyC
         mi668EU3kG+1zzJf6reBxfU6WQZuuBx52R1yaTecpucx5TmupDk2dz7pZP9GK8es39l5
         nSX9FReTM2FN9VX2wVQNuZLsEmSAl+o2phpTnGkydvh9oa/DfdvVUKTe2YOaqKBHuNwE
         SN7nFOtHzXVOQXTmiavHqn6sn/ZjEugF0uDBKqlgcmifdQYkVso1OtiaGaFl7/bhfdEK
         R3UN5ZTE2c1yL/WA5rwA3OyB7WViH6OuMyoyxNlbfXlZ42KwUy9/p5eubPUC4AqBfjkm
         WoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328665; x=1787933465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=ARUu3rAfo8bXMclNuga9lATLv8DR0yJv8wVodb6bZkfzQHWSEi4czwiZR5SHVCvu34
         v2hAe8L1evTKjorej+QE4OfVKrSmbuMgymZuHg7QjIRnyPMIcyxx+TE3K7zqB4+367HH
         wYdfWNtxiFnUPznuSWCjRF6LHitqwHEWMWenhTA4wtl9xB4dCWGQAuZJJR1bZMYOxspL
         R/rmgyvIFA9s8vfr+nCQ2xpwb0cdD/jxbFIWhkB+sb3Y23dCmbkHmeSsaG3pbD4uomhM
         0rxCBUphU8F/p6BOaNYvyWvSGPyJbl9hNeCy5AqSw8SnxwtC3Y4iRmImpX4fg4pZw6c7
         zoAg==
X-Forwarded-Encrypted: i=1; AHgh+RrWhbyQgDptNNMQ7un21blPchrPUAEznqZYUMUs/RudOTGwMIXHpXa/Ud11HwiSSEQPirGpNt3I6vpjNohXPG6O@lists.infradead.org
X-Gm-Message-State: AOJu0YwzykPTx73ZQ9x6aBX0YICKbxuEVNNeb4mJDOlypIDafau24sMe
	6eSFAo98CY3H/OV+GA42xy2juJuuxW5zxfaY0LMyl71ilmRnLKnKIslS4iVK+t3ZHZkvyqC5w2H
	IXD86Y0jRXMcnprti0ttyf2alhwxT4Lg7uwGbaVq+1W3nnLXSppoCJ46sK/rQ2TnXXJyJnRxA3o
	w/bg==
X-Gm-Gg: AR+sD107FYM2/MH+4iyUq1UZOxsKRdLU8DOmlmFQhRKQJljM1lNtoN3lkIW7toV7uWo
	F2ZLNST286WenDMpn6vmOCah3khk4ONxcjKYUD/55p+ye14tmQqaSOGtuTQ4j7yOkwYqZ4skN3F
	m656LzFq+lsXjqQYRrE0U8D09DCsUNH9fG8zYg9i0wUB6U36ClvjAoRvKGSiMNYsBEYErzHsTX9
	DOzs70/b1mWhUUocEqpD0FCT3pGrCt6/BPhKEkHykELIINDX0VRX4VL5pQC0LJ8eoF9FbGBMKtu
	9KmGy9112Omtzktyl9l65Gk8F5hb2VOT6d4c6xTPeQvvl2dXoyTJAJjYArNtq46RsJh5qm6X2E/
	3Xcu/8Jy+ezLZuaHLZA+f8xWYOc5PXAqKfNKoQ5GvLEbPkNzV/U4VkaDAp7gtTxAjHbS0KTJHta
	EdIHtusMnQuPeCFk4iqHZRJQ0=
X-Received: by 2002:a05:6808:6f85:b0:497:d1e7:5e90 with SMTP id 5614622812f47-4b2ef484825mr7959330b6e.18.1787328664796;
        Fri, 21 Aug 2026 09:11:04 -0700 (PDT)
X-Received: by 2002:a05:6808:6f85:b0:497:d1e7:5e90 with SMTP id 5614622812f47-4b2ef484825mr7959242b6e.18.1787328664353;
        Fri, 21 Aug 2026 09:11:04 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:11:03 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:39:05 +0530
Subject: [PATCH v3 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-12-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=922;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
 b=2sItnI1/4L/9XIOYN3sjBKJAtfnUof413EvY0YP56XbV9w7Vj89ry+ko23SAtQezQt949xqJR
 aNNjt6EqrBDAYsTIf9MkOarrSc5KZaM0lgvJno63rZtiFUlIGrbWl9n
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: bi6HEaxAsNBSmgYKqq_rxU2lOEXXa120
X-Proofpoint-ORIG-GUID: bi6HEaxAsNBSmgYKqq_rxU2lOEXXa120
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX680LYVbWqa1S
 eDo43ojFDeVPdzLaR8QyqtGchNYSMS7u8uM9U6nLG6pTu89wfGlZJg5vUR83mh/kVxDZ4ohErr0
 1k/XBAn3l8ZV91thv6aQ81c2Wd3PuXE=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a887899 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_KRvd0mH2JNXacczCDAA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXz/GcY9Rh+Wmq
 fh4a74A8PIMJScZIzv6lzLUCyo9JwQDJAFqR3XUprXq4F9u7I7RjfKMmxGowjGhSXPycC8ab6QW
 a8G7jJv8Wv4V7TCxqrJ5+0uhn9t47A3LcTUtR4RdfVaItVnlpo6GQlD0yVlSRa0SecuCqITndcS
 liiDBOdfh54uYK+W6uovhTLmmI7TffNTrOp6GAkFYJN8DYhrNhi6ct7s5ZblBOOZSrQAIijsuWF
 T6u9g53PJB8TgkIAHtDpukZlUoEzRSkF26OhsuqZXRpgJpuL+dFLSU+gvAPPSX6g5nwg0TnkssR
 +fb4hFBNM9pLYEu90llMFYLqFKXI2HzMrhBvuUQWikduBcZgqFujbQoObF/s3KTC1oeVidJGSy+
 Ov3JMtkaCTWZfamiM5i6FSmYVd5YNg12WaBZfi/cnqAb7Ua7zz+KBhWeHtEKbt/S6z+DqK3yh+M
 Rsibk3whPQKeUGfwfcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_091132_255134_746289DE 
X-CRM114-Status: GOOD (  12.17  )
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

Document the Power Domain Controller found on the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..518fbf6b2761 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc

-- 
2.43.0


