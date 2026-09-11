Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9B6C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 00:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DK0pXF6/Y8LC4WrV1vhM7upcWFGOf5Niup5GD7tkI8=; b=B+ScvrxBZPYiw8BZLXvSQ0sU52
	72Ym7dU4c9nhrA9Glb7kxUMA80k77Q6DQK+TbeOmyGP7qdt/OVz5D+AdUYUloGd4x3a/Jm7NOVtrJ
	mZWS1POG8Mb+sCLma+q9bk9hVTaNJ+CAbeVmxDYlU6ApRXKujh7des4tDhIYBQB/DqA41bpHlL7aZ
	AgNMVNkZrQchtIYd7eJZlh1kKFUlw9Natov4HR8kmvrPv4hcE4iX5qS4pv8fOueiuc7B9p6jTuiJI
	f++XeZnH64X8qaZyczJCS1AhQVaXVWf/R9Lqa+5539FczjukCm7kvE7ssecHs/i+Slrr0UbVIw1mP
	tvN/FZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oub-0000000Fbor-0V3H;
	Fri, 11 Sep 2026 00:14:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ouW-0000000Fbmq-1CqR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Sep 2026 00:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2DK0pXF6/Y8LC4WrV1vhM7upcWFGOf5Niup5GD7tkI8=; b=BOKVijH6MAf8yIRI+o9t6qSmB3
	ySPUU+IZsJf7S7XZsqHmJqXR5cA2UvlEYQjm4LSq6VWqPMpw70hnEN1vWDRt4x7WctIPr2zW4kjN7
	/jnaWmLQA5puXe0xWV0tIAN4rElG24d9VhgUpZZ6VipRK5dns8lqLlvpk4s0XlLKEVCZjFMiK1fKq
	ReKpJ06+YxWrStAeb0gXlNdt3QKqPWpQgAdzzLUFdAJiUwf3mhudwNqy7j+2MlBe9SnBw4cChWnC0
	rVZuIRwlZWJownGTLE3ZzPgcYZkV00IBWw1FS9ohLruu+xuwYZi9/DaUBUClKcXtIy/ycy8sb98VN
	Q1RLnq0g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4ouR-000000035gC-2nRO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 00:14:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALTZe42708523;
	Fri, 11 Sep 2026 00:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2DK0pXF6/Y8LC4WrV1vhM7upcWFGOf5Niup5GD7tkI8=; b=E2YCs76labSauafr
	+f03OPvUkAaxs80K32WrOfMNMWvbLOcKjKaGCAqm9w3Y6SgwRBHFYqhpnlpzlrGH
	lxvJfgrzNAVEVpp0PhPtB7yIjMFKbaX6bPBVEyjBviY7mclHQ0/K5HCF5R5fEqjG
	k79sMnuncL4K0WNuxAml7mNxyl4z/y09vhUd34/3PFZvBB0PU0854QyrNK1NwkaZ
	c1o+vdVI2xo/+pUdtUobYijuFIkdeZq7sYfBftayHWNfdx8MCpXsN106WyPmnTtf
	osRuFV5m8cSLQJ69HpDXyX9F0CJYJ2vKtXo8SKZW65lgbCvT/HuzA6iB8dbvIQxV
	jUPJWw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q10u90-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 00:14:09 +0000 (GMT)
Received: from pps.filterd (nalasppmta02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68B0E8Kj2666594;
	Fri, 11 Sep 2026 00:14:08 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 68B0E8wu2666473
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 00:14:08 +0000 (GMT)
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 2FA3224CC8;
	Thu, 10 Sep 2026 17:14:08 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 05/15] iommu/arm-smmu-v3: Flush in-flight fault work
 on domain detach
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, joro@8bytes.org,
        bhelgaas@google.com, praan@google.com, kevin.tian@intel.com,
        kees@kernel.org, smostafa@google.com, baolu.lu@linux.intel.com,
        Jean-Philippe Brucker <jpb@kernel.org>,
        Eric Auger <eric.auger@redhat.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com,
        bbiber@nvidia.com, harsha.v@oss.qualcomm.com
In-Reply-To: <848cb4c8a79da1f434966d998be0f4ebddf80fb7.1789081084.git.nicolinc@nvidia.com>
References: <cover.1789081084.git.nicolinc@nvidia.com>
 <848cb4c8a79da1f434966d998be0f4ebddf80fb7.1789081084.git.nicolinc@nvidia.com>
Date: Thu, 10 Sep 2026 17:14:05 -0700
Message-Id: <178908564506.2841562.9173958055564925207.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa347d1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=E4FLetviulidzL-PY1oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDAwMSBTYWx0ZWRfX/tlbHGCQuzGH
 hoPqAF3VTflM3YKMDeQD8TYxi6hC7Z6R6TBUoOT0OOCKZ1MuFTe87DJakGxVSn+xeUPY/IiVlja
 Ijl/tsm2Wk9kGsM6bHzjihfrZv6ofrLyQzpum5WQY4u9/lfuCi2QK6jvuoTY7c+JFBokKqeg8Zu
 dKC1uq3OO/N7ZJJOXb+fujN7tJ986boY0lPATfKWsXsh3k//8I3ETiwRKpSNzDfyp/D9NVlk8Fg
 pgQcbBQAMSTY2Swp+nIa3SikyOTIE49AAuZsY6+/3/gdGqunD9oyX4RM3n27TBm4v/Iz6vCgG92
 f6fbhONGwt7i4LVepE9iUPfmiDS34p0v9lrPPn/vwtA8R5KCwGIHUv2VqI2k5u8ZZRy9sje7EA8
 ELHjlu8nH3geVLfXbJLsfw0DHsnuk5meui1hCLb4lejyN69mLISKdbgcc+FxoUMY4lGIdUp+Y57
 kiyawDsFbfJno2ElKCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDAwMSBTYWx0ZWRfX/vXk86l8Ej8e
 DfFbSPhzZ/f0oW08596FQLzyfCq+8j1aV4HGPyu8ZJxVjqvmdjBLi55SeRVuAC686sFWPKd3xwU
 rd3yBo8taoFScvaNWsZfZ0YTpDun+9g=
X-Proofpoint-GUID: uVTsGRIfBEZVHFJXrNIk7yIEHMo8gkoS
X-Proofpoint-ORIG-GUID: uVTsGRIfBEZVHFJXrNIk7yIEHMo8gkoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_011428_184480_E267C38A 
X-CRM114-Status: GOOD (  16.95  )
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

> After the hardware queue is drained, an event may still be moving from the
> IRQ thread to the IOPF workqueue, while earlier IOPF work is still running.
> 
> Synchronize the EVTQ and combined IRQs, then call iopf_queue_flush_dev().
> This finishes all old-domain work before the IOMMU core frees the domain.
> Skip synchronize_irq() after a drain timeout because a stuck consumer can
> otherwise leave it waiting forever.
> 
> If arm_smmu_wait_for_queue_drained() times out, fault work may still be in
> flight, and iopf_queue_remove_device() would free iopf groups that the work
> also references. Skip the iopf teardown and leak the master_domain, rather
> than risk a use-after-free.
> 
> The skip also leaks the iopf refcount, keeping the device enrolled on the
> IOPF queue, which would strand its fault parameter on the queue list once
> the device teardown frees dev->iommu, crashing a later iopf_queue_free().
> Reclaim the enrollment in arm_smmu_release_device(), where all the attach
> handles are gone so a straggler report cannot queue a new fault group.
> 
> Note that a residual race window remains between an iopf_queue_flush_dev()
> and iopf_queue_remove_device(): a fault arriving in between still resolves
> to the old attach handle, as the IOMMU core publishes a handle change only
> after the driver ops return. This window predates the drain narrowing it,
> and is only closable by an ordering fix in the IOMMU core. Furthermore, a
> timed-out drain shares exactly the same window, given that it must keep the
> device enrolled on the IOPF queue, where iopf_queue_remove_device() would
> free the iopf groups that any in-flight fault work still references.
> 
> Fixes: cfea71aea921 ("iommu/arm-smmu-v3: Put iopf enablement in the domain attach path")
> Cc: stable@vger.kernel.org # v6.16
> Co-developed-by: Barak Biber <bbiber@nvidia.com>
> Signed-off-by: Barak Biber <bbiber@nvidia.com>
> Co-developed-by: Stefan Kaestle <skaestle@nvidia.com>
> Signed-off-by: Stefan Kaestle <skaestle@nvidia.com>
> Signed-off-by: Malak Marrid <mmarrid@nvidia.com>
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

