Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61893C88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 00:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvGDgKXNGrFX7zXWk+uEC51/j7YeXMHQLdea9RnD8lg=; b=zbqz8egMQiH7As0gRigHvekYPK
	FBwu75rVzreJZqGby1AGQY9VlLq6KmAu6Vx0lVWXf/Hpbev1vWeJfA4SQKTwRpU7AipP5eUtEDQYB
	Ugcfw9yMFA5b9SQQUuvEXVQXQErj1Ohi1CAJbenS9B58ieyYDOLbtbCaSJNguHp2nRGaFOYM7qaoM
	V5T9NzZ+5PIhmVTLDUcEFNF9MqvQ+n/2G7T1RpNTx4RmGTOCiu9ckGqElW4spI9C0/N8stasoPJ41
	ISGfa80/1IntY0tSmPjGV4X0LNm9Y3f3RStSM5A1N+TAtzWISJkWdXZKdVTOUby+AOdfBeO0Y0N2Z
	ZlXKqpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oub-0000000Fbod-05bg;
	Fri, 11 Sep 2026 00:14:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ouV-0000000Fbl5-05C9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Sep 2026 00:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xvGDgKXNGrFX7zXWk+uEC51/j7YeXMHQLdea9RnD8lg=; b=IZRuOvCdMsuVGSEBJPoi7DtRe5
	3dHdhwF1npkEHVaviLxM1a5JuiatQlCbVAqfguMt+T9wkl1i9jdxeOKnLtLLplXQRMHuOs98rFgiZ
	qrsLNoQ0bMGi3RJKLfyj0eb5WC1FLLGqjYAGWgSJrT8mg4M892tyOtCMrmEdt8/UekB4lu7klOICD
	FKOM6/nbe89EJ0o/LrKNc29A038aylKci75dc25iUwYtQnJjod55mJ3Hp7ZsGS78v2rjT3NX6bQKB
	kUs+1KCv8GhPTaeChUcNdMYCoT+8x2mBsgcWi2R/jdLcadnvGlv4AGsywS35Bv4fgxtwQ/nvagNxP
	GV8u9rww==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4ouR-000000035gE-2j96
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 00:14:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALTqfs2127156;
	Fri, 11 Sep 2026 00:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xvGDgKXNGrFX7zXWk+uEC51/j7YeXMHQLdea9RnD8lg=; b=Hq5tZ2dNeYLLvAR5
	CyVzOZgNScpYhNUn6syinbIA7WBxWynh6i9LuQTwuQJBY8CxYKQdP3wGxJnkizVe
	MbBNls5xQk2H4fj0jvbqOIB4t1aQJ3dahATg1kaXWpVtIhNcmK4oY2g6MypxiyFf
	LPH8Bx6r3loweG/OKZZPrtHTrohyS69pMT5wNH98lXsPYgL5cJtkLlz11WZnZJrl
	E7OUpLV1gCSd2QUtCjp3/tVm2BcyYOHP4yLeu/RAN9CA01iivD/uuGu/9vTqYKvn
	Xdhq0idwZbmfdzGQqJwfy2+BPoYOlAoBfmJYEs/f0FnA2sHUhS38ggMEiq6KDyOO
	Blzg8A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkwamhg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 00:14:09 +0000 (GMT)
Received: from pps.filterd (nalasppmta01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68B0E8Zk2566592;
	Fri, 11 Sep 2026 00:14:08 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 68B0E8j22566472
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 00:14:08 +0000 (GMT)
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 3137E24CC9;
	Thu, 10 Sep 2026 17:14:08 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 10/15] iommu/arm-smmu-v3: Support PRI Page Request
 in arm_smmu_handle_ppr()
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
In-Reply-To: <cbe6e6f578af848f4efdd8d1050181032effae37.1789081084.git.nicolinc@nvidia.com>
References: <cover.1789081084.git.nicolinc@nvidia.com>
 <cbe6e6f578af848f4efdd8d1050181032effae37.1789081084.git.nicolinc@nvidia.com>
Date: Thu, 10 Sep 2026 17:14:05 -0700
Message-Id: <178908564507.2841562.6430226716089872094.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa347d1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Ikd4Dj_1AAAA:8
 a=EUspDBNiAAAA:8 a=47CvhXRu4ZBn5Ykpww8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDAwMSBTYWx0ZWRfX9IfynBLisEK0
 H9Ihz+6OXgcs7fMNp6EGvbYJ90WdFFMUU/mvQWEdfqPkmt77ICv8YPeVSu2Q439MyaGfBDKnED9
 YD0wQUYXCccLyXxwvBYnftwb5MQTdko=
X-Proofpoint-ORIG-GUID: ID_fBYV2hIvCfwlUe8BtaB6rZmbvSGyB
X-Proofpoint-GUID: ID_fBYV2hIvCfwlUe8BtaB6rZmbvSGyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDAwMSBTYWx0ZWRfX3xB1Kej7o4h7
 EQEcKoSIDGKfm5LxjWpo5t8MZ+9b/QwgptqrO3e0ru4Eh2pQSzziON60zx5AaIektgj17kMLFGQ
 XRDc6rJKlyhg6lb5rgd7ddxMwzE5Q07djRRGitOy239KaMoM39gecFFbVopoRJWx1mKR9+TqTrO
 SUCkHLmQ/r3BUBO/DidoVYlMC6Nj729+rGuEqh2XOnLW2zC39nz47PQ7XM613rhjeZ+V9LwjN0Q
 hIhV9dUunEqLbY4JzpfoEeh5wTr7mG8nT/QfQjMQPuMAFNeUMQgMWQqpwELzR5Qq1tT5tWPctgA
 b7cIqhB9ADtKNNblk2zogt+HMGCavUppZvFSMDKtH8tPVbAJpYkdPx5vpJkwG8tSBv0qpW4Sn6f
 vXLB7vFcNTGtmnt2iwmy8HrQoGkvfc2Z+9ORRMVkbTuXVn5fGCfx5+ST3YD4ghk7tR2dDwMXDyT
 h9uLasTInKUwh5ZCqRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_011428_153954_AC2DD4F0 
X-CRM114-Status: GOOD (  22.99  )
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

> For a PRI-enabled master, convert every PRIQ entry into an iopf_fault and
> report it through iommu_report_device_fault().
> 
> For an unknown StreamID or a master without PRI enabled, keep the existing
> LAST-page DENY path. Merge its two messages into one ratelimited line so a
> faulty device cannot flood the kernel log.
> 
> Discard any PASID Stop Marker (LRW = 0b100) prior to the fault report and
> the DENY fallback both, because a Stop Marker does not expect a response.
> The IOPF infrastructure requires the driver to discard it, as per the doc
> at iommu_report_device_fault(). This also matches the intel-iommu code.
> 
> Note that master->pri_enabled will only be set by a later change, once all
> the PRI paths are ready.
> 
> Co-developed-by: Barak Biber <bbiber@nvidia.com>
> Signed-off-by: Barak Biber <bbiber@nvidia.com>
> Co-developed-by: Stefan Kaestle <skaestle@nvidia.com>
> Signed-off-by: Stefan Kaestle <skaestle@nvidia.com>
> Signed-off-by: Malak Marrid <mmarrid@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

One question inline. I made the error of looking at the spec
and got confused.

Jonathan


>
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 43a6029cef43..c631c6344685 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2370,6 +2370,7 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
>  
>  static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
>  {
> +	struct arm_smmu_master *master;
>  	u32 sid, ssid;
>  	u16 grpid;
>  	bool ssv, last;
> @@ -2380,9 +2381,47 @@ static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
>  	last = FIELD_GET(PRIQ_0_PRG_LAST, evt[0]);
>  	grpid = FIELD_GET(PRIQ_1_PRG_IDX, evt[1]);
>  
> -	dev_info(smmu->dev, "unexpected PRI request received:\n");
> -	dev_info(smmu->dev,
> -		 "\tsid 0x%08x.0x%05x: [%u%s] %sprivileged %s%s%s access at iova 0x%016llx\n",
> +	/*
> +	 * A PASID Stop Marker (LRW = 0b100) does not expect a response and
> +	 * must be discarded before fault reporting: see the documentation
> +	 * at iommu_report_device_fault().
> +	 */
> +	if (last && !(evt[0] & (PRIQ_0_PERM_READ | PRIQ_0_PERM_WRITE)))

There is a bit of spec language about case where there is no PASID
LWR=0xb100 not being a stop marker, SSV == 0 and should be treated as
a PRI request. I'm not sure what that means in practice but maybe
a comment on why that case doesn't matter. Feels like breadcrumbs we
might need in future.

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

