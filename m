Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C45FC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9X26qwtAOOxjR7cEsTuB3XDdlH56fWEFe2I6hrhIek=; b=oV8ALGgGaQ+A/yVdAkUEoaR3lX
	V3LkTWbfApsl/oKy53HWAHPfdLV3b7ceT1kPJB7IWyEzw+5Br24+ulrNCMc5dVv5DaatCLnPM/2Xs
	xGaj5EmPot6tqzh8uAzInARK+wpMhi5HeWTAK9W/hRNI97qHv9N9okNTuvBgYjOrHgkaH9gtPzmot
	vBboGnByW5y05k5dSSb/P+PRiK+h7dN1Sfo7mZXCiJvLAuiHLuoYlG04+ZX7KQamJdL7T0KldpKkr
	D6Yw0ta/PZ+MdWVF67DuDvqEbSQVAPSzTCZcFR+62Ga0jja+KFwWOJ6evJx6Q7ve4RW0bDzupqBzR
	HtMDZvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CxZ-00000000SG3-0TC8;
	Thu, 03 Sep 2026 19:18:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CxU-00000000SAn-2lDM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:18:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683IJXg62002766;
	Thu, 3 Sep 2026 19:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9X26qwtAOOxjR7cEsTuB3XDdlH56fWEFe2I6hrhIek=; b=E/LtdIKtZbh2vwZF
	GhZe6mb+Ww6JdCILPVDwuq5dy+awACHEbN3QQN0HP9sXuRCYnzBB8oeAL6ZyJuhS
	MnGuKmGsjOCMq7/PYpUKb750Eh5slwmfTo71o2seOuKlj6FCOJLztA8asbDMx+C8
	k8h1CnoH53oWnAAHnsgT+ePktJbOkqfDFjqmwnFZ+RVqCCHOx9FZum33312s3alG
	Zca9SYiBR3MwV1EgE4FiR4HP6RkjYkkSLyFBshAyeyF5oK1+3+p41GAG6bj/RJ6h
	pH27SCQoH8hoQjBwHo4xmzm8Ac3P5xVYCFkvd3w3erivsL8YaYIJAh+NY8YXlFJI
	A/+unA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfbyvh220-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 19:18:36 +0000 (GMT)
Received: from pps.filterd (nalasppmta01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 683JIaUG3232784;
	Thu, 3 Sep 2026 19:18:36 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 683JIZ7X3232773
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 19:18:35 +0000 (GMT)
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 6685623CD1;
	Thu,  3 Sep 2026 12:18:35 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 05/13] iommu/arm-smmu-v3: Allocate IOPF queue
 without FEAT_SVA
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
        bhelgaas@google.com, praan@google.com, kevin.tian@intel.com,
        kees@kernel.org, smostafa@google.com, baolu.lu@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com,
        bbiber@nvidia.com, harsha.v@oss.qualcomm.com
In-Reply-To: <1e9c1a2aecfda2c0b1a8505b2c11a0c0a29b7405.1788222485.git.nicolinc@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
 <1e9c1a2aecfda2c0b1a8505b2c11a0c0a29b7405.1788222485.git.nicolinc@nvidia.com>
Date: Thu, 03 Sep 2026 12:18:33 -0700
Message-Id: <178846311317.1308030.17725719697885476343.b4-review@b4>
X-Mailer: b4 0.16.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: bTuFDHzBeLSnGV75e4JLc_u2vQF8TfIu
X-Proofpoint-GUID: bTuFDHzBeLSnGV75e4JLc_u2vQF8TfIu
X-Authority-Analysis: v=2.4 cv=C8vZDwP+ c=1 sm=1 tr=0 ts=6a99c80c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=H725gy_wveOBGoQTSAUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfX3Q8niWmMuorz
 5jfQClaLrHBVdE36VyvydVWNk4ixdlucAJbbs6FQlYUnS6oiTHIoQmICq38yxd7LBRNqhjYde9D
 8YNoaxZM8QsRrbdzYyc62nHJLD/cNM+KVUSNwf75Plo5wQG1JVArpqhl2qa8JPnuJmenknpzw6x
 diL0R+JZp/cHkAMAdxv3KOoxkrHtH1rIji3RLdRpqwBol5kaRAJysoO7eWBHTwOKF53UL5d+bY4
 DXeZwgEB+i+2ZQL5xXi7BhoSEtWyGOdwgJQbxU63jXJmYArZ8nJZqpaGzsYvtFyasvp9R5HWl1q
 FAJRVN6Kt8Cbfmxh+svbLURxZHtyA4QEaLvqGvlIPKq6mCmRt4NZrYakNoArZlW5TIQ1pCUwOfQ
 oCHAz06918v9Rw0jVFEWm/7ko6cmMNQxCQVf9ULyturkPH9/G1LH18vLpVik5SJ44kJdZOMopgW
 efbjpnPiB/H4La9qk8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfX6aHmNokoERio
 fjXTa5ID9ErFXPBeqgX7NshTavO/18+mU9nnf5QF/64mTNMVVZq+sP1P+rjtvwKC7U1mcnJ3uFm
 AFWs2tlIFCuuzenTLKGSmkDW1dQbxAg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_121848_724208_2C09B301 
X-CRM114-Status: GOOD (  17.52  )
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

> arm_smmu_init_queues() currently allocates smmu->evtq.iopf only when both
> FEAT_SVA and FEAT_STALLS are advertised by the SMMU. The FEAT_SVA gate is
> unnecessary: iopf_queue_alloc() is a plain workqueue allocator with no SVA
> dependency, and FEAT_STALLS alone can produce events that need IOPF.
> 
> On HW with FEAT_STALLS but no FEAT_SVA, a master with the "dma-can-stall"
> device-tree property has master->stall_enabled set at probe. Then also with
> CONFIG_ARM_SMMU_V3_SVA=y, arm_smmu_enable_iopf() sees stall_enabled, calls
> iopf_queue_add_device(NULL, ...) at fault-handling domain attach, which now
> oopses on mutex_lock(&queue->lock).

When you say 'now' you mean after other patches in this series?
If so then I'd make that more explicit.  If not, drop the 'now'.

> 
> Drop the FEAT_SVA term so the IOPF workqueue is allocated whenever the SMMU
> can produce IOPF events, and select IOMMU_IOPF from ARM_SMMU_V3 as well, so
> iopf_queue_alloc() has a real implementation instead of the NULL-returning
> stub when CONFIG_ARM_SMMU_V3_SVA is unset.
> 
> IOPF is orthogonal to SVA anyway. So, drop the CONFIG_ARM_SMMU_V3_SVA gates
> in arm_smmu_enable_iopf() and arm_smmu_disable_iopf().
> 
> Fixes: 395ad89d11fd9 ("iommu/arm-smmu-v3: Add stall support for platform devices")
> Cc: stable@vger.kernel.org # v5.14
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
>
You had me at the IOPF and SVA being orthogonal part.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

