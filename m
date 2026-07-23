Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E33C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 08:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=; b=mbBxWEggyuO/p9awM+RPQir4Go
	Mcn3QIRa9RtZGDGoItpnyJdYThxbGDMhxzyRomWsSn23f0eGViw8IXTNMlHN7ppuIaYKSK8Z6Xpsz
	SY3UfCsES30S9+B38WOSOoSHO9/FldiuNsApyu8Fn5Z/DbzyKQriQtv2EpmFl1yANsyinp0ZkgnYn
	E5HaBK09yxFUhnB2otfsq0VftEfyWnDPfrzxI7j2vo1/1eVLcGxSR5LAFGjtZcUOCiKalApOPpVwg
	YWuSBabf9iabIoT26jZ+bzKGcoA0mznZ1hXgUXEBy5ygH1B8VETfVTq1FO3JUxUZ/+CPANWu2+FJs
	Uj6Fbqxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmole-0000000Dj73-3ERh;
	Thu, 23 Jul 2026 08:26:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmolb-0000000Dj5s-1AUw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 08:26:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7jbEW2892904
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 08:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=; b=cL+D/3ol1lLjMbk/
	FzxumZv9LtPAVFkslL2zXUFdJ0qCzQ/bR3oGOlVZPj2RoyOjjFa6G+O3FniPitps
	vQ6oYK04/4/cKeSQ+aHvzjnKPH2w3vgvfvCpo5qdhq9oh43amvvLcJtVeSgu9NFr
	hfB7gF2xocgwYW1xZ543/bUjE6HmjSnxaEWtpp1MGRrsC3cn+NqjXRpIhQIxoE2t
	SDZwwQVRDAMdCMK2G9frE9YveUUm/z4uKuGMoqWDow3XNschIIcMwzWeAfQFKGaO
	aQFcvfXD0h8E9dMN2bxa9mPVnD5rdj+4qai5a5c41f3z4KZ9/g77nXNHicW29X5+
	WULW/g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq84t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 08:26:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so9531385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 01:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784795214; x=1785400014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=;
        b=W4JJqRsHu586t7VfEaLc9GHm2yEmFDMtdWw6a1ETBFlbLK/VB1mtdGC03nql2QHqtQ
         aSANB6hx3pza5JKArmUel9oZ4cBhcth9DkoyrHkbf5h0Vd/uMyuJBYvdsO0FbkUFnQaM
         i6o9PRQ6BILal33F8Ke+5tkZi3izoJtpNKhyX+eXw7TmMnf58IBrmM1neOByyowJ/oyu
         yykv7fMGHFKAGLEqgKvRkUJqeYyHcFXyq5OxJdB7HSCC4/uo3LfVXeqe0XbjzceMOChT
         TvFHDwJUabQnm3oF/UyekBmpTMygFRiYowxFJNwTZqugr/CNk8WyjhrVK0pG9wbzU3t7
         gJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784795214; x=1785400014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=;
        b=FYZrPgcB+4e7ZzSvS05C+BWgPJtK9wtFDOWtu2pRymJ1WTTl9t58AC6b7s3uYhKIRl
         aK5lGUJS32Tb/+jiMQS5A1NQfcWhUXVbFE75Lp//7CPWLjU/UGSoNdkf/1CVr5AqczuP
         4eYbhqsUrCOrbOQ5OWfAG9YDcc3Kxxx4kOVuWulXhEmahmfIqsHNeWr+8jwlCmzFl6lV
         ReJAT2/M79bYEHAsarQ5dBqwEFuOApFCCpGLY4x8WxLOvoVaTH0HeF8qHDdWJC3iWtwX
         7w4VK4AJ6UrlcFVFWjfRrzPnqYUUCyHqDyOoWcZgSCFoXVyapRZR1sXFfdPs92Q7BcdI
         beqA==
X-Forwarded-Encrypted: i=1; AHgh+Rrk8ZCPDR9V/AZLUTT40j2UVfBwT09lGkGOGGV/4IFopPA2QGOQR9HNOSAIKkIoK9WiPRF62WAU+yZBpJBB8y3J@lists.infradead.org
X-Gm-Message-State: AOJu0YxLoYnCt5i40dIt/C2p0Z9yoq1iOtJvh6ibK1aqILmkNK0CTMz7
	8reNvWwiVrLV0bYyGDdsv5fFuc1riYy3x53iNXm9KFGJY92TDKwmuCZDRMC3VF/WKV6E4yXgM59
	e+75cLrmSCvThFtMVjVG7VpHhJRZULhvl8tKwBxI0QEDglhQKBt/y9bH3NFzO5MqkzZqgqL8vnF
	RxqA==
X-Gm-Gg: AR+sD11lQCZgR2AGCc9OuNwWfTu0YuvxyllibpSUQH89eYFz2NjqcO8zMrABxsdp5/6
	UEMq0/cbkum5ce/4mawZMoTBFj03DqVo/ffHn9ZPq1k2pbYycpnAP87loXjJnKPKyJhlOBpt7bk
	TKcZ9RDdQSsByvMymvWhzgOGbjqMS0AbZ+w/PqeBOMcu4K0/UvjUEHAhxDRF/wdEZL7NegzxVEm
	I2y+qozA04cxiKaK/FFtb/ZPacwO5DrZqcv/EEyrcvtia2FyQ6vZgf5uDCe1MwoSdeYGG46bKdk
	XrD66DdPEUQP+HbaPfNMYy0d4dxPKuCcj17Ql7P5yWQKvkaE/et0sFYdZJJOSekW478XA2oUD0w
	55+F68GJ8XGKEUask58upJj3UJ9Co49kc3Nm6EV5zKNwMYZ594AqZIR9KLMdfMWI=
X-Received: by 2002:a17:90a:fc4c:b0:381:cef1:11bb with SMTP id 98e67ed59e1d1-38ec6a48974mr1872389a91.22.1784795213986;
        Thu, 23 Jul 2026 01:26:53 -0700 (PDT)
X-Received: by 2002:a17:90a:fc4c:b0:381:cef1:11bb with SMTP id 98e67ed59e1d1-38ec6a48974mr1872357a91.22.1784795213488;
        Thu, 23 Jul 2026 01:26:53 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea598f67bsm1427988a91.3.2026.07.23.01.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 01:26:53 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:26:30 +0800
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-add-coresight-nodes-for-shikra-v5-1-fd5494471b36@oss.qualcomm.com>
References: <20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com>
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784795201; l=956;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=KjZAmYYdX486FIyES0cXfj7PWztonIPwwITTJrvXDuU=;
 b=TxKjQwwDs9O+H09f7qetw/BCCIiqpxd6Zi5xm1od/kvdiFHVGC1fwFaeEaQIyPKjcOBLZh2gj
 SVWRqEX8gUADZkvODfn7si8xRXRv8/poBhJLrokRP4sd3mtdFwfS1x0
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4NCBTYWx0ZWRfX5AyqCaxhnIeZ
 Q9fuTr6s/9LHdG3hywv62C369VHonHrN9rEcqOjHeXggJrqoi0pe6ghs95eOagIq8yqIN7x+rI/
 tTy7ehbeBNptLTjzJ3AduzOPGXDbhSA=
X-Proofpoint-ORIG-GUID: OuW52PwsxLY_r5panRauSFuUnbG3Xhls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4NCBTYWx0ZWRfX7eILa/2RYHtf
 BvMl2HANbPIXd/YRNpXWBsrN88ICV+bAeAlqFkYho6X3s7dt31vHFkHyvkBZmtKQ+yPzReagx5z
 8ITCqwgcUg5mUPfgJpKqizTlT7/D3zUH4CrmuxPp0SHkWI3Yv6T1ILTJgkewCz99hE2O4fJtVgu
 ouavH5fdXZkIZp9/7S93J1FPwM+4GarhKDBfY+oQ5YHhG7+bcZbMmZJQ43M04pgtcNII9gjkdvp
 oXOaAeIqRpGIGqnEDKRww3sJLzbOJz3loF9R0iAgu8St7xke2FJ50/Ieuv4o103XJ86CNg+HQJm
 QKA6Ib49gjZVE4vrABtd/jzYf/CS+UDVWfKIr35KKpfYx6fgfs9cMtZaYrzMMho6PH6gwTeVUOo
 R7z+mOd/+FUkTas/lH21Evm5+ncLPh6ayQb6Uk83otTQ3wAjI127pZs5bCciSgdXtugMAFENSzu
 MdG9/NBXWNvaLGpfFtA==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a61d04e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BZKsYnZZkaJ4N7IUUl4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: OuW52PwsxLY_r5panRauSFuUnbG3Xhls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_012655_320915_A1EB14B2 
X-CRM114-Status: GOOD (  12.63  )
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


