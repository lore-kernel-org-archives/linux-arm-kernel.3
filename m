Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C961C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHKia4mrAMGaiK1c+rB/8sfRul2wmWEduKRcfi6i6m4=; b=HPzlDr9HbGMTY/lNi9+wmhMdHU
	i3y3V6rxdrAXYsfOvNt5lCDf1O3G50IvjNjO9hTsjUv/X7mIGGacnd+zV37KO2Ft/LHZloBtmdGFT
	IwNOhBdxN87m2nTl4284XnOSUiJy6+q1N09B9g7Hf4Vtzzb39s8OCzPnjR/oldig9g2RK+UmywkH+
	okwzuEMuJDj4L8fVbIT1F1Jkrv02RtLatR8n7Ok4iRhLztyCeydEcLZOmtctTUzGGqdPNTRWT1uXo
	EMGX+DH6rHcY3PcOPU0qLrXrOv4fIDaXWy1FIzaCLwjcJBD2XmI1KCiDbORoTzFYmWw0LT5AqTFjd
	x8ld1HPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CxZ-00000000SGj-1ki6;
	Thu, 03 Sep 2026 19:18:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CxV-00000000SB3-07qH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:18:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683IDI3x1257096;
	Thu, 3 Sep 2026 19:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHKia4mrAMGaiK1c+rB/8sfRul2wmWEduKRcfi6i6m4=; b=h9HLe91KaHovTuCO
	lNkHWMy+gHgah55NcTcKJ45Rb/E72Z0FXrIoiOa6REinJN7ngc2wpGuqBDULQvGT
	UJpV4tMbdgjoHoDhIH+mE/88B0G9x6hyXu/BhUK1OpsYvhMY3f/aj0Gzj3qq015Q
	Rs3Yauo+Y8jZT1a3QjQvLvBbfbf8APaTwP3nR9nnprZaV3cgYN6Ku2OUyqcJCDWJ
	34lgAG/ego8YG5Cpf7BNoftdU/7jrdK9WV21OJs9G/1RC+PczAq9TTdmjEXR4OvG
	2Vi2D9O5KJdMWocOqe0C/WkH88+muPAa5tLD48tHGSNqqOCmG/TY+TRWKDYIVD78
	Y1Ul2w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxg9vq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 19:18:36 +0000 (GMT)
Received: from pps.filterd (nalasppmta03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 683JIZYZ3196771;
	Thu, 3 Sep 2026 19:18:35 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 683JIZZN3196743
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 19:18:35 +0000 (GMT)
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 5432922173;
	Thu,  3 Sep 2026 12:18:35 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 00/13] iommu/arm-smmu-v3: Add PRI support
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com
Cc: joro@8bytes.org, bhelgaas@google.com, praan@google.com,
        kevin.tian@intel.com, kees@kernel.org, smostafa@google.com,
        baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, skaestle@nvidia.com, mmarrid@nvidia.com,
        skolothumtho@nvidia.com, bbiber@nvidia.com, harsha.v@oss.qualcomm.com,
        jic23@kernel.org
In-Reply-To: <cover.1788222485.git.nicolinc@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
Date: Thu, 03 Sep 2026 12:18:33 -0700
Message-Id: <178846311315.1308030.14786655545615918885.b4-review@b4>
X-Mailer: b4 0.16.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: 2NMQdrqDA1lI1P_H7Sp8Hwb0_NKyvyJX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfX2sgLP/7J2ENE
 giomQiiQ3TiqYZneVZkIC62WsBnPxH7xG/rwUGFmRiFXcnXSn22HI63obhjAlMR95a75r0Hh7/1
 pskHtM6NyrGefPNn+RQkth6rpFyfnlQ=
X-Proofpoint-GUID: 2NMQdrqDA1lI1P_H7Sp8Hwb0_NKyvyJX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfX2aIYEuYOyEOO
 0NGyQOGh5FkTF84/q46u+CBoSffnsBm2Rem4VKZ95QLeqnLmAN8mVYL4RW2D8KNaEZGVMeMBbSu
 U8Q3Z67wQFor2CPgP6T3ExzbIy1zv5P9GRsaTh4SFfIFpVbff/2YC65o2hI8nqiPHLP9OvTLpMG
 JUXxrDnV074wNR2Y5QOyZ8xxiZU7nQUDXb4nvEPRPc0AecYcyZrwZg1UVQ5hhhtLYcIge03jaz9
 rDYYUCZoBZw0/ox6SrsGPjuhTpPPRdSlh58vLV9axpXvNY8+BGvBe2UHbPtTbSh7zMP4M4a2KEi
 JC+9fN0S+hgWmDg4T+et38sCfwtEuIxMH0qn/q2qNxc4wyGMYqfMydBzbU8T9Y5UunAGorU/pXq
 /b3IBxM3yRjZAcLPKaTkp5MMKxBdZGtOH954ol7Muq0B1N2HIavXO3eWK3hcUz5ZkPN1Gaix5eA
 W5BtmM1Bzo+D5bSGgCA==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a99c80c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=Ikd4Dj_1AAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=o8C_gSUlc4ZSQu4mtAQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_121849_073835_6837B11E 
X-CRM114-Status: GOOD (  22.65  )
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

Hi,

This is somewhat of a drive by review as I've been a bit snowed under
(blame the AI deluge if you like).  I'll try to come back to it but
don't wait on me.

Great to see this moving forward.

> The SMMUv3 driver doesn't handle events on the PRI queue or respond to IOPF
> faults. This series adds the missing pieces, using the IOPF infrastructure,
> to convert PRI page requests into iopf_faults and issue CMDQ_OP_PRI_RESP.
> 
> The iopf_queue_flush_dev() contract requires the driver to first drain the
> hardware PRI queue and synchronize using a threaded IRQ handler before the
> IOPF software flush. This drove the additional commits compared to v1:
>  - arm_smmu_drain_queue() drains the hardware queue by counting the
>    entries that the threaded IRQ handler consumes
>  - arm_smmu_attach_release() moves the teardown outside the global lock
>  - synchronize_irq() closes the gap before the final flush
> 
> Note that, although this series is only about PRIQ and EVTQ, the Q_POS and
> arm_smmu_drain_queue() helpers will be shared with Pranj's RPM series, per
> discussion below for CMDQ to use as well:
> https://lore.kernel.org/all/ao3ljjiXhnSJte5A@google.com/
> 
> Also, two patches in this series have some conflict with the kdump series:
> https://lore.kernel.org/all/cover.1788130528.git.nicolinc@nvidia.com/
> 
> As the kdump one is still under review, I leave those as-is, since Sashiko
> review relies on a clean rebase on linux-next to scan the series. Once the
> kdump series gets merged, I will rebase those kdump related stuff. For now,
> I think the series is good to collect review comments.
> 
> This is on Github:
> https://github.com/nicolinc/iommufd/commits/smmuv3_pri-v3
> 
> FWIW, engineers on the NVIDIA side have managed to verify the PRI feature.

I don't suppose you can share what they used to test?

Thanks,

Jonathan

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

