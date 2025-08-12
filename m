Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77F5C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z1Lt7mTUh6uvsmhgYSXEZ76GSYjAMP1zqmiO1GoGrtI=; b=uE3P5Pym6tHtPeJRDSa9VLx74d
	xRj32v4Ln9QKXZCCgdco4Cc9Ou8LWcFGR2OZeTVOoy99yf4R5IQ9iC1MIh0vxSNKUUTN+A81WiBtZ
	BUs5H578IOj7/Rmrq8+GkNgqntytvtPDATT3nLwdxQZeG4s2vXHd5/MaDwPiCJD+iMI13MkyHzskd
	D8GUOT+jTuobL9EBVx5w9o6bS7PsGIrue0kmU8Y7zht+du2G7YF4qe49FZQwtaxvolwAJRnvX/Xmz
	ZWFhJWeF0luFt3dC7P8ggLHXhaLdPnItVMJZKfnMKxwRaPH+r2c+W7Wz7rVkPdJlS0ml4XDrEy3vN
	MM6SYO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloGm-0000000AkWh-1WqT;
	Tue, 12 Aug 2025 12:38:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkVp-0000000AGNf-1H11
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:37:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5Y07C028829
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Z1Lt7mTUh6uvsmhgYSXEZ76GSYjAMP1zqmi
	O1GoGrtI=; b=eIHbKDV3MjUzxC43bePYJ/T1dIk7iaXT8Y5ENuelPQWIoOpzngn
	VJEqyLVOBpnlpQyDIaCahVunB/E0SlDHfmHA/X52SCyDNOqzu7EWlOuquqTGCUZK
	8gq9MgRMQJT5HB2EDth+k/jkZDvYQ0SWn7NJzEZT1bAVF0iw9RqsI5Id+wkI0Uaf
	yFkWHrBhpVqkVh8jRwdg1z/gaxmzNGkrqYwrKtIPoSf2E+EywWYnoQdKzIkO4FCt
	ZYZmQFsI6oKLNm3fMgZ09Q+VCfQJI0KsfltOZImL+ioB0iFnZ69E5YjNJ0tRB//1
	ad36gw/6B0qd5GrmHuOFqmbdLB1cFsOHWNQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sqke1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:37:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2400499ab2fso47222245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987859; x=1755592659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1Lt7mTUh6uvsmhgYSXEZ76GSYjAMP1zqmiO1GoGrtI=;
        b=rS9sKnUduscy32QvsvKYDBKd4mndwCse34GTiJj+P6w/cu1GHJ0mKdIzEzCuPDLvQ0
         pw7fwLJ0WATCzOBNLjW/AI8iTEtn1dLnJVlakSXNjuxLH9P1xXtYBt8qnroFqNLpc1eF
         ueZA/gNcdzQUjI3NZQdXT1RDavjd+Es9OBEkPhbD2AGfGLpssh71rvPrc31FMLjVvqn6
         pN4QhoR+PqrUC7MkrmAqjyb2R5MPVw1jQrzv96YY9FhDN+eEemA+ErYo6OqaTl5t6wGu
         M4aPltEaS+bGB5KsoKpUaVVJyMBZA3HNCK8O0v4QYkae2qiOCSsw0QpCEd0X6DAMBZzC
         YREw==
X-Forwarded-Encrypted: i=1; AJvYcCV0bvSBUm2DNXpx8KsgG+SCvG061M7hjUy+yLwjP20Y7l4vGwcH9gDXSIw4mkW0lkYgfsIiaIcn042YPQAwrRUH@lists.infradead.org
X-Gm-Message-State: AOJu0YwJfKoJXqgejmtEEjf0cG1pSR40Q3U6jzfOqn17HkJlwO7iiQny
	FKch3ur3dRm9N1OEy+0W43oYJ9PqB6zOYR8a4lHf/79UDSI/17FCCqDVG/Ydc9prMi3Lq8KLBTV
	RfM/pTTBeysV0FquLc12TXHDGSTr3B/c5JKB3p51/LXMUT4erREYmOFtc2WMd2xdueUG/QFMdj4
	eHSw==
X-Gm-Gg: ASbGnctQZ+02V9Hdsa1YysxsjyLCq9+bcpdkpnLwI+pqX1OfyqL/wJy2C23CHlFVn1R
	FsTbEWlfoPA6JamYZKOr4GbnYn0ZPzN6Sotl/RApbYhFfp8DbWzGaTxk0RPle9jnmzVb9aCJJq0
	4+RQxAMdrlWaCEN2mfdo7PTQ+vKhe4cp67I3mlTuUBeXEAaF63vDStjOXQIMyk+7qFZONM5MEq7
	2URxHNFdefgjXHa+6e7goUQOYs+aJk2DnVm1oOJeHAuR1Zw7zDAe81yQn1EM0mqnzny1waVsEQD
	j+FreEXoohG9vNP3Y7tNOxntUl+1r2IRNGDI6iP1WqR5BH6Gae/ykygH5EM12330lD9WBDBxyRO
	eqtNt7eMsQ91Stkay3gU=
X-Received: by 2002:a17:903:1b06:b0:242:c66f:9f87 with SMTP id d9443c01a7336-242fc36f96emr37851015ad.51.1754987858529;
        Tue, 12 Aug 2025 01:37:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOIW2no7OJ6os97Vg5PQyYasdcSRJg5XoXMAC1vlcjWlUPX3TpM4GpyxqBcIUwLHq/CN1fyA==
X-Received: by 2002:a17:903:1b06:b0:242:c66f:9f87 with SMTP id d9443c01a7336-242fc36f96emr37850735ad.51.1754987858089;
        Tue, 12 Aug 2025 01:37:38 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm1915345ad.175.2025.08.12.01.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:37:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 0/9] coresight: ctcu: Enable byte-cntr function for TMC ETR
Date: Tue, 12 Aug 2025 16:37:22 +0800
Message-Id: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689afd53 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=4JJaRIKzVo7dG1xzKtwA:9 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3Qc0wkUfg1xBJ0QV8icYvfjcOSChrb8b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXyThmM9uNwbfu
 EyJgGK/zyu2B2Ja3urSEjJgjkpufRUJWchsb5qQJVZS7cC1yU9HycEsL1CDDQ5qv/Ww9CbzfX8E
 bnsjrfYIX9cm/wbUfe2OH4VH4OlcxGzGUc/nWXGyzM/yUP2Vv9kyswqNM3O+3Yp82mE8HOqH1ZD
 QV/jTVvM1OZcJomUycHQvsAfve7ppATqCn1Bwm4sGw+wqkzLAfgA/+HEl2fz00k1JFvDYkI0Vdj
 RvHNw9S8Hf/CBdQ3gsGD3fEuAEkbC5SA7TkCQyd6f6LKP2KdwziUhHx61M36G2ZbKttnZxYvWBS
 6UEG1n8Vyq8DXlknRFN9v54HWyk0pGdbWxs/5j8elluAetXQItQ8oYAxnDi53sCSJkPClg6tt6o
 pHsIaEUL
X-Proofpoint-GUID: 3Qc0wkUfg1xBJ0QV8icYvfjcOSChrb8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_013741_348415_AC84D9AE 
X-CRM114-Status: GOOD (  26.02  )
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

Jie Gan (9):
  coresight: core: Refactoring ctcu_get_active_port and make it generic
  coresight: core: add a new API to retrieve the helper device
  coresight: tmc: add etr_buf_list to store allocated etr_buf
  coresight: tmc: add create/clean functions for etr_buf_list
  coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
  dt-bindings: arm: add an interrupt property for Coresight CTCU
  coresight: ctcu: enable byte-cntr for TMC ETR devices
  coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
  arm64: dts: qcom: sa8775p: Add interrupts to CTCU device

 .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
 .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
 drivers/hwtracing/coresight/Makefile          |   2 +-
 drivers/hwtracing/coresight/coresight-core.c  |  59 +++
 .../coresight/coresight-ctcu-byte-cntr.c      | 368 ++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c | 108 +++--
 drivers/hwtracing/coresight/coresight-ctcu.h  |  62 ++-
 drivers/hwtracing/coresight/coresight-priv.h  |   4 +
 .../hwtracing/coresight/coresight-tmc-core.c  | 104 +++--
 .../hwtracing/coresight/coresight-tmc-etr.c   | 110 ++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  39 ++
 12 files changed, 824 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c

-- 
2.34.1


