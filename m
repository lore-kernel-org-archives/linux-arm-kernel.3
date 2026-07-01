Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375B3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 01:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C0Nt8/qawZeMhk1o8C0hBJgi0bwQbxoP3TJUKy1hBOs=; b=ia9Mrp5ieByJep
	CrEh+hbMRXubD/tUZo3BMfvefwz/8c1lgSrBioVpmJtoIX/wQHpbVLSEX4iFNvR44aDm+CZ4YhwWn
	8EHi+bKaQ8PNum2PY23R1HExIbbCV28A7HV71oLRssq5zhTGEbdua2Mzza7UxWgLLr/jwXsYgL/zq
	F9SMiWdd7uXGCz6jrSBJYWMxHyBzxH5E52Ytm6pocRVa97NAlEc05XiOJPs5n7rHRq1ejXbjsQHWs
	u2NGkDB/X9Vx62eqwgy7X8eD+IiVnXG4vd6XstZPU6xh9V8C7OCtHa4SZLVYG8KW1WU/z3KgGBufy
	P1XRMUGsm3BYBvBFcusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wek9a-00000000TXb-3oFb;
	Wed, 01 Jul 2026 01:54:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wek9Y-00000000TX4-1NR8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 01:54:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNLn7t3481476
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 01:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C0Nt8/qawZeMhk1o8C0hBJ
	gi0bwQbxoP3TJUKy1hBOs=; b=GfmhXF3LLHIIqhsHDRDt9eyfsltliPJqARJy/8
	8BCD2S2QXGMy7V6HDDmalzKyR/OCfP70/mtTX9FvJVQYz7z18h09Y4r7NFkkBPma
	++IYdjn9Y9KJpdIRPPDAfhruNQNfJzt1rpwFJCKeKLKI7r1LMTLOXDSXh/FCOS27
	U8uzll8GY5Jok9pE9OS1Yqss0FDkKODnukyXRC6hJkomFPtDCtT0gvzpHMVOaW+j
	nEyJXI8ms684te+8b+J8NdCvCA8JgcEMIUakyscY1GrcVBejlM6nLP0RqP6ax7f3
	skkCWvg1OOKhFm4jjE26SRcEFxDK4oLUqlPQHWF1bptG7rwA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j99htqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 01:54:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c825562f8bso1651445ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 18:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870855; x=1783475655; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0Nt8/qawZeMhk1o8C0hBJgi0bwQbxoP3TJUKy1hBOs=;
        b=K+MUVVLh4apBBJuqFzB/6dn+JP4m8iQ6tH8QuIJJv/wP3RRqK2leguOidfAeNcpAUX
         cZ2GvgE0qnZU4BwJQrB++XYf4IV2uDon58sNtYKt3IgUxp/md2wSz51gkPTsX49rgMlx
         DYviX4bEqxJ8wJ3/LbYqRZkGWWDIcW6/sspQw9CFWvB6gWR7wQKszn7bz+SuHF7BaVfF
         1numHBH0i4drLby5gDiaN/KIW828rmqW6AG2f/r7JdORjSo65FnbWAc5dHTjzIOWSXpw
         xJGuGkVUcQGMvSxe+5ofIm83dNW1pmphIEvB9wJ3Wdbb02DHUydj9W7f696i9DcGMHmw
         ai3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870855; x=1783475655;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0Nt8/qawZeMhk1o8C0hBJgi0bwQbxoP3TJUKy1hBOs=;
        b=mGy22t8LJfi7rhBzzCBQTta4aQS30nH2uQu1yHhSfCrrSuJNHWf9j/JbTIYGB1lLNq
         K325r7ACgWRSTfcJVRqsfL5C8X5VY3yeniajz7uaqwHCVaRgYWkMu2yVF8AFjtqWbuAX
         vH1FK1fM7P/o8V3+czUevLs8boFFGtOFS6DzcstX8npHH4d+bspsNodZ1Wxy7dF9p7pb
         Kq218lqTAqpgyEuU+0tv432Yg/M2o6QeW3PfzSBieMvraXHruazR7ehy0C+Pb07wyifW
         KJFuFkUZvArKALXhbQn971cHFlQBigpj+N+dFvV9MALq/o9w9HXECdQ9NHlGakleRpvO
         8FZQ==
X-Forwarded-Encrypted: i=1; AHgh+RopZdeztW+heuTi1BnsqQC3H45Qkvxc0v9K7a9IrMRHWaRY1IJvOwHA8JdG+3WsCGGt+OTTge9VMFIMAqA0y0P2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv/GNzpwYMGZsCF1fQNo5wWBMt2Y7CwXWdWecwF666ohBp+LLg
	Blz96wgmHR6/n6rQV91FBa7kmW0DuxR+VcgQtse67nBB80Ek5705INjjQ4Pd/CmieNqdlsOZk65
	QJuz3q0UEb1vIqOSCJhZOW5LWY9tWZigIvGGYqwkVgUP6Ov1nUcOzLgKrraajOc6/jkyN/+lz9q
	ajOw==
X-Gm-Gg: AfdE7cmlVTw07GQAyqP1FrohHHyDbpskDIcVEBPBkF03QBAIefhSp+VXpm3LzVGt5JP
	MYFjjSFQpoP5bgUM59XZ1IdSPRwRAGfqiILhnMF62OnHVZy3+4uBOBPf1iDhozKAvNz410UC7y/
	kL2pIVYKWGxX0ehcehBXmB4xwEK4oSPz+Xom4B4bymwJhjG7a7TrDfMqpnacYVvY4WrSwVe/lUL
	q71NZxwmgmJRo68h4OVD9DPLuMzHmKXf0QNh0XLbsHPMsjGh16LcJg/syPdgm1oQ5jGLqOl/91W
	BjUASkeRZZbJ1fdy/LzUWbMGAZvw595F1AKKq4nCbVF6VUZaxEDh4q6x6Et5E5NbITG41dahSjf
	QUoUixpMAEqAYABf10FdUGYRwaXXnkmvtAEFcmN0fH3dcZSh7Thkpex/w0/swVVyl+OAZAF64iA
	==
X-Received: by 2002:a17:902:e750:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2ca2d79cf0fmr54119805ad.13.1782870854738;
        Tue, 30 Jun 2026 18:54:14 -0700 (PDT)
X-Received: by 2002:a17:902:e750:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2ca2d79cf0fmr54119515ad.13.1782870854181;
        Tue, 30 Jun 2026 18:54:14 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:13 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v4 0/5] Fix traceNoC probe issue on multiple QCOM platforms
Date: Wed, 01 Jul 2026 09:53:40 +0800
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACVzRGoC/43NwQ6CMAwG4FcxO1uzlTGGJ9/DeIDR6RJluAHRE
 N7d4cmDGi5N/ubv14lFCo4i228mFmh00fk2BbndMHOp2jOBa1JmyFFxhRKse0AfKkOtN9AFX6d
 GjAOBURLLpkLdWMnSeRcodd/08ZTyxcXeh+f70yiW7Qp0FCCgNqbQuSi1NfnBx7i7D9XV+Nttl
 wZb7BHXeggcCq1y5FahRfHDyz68jP/xssVDLkhoKaiUX7x5nl/e/qeJZwEAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870847; l=3766;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/ryGcxx6Nu7BXIs0Li0gmKHu5V51HhlktJvdbFAeafo=;
 b=/UXhHbIqXN/AyUqRrNk0GJChbDZcuDbq6hv4Cytm1eI1Q9jmtBCfevqm9yhCqTQN05nlTBvcU
 7TbZgLFeyBFAp7hmUZncgOhPmTYNBzvcpK69v5Sd3wv5zdGBrwGYlo8
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX6EYUEVrwlpFU
 fyUy0tWRSPmrqpRsQTMnFN1maLqjoqGNglWe+hNQRgE6Ak2PzwqqmaMsCAK/Pv5pQqr1u+1Rm+u
 Ss9GW/B2akZicPOtdkZlsE7YJeETVlw=
X-Proofpoint-ORIG-GUID: ZUoMSTTdpgk6nJTBiC7Cv3bz8fHB9yTv
X-Proofpoint-GUID: ZUoMSTTdpgk6nJTBiC7Cv3bz8fHB9yTv
X-Authority-Analysis: v=2.4 cv=bNcm5v+Z c=1 sm=1 tr=0 ts=6a447347 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CPxOtKTflHPnepyb4PMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX0MvY9OcGYeTF
 OC1yGzjNEjYsjOmcrVQOMKd4LAH4LBQyHr1Y3Ca45vrnkF9ufzwqW9uk7OM4tRl+q5wnB8AujK8
 1oRh8LFI69IkiEymTMv/ipAsQl7B/dn27P0gGtIBA+LKR2NxaNRWIBn+JNl3MHG6CYZImkfN8R7
 5yHOBstzscXeFPVk3A5KwNbHDgeJWaecw9271zX8hVd14eF0dsEwnGCAwaHQzsESMkB6EsAInCg
 zkpS7Wqovznpl/QFsybURWlFqElb/jBwf+EkDICXVRgCdwUPaspYvThnvKF3XOlP3NxWvEpEiry
 /zppShY7kxmUR7N+hQaYEHcwb6ge2hTsyjWQnBhKcbP5LNA4thg/T/c7zib8G/+KIYqGRnsS0Ap
 Mj1k3yuzwVZaFVT/NL2au7pbmZa6hq9GQOcLDuyxC61JtKPoW7uvyxH5/hyj9/Xn07m/W7rK0mU
 1DzRa1Gmn0w8pnoh8fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_185416_477943_AF49D6F6 
X-CRM114-Status: GOOD (  22.61  )
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

The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
forces the device onto the AMBA bus, where the driver must read the
peripheral ID from the device registers during probe. On several QCOM
platforms this AMBA peripheral-ID probing fails, so the traceNoC device
never probes and its trace path is unavailable.

This series introduces a standalone "qcom,coresight-agtnoc" compatible
that describes the Aggregator TNOC as a plain platform device. Without
"arm,primecell" the device is created on the platform bus and probes
through the platform driver, bypassing the AMBA peripheral-ID read while
remaining a fully functional Aggregator TNOC that allocates a system
trace ID (ATID).

The series is organized as: binding first, then the driver support for the
new compatible, followed by the per-platform DT fixes that switch the
affected nodes over to it.

- Patch 1 (dt-bindings) converts the compatible to a oneOf and adds the
standalone qcom,coresight-agtnoc form alongside the existing AMBA form,
updates the select block, and adds an example node.
- Patch 2 (driver) adds qcom,coresight-agtnoc to the platform driver's
match table and renames the itnoc-specific names to generic tnoc names,
since the platform driver now serves both the Interconnect and Aggregator
TNOC. It also restricts the ATID-unsupported handling to
qcom,coresight-itnoc only, so the standalone Aggregator TNOC is no longer
wrongly covered and correctly allocates a trace ID.
- Patches 3-4 (kaanapali, sm8750) switch the traceNoC nodes from the AMBA
form to the standalone qcom,coresight-agtnoc compatible, fixing the probe
failure on those platforms.
- Patch 5 (glymur) switches the node from qcom,coresight-itnoc to
qcom,coresight-agtnoc. This node is actually an Aggregator TNOC (its
tn_ag_* endpoints show aggregation), so it should expose a system trace
ID rather than being treated as an Interconnect TNOC.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v4:
- rewrite the commit message for the patch 3 - patch 5.
- free the allocated ATID in remove path.
- Link to v3: https://lore.kernel.org/r/20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com

Changes in v3:
- add standalone compatible for AG traceNoC device, allow it to be
  probed with platform driver.
- add fix patches for sm8750 and Glymur platforms
- Link to v2: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com

Changes in v2:
- address the ATID issue reported by Sashiko.
- update binding to accept arm,primecell-periphid property.
- Link to v1: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com

---
Jie Gan (5):
      dt-bindings: arm: coresight-tnoc: Add standalone qcom,coresight-agtnoc compatible
      coresight: tnoc: add AG tnoc standalone compatible to the platform driver
      arm64: dts: qcom: kaanapali: fix traceNoC probe issue
      arm64: dts: qcom: sm8750: fix traceNoC probe issue
      arm64: dts: qcom: glymur: use Aggregator TNOC compatible

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 39 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  6 ++--
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       | 37 ++++++++++----------
 5 files changed, 61 insertions(+), 25 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


