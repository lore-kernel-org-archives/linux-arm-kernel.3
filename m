Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAA9D0BB66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=722sH8vlS+jg6Q7ivA83EhL1BYZ69kLJVl+Sto7FhzM=; b=zG1gNDi4TtXvW5zFZmBxzYF5t+
	gdsod1yR6Lcgkl9Ww8Cf4FqHtBrgzkkUZqliEX2sL9wjA2X7ix1Is+Ckl37G/Bs0ldgwMePe6mcK9
	GVe29nkGRAWydH36zZX7XY9GPv70KIMwFEoe7MhDiJrnOANE5dIs0zRTkDGtL96QdCUdU2A5Mdfbl
	VxuLX4eZEvlDDIDlQgxMvjsfZ+/cHFPix9kUH5r/PAER5rJZVYGMXv/xi/GRMLrofDcCj59ZrUzhW
	jSwyeK00ROlPuVevrLtqmwvT1kOo90G6ak4yICc/9dLBNzF9Hsk4huor5qpbBq76lwMUWH2fbfkLB
	nhB8BLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rxy-0000000H1wn-2NAs;
	Thu, 24 Oct 2024 07:09:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rj5-0000000GzCC-1u2j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:53:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NNbkMD005001;
	Thu, 24 Oct 2024 06:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=722sH8vlS+jg6Q7ivA83EhL1BYZ69kLJVl+Sto7FhzM=; b=pe
	KqNvVrO+ic2cgkftqoAC9DKbiUloX8MwB1rBQp5lpjiyirEKEuHS3IgvtgdLbQDe
	KflMF+sixdN8rC2UYOyQCexbOI08dn5V07ys0LHNLXzgl2z0MjYQWc4utgKu4DQ8
	B25SaI3r2drYZQaahAPrsMkt7uN+TndYjTzVC97GUofUpbr4IU5DIHci/1UFYHVZ
	V91gZCIHBhmPQBOi1POK/GRuD3XeYdxcbt+Mz0sYMVcTekauug5wXeP4Hm44eGt1
	fmGY2b2xCsRQduT3N4146Y8V00ED/rfbbsQaA7UxHtG9l2CTsXfNC0fCwbw9KDsk
	BlQ2BPlByQEBJFjVUW/A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em684qdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 06:53:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49O6rROo028969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 06:53:27 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Oct 2024 23:53:24 -0700
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
Subject: [PATCH v4 0/4] source filtering for multi-port output
Date: Thu, 24 Oct 2024 14:53:02 +0800
Message-ID: <20241024065306.14647-1-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zIkvlmfqhECPK3qMKTdIgbsqYC_OSXli
X-Proofpoint-GUID: zIkvlmfqhECPK3qMKTdIgbsqYC_OSXli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_235343_670744_D9090205 
X-CRM114-Status: GOOD (  22.70  )
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
  coresight: Add support for trace filtering by source
  coresight: Add a helper to check if a device is source
  coresight-tpda: Optimize the function of reading element size

 .../arm/arm,coresight-static-replicator.yaml  |  19 ++-
 drivers/hwtracing/coresight/coresight-core.c  | 116 +++++++++++++++---
 .../hwtracing/coresight/coresight-platform.c  |  18 +++
 drivers/hwtracing/coresight/coresight-tpda.c  |  13 +-
 include/linux/coresight.h                     |  12 +-
 5 files changed, 155 insertions(+), 23 deletions(-)

-- 
2.17.1


