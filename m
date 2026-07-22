Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA09FC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 01:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=Bzg9WJyHbKsiMizW6Et3l0Lrn/
	fNgq0nUHr45oQJHo1/kSMwvoeVOLUQP2ur5NFTs4QjhM4WtU0haeV+A8BVYyiCmWzD+GHV2w7btKL
	iE/MqgW9y0KvqEeEuyPdRFuzcXDtSCWQIG85Ozd+/d5r2kGOAZmZ1y5fZo29FO9qlGyBAy29tzzkV
	aMe1lxL+7bV+6nuWXREKf7PEgxZoRznFqzLE26VFUHU0XNOnhTXsiJL4E1g71eIrNzW6l+8SnIM5q
	vBCvNW4JlAIef6rR7v72tiQpDW901s1+PKtl/0rc4jKo2R8Yhdc/rwN65rIm5UP3DjfswvN2q9MEa
	D9VdlUFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLXO-0000000Agxl-0nYQ;
	Wed, 22 Jul 2026 01:14:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLXL-0000000AgwK-0GpB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 01:14:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CE993366343
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 01:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=CYX9671vuZfIt+xX
	au4XcaSKIcre2A0riu8zYCAbTZcxouSraEUlbpDo+UAqzLg4ltp1427pE2tEPVrv
	F1xX22tIlCaiwX64ssxlDF113tmZ4L4iXDI5O5fEKrqwhBBD7ktXSW0IoTy9r/mW
	AkfrZyM2wBVzLLCS2z8/xcuvgEqgzNRoDvAh3jL7lOL0yrHoTtp4O5HL5ZsgmEMo
	gZqpbu+9CkBNHD3nv3oJZSOmcOf1StsBoAisW1zRKjwn2ZdwFNkJZEHJ/+3+h0y0
	Oc8fw++4fKvbYAAJJWRohZWjF6w0F2Mw9OgffGFBJ8sKWq87OYTT/2a996WpAiDF
	1SQg8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pabmvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 01:14:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso16474549a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 18:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784682853; x=1785287653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=hpz050o48i9IZ8PWsez66tlAgGNMAZN1+GMvKAXI/mAtWnUedqhVpgEcmw0fiEpacr
         K+Jw2kB9786JcQos94XC8Y/eGEXOiDoXF+hTo7KEzH+PkSaExcqyICfS+ppHfMcV0ihb
         O5IBHDBhCBYRA/6MuWYxr3AoDj+dBrDa5Aw16pzUlhp0bOSRIGKQv8DYfUvYbdO5EAoX
         2K7HRCPubXi9YcAnQ4YAZ2jn9+waJzN1JqzxYhfes9PEYb1wACy/1Q5Be5DtENTLaWYH
         9U5i0jg1VSIOzy9VnOyiSzCzKMpsTyCmr6ifl7JnWn1R0HRt5nPV5Nvv6/8F887wezlp
         Peig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682853; x=1785287653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=Yf8CHAO21I9+PN7wNs3ilEycPt85F0uOT9HvafWNtPyI5NIazH2ZSGp3j984A7WnzA
         DieaNQ9WYXGsTt45kOyhpwdIJ0BQrsi107M0qoEh8Ar8DSB4k5CqU7tXxZ5/LGZ9U2dy
         JQPHZWik6DljcV4OcUKxx4uHSr4qKnT4aMi2lt9pyRtmcstLR1M0Z4GdifVz2MKe99xg
         ubbTkpVK2p45QjOA5gSr1fsuftMio1w21kV36H7DcX+wDkvz3pX3MTpHK+p9/tzob0YF
         0k0E5JWU+zq7+VJOUqWa1tkpspEznnqOCCzkW6JEob1SsODmnknE7hvthwnFIqA5vlUs
         4YGg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2d7kEe4n0Yqd+2+jAq+RG3fWHvLGl1XxgJGPh1usRZok9T5UWNiUFAL/jgza0i5sWXhUBHCHSXUvAQdGfC0gF@lists.infradead.org
X-Gm-Message-State: AOJu0YzOKq5Lmvw9/Q1P3cixfsM9fUxHPxKBLL8+gz//n1WBU7Wf+0Rv
	9wNh2nM/qMv5O/4vYXZl/dmyYGgFRVfK+fwIapF/uXLGLn1f/9GLdVkbxALnwYshXdJjq+pS7HY
	JQsAUiTxYyBD1TWeDTX3tvrv2iP/PGWHHriAly64kuGkSXK6qcxEzyP8pVBMxzD5X0xFSS4iaor
	g+AQ==
X-Gm-Gg: AR+sD11E6Pc/qeQgQh49lXWUCnToNyhOecD9wW6VvTM2EaJZRtDqdlns0Bi4LmgvBR+
	U2gKn4EfWK7WgwVNrnFWZ41v7oUqWpgNoXHIy5NvQgw8csHI7ooDunuxX7iyCIC7q8KoxRDFb6B
	z7sSXSqWyypb5bvUSxqoygWz46YvzUmDj8skTdBfX7qwB54qaXJvvo+Pm/lT8OdZxt8qZgXiNnJ
	opdFK0ScHZeqXWZyVf3TXBo6Nmi0y5YO0TjKqblqDRxQ2LjFi2jzCOnmFRrOdD9wBWOYn/19IST
	qgkkJ5EfCjNoSO7prSiYk/c2llFyxsHPrxGDl/CYZUR9rs1Obe4VfyXuPOxdb8kV5w0kGCn4+rV
	Izz7d9YkjnequJ+vE0rBcw5sJ/WLpUyQXgr1u0USAhbIMxWWmqxfdElhhElg6b6Q=
X-Received: by 2002:a17:90b:2e90:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38e4b418439mr20460530a91.6.1784682852850;
        Tue, 21 Jul 2026 18:14:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2e90:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38e4b418439mr20460479a91.6.1784682852018;
        Tue, 21 Jul 2026 18:14:12 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea7b4da35sm160380a91.17.2026.07.21.18.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 18:14:11 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:13:47 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: coresight-ctcu: document CTCU
 device for shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-add-coresight-nodes-for-shikra-v3-1-1400a3454e9f@oss.qualcomm.com>
References: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
In-Reply-To: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784682838; l=948;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
 b=jBakBYCNzDdjVoMi5eDvzHX1E+IdgD6H1Fcbk/cuN0Kd6M8m0FR7gpM5zzunUVXs5JyxpLzSO
 5hSv83maoH6AYpsiiaJH+r7Tuieo4//oOCgQQRdIycA0s3DMr6HbMRb
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: OHMOKdxQwj_diHYYWX5Sd7wfkF9eO_3Y
X-Proofpoint-ORIG-GUID: OHMOKdxQwj_diHYYWX5Sd7wfkF9eO_3Y
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a601965 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bwSPl2VgRa2lNh99CM4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwOCBTYWx0ZWRfX3DWCqMoQthML
 Q3lbfptwnhKBk4JLkEiX+Gr7/1iy5jObVUNwf1Ocm2q1Y3ZUn9sWejhjpT5n9CC3EcccuOBKPck
 OshJ1olBowhvultVUaifofu1YPdiVpF/Md+KQjgiq/yb5c+yOjkjaoyPcHNISLyXblWfjQbjNSG
 ph4uGmwiXUn2O4KxrRnHCL2l0gyfROIzi9md6Cr2Hl+HqRRUTbnTPuVIKcxp8xR5Tqao8a/TiwT
 CTSiFE3mfb6EXNclXckeEd+n6hzhF2EeUFYMJs7C9fzjT8ZceGgaG3M7Qm14OY1hMqbEtkPQsSo
 3Bh9IPo5QXMfztk6ood6i8QeuBMwa/2PUC0a7PYMIUfWdyj0dLIU+8e/dUw0JW7GbwfNnonhdNG
 xcsxM7uZDyiByZXIA1wrZnB1+Tm9Gf4ONCPsbZPH0Cs4YMYxtla5hDfTXYAHetCKpdUd1GoDBfB
 BF14PDpfjs0lKPxwChw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwOCBTYWx0ZWRfX8ErWHQzkkXsi
 CFUAQCjT8/Wl3MlrAbi0tLSQnplD8s2xnTzvQ/FZHHEnh6v507NNUFTfQ1nYCNhtWIhafyNqjDD
 Y/03RF5JmdIilCs4Q7dbKDmbEcXztcw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_181415_219464_1DCE4D38 
X-CRM114-Status: GOOD (  13.46  )
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

The CTCU device for shikra shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for shikra to utilize the compatible
of the SA8775p.

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


