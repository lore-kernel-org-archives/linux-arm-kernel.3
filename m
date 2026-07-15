Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B04C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 01:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pAtH5G57y5Gbyi1JlqywtrXzbSjK544adRCQmBhjzoA=; b=fE0EO5KmyB7l7X
	CnQWkVXCjIC3KtyZNo1ySLSyKUl8mudRH8u8pyFSFswSWzT1fhH5HP1E9ybZHPMzwPwCGa+bjIpDE
	HKbnI/MQFhWK2utdAYy+ztGDOK9FQhyDRnUBkawAFOhStTCkUtcBkMwNpig96Axoh9g4DNb70WVeK
	MVpdz4Kb7oG+FjIHwvprzlkflymg7ltFSBRfrhqfS3kRKNEY0rGk8OMc3sItezor89JTZGVlF/iL9
	krhSb9HMJlv/lbVzFZVd21RkY1Axowl8YyKLlz6z24yc04hxwBPYumnJwG2jE/mTJauZHlX6lGTcE
	BZL7rjUOUub0Af+U+rGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoEt-0000000DXWn-0Asg;
	Wed, 15 Jul 2026 01:16:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoEq-0000000DXVy-0kzp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 01:16:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IW9K2172241
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pAtH5G57y5Gbyi1Jlqywtr
	XzbSjK544adRCQmBhjzoA=; b=iii4boXyuleGRQ6V5NlVuC5I8eyHZ6YgyCZQOx
	1zZSqWLNeL1bN0G+jwsidoGpONzkVtOPPQ3bLg2tIEswsMCIQKxwzwqDETz9GWa7
	EnHGaa7veKyZhZvFGblqkUi0ShjeRDOcw5s1lezsemkX3D6+0pv452AYkNeCSqng
	PfRQngf0op/0NPE4WguuQorCokY1ks0tsQlg76eyBGH99uhl1yGth66egjzuuaRm
	wkb42OlLx20Mz+fZCFutBSZFkW5yFPpZMKawuSRp1UXxeaiTLl+khejmtj/v05Rf
	hXKCeWt0pPtHFgxZzJgkwtOCFiuh2vgC64IQE6ARUyanI+yw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqtfbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:16:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce02cb769so20061355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 18:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784078198; x=1784682998; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pAtH5G57y5Gbyi1JlqywtrXzbSjK544adRCQmBhjzoA=;
        b=jpn82WuSxa52KsPjdu0YZRbdIE4jnQSORPqWiLb5hQCv3eYnwfbnflzsosxjQgvVYt
         ItcxsMcRODWrd7vIZuizpYefitdkHRJwrwg8ClKHOXuAm4/Bfn0AO381TUUPz0uXJgqC
         hO8kV7jPguIvtZPN8TNXSriPpy82UgPkxgEJSDKrWEkNuhvcTypGatv0sz0ZDAX0mTt5
         7h1/fLCl6SMlD2k+76hH/V9XKA4SmWTLhNcagDBRTbJQkKRxdvH5MTRXFM0yiDgIzYaX
         S8zPvOfV5ZUCYBf7CRmZh6rPmJ8HRQmsy5qubDgan32mSOCWCC/cbWMi62dRbyaLxR6Q
         f7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078198; x=1784682998;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pAtH5G57y5Gbyi1JlqywtrXzbSjK544adRCQmBhjzoA=;
        b=IcbVtDjOMKdXvBP2MiadKoW3jpjinVDsDsUxSk6uFi3qNFh+inuTLeeG7RWPV3/hL+
         NH4saSvHGBvT5Stmvzr1b3GSVzho6ZqG1eSj4lSNZRe2suNmBZsTT0syusOrivU5BECt
         94boDDVs3RsMC6r66UtXQWcWXm40+G67csS86mZyZurvPNUGb4f0GAVkJgKF4Id+KWG9
         B6olD7449avG6nZCxWAYlK28rfgt0+mDURNRfdAZ54pbrdrOKaF/g2/nL2XHamVN5Vik
         9p5AIyVKeRhZWMYKru1FlgF0nkTNa+91BOjLmKo6ImD1zJ8kJ3K/dV6IbMCRGDsfORzx
         SERg==
X-Forwarded-Encrypted: i=1; AHgh+RrSpnmiJqFowSgZRxXd1bP9j9J59uLFFkC69NouqpKnro2gj7F3rsEdOAYyvxEkDPavelkRAdoV448Ld0rFWjhF@lists.infradead.org
X-Gm-Message-State: AOJu0YyrQ0DM3+cTnInZc9IHL1AwHnwn08yhbYiaXEaYaiGyp3PKQng4
	GuV3q5n0iID2yThVftPjGF27GOVf39s2UIK/nb2pf5o4HqY1OB44N17JYMBecRwQQudt5RN0jZV
	N9A3nA4r7+CEQrLKEft/cZbrUXy/MBTH1tlIfX4tMuZTuWME25/CwT9RiNrs+JSdHkNACEOwtrA
	S8vA==
X-Gm-Gg: AfdE7cmHEzBC9PCSya5/4miP7xP7UhhWGQZGpM4rC19/pbtfNL5sLNibPCZ0p+wDMUn
	B4rzXS839Yr+f4ELbxlfhBdFfgUNdzkPVaLwwjWxsj6FioIJolFUuN5PzfxQWNB2iqJWhdqPct2
	KNFZDjL1EtKimA9n41ZURIe8+ia3LRm6ZgjsGjDER1eXnChCqXFJtRwQ9fmsmbImq6igOEHbioY
	4vCn3DAGGrN2UdraeDxaD7hEYUhPEP8mgcFEnhyqqlCGcyG6Ub6ixWIvvzmOqtjVUUOftUkVazg
	KE9/Lo36dIDyuOqCNbkGimbVz/XP8xP1EhcIPdkjOp9umjOJNdYiQiNqvPc1wVDdanGcRHN0qZ/
	71dxAagWe1HwCNjmYhroMCZjf/SO0f0dW+91blTbrcflOjG0ogUTo6Om7WzTuqynPRr+qo5wl3g
	==
X-Received: by 2002:a17:90b:3a83:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-38dc74d04d6mr13821916a91.5.1784078198085;
        Tue, 14 Jul 2026 18:16:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3a83:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-38dc74d04d6mr13821886a91.5.1784078197613;
        Tue, 14 Jul 2026 18:16:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1745a3fesm2207487a91.13.2026.07.14.18.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:16:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Wed, 15 Jul 2026 09:16:13 +0800
Message-Id: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF7fVmoC/42NTQ6CMBBGr0K6dghtaP1ZeQ/DorZTOlGodpBoC
 He3cgI3X/K+xXuLYMyELE7VIjLOxJTGAmpXCRft2COQLyxUo0yzly1Y78GljEx9nGBMHhlCysC
 RbtlCCMEqI9F604oieWQM9N4Cl65wJJ5S/my9Wf7ev9WzhAau0oWDPhrVan1OzPXzZe8uDUNdR
 nTrun4BMGpfPNMAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784078191; l=1381;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=aFIWDU6AlfYlaPP8X5OcNF9jcaSZ/urzY1gk6bBHoCE=;
 b=WEFYv59/YJRcXk5HjnUKTQ+mT91vfzOOTpTQoQY20Vt8nnM5uVg9+ccZhEhHFAl+sTdfH6+09
 fDtaLiZtefRAzHpWJWnHQCV0A7bNjLVlQFQvvbiro07GyVvMDvcCNA3
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX1yhXlEhwibzr
 xNHnXyEO9jygav2mHGxE7bRbQi9ikvBngJHu9jHpT6wrodSr5qbCjPXeyt+487vGfq4HQUI58GX
 d1uVth5lqqGEXIAGPLf4XN4CCtGsSHjiMKAtPt4AAu+9FF6IJu85Z/yOuhzLR0b73ay9CElILbD
 7A53txrfo3731Bs4ian6ZUV3gP+o904QtIKlTmTxL8+pqw3VNk/6V9PM3I8Uh5x2asNlwAx2pj8
 uCREvJHCAv7K7Jwf1AWhMZLGY3M2v3ISVzcFGyxG1YMtEVh0gJJaxpk6GvD6QTaknYLMcoxsV+6
 ls1VV8PEKuzALAdhUaa6oevBuRv164rL1wP7r8E9U53hZURIv/R4adESJ+qs7R9fneVRenmev/w
 11YRjap+44K31p5iUetSgL3nh5h3xBwL0fmBLoCPBJbzFZTHhaZYRILtZwTGnxYYVg6FQTt+JW2
 TNWGp0BhPju4IenQ0cg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX/ZoorHLWzuAS
 vkCO6vsc5o7ejtjCEU+m31EmJt3dqEkpx13KASYQESPGR5pInet8jrSQEm3RMXkHJwy+hE5Ya/m
 JtpPKAviQG90rQD5VbueOA2bKlzu7IA=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a56df77 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=anp7WcwJjaQlINPkyJkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: t_wg2I6CL2_3jpaXCo5j9qUsVeXnT2wC
X-Proofpoint-ORIG-GUID: t_wg2I6CL2_3jpaXCo5j9qUsVeXnT2wC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_181640_343766_9FFD8C04 
X-CRM114-Status: GOOD (  15.08  )
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

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- remove MMIO for the ETM devices.
- Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com

---
Jie Gan (2):
      dt-bindings: arm: add CTCU device for shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
 2 files changed, 1296 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-add-coresight-nodes-for-shikra-fffa261ead64

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


