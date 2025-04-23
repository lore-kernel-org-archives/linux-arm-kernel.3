Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B36C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h1+xIdh8PwSf8XcE/S5ee6JWcRfyRXRqsc1xbywA534=; b=jP/+qOuUpv07Mh6PC1ejIdqN6R
	eBtlks12v1oWV8rAUQfPIb2k9/96FSg3WxsIs71TB2Ej9jgLXTBJDsIfMj5AzRElW9IBnsusT7uf0
	Cr7BHHPRLhRgAx3jCu1iEsfz9J+cXQ1PW7JEw7nOluUF7zu+bhbTFC28COXHqn1/rBIjh8lKFzaZ1
	8OfC0XmVzFsaS/ye5cUtuzhrM3DZZ74xhfe1u/nXq/5K6iSywsdPxN6VPfToONN7wMGbc9RTQhbVf
	ARbI0+jK64PUAINsEc0RvbMJVXE78bJ3QzTbtN4uwRD1Hc6HJK7XXWxiYVSlanGQoAR5wS7bLBgGF
	ZBGiaDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Xp1-0000000AFLp-1e3U;
	Wed, 23 Apr 2025 10:59:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7X4u-0000000A7dm-2sZc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Apr 2025 10:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=h1+xIdh8PwSf8XcE/S5ee6JWcRfyRXRqsc1xbywA534=; b=lNmSw4kl7pLVbEoNaGixywGJcB
	qwvDR53alKofgQHz/o/C6DbTtYGGS22YOCbptVYKXdWpx41axh61iKlYaK0A0zbmhpn5NirpDPHYD
	1A/5ng2xsXYY3GXeHOJZ1x5ESlHrFGOfvtwdRR53ZdZU2uxezfK8ZFgIUsXCQ4WWbV2Ll4Skbe9oh
	CcEPfOQgigXnM/IUvHH8EhKTuHv9iVh4WW15lNEQD15gRdcw0L4JQdLk8WMvP3Dq2+uYFg1MHTZmo
	78InqPOaCqxEbxIl9g+cGRj3hd2c528N1aTG645z3yqcy5h55CT+OBKpmifOj5axsewWy41fShLV9
	ssUMy2uw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7X4q-0000000BPQC-3MFU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 10:11:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i9XA022005;
	Wed, 23 Apr 2025 10:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h1+xIdh8PwSf8XcE/S5ee6
	JWcRfyRXRqsc1xbywA534=; b=VamE+QHQIaedYjFZjq4i72IHG3TjuhEReBI+LH
	1YtDNBx1IsKykbiRnqP8fPAQCM6tTwSlfh0mrtMhMzg4cwB5KuDkIIFgKP9/JfY5
	OAlK/jbMYhCB2d3xPbJsAm/J8p/6/9UMC7yzJ5/im86NsglYybnqByFhGOM4s0EN
	2kizQvZ4m8HYrUDfaRfvAysG3GV/tjdoJ7Ieh8EdaoBaxFWZhW57C8z4OEuqfEwH
	meMH4ica4gqjWP/ht5WQeabMQgXUMt9m2SqKy4SZCofZjJUJ5ALaTjhg+vb5OMLO
	yJyM45IVK1n8HsEFCaXCFTBoiqWvRBtSD3xQ6SM+HtRe/puQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh11r43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 10:11:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NABDZN032108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 10:11:13 GMT
Received: from ap-cloud-sh02-lnx.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 03:11:10 -0700
From: Songwei Chai <quic_songchai@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 0/7] Provides support for Trigger Generation Unit
Date: Wed, 23 Apr 2025 18:10:47 +0800
Message-ID: <20250423101054.954066-1-quic_songchai@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SDMHaC_dwX9_pyinL1afRLsVzdBEGv_6
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6808bcc2 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NA5x112JJD7sSJXOgcYA:9
 a=5qa3DnQsBkHZl6hj:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SDMHaC_dwX9_pyinL1afRLsVzdBEGv_6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3MCBTYWx0ZWRfX4BO7cTGSQ4R4 qswALAm3gWeV98hn3Dl3zOMdMw/KTrd8IY36f+S6gOPVBwgOSDb3IRReD+XskY5Ryr7EtlxibTN qol8uH0hJ/D8szWx5BcSjyGZyn0WrQJRPwuKb0BoNzO+iqkYreG6bb/osA03CJW6E4FDjelVj1Q
 uYhsnOyEvLWrhaw4XwFtMo5cul84f05PhcnX2ZdMJig4R/LA8cECxFIpsvbGFZauIsmjbLgCI3d EMX9HE0EF0ret6I6fIhK3q3KejFabdir4ohdZ4EGeGQ7u9kW9Lug32Sn7IfrpDdChNsQ3nADwDw f3dPdF6a7eSJ1gzVmSdrsHgIpozdAPTTfG6xtitZvXo6Mw7jLxb2Ld2/1F8uZOMez8CCl/3R8eo
 73Q+pwbQ1krG5ZpNOh90Tha5izV3vOJBPSEj6dI5DwtIEswziORVy9nRNxVlyeAbf7kAefo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_07,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_111137_393374_0DFBE8D4 
X-CRM114-Status: GOOD (  17.35  )
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

Provide support for the TGU (Trigger Generation Unit), which can be
utilized to sense a plurality of signals and create a trigger into
the CTI or generate interrupts to processors once the input signal
meets the conditions. We can treat the TGU’s workflow as a flowsheet,
it has some “steps” regions for customization. In each step region,
we can set the signals that we want with priority in priority_group, set
the conditions in each step via condition_decode, and set the resultant
action by condition_select. Meanwhile, some TGUs (not all) also provide
timer/counter functionality. Based on the characteristics described
above, we consider the TGU as a helper in the CoreSight subsystem.
Its master device is the TPDM, which can transmit signals from other
subsystems, and we reuse the existing ports mechanism to link the TPDM to
the connected TGU.

Here is a detailed example to explain how to use the TGU:

In this example, the TGU is configured to use 2 conditions, 2 steps, and
the timer. The goal is to look for one of two patterns which are generated
from TPDM, giving priority to one, and then generate a trigger once the
timer reaches a certain value. In other words, two conditions are used
for the first step to look for the two patterns, where the one with the
highest priority is used in the first condition. Then, in the second step,
the timer is enabled and set to be compared to the given value at each
clock cycle. These steps are better shown below.

            |-----------------|
            |                 |
            |       TPDM      |
            |                 |
            |-----------------|
                     |
                     |
  --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ------
  |                  |                                                 |
  |                  |                          |--------------------| |
  |    |---- --->    |                          |  Go to next steps  | |
  |    |             |                |--- ---> |  Enable timer      | |
  |    |             v                |         |                    | |
  |    |    |-----------------|       |         |--------------------| |
  |    |    |                 |  Yes  |                    |           |
  |    |    |   inputs==0xB   | ----->|                    | <-------- |
  |    |    |                 |       |                    |      No | |
  | No |    |-----------------|       |                    v         | |
  |    |             |                |          |-----------------| | |
  |    |             |                |          |                 | | |
  |    |             |                |          |      timer>=3   |-- |
  |    |             v                |          |                 |   |
  |    |    |-----------------|       |          |-----------------|   |
  |    |    |                 |  Yes  |                    |           |
  |    |--- |   inputs==0xA   | ----->|                    | Yes       |
  |         |                 |                            |           |
  |         |-----------------|                            v           |
  |                                              |-----------------|   |
  |                                              |                 |   |
  |                                              |      Trigger    |   |
  |                                              |                 |   |
  |                                              |-----------------|   |
  |  TGU                                                   |           |
  |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- --- -- |
                                                           |
                                                           v
                                                  |-----------------|
                                                  |The controllers  |
                                                  |which will use   |
                                                  |triggers further |
                                                  |-----------------|

steps:
       1. Reset TGU /*it will disable tgu and reset dataset*/
       - echo 1 > /sys/bus/coresight/devices/<tgu-name>/reset_tgu

       2. Set the pattern match for priority0 to 0xA = 0b1010 and for
          priority 1 to 0xB = 0b1011.
       - echo 0x11113232 > /sys/bus/coresight/devices/<tgu-name>/step0_priority0/reg0
       - echo 0x11113233 > /sys/bus/coresight/devices/<tgu-name>/step0_priority1/reg0

       Note:
            Bit distribution diagram for each priority register
    |-------------------------------------------------------------------|
    |   Bits          |       Field Nam   |    Description              |
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     29:28       |   SEL_BIT7_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     25:24       |   SEL_BIT6_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     21:20       |   SEL_BIT5_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     17:16       |   SEL_BIT4_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     13:12       |   SEL_BIT3_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      9:8        |   SEL_BIT2_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      5:4        |  SEL_BIT1_TYPE2   | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      1:0        |  SEL_BIT0_TYPE2   | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
        These bits are used to identify the signals we want to sense, with
        a maximum signal number of 140. For example, to sense the signal
        0xA (binary 1010), we set the value of bits 0 to 13 to 3232, which
        represents 1010. The remaining bits are set to 1, as we want to use
        AND gate to summarize all the signals we want to sense here. For
        rising or falling edge detection of any input to the priority, set
        the remaining bits to 0 to use an OR gate.

       3. look for the pattern for priority_i i=0,1.
       - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_decode/reg0
       - echo 0x30 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_decode/reg1

    |-------------------------------------------------------------------------------|
    |   Bits          |    Field Nam        |            Description                |
    |-------------------------------------------------------------------------------|
    |                 |                     |For each decoded condition, this       |
    |      24         |       NOT           |inverts the output. If the condition   |
    |                 |                     |decodes to true, and the NOT field     |
    |                 |                     |is '1', then the output is NOT true.   |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |      21         |  BC0_COMP_ACTIVE    |comparator will be actively included in|
    |                 |                     |the decoding of this particular        |
    |                 |                     |condition.                             |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |                 |                     |comparator will need to be 1 to affect |
    |      20         |   BC0_COMP_HIGH     |the decoding of this condition.        |
    |                 |                     |Conversely, a '0' here requires a '0'  |
    |                 |                     |from the comparator                    |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |      17         |                     |comparator will be actively included in|
    |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
    |                 |                     |condition.                             |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |                 |                     |comparator will need to be 1 to affect |
    |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
    |                 |                     |condition.Conversely, a 0 here         |
    |                 |                     |requires a '0' from the comparator     |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |OR logic will be actively              |
    |     4n+3        | Priority_n_OR_ACTIVE|included in the decoding of            |
    |                 |    (n=0,1,2,3)      |this particular condition.             |
    |                 |                     |                                       |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |will need to be '1' to affect the      |
    |     4n+2        |  Priority_n_OR_HIGH |decoding of this particular            |
    |                 |    (n=0,1,2,3)      |condition. Conversely, a '0' here      |
    |                 |                     |requires a '0' from Priority_n OR logic|
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |AND logic will be actively             |
    |     4n+1        |Priority_n_AND_ACTIVE|included in the decoding of this       |
    |                 |  (n=0,1,2,3)        |particular condition.                  |
    |                 |                     |                                       |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |AND logic will need to be '1' to       |
    |      4n         | Priority_n_AND_HIGH |affect the decoding of this            |
    |                 |   (n=0,1,2,3)       |particular condition. Conversely,      |
    |                 |                     |a '0' here requires a '0' from         |
    |                 |                     |Priority_n AND logic.                  |
    |-------------------------------------------------------------------------------|
        Since we use `priority_0` and `priority_1` with an AND output in step 2, we set `0x3`
        and `0x30` here to activate them.

       4. Set NEXT_STEP = 1 and TC0_ENABLE = 1 so that when the conditions
          are met then the next step will be step 1 and the timer will be enabled.
       - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_select/reg0
       - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_condition_select/reg1

        |-----------------------------------------------------------------------------|
        |   Bits          |       Field Nam   |            Description                |
        |-----------------------------------------------------------------------------|
        |                 |                   |This field defines the next step the   |
        |    18:17        |     NEXT_STEP     |TGU will 'goto' for the associated     |
        |                 |                   |Condition and Step.                    |
        |-----------------------------------------------------------------------------|
        |                 |                   |For each possible output trigger       |
        |    13           |     TRIGGER       |available, set a '1' if you want       |
        |                 |                   |the trigger to go active for the       |
        |                 |                   |associated condition and Step.         |
        |-----------------------------------------------------------------------------|
        |                 |                   |This will cause BC0 to increment if the|
        |    9            |     BC0_INC       |associated Condition is decoded for    |
        |                 |                   |this step.                             |
        |-----------------------------------------------------------------------------|
        |                 |                   |This will cause BC0 to decrement if the|
        |    8            |     BC0_DEC       |associated Condition is decoded for    |
        |                 |                   |this step.                             |
        |-----------------------------------------------------------------------------|
        |                 |                   |This will clear BC0 count value to 0 if|
        |    7            |     BC0_CLEAR     |the associated Condition is decoded    |
        |                 |                   |for this step.                         |
        |-----------------------------------------------------------------------------|
        |                 |                   |This will cause TC0 to increment until |
        |    3            |     TC0_ENABLE    |paused or cleared if the associated    |
        |                 |                   |Condition is decoded for this step.    |
        |-----------------------------------------------------------------------------|
        |                 |                   |This will cause TC0 to pause until     |
        |    2            |     TC0_PAUSE     |enabled if the associated Condition    |
        |                 |                   |is decoded for this step.              |
        |-----------------------------------------------------------------------------|
        |                 |                   |This will clear TC0 count value to 0   |
        |    1            |     TC0_CLEAR     |if the associated Condition is         |
        |                 |                   |decoded for this step.                 |
        |-----------------------------------------------------------------------------|
        |                 |                   |This will set the done signal to the   |
        |    0            |     DONE          |TGU FSM if the associated Condition    |
        |                 |                   |is decoded for this step.              |
        |-----------------------------------------------------------------------------|
        Based on the distribution diagram, we set `0x20008` for `priority0` and `priority1` to
        achieve "jump to step 1 and enable TC0" once the signal is sensed.

       5. activate the timer comparison for this step.
       -  echo 0x30000  > /sys/bus/coresight/devices/<tgu-name>/step1_condition_decode/reg0

        |-------------------------------------------------------------------------------|
        |                 |                     |When '1' the output from the associated|
        |      17         |                     |comparator will be actively included in|
        |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
        |                 |                     |condition.                             |
        |-------------------------------------------------------------------------------|
        |                 |                     |When '1' the output from the associated|
        |                 |                     |comparator will need to be 1 to affect |
        |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
        |                 |                     |condition.Conversely, a 0 here         |
        |                 |                     |requires a '0' from the comparator     |
        |-------------------------------------------------------------------------------|
        Accroding to the decode distribution diagram , we give 0x30000 here to set 16th&17th bit
        to enable timer comparison.

       6. Set the NEXT_STEP = 0 and TC0_PAUSE = 1 and TC0_CLEAR = 1 once the timer
          has reached the given value.
       - echo 0x6 > /sys/bus/coresight/devices/<tgu-name>/step1_condition_select/reg0

       7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
          i.e. when the timer reaches 3.
       - echo 0x2000 > /sys/bus/coresight/devices/<tgu-name>/step1_condition_select/default

        Note:
            1. 'default' register allows for establishing the resultant action for
            the default condition

            2. Trigger:For each possible output trigger available from
            the Design document, there are three triggers: interrupts, CTI,
            and Cross-TGU mapping.All three triggers can occur, but
            the choice of which trigger to use depends on the user's
            needs.

       8. Compare the timer to 3 in step 1.
       - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step1_timer/reg0

       9. enale tgu
       - echo 1 > /sys/bus/coresight/devices/<tgu-name>/enable_tgu

---
Link to V3: https://lore.kernel.org/all/20250227092640.2666894-1-quic_songchai@quicinc.com/

Changes in V4:
- Add changlog in coverletter.
- Correct 'year' in Copyright in patch1.
- Correct port mechansim description in patch1.
- Remove 'tgu-steps','tgu-regs','tgu-conditions','tgu-timer-counters' from dt-binding
and set them through reading DEVID register as per Mike's suggestion.
- Modify tgu_disable func to make it have single return point in patch2 as per
Mike's suggestion.
- Use sysfs_emit in enable_tgu_show func in ptach2.
- Remove redundant judgement in enable_tgu_store in patch2.
- Correct typo in description in patch3.
- Set default ret as SYSFS_GROUP_INVISIBLE, and returnret at end in pacth3 as
per Mike's suggestion.
- Remove tgu_dataset_ro definition in patch3
- Use #define constants with explanations of what they are rather than
arbitrary magic numbers in patch3 and patch4.
- Check -EINVAL before using 'calculate_array_location()' in array in patch4.
- Add 'default' in 'tgu_dataset_show''s switch part in patch4.
- Document the value needed to initiate the reset in pacth7.
- Check "value" in 'reset_tgu_store' and bail out with an error code if 0 in patch7.
- Remove dev_dbg in 'reset_tgu_store' in patch7.
---
Link to V2: https://lore.kernel.org/all/20241010073917.16023-1-quic_songchai@quicinc.com/

Changes in V3:
- Correct typo and format in dt-binding in patch1
- Rebase to the latest kernel version
---
Link to V1: https://lore.kernel.org/all/20240830092311.14400-1-quic_songchai@quicinc.com/

Changes in V2:
 - Use real name instead of login name,
 - Correct typo and format in dt-binding and code.
 - Bring order in tgu_prob(declarations with and without assignments) as per
Krzysztof's suggestion.
 - Add module device table in patch2.
 - Set const for tgu_common_grp and tgu_ids in patch2.
 - Initialize 'data' in tgu_ids to fix the warning in pacth2.
---

Songwei Chai (7):
  dt-bindings: arm: Add support for Coresight TGU trace
  coresight: Add coresight TGU driver
  coresight-tgu: Add signal priority support
  coresight-tgu: Add TGU decode support
  coresight-tgu: add support to configure next action
  coresight-tgu: add timer/counter functionality for TGU
  coresight-tgu: add reset node to initialize

 .../testing/sysfs-bus-coresight-devices-tgu   |  51 ++
 .../bindings/arm/qcom,coresight-tgu.yaml      |  92 +++
 drivers/hwtracing/coresight/Kconfig           |  11 +
 drivers/hwtracing/coresight/Makefile          |   1 +
 drivers/hwtracing/coresight/coresight-tgu.c   | 780 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tgu.h   | 255 ++++++
 6 files changed, 1190 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
 create mode 100644 drivers/hwtracing/coresight/coresight-tgu.c
 create mode 100644 drivers/hwtracing/coresight/coresight-tgu.h


