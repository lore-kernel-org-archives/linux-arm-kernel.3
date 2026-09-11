Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5E9C88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 00:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRFSBSCShHl4M3eZJxok3WnJUeixvQG1jvdvSxAHgPg=; b=JNsBGY8pLaMhgWnsdx9nm+IReW
	0g7tWBqhMh2ODIpIF9mM4xlnVDAOIEoUQB2VyC3qqfXzUl3fdonAZFFPgNLI0vioh0cHeKKp5+dIm
	3+6xfLXY27ZwgR02QPMjE+dstFweN4/J77n/mh21k2YtDAvnNoGKZcz1o5cFOs1ZyOx6+yT9bwWrB
	r9RCpEmY8jq8H3PtL1/B2T1BbE2ag6GnJRBS4iFeJFpMjECRdy6zCsk4MkfAFLWlhfrWXwuzhn9bN
	4xUWpIdpK62LcwLfA9JTpEK7ge7KuWdS77E+jxeJQcr73kxOTjsoh3v780UbxHpTa9JIXsCe4Yj0U
	iYSq4qAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ouQ-0000000Fbjf-2eWM;
	Fri, 11 Sep 2026 00:14:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ouN-0000000Fbhl-01yf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 00:14:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALVEFZ2353510;
	Fri, 11 Sep 2026 00:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bRFSBSCShHl4M3eZJxok3WnJUeixvQG1jvdvSxAHgPg=; b=awBfZXB3ZvdM2Xhm
	vFJflINK9k35aKScVy+EJNQXiWU+Its3xC6Yy5eykkKYsrQbZeSi2Z/NBr0WlhLg
	qFt+PLPDx2JP+yyIxwemvHVjb0W1PvphDG6ZKRr7VNAz8eq0WoJkNnrd7LG5JILq
	u5mpL20OHRytV+KMtsfyaZY2e3wZKlLjOaoadKzS/MuvHPCu7O1Wtxxse99PpGaA
	xfR24/a7+5c9zvMo+vPMFC2mcHBiVt4dFuDnS2gpcJ78U1rYAo8jJWylU4RM3aFS
	palmmBPDWK6TkenQYEfigiITvTpJeik8Ed86qoJECbfdXz+74c6eC0VO2meZ3yE5
	f2PpSw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwx9tn6a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 00:14:09 +0000 (GMT)
Received: from pps.filterd (nalasppmta02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68B0E8GQ2666583;
	Fri, 11 Sep 2026 00:14:08 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 68B0E8UP2666450
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 00:14:08 +0000 (GMT)
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 293EE215C3;
	Thu, 10 Sep 2026 17:14:08 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 01/15] iommu/arm-smmu-v3: Disable the impl before
 disabling the SMMU on shutdown
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
In-Reply-To: <61536b87c45164b1f581ee4358574ee7822e212d.1789081084.git.nicolinc@nvidia.com>
References: <cover.1789081084.git.nicolinc@nvidia.com>
 <61536b87c45164b1f581ee4358574ee7822e212d.1789081084.git.nicolinc@nvidia.com>
Date: Thu, 10 Sep 2026 17:14:05 -0700
Message-Id: <178908564506.2841562.10082006196933269469.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDAwMSBTYWx0ZWRfX5iVMnz4+B7kb
 JsqIZJICBe6bvNpf/9DKhjvQsdACMvUPfXjQOtEcm9mhdY7wDOSVcjG4vXhNYFoBqSuQbkz3XWU
 +fui4YpricdCfCbCmTw995LdviN9KL/lTiRo7MQgPjF0HM9ZzvRhwmphbHUbOxjp5HT4Gc4P99m
 kn0BykTeglfxhY1oT75us1p6AbzCS6airM96omrAD2eBApz8ywUmE7146BYyDcQMXh1oMiVB7SI
 IYjfKfx9sP/4u8NahDwvfiEDyY5PzXCuvgqdDIx3dN0HyzF8Kp4MUx3XA1GivRA/FLsRmgO4IgL
 Zr2AbVDGSBZWfYRgcUa7uhrd2DIQeHkWjNKUYhL4DKq9wSe5XwTcN0lMnkdNduB0ClBMdKDmek8
 PZxYGvYYXKzowRlaEe3qq1crJycU1uu2zucOhk4hTloCUyeQl45bQqiSCIE8lOKorwQVNgHMatL
 STnxJDWbxdMJsaM75xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDAwMSBTYWx0ZWRfX8R3s9jXsDRQw
 Vm7uc25zj5PwmoqrCAd5ifAxeeqUpzRTR8EaxN+xOnvoasia053S4Q8LN3dSyA9nIuWq9zuvOGG
 MNJG+FjNZrkKOUmXyMao7TdV1FZyz4Q=
X-Proofpoint-GUID: drvzodYnu-qDu_gIlbIy5pijSjX3s3Fq
X-Authority-Analysis: v=2.4 cv=TupzFzXh c=1 sm=1 tr=0 ts=6aa347d1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uFJOAlDeKRdtNQH9JIwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: drvzodYnu-qDu_gIlbIy5pijSjX3s3Fq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_171423_170115_9A9B9C7C 
X-CRM114-Status: GOOD (  12.21  )
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

> arm_smmu_device_shutdown() only calls arm_smmu_device_disable(), and never
> the impl_ops->device_disable() hook. On tegra241-cmdqv, that hook quiesces
> every VINTF through tegra241_vintf_hw_deinit(), which issues a CMD_SYNC on
> the shared CMDQ while it is still enabled.
> 
> arm_smmu_disable_action() already runs this hook before disabling the SMMU,
> to cover an unbind or a probe failure, and no devres release ever follows a
> reboot or a kexec to run it again. Have arm_smmu_device_shutdown() call it
> directly, instead of reimplementing part of what it already does.
> 
> Fixes: 9ff145a25c5c ("iommu/tegra241-cmdqv: Fix CMD_SYNC use-after-free on teardown")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-sonnet-5
Assisted-by: LLM

See Documetation/process changes around this. Personally I don't care
either way.

Otherwise fix makes sense to me.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

