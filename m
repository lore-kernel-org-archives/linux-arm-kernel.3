Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93110E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 10:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N8JLusC+rWUZfPPXrdSX0CnPNMcJ2qdtDts6a60BTFQ=; b=fBGNnY1Da40B1Qfk2La+AgfsQs
	5+lJz3tDKxYGk2dPFjZ9aXL//cE02DGjZq4qt2349Iuq1zbsnoRxk/yk9FdU5J7GzdERu+k5Bz2wf
	vjsqT0JzmKF+FKNcnP9oNcKLvnaw7fFnlAj0/uheOUwemPWitcnf3xrmaco6ilwCssRb66XX4QEGt
	goFX+wgoBfTVqgJXHSdLI7hkaAotalDvJ/z1poEtl/+4y2hUAFF0r89xahAHZpauULuLMKRGBVdBH
	amp+Bh0BfpFioRZvoMruiLUGP+0Yrw901b01kvRs7wDyg59Qk3o9ze73czjzofmmm1sLMR8vBfsbL
	vv7H1k6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2cW-00000003Nis-2FQZ;
	Fri, 13 Dec 2024 10:10:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2bQ-00000003NUK-2K1i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 10:08:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD8aGeN022795;
	Fri, 13 Dec 2024 10:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=N8JLusC+rWUZfPPXrdSX0CnPNMcJ2qdtDts6a60BTFQ=; b=TK
	aNKNCXHhDgb1Buo+Jj3lq2+UBZwBC+5VOnWI7ODR0U0SCCutnggX8T4lKYtd8X+6
	hzwyGk7KsJ2HPDubBggfMNJ1XzZgqaC0Wj9fTGhahfWTe6acyag2691dYuOvVi6h
	d6gasLUhgF78715MpHmmcHhPZfHwLYdlpErCfcRrYskL2r+M49ewdw7Z9LwDkKDo
	Bw66Zs3cIf0f4vyDCcNVs8NykqsKbaTyc2oVKflH8qQWqskrGTFfcvtcs0bDpzrg
	PVQt4EDIxo6kAkfzBuPDHpG7idWs8B/7RjXBLKjHUJZSDivbnGBCvy1NmVsSuTAn
	bKDeHzdyf/1CJQTOMOOA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g4wna19x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:08:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDA8bRZ020692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:08:37 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 02:08:34 -0800
From: Tao Zhang <quic_taozha@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: Tao Zhang <quic_taozha@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v7 0/4] source filtering for multi-port output
Date: Fri, 13 Dec 2024 18:07:27 +0800
Message-ID: <20241213100731.25914-1-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -nC0BzTkLZyvSKudH8jLuuCyzS3IXKx4
X-Proofpoint-GUID: -nC0BzTkLZyvSKudH8jLuuCyzS3IXKx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_020856_598890_BFE59544 
X-CRM114-Status: GOOD (  25.13  )
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

In our hardware design, by combining a funnel and a replicator, it
implement a hardware device with one-to-one correspondence between
output ports and input ports. The programming usage on this device
is the same as funnel. The software uses a funnel and a static
replicator to implement the driver of this device. Since original
funnels only support a single output connection and original
replicator only support a single input connection, the code needs
to be modified to support this new feature. The following is a
typical topology diagram of multi-port output mechanism.
|----------|     |---------|     |----------|   |---------|
|  TPDM 0  |     | Source0 |     | Source 1 |   | TPDM 1  |
|----------|     |---------|     |----------|   |---------|
      |                |                |             |
      |                |                |             |
      |      --------- |                |             |
      |      |                          |             |
      |      |                          |             |
      |      |                          |             |
   \-------------/ ----------------------             |
    \  Funnel 0 /  |                                  |
     -----------   |     ------------------------------
          |        |     |
          |        |     |
        \------------------/
         \    Funnel 1    /     ----|
          \--------------/          |
                  |                 |----> Combine a funnel and a
                  |                 |      static replicator
          /-----------------\       |
         /    replicator 0   \  ----|
        /---------------------\
             |     |      |
             |     |      |-----------|
             |     |---------|        |
             |               |TPDM0   |TPDM1
             |            \-----------------/
             |             \   TPDA 0      /
             |              \-------------/
             |                    |
             |                    |
             |Source0/1           |
          \-------------------------------/
           \           Funnel 2          /
            \---------------------------/

Changes in V7:
1. Correct the use of incorrect characters.
-- Suzuki K Poulose
2. Rebase the series on v6.13-rc1
-- Suzuki K Poulose

Changes in V6:
1. Optimize the prompt content of the warning log
when the filter handle is not a trace source.
-- Suzuki K Poulose
2. Reset the filter device and fwnode if it is not
a trace source.
-- Suzuki K Poulose

Changes in V5:
1. Replace "filter-src" with "filter-source" in the
dt-binding document.
-- Suzuki K Poulose
2. Optimize the comments of the patch "coresight:
Add support for trace filtering by source" due to bad
example.
-- Suzuki K Poulose
3. Correct spelling errors in the patch "coresight:
Add support for trace filtering by source".
-- Suzuki K Poulose
4. Optimize the function "coresight_blocks_source".
-- Suzuki K Poulose
5. Add { } in the function "of_coresight_parse_endpoint".
-- Suzuki K Poulose
6. Adjust the order of the patches.
-- Suzuki K Poulose
7. Adjust the alignment in "coresight-platform.c".
-- Suzuki K Poulose

Changes in V4:
1. Use "coresight_get_source(path)" in the function
"coresight_disable_path_from" instead of explicitly
passing the source.
-- Suzuki K Poulose
2. Optimize the order of the input parameters for
"_coresight_build_path".
-- Suzuki K Poulose
3. Reuse the method "coresight_block_source" in
"_coresight_build_path".
-- Suzuki K Poulose
4. Remove the unnecessary () in "coresight_build_path".
-- Suzuki K Poulose
5. Add a helper to check if a device is SOURCE.
-- Suzuki K Poulose
6. Adjust the posistion of setting "still_orphan" in
"coresight_build_path".
-- Suzuki K Poulose

Changes in V3:
1. Rename the function "coresight_source_filter" to
"coresight_block_source". And refine this function.
-- Suzuki K Poulose
2. Rename the parameters of the function
"coresight_find_out_connection" to avoid confusion.
-- Suzuki K Poulose
3. Get the source of path in "coresight_enable_path" and
"coresight_disable_path".
-- Suzuki K Poulose
4. Fix filter source device before skip the port in
"coresight_orphan_match".
-- Suzuki K Poulose
5. Make sure the device still orphan if whter is a filter
source firmware node but the filter source device is null.
-- Suzuki K Poulose
6. Walk through the entire coresight bus and fixup the
"filter_src_dev" if the source is being removed.
-- Suzuki K Poulose
7. Refine the commit description of patch#2.
-- Suzuki K Poulose
8. Fix the warning reported by kernel test robot.
-- kernel test robot.
9. Use the source device directly if the port has a
hardcoded filter in "tpda_get_element_size".
-- Suzuki K Poulose

Changes in V2:
1. Change the reference for endpoint property in dt-binding.
-- Krzysztof Kozlowski
2. Change the property name "filter_src" to "filter-src".
-- Krzysztof Kozlowski
3. Fix the errors in running 'make dt_binding_check'.
-- Rob Herring
4. Pass in the source parameter instead of path.
-- Suzuki K Poulose
5. Reset the "filter_src_dev" if the "src" csdev is being removed.
-- Suzuki K Poulose
6. Add a warning if the "filter_src_dev" is of not the
type DEV_TYPE_SOURCE.
-- Suzuki K Poulose
7. Optimize the procedure for handling all possible cases.
-- Suzuki K Poulose

Changes in V1:
1. Add a static replicator connect to a funnel to implement the
correspondence between the output ports and the input ports on
funnels.
-- Suzuki K Poulose
2. Add filter_src_dev and filter_src_dev phandle to
"coresight_connection" struct, and populate them if there is one.
-- Suzuki K Poulose
3. To look at the phandle and then fixup/remove the filter_src
device in fixup/remove connections.
-- Suzuki K Poulose
4. When TPDA reads DSB/CMB element size, it is implemented by
looking up filter src device in the connections.
-- Suzuki K Poulose

Tao Zhang (4):
  dt-bindings: arm: qcom,coresight-static-replicator: Add property for
    source filtering
  coresight: Add a helper to check if a device is source
  coresight: Add support for trace filtering by source
  coresight-tpda: Optimize the function of reading element size

 .../arm/arm,coresight-static-replicator.yaml  |  19 ++-
 drivers/hwtracing/coresight/coresight-core.c  | 113 +++++++++++++++---
 .../hwtracing/coresight/coresight-platform.c  |  21 ++++
 drivers/hwtracing/coresight/coresight-tpda.c  |  13 +-
 include/linux/coresight.h                     |  12 +-
 5 files changed, 155 insertions(+), 23 deletions(-)

-- 
2.17.1


