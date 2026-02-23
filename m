Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E22EE98DEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I08651udBny38XHqapXkmx5xZpxZ7PFZzX6KyGr7ROk=; b=m4WL3jbyWUTWDX
	w3plc+vYuLTuEweOWASEr2l/nmDk/GYOfLIcdMzyxsmOtlm4d+2ggOGgPTnCS5pffuPnivL/4A/cg
	pbS3rR0tvuiWJgC9vM/DXdFKktsPiMasU9YP0wbzIyt7lRmT9YQja6fAHO6S3Vpn2L/i1ECZ1Fxv3
	ZlFDyNE9eeovZqUUp8XSdc2aJkjRwFMtz6Ue+vb9k5ykmpran4F6/cKyYVXs4GIxgGwZdjE4CRLvq
	dU2crrOb9MFGXSG+uEqqeSSbf8iSCDjA4PDrYbQERgWXc8YBdpUwKdgaPqb4qH+NETLulDGXIITb3
	30hs9lPVuTqKxOA1QKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPrc-0000000HKPT-3Tvz;
	Mon, 23 Feb 2026 06:56:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPra-0000000HKOy-47FU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:56:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MEv28o1857015
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I08651udBny38XHqapXkmx
	5xZpxZ7PFZzX6KyGr7ROk=; b=DkY4jUisJM1eVdcdr066JC92JZL6a1be+ikPsS
	cC9WzgTHtS58hrdSuUvR9OQKLz5P9M+6C5/mnEaewlGs+04gl+dbYFqDIA+U/ICw
	0VxHJoejWHIilQYEJY+JBZV+clx0WwGVEkAvVhveuOO3RySTFHkk/ke3hfnBbetI
	H8grgtYOyH1ld+HPm35HRkWxdsBJuo1/TSxSbxnqci5LmUVthCr0V3L/0l8krLzi
	8QHv9bmcKdrJocdZxUR/cNxtupeE8pN8F5EwsnbafJPVLodSirDufRgSqEYWNpq4
	BwZ5qb5qvLvfv9yKjIRwlweih9QbfKsYOEMd8j/BtRBPxMew==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vguq9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aaf0dbd073so51367985ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829774; x=1772434574; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I08651udBny38XHqapXkmx5xZpxZ7PFZzX6KyGr7ROk=;
        b=RsNgc1I6MMdoN022Rr2gH53btnfspgbx3BhdFOxt95jdivCYY7KW2ylI11u0liHlEH
         tBUOvKJDWsTfUeG6kFfU/gdiya00fr0xOPJerXiSoKJXX2IonB589NKxAjRYHQ2Wcd0u
         OGf27dCaFxFZT5fYlh0a13YGSnV8vWs1VtHtg5fQGrpnuftAhQmLesIK7V4vkHJ3LnKq
         sMNTcnnkoM3/OCragmWiZamZJbhQxFMzBYHA0nMbP3O39YKl/+L/S8NLbJgHvMdgoV0v
         NEnscdcxKLhHtXXZ7s5VtA9tSrfNjPNTXdJEPqtlwvdayDeVJkyTJmjdfAJAM576q7do
         3W1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829774; x=1772434574;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I08651udBny38XHqapXkmx5xZpxZ7PFZzX6KyGr7ROk=;
        b=SKrZqW/UD8n88aDgYUtfdSTLEiCf/1xFEH9u1Hpf6NL03yGW24nS06ZjtccurS6Uhy
         foRzrXlPodqaPRAhO4v2jv5Xg4hW9AxNp6opKzxAL+Ej+JuLYN5GLOAVRJuMjMF1qChH
         beaqv2wdo7eorzMwvq/TQivXoiHwdO6QYZI7T1enSePQj0RJ60DV7SWk6U2frVZ4n4TM
         GAlpjMC/e9bZjASleIzKPsUu1ZYIGqHrlCcymDtpupdfTcjPhLFj0iefdEMcmFcs5Ths
         MSxhpxnVJ2wEnBXI0q1OlHs8D28VoYrAYSM7s2nmmecYS/XevCM2eHVk04Qd//gV+y63
         QmIg==
X-Forwarded-Encrypted: i=1; AJvYcCX/TxpVHsYSg30tQGgoA5kD5Vd/PrN7QoCq941ezpWfPaR6yxnOctv0zjwTaHUWdWXq+Qqa7C9r4Yac4MEzGXTj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy32NKyhXOzSWjy26d2YfCkX0l6elsUbJUc+3aszsPlU6rAXcrd
	psjNqcn67Wt2Vf4KcTf8WUdqrMwF+BNW1/XTh4s4OFbE07o1/SLZj7F+w7B25f8IJUbDP6Xzk8r
	F1Evsb2kanq34qUBuAAlmzd7wV3byWBU9eCR/m3fXmu2FazucnbG3wDJCzzPGNZ5uQG2LKaYU0N
	cFqw==
X-Gm-Gg: ATEYQzz1uRQH/elSzSkpXDEcEbGLrgpB0ISA63Ka7NBycQLZQ3iKPWntI3KObQjU5dR
	VUmD1utRY5iYEE3Iguh/VUwzLmuqBsUF4nRBJv1/ZuQ9ab+thzxT1368yvDt14IkTxqR+irEZcG
	EGaEqll9GjVIo3KfyCuje3/dK0FaRTZ2+faRLsOsp/Qy4fO6joHVyXpyyO7X7+RAxhLxctBZUzw
	8C+VdsEK5g7mtDMp/1nYfH4qu//yN5BIuoStb35lPlcyhesPaHMRMGJ+1Ypp07taTjVJ3+nZDbW
	rrvdMvsvcUXkDcLeC+3rX0gsVwtB4Qe0mNeaKAcnSQ8m19SWzKVZn4Gi5y72PX186bB9/8EiF5y
	FxBssZVdmvdFZM1MI9ucGe2E7Uy4cmy817hADMvVKSIembpmnr/qSBbSqCBLVBAkKF1cf70X1nO
	5aSoSZePLRVw6z
X-Received: by 2002:a17:902:d4d2:b0:2a7:c2d5:bcd7 with SMTP id d9443c01a7336-2ad74464b22mr64330335ad.20.1771829773695;
        Sun, 22 Feb 2026 22:56:13 -0800 (PST)
X-Received: by 2002:a17:902:d4d2:b0:2a7:c2d5:bcd7 with SMTP id d9443c01a7336-2ad74464b22mr64330055ad.20.1771829773165;
        Sun, 22 Feb 2026 22:56:13 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f619f8sm62249225ad.36.2026.02.22.22.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:56:11 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v13 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Mon, 23 Feb 2026 14:55:40 +0800
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO35m2kC/42NQQ6DIBREr2L+ut8gWGm76j0aF4DfSqLQApoa4
 91LPUE3k7xJ5s0GkYKlCLdig0CLjda7DJU4FWAG5Z6EtssFcMYbxrlAckqPhHpNhMalgL0PaJK
 Z8WpI1hephZIN5P0rUG8/h/zRZh5sTD6sx9dS/dp/rEuFDFnNey3OuhOS7j7G8j2r0fhpKnNAu
 +/7F0ZlBdPKAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
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
        Mike Leach <mike.leach@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829765; l=8063;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=mkDR4OeLT5TKDRiAp9do8VKz/w5SpnyLF1bhRCG3lOA=;
 b=WYb1evk0iS3z/l7ocdgjooJac7HINoqprcimLWz8/yP5qo0c7VVXv1+Ek9cQlJ3ijjzseCqce
 NVa2PUK9CswB/vOBYljUCz1i9C1ceWootlbZ6jiFbcuD6oaGHiq14Tl
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OSBTYWx0ZWRfX1/6jmQh3e4d7
 Lr/MYoFv8IZcTCMRFgVxqr1rWAAk2FHnP4mOi3HcIyw1L8zwbRLIRy9mQXBebwCMmQoAeevJx7S
 m2bEBQxDqE6+C9NzNR8S9a/ooAKw96JSYB/YhQgjHpcX5YTrpuSZ1JQ0D6CpxvhfmIMjUbazok+
 uh/P7Tbqjat3StJrUcK9ZBCzuc7ip/QkuHgf3A19wh8Lsz07wsaNlBcrOVZn5cDRFJ4OwgPjNr3
 r8oYHeV53wP3a/3/sqiG1wo3AY/v9jmLmZt3v0Q4F4lar82a2coWqkliLSAbwHJpjJyuxXW0iAZ
 MSt/W8W8q1SYF3ZHCS8ESxoO/5Q4T95AwER/bIETYTxV6SnK8MwPBdl7qGSv5hPbA//HFr6VsAR
 aqcxarZsjm48aefRY+SlmHg54ZIn8PNsHAIa7y+dbI6CwWw6EmEUqjgVq/ZSEAkV6gTC7EbhyhD
 sTWbZhlhEBbZ5dm26KA==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699bfa0e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=3NKmYVG5dUn0lDVUWD4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: x9xBgpfMcBCB6tqfYiH4uAmlnH2vUKU9
X-Proofpoint-ORIG-GUID: x9xBgpfMcBCB6tqfYiH4uAmlnH2vUKU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_225615_038132_5274CF1B 
X-CRM114-Status: GOOD (  27.84  )
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
echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold0
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_threshold0

---
Changes in v13:
1. initilize the byte_cntr_data->raw_spin_lock before using.
2. replace kzalloc with kzalloc_obj.
Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/

Changes in v12:
1. Add a new function for retrieving the CTCU's coresight_dev instead of
   refactor the existing function.
Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com

Changes in v11:
1. Correct the description in patch1 for the function coresight_get_in_port.
2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com

Changes in v10:
1. fix a free memory issue that is reported by robot for patch 2.
Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com

Changes in v9:
1. Drop the patch: add a new API to retrieve the helper device
2. Add a new patch to refactor the tmc_etr_get_catu_device function,
   making it generic to support all types of helper devices associated with ETR.
3. Optimizing the code for creating irq_threshold sysfs node.
4. Remove interrupt-name property and obtain the IRQ based on the
   in-port number.
Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com

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

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <Mike.Leach@arm.com>
To: James Clark <james.clark@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
To: Mao Jinlong <jinlong.mao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (8):
      coresight: core: Refactoring ctcu_get_active_port and make it generic
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: Introduce tmc_sysfs_ops to wrap sysfs read operations
      coresight: etr: add a new function to retrieve the CTCU device
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      coresight: tmc: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  24 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 367 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 122 +++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  77 ++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 103 ++++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 136 ++++++++
 drivers/hwtracing/coresight/coresight-tmc.h        |  36 ++
 12 files changed, 830 insertions(+), 60 deletions(-)
---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260223-enable-byte-cntr-for-ctcu-9ce7487b3a76

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


