Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09167C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAUX5ujPfcPKUiEX32BJZnSRpa2KP+IM4lLw9lF6eeQ=; b=JmmwcSHlPi6kd0dTiAAF5YNwbD
	Xhw5fVqNCPSCVDQ6Z0glgVMgANay/5RDsgpMWETAJcamPtTmQeis0RPGm2q5fmi0uqw8x3nAFN3PP
	FGMlCCXa9clMMZM2+OrgVTlHwGxuijpiRilJIvkYawDw8eR6PbNvRa3ZrxpkDut/lctvMibECs8g+
	uty60BBj1eOHjOrb3G+REmJ0u1AcmRo9194yh8okrDsertFYA8M8/qc7kyj9gVRKOdd72BuMORIN/
	LwSZbf1WEVLlDgB+yOmQOYEKuYz+ZeToqA0t9OmiYj1bec2pvS+siBza5HQjVHh4k76Vz/47pW/CW
	kTX0Dk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CxV-00000000SCB-2NdA;
	Thu, 03 Sep 2026 19:18:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CxT-00000000S9v-141M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:18:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683IDI401257096;
	Thu, 3 Sep 2026 19:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eAUX5ujPfcPKUiEX32BJZnSRpa2KP+IM4lLw9lF6eeQ=; b=gNlC7YiOBc0ibLst
	fD7FMsoiKSfOeW+RuOWZKKUI7ubJzY/PTa9fTK5JziLmU9wKZggLcsZ0dn5pD1aT
	iPQf2X+LcZLiczv3mhWLCrdeGjMyv+nD6WitL165Ff3j2txax9zxKSimQI53LUP3
	UhWkw5gPIXn6gh6AWOnkfl9pRWCgnA/JxYWhgm8i6bLH5BZCbrBcrO5J40D9VzDP
	izKYdwkZk6Nj45YUwWSRb2Q7Qn181Myuxd7hXQZ3Vh//RMgrCeH2ZePD4A45XsXZ
	L/mpepmXHoTGZH+SirVdJrDXVIdjQi+wIywBvEfUIPtk5E1M1OBGof2NRsypkzSm
	/yM3Bw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxg9vu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 19:18:36 +0000 (GMT)
Received: from pps.filterd (nalasppmta02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 683JIaSA3208975;
	Thu, 3 Sep 2026 19:18:36 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 683JIZnc3208953
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 19:18:36 +0000 (GMT)
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 6F72C24D05;
	Thu,  3 Sep 2026 12:18:35 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 10/13] iommu/arm-smmu-v3: Allocate IOPF queue for
 ARM_SMMU_FEAT_PRI
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
        bhelgaas@google.com, praan@google.com, kevin.tian@intel.com,
        kees@kernel.org, smostafa@google.com, baolu.lu@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com,
        bbiber@nvidia.com, harsha.v@oss.qualcomm.com
In-Reply-To: <37a4e140ae26b1f58a08b9274937dcc9fa1e5e57.1788222486.git.nicolinc@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
 <37a4e140ae26b1f58a08b9274937dcc9fa1e5e57.1788222486.git.nicolinc@nvidia.com>
Date: Thu, 03 Sep 2026 12:18:33 -0700
Message-Id: <178846311319.1308030.9000417124188557278.b4-review@b4>
X-Mailer: b4 0.16.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: -YVENvjxRstb0fWm0drndlamyku68jmz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfXy2M1yXp9bl74
 1XcPTelj4QFngCCbXZx8yKHPgPJYZuorplbTZvQtFEWDTfFiMhK20dMffMbJgmMVGh/UQjFCMzY
 qi+0uxNayJRwE1f5zH2QavCI2uyudAA=
X-Proofpoint-GUID: -YVENvjxRstb0fWm0drndlamyku68jmz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfXzMK5tbEszxLX
 K5vderQj9IuSTXhgM6Ip2CBzQN/UJl4QVRXYF8U4TdJJxZpRTkzIWF/b2SwA9kSBMCxQ+ZOF/g+
 oF4AbJ55ZPAAQptq/ZwQuecGgU5FLhFNqqdJR/pCkZtYGIglbxE2RP6ubyqsNrhezL1GY48fkfD
 VeSPx+YBzg8xEVSpspz2fwdJdUFd7ci5BoEbOA6zOhnC+J95n5/JSIz2U3iWSrZSJ43Yj9FTVi1
 LZkToucu2nKl0nuD748PEx4NP8VTUSDaQXc8/TGVchwXX5ZVzAKTZwNSCACRGzaLYQBj6tMw+bV
 qgqVS8U8e/XwphEgSqt02xKLa4kyEUY3X2HfrpVYNI79WUE1GhwBDS39E2k+lyYYbkXq7pGPE2+
 NlQKWmeTa+rYjlxeOML6yMKP/gFfvrZhIKiLxpch4o3mEQ77AHDp6WY+Qu1gGqHfJ69zOkIHY34
 5OwfKnVuLbwQOAT1vCw==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a99c80c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=Ikd4Dj_1AAAA:8
 a=EUspDBNiAAAA:8 a=6Dz9RvTaV1Tla3WjJHcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_121847_323895_0B5F3561 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

> After the previous change drops the FEAT_SVA gate, arm_smmu_init_queues()
> allocates smmu->evtq.iopf when the SMMU advertises FEAT_STALLS. PRI support
> is being added on top of the IOPF infrastructure, so extend the allocation
> condition to cover SMMUs that advertise FEAT_PRI without FEAT_STALLS.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

