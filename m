Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FD5CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 12:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+KblVWqnrcQ1YGvHTJZqI/1q++EEgqUk0YUHE+Mq35M=; b=Cx7ujeeiQ+EL3Ia9kNfMXbRnvK
	6QdbB1ZqVHli+v0dVdTV+B6I4sPCLTEPLpwFALYbwxyLmJH3OeFiVm5ydnZ4PmZR/CzOGV8CdErOK
	FfBcLFb2M6kJf3wP1ARBEBVUIFaInLW5tzB+2FIcTR0XxMjHzjgsfwlA73Kub6noZbwKUyKM14LRH
	pvDIEwR0XUHYXai3VEXdynbYZraIC6wu7lNmQ8WeWagZG7XPjiwoeopGsKtzk1fAIlQ18nlUBhw4F
	ETlvRCnDvY5hCrRIev9oUCl5sbxmnGhJu4RqVgp+p+3dPta2IbLhNy098DFYA5KP8pnmI8lMvWU3e
	WCzVwFBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc07T-00000006FXC-3NtX;
	Tue, 23 Jun 2026 12:20:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc07R-00000006FWp-2Cut
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 12:20:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXZs13752848
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+KblVWqnrcQ1YGvHTJZqI/
	1q++EEgqUk0YUHE+Mq35M=; b=MDTJXwf493TWigh9NJNfuYpSVEBYPxoCmWI+yv
	WrU/nAcqPopzAuR9Ia5erv/ccTMfF6R24bDoFyfKW36UPjwIUjJypRvq82nlF2Hb
	XD44LPyrC3g3XWTDKOZqCMq1MXraXCsoOp0v3D9qfQ671lzSqYEdLKxPQtgDZift
	vWUhCo8JnAyiPfTj4Bipsnbfvt+wJye2sa8SdGmORF4g3/oz6TUbu00qa8nnmyLs
	z4oZ/L0eMwfzDyfLzHfQfQY1dPRaXnUTdeJ7o336oE+fc8fENaYDTUGRFcHsqq0O
	UdPR+RjranIVYvO+YDb7yEq6rXQkVfqmpOriE+uZfY1ZeJDg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29h2uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:20:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422b544a4bso3646935b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 05:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217244; x=1782822044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+KblVWqnrcQ1YGvHTJZqI/1q++EEgqUk0YUHE+Mq35M=;
        b=CgjOq3GFkTZfDCEwOzZc+k39JBYJ+NIgqVz0ITjG4R+ckXMuF3IitDKmiCaSo2rYN2
         G+X0gV1CJKwTelycQ2pb6+2Wb8A9E12b0a5JQQWIrs2hyw750fTfHqwNrNVPNpEyenHP
         fVKJwbfxPgV/CElaJY7gLhJxMGKdQWKwktDP8mu6C6151vvSCFIZ35oH0vt8u88iGsBd
         0o2ecG7ndsdN/VE5nUfRedQz+YywuYwxOKT/NUOAKHDFHwjHQQDA7eh+DA3bns9n+kX/
         yTX9pfc9VsE5RdaeiMjYuxDhvlHV+BkadV5GGcZHP8QZR902JzWo94Nybwhx4VrzjFdI
         4C7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217244; x=1782822044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KblVWqnrcQ1YGvHTJZqI/1q++EEgqUk0YUHE+Mq35M=;
        b=tEzSMULxNd4xEL1x2LBf+KjPhnQBeU6sdr5Ki8iS+m6jeJDpeKYoCdXf+gPWfTTM1F
         vMuelCcxzP5ZKnvBM2SFGs0F02WYHQCA9Hn9hou3UA11fRIWnLUtHZq9q9WkNcF3vIKB
         2XJkfHeTNJAwXO8vdJJuqbor6LHGuQYz2A4RkBDV2lMT5nEQd/Tx3fXgYO7Mt65oArP/
         hH6Xnm790Oksl0SSht3sIrzREBbQj84/M1LpzJNkmIwrzXWzXlIcSGGD0zyv4pRxM8Gj
         TgLxUZlaobPEAkXELlZmZVRyDr8Mvuk4mZAJKaY+BDZWz4rdDKCrvlnpPDgbxj4TXojZ
         sc2A==
X-Forwarded-Encrypted: i=1; AFNElJ+Qx7GHD+IdJgIUJuas/9eeQOYjWYdROGMRodc24OC0+Qjv3JAUEnhUvm1BOzx7JB+/as6jLioyNI/9se2hYvit@lists.infradead.org
X-Gm-Message-State: AOJu0YzpGJqemROCtrIe5aJA9H2FrlAYZzLdsrP1cPth5O2zW3icVcQU
	mJkQrBw/KkQbIYvhwRHg/OWS0KzMH725zxgt7+59a2f5nI3s/1HqSeTU++7BvHrCe+pXaqTUIdg
	IIcZf7wrlfuUWeyfdZi4j/ymApuhMTI6iT4FrsmlP4h5NjR0+fm3qseWeh03sGENnJ2G16qFUTw
	GdGA==
X-Gm-Gg: AfdE7cl7Poezow8/1TW3lkRIuAk0rTdJhNZ3NwShpt/B4j7R6wYAB1wZPRsMtRHRG1l
	s8hr8efmtf9YFuF7H7BoYf2RW5Yt+oL9PO6aacOu/izE8L+3yvC+jEkUWkLjec8i9B8wIeiFCqH
	j9tin88Yil0XAPoTYhrAGVe5Tnly9DXRaOEUSZFKdkza77abMRB7ECNA4w2TKlthdDKuDCUkBEs
	HR72wAPLSgYADdUf6PcWrvMGt88OWZ0c4l9/nZ8vliLg7hzjzqNq5BonXWxt/gqTV+zNlA9Yzj/
	8s14EmKhjBV7/mTtLVv2R1PN7XiDPOVgBSgO7BNU63sPhGI+kGYAPc6wdSQmgVxrnNmV981/501
	2welK9U58X70mL6r4L+MhxH3g0usaDQZ7m5+A7w==
X-Received: by 2002:a05:6a00:1311:b0:841:dcbf:e82b with SMTP id d2e1a72fcca58-84562478d11mr15797262b3a.12.1782217243966;
        Tue, 23 Jun 2026 05:20:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:1311:b0:841:dcbf:e82b with SMTP id d2e1a72fcca58-84562478d11mr15797220b3a.12.1782217243366;
        Tue, 23 Jun 2026 05:20:43 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:20:43 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/8] iommu/qcom: Misc Fixes
Date: Tue, 23 Jun 2026 17:50:26 +0530
Message-ID: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3a7a1c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=AmUTqjPzaPleRPW9gFYA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: I8r2Rxo1UfvktPGSgvbxCvbrtmwfzK3v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX+Sh+rizkIUfd
 rWMZAoPdsvpIjbGnMcmaxZ95em1YtOVMDljJ51KYkadIYKjWd3JrDuPwVITRmep7ZOD9GBdUfPN
 XFsnXx0Et5NUKlMepUwD5JFXmYiGcKk=
X-Proofpoint-ORIG-GUID: I8r2Rxo1UfvktPGSgvbxCvbrtmwfzK3v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX+mqqja+p7Epf
 fdTB51IDvz113a+u3INhq/bHG0ASDm172S0Ib5lRzlogvnifXzVQbZGxPB9rQSkm+RtnJKs2V4c
 7ph/CMtYhZjGPR7H+BKGVzkivf78ci1t/9klolKob8ZuWMH001EkrGT5iA97ap/rrH8vUOmV7EG
 klb59rS9S0aZLucpxZF5J768qCNED336/9oHMOyL9x8t8JAHKVaCRG63Z+ypkeNWV/47U1FwNzJ
 //6I5Vu2UB8DjdkvDyTlu1IYJzWCn3a05i42M74EJPuqXmVFoYycGLtkzc5OJ+YUc/XAGDEqNhF
 sEg/2zOLaqa8EZKVZAFnosk1xnhiHxRZZMw4HweyNC/rwCxHRH0UP81jFo9SgFGt/coBHYwwbcw
 Uk50IBJMyobN2r8+7E1eWo7ZvohtQ30JOKMTPbw/A44bVvOmACzWrD8+zfFr1LVOoASD3sk2sd8
 qgLAd3k0ibQ6yYgp09w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_052045_594313_C1971545 
X-CRM114-Status: GOOD (  10.24  )
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

Series to address fixes in legacy qcom_iommu driver, it is based on top
of  https://lore.kernel.org/lkml/20260623071245.1985938-1-haoxiang_li2024@163.com/

Mukesh Ojha (8):
  iommu/qcom: Fix inverted fault report check in qcom_iommu_fault()
  iommu/qcom: Fix missing pm_runtime_disable() in
    qcom_iommu_device_remove()
  iommu/qcom: Check pm_runtime_resume_and_get() return in probe
  iommu/qcom: Fix pgtbl_ops leak in qcom_iommu_init_domain() error path
  iommu/qcom: Publish pgtbl_ops before releasing init_mutex
  iommu/qcom: Add NULL ctx check in TLB invalidation paths
  iommu/qcom: Enable clocks before hardware access in
    qcom_iommu_ctx_probe()
  iommu/qcom: Document why sec_ptbl allocated flag needs no locking

 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 45 ++++++++++++++++++-------
 1 file changed, 33 insertions(+), 12 deletions(-)

-- 
2.53.0


