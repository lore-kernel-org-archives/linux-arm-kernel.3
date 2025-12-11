Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979E6D3E78F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 06:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hhKmlg+dr84Ob9dnVY4ZzRu8BFKGqs9p9d9Zofmoi2k=; b=0Xv4MofXnDfIUa
	/YgWsFCCc5GjLTUWlxT/tqjEhN0Zshwv4oo3RrpUetwcT5jSOcZjR0vBKdo2UBidOw+RaLx3QbDF0
	hiMnGUtAKKZ5RnTi6E3voM07QmA1vROxGbcZrbtShFRcMlEnvWCGgErqsU667BLtVvw1hROzeNULa
	mUTwyy7RwwOmQOyM0o2hdqjGrLr9N/kY9chRlNxRR3oeFEa8acihLPRel/mcLHLNfMDX069OmKpeM
	7l4DliYR4RzK6aagvXhb35xF9o/mVP5UnvZYwvzsFvxDR4omW8Kc2ZJCN2Qq57gn+jNr8ARM2uif0
	QjJ9RSQxd8/jLNg8Y5Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTZto-0000000GGU2-1s7d;
	Thu, 11 Dec 2025 06:11:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTZtl-0000000GGT6-3Zzd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 06:11:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALPuQH3200326
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hhKmlg+dr84Ob9dnVY4ZzR
	u8BFKGqs9p9d9Zofmoi2k=; b=lZ0vX+BfQtEHsz7hGrFjUERmSVxNAzGUw3Kp+2
	a+yyuZKnPb2RbP1c3PhCi1j2yv5sG5nT3SyOmI1d9kTdv5cXusvsCW//YdT9RW12
	xwR36itRdiwfuiuYKDXFwQJVrON70B8NnuK0zmlvrgfnXpsos66r0w5x0WbTLbgB
	ubrTYxo5FD+gHHi2c2QpVf139QMk8KKd0LemKi3/lyoh39RbptIqy0nIN4xHxirv
	zaZwBLPuq+2WcHiJSfI9xJg7T+gcI3pRW5DPUa+5AI4LtPch/WacQmzDSMKI+SNO
	l8fehhR1MplqzcmV0kOCH56HDV3ig3tQwckcvA+kaIhonl9Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygrx17xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:11:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2955f0b8895so16560545ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 22:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765433491; x=1766038291; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hhKmlg+dr84Ob9dnVY4ZzRu8BFKGqs9p9d9Zofmoi2k=;
        b=ZFYYyCBUJrgC/j5wXIgudhct8OxUvJecF4nXq42zpIej87wbR+hHttw+9BIPvstMZP
         brtxcn4sbYUCJdzT9n+/uX9ME/2MdMOLhn2+pc/KtC1K5BHN4Y0S8OViX5H4gNjkaTho
         cVSy/pK2FGMvWNI3O9E0K1pUETYN8UMi7nMrtnQOB4UeotOcXuWGikzfbHDw921ZMupz
         ULMjcJOh8LAP381rp6HHpivCpIlqddDYeJeNE5eI9IxZomcOw4leT3J2iii387r3sL7G
         RvgCTJWb5OYFhplFM+r/huBe+6Z1VVO2HdwEk3gQPUm2lwYIbxloy0xLg7ul7CgdwHz/
         rcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433491; x=1766038291;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhKmlg+dr84Ob9dnVY4ZzRu8BFKGqs9p9d9Zofmoi2k=;
        b=dyBliEj0E/5Dq7y9PDS18lSfDOyiZdnpBY08q4kB+s1dZlw0XKUyuRyr1tUPLPU/lD
         APREytYYiAAH+/vktn93jO8aSLzt3FRzk75BJ8xQtQ/aW4n6Jui8fx0DD0XQZkM9bWiB
         IIIZ2RJh2naN7RK2+WP7vVZjUGbFTCYr1H7WR4d8wE6T66ELMpx3R4YS8aUkQMpG2zpw
         i48SdkUYi/8Cf+BixfSNU3x67qVnJO2AyMOtFxhaCHI2MSd+SL6sFADHEPLeWyGrX8/C
         DUIuyeoqQ49xBnl+QJZ2MpdLiJQpdo+8oZk6YB9LGCAigPMGkKYbDP2vDge2WKh20AKT
         rwig==
X-Forwarded-Encrypted: i=1; AJvYcCUIpWr5JIbIuIq0Et7lEDRmIuaxoIyDFZEAzuI/82v5JBcG228f7gJ5P9mh05+rvLquvzgBWlK5LP10hM1HYVCD@lists.infradead.org
X-Gm-Message-State: AOJu0YzilKbra0MnlFWAt1FIpPxTWU9xMKqU8MqLjVW66ICdrumrrief
	MWHya7cPhqBzu5sB0V8PU0gn1CRvEu4fVtVj5pepUNT8hxKli+Uquj+aqAeoOCl8BOJOt4SLQ1Y
	yEpKwrLtSzUjMYLpxznFmpjwf59lU7RI8ZXNBTgvWOZVyL2A03gBRIsE+E7enQb4FAE7iC/S712
	CTsQ==
X-Gm-Gg: AY/fxX70ZX8lU6rOUBl/ysbQQLF7L5W85a6kyTKfUaJwchk9Lhx3lvblSsZ1BaEccFL
	bbzQpxBItryE6xhpNINS4+uTm8wpttk0c1pRr0GrtUBvK6/4oe+mX0ZTj2i5B8xmyazorqelPn4
	ByYzaADMEzduoZejVg4P0EIL2Ew/MxjjoNu/XbvE8sOwL/cjdGeEU6UUhtXJ19MQOzs8EzQz6TM
	eur9TyB2HR3cvDZCVALeynKAy0gLN3LEdhpXs6WGsNHk8lnF5bjNmUXTsSe9u9FOrq9q2ZfHiEA
	t5B+m71z+nHcfqOzuPisMO7X5eyBPBUbGiUhma4WYlaQS6OA5sVTpXN44Ehvw8jPR/n0S9h9VWp
	R+rgueM3gs4ZBd7KhSo6DqPYfZHHMVvjLy5IjxFshY9CJKhccZaFdkWk+Sdf66bY0lminj1IL
X-Received: by 2002:a17:903:2ad0:b0:297:e6ca:c053 with SMTP id d9443c01a7336-29eeec20c22mr11829625ad.28.1765433490858;
        Wed, 10 Dec 2025 22:11:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEP1MBAmTxcDM3jcF7DZAzVPeroWYEEpD7mILKBfX34r4oPJYP+nwbcPBWJ1vpa5U18NSbUmA==
X-Received: by 2002:a17:903:2ad0:b0:297:e6ca:c053 with SMTP id d9443c01a7336-29eeec20c22mr11829345ad.28.1765433490342;
        Wed, 10 Dec 2025 22:11:30 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea065186sm11725945ad.89.2025.12.10.22.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:11:29 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v8 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Thu, 11 Dec 2025 14:10:39 +0800
Message-Id: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBgOmkC/x3MQQqDMBBG4avIrDugqULqVaSLJP5pB0qUSSwt4
 t0NLr/FeztlqCDT2Oyk+EqWJVXYW0Ph7dILLHM1mdYMnWnvjOT8B+z/BRxSUY6Lcihh48H13tp
 oIvyDar8qovyu9/Q8jhPjpI+xawAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765433483; l=6040;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5BM2CWCRUwDmWsorg4jLpNENuRewNcYdGIPmj8dFZgA=;
 b=o57wJbiSUpppAVGEDZtAxfZ5CxfdD22rx+Jg53w0YJ28lr9+/IljDW5vy5EFinBdbwsAJIkAK
 ORm0mZ91Oi3BZdIU7ya5Kil0/YdqwFuHb5jD8AowaBvsRvJlYIxRSz/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Hc0ZjyE8 c=1 sm=1 tr=0 ts=693a6093 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=4JJaRIKzVo7dG1xzKtwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YGX3v3y7gS3DMIIwWSitRr4UHJyUwrg5
X-Proofpoint-ORIG-GUID: YGX3v3y7gS3DMIIwWSitRr4UHJyUwrg5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0MiBTYWx0ZWRfXzuYQEYPypIwR
 wGK3hOjB9npVAjUuTz24i0KjYVRrfxoAppr5/ZrkbWSY/MlM9+lDKlG9PtQFdjgdHVBLtg7XQsq
 30VLSJU0/m+MNisipWQ0GaPeytHqvQqotfv8cpVV4z/+66/I6kj6B7xmDneo9D1w1GGdXkdaXpB
 xFrExmYEcuJm0N7jJE88MqTsvJ9hdi4CwWsiOs6ZcMUCxTt9h9E+X1Mqo/HeTYKLaSnXyGkfWS4
 C7xe3LY9n5sbW83Vj4quME+ilnC4pPx14+J8L0gLxN/eQc353zjhjSIUqwFogathOIBMUCUs9ej
 PvwgEz3V8u0CtMw7hRaE68k+RxyfyShgJWWzLzPbdqefhQAxQJS1MDkD958UTE+M72JADUWbIQ3
 CoNrao5xJnEE7zTWv/WdzP1QWkW9Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_221133_903483_D45B2C3E 
X-CRM114-Status: GOOD (  24.76  )
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

Changes in V8:
1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
2. Combine the patch 3 and patch 4 together.
3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/

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
Jie Gan (8):
      coresight: core: Refactoring ctcu_get_active_port and make it generic
      coresight: core: add a new API to retrieve the helper device
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
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 107 ++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  62 +++-
 drivers/hwtracing/coresight/coresight-priv.h       |   4 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 104 ++++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 112 +++++++
 drivers/hwtracing/coresight/coresight-tmc.h        |  37 +++
 12 files changed, 824 insertions(+), 59 deletions(-)
---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251203-enable-byte-cntr-for-ctcu-5a4b88f2feb9

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


