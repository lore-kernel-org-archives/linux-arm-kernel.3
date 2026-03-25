Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88860FEA806
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 05:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ID/7EugR28YqfHQLTwfLSnXn67+/nqpnOmTMVRL5Fxg=; b=liTc13hEY9FMdN
	G03OaMxBnYqlqQL6fwQKrWQ5MqQGDQDlBKBYKxhIdeb87oxetrjzinHyWqW41OaMLS7EzrAsfQely
	/aZlrOABPiyXz6jn7zZgmLZDGLpty7ToMqJBJez4Li/vHUjQuXI34ekKcBNwK2qAc9Uiv2Sn0obAt
	KNCBKsRX/Ia+JQT+lA9+Q/9VkAA3U2cUoLM+PPdWB9j1l7jSN94P63m/IoFADdt5u24jg6fNNJ2eC
	wQplIbj/72knUdeJaK/L5/3E5hBDa+VOtNaaKnkLj3mKZ7ZELugMNQqMZ1h8hgZtBrQzGU3i1AIac
	sHPqZrQIygrICLcIYQPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H2A-00000002j4B-2fAJ;
	Wed, 25 Mar 2026 05:44:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H27-00000002j3p-2WNB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 05:44:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5WdIs2075395
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 05:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ID/7EugR28YqfHQLTwfLSn
	Xn67+/nqpnOmTMVRL5Fxg=; b=YEo0dEffSkzdVQkEnPP9aDrktDhpd+0oqsd+wh
	6r6tBC3ObVBF8kd62GopxCjSYxBd9M0ApRHF3/zNQgDHCjp80pZm36QGJMok8BHR
	9y+YlGBFc/kOT4qqtTniwJ6zhSxJ7nMQ6XIfw2MaeJsUaYF14APuxSdZ61t92XV2
	3XOIZxZIs1k3o/i7vhJsaViDfsqm5B3ZrN4hVb/RA2/psk798agPQNbKnWH43Vtz
	vCSmB+wvgeEu4C/8DckZzA1a7lZ7ziZcD9QqCXLLJkvDmqHgHNzcC2z9Q+8S/J7g
	9ogydZTv4wF+rJ0D3ugTwRmXWpxLBtGQYeeWofEDwzTF3VmQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41411mtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 05:43:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b07bd30b5eso8588915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 22:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774417438; x=1775022238; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ID/7EugR28YqfHQLTwfLSnXn67+/nqpnOmTMVRL5Fxg=;
        b=YtYpxNaiqiu/Hr3PchmHL9g3mT7MNZJ6BzujeMMhdmeMBnpD1qSJ+e3MfuohnWjifE
         D/OY0H8mQHlTMpC4orxrfg/rVTXIqIuR8andiyJujyaUoAljewTmJsIna3cydBytTN93
         RzJv8sgc2eY9df05bpPcm94QNqFJ+YvWu+hmA8OQbb8UNguEImSbtaGxtBci2mtqoa00
         UH2cF5aoYi/sRnc/ZeKe8PqcgW95CPtCSzK3GJRx0JMeGVG5F7t+BbxzabtI7JYnip2H
         YfMOItMx2u4jIcjP7+p252X9arC4oDQi5v1a+MP8u1PZ/xzfHzlpPmdEVUlRVHqfTvt8
         bI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774417438; x=1775022238;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ID/7EugR28YqfHQLTwfLSnXn67+/nqpnOmTMVRL5Fxg=;
        b=slIy8pmjAflipD6Nnv0TQWLfxQ0b12dFpl/Pn3ivYR1eA9YJVrjTSgfzLgXzruOTfV
         o3e6N13JghFtMyksR2U9B+TSUOk4j1HYQTRUKz54gyjmPW4p+ue8vaQYxyKrW45lEEL7
         6GEUHrOw8nrIRqQdR6lteGSNP2/1vquZbIzhexzWZfldBh8OfzJH/cLqmg7bQsecMqvB
         xCJWE0H9iGMIfSHk3UvdC2mogdiahCvn8zlqp8qF+2m0o5RzZT3jE8Re6iLsPmKxswTK
         AlY6kWq5OIgw7uvsZ2y7z6KJFFKE2a4ZTGlX2O0I5q/RVMNNBaWjzvzrQ83aEck/wQbw
         sb5A==
X-Forwarded-Encrypted: i=1; AJvYcCUoeTd5CDnSXt3Wv6AzqZ/M+O6UQE0Driz71W6l7xRvdyDI84jWRYkmwGIzq7ZPoFtFIIt3P1aza0/IqZ4O/KRD@lists.infradead.org
X-Gm-Message-State: AOJu0YwZgAMkpMYleR2kPR/xAHt4YKOALGo5P6T0LTOTuac6jBQ3f2Fo
	VzFWOnQC2XOFJwwoVPJbTYgovqCKCheuhLLs0pw8an/4FvJVAvS3BnzR7iVUC+lsH0kK7yBThNB
	yt1xIdPu+C667NlE3vI578S+6gIBgiG8ArmcB8gBl/vIDx4u0aAy3+IkPByBL3rV8BEUCkIkp91
	14Jg==
X-Gm-Gg: ATEYQzy4qjImOyHW5LdCOs3JF0I+5Zwc5OVqBcIafzyRKoHqZRz+7lNoAnXHly6bL+3
	ykKoYx8PDcqNTUHCxj04fcdEhkexprPUMlgGT/QAIu3BgArpdpgL5OttmNjsd3t9zeF2l/OhJy2
	BegR3x5lGC3iTgE+rUuomiabBaQUf56AEnXRRYLe+vv30h4nQsB+xmyvu5GDT6ur6WlbGphZBP0
	ef17vJFuq1HVyzOax3/ci3YxOo/MWd52ubMj8zlDAGNviPmN4MiX0Eb/sksxS2yLjD4PutRtuIM
	vlYi97RFJ9RBNaMLvtRfGv9s9+3BOx5c7/n9O/d6yDhO+u7XDRReSJAWF/gHvMLdiBwqKlR8UCB
	/fs+VLYlYzMdbdWu1YT7qDqLHJscekYziiGQeB336vWumTevqRR8MtZv38zJiRJZvfcQLe+wmPa
	MG9uKddrC8bmqqBw==
X-Received: by 2002:a17:902:f685:b0:2b0:5722:f89 with SMTP id d9443c01a7336-2b0a4d9b1fbmr63035845ad.7.1774417437580;
        Tue, 24 Mar 2026 22:43:57 -0700 (PDT)
X-Received: by 2002:a17:902:f685:b0:2b0:5722:f89 with SMTP id d9443c01a7336-2b0a4d9b1fbmr63035535ad.7.1774417437049;
        Tue, 24 Mar 2026 22:43:57 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556f6sm219985805ad.49.2026.03.24.22.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:43:56 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Subject: [PATCH v7 0/4] Add Qualcomm extended CTI support
Date: Wed, 25 Mar 2026 13:43:43 +0800
Message-Id: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA92w2kC/3WMywrCMBBFf6XM2pQ0fURd+R9SJKRTO2AbzcRQK
 fl3Y/duLpwL52zA6AkZzsUGHiMxuSWDPhRgJ7PcUdCQGZRUnaxVI3ANuAw43GwgoaXu6qNFxBN
 CVp4eR1r33LXPPBEH5z97Perf+ycUtZDCGNPVY9VWpm0ujrl8vc3Dunku80CfUvoCvMwESK8AA
 AA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, quic_yingdeng@quicinc.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774417433; l=4099;
 i=yingchao.deng@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=hfNnIy09gQAwSpJazpfbAL4y9Aen7kUVg/JvfuXPoDw=;
 b=P4Jlubq3F4tt8/Su0mQVOpNpkE+VV20omltfz3xu3W51uzkHxUe654MtS2uJ34J8CmpQBAUpt
 iSFqlOfenO6Czfzxy7Q3Z/34tGMKShMlhs6dRaVFyOXAObfng12bGfz
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=5tp504LR96W2IVT3sAbRCqWtoG16CxJVUnXJSfU8NlQ=
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c3761e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=ivfPcWm90DfOTC_Zvf4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MIz1oGMT8nUdBr9k73LB0-aIiYS42kHK
X-Proofpoint-ORIG-GUID: MIz1oGMT8nUdBr9k73LB0-aIiYS42kHK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzOCBTYWx0ZWRfX03+1X4shzEXZ
 9Y6mkEqAQTThVWeGeZcTv1FqF7pXiJnMalGreKr8TTLvIDHBQDbjmf8EwRor8Este+kcqHI2DC8
 vxAdZXzS5Lkr5DHt054oWbQ+WARIJcXz/kYv0RlxSo1f7wVawByRInzeM4HtH8mtkDSIA2VhErx
 ShFHnveFRuUsXKK2mJ3eyUvDbSNaiVR1r6QqOr29Bj/05bby4z5me86NiGqZf0R1P7o8YshPctv
 qqSutr6O2hZanM7RjQtitAwf5BJ/QGIJyHkJJBjXsu0eHz+/H7hfYckPHBeZ6wyD2V6GA1vSvAb
 ZuIr59a9pbwAFk0DonRaifC+lvvvaJ6l9OKNQc7yjHctjD7N9YyZ/awW0GMy6f6kfKAvZ0Qd5HL
 GGEKKdcW1MsS5HXm0w0mA5dYmJJCwSaR0ltAQhLwhjoQbGVrUTrCvLzlc/SGBb9EcaFkmcgG5Ds
 DiPhsz/RKNBIn4tO0fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_224359_652271_DD47AD22 
X-CRM114-Status: GOOD (  17.65  )
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

The Qualcomm extended CTI is a heavily parameterized version of ARM’s
CSCTI. It allows a debugger to send to trigger events to a processor or to
send a trigger event to one or more processors when a trigger event occurs
on another processor on the same SoC, or even between SoCs.

Qualcomm extended CTI supports up to 128 triggers. And some of the register
offsets are changed.

The commands to configure CTI triggers are the same as ARM's CTI.

Prerequisites:
   This series depends on the following CoreSight fix:
   [PATCH v2 1/1] coresight: fix issue where coresight component has no claimtags
Link: https://lore.kernel.org/all/20251027223545.2801-2-mike.leach@linaro.org/

Changes in v7:
1. Split the extended CTI support into smaller, logically independent
   patches to improve reviewability.
2. Removed the dual offset-array based register access used in v6 for
   standard and Qualcomm CTIs. Register addressing is now unified through
   a single code path by encoding the register index together with the base
   offset and applying variant-specific translation at the final MMIO
   access point. 
3. Removed ext_reg_sel, extend the CTI sysfs interface to expose banked 
   register instances on Qualcomm CTIs only. Numbered sysfs nodes are
   hidden on standard ARM CTIs, and on Qualcomm CTIs their visibility is
   derived from nr_trig_max (32 triggers per bank), ensuring that only
   registers backed by hardware are exposed.
Link to v6 - https://lore.kernel.org/all/20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com/

Changes in v6:
1. Rename regs_idx to ext_reg_sel and add information in documentation
   file.
2. Reset CLAIMSET to zero for qcom-cti during probe.
3. Retrieve idx value under spinlock.
4. Use yearless copyright for qcom-cti.h.
Link to v5 - https://lore.kernel.org/all/20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com/

Changes in v5:
1. Move common part in qcom-cti.h to coresight-cti.h.
2. Convert trigger usage fields to dynamic bitmaps and arrays.
3. Fix holes in struct cti_config to save some space.
4. Revert the previous changes related to the claim tag in
   cti_enable/disable_hw.
Link to v4 - https://lore.kernel.org/linux-arm-msm/20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com/

Changes in v4:
1. Read the DEVARCH registers to identify Qualcomm CTI.
2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
coresight_cti_reg_store() functions accordingly.
3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294-1-quic_jinlmao@quicinc.com/

Changes in v3:
1. Rename is_extended_cti() to of_is_extended_cti().
2. Add the missing 'i' when write the CTI trigger registers.
3. Convert the multi-line output in sysfs to single line.
4. Initialize offset arrays using designated initializer.
Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_jinlmao@quicinc.com/

Changes in V2:
1. Add enum for compatible items.
2. Move offset arrays to coresight-cti-core

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
Yingchao Deng (4):
      coresight: cti: Convert trigger usage fields to dynamic bitmaps and arrays
      coresight: cti: encode trigger register index in register offsets
      coresight: cti: add Qualcomm extended CTI identification and quirks
      coresight: cti: expose banked sysfs registers for Qualcomm extended CTI

 drivers/hwtracing/coresight/coresight-cti-core.c   | 114 ++++++++++++++++-----
 .../hwtracing/coresight/coresight-cti-platform.c   |  16 +--
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  |  75 ++++++++++++--
 drivers/hwtracing/coresight/coresight-cti.h        |  30 ++++--
 drivers/hwtracing/coresight/qcom-cti.h             |  65 ++++++++++++
 5 files changed, 247 insertions(+), 53 deletions(-)
---
base-commit: 5bca1f031b65a4a8caf700537cbbc770252af475
change-id: 20260324-extended_cti-707638ceee9e

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


