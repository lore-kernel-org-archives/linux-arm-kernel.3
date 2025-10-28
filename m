Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4077ACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JLnYbqr9msvD1/79xuZ9kBCdhSNS4ncRjKXElM3L+tA=; b=vaa1CLrP+BInLs
	N0ITvC4Y4lriU618sGEeVP4NbD0tfmBY94Nxp98CuJx/Q5nxOI/AjaRBFM4UmnUi4CzGDLFYh6B7Z
	O0IdgqCjmZUUOuDYtvnRlZjq3N9sMS09xTgrRizjT5RNMcR5P8dga3EaHVoSosX0cwxErqz8LAD67
	3sT8Hh+uXvK7j6k2vn9Z2bmdbroZxle/SrjBKPhaL3mOXae+qxgqBRduUbMvCrytqMDO/+hctx/Tx
	hFohtjnMw87H0AFSROyZYs6ZtjJlZi5nYdaGMv/XXhP+/o8waC/1XF6aAI0ciVyETObEdCLuaFF96
	8JgaKTYVUNclWl3D02PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdBp-0000000FKuT-1h24;
	Tue, 28 Oct 2025 06:28:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdBm-0000000FKtm-46Zg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:28:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S3uN6k2232095
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JLnYbqr9msvD1/79xuZ9kB
	CdhSNS4ncRjKXElM3L+tA=; b=dzDC5idHe0Jxo91n7QH8zNFdFHQw4ZgpsTIOv1
	Q0pHCZGi+FzlQQjUK26QRIxsY2drrWPIF9SSqFmZfy35UpyYFD73HJgs4t8l6m1n
	pZ4Vl8O5xqLJgoyNbaK7wtluIydB0eroX4WqEK+3MSTv+01ZyzbbwmjTQeet2kmp
	YVMEQxWppgkrKtzf8rM6mPUqz1MdoRAW8qPiUK52qSlEB2aCMsVjM9PGjV0HSqUu
	zV9i5BvMYbt4xizCzFcsSkfDxhqnzJVQNzCcC8P0KIntjd1/M61Vs8921aL82YZ9
	IJs24ENyZtBkKdt34z3hUcyEwFlsl4G7T9VbqoO2aY2ALBSg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wnbmuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-286a252bfbfso131118275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632892; x=1762237692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLnYbqr9msvD1/79xuZ9kBCdhSNS4ncRjKXElM3L+tA=;
        b=TGC7uW+MIG27o7MSx5Jm768WCBCNMEWT55HF253Tcv3sWXvSwEkKUxM3DzcUGRN1Pz
         mBQd2v04s+BZiFLT0zDlkjzasr6giPjoVUCSkNvAE9vlp9aA3JgmLhmKvmFOzvnU+MxX
         Hc1NoDhMj5/Qry0th9QBUQSxLGR1qup78t6XKKI7dyXlSeLGjhjy6esPh84L/+dupJ8r
         KkgtUFpDW5mzwLw1QCKWBAbrwQxFUm2aW1uJOd5dWfA4yr4AbSEHdPlQLgg4J4fNU7tr
         sSZSiEHWW4glBEfMGJLcV0usnbKA/fCLhty2z0ni7zyxGqqiatSW6kdazEg2ieXL+lug
         g9pw==
X-Forwarded-Encrypted: i=1; AJvYcCWEGCZ79DEGmzAluzdIgRPpXdhYQOsyUFM1I2JcySxyZ0Mc9s7eop8ZkNLpFvMy5etQbAklWKVavYXviYEFvVH0@lists.infradead.org
X-Gm-Message-State: AOJu0YwbfTWhVB7AmssVBjbmka5Kpc4kpzFaDPV+V9P0rrtCdZaZBoQt
	S5rDWFastrCACV6nMjXEqfnxMC29YX6G6sJRx/NDeG0VPlUgdI08BxDNMrhF9E+WYNcp4kdHh74
	EE3CBYyFq0VCo9OzT9NEKveOw3caPDa5gfApahxrNrlOxnWCbtSyCdkdEiuMO/GCS2F15E2UFKL
	B2jg==
X-Gm-Gg: ASbGnctiNqIuAvcIQWd2hwQP5jT4+GuAeS4FCqIgIsHx9+lJ3/WJKljB28UNWrWxQo0
	NOgXf2OSX+E8G3MEeSlf8e5zlM0DqjHl+pYmSTvxn/m/bOXSAGo3bYRwMgOhlNZtp+z9AEiM96S
	24vsimnaHCgafSN/NoZEBFTof20Kts9dJB5lX5eWPImoKAwdEzYAL/9AtqrN54Y/exLTbZc7zVw
	biciVM5RGpv48LV2icN4Xba/Ei4ed/kkOIjxz9GLAoel25CHrE3eWgUJOfYWATEqxfVcpLI94ZP
	YwdEUVm017o8LStgjRQz4CGWMifN1GimxaXFhbr/rILdEZokjPvZJytz3JNy7EKl8CpT3PnTU4Y
	8XUqwVL2bJaaEMvuAnJBy/MmS//Agl+GpXyP9dbDYrNDMkelLhk2MCzE1
X-Received: by 2002:a17:903:38c5:b0:24c:da3b:7376 with SMTP id d9443c01a7336-294cb3a11dfmr30302225ad.26.1761632892463;
        Mon, 27 Oct 2025 23:28:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkoJ0/BWbeULjwvKLuQumjd4K3ei4AcaGQDzrzd6IcSgDpV2RBGOWAbR62jWKf3T2tuscaCw==
X-Received: by 2002:a17:903:38c5:b0:24c:da3b:7376 with SMTP id d9443c01a7336-294cb3a11dfmr30301865ad.26.1761632892019;
        Mon, 27 Oct 2025 23:28:12 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:11 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
Date: Mon, 27 Oct 2025 23:28:02 -0700
Message-Id: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHJiAGkC/x2MQQqAIBAAvxJ7TsjKiL4SIbFttVAqmhFIf086D
 sxMgkCeKcBQJPB0c2BrMsiyANxns5HgJTPUVa1kJTuBLmo8YrjIa7Sns4bMpd0pkJTs1yy1TQM
 5d55Wfv71OL3vB2Lq3UJqAAAA
X-Change-ID: 20251016-cpu_cluster_component_pm-ce518f510433
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=5210;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=6PnlglbBdA+sT72qw9FSQQcvFbM5sLJUf0oCBFAlNsY=;
 b=LALf6twg1OIvxPNPoUXNnYLUruCA2bLqVPFCSjxVHlq0x8jHuF1l0snyO9zy7Y4Zt8YntjTkp
 Oh08LcncK+5DapwYzG0b/O8jyAPAEAGclo9D7j34geQ6cr5DLet7C3r
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=6900627d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6muaAK4ZDRYgKIjbAQEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Ve0ewoZbj81ZfHS3ku2UijU5WIbXpU3Q
X-Proofpoint-ORIG-GUID: Ve0ewoZbj81ZfHS3ku2UijU5WIbXpU3Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfXxIyZPSzsA4ye
 QOawbxoYmf0IscPM6xvz2oXu0YliemN6p4M37dkLr1biBfMne6ujsb6st8JuEWLhvvusOBXhhFM
 MFHF8frRhN4fTuY6VP9tijO7plJ85zJiK3Xv/f4WlqLzxHelRO8lCEXE5tL6tgaNogvoreKC1hT
 BU1MH7v65+HWHY8CzX+L1lvw06aaSgucW5LoYsMZA5fKroSwo3vQmDu/NLcbwtVfawYRGt638AI
 GlNCjL/Lw0rT2eZfeizdQ1KwdEXtbGKPgF2XQOVhXWwsE6N2JWMLADnuT0XCPTMlO2XQQLCLazj
 K4uFHSlq7YS6NcTQpXB0gxPf3zhdU/x6nxGdYdfWYRgQPI77cBsOizvvjsFhVBP9ReM7v0jUUut
 gOUqrgBBFwSppvWdSHNtqQadqxW2+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_232815_157304_78FB3279 
X-CRM114-Status: GOOD (  16.65  )
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

This patch series introduces support for CPU cluster local CoreSight components,
including funnel, replicator, and TMC, which reside inside CPU cluster
power domains. These components require special handling due to power
domain constraints.

Unlike system-level CoreSight devices, CPU cluster local components share the
power domain of the CPU cluster. When the cluster enters low-power mode (LPM),
the registers of these components become inaccessible. Importantly, `pm_runtime_get`
calls alone are insufficient to bring the CPU cluster out of LPM, making
standard register access unreliable in such cases.

To address this, the series introduces:
- Device tree bindings for CPU cluster local funnel, replicator, and TMC.
- Introduce a cpumask to record the CPUs belonging to the cluster where the
  cpu cluster local component resides.
- Safe register access via smp_call_function_single() on CPUs within the
  associated cpumask, ensuring the cluster is power-resident during access.
- Delayed probe support for CPU cluster local components when all CPUs of
  this CPU cluster are offline, re-probe the component when any CPU in the
  cluster comes online.
- Introduce `cs_mode` to link enable interfaces to avoid the use
  smp_call_function_single() under perf mode.

Patch summary:
Patch 1: Adds device tree bindings for CPU cluster funnel/replicator/TMC devices.
Patches 2–3: Add support for CPU cluster funnel.
Patches 4-6: Add support for CPU cluster replicator.
Patches 7-10: Add support for CPU cluster TMC.
Patch 11: Add 'cs_mode' to link enable functions.
Patches 12-13: Add Coresight nodes for APSS debug block for x1e80100 and
fix build issue.

Verification:

This series has been verified on sm8750.

Test steps for delay probe:

1. limit the system to enable at most 6 CPU cores during boot.
2. echo 1 >/sys/bus/cpu/devices/cpu6/online.
3. check whether ETM6 and ETM7 have been probed.

Test steps for sysfs mode:

echo 1 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
echo 1 >/sys/bus/coresight/devices/etm0/enable_source
echo 1 >/sys/bus/coresight/devices/etm6/enable_source
echo 0 >/sys/bus/coresight/devices/etm0/enable_source
echo 0 >/sys/bus/coresight/devicse/etm6/enable_source
echo 0 >/sys/bus/coresight/devices/tmc_etf0/enable_sink

echo 1 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
echo 1 >/sys/bus/coresight/devcies/etm0/enable_source
cat /dev/tmc_etf1 >/tmp/etf1.bin
echo 0 >/sys/bus/coresight/devices/etm0/enable_source
echo 0 >/sys/bus/coresight/devices/tmc_etf1/enable_sink

echo 1 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
echo 1 >/sys/bus/coresight/devices/etm6/enable_source
cat /dev/tmc_etf2 >/tmp/etf2.bin
echo 0 >/sys/bus/coresight/devices/etm6/enable_source
echo 0 >/sys/bus/coresight/devices/tmc_etf2/enable_sink

Test steps for sysfs node:

cat /sys/bus/coresight/devices/tmc_etf*/mgmt/*

cat /sys/bus/coresight/devices/funnel*/funnel_ctrl

cat /sys/bus/coresight/devices/replicator*/mgmt/*

Test steps for perf mode:

perf record -a -e cs_etm//k -- sleep 5

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
Yuanfang Zhang (12):
      dt-bindings: arm: coresight: Add cpu cluster tmc/funnel/replicator support
      coresight-funnel: Add support for CPU cluster funnel
      coresight-funnel: Handle delay probe for CPU cluster funnel
      coresight-replicator: Add support for CPU cluster replicator
      coresight-replicator: Handle delayed probe for CPU cluster replicator
      coresight-replicator: Update mgmt_attrs for CPU cluster replicator compatibility
      coresight-tmc: Add support for CPU cluster ETF and refactor probe flow
      coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
      coresight-tmc: Update tmc_mgmt_attrs for CPU cluster TMC compatibility
      coresight-tmc: Handle delayed probe for CPU cluster TMC
      coresight: add 'cs_mode' to link enable functions
      arm64: dts: qcom: x1e80100: add Coresight nodes for APSS debug block

 .../bindings/arm/arm,coresight-dynamic-funnel.yaml |  23 +-
 .../arm/arm,coresight-dynamic-replicator.yaml      |  22 +-
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml |  22 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 885 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             |  12 +
 drivers/hwtracing/coresight/coresight-core.c       |   7 +-
 drivers/hwtracing/coresight/coresight-funnel.c     | 260 +++++-
 drivers/hwtracing/coresight/coresight-replicator.c | 343 +++++++-
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 396 +++++++--
 drivers/hwtracing/coresight/coresight-tmc-etf.c    | 105 ++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  10 +
 drivers/hwtracing/coresight/coresight-tnoc.c       |   3 +-
 drivers/hwtracing/coresight/coresight-tpda.c       |   3 +-
 include/linux/coresight.h                          |   3 +-
 14 files changed, 1912 insertions(+), 182 deletions(-)
---
base-commit: 01f96b812526a2c8dcd5c0e510dda37e09ec8bcd
change-id: 20251016-cpu_cluster_component_pm-ce518f510433

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


