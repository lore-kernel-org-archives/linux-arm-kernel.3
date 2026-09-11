Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF65C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 00:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrMJ1Ig9JDzTsdwomHBYsLFASYBtKx1mard/OxQVdQk=; b=ScyUbaYVejKjqxkXBlaN1pw4yl
	2I+ccB7o+5Msg+qqX5JwoEE6miPfzO94xinPTT+eC8h0sVry6zZNUuMjPAykK+lp/Ed4mkbz/dA3v
	AIzTtGYcy/NMBoFr1PlDAtvgiTGjIELNMfiZ+2bx2ZKuFu0ZW6liBVmYtn0NT7zBqYJSN0B/880/X
	CPsE2AzovG896+RSPg+XYd6Kr21n4adSoJmNOSKqD90KESut3a8deRebs5zptZ7HDpSOiASrGbj3b
	40t/AqLcL4r3RvoKC4ul8jpZ9687v2FU2sgjxlOSdkBt7Dh13mrKh24A3zvY8Us04W+65+gmoVb3I
	jJQtgIdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ouQ-0000000FbjN-245l;
	Fri, 11 Sep 2026 00:14:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ouM-0000000Fbhk-344p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 00:14:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALthJk1551974;
	Fri, 11 Sep 2026 00:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RrMJ1Ig9JDzTsdwomHBYsLFASYBtKx1mard/OxQVdQk=; b=jax0CuRJweOQsaGu
	VTm4odoI1lpgh0yAvuweyPVdxUDPf7ChinXCafH+4Ij8/nLTnt/AyrCwXP+jLQaE
	HVFSn2VRkC3GtR7YsWO/NIgMjHDbvCDbti9CDaJAcZpvN6esnQUNK0lVxfx0ZLa6
	FrC9DzxFWXnNGrkEdp26YgZQyaELsBtCCA57dqoFp6xcbKa6c8IjC+yoz8yWVqRh
	bFiqnF2vi7vytSzuUBG7nfj3cPAFpuOwUblXhTikLmhExHuuW8qH0ozdfJ4pAvKW
	jKPAlcJ3JKWGe4VKWtkc/ZC7KDATlgDDGgLzdIJNSSJ7ysZ5Euh+Nx7aOW5bQiqw
	xt3qlQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxv7a2wu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 00:14:09 +0000 (GMT)
Received: from pps.filterd (nalasppmta02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68B0E8rq2666586;
	Fri, 11 Sep 2026 00:14:08 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 68B0E8NH2666448
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 00:14:08 +0000 (GMT)
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 2C67422DF6;
	Thu, 10 Sep 2026 17:14:08 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 02/15] iommu/arm-smmu-v3: Add
 arm_smmu_attach_release()
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
In-Reply-To: <8594c8e42e846da3b87f96f1e196c143fe4d517a.1789081084.git.nicolinc@nvidia.com>
References: <cover.1789081084.git.nicolinc@nvidia.com>
 <8594c8e42e846da3b87f96f1e196c143fe4d517a.1789081084.git.nicolinc@nvidia.com>
Date: Thu, 10 Sep 2026 17:14:05 -0700
Message-Id: <178908564506.2841562.1534113496036362394.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDAwMSBTYWx0ZWRfXwNL/2ZgHWjfE
 twi1+Rtjk6dLEf9v+Cnl8tJc+/CHqBoVIjNEZV9x9PvT7w7bsIAa8vtNiFSxmOYwokWoiVehO6n
 kcbCTdAXWoBGTyQu8+lU+4TqLL7Li9M=
X-Proofpoint-GUID: KsLgX2FDAt-_Jb_YWuhUbwis6jNYnCsV
X-Authority-Analysis: v=2.4 cv=FPSOVOos c=1 sm=1 tr=0 ts=6aa347d1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=Ikd4Dj_1AAAA:8
 a=EUspDBNiAAAA:8 a=lgIsWJauOim-okwx_8IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDAwMSBTYWx0ZWRfX5InpCrjLVkZ0
 JrJ/IYTR+a0FK9BhCth8LbmICzgHlNDfudV6xPVflIDDTpk9RV8bMxqk1BXdPKX3QBRkdkKog2K
 IvDhTOSf2xW+oATiUEWcYgfCwId5j9UdvpWBzkGqX0GQXgcUD7gyYGBvDfAPF4VFLXUm5vfvkdU
 Li3lvzVpRcpRLP0mea1PSW6FWBU1CCw+dU2i39axIw+sp28E8zZ3+kiHmFplF3/SnzwkObIL7IB
 e0eU6reNbj1R1mjLoVTMwJofFduMfI/DYqwv30kaeKVLo1KFWE1BgCRtC92mKCT0YgRzFq5Ytgr
 dvuHsVVHReN6mUGLQ5vlpUJWltUBUD7y4FPTDPzs1cDmrJOJuBVDk9WPJRmRFec5Zjr8kRoKkug
 sGuQ5BVhIOSgHLCW0aZGTGuDTBxrfiht84Swi/yZv3YrXCxC6z6NaK+/db/CM7ls8gkIBpIFyIW
 039Q8blkeD8ASavULJA==
X-Proofpoint-ORIG-GUID: KsLgX2FDAt-_Jb_YWuhUbwis6jNYnCsV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_171422_890365_C2DBF877 
X-CRM114-Status: GOOD (  11.19  )
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

> The IOPF teardown is done in arm_smmu_remove_master_domain() when releasing
> the master_domain on detach, under the global arm_smmu_asid_lock mutex.
> 
> A later change will add an IOPF workqueue flush to that teardown, which can
> block on a user-faulting page-fault handler. Holding the arm_smmu_asid_lock
> across it would stall every unrelated attachment in the system.
> 
> Split the teardown out of arm_smmu_remove_master_domain(), to a new helper
> arm_smmu_attach_release() that runs after arm_smmu_asid_lock is released.
> 
> No functional change: the old master_domain belongs to no other device, so
> freeing it outside the lock stays safe, still under iommu_group->mutex.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Nice now.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

