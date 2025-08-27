Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FA3CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9wdkqfpaZOOvxTwoHvHvU8nhHI49YCbpuNrKJU42fBg=; b=yPxb3PRhRVPJh5DksE9sIiZimB
	VuuMioXNIOBWB2NAP8zbUg0+Ve83VsMMdGjX4Q3N3olBoYN5GcU/cj0iUGLN37J2fNrJwLNehewat
	dkCBa1gQuKHm8THnDKKsf2EpMG6mK8pwWej9/cCva5kNhwrTFXfC3kuuEkA+fC3/YuV00ZDFsIX5+
	zMG3wfkt1QqTargZirN4Uum6Gp01NQ4fso49mU9WBLUZnvJC/bT2D80giG/dJ81ZkJMrb0S2xnF+G
	z7iM9/Yq91vptwqCwD5yER1A+5TI5Y29v9CYct3jOB+kC4TtNsq/4BGoArQbIOU0zAb7jL/HY00cF
	cvijNn3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEYp-0000000FJtr-2DOZ;
	Wed, 27 Aug 2025 11:43:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDon-0000000F80A-2SDK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:55:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kNEO023132
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 10:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9wdkqfpaZOOvxTwoHvHvU8nhHI49YCbpuNr
	KJU42fBg=; b=QQGO7KczCjbgvYYk+9uhic9rtK0iddHdETY+RpOHmkKn4up2YXn
	L1Q2n0ZfFDweFi7bZrN5hnOvJEwWCPUNlVxsJY3qdyCNIUo+2qk//dWhwyulZQc3
	ibNg1Pik+KCZdEk/Fg+yM0Q6I1YtAxf73Jd1ZgK22qkuQqoccFQpsRNRvd/ZziT2
	1aDoGUzWMxGY6t/jP86V2fQ5rRdeU9ibCoKmD+wCMFuQCQHLFaAlmSKM8+7NFMlh
	skmjYHRYKlOLd+3mCESuErznGZIvHxRiH9EWUDJoYEzTlOnlpHVitm2mqlMjQ+z1
	B1vBSEyaCnmNk7j7nQaU7Dm3842OdDTm8MQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5m7cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 10:55:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-771e331f0fcso2611958b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756292150; x=1756896950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wdkqfpaZOOvxTwoHvHvU8nhHI49YCbpuNrKJU42fBg=;
        b=fIRlXEKJkDtvIFW0phy3UGIdybth0YRB1xQMP+zjoRG1rxvuMZPPBUgS1NyJNqeW1n
         XVrW2V5rEwS7woXiHpFFtBIh8+d7lkYkPUM9P+9nhW7ORYE8tpzRFvvD9kZc/YU8OPFM
         yPqSLZimbj56g4E2tDsTr43NoX57bcbslgxTR8nM81qrwp9+eJmfMbJNhpQBD/3IosrB
         nJtxZD6LRuftO6KHHpJJ1qpitl5FROgtSYLNXDqKTL+gMd+ir4S38oiRBSGEPGE4m4Jv
         oMkAJInCSk0hyI2kKJkyOmU9MrVICYfFojE9XrK0rKMQVVpmm4RiJRQ7F40UtiR2VW7P
         itug==
X-Forwarded-Encrypted: i=1; AJvYcCWxLxXGSgrY/Mj8Ba0/3lWWO+dR326ERhsE3pMlJU9SrcQ+DIuKpq1vL3WdC34sImsHI4Cdxmza6URXVJLzulZF@lists.infradead.org
X-Gm-Message-State: AOJu0YwyaflE8S0blht1EOlAIberrufc0NWs7nu4snDY2wRLQiNaXTqd
	wlORMOiVzTMf2In9WFBDIk4TBV4rrdSVTsOvRyVbDlK68nsx7QqqRmkDHzpr9/LV2RQnpme04zX
	BixZv5vhXt3Ua9dcai1TQd48IBhey3A1lydFIBc9GR4dcdu+oOK3rmIvX+R+ZnoQzLLyHu2me3+
	3kpkNVotqzFIhT
X-Gm-Gg: ASbGncv9FxmgDzZPK/6nbEKFqbLaJUq3810/lYQFTA2iqb4ptTC0VJZHZOCHQKpr4Qd
	JiWSAtxcCDq05FRASynTsMT0iKQKwtzEgvC0VX2EmiRDZeTQ5XThX3lbCZ/JZwqmnkRd1R/fVvF
	465BzjX77GL3q/KQ3RDjNcKAU7I9fjTHDmaUS5LQAyrSbv2dFwPTvIiGn3HduUs7cALN7LptaE0
	JFJ807UTyW+fHZ0AE0dkU/xpUbvj8rOnzZFCbyQoE4ESx3xBSvwXYWRX6QOdxI9twsJ0sA/hQuY
	x3qHdEKGU1DFqCnQzm4CZO4KzXra+5jstudmMZmTjuuLw4uDWQ2xC5nYYQPoGTIVGMhL9r1nVUc
	9ZGNLZJWwCv3iqoc8AS8e
X-Received: by 2002:a05:6a00:b44:b0:771:ef50:346 with SMTP id d2e1a72fcca58-771ef50091cmr10777469b3a.15.1756292150577;
        Wed, 27 Aug 2025 03:55:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqpJCRpa3pgQwwL2DXQzr+CaxFnBbfnfaaX9zy/10KGXLksC4chuBLZap7O/yZiDteErLiCQ==
X-Received: by 2002:a05:6a00:b44:b0:771:ef50:346 with SMTP id d2e1a72fcca58-771ef50091cmr10777433b3a.15.1756292150108;
        Wed, 27 Aug 2025 03:55:50 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f2f2ac7dsm5573035b3a.43.2025.08.27.03.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:55:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/3] add sysfs nodes to configure TPDA's registers
Date: Wed, 27 Aug 2025 18:55:42 +0800
Message-Id: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXxl1YQvvEmSac
 OMoXkzOiysSQBRYznRFZ4TLgVIjITJ+W6/Xu0jUBWxilASQJ5qGULU/GrYerkybMxpAKhkeN6fJ
 21NjGUYASOgKQZWnseYDQK3JoBMeiVo+gxb2/XooZV+1yVE8lEjhgVCrNgUNBUuKrbwf8/m2Km7
 y4zKNXKv6ljMucJMzfMzOpAs2At0vMkmVqlO7wCQM4536G3e8vgA4h2TSNYV2FQJcMSV8ynOz4V
 VudT2jVlFafmco4g4E127QQM1ps1nnnG27kV5yy8V/7+oRTw9hmKJX8gxavyan7OSY7EO1pkbCe
 5QvwLah9kbXoXozs3138By/n2jJ+Y4FdRwLfIRo68aw9BZc0FYQ3k88KUZntMQbZveIs8MibOOS
 SgOBZ26U
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68aee438 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kL9tw6tk32Vw8pM4mOkA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: VhWZHsr1J2K7OwdM_xoW5BtG7tTujET8
X-Proofpoint-ORIG-GUID: VhWZHsr1J2K7OwdM_xoW5BtG7tTujET8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_035553_746504_BDA92D89 
X-CRM114-Status: GOOD (  13.88  )
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

Patchset 1 introduces configuration of the cross-trigger registers with
appropriate values to enable proper generation of cross-trigger packets.

Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
which determines the frequency of ASYNC packet generation. These packets
assist userspace tools in accurately identifying each valid packet.

Patchset 3 introduces a sysfs node to initiate a flush request for the
specific port, forcing the data to synchronize and be transmitted to the
sink device.

Changes in V3:
1. Optimizing codes according to James's comment.
Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Refactoring the code based on James's comment for optimization.
Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/

Tao Zhang (3):
  coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
  coresight: tpda: add logic to configure TPDA_SYNCR register
  coresight: tpda: add sysfs node to flush specific port

 .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
 drivers/hwtracing/coresight/coresight-tpda.c  | 278 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  33 ++-
 3 files changed, 360 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda

-- 
2.34.1


