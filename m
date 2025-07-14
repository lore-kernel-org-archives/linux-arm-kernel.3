Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284F5C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 06:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0wqXPJCmIO0vUREoCEbzWcWX5UzhT3+oWJ/3YK7SaqA=; b=S2PuIKj/KZ4JfaIPWpYpr5YuLn
	7usBoZeso2n7BV0l5CttEKIFbf7+y/9HisWt49Wy2RwHLobAGIYu1RgFrETXKp7F15QXcdQ1YFTbF
	3frq/eeglsfQ+wacBYc93vYzE1P/YlIh8eBIWwmCnH/Z4ACgQQ1kUw1bD9qU9ppGu+VyifRkYynOV
	df6T78PujD0j2QSncr6S9EoXxO0bdqvDBCqRPUZAH+iWItuey6CVW2xc99Y/hPqATp6aFfQRx/UMc
	3Qv3+DF0I7tj4ySVSglp9fXgoh+bcNvkMN5cplgDIOhFjG1XNoydACjV/NS/qKdcET3Pz8ScB0E8a
	mNVNlLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCzp-00000001OfD-3vu9;
	Mon, 14 Jul 2025 06:49:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCif-00000001M2F-1EXc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:31:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E0KX3d027322
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0wqXPJCmIO0vUREoCEbzWcWX5UzhT3+oWJ/
	3YK7SaqA=; b=XhAP8100rPlBQ50pSDQ+lHvfwHFkb6Xjs//lS5nBhJig58p/NQJ
	tLektCMGsNISv8FI8PfXqecQ+u4Pis2ZpCbAJSVmqnmYkBqjDTC4NaO5YeUT9LOv
	X7IL5F9NZiMGzHYaloCMbUYTs742r+5JcwtHEvznLVre9IGhylOVRKq6JTP+clin
	6a9t0Y5scbsiznIU8VK/reUGVNp57qeFf76jimiVkyw9g7PxR7mnTAvuztGjA2w8
	bGJR4GY5vYU8a7JX1AoRrCVOMmXiPanziqGoIdLxKTHoaKHfqYMSo07NToSbKnsR
	ejmjqQhn/3ZqPeH9tSgeCJtvO/A28TfyQow==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbbf7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2356ce66d7cso68799085ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 23:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474678; x=1753079478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wqXPJCmIO0vUREoCEbzWcWX5UzhT3+oWJ/3YK7SaqA=;
        b=J6IwsOf2L1uQtu2lLbB+v8/GAC/Y2oxVimPEmswQR8xyEuTAaUfWQaenqxPJPGcbHe
         ARJIurwqe+M+/ZHNYuYHBvdEBBsyVW1FALQwpvcXjqzP8gf8D3ofTu9nQ6JfXvk5SoVg
         DdezXWMT6bv22gxVnTP3uBpn02D5zfYFCoLn3oSsEjKD6nnnRdODPvKuZc2Gmc8ZgMV6
         dl3kPfoansDqJBgUIe6zCCHcRcErFlBx06ENquuBy0zd+FcaZDg3jwhN63DzsNMlpNu6
         Yyyavf2+fsJr9K3oyrCcrb4m0XP7hn7CBdOcIrdH+vtOd40E0kvJ7JOyTm/Lb3vBwGYZ
         +l6w==
X-Forwarded-Encrypted: i=1; AJvYcCVVwJWk3/j3u/2ofDnSKVdgnFsB7+2TRphVk0AZrIBPGyxAxg/0ZyMa3zjsn4ZNVW4p2rj945xgNhYpilUxrXng@lists.infradead.org
X-Gm-Message-State: AOJu0YxairLPBpeWWAY3LpozyAefrki64nR8kmj2x6bK7u7QH+b4OdmF
	YuL+tWR8xjSChstkRFsNcGC8tauab8eYTztWzzHUDlvnch9P+4Jcuw6vilthpysPhdPV91+kSTx
	4KhTDQPxyi8EJDZDJUU622XPtPnD+tlOc+g2fFjCfdONusdMrGw09q84tE/lkykHXbosuagS2rK
	4PCg==
X-Gm-Gg: ASbGncsqU0EEAmgAZRSFo3Ga7kbkLnFYWckSerPVb6TMJ8rMtOECV2+YFzX3+ftCinK
	XrLrOdsiGaRx+1ZLAGEtsYNZ0aVyAM9kqtlKoEkeKss+Y4l1xZr5y32/5zc+2tYY3Hthgpbft+T
	6ory4vmGtUR+gtumx5hRF6uvXNEX0gXQoWJRrxq7wYE3xuU9LJINgebTKiTz/xpSFixdup7Ai1m
	8J4dkHPTrJ8SxiVpsEbzSxobPc/M2Z3/tTTiR8yQAnbuEkmEj8DIuLImSlQhKvArV038Yogp28v
	/sWIYorMQX6HzDlsCC1QO53Um8irHtTvb2RVzDq8pIkvhkVHJH7BlB2zH0c11pTaxCP5/SZAgxk
	f/08PlkewY+1zclJ5fP6p
X-Received: by 2002:a17:902:e54d:b0:235:f078:4746 with SMTP id d9443c01a7336-23dee263c53mr150587545ad.42.1752474677630;
        Sun, 13 Jul 2025 23:31:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPLKAuifJqLzIISS3WOtiE7PpBWt3Y0U9Des4cLciVFaSNQhBO1Bz9VSSEWj3nEmc8jMwwxA==
X-Received: by 2002:a17:902:e54d:b0:235:f078:4746 with SMTP id d9443c01a7336-23dee263c53mr150587005ad.42.1752474677123;
        Sun, 13 Jul 2025 23:31:17 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:16 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 RESEND 00/10] coresight: ctcu: Enable byte-cntr function for TMC ETR
Date: Mon, 14 Jul 2025 14:30:59 +0800
Message-Id: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfXxyvrcxJ4Y76j
 j7X83ekVWllqnObFyyPKIlFOF4w3fd06zly0ozu/rXqV8XJtIebS4vrutN7daSyYsTUzz2YjgBU
 SXaxX+oSS0zI8S3JmowlUQBppopfTdmX+Xc3irYTh0r8E8t86Ho8cIdVqjoAg3pgG2KrBDXXSWo
 keN0cDWyNu4NlhAlr1/dduBByCraU/oT6if9kGOKX/XVLVSs0N1nlaoXtjCmYbEZznC3QOINiKs
 kvswAYp/EawZvx6MMeVelGJoVRe81iEojPzj12VO4Pmu5F1dinPY3+hCKJnzsW8vAPzdn8Pipqi
 nBJ3G2eHnsC+yJz1KHkPxMXyu8jF1sun3oMiIyqF3Lg6Vnjri5t8Hyo2LG7jI+yoqkFPFIY0rUp
 BFHlrQZfspT3zQ7RAAN9VJajZFmAETXn+W0Ws5lv2ZoDxECkfmNqvaq5q+gVnMAE2Pezg7v9
X-Proofpoint-GUID: S5WvYh4zSSvFb3PaPOOR1cgzd4taNNrR
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=6874a436 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=nBcv9sv72UtkhE4thMQA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: S5WvYh4zSSvFb3PaPOOR1cgzd4taNNrR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_233121_465874_08D8234E 
X-CRM114-Status: GOOD (  24.04  )
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
echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_val
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_val

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
 drivers/hwtracing/coresight/coresight-ctcu.h  |  49 +++-
 drivers/hwtracing/coresight/coresight-priv.h  |   4 +
 .../hwtracing/coresight/coresight-tmc-core.c  |  70 ++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 270 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  29 ++
 12 files changed, 688 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c

-- 
2.34.1


