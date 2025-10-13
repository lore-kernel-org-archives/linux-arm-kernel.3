Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B16CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 05:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fY7Iv5HiOuXCaTEk7ZDBaomQOL5sTCapdPV8PvNrHLM=; b=Zmc72X1PmWCEmD
	JFOHmTB8oCIR1lHDMm7wCDDcH3KDbZF2qGM89kb8vrvOmk+JyPIBQXYcs56+uBTKHz3iH8IA6UtKb
	P2PG98fJSb4xuFe3tKEFKIIdO5HP+8dhSOTDUJoHIO/5PkTI9wzYQaRro4oT2bG2Ppv6BGnNaZKpS
	gF2zCWXM+MA1xdprH2U3xL6GfG1So8fPedNUNxZ4Pzmn+u3j0rs1bXvl5m9wLN+yJzectWGnYV9UJ
	qKxP+g1XZoW78UL9aIA7AyMFZ/mgQfUfQYCFVgLvQu4P98vkjgwaXLxes6OsXBRqE48TZS6DiqKBG
	ECnmmlL4kL2BKWjfhyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRE-0000000CHy8-0rR5;
	Mon, 13 Oct 2025 05:49:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRC-0000000CHxe-1RAS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 05:49:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n5WG010423
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fY7Iv5HiOuXCaTEk7ZDBao
	mQOL5sTCapdPV8PvNrHLM=; b=eLJRaRJN/3ZglRajG6RarKYEat1dB+oYJ0towK
	FMoqMwsdyG+gcW2xxzxOS7/bwnPf3rU8USib9LvbctHS7gZPeK6ddICJNWjON8w+
	4LoRnRVTvLLj2+NzDreIJqWzEeV2bXyuLBXoXjEWZrLdxkQYar3YqmuCeHHIAlfX
	rD5SNaI6zHamLEuPiLQNUbzIIaXs8OCUQojkUxoUtTVBrVZX6aBSHn3OZRDLsAAy
	EHHZGAAewD/3R4VQ+ycpfH9Is4WNxQHWliAQ14KPKQK8Ao/+FTwoDOWZGeFE9xxp
	nAQB5ubY4hPB0aLdliMDWNsMCsmzc5xG7ac71L2mmohCynXg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0buara-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:49:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77e7808cf4bso5252674b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 22:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334575; x=1760939375;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fY7Iv5HiOuXCaTEk7ZDBaomQOL5sTCapdPV8PvNrHLM=;
        b=DVXn8V1JOMEURS7m9098ve2lX3eaPk2yFOM2tkskpZkp6X/w8VD55DYw2zj0G8ArpI
         DkcQ91YOjrpZmOE6WraCT4Rj72rSlAUa3AvgC4aKwVAlcUgWlJGU/mkvClhTWuCn1XNi
         cjZUZgS0dPguB5YSaSsSIsVTAqCM07w5n3wUJNOm3qpizMWwMPq0Vl2ilNXGXtZ7aL0Z
         TSjDCoBfNPyuz9QkDnlQvhxGcv1c2poQQEqz8eSawbjIZQqwxzQ6UroCoAUY6VgIBQqw
         uMhI6KoQucp+NKLiOju1mHn2ySD5UMugyc63p6ofLQLxD4eL8HtPzovLmvYWWdBliZay
         U0Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWNOO4Q3dh6Lv8fATgO93unviqKgoNlA6pWOMcNY3NCsAt0BvjB86W7tdjBLpU5sQ52UClpHQpy+ete9kolf/ZS@lists.infradead.org
X-Gm-Message-State: AOJu0YxxhVIZrx17afkwvAofN8FT1GUaAJ1PRmkdzSdn0VqBWXrWJvTo
	42XDmZgdthfwRb7VTV5QS9E+nXpM2HASWEhKkQ1/k/B+kZLLt7sI9AaAqCBzwBrpDApvHKGkUhR
	6DWfemozNiAtZKw1SVsowAThkoM+baSi3PK4ok+4I7JBaqM56WblT3luBZojlS/cdmG9je54WQo
	/F+g==
X-Gm-Gg: ASbGncvzE5AXX8WWFgO1kS+hbx9k0BM/lFtxfXofRzeRzrSEh751kFPt+iKAvNehRHB
	el1oM3D3HjryVGqqwLZUDYdAisr/8pX2zIQx27iTd5p+EfqF4y/Jw9ZUllpRZSwmUoOsNZyVvZI
	KdEhWKUcxzWdDljrUZKQYzFQLpZcBlyM/UzS6WoIhStvBxLjZD3RnKopWpTI1qqMVuFI/Vy02J2
	iiy6EOLnjYQJumRc/YvCJ7X6xS+ohzNQsViNlANT0iHT7X3F+OsPilKpT1qRYoiStlPgcmqEKbi
	hJbxNpQBW6rTefh208XTfQc9D+gj/h+EyzueaBCwyyVAZsYZpjRTxoKC/rsyzqSFjZN9vEbuHWK
	YZk8Sxlj86aCxxJRTw/6nHLXPYHM=
X-Received: by 2002:a05:6a20:a103:b0:2e3:dd60:913d with SMTP id adf61e73a8af0-32da8163cc9mr24914854637.21.1760334574839;
        Sun, 12 Oct 2025 22:49:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOoDpVGBojfst5I0YQOYF1+bRjx9a9Tuv9XIbuIgq6zeW3tKYZ9hhUWXzKY+tbbVHfBf5rvQ==
X-Received: by 2002:a05:6a20:a103:b0:2e3:dd60:913d with SMTP id adf61e73a8af0-32da8163cc9mr24914811637.21.1760334574294;
        Sun, 12 Oct 2025 22:49:34 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm10129898b3a.59.2025.10.12.22.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:49:33 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v7 0/9] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Mon, 13 Oct 2025 13:49:09 +0800
Message-Id: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANeS7GgC/x3MQQqEMAxA0atI1gasoqVeRVy0NWpAqqSdQRHvb
 nH5Fv/fEEmYIvTFDUJ/jryHDF0W4FcbFkKesqGu6lZVqkEK1m2E7kqEPiTBeRf0yf+wU8Y4bZT
 T2kLuD6GZz+89jM/zAnYFCDhrAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760334566; l=5780;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=3RKQwOEptiAv133lG3YSmIsZ4i/RJjYhpo00yHT1s1A=;
 b=PLX89PMzNJKlz/9WHLi1kmyLD2wcl0akbD4i7ancQTZT4sbKMaCz7piWWaDXjH3GYZTpntAUj
 0RkbCfUhxbHCe0NRI3Xd9NSSxvS5ye1iMvO30OB5KcpY5Vg1Lxr4vUZ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 1Uay1aIzU0pzw9Q_koqQCPmMYel5-vRW
X-Proofpoint-ORIG-GUID: 1Uay1aIzU0pzw9Q_koqQCPmMYel5-vRW
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ec92ef cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=4JJaRIKzVo7dG1xzKtwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX7wRSTayUcVHw
 zMId3qBfQ3hg896Kdh5xN3NIcXMKjJ9IbzhiG7S5Xc89wlSl/tDrVSdLZzMNcrtGBI/tU+wyLuc
 zWlXLLoJlh8qGSKN7Gi4E0RhNVBleVed3GUkrIaH53mCM45Nkt5XcRtHY+zv6SrJk1gpUOUtlxz
 9mzesXIl97Gb9v0+HVByJlmh1KzqdFbXefi3la8bn3Hqn9Ty2SgBMK2HuA4hy7aAY484WSog8pK
 FJRDkaf5pGuuBP1EOH0Q4pt6sXXoCBXaBiixOrSid4uYNteA994iluzqS2fXO6VoUB/b4z1yGxt
 extu+DRfTHeHPY3miNKPdr9+3gxEP/9YTVX+Ej64WN36od2qCfkqzDbkkUmzcFf2mvo7Vo9SLy7
 9+smpjVVYSt+bIrUjyWKFcJwJ1gMVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_224938_397544_BF4EC0CE 
X-CRM114-Status: GOOD (  24.73  )
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

Changes in V7:
1. rebased on tag next-20251010
2. updated info for sysfs node document
Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/

Changes in V6:
1. rebased on next-20250905.
2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
   lemans.dtsi.
3. fixed some minor issues about comments.
Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/

Changes in V5:
1. Add Mike's reviewed-by tag for patchset 1,2,5.
2. Remove the function pointer added to helper_ops according to Mike's
   comment, it also results the patchset has been removed.
3. Optimizing the paired create/clean functions for etr_buf_list.
4. Remove the unneeded parameter "reading" from the etr_buf_node.
Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/

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

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (9):
      coresight: core: Refactoring ctcu_get_active_port and make it generic
      coresight: core: add a new API to retrieve the helper device
      coresight: tmc: add etr_buf_list to store allocated etr_buf
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
      arm64: dts: qcom: lemans: Add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   6 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  17 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   5 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  59 ++++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 368 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 108 ++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  62 +++-
 drivers/hwtracing/coresight/coresight-priv.h       |   4 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 104 ++++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 112 +++++++
 drivers/hwtracing/coresight/coresight-tmc.h        |  37 +++
 12 files changed, 825 insertions(+), 59 deletions(-)
---
base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
change-id: 20251013-enable-byte-cntr-for-ctcu-6199b791b77a

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


