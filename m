Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82D9C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 10:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6EBHc56iB4SgkIrGWkMoVed7ialO6Hu91FgrEoulgGQ=; b=Z1qfsEdKalYzoa8jyN/3CVlWip
	qIw2VuGjLZ2zUH8Mdbq2kYz1xrUWfEFPgbo6rAHwjH2Oc+e2rQTH3hKQ7S8JOAqycwnywbkqe2zqE
	Dqzg9qd69kdXZcgPt4I4A9/zLqv6cd6ZsOhPOiIlCbd1FnByolip5rSe9PvaY18uCiJgA/U1y2tji
	tEKE/EOLHUstJ+lZXzHEF+T235Qwh6bb9ZvYMgCUC60tdkaB+JjdOtIEoFrMhj31JlqYvcMUydMpT
	VrBRVRsZoAI/B4goXi5BmRqjHj8Up/OhNVq+ZqFaJN0br0hSFAKs8SMapSlXInU8FqND3rQflXc9x
	1N/vfLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFsl-00000009cuh-3RSS;
	Fri, 25 Jul 2025 10:42:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFLb-00000009X8T-3vmi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:08:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9TEr0028127
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6EBHc56iB4SgkIrGWkMoVed7ialO6Hu91Fg
	rEoulgGQ=; b=CNJ504A+r23mg0+9FgdE5QuAZ8FjXBbGOsVLU5VmGg8AfN4rxPl
	Dib+f/XqaltETQ27Rk97zohFGYJv3IBf6YA6vk8+ErR9zlOJ5ousaz/7FI+3by9T
	IKI6ayd6+9Byq6ARw8eKDeBxMyyrtFpjL7TDyF909e5SbjSCZ5LnjZPQAU/zVeT/
	YnVdGaj4eJ80OCMRl7BnarG+z/TOzmsrBs/wEm4a6UVosISAt7ZoUY8XltPsvBXB
	3RTu0NzigctUUhGR9DxyxnrQsjLlg6D/IeihOqMimddTMIWNsk5pOlc9sN4MVBUF
	LU8xpgCZNIsmKg4KPZlPrIGeM6ZVVG9CT0A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2u1nx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23689228a7fso33729665ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 03:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438093; x=1754042893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EBHc56iB4SgkIrGWkMoVed7ialO6Hu91FgrEoulgGQ=;
        b=uTBcAcUmXiqwd3DeGUrl1mfPXL9HmtZzksZrvjIejeZF8wwDjw7D8IcLcmjXlLlyWF
         WaioP1KQ4LwtCbVW4qNyvBxYJVQCNcKvc6f93mc6of1+4gvfzoEzdPL1752CA/UwaNVY
         B70eAuh0G55/BHOQ2ZeuHlGj5W2ajqoYAEuAxHNK2yd+lz/k6otIYh/SSpxzw2Oi/KHc
         3fWzU/I5t2r+ZTnFKjdnK5dUl0U6PZVASybEpejaR9ZW9Nh4BMOdt4gZSt5gUTcmU+ps
         NeT3LQw1/FlJLotfsR1JALvaDFFUl9avco3pYxlvK5lKLxNNmEKo7WZfzmqPibhF/4Jp
         BPFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVve8te6UqgQRYxZxZcz8o0n60N2W9R4EYDln6msI3IQgxn8aUF0Th9F5jMKm6EhDAFaMhRBREuKHhOrz0BbCCD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx/TjlG/7MpKvzhpp8oDc09448+6jsEBmVglW7NBhc+scIECYs
	KnH5wP5Tf/2J0G4Vz+hr4ZzYDHdBRBVxrC2rjFCjWh/SEQ4pqu57N1WQkdAQnz0CT4pQH4fWH1o
	R3kmxQpG6mbewwbILf9ygC2EEv4+OPb4Ueih6puLUk7hXLWxadXpSBTF+bmRqCz92grC3bhfJac
	tSUg==
X-Gm-Gg: ASbGncv0i0x5Z5mRJfIOlE4dyv6/+d36TQmJT2B+qGkYqvIxxTJimPO/Ytdd6+kDYal
	wvoFZ9el2oIsfb3CGQbKKdBw0Pch9hrakxdimJhUG6E/JCtg2bKOZLYxV2SYfOI7ClT8w07oAEr
	N5njX8rLvvnIomq/4aUAqH+wkHvm91RuB+ElKN6zbhXlpj6sUZ0jzUkJeUcN0cf58d/Fi1U/N9k
	c6aC14fNB7s6wrwG4OrtBDhEK7f9lFPLVcANN6234Fbj8RDbI9tc8lvX2QqDUdXgXJjASQfEKg6
	yUPQsiTigwCM1EzPo9UDgXpiFAg/D7J1qqUFWhYE0z2dN7KrH7x+9Z8BEpMhLf5/mFHDS9sEatX
	EUZQqQKIX+XWiUAqK9z0=
X-Received: by 2002:a17:902:f68e:b0:234:8a16:d62b with SMTP id d9443c01a7336-23fb308080cmr22580695ad.12.1753438093408;
        Fri, 25 Jul 2025 03:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiwVDJYSX1y11czEmaF5LFxL17hgu0Lb2lAPb7Ue/TpYcJeCl2AQGCWJYInJsEyxe1YPp2QQ==
X-Received: by 2002:a17:902:f68e:b0:234:8a16:d62b with SMTP id d9443c01a7336-23fb308080cmr22580135ad.12.1753438092796;
        Fri, 25 Jul 2025 03:08:12 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:12 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH v4 00/10] coresight: ctcu: Enable byte-cntr function for TMC ETR
Date: Fri, 25 Jul 2025 18:07:56 +0800
Message-Id: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NSBTYWx0ZWRfXxbBRwzfpYO9T
 3DdLs5RYQM79CHHjURWDPrpqUV8iIvgWED7c9JOtV6WVf8OWrQkLcvk6hspgMBYxLlt2Ih2E3ZB
 +zcSenV42ZrhM3UHDjh04tTvhW4fHOaZbjStahVGBpietcjDP0/CW3d//VAel1ckODV57VV2Bb0
 CVm985JKU/Wnt2yTHk0PYYr7ee/ZEB33PuhzIy19DbTmKMZ4+gNJSXW7//1HVPDaYzTm5Jmgzu+
 r/yHioTpm31/3jvbsG+2FPFR3whHJFA9mPEITnPSRx4VgQPnPAuxVh+ODQHY8Tirx/9MO2Ae/Jg
 1NWMOum4dwaSGeYw0A9ddN3xX7ibYpohm3EP1/seMnZgMRm8F0HAUZrXRkbrLPa1i8D1GpbeyoM
 FAYvoDAAjP1V1+nAI41jH0zXxQqTQo87Pz9rmXTVwUQ1hZsNCxi0NaZt+Uk/Me8uT/Irf0nU
X-Proofpoint-ORIG-GUID: R6nRT6Wa1V220dxor3uCpmbjQgcXwbcd
X-Authority-Analysis: v=2.4 cv=FcA3xI+6 c=1 sm=1 tr=0 ts=6883578e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=URa5TLP9FqKrhjsjdTUA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: R6nRT6Wa1V220dxor3uCpmbjQgcXwbcd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_030815_993618_E4CC1F1D 
X-CRM114-Status: GOOD (  25.36  )
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

The byte-cntr function provided by the CTCU device is used to count the
trace data entering the ETR. An interrupt is triggered if the data size
exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions.

Based on this concept, the irq_cnt can be used to determine whether
the etr_buf is full. The ETR device will be disabled when the active
etr_buf is nearly full or a timeout occurs. The nearly full buffer will
be switched to background after synced. A new buffer will be picked from
the etr_buf_list, then restart the ETR device.

The byte-cntr reading functions can access data from the synced and
deactivated buffer, transferring trace data from the etr_buf to userspace
without stopping the ETR device.

The byte-cntr read operation has integrated with the file node tmc_etr,
for example:
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Enable both ETR0 and ETR1:
echo 0x10000 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_threshold

Changes in V4:
1. Rename the function to coresight_get_in_port_dest regarding to Mike's
comment (patch 1/10).
2. Add lock to protect the connections regarding to Mike's comment
(patch 2/10).
3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
4. Add tmc_read_ops to wrap all read operations for TMC device.
5. Add a function in helper_ops to check whether the byte-cntr is
enabkled.
6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
from the sysfs node.
Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/

Changes in V3 resend:
1. rebased on next-20250711.
Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. The previous solution has been deprecated.
2. Add a etr_buf_list to manage allcated etr buffers.
3. Add a logic to switch buffer for ETR.
4. Add read functions to read trace data from synced etr buffer.
Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Removed the independent file node /dev/byte_cntr.
2. Integrated the byte-cntr's file operations with current ETR file
   node.
3. Optimized the driver code of the CTCU that associated with byte-cntr.
4. Add kernel document for the export API tmc_etr_get_rwp_offset.
5. Optimized the way to read the rwp_offset according to Mike's
   suggestion.
6. Removed the dependency of the dts patch.
Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/

Jie Gan (10):
  coresight: core: Refactoring ctcu_get_active_port and make it generic
  coresight: core: add a new API to retrieve the helper device
  coresight: tmc: add etr_buf_list to store allocated etr_buf
  coresight: tmc: add create/delete functions for etr_buf_node
  coresight: tmc: Introduce tmc_read_ops to wrap read operations
  dt-bindings: arm: add an interrupt property for Coresight CTCU
  coresight: ctcu: enable byte-cntr for TMC ETR devices
  coresight: add a new function in helper_ops
  coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
  arm64: dts: qcom: sa8775p: Add interrupts to CTCU device

 .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
 .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
 drivers/hwtracing/coresight/Makefile          |   2 +-
 drivers/hwtracing/coresight/coresight-core.c  |  59 +++
 .../coresight/coresight-ctcu-byte-cntr.c      | 364 ++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c | 148 +++++--
 drivers/hwtracing/coresight/coresight-ctcu.h  |  60 ++-
 drivers/hwtracing/coresight/coresight-priv.h  |   4 +
 .../hwtracing/coresight/coresight-tmc-core.c  |  99 +++--
 .../hwtracing/coresight/coresight-tmc-etr.c   |  81 ++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  40 ++
 include/linux/coresight.h                     |   3 +
 13 files changed, 828 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c

-- 
2.34.1


