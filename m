Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72216E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 06:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VCT3j0UcXp+kOaMXFu2vBN+sw8dRf3kApX3hVIY/bmc=; b=FdnWCFe/tFmTnS
	uMH+OA/zCX+uNTfeDQFohbe+jNn4G2+hvacVajzzQ0QGb2fg5DQR3n6bQsAjh3G0+lbBQgcUPxzvY
	HrwOHSOnFHg7eyBTLPf7YDb6nyxgzKcXBEF6kgRB6s98PzpnNx0CIG4pMxgnYFSb7AuL7a0u5Ugbq
	iOx9avy7pBwwbgT/6RhvEUU7r85QjDXSMNhqisXUtjyZnPvgUKM5yfMD5xGHAS6dVSrLc9s6t4NnF
	MnBod2LiDWyvICVPRbR9dA/rKQLgz2JqjVZ6gweG62eRgb2zYzh35IcHGXmHSBCQ4tyvg2QsoVx1M
	7ekhA+x4mel3SiRTAJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZ0V-0000000DEFs-0ruX;
	Mon, 22 Dec 2025 06:02:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZ0S-0000000DEEm-1KnT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 06:02:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLM6kEi4180499
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VCT3j0UcXp+kOaMXFu2vBN
	+sw8dRf3kApX3hVIY/bmc=; b=GWds+MODcm48FK7rB0VyI0AA7ONcsT1bBekXhj
	GV4Y8tk2/StmYlfkDibmfhHEJaJHYfTgkZVdHri3RP1usEMeFLJY5icSPboqNfFa
	ifnnrnAZKP9DTkfvdvfwwnf1snINaZGbKbdBLudvTYTu48uq8YWgzBLel6DwnzYz
	WmnYDdcnMEaSFjFma67y2YoM+aL3CnhYLL6qNh62WZaLpJG/vqy/cvbTbalRZu7a
	jshexo5zQOLJbgJSL7OtmpM3mlKgkUx4PDsPlN0ogP3bN9ve8att3DLdKydoe05r
	l1alJbwg+5sXKydMesNKUnUdOZ7LEFlr79kWyCi9Lcl9ERzQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrabuc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:02:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7ba92341f38so4105110b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 22:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766383374; x=1766988174; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VCT3j0UcXp+kOaMXFu2vBN+sw8dRf3kApX3hVIY/bmc=;
        b=Xg9bjjE/At7ka+C5vtfgJYbnoS+d+jv5AwuApzt0fDYqKneF0HKNeLlb+h5smBNmCg
         tRN4NWsHMYFyGtz0ID4U/4XX7pUHIQKUyDL9xXaFJHw8hruUGzZjAqDOKt+lLMRIPBJ3
         itp6Dm3If0wGSzzjMquJEyORt+3TwC5MEIIYK0+d4zVWlt6ueyM+OVfgXOXsb9tFAH2a
         dl0UeCUMogL2ILmi3o7r8LHlOsSBEEL+RedIrf1I/+6PgMY0h0CgAz7qnVgxvCYZ35Im
         Ccn/PPt4VhIfWJeUPtBRttFbT0Ted6dUg6uIxCnEDfxWdVH8+37wxscdmTwSSnlwbWcW
         pzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766383374; x=1766988174;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCT3j0UcXp+kOaMXFu2vBN+sw8dRf3kApX3hVIY/bmc=;
        b=uX7Lrodkv+X8UVQ/Ug6uvXI5WIK/DDOeHZd51Z2Wi6Y8Z9+D2TxvCYglb8Bp+Owz7S
         kpABROavCDRuOFD6u2iYs4iOJwffJslVbWTrFNMOzgoDWsH1ke/niq6utlRO/GSFBqcW
         Ftbf6i25R0C59Gz7qib4erNwRfYU7TL4abKFQt5SgJTF346i+Bwy68yoFH46Aorx85Qf
         ZSzZE0rHjVRR/pKjJ9NrUxWTSb3FJ7TpKpV/lLEjp5Pbh41beyyFKB6zAThwQ+QXE1AX
         ebp4TVXJunyroLtlmPFnAYLJeZiwi2aUNHZXVO4DGPJ0Rzy2vwSTNj8mmrM5UklvPVjR
         Yc0g==
X-Forwarded-Encrypted: i=1; AJvYcCWllK5tqeWIuLQt+vvLBkmIpfTvlPiON8cahvN6eB+Eeqa6RNQTVMuPlR+BF/lO43U3dcWdf4LX3uH5ET2QEnNf@lists.infradead.org
X-Gm-Message-State: AOJu0YzK5haGlODY0cStRHjX3Ghpo3sx+mapk5v4SwE7LTvW6tzY4E09
	8ks+z96BZxyvPAxv9RDq5JodSb5hmpuDYVMUcCY0Zlq3So+ZjCr3CJVOIGadhye6BTgdPqOe+XC
	XyKC9rERuNqfZZgcRz19FCVTvA1JUnUsISdmVe2j/MJwgpwDYHGx8AwOnRhkAGLLwODDtGFFemZ
	BqOg==
X-Gm-Gg: AY/fxX4QmPrQn9Dnwlew0sYlSXdIUyUOv8VKIybJX9L4vBZuIzVQ19puRjdWUwL4Bkm
	+ruiWkEQ0a/e/UwEhZPCiXSyT1uIAYnJVu2AeGgq9Zi8oDhtEFlAREpjL1ureYesvF0RaD/ZHRs
	93PtSoitOf/Xjtt+3zGagCi+tdc1W1lM4ud+I4mhWMa0FnIwQmHOEqeSk39Q9U5TYRKzsIQuILz
	RHyp67XWJlf5RgyvxeBfpvbUEoSWb7zXKf7q+dsj2flxzGe1HiZGR5m1QPW7All6kcvNHMAdOx1
	9r5UCijllGobtgz/KdzdReoFrms5WUY6/ZbCooC3XgaybkNGyq6MzikZ3IcmfsFMk/E2pOlfDud
	PV6ZWCT4YitkiYYiFzHFXbyaDEE6YtZYLaiGeSnLsfscAYwjblm8VOcAmgXGFbufj5yVgBcLT
X-Received: by 2002:a05:6a00:4392:b0:7f6:4922:89cc with SMTP id d2e1a72fcca58-7ff67258ed1mr8611997b3a.57.1766383373983;
        Sun, 21 Dec 2025 22:02:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkhgQ76Z/PUL7oSVbvBKE2bUsi57bF/DC5lWkXog0Wg0/baQvhpvuKs1VrruaG3J5LYeHqpQ==
X-Received: by 2002:a05:6a00:4392:b0:7f6:4922:89cc with SMTP id d2e1a72fcca58-7ff67258ed1mr8611977b3a.57.1766383373482;
        Sun, 21 Dec 2025 22:02:53 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e892926sm9070130b3a.66.2025.12.21.22.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 22:02:53 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v6 0/4] add sysfs nodes to configure TPDA's registers
Date: Mon, 22 Dec 2025 14:02:20 +0800
Message-Id: <20251222-add_sysfs_nodes_to_configure_tpda-v6-0-b27143d45c86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7eSGkC/5WNXQqDMBCEryL73Ig/ja196j2KhJDdaKBNbFalI
 t69qTfoy8A3DN9swBQdMdyyDSItjl3wCZpTBmbQvifhMDFURSXLqmyFRlS8smXlAxKrKSgTvHX
 9HElNI2ph5bmpm7S+lhdInjGSdZ/j49ElHhxPIa7H5SJ/7T/2RYpCGN3WiJZarIt7YM7fs36a8
 HrlKaDb9/0LGvYdjtkAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766383369; l=2524;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=S+yfbMlSJWsUoRSjq628H0fQiNMsL6sRDB1w1wWbFsY=;
 b=1pp3l7sWSMJVdi7PgivO2ViYFv4uGGfmRmU5V2gtf0z+NhTKEvS086henaZF/EBDtJHMicWKU
 RbYwdKnCb5UABLhIVaQGE2TBVfP6q9d9fd4Y8BjNyIZxX/VRBvyGEAY
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: YpgA1i_vX0SJWPLvp9EJRDfC76SHzlvQ
X-Proofpoint-GUID: YpgA1i_vX0SJWPLvp9EJRDfC76SHzlvQ
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=6948df0f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=1JDuGk8-0u3ZF8p8n34A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA1MiBTYWx0ZWRfX9NXLi+BC2k1w
 aPGAkrtNq69NOIJp4sT7lWCM+sddJF3BlDFW0U8hXirqrcSZpe6Zff9KloRZgWQX2TbnLmoCzBH
 HO9wJkLYDkSgU8wn76aNkNvqTjt92ZxMPx8AZPD9MOxvGpNp2P7jAFj5GFNAy2HrXu71Q0D5d/1
 YaHPe2nprctqOYsf3bquJbHE2gtoxWfa91NpexcUd5HMYiVbnFuO07JHR6rFp0vKKoIKp4s2f5L
 s5Q7WJn90q+t9zn3GNqBu3JHGi8MZmbgogpgzyPBsk1afX4TUw64XUlf33rA95tBbNgOjkSsURD
 /z7XPeQJzA71jRH90GLj6nmKcXhCPF6BwIfyeCHwVqCJfh9qzZiL/ogP9c9WxD14J9g/9F+cW7f
 fsQ6cesk/crh2qWGs40XtfpfhsO8/h4R8YQ/J708l8tjjvzJdCQkyyU9j7pSUt5Zv+RHX06Q4TO
 Z0UxnMSukaaBzpx19Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_220256_505473_59A1432D 
X-CRM114-Status: GOOD (  13.49  )
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

Patchset 1 introduces configuration of the global control register with
appropriate values to enable proper generation of cross-trigger packets.

Patchset 2 introduces a sysfs node for triggering global flush for all
ports.

Patchset 3 introduces a logic to configure the TPDA_SYNCR register,
which determines the frequency of ASYNC packet generation. These packets
assist userspace tools in accurately identifying each valid packet.

Patchset 4 introduces a sysfs node to initiate a flush request for the
specific port, forcing the data to synchronize and be transmitted to the
sink device.

Changes in v6:
1. Create a new patch for introducing gloabl_flush_req sysfs node.
2. Add a syncr_mode sysfs node for TPDA_SYNCR.
3. Remove the redundant attr_grp and consolidate all attributes under tpda_attr_grp.
Link to v5: https://lore.kernel.org/r/20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com

Chnages in V5:
1. Optimizing the solution to creat sysfs nodes.
2. Optimizing the logic for configuring bits of the global control
   register.
Link to V4 - https://lore.kernel.org/all/20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com/

Changes in V4:
1. Document sysfs nodes with correct kernel version and date.
Link to V3 - https://lore.kernel.org/linux-arm-kernel/20250827105545.7140-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. Optimizing codes according to James's comment.
Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Refactoring the code based on James's comment for optimization.
Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (1):
      coresight: tpda: add global_flush_req sysfs node

Tao Zhang (3):
      coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
      coresight: tpda: add logic to configure TPDA_SYNCR register
      coresight: tpda: add sysfs node to flush specific port

 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  60 ++++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 240 ++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpda.h       |  74 ++++++-
 3 files changed, 367 insertions(+), 7 deletions(-)
---
base-commit: 12b95d29eb979e5c4f4f31bb05817bc935c52050
change-id: 20251219-add_sysfs_nodes_to_configure_tpda-f54636512817

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


