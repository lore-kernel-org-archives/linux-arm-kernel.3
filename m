Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982DBC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 06:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AACehQz66jGML8jtfQhLKZ7tYZLo0nJOPdazO4YxUuc=; b=loylz4q4O1BXMVM6NVXG4CKf4D
	W6MlR4yUeJsqg3kORW8Um9sPxkpdZRsUXL/OE/1nCqBBbazUDfFGroyCKKflhzIJ8u+ZC1TL4EwGx
	oWaJUmXoluhg7TRnuVQFAQw0GA8V+x4eL8Swn4BhLyC/oKRsz+T3N6IuV+VM1uNiTbO0hWS8Y8taO
	q9/e/sUesvEzQQZlX0mdKsq/3seRbCJz3iHnTuChZFkhGXeCHZ8VacxzN6SD8grD001coFRnpVLLF
	OsVb7hhH7pYPHXJZHxSF5MuISfU/PDIa/iEOhJTSrk1O0sADAA/CdgKLjLSlRA7P+ei33jFG1SNbP
	WZHSv3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwoT-00000004jaE-3yVb;
	Tue, 24 Jun 2025 06:07:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwm0-00000004j6F-1b6s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 06:04:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGeAf1021706
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AACehQz66jGML8jtfQhLKZ7tYZLo0nJOPda
	zO4YxUuc=; b=BXlVNVWesgxqUOvTjzPCQ5ZJc0msLInU21qKJ6fyiUXhjLVIIhP
	c3hcKCqPBLHhzDttiiXg4HPozL1j9XKvZKHbhBBhTXu1TAI20yxMu5DtKNOj4tYS
	qMubIzjPlAWZGyVIut/q8hxuwDzJ8szxkFcChh46iaGCvTcQ9auDRpIwjqY2IvJS
	nqixzPlfMjCjE24qnjwshfqsuQaj89wjz6HzwWFPzK90zTAIqL0DWlQ9E+MxcWdi
	7NGARuzl7Mr8KG3BJ+owZI/MSpkLZOP0EA+mJg3INS1KNyVP/L0LAyFTuhU2lcNw
	joltiArW7Nztmi6GObE2GBXfzQ9awoKrtKg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpu5nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:04:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31df10dfadso46900a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 23:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745084; x=1751349884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AACehQz66jGML8jtfQhLKZ7tYZLo0nJOPdazO4YxUuc=;
        b=DKngw1AZqfPoI6e9LbiGC6a703jyqKHHRivP6txeRDQn7HKLsNrFXpinERUfbje+f1
         cNtDHdMlmATE8gBt/3PoaIgAKEwZYd31RrSJjPuQQvTcJjcZyPPKbxfZ7Lblw7oQsxHk
         D4FN8k2ZMmgh/iZGjm9PfZ4lbAuvbuzT8PmesOqexSB+QLdQbxfc2wepcJ6n+DIhc4KZ
         Z/EmZVKc51EAlHUfkp/G++RoJx1rWsXcQFZve9Bu4FpPyDF16oIHh7XRZwQO+gnHlOLX
         5gv3SQn49S5dSCk91qOQ9ghVKIdWVNa2hwh+wqLiVrA9jtZy5xNvUzq2WzAYF8EIY8bw
         iEPw==
X-Forwarded-Encrypted: i=1; AJvYcCWBbdqGX4JZ+SQhQM6ysAdsc9QtMXNxWqZb72I8xq/KYhhB6DKm9eyQS4HgZSUTJ4H5jzPjof55Q1rhs7W7+TlN@lists.infradead.org
X-Gm-Message-State: AOJu0YxBe9ugcZnWAJu9MVXrDmCMC8azywhx+VCJKaN938ZlJo43H2+s
	B4Adp/3ABrY8NgtFJbO8CJNNWiJs+UeaX1IFa7zOWC48+ZBjtoawd7Hw3m4Q17CxRDcCXp5lwJo
	ayhqO36tBOvHJyoZjitdFHs/+EO06FpUv4pN37782MLJEqJj/DDC4fZF73sIO05oCYoufAQ+F5j
	k1LA==
X-Gm-Gg: ASbGncuB6La6MDwHbneYz4rh3mAwhBAeUpzHw5PJhDBcZmL2hyZ3OSy/ydQ06nL4FKM
	2QtAvDq5l1/sz7AoHxPkwSg9kk95UYRsd6DRd9enWDqWlwdMGzmxhDSuu3fmMjzPKIk68BEiQ40
	7uz68HtnSKhrBlcHN7eP/6yA0XG48tToAUmEUJEnEJt2JXaD4HAsGRf52CoqGFergnbx5ZkkH71
	Atwaoim4FBAXV9ZsIO8Lc4WJN1wztUsLaq8TXHrLeaqaPPhhqaMdYIvieLxIcO6MGOGygxDgNAM
	TqJAx1RUJK2iJj+rsqpMFB3pFsE9tqGr0ukYbzkaagDKUj035Pofvfa2ydrv+NgC04qZGfK4RN1
	dwg==
X-Received: by 2002:a17:902:ccc3:b0:235:e1d6:4e45 with SMTP id d9443c01a7336-237d98f3c69mr197464745ad.25.1750745084293;
        Mon, 23 Jun 2025 23:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhyCnnLv+KHyzd+4i525LIpKE8PA1HCFGX9nqqpvvzEsPVeUBt24MhWCwVB6lZ0lyOe2GQDA==
X-Received: by 2002:a17:902:ccc3:b0:235:e1d6:4e45 with SMTP id d9443c01a7336-237d98f3c69mr197464415ad.25.1750745083875;
        Mon, 23 Jun 2025 23:04:43 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:04:43 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 00/10] coresight: ctcu: Enable byte-cntr function for TMC ETR
Date: Tue, 24 Jun 2025 14:04:28 +0800
Message-Id: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685a3ffd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=nBcv9sv72UtkhE4thMQA:9 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MCBTYWx0ZWRfX8QvNy3hllYuD
 lJrk1w4zeKAyDazu1kNVNa2D7wtmbP4uKpDQfzd2Toyw3e0FnXYD7qgQIo6eZ8tBQSOFUj0VFYT
 Jwl+IuvMNqY3ilJY2RHTLQBjCErDo5N7YoTBuzzn6HdJnBNXDk617dnDwsZTvmxhRiG3YHhcYpa
 Eqwq15AyRZc58Nmfb+PpuQDONp94EcjOkmGDPmgtozwjjkX9FekNTikHpdPDEhapCTMKlrXLLjN
 roCzxMN8vJqM893BVUm1lFSoXO5RiGlacPB2z7zRGbZdhu93e9F5IhyQ8mhlySTqynnfGMmjDbu
 TKTqdIkZFehrDnkYgSfsFIWkLNNCj4s/EQboOG2h4fPutEKcJvfb4YP9VI+0/CbnZxB8T/HhlF6
 uax+66K/hhkbhjv7il2xTbA/SBkQRpXveO/uzV5T2pMg0Tn2OY8ygC1UY7El7wSP+mZ0DJrU
X-Proofpoint-ORIG-GUID: i5sgYi8K0Ry74PW3vJNj0jz4cE3L1BFH
X-Proofpoint-GUID: i5sgYi8K0Ry74PW3vJNj0jz4cE3L1BFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1011 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_230448_576856_8E810695 
X-CRM114-Status: GOOD (  23.59  )
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
trace data entering the ETR. An interrupt is tiggered if the data size
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

The byte-cntr read operation has integrated with the file node tmc_etr, e.g.
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_val
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_val

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
  dt-bindings: arm: add an interrupt property for Coresight CTCU
  coresight: ctcu: enable byte-cntr for TMC ETR devices
  coresight: tmc: add etr_buf_list to store allocated etr_buf
  coresight: tmc: add create/delete functions for etr_buf_node
  coresight: tmc: add prepare/unprepare functions for byte-cntr
  coresight: tmc: add a switch buffer function for byte-cntr
  coresight: tmc: add read function for byte-cntr
  arm64: dts: qcom: sa8775p: Add interrupts to CTCU device

 .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
 .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 ++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
 drivers/hwtracing/coresight/Makefile          |   2 +-
 drivers/hwtracing/coresight/coresight-core.c  |  54 ++++
 .../coresight/coresight-ctcu-byte-cntr.c      | 102 +++++++
 .../hwtracing/coresight/coresight-ctcu-core.c | 113 ++++++--
 drivers/hwtracing/coresight/coresight-ctcu.h  |  52 +++-
 drivers/hwtracing/coresight/coresight-priv.h  |   4 +
 .../hwtracing/coresight/coresight-tmc-core.c  |  70 ++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 270 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  29 ++
 12 files changed, 691 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c

-- 
2.34.1


