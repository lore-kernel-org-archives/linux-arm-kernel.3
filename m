Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A1AE83061
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 08:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIUBUbFCuK7ED8zHiEvhHyphzTrSd1weKbtN3aWFc5s=; b=1axcxyTDnTJMXv9Pxf8M4rBXt2
	6o3sNedeGkxsp8u8F6U10Y+zMw0AFh6XzoVos5TmEooR7W8YmMsP7SH5bkxB0uBb1MNubp64ClKwK
	0UMddO/opiff3MBn1g7BlKE7cJwmQDW98KVfNGsfgOGqoF8zPvh5lC6EDT0paoC6WDh6UEZtfCIqJ
	cqdoNaeXgcOihGwQJfFJGR9HhM45D/Hbea57xx0XbZKokieJkqR+2LtWR3fbYf6DPwfz+EJTsMgot
	IqGMbUfTCDRQ54CFcjW32CKjrSqzLfXmjxD5cvgKpCoM3CPvxEtkiAmP6VXBjoAJLQrhptxqY5y3r
	Nz85LOkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBSu-00000006Hco-3s1g;
	Tue, 03 Feb 2026 08:08:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBSs-00000006Hbx-3m8k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 08:08:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6137PJ2A1320143
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 08:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qIUBUbFCuK7ED8zHiEvhHyphzTrSd1weKbtN3aWFc5s=; b=eBjz/uUJ/PR8UGX6
	mr3YuUOQBwBCO0wV4M1jfxBJfA5qUEAtxjpTm/ouj7kZCDshswhNQSxll9AMyLx9
	WbNiGW7TxBskDd69u94apdsm0GaM2sDRn2KgCYdfAI194BFVRNE2kRJoS7lwN2t4
	2FPbMInr/k+jS4LpeNAtpPSz4qim40N2xGQjpkNxQTi1pXJ+XzMzjULbaEPwimGt
	XiKav6SZpICEEZFkejOSM8j7qk5ZQLzig5WN9kV96bhc6fCLvArsUEaOQBO2A8v+
	tWuEk/Xd4ceHsQTpYM6W0EHADX91JD0sRAZDgUtx5+GtqN1GUW6h2vGHufRqlqKj
	Edl5XQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3cm7049t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 08:08:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7d7b87977so51063275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 00:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770106129; x=1770710929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIUBUbFCuK7ED8zHiEvhHyphzTrSd1weKbtN3aWFc5s=;
        b=JsWnTBwHrffLTiIE1DZnROjgcgq4pXsyQLglQi1Cw5ecUHxO1JDuSMURAkL57kD3IB
         MxVug9wAWDoFOMlJ3Izt94dMiusDASJjjRcJ9I0kfM/ChSMgxKBahChQlqqKoM4uA8f+
         3EDsT6i3LlRPMVfsLM6uZPLQ/PvSu/BPS3ZuNJ9qC/Ga1746dw+vL1z0KCKdTGnmi3XM
         fzJU0Zh46tMgGW2JEGNZG+HDO17J7uLsmMnaI6VAZ9eJQnNCDp+s2alD9TxpVmvWcuPW
         vQZ1CyDVxhiUC9BxW037gbSrU8VGFFUxkjsFJjWt7w+Hg7NZR1yCtpgGiV/u+kv8psCa
         21eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770106129; x=1770710929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qIUBUbFCuK7ED8zHiEvhHyphzTrSd1weKbtN3aWFc5s=;
        b=oY2O3uK/WeZQAI0yl72iCiSEr3wRHwSEs529kfTE9wEG7/rlrFi02iGpv/MH7RmkJF
         dlHDCUPSPZZ4g9PvMLVOYlQWaA4CpLtdJ4g3TbV3t/P3JlzF/O32zTBmasEjq7dP6aeI
         vShxKTgW08+7a5tOIZSSsu4q8DB++Fbj3Q8SJcI8K13dvSWsdzwXJXECodAdBNdYRG/4
         wKRjE7M9RdgFoRGVaohcZOFAJed7CcQcbxP62GPZ84G0vxpMjyyBiQD/PXDR4wGC2R5D
         fZWY+BpJ4av9MfOVpDgi8TPtyHydRxYXwFsw5EDDt8Bcg5Scr4uyAOTQHAYKqX+Nq2Ua
         Vs+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTJ7MS5Gzdw7lMuGGCWawFghgXfpLYVjtrkDbnYzJMpYNtlFSHMKK/CLtI21AxPwPuc9lfc9MHo67B009+BMn/@lists.infradead.org
X-Gm-Message-State: AOJu0YzBJIwkEJfXTNKvUp1jre5MieGiVutAU4cx2VJgiBI/b4/ktua7
	9sC41E5i88cBku1E+zR/5ppl5r+5+KzOjWr3KejrXHOtjwuK3VF1lJNj0GfWuo5zhjnVgHVzEbE
	PCm/9Wh4vwhHY2ZqElaa3bH8HD9UuZhsmSr2YwYsOkZRKjfiSAVKqoBz6nVCnYKl1lncP9Ws4ir
	rq8w==
X-Gm-Gg: AZuq6aKggbr5mld/HpUhOp89NaJfPUvwjv9hK85CTh5o3SzAm+ljW6pBKafzhtS1Mhj
	HBmpJwYIxsd3LQ6DRrE95SQD0WaemHFh9JPmXAVaUuOKEVIUP3S3IQb6eFyWiXjYNdkSAgLoh7N
	fbYb25iqpfUsyNMQCSfd2AyK8z+TlJE3y47Cl2QIE91IsaZHQqhoW2/zAdSEdby1CykyoRxNVC6
	JMdIqr+9ASs0MbxPBdgKZmamEhuGSgmaNrHtDJASyyN95PFaxZPz0hHeJtS2IqpWr42GcLH+R/G
	lB/0HfFjmEhNahVYmnZpa0IeOOpaKahk7lbeM8+bQL04GKny9qIXjKsdMeTFyBsdl08C2ejoDjq
	cmTvxEE3Vmof4qhDYTg3iUAUQxXs6CrMBa2UNI2Rzf6On8ebvWkRnLmyvAHDXi1t+Ea3HLkvV
X-Received: by 2002:a17:902:c412:b0:295:9627:8cbd with SMTP id d9443c01a7336-2a8d8150724mr147540175ad.33.1770106128631;
        Tue, 03 Feb 2026 00:08:48 -0800 (PST)
X-Received: by 2002:a17:902:c412:b0:295:9627:8cbd with SMTP id d9443c01a7336-2a8d8150724mr147539885ad.33.1770106128161;
        Tue, 03 Feb 2026 00:08:48 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8e512bc2asm103144485ad.100.2026.02.03.00.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 00:08:47 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 16:08:24 +0800
Subject: [PATCH 1/3] dt-binding: document QCOM platforms for CTCU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770106119; l=915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Hg7CPlLaEuR8LoFGJ6BJbJDkzmP003gt/fj56vM6lhM=;
 b=WRZ2bvUyTTm2rpmGeFEKx1/5Y4HF4BvYZpYDjG0rMqZ2Idc8R5G8oL9cV9xMGP2gygP0mejBL
 baTmZ5LN1iVB6wj8l6pRqYdqE9+yXdEcKFPAyFxZkFVHX8IPrLlNukv
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA2NCBTYWx0ZWRfX0v7d4Jo36eP6
 2FQ7kUPRQbBJAqYGqg5n1G6Om3TyERY1jD4zqi2CA6fswAwSJrPCxOBOzRHi/u4U208bgosgY6m
 PCSr0hI6o0h7SsZtfZokVWelagtnXLhmQly3HnMlZzgxSOtfpVgTQWnjiYi1a1hSUdd6GBAa+Ts
 yw9ceUtBDCVe0eL7knwh9eP2tmOrpa5ICydDVDsErVoijKFkEf08BG07714fdhn2S2w/PTEjOmN
 w2NEYIumTmP3dJsMOHHJZx2tcOXmObhCXn82+EPOtXcwQE/UwnGA+ys4pSzBE0yj+iIS/7lJbI3
 5xXaXEkEk3kc4XnJNUTiXMYTmYnrl+Fe81519uyrZ6Z51OGIbFo6gNRpw4Z6tdxt2NoWiZvmFzj
 Ct8af2k1duxOhJBXRoXa608wjoSe/PyNML/Eu3amic3kRINHYvWisb7dUA41AwA6Ih/dx/MczVj
 SmMmSqa16pSOFvZl+cA==
X-Proofpoint-ORIG-GUID: XsQidMaW7FoLNAPvW_b0BvonoMu5P-5H
X-Authority-Analysis: v=2.4 cv=L4sQguT8 c=1 sm=1 tr=0 ts=6981ad11 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K-gU5Sf5JpjFIvSPVLUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: XsQidMaW7FoLNAPvW_b0BvonoMu5P-5H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_000851_069775_4700D0F9 
X-CRM114-Status: GOOD (  12.14  )
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

Document the platforms that fallback to using the qcom,sa8775p-ctcu
compatible for probing.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..68853db52bef 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -29,6 +29,10 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,glymur-ctcu
+              - qcom,hamoa-ctcu
+              - qcom,kaanapali-ctcu
+              - qcom,pakala-ctcu
               - qcom,qcs8300-ctcu
           - const: qcom,sa8775p-ctcu
       - enum:

-- 
2.34.1


