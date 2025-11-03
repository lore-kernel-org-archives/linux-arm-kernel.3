Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CE0CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 07:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cTG5g8K6wUVwsjXMYPNMz2lhhLN1ACp3pW1oZUwEcxg=; b=MCEbvfcDuAvkoL
	vDZn2evUbPif8x+zO1JLD7A6oW4kzNn8gNC4MC8ywMIx5+3pw3EBlU+zrqllH4XiUtB6Hzr2rtwgZ
	En21UhxiOLaD2Mius9m2rx+7OgfJayqP7jEua9ZdJHPXu1Vr7NfeVWmzucus1TbVoi+kot/yed6qR
	ZFZB11rPG5G3B7pG/paxL+aBV7h1VltvwUFELYlbVLnAFBjoRGNnGMWTxeMI1glCSduj6grINcgO+
	9deGnWVytbCiTZZ6+S2AqQCBVTTyw9r3bOcSgu0JfoH1nkgA7FbfN95vhE7OhLZrXAXWbU/sAEYdq
	Uzb1oCOwXWI7+OXg9qAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFoeM-00000009KRs-31db;
	Mon, 03 Nov 2025 07:06:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFoeK-00000009KRS-0D2I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 07:06:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2GgWN5692622
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Nov 2025 07:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cTG5g8K6wUVwsjXMYPNMz2
	lhhLN1ACp3pW1oZUwEcxg=; b=Uv2Ls9nyhxWU6z/GlrUhNkT3KsYGtZVebJ3ClM
	Y3WOy/wlr5iJNk1FAOdafh9uaDRGcz1I6ZkxCcw7Ft8IELxymY5lkIICdFzlSZn9
	bdgFNBrLj8rHIENQwDaTuwUMEAwa3l3sOQ6CjFSBjwOdMw8tro6K/Op7ZDla1fIl
	SJEOXBSrCvfScJ1eDVFAuF4v76mhjiyHjKa5AOxnFvb/gnB0kDSDoEfzWqFckVK/
	gWAzVs+1bu9rk8PcvMxiJJ93nAT33rqsfK9iIb8a3fFFxHkTQJUmHKecBok2Xt7P
	3RnRk7OuyUL7VAHVvK1r/oJ8lzPBgdFwCy+dVOjeHGyjSajw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5a9vkkyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 07:06:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b9b9e8b0812so1616447a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 23:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762153601; x=1762758401; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cTG5g8K6wUVwsjXMYPNMz2lhhLN1ACp3pW1oZUwEcxg=;
        b=kXktd6oAfkjeU4+1Y1z61vicwYKaZatRyyQdU5aBfhlVFe/D0gU37t+KD0MXpU1UTc
         ofodjYqFhvvU0gsYRt0AbxRheX1pJCaliga+z25QC5N+8gbi54N+ePtcr0fXZ8aF41EI
         SLc4343QPbMiX0hWB5tN1PDD35QD5OI1kLJD6cZ/VJJfmQLaG5DAHPd0IS4vHiIv2l/G
         0kgNu5gDTqRpCgSKMnhUXreBj+tG5YYlcoM4zD018gs/jbxGaoSZJlX5QQIGEVzjsK60
         UMTiPCpOcQnZZ+k7XWwY+AKAFFLjyrifX1rKOFIvuTzewJzQoJ4pVq6Xm/gtRDFYvZFz
         pHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762153601; x=1762758401;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTG5g8K6wUVwsjXMYPNMz2lhhLN1ACp3pW1oZUwEcxg=;
        b=rpkI2MdcrYkdZuj8f6I0J02uYL+ZLLIrYg7YOF99RfB93ZgthdtY5EZKU3tK6L6FSO
         wIAwkSQ4bfCOMipwp/bD8J7W3e2+qBrunPUGQ7osZnQIlsXd56oYCVrQdwQk/M9rW9Ax
         CrKnn893SKwCSq5RKuNYGSlkOECX6dJwopbagn8nckYCbFWAtDG6CJjn8eszLN8OGlsQ
         93f7lKbuvEiZ7kaG/iNI010ocMI2j5umRSIXgDtnRVRza8vLGGqynzdp+D75K1JeSt+1
         CLcUxfvjjncumzn2i+AMkS6vtFixo/cm0pZHjl5xVo+No0sIelUY+Fr5vB7WKxc0vNIk
         dlww==
X-Forwarded-Encrypted: i=1; AJvYcCXxqwwWP1cXP1SdscK1oGp30U+yMZmGL8ywZuaUTZZn0+K+wM6wtx+4e/p8Gue8YMXyeO5WbbfSfLdgp+ju2QID@lists.infradead.org
X-Gm-Message-State: AOJu0YzRIa/Z1i7zO92VlHTb/qPig9eqNKtenljV1KIn21gyFxJump6A
	taM4Ci8lLYoAbkAGUlp35bJvzqZkr5wuHj594v19TBTa5mMQB8rRYLHcQhS0B6c/hkGgRrbQjpL
	Qy9ukge/IkH5gLBuo0dYL8q8DVVOsBbYE+C12GXS82VUNaZnwj/GhgroOybiOnwkFp3c/HnaZG9
	VEeA==
X-Gm-Gg: ASbGncvfY+DaOoAiY/nPD+UVotuxJ5yEjomoqvhJMXFqT4R0OmDZCAyQy2vlUnwo6J6
	R7ql/S2Lbx4qTwXFtC/icyBwH9ivnLvKhHHK3ORqgrlMtnTfIcFaY/zwt+kE2tjM7RM7ZKnSj/f
	5VHNPwWkyUSCDkWpwEUcBjvW0vCfaY5VEiWvfXYfbXGgjp41omwwwYNKUGc3KktNK9aCQYI+Otq
	B3v6wmv19UhWkfThiFAnTuhD6CLz2bYop4tnam1PRnHyuv9JuUEAvkRf4D/q+yW3rSi5GQwwGsR
	MXSnEauWXrd5VyzN9tOXqFcXDrthHPINr0t0Pd8f1NvGCrlTlYJhgINyRMsxk/mQyscjVTjJaHV
	5aFeRNz/1XNFWYX9A+Pgge5PY5z11qpA1pm7gMXK5CkVZ2ip4w6D2P8V2iqyewQ==
X-Received: by 2002:a05:6a20:3ca1:b0:342:2eac:e3b1 with SMTP id adf61e73a8af0-348cc2c20d0mr16084816637.37.1762153600878;
        Sun, 02 Nov 2025 23:06:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjEm8lqtkG2q4G0Ni2a7Y7LUOSuotO8EL6yRaGZqo/W0bt0M+1oMEGawu+3pmRdxZaEDDH2w==
X-Received: by 2002:a05:6a20:3ca1:b0:342:2eac:e3b1 with SMTP id adf61e73a8af0-348cc2c20d0mr16084778637.37.1762153600367;
        Sun, 02 Nov 2025 23:06:40 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407ef49da8sm5808704a91.1.2025.11.02.23.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 23:06:40 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Enable CTCU device for QCS8300
Date: Mon, 03 Nov 2025 15:06:20 +0800
Message-Id: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG1UCGkC/x3MQQqAIBBA0avErBsYrTZdJVqYjjVQGloRRHdPW
 r7F/w9kTsIZ+uqBxJdkiaGgrSuwiwkzo7hi0KQ7pahBDmZaGe1hT/Qx4RaDsRHJTbrTznlSBCX
 eE3u5//Ewvu8HPq3lCmgAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762153594; l=1406;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=LaR5CqlC3lOYGvIvKw838CTalqvZf9jUjp1gvGGX5pc=;
 b=MAJFx8KVKRCpcya3Yw6ZKtPYj4JG9Eq8pAB+dHmgWanznfrZpoVNhR7AFJ41MHFtDHngIr0+B
 DHYzqJD7OjAArIOBGlx6OnLc1VKhs0OQHEMtP/SJqddI+UB+JFj0Nio
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA2NSBTYWx0ZWRfX+kXr8AVvnrOK
 Hum3au12hcbwCHKVgt+aBes7VdUiucoKj8DAb5lkudK2FiWBiEE5WPXnmog/elwViZE9Rn3wS5i
 axOHJpQUiH8QGYwOKI9Ols1iEio8+8Cl0Be7tT2NYpDBTMjK8PSqwYWrOO1V6davOeKl8DeW0m3
 s/c+HET+N5XD9QLq/8L5o6GcaOgWkgSTXoan7GBS2ewBxbQ6pAkeNR4T6xEAQl/bdACDkEGvgt0
 fEH3uHllnxRAY+ESFNn8ZZ9IgYsmjxoKw7OANQVWFAre6y8c+t7tefy6XHWzbg3gaSiUnGbqm/e
 WETsyGU1z8pGOI3a6pAmFdF8g+Mc41jdWI1xBcpyxOZcQI3Rvx80sheUAW2vLeMn03wUSRDpGDd
 JLbQs0XSDPY3ZgeStDpZlRvhlZazsw==
X-Authority-Analysis: v=2.4 cv=c6CmgB9l c=1 sm=1 tr=0 ts=69085482 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OTUKU0M5Age6NIqwexsA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: SbaJgOi6MfdoRdd3z4Lr2oKp06AMNwta
X-Proofpoint-GUID: SbaJgOi6MfdoRdd3z4Lr2oKp06AMNwta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_230644_216489_41FD2BDE 
X-CRM114-Status: GOOD (  11.66  )
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

Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
configurations as SA8775p platform.

Changes in V4:
1. dtsi file has been renamed from qcs8300.dtsi -> monaco.dtsi
Link to V3 - https://lore.kernel.org/all/20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com/

Changes in V3:
1. rebased on tag next-20251010
Link to V2 - https://lore.kernel.org/all/20250624095905.7609-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Add Krzysztof's R-B tag for dt-binding patch.
2. Add Konrad's Acked-by tag for dt patch.
3. Rebased on tag next-20250623.
4. Missed email addresses for coresight's maintainers in V1, loop them.
Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-jie.gan@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (2):
      dt-bindings: arm: add CTCU device for monaco
      arm64: dts: qcom: monaco: Add CTCU and ETR nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |   9 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi               | 153 +++++++++++++++++++++
 2 files changed, 160 insertions(+), 2 deletions(-)
---
base-commit: 9823120909776bbca58a3c55ef1f27d49283c1f3
change-id: 20251103-enable-ctcu-for-monaco-0db252ddf010

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


