Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5A6C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WolrlPqd9kvmQiEssFeO4Ma7OHOVLQ26gMY9vH5kuMA=; b=pidWv4CrNE69Pd/FtxavHy08f3
	oVu7S3dl5ffjM+YYePN3F662Us9XaGuL4h/osF879thHylIOPB1Osov+9lZPkTF2NnRvOVe+9SrXS
	5ouj7+DVmAMbEB/A8uzb/2g4rZ2jkfQ6bjtKN8FIY6BfN7myImOSkghLNkJQ96QYFfJJh5BPwSYcY
	5YOQ4hNmpO5ZTbIO4Ljt9oIZneShqPaZnqdc7AxHTNEDR3kkPLzoWPjIRMezbEqwKrBpecz7ulWt7
	6FkryDVnh6Ya5SKHQgEJqrDI2d8+YCBYw0h5tpUnq56QO/NiOrtTJ85fONfSzowG7rIl8FmPvUsrg
	ETeqMr3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCxV-0000000G3Ha-0YdZ;
	Fri, 24 Jul 2026 10:16:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCxT-0000000G3Gu-0Jfj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:16:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADZQU2875747
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 10:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WolrlPqd9kvmQiEssFeO4Ma7OHOVLQ26gMY9vH5kuMA=; b=bn2ANeXhwQ3Gk1Cm
	+UEVMCHKjNgzfkgzMxOijFnIgV0uAWKyc+6AYEkhde0q0eycLoApgFTxa13vcKl8
	vXTOmfu//oW9aJMEcyGIBLLjECW+CLOziTNeMgSzZwhQ3ZS7oMmorfaQMaw0qQeM
	atlPVcurO+qgGjc8B3r/22NuGvTNLEfBx8jaTE6qi1P8tXUDXPIksd7tBgyq9QFo
	dQDrACKD/ov1/YyDP9646uqZAwbF+rq0rA4n/70CZxRz2NQSE8FBpSeyGO1SHrMV
	RRaYYaRgu0Nw4Cs+JLeXVJvkjRMFiKxoaL5XkWjo+lEg/oGZGspPyneBoTi+FJzO
	BDYppQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byr6r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 10:16:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso366083a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 03:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888205; x=1785493005; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WolrlPqd9kvmQiEssFeO4Ma7OHOVLQ26gMY9vH5kuMA=;
        b=b/sOGlnqgR3HIZ1kAZrk7XO4o76xS7bB6FfqDIWiCqrJGkGiCDZtrzJrtSHuZXHxIy
         tsn92NJQ4VZcKjOfdJ+Rqtb1XdjvEAZO4XjD+wHwL+ovtUbQ6ipzSuoiDFgL+hFtHht7
         Gf+mRDOCNF7++J7gJ+17KKzdS9oae8I54viF6KlRrNx2ejcEc5lXL4IO3bMCUVN/Fpih
         ez4KbOt5UAoODwogM7j/adk13U6+QXG0Ts57kXGFREUtqhGKa82zi6Xge7pWS/1V8t7l
         CEQhDtWJ0e2rvdJA2pgmK3qbAynYpOF3S3FswQqnhEdt1XPnJzlvBsy4ZUmJxwCWhLck
         +HEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888205; x=1785493005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WolrlPqd9kvmQiEssFeO4Ma7OHOVLQ26gMY9vH5kuMA=;
        b=pTxaA7mLYf4vu5FMXfcbT8x66Ma2A5h/S+TuXSxF3cCz1gU7pPWRmW2HDfUOVuL3KJ
         nJd/seLIFLV2QW5X32rT3TXnbXjK7vyOCwGFoMAz6Vp9XkWLgJUy24n4yIh8JON5FcXE
         oR8JSUGlG++TLu4/zYNPfqrBomRdSckMo+MBWUp9r/CtfeGBf3xtSbCIuWz2wjIISxE7
         7hLGdYNMNzOapJXO+DcVpaFfK0qlEbtV7GCwDghbjJCyiDxBhg3/k7Z7IVz3BApwjVLM
         2mDbOGDpu2ECo8huWVG43OcWR1+n+KqCVHtP+QHRjo5auuvc8vuQnuSisZdkKIan5Or3
         Mqqw==
X-Forwarded-Encrypted: i=1; AHgh+RrEHniWAm7HjJq9pTgetwgZ1EKoUpFnejIBBVBDGJwmqck7oNtp8j3O0QiyEtnumNm2yNj/9FSb7QYfcyAn9QEb@lists.infradead.org
X-Gm-Message-State: AOJu0YzYgpsUXnOTHdzVeuMaH+s726auwy8XoY41MFgJvJYXrwj6yfD6
	/zNV3j5yfjYWzhOsibWV9RNfy03GlVGiu1z8Ef71Q9fhi7JJvzhrSsDqzcOeb9FJuBM74H2vNbG
	AVTTAy/i+fY+1WIoTnS49fvv3YRtARmhNE5JZQtNCnWmPQtC3lIquLWpOagHuA0Zy5LxdYs+LR+
	ZnebEAKDefz1//
X-Gm-Gg: AR+sD13wnYPiSwR/Uo6nseTOWousi9U6VVpueBYuZs57lvFxZTZhvGH54L1STnajJLz
	E4Xs6DzAR8/V6RKlXlQjKvhyVyJeiZqytVVxttJNi+yGORt5LEo8qA/9w4OVZohQJWzltsDYER8
	bSeQx0Q/E6TIMz7rZmeAqXK1YrvmvV3rgJpTjPNtqDXkMWk0bK2RDeLSQVydzJauIe709F5wAYZ
	vSPsud2dPY7xkkiyRoxGgnnYuHecdLjyN6FSBhpjoA8rjYTy6OsBxcYrVDbx+hYBe7LdFSTnUXF
	HHXbN+1yk0LXwfwRGYJQ4sRIX7r0/iAQasxRuDxw08UhGiSdvG1oylrdHM07bIpWcTpSnxRoIjH
	Jz5rQ/ElXIpB/DjFOVCIogP8DtWsGS/YT3cU2CKCBTq/2MYi/rGadmbS8CxEe5DU=
X-Received: by 2002:a17:90b:50:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-38ec64958fcmr7225502a91.7.1784888204998;
        Fri, 24 Jul 2026 03:16:44 -0700 (PDT)
X-Received: by 2002:a17:90b:50:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-38ec64958fcmr7225457a91.7.1784888204563;
        Fri, 24 Jul 2026 03:16:44 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041b8be9sm1222644a91.14.2026.07.24.03.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:16:44 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 18:16:11 +0800
Subject: [PATCH v6 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-add-coresight-nodes-for-shikra-v6-1-8b0d7300be41@oss.qualcomm.com>
References: <20260724-add-coresight-nodes-for-shikra-v6-0-8b0d7300be41@oss.qualcomm.com>
In-Reply-To: <20260724-add-coresight-nodes-for-shikra-v6-0-8b0d7300be41@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784888190; l=1029;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=sxOC8xu4+m1gOg7xJPQ7uKnbuitLxFxJAsNfgIHFSKs=;
 b=BYz9ywskpOAB/O9fwTJzkLchmrShVsip0YeJ6w5YWNgAwJkz+4UoY9wyiQMutKruxYFKxp8er
 kyCYMg/Y5uFCKyrpe1WVLEuM/ZrnsNR8da+yvCDg2dZXcD/H5P8Mh5D
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: w5V7qQSif3qMVR6lP4kTwFqyNTU4-T0R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX8PLrVa3/tKRp
 UhrxHCQIfXc34idVx5C0yug+0IDkpf77vfaA5A1iGOLU4TWbxPlKIyJIIs4wfnAfUBrZdLjm4X0
 HwGBENdKrNEWXlsnBtZI0+/OkHxB4jM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX3x7xklDCnSAR
 3E4Dq+UZTEL9TifcnEapKfGe6nXvNMWQbPonAqkZ/MqlbVUl5mEbNyVUzVGif3sVU74xUpN0Cpt
 E8RHGT64WxbtjKH4wuSZRzQ1W/Me6u+cedRe3gm/G1hfgIsqVtZABFKGdaQWWiganzwWqTo5Adg
 Kr6xoiV4Vu5gJzr0xkP+5Vy/9Joj/R1ubxNJG+8K7AIcjXtb/hA9/mvmXLdoo3hWF+36LAlhdla
 nNidrxAspqtLV4lyTGHs9KgDtCtwkdKS7S3/W0CJDL/5JKJYXNROgEhvvvjGsIz4R+XQBIt3OMX
 ha+jYKo4qVZkeGGRImOpOznIOLQ540FXho13S5FfGtYYpzQ7ILw4ckPr/6bdbRNx+MVpLTxmNog
 JD+llpVYq7zLUz7eUxxS4WfEKKZ/CEkg/iHDTCh1BATQtFggQ4UwHlwz+9NBlM/xLknkt341pje
 oMxn+KmSYI+P3UAVEow==
X-Proofpoint-GUID: w5V7qQSif3qMVR6lP4kTwFqyNTU4-T0R
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a633b8e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ILLKxz7CyoOsuA973zsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_031647_245842_6F756A25 
X-CRM114-Status: GOOD (  12.40  )
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

The CTCU device for the Shikra shares the same configurations as
SA8775p. Add a fallback to enable the CTCU for the Shikra to utilize
the compatible of the SA8775p.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index f3f3feac4ce2..335a8e1a5a9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
               - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu

-- 
2.34.1


