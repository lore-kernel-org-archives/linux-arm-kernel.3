Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B272D68BEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TCHXjv2VZsMwfFYNwJEOShlKvgPdJRBzvcTy9Q4p/48=; b=edf3fYb16cYtVD
	4Jf+zpsoUiLnfaxa/h+AiYVQr6CzvgQ3I/lJLDPBrn5+OM4dAjL4tu26ut4/1zn646zOj8pqH6/F5
	rXVENPCHRHkmMBUmxZqm0RQGvtJbrikkOClnIiS/psWLwuTzLirMaaUsl3UuGvSrGats0MwFDv2hb
	yP/PFFx8gcV0Fs9iVmeZq8Fi0nmLVfMvHa2frGojcydxTD9dvkHWwn4iWp3Mv+fkLngnYkd9LmaIc
	0zLinfnBKIuBCP0P3y3+AkOCngJ8y0HhLQZH0gAXjcSlOrRKge5XjOx2uRSaJLc7y68r8SkLYYzM/
	qdFTaHyn4PLlv3lD8I5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW95z-000000080n8-0h2q;
	Thu, 18 Dec 2025 08:10:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW95w-000000080lr-2ZiO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:10:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YVpJ4057299
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TCHXjv2VZsMwfFYNwJEOSh
	lKvgPdJRBzvcTy9Q4p/48=; b=gtifw28wKHhjmAbOFS666sg0d5Bpp1uSh2lNJD
	KMO5vt5rl9ugqqMhvXO08Cft9Hpcf6FRaY14u9xDXuc+zEY6hBJ/BDJyoHn1p4NL
	j71Iam1DysGrw1oqXDjGn+PH0VpKkMkY1Z90lTyBcxgm3zNqV7UglTyytZIWInwj
	2FpcLSt+t1ADTohBsxnaehtpLPhesLYGmMvpcm4cevt4YOZdSRqZJLOJfEM9ghpw
	fCbOMiN+pkmm1hlWLdDk3ct/7L0VnkdIWf0khexKtePrlU/XQHiARZeT4rvULpUT
	/i7KtxRz6bQaC74kH9T0HZEkizyuQ5wFms2wX/LqFzCI9PdQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5ap6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ac814f308so865046a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 00:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045441; x=1766650241; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TCHXjv2VZsMwfFYNwJEOShlKvgPdJRBzvcTy9Q4p/48=;
        b=dNdH6tHl0NA5aR7C6SP6EWPR/1DijBAaApf1EIPGyEasoAqtSIBLqj6lJqO9l0JylH
         QZ/FsMulMFahl1EasuldSNpzWlYRQmHbvaK/BokO2g0c1iiQ2AkLHQaJ7+VHyruytA0B
         9w0p3yDDvn6VmHzfjhD61eQ5JroI3jwkzj/CHNV5+DOVjM48hn5Jtki7TTa73btCuSoX
         jvkUuAWwXW4WSEikUBM1Vi9syt+wGuXWsBjia/96cSwRVUaJPCI15++RJQAUcNQxHkdJ
         Ck025/sMu1gmnkXdOxhomQSRKyd+5funm4rZQ3sAJpqqvQwC4UUkZkk097iBjQXrw4Qv
         IChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045441; x=1766650241;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCHXjv2VZsMwfFYNwJEOShlKvgPdJRBzvcTy9Q4p/48=;
        b=P4vlVmGbVdIGJo5enMr4NnV/LImP3jYWQv8ytNVApooz1QzskDvgYyIzne71D0nVUn
         Y+ob+ojItCTTwagPSoVttITVN9++GmzsfzlYROkLCiRmT7ANpsf4WOZmKA8sgKm2y3Oj
         qyCNetTOFM1s/WKY7tVOHU2yUmtFiWFZY0qtqkWaLZYFWg8P9rtpkC3Hr4iZnFll5Sy+
         mspydy1+7iyX8IgCs0n1hNlMJV+c1bC+4imclMkQGSWJE1wxphS7jgVPa91E8OmEHU8t
         H1liftCQnJ375cVZbtHMe++ywrzouba409GZnvV+PQsPsdbHchwGSMs42nNWZ8RXlFuz
         scVA==
X-Forwarded-Encrypted: i=1; AJvYcCXPX+10OxVNu8pJG/FwNzq1m4dogXXn/bjkS6eVpdQKKKFG7ICrn7qcqgqyL40VR+207NC57E/LqxmvhNuE2M9o@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8/Cwwrn+q4kijBNOX/Yg+J6jQ/jB3BNmzicQc3Jjw1YCVxTLS
	rZQD1ghz7ky5M2/kx3X+EDSxSVI8/Lnq2bVg5sJhqCDkApvKlb95Y5irW3GaB3gpsWM+aGloNcD
	pXcw0oWn1uqBwCycfiyFQ6IACnelzHNEM77OJ2A1/so3EClc9rqzpiSnmuMzhocMTloIGt+rUHX
	S49Q==
X-Gm-Gg: AY/fxX74s9b1HD/YkkDghPYfnM7lOXpCPzCpPxhVZG/wJqbNQuxWvht6NLa8SdLdjz8
	sitMRmjYCqz7KnJR65DAJhcke2I/cYZhk8IZ6LRunubkGrvI4f1mrRQQfB1JPQbJ8S5pEdkWj6u
	JZqGw7X1P8jso/R0CxRnLwgEC9R3WRjqV7/yH+jNT4FQJKLjQiCjS/OXdhPm0OEoRuZpQoqODoB
	Jc/adpDnzhXGXh95v+NDpISbWwg12gWfcRvw4fcD+nDbPb4+k4DLhS72YaoBKRlhAq7OOQEZWME
	ILLQEBxcRoB37b8KqymRhTn6U4PPyHk7pZ+jZdJHKdsmoxTQiN6KMZ0lpsAWgO5GRH+jYsnNJkT
	COnRJESQmYC2dyfRLoroWWmxJ4CTJoOHJFHyaLnfMcLtFv/Ta/7+Ge46OztypjGnkdfk=
X-Received: by 2002:a05:7022:4581:b0:119:e56b:c762 with SMTP id a92af1059eb24-11f34c435c7mr17362392c88.39.1766045441093;
        Thu, 18 Dec 2025 00:10:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuYMGTp81NLT+B4cET/exVbTTF3Y5dVTJDSM1G5/qDqcjwsi88g0t8I+546Kb64PBfRSO7jw==
X-Received: by 2002:a05:7022:4581:b0:119:e56b:c762 with SMTP id a92af1059eb24-11f34c435c7mr17362354c88.39.1766045440454;
        Thu, 18 Dec 2025 00:10:40 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:40 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
Date: Thu, 18 Dec 2025 00:09:40 -0800
Message-Id: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMS2Q2kC/3WNQQqDMBBFryJZN2KSppWueo8iItOxBjRJM0Zax
 Lt3Kt12M/A+/79ZBWFySOJSrCLh4sgFz6APhYCh8w+U7s4sdKWtqtRJQswtjJlmTC2EKQaPfm7
 jJAGtqnsuHY0RPI8Je/fa1beGeXA0h/TePy3qm/6k+vxfuihZSaOMtR3YugZ9DUTlM3cj16aSj
 2i2bfsA4vEq/ccAAAA=
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
        maulik.shah@oss.qualcomm.com, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=5996;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ejOs6bkbsY8Vz8EZH6d+LncDHIbxehlNOId5lq1k/tU=;
 b=A2enXks82ZeVTKrJJRlTtv7jUD0gAgfNpcuVx2nZoiIaCK4V2y2M5wmxQDrVaMQjFy5ydmz0i
 ixR/yLK/uwkBgdL4n5CJJ/RblbW1X6439cLS6Yun0gtR13fA95nrPbO
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: D9KTliNBHaENkZ8EQGGcmlfh-sg_t3iT
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6943b702 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5LP_gHFhwREuHdR0VuEA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfXycsB9k3x77XB
 RWd/6LtcNhhvNcmn4kd2yRn0R8lARRuq07jynQhaLZzn4/Kqab+tjIx6/v/D9O8OJfPHI6TITg2
 Vg4qj04hdbFnetPS2vrmTsougXvabwdcXMVYnMpaT2hysZgWS8vZeZYjMxtnrkRZVtC0QTwOFdo
 Oyw1UuNofzRU+VpiUpLaQXL2I8BSwaGH3D0N/zqfNUtA0kn/4ugCYQCmOOLaIrznUmsEJrwM0Kf
 ikcKEq6rUh19N0LSML2atjgc0ADmWYm9AqkQUfpYyFcxVkZi7hGeJ5Yn6GaLQt4mTyxXSed/0qL
 1UtQuhwc8qP56AsRoJNZGi0HC2LzMzxl361OR0nw7EEhi9htK7ay1FzWI3ojLAfZNJJF6yJiiqt
 QBCPY5wK2nUdF0uF+BBOmryBRDh5mQ==
X-Proofpoint-ORIG-GUID: D9KTliNBHaENkZ8EQGGcmlfh-sg_t3iT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_001044_779589_301CB648 
X-CRM114-Status: GOOD (  17.11  )
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

This patch series adds support for CoreSight components local to CPU clusters,
including funnel, replicator, and TMC, which reside within CPU cluster power
domains. These components require special handling due to power domain
constraints.

Unlike system-level CoreSight devices, these components share the CPU cluster's
power domain. When the cluster enters low-power mode (LPM), their registers
become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
out of LPM, making standard register access unreliable.

To address this, the series introduces:
- Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
  device tree property.
- Implementing deferred probing: if associated CPUs are offline during
  probe, initialization is deferred until a CPU hotplug notifier detects
  the CPU coming online.
- Utilizing `smp_call_function_single()` to ensure register accesses
  (initialization, enablement, sysfs reads) are always executed on a
  powered CPU within the target cluster.
- Extending the CoreSight link `enable` callback to pass the `cs_mode`.
  This allows drivers to distinguish between SysFS and Perf modes and
  apply mode-specific logic.

Jie Gan (1):
  arm64: dts: qcom: hamoa: add Coresight nodes for APSS debug block

Yuanfang Zhang (11):
  dt-bindings: arm: coresight: Add 'qcom,cpu-bound-components' property
  coresight: Pass trace mode to link enable callback
  coresight-funnel: Support CPU cluster funnel initialization
  coresight-funnel: Defer probe when associated CPUs are offline
  coresight-replicator: Support CPU cluster replicator initialization
  coresight-replicator: Defer probe when associated CPUs are offline
  coresight-replicator: Update management interface for CPU-bound devices
  coresight-tmc: Support probe and initialization for CPU cluster TMCs
  coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
  coresight-tmc: Update management interface for CPU-bound TMCs
  coresight-tmc: Defer probe when associated CPUs are offline

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
Changes in v2:
- Use the qcom,cpu-bound-components device tree property to identify devices
  bound to a cluster.
- Refactor commit message.
- Introduce a supported_cpus field in the drvdata structure to record the CPUs
  that belong to the cluster where the local component resides.
- Link to v1: https://lore.kernel.org/r/20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com

---
Jie Gan (1):
      arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS debug block

Yuanfang Zhang (11):
      dt-bindings: arm: coresight: Add 'qcom,cpu-bound-components' property
      coresight-funnel: Support CPU cluster funnel initialization
      coresight-funnel: Defer probe when associated CPUs are offline
      coresight-replicator: Support CPU cluster replicator initialization
      coresight-replicator: Defer probe when associated CPUs are offline
      coresight-replicator: Update management interface for CPU-bound devices
      coresight-tmc: Support probe and initialization for CPU cluster TMCs
      coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
      coresight-tmc: Update management interface for CPU-bound TMCs
      coresight-tmc: Defer probe when associated CPUs are offline
      coresight: Pass trace mode to link enable callback

 .../bindings/arm/arm,coresight-dynamic-funnel.yaml |   5 +
 .../arm/arm,coresight-dynamic-replicator.yaml      |   5 +
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   5 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 926 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa.dtsi                |  12 +
 drivers/hwtracing/coresight/coresight-core.c       |   7 +-
 drivers/hwtracing/coresight/coresight-funnel.c     | 258 +++++-
 drivers/hwtracing/coresight/coresight-replicator.c | 341 +++++++-
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 387 +++++++--
 drivers/hwtracing/coresight/coresight-tmc-etf.c    | 106 ++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  10 +
 drivers/hwtracing/coresight/coresight-tnoc.c       |   3 +-
 drivers/hwtracing/coresight/coresight-tpda.c       |   3 +-
 include/linux/coresight.h                          |   3 +-
 14 files changed, 1902 insertions(+), 169 deletions(-)
---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251016-cpu_cluster_component_pm-ce518f510433

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


