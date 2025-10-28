Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD98DCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=buqw48wZ2ixwgWecJ4AHiCAXp2L7dg9Fzs85seWPCLc=; b=iJT7RNPG+nysc6
	Uyh/sV2veS/LSeB+XMPssmCtea0fGDyUD0t2Qzuwdsj0Cl1j8RqrrdjYEnWa36WrTQG9524GIWzli
	gM5c79N0WQwM2dmfpGFEGXbrazu1ySQNtVBPk8ybX6al2QywGbc9lQBRhYJrRtW4jHLncO0GHGm7s
	OEEwJ7C26DLPZkG36AEh9ShqCdkThy3Jue0HRDZQRGb4+KF+1ZrGZ7YqB5Q4ECSQtum7jSYURvQot
	TdBA37eUC9vPlgugVMOuqzh51QXFUPDFPkpYVnLHtuLsM3wiFTWVafpkt3SB/lQtJLnXgq/cD/dId
	lcgbsqJmnKuLmj+5TpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDggV-0000000FirF-3GwC;
	Tue, 28 Oct 2025 10:12:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDggR-0000000Fiq9-3pm2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:12:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S7dabu1033035
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 10:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=buqw48wZ2ixwgWecJ4AHiC
	AXp2L7dg9Fzs85seWPCLc=; b=Qyf34VUlRzbrOyuqJBPX+vxMCe2U3w6+bwcj8F
	Xpi6oYft8Kl2jSEo4N6aoBobt9l2+iwuFUCnZaV+86JRkv3r1vEx2Tsb9ulaAvTy
	FtBq53l139bTy0zL8leRiYs5Cl2uez4iuzej1+5v4xVCijy4JyyTAc8sq7dcpap1
	xU6JX8rHg3VAyY1uhLmbEhncXvQeyTXNEDGhlcghQMFL0XJHNC/N0sY4kb/Ep73z
	seJkANpKt3p41uhrQ9xa8bM9RdhgrZZljvL+Uy8A9uUX9Rq1JKk4Es+FCsN6X2gw
	9kPZp5AB8eTibXPY7SLz95/qAfAN97HFR+Xe31Mdijk1ZL0w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2smurfm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 10:12:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-294a938fa37so60770555ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 03:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761646326; x=1762251126;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buqw48wZ2ixwgWecJ4AHiCAXp2L7dg9Fzs85seWPCLc=;
        b=LyFtrslD5vhVw65XAd2b+sXDFoCsRntmgJ9dnI4farKS2p0gKyPRav3EJsOqU+JnG+
         GKzMBI9/4wjkj1D+RqnF5/T+PLn90VLgfhaM8Vw9BbFpynUjMx6VkkIw9CN137x7IDAK
         6J8I2bxCi9kDm5j5KB/HgNbfzRbQwgh40bPg8k5/1Q2MdGBfOLzC9HKmpj/a/1szNo5F
         7ajCk6eGqo6ftB3S8FL8aFzn2x3pBnwCxPmg1eD92oQnCxLbaphOpGpQ5WEgKYWCcrHA
         EOBal96LrclZ18KcEyCVcxoZQneLnqbTbEDU3be4I6RnbB3Jb8By2pplKPKbsBn6sKAM
         wLMg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3ugNRoDEb8gWZ4kaA/Qcs+4Uu2DX1T49POMq8EQq47bId1Jl3dqozhBjSJjzaR9Es1FQnCeQkWFsXPsLvERK@lists.infradead.org
X-Gm-Message-State: AOJu0YwUc9HPldAlxb4SbwEohAU/rXkDAGktXMAmvMvey3R8HAc7QB4Q
	rO52Aj4ZmfY0zuA5BOIYlpT1sH/kRPFBW6dU5Z6OPjReVtkq2NaSW5F598Co92GBF4Abn2utj2l
	BVxQSfSOzBoNNSHSPJdztCxySa+SQ7Pvo+z4jfSg0/zgpTiPlaeBPPc9NO7qruU5irr7xMPI0KJ
	5Avg==
X-Gm-Gg: ASbGncu384SfAAhnS9nH7aPUsS2rUhKRzm7W5Q9d981hd+BIoAiW6XU6iZk6XgXev7e
	45SZJp1/bYqGLDb3Ii+p/zz80/UnChujpk3XMfDkyHPVrf24mHFuN53QJHQMzhyA2A2UuC429K0
	Io5wIgWQQXLycOFpMex2uXOL6/aoPN+n8mWdBFj2M2trCvYgV/UI850xkYxa6tcw4l6zxk0rOu5
	dzwTYgjUN3sLMMtyk/9PC54uRPGWiK5egG5M8BkJN7jTMewGKogBd763Lyk6/2DSP7fR460a014
	PG7p+Phj8xstDYSwo8BOPaYGLMJIaYLxr3ltvyqvsv6KEnwt5C0EMHT4VPHB7iwq/HdnMROGM3Z
	QdqY5Uf7WGqASs8fmUm27MUfmRJwUnE+eBKM5aruD3M5MxXFKvbWkzc9K/YwIUg==
X-Received: by 2002:a17:902:db12:b0:290:9a31:26de with SMTP id d9443c01a7336-294cb525649mr39336125ad.33.1761646325694;
        Tue, 28 Oct 2025 03:12:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoOZGGOEt0phXm+J2KmSHFAnFwf0oW1ZiPsm8YvD0d0IrmHC4X8XekduC5XQE7VLYGJ5yRMw==
X-Received: by 2002:a17:902:db12:b0:290:9a31:26de with SMTP id d9443c01a7336-294cb525649mr39335755ad.33.1761646325135;
        Tue, 28 Oct 2025 03:12:05 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf423esm110408755ad.19.2025.10.28.03.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 03:12:04 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v4 0/3] coresight: add static TPDM support
Date: Tue, 28 Oct 2025 18:11:39 +0800
Message-Id: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANyWAGkC/x3MQQqAIBBA0avErBNqqIyuEiGSU82iEscikO6et
 HyL/xMIBSaBoUgQ6Gbh88hoygLmzR4rKXbZgBW2dYW9ss4ZiTbybKJ3u5HL+zNEVS8dNlr3rSa
 EXPtACz//eZze9wNzZEcsaQAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761646319; l=2027;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=iL7I37fqMtFDT6Am/ovhwJBg4E+9/0gzvyjWcWeJqEs=;
 b=ulX3NnWkQGxxcdh2JMfepa/tXj9j4B3EM+LcLNZCzyLWdBBdicfrS/Wg+jQ8HP80LS2HrnvwA
 zd0bCxXxvwmDJ0ZhVSMpPsychpu+sS6VVHx2L8d2IJRfJ6+gP0PE2sn
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: mBn2ZIfMto4HECecJ43C9kaVruBR4Ogt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4NSBTYWx0ZWRfX2BgGnVf00zAA
 B4z4yQ9RM0QzSX3CKwG9M8K52aRxfWoVk0NHWKKOQtAir1nNsxCaI6SDas4wTQRFOdLZ+Tkz9CB
 eTPoQUd/RV9+GLUbDPAUwzAq7QI+3OqN/xJLT4YPkIj7boSCHpYv2OnDX3y/vHfVob43XIb25ng
 cE6C0ksS6aebeHXe+R431OsRc6f71KQQtMSq2/9w3rATj+GolB/VgWELBxmOlBC9Kspe807Ux7r
 ot45Fqvj/DE+c7JJazcKMf+exuk0fe85DU4NLOe5xkM+dzL7MsmXwM4sVqprXyqjV/gN1o0BBq9
 K7++2aVeU4ydMYvmwEPQkmKti8mecx776LC9qWrjRHEtH2MjdAhg9sAYF5rlL+lGRXMwjbeS3pi
 wv8zlLN656Lmkl+JZioaXLBd3+SKuA==
X-Authority-Analysis: v=2.4 cv=IcCKmGqa c=1 sm=1 tr=0 ts=690096f6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tgT5Dm6iABrUsP_WvEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: mBn2ZIfMto4HECecJ43C9kaVruBR4Ogt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_031209_074718_A7FA276A 
X-CRM114-Status: GOOD (  13.62  )
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

The static TPDM function as a dummy source, however, it is essential
to enable the port connected to the TPDA and configure the element size.
Without this, the TPDA cannot correctly receive trace data from the
static TPDM. Since the static TPDM does not require MMIO mapping to
access its registers, a clock controller is not mandatory for its
operation.

Meanwhile, a function has been introduced to determine whether the
current csdev is a static TPDM. This check enables the TPDA device
to correctly read the element size and activate its port accordingly.
Otherwise the TPDA cannot receive the trace data from the TPDM device.

Changes in V4:
1. decouple from tpda driver code.
2. Introduce a new solution to identify static TPDM.
Link to V3 - https://lore.kernel.org/all/20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com/

Changes in V3:
1. rebased on next-20251010
Link to V2 - https://lore.kernel.org/all/20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com/

Changes in V2:
1. Remove the dependency.
2. Collect tags from Rob and Konard for patchset 1 and patchset 3.
Link to V1 - https://lore.kernel.org/all/20250822103008.1029-1-jie.gan@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (3):
      dt-bindings: arm: document the static TPDM compatible
      coresight: tpdm: add static tpdm support
      arm64: dts: qcom: lemans: enable static TPDM

 .../bindings/arm/qcom,coresight-tpdm.yaml          |  23 ++-
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 105 +++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.c       |   7 -
 drivers/hwtracing/coresight/coresight-tpdm.c       | 174 +++++++++++++++++----
 drivers/hwtracing/coresight/coresight-tpdm.h       |  12 ++
 5 files changed, 279 insertions(+), 42 deletions(-)
---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20251028-add_static_tpdm_support-1f62477857e2

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


