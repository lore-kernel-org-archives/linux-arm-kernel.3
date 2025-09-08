Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6390FCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 02:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yoV1214w9m4MdRhFcbUnI+7YO3fgfW36gurgCqQNvzA=; b=CpcAoSdC338qU0
	0s6T5aAUxP6c3GGRWaQqaU90G6cufmiTJtRzuMjt8X1lKXDk4gx0zP+rpFTFmSWT/Sm8pA0gcUPIQ
	bhCRAtyyVz59SCR+Gq9fgHMSd4Ol4uWUxwPGrh5Gv6R1rLKpjJ/EeCYbLYCU8LBEwHdhDvV2aNwvM
	6gHkeyGB6B1URLfnc59K8vIJin379aeZqi1iG8rWpK80U6lWi6NshIh+fl3Iu0RkO57VGMOJwvo2C
	pYQGkdjY2QMS0J9DQdaJPcKYpAtmTaHmBinYhteHHkKJwujVEzekl72r2n+sIcFKs1KaI6t2x/ghj
	kuVOIjxBPOKNGXQKawhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRG3-0000000DvbF-2BSh;
	Mon, 08 Sep 2025 02:05:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRDD-0000000DugJ-0zc3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 02:02:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587MN6tw032063
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Sep 2025 02:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yoV1214w9m4MdRhFcbUnI+
	7YO3fgfW36gurgCqQNvzA=; b=Nk4C1CQpXlsn7EqrlSsnFIywu1uWXKqKlGqVAq
	rE+Rl1kf/N1JHtkzdYEXYjwDI960Lmil/UjXhP393OmbhxSCnqbFitu4uakV/iBU
	qBJ8E0cRhkxchODp++5KU2cxKCzgJ5yictWxf+jKSdB4nboB1nHvdSP6ToB/5v9n
	xQxfRFwIXIKrjTW4H+DQ0Ui69BfU1cnzfG4Gcir4eV9lZhZpspJ+Qf0Tr4Z8xwUT
	9U2jZbd+GJEuPuQIf1qmzi6+ucSVL6oU5pS7l8zHdNccN+tzzxaXdg3t5J/RzoZh
	SZHfKuwD/xX16+nWeZKNvu2j3OSxEghbEjpxiJkFOA0ZUQEg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0jxk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 02:02:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7724ff1200eso3454243b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 19:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296948; x=1757901748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoV1214w9m4MdRhFcbUnI+7YO3fgfW36gurgCqQNvzA=;
        b=q6zPGKU2PLgaPXzUriBCATDerRIb/DSnLd3w9Fdn2Fd11ZKJm8DkzXq2IgFfUmkJtV
         AqVisSZx1H4Hje9r0+rYMnzhNz8Udo5WV0ALMTcxsDict9Su4v6C46xqojdl1a8Eirju
         BHkGcpFki9OeSd0vCMACus0Va9DqOM/zYE9uM1sw9o/k13Vc5Bl6kQ822yazcMfS/Hig
         EBTUwISu0pLjhHUf9G0VtksirpCi2GLjcHfJ+0a0g4RkTx0Gdr4o3JVWizvkXxEvGRe9
         VJh7K4dOWXRyXcrG9GFliJsOrO63KdeLooSQmBdn18Nu0smCswtB5D7WKL/NwZqFcmmi
         wmMg==
X-Forwarded-Encrypted: i=1; AJvYcCX4qo5Ghei8zPLb3dOMz0uknLZkZEMZG5FKS50zy6nx2FbghvKowl4qwq7CMT3MwnyLGa1qfIh4nm7vFVJ7M0+y@lists.infradead.org
X-Gm-Message-State: AOJu0YyNjpPWfTXkPMpiABkFNj8IQEhd6tetViFxNIKwBTlDIQslwx+u
	3cw5ksjmAuE9Mx1QmwolbR8xUWm5YhAAaxyvdp+MB769s69os7Jkx6SfkZ8O8cS0EfLhPEdi5CH
	oERHav9iihoEKxUU23DHjVMBraTZ3z7EfvjRTeYUiZVanMaiVuDgbXEEfIp/7996F3PC/3Dcry5
	C9fwdJ+sENAsQg
X-Gm-Gg: ASbGncuAvKIOoanQi+aMAHgv6rGQuLvntEWEEGoA0sGiHmnrrBVjiGqc0lU+JVekQcA
	pGA6zfAbo0Doy2M3oNgPBq4DRk5ZlMOcpgXL3eDXwSvpItc8BQI1Yw9R+ZFzvJ+70PJpb7X9aTz
	v4Qs3EYNf7LD5h1L3xksG1rl8twl83q4DUxDgol45bA9PshuorvP+ssnXKtxxC+TiPzfE4e0EIr
	9UjdE1Ew3c9nuYCitu/tIA5COt0jTVCcjLOpZEKMeAD8NIVIy/TY3u+3+n8SshZbuCe+4OrUFOc
	4vm/yMwr/vLCseS/1z1Muy9RbsWNmkt2iYz4F8621/yGESK3TQDF0zsNQw6UGOM0AQW5Btx+cgx
	9BqO4Elpe9ikKs00FxE//5RxnVJU=
X-Received: by 2002:a05:6a00:1996:b0:772:638e:5f61 with SMTP id d2e1a72fcca58-7742de6fdcdmr7012194b3a.30.1757296947014;
        Sun, 07 Sep 2025 19:02:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc+g3yuUbloYGNpECYFQ5mpX5NmX4kSQdUKemXIAqYso/plZARjLfRT+z1zpo9pZgH+Ci6Pw==
X-Received: by 2002:a05:6a00:1996:b0:772:638e:5f61 with SMTP id d2e1a72fcca58-7742de6fdcdmr7012155b3a.30.1757296946428;
        Sun, 07 Sep 2025 19:02:26 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:02:25 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v6 0/9] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Mon, 08 Sep 2025 10:01:52 +0800
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABI5vmgC/x3MQQqDMBBG4avIrDswKIr2KqWLGP/ogI1lEkpFv
 LvB5bd476AEUyR6VgcZfpp0iwXdoyK/uDiDdSqmWupWBukY0Y0reNwz2MdsHDbj/PEs3onrG/R
 haKjkX0PQ/71+vc/zAtbObEBqAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296939; l=5486;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=dyqo7JudljblWc6HLE7pKuUumHsM5eHxacl7uIaGJ04=;
 b=/yeUaHpdizTMW9GOyBdOjn5ZVmJ8Y1/KvDNh7jwUI4URuGBXwisiLFz69WlpuOe8Zo0NKc+ew
 YzxMZWKc1yxC8hwW6JuxFHxVmLdQ2IdAyJpeGQghs+CWvhTjbdqy6NT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Proofpoint-ORIG-GUID: QuXK4x_hBWX40i4favOnZLXKvX9hiVaE
X-Proofpoint-GUID: QuXK4x_hBWX40i4favOnZLXKvX9hiVaE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXxWxdG4MaBsw/
 0sGY1zODyLnxLDaC97GEYfpy03McDG7ob9MBkzlzKLhkjutuD5G2mlrJ/zDIRyD4z8sMxJ/hm37
 IzSA6nMbknk8SCw7lSIRnhRFgrZCqgRzfKAYEvdGL6jkRMUnm90+V78M894xNolQzQbH+Ipzo8H
 xl+oPX7C5/g4VYHaoQNnL1K0OCbbWMPMsBdU1rvXxQsNpHjwaSw+IEvWUgeyE/woseii7VHPQac
 vqa9i50WNZ2DNisYNpNcK+OsxiiSlW+DEMhXJr1GWp3WHNSBreKtLzpMIZSUDw3tjqDKCbN6gp+
 V1sSZHBysHHTuYRVbz0CUwdljFzwP13Aoj0XqYR9RWdBjzRN02J+H5Fp3R5y3jreHoptppeEnwp
 1u7F3mqy
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68be3935 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=4JJaRIKzVo7dG1xzKtwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_190231_399210_16B89846 
X-CRM114-Status: GOOD (  25.11  )
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

Changes in V6:
1. rebased on next-20250905.
2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
   lemans.dtsi.
3. fixed some minor issues about comments.

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
 drivers/hwtracing/coresight/coresight-tmc.h        |  38 +++
 12 files changed, 826 insertions(+), 59 deletions(-)
---
base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
change-id: 20250906-enable-byte-cntr-for-tmc-0ca0a83e8f93

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


