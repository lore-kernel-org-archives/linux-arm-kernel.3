Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916D4C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 03:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hYAdSew6AptzJBVsbHhvREpcJmARjrEFgChOrvn1g98=; b=tULBDvjvYAkDxCH89QfGT9mraK
	/LIFi/5hRxNrv8DqfYF0/o3fwQph8qC6bgc6FOcv3csk5dwMiWjpziOFNXQ0hf+HZWDPBEy4WMxdg
	Z1FR937zSDDgdYb1bpCtjqLLan7wp7RdcBBH8EP/aWcC9uGAhm6enYzDCHwQwjRWwyo0T8v7qb6Ow
	7aERx9tre0KO17fAAT0k5e73aTbkj3OR1gxhj/kDh6PLF08TgJmzYW228WaZ9RMiJV+XKSpXbJp3Z
	joYFVjC7b7f8/vSxuyFG0aupHDYfaXmu19l3pIOcQ3Oa3q7Qh6dtDJUqyTxdfbKT7DU3ajaK7pVQ5
	n5BdGl5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1towX4-0000000H4MN-4Ao7;
	Mon, 03 Mar 2025 03:31:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1towVU-0000000H3wl-29OR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 03:30:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 522NoUxZ009232;
	Mon, 3 Mar 2025 03:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hYAdSew6AptzJBVsbHhvRE
	pcJmARjrEFgChOrvn1g98=; b=P6YXCFTdM0F2R47QDe3L/Z9sXDejHL+qmFhq1J
	Quw5p+SscZ/tr/C3jXSlx0IKSUPOHVk9rKTVsS3MTUquKF8Pu3qpl3vku+Qo56jw
	QTHp9/SdkVRhhIU8P1ZGy1eQUSMb87fdi/soMruTyOu+Etc6mAlTWhglwznrxFZL
	8acSgpZcXnCk91e9QOF0t9ojVqJ/tsCWjPWGA1B7XehusNRWKr5ZAMtP2OuOR4w9
	QGFibJAdOx6FoMmcSZd7G71pPQr9wcPJU/KRJ8WR5WMOEsklp7NGU1LMl1gZRud3
	3kRmv17gIdFXUIi7b//XtKjkRdFDdu2QZt5k08EJbBwDUK7Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t95ufpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 03:29:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5233TtHv016864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 03:29:55 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Mar 2025 19:29:49 -0800
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v15 00/10] Coresight: Add Coresight TMC Control Unit driver
Date: Mon, 3 Mar 2025 11:29:21 +0800
Message-ID: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6hN2KhVmMiXIs-I1uw5g3xcvOyyf0Z5-
X-Proofpoint-GUID: 6hN2KhVmMiXIs-I1uw5g3xcvOyyf0Z5-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_193016_693908_B7F37D64 
X-CRM114-Status: GOOD (  32.19  )
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

From: Jie Gan <jie.gan@oss.qualcomm.com>

The Coresight TMC Control Unit(CTCU) device hosts miscellaneous configuration
registers to control various features related to TMC ETR device.

The CTCU device works as a helper device physically connected to the TMC ETR device.
---------------------------------------------------------
             |ETR0|             |ETR1|
              . \                 / .
              .  \               /  .
              .   \             /   .
              .    \           /    .
---------------------------------------------------
ETR0ATID0-ETR0ATID3     CTCU    ETR1ATID0-ETR1ATID3
---------------------------------------------------
Each ETR has four ATID registers with 128 bits long in total.
e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.

Based on the trace id which is programed in CTCU ATID register of
specific ETR, trace data with that trace id can get into ETR's buffer
while other trace data gets ignored. The number of CTCU ATID registers
depends on the number of defined TMC ETR devices. For example, two TMC
ETR devices need eight ATID registers. ETR0 with ETR0ATID0-ETR0ATID3
and ETR1 with ETR1ATID0-ETRATID3.

The significant challenge in enabling the data filter function is how
to collect the trace ID of the source device. The introduction of
trace_id callback function addresses this challenge. The callback function
collects trace ID of the device and return it back. The trace ID will be
stored in the structure called coresight_path and transmitted to helper
and sink devices.

The coresight_path structure is created to address how to transmit
parameters needs by coresight_enable_path/coresight_disbale_path
functions.

Here is the definition of the struct coresight_path:
/**
 * struct coresight_path - data needed by enable/disable path
 * @path:               path from source to sink.
 * @trace_id:           trace_id of the whole path.
 */
struct coresight_path {
        struct list_head                path;
        u8                              trace_id;
};

The atid_offset mentioned before is the offset to ATID register in CTCU
device.

Enabling the source device will configure one bit in the ATID register based
on its trace ID.
Disabling the source devices will reset the bit in the AITD register
based on its trace ID.

Useage:
Enable:
STM device with trace ID 5 and ETR0 is activated.
Bitmap before the enablement:
ETR0ATID0:
31..................543210
==========================
0000000000000000000000...0
==========================

Bitmap after the enablement:
31..................543210
==========================
0000000000000...0000100000
==========================

The bit 5 of the ETR0ATID0 register is configured to 1 when enabling the
STM device.

Disable:
STM device with trace ID 5 and ETR0 is activated.
Bitmap before the disablement:
ETR0ATID0:
31................6543210
=========================
000000000010111...0100000
=========================

Bitmap after the disablement
ETR0ATID0:
31................6543210
=========================
000000000010111...0000000
=========================

The bit 5 of the ETR0ATID0 register is reset to 0 when disabling the STM
device.

Sincere thanks to James Clark for providing an excellent idea to handle
the trace_id of the path.

---
Changes in V15:
1. Rebased on tag: next-20250228.
2. Optimize patch(2/10), add check process before using sink.
Link to V14 - https://lore.kernel.org/all/20250226041342.53933-1-quic_jiegan@quicinc.com/
---

---
Changes in V14:
1. Drop the reviewed-by tag for previous patch: Coresight-Introduce-a-new-struct-coresight_path
   due to a massive modification.
2. Split the patch, Coresight-Introduce-a-new-struct-coresight_path, into
   four patches.
   - Coresight-Introduce-a-new-struct-coresight_path
   - Coresight-Allocate-trace-ID-after-building-the-path
   - Coresight-Change-to-read-the-trace-ID-from-coresight_path
   - Coresight-Change-functions-to-accept-the-coresight_path
3. Change the type of the coresight_path_assign_trace_id function to void.
4. Change the type of the path_list from struct list_head * to struct list_head to avoid
   extra memory allocate/free.
5. Rename the file coresight-ctcu.c to coresight-ctcu-core.c to improve scalibility.
6. Add pm_ops for CTCU driver.
7. Rename the struct ctcu_atid_config to ctcu_etr_config to improve scalibility.
8. Optimize following functions of the CTCU driver to improve readability.
   - ctcu_program_atid_register
   - __ctcu_set_etr_traceid
9. Change the way to get the port number. The new solution is searching
   the sink device from CTCU's view.
10. Add desc.access for CTCU driver.
Link to V13 - https://lore.kernel.org/linux-arm-msm/20250221060543.2898845-1-quic_jiegan@quicinc.com/
---

---
Changes in V13:
1. Move the trace_id callback to coresight_ops to simplify the code.
Link to V12 - https://lore.kernel.org/linux-arm-msm/20250217093024.1133096-1-quic_jiegan@quicinc.com/
---

---
Changes in V12:
1. Update the method for allocating trace_id for perf mode.
Link to V11 - https://lore.kernel.org/linux-arm-msm/20250214024021.249655-1-quic_jiegan@quicinc.com/
---

---
Changes in V11:
1. Add reviewed-by tag to patch(2/7), (4/7), (6/7). Patch(3/7) is
   contributed by James, so didnot add reviewed-by tag of James.
2. Fix warning reported by kernel bot and verified with build(W=1).
3. Restore to the original logic that responsible for allocate trace_id
   of ETM device in perf mode according to James' comment.
Link to V10 - https://lore.kernel.org/linux-arm-msm/20250207064213.2314482-1-quic_jiegan@quicinc.com/
---

---
Changes in V10:
1. Introduce a new API to allocate and read trace_id after path is built.
2. Introduce a new API to allocate and read trace_id of ETM device.
3. Add a new patch: [PATCH v10 3/7] Coresight: Use coresight_etm_get_trace_id() in traceid_show()
4. Remove perf handle from coresight_path.
5. Use u8 instead of atomic_t for traceid_refcnt.
6. Optimize the part of code in CTCU drvier that is responsible for program atid register.
Link to V9 - https://lore.kernel.org/all/20250124072537.1801030-1-quic_jiegan@quicinc.com/

Changes in V9:
1. Rebased on tag next-20250113.
2. Separate the previous trace_id patch (patch 2/5 Coresight: Add trace_id function to
   retrieving the trace ID) into two patches.
3. Introduce a new struct coresight_path instead of cs_sink_data which was
   created in previous version. The coresight_path will be initialized
   and constructed in coresight_build_path function and released by
   coresight_release_path function.
   Detail of the struct coresight_path is shown below:
/**
 * struct coresight_path - data needed by enable/disable path
 * @path:               path from source to sink.
 * @trace_id:           trace_id of the whole path.
 */
struct coresight_path {
        struct list_head                *path;
        u8                              trace_id;
};

4. Introduce an array of atomic in CTCU driver to represent the refcnt or each
   enabled trace_id for each sink. The reason is there is a scenario that more
   than one TPDM device physically connected to the same TPDA device has
   been enabled. The CTCU driver must verify the refcnt before resetting the
   bit of the atid register according to the trace_id of the TPDA device.
5. Remove redundant codes in CTCU driver.
6. Add reviewed-by tag to the commit message for APB clock path(patch
   1/5).
Link to V8 - https://lore.kernel.org/all/20241226011022.1477160-1-quic_jiegan@quicinc.com/

Changes in V8:
1. Rebased on tag next-20241220.
2. Use raw_spinlock_t instead of spinlock_t.
3. Remove redundant codes in CTCU driver:
   - Eliminate unnecessary parameter validations.
   - Correct log level when an error occurs.
   - Optimize codes.
4. Correct the subject prefix for DT patch.
5. Collected reviewed-by tag from Konrad Dybcib for DT patch.
Link to V7 - https://lore.kernel.org/all/20241210031545.3468561-1-quic_jiegan@quicinc.com/

Changes in V7:
1. Rebased on tag next-20241204.
2. Fix format issue for dts patch.
   - Padding the address part to 8 digits
Link to V6 - https://lore.kernel.org/linux-arm-msm/20241009112503.1851585-1-quic_jiegan@quicinc.com/

Changes in V6:
1. Collected reviewed-by tag from Rob for dt-binding patch.
2. Rebased on tag next-20241008.
3. Dropped all depends-on tags.
Link to V5 - https://lore.kernel.org/linux-arm-msm/20240909033458.3118238-1-quic_jiegan@quicinc.com/

Changes in V5:
1. Fix the format issue for description paragrah in dt binding file.
2. Previous discussion for why use "in-ports" property instead of "ports".
Link to V4 - https://lore.kernel.org/linux-arm-msm/20240828012706.543605-1-quic_jiegan@quicinc.com/

Changes in V4:
1. Add TMC description in binding file.
2. Restrict the number of ports for the CTCU device to a range of 0 to 1 in the binding file,
   because the maximum number of CTCU devices is 2 for existing projects.
Link to V3 - https://lore.kernel.org/linux-arm-kernel/20240812024141.2867655-1-quic_jiegan@quicinc.com/

Changes in V3:
1. Rename the device to Coresight TMC Control Unit(CTCU).
2. Introduce a new way to define the platform related configs. The new
   structure, qcom_ctcu_config, is used to store configurations specific
   to a platform. Each platform should have its own qcom_ctcu_config structure.
3. In perf mode, the ETM devices allocate their trace IDs using the
   perf_sink_id_map. In sysfs mode, the ETM devices allocate their trace
   IDs using the id_map_default.
4. Considering the scenario where both ETR devices might be enabled simultaneously
   with multiple sources, retrieving and using trace IDs instead of id_map is more effective
   for the CTCU device in sysfs mode. For example, We can configure one ETR as sink for high
   throughput trace data like ETM and another ETR for low throughput trace data like STM.
   In this case, STM data won’t be flushed out by ETM data quickly. However, if we use id_map to
   manage the trace IDs, we need to create a separate id_map for each ETR device. Addtionally, We
   would need to iterate through the entire id_map for each configuration.
5. Add support for apb's clock name "apb". If the function fails to obtain the clock with
   the name "apb_pclk", it will attempt to acquire the clock with the name "apb".
Link to V2 - https://lore.kernel.org/linux-arm-msm/20240705090049.1656986-1-quic_jiegan@quicinc.com/T/#t

Changes in V2:
1. Rename the device to Coresight Control Unit.
2. Introduce the trace_id function pointer to address the challeng how to
   properly collect the trace ID of the device.
3. Introduce a new way to define the qcom,ccu-atid-offset property in
device tree.
4. Disabling the filter function blocked on acquiring the ATID-offset,
   which will be addressed in a separate patch once it’s ready.
Link to V1 - https://lore.kernel.org/lkml/20240618072726.3767974-1-quic_jiegan@quicinc.com/T/#t
---

James Clark (1):
  Coresight: Use coresight_etm_get_trace_id() in traceid_show()

Jie Gan (9):
  Coresight: Add support for new APB clock name
  Coresight: Add trace_id function to retrieving the trace ID
  Coresight: Introduce a new struct coresight_path
  Coresight: Allocate trace ID after building the path
  Coresight: Change to read the trace ID from coresight_path
  Coresight: Change functions to accept the coresight_path
  dt-bindings: arm: Add Coresight TMC Control Unit hardware
  Coresight: Add Coresight TMC Control Unit driver
  arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |  84 +++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 153 ++++++++
 drivers/hwtracing/coresight/Kconfig           |  12 +
 drivers/hwtracing/coresight/Makefile          |   2 +
 drivers/hwtracing/coresight/coresight-core.c  | 125 +++++--
 .../hwtracing/coresight/coresight-ctcu-core.c | 326 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu.h  |  39 +++
 drivers/hwtracing/coresight/coresight-dummy.c |  15 +-
 .../hwtracing/coresight/coresight-etm-perf.c  |  27 +-
 .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
 drivers/hwtracing/coresight/coresight-etm.h   |   1 -
 .../coresight/coresight-etm3x-core.c          |  55 +--
 .../coresight/coresight-etm3x-sysfs.c         |   3 +-
 .../coresight/coresight-etm4x-core.c          |  55 +--
 .../coresight/coresight-etm4x-sysfs.c         |   4 +-
 drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
 drivers/hwtracing/coresight/coresight-priv.h  |  14 +-
 drivers/hwtracing/coresight/coresight-stm.c   |  13 +-
 drivers/hwtracing/coresight/coresight-sysfs.c |  17 +-
 drivers/hwtracing/coresight/coresight-tpda.c  |  11 +
 drivers/hwtracing/coresight/coresight-tpdm.c  |   2 +-
 include/linux/coresight.h                     |  27 +-
 22 files changed, 827 insertions(+), 161 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-core.c
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h

-- 
2.34.1


