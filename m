Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC84BC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xV7gqIcOmLYsZrgQnrFFzdfMHssAAXVe8Kf3MFRx7Dw=; b=WfUg0Cul/NJGBySdAHm7CBmkBS
	Kqk6dpcCntRn0k0pGROnvgevStPhUaNHiu6eTeefEvf3MoqrKwC9Pv3IdUb+AcgeX36L3SJvwOv/I
	m/MNvbaIOVFEpTRGL3520ypiKU4dmgOZSOATAEFjg+9WOXD2N+5fd9ZRQKRHtSu3jC9cDtFggupUx
	POP8osgCNt6QQpqAiwFW4W5HdA9Ka2nsi5Vckvu/HbUZmWlPhC0o5e33LLDN6oK+xHia91KptC9Y2
	wWhUyhmZG75RebEqolh1VeET/w5lwG7DklGDylEl67S8OmbBf6f9cXfaD21atyVG0vaLq1fMCMxvP
	Ub+cYZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Cxh-00000000SQZ-3b31;
	Thu, 03 Sep 2026 19:19:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CxY-00000000SEj-2YDl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:18:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3Z2M1091209;
	Thu, 3 Sep 2026 19:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xV7gqIcOmLYsZrgQnrFFzdfMHssAAXVe8Kf3MFRx7Dw=; b=ZY6UvE2q1XnNZi2J
	Rs4wHDY/g+2GrvdPFsZUR3hGyRmH8/ghd4D0eBlSZvEvGUeISg+mXv8uos4iAFx2
	suVFYT5nA8fKfGTqxO63e/6MS1/SMWp/HsSrgsG+/O1+L0G6Ck+1kBOIsfWeEVMO
	VPxWl5WPgJhcdKcQa0pFsamJK/i10jtUn15ZsSmbFw2m69lA+prgUQTsM83QGdgH
	kiosQFNBo8o9iZ7ef8O1VtnBoGCuE55VTnv9b7YeFbo4Wz7LZp8zjEUdU/pv0wbs
	+zVk1X9LKJFUa1V0l3jt6Lgvq0jj1PebvHNi5vqkTIA0qY44AByZ634hj0poEteC
	WGWkzQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekk5ts-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 19:18:36 +0000 (GMT)
Received: from pps.filterd (nalasppmta05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 683JIaDo3214835;
	Thu, 3 Sep 2026 19:18:36 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 683JIZdS3214819
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 19:18:35 +0000 (GMT)
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 6A51D24CD7;
	Thu,  3 Sep 2026 12:18:35 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 07/13] iommu/arm-smmu-v3: Disable the queue IRQs
 before disabling the SMMU
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
        bhelgaas@google.com, praan@google.com, kevin.tian@intel.com,
        kees@kernel.org, smostafa@google.com, baolu.lu@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com,
        bbiber@nvidia.com, harsha.v@oss.qualcomm.com
In-Reply-To: <a6fba7f7a01f5955dfb44d34adc6262c8534e829.1788222486.git.nicolinc@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
 <a6fba7f7a01f5955dfb44d34adc6262c8534e829.1788222486.git.nicolinc@nvidia.com>
Date: Thu, 03 Sep 2026 12:18:33 -0700
Message-Id: <178846311318.1308030.6301643510859406126.b4-review@b4>
X-Mailer: b4 0.16.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: hhGXxGiGep2_ioiWHWC_QsbfZIAzYpo8
X-Proofpoint-GUID: hhGXxGiGep2_ioiWHWC_QsbfZIAzYpo8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfX8iuCvfNpLiaA
 4jwK51UNEOn1ihqvPhA2YM/b9oXMTBXlGNryMIg31j7I7dlFijbEKedQl4GNOqS/8PdRGs3ihsF
 dGg0D5wGHgOkKI5r9RQWqmGZsy8ipNVRB+daGriy6KnDyQ5D+a0miIa4tovFJSEY88POzFekOiW
 yGcNeo67hvOAYNi93FX1CWcHW856EN44ipOkvhuAT22vc76i4lu2p6WdnqZ5UCd/11QcOTSKq/x
 zEOgny4sMNObePnYbRo5/GjGhwuat0dyG1Qjij8gCCqlKBlxhrlIk1c8+R7POPZaj7QUANOwsF8
 VuObCBC2eNdoUIa2CrEunqu91YI5kq9vrXywPNfFbBZkxUdXOVNk311hHSW3aVMeZKgZiHjyZ6d
 xAcXiYhQ15XKCKNlO9NbPbBQQeHFpCJDSpBrJ/1Ho/alp1J26sDbXs9YMBuJ7E+JLMZzOrfVfCa
 txI6cc3PCSiu+DBYsxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfX0E6vTTztsFhq
 cyC3I5NKLLUjGx15pz+nDagocIrTSthzdqCqakzo78euUSaSXHPjQiGYPE/Xh5oxYE6GgQMzg/T
 tXvip9zMgq4QPdzujPUijxLhIRH5o/U=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a99c80d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qr_CdHuHKQtOmQRTACQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_121852_785822_41651A12 
X-CRM114-Status: GOOD (  12.69  )
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

> The EVTQ, PRIQ and combined IRQ handlers are threaded and issue commands of
> their own, e.g. a CMDQ_OP_PRI_RESP for a page request. Disabling the SMMU
> while one is in flight hands that command to a queue consuming nothing, so
> its poll waits out a full timeout.
> 
> Two paths disable the SMMU while those IRQs are still requested: a failing
> arm_smmu_device_reset() returns to a probe that disables the device itself,
> and arm_smmu_disable_action() covers an unbind or any later probe failure.
> Both can run after arm_smmu_setup_irqs() requested the IRQs.
> 
> Disable those IRQs first in both paths, so that no handler is left running
> once the SMMU goes down.

Why this soluton rather than a flag to stop them queuing new work + a
synchronize_irq() to deal with threads in flight.

irq disables always worry me a little as they tend to be patching over
something nastier.  I think this works though so I'm not going to
strongly object.

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

