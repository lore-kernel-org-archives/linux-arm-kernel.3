Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2781C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VktLdWvJiYSHU5/AMrDEoquXU3fviXjuJMSKa1znH8I=; b=Rk/lCAHKbRjsB/pGKUI6aera8P
	EEDSq4mnEpFc0zbbYrFpH+119IMdJx8XhhZ9ztO2kYQfI04plQZ5Jozf3gjvgRIi0jbUN6a2iARwH
	5FAZ1kC3SmdpvGs65aLJSLDpssMAuhnnn58UwyuPchTJbfKHbx3sHI1IaJO/KJfdmKkzjZA6ESSHZ
	vxoSSl0oKH8Yrvfi22WTdJMReSuYntkfmCumFIRU3zk2/UTBsaAXtMYo9epdjIg/xJOj2bl3JH1PT
	n7q3wa8mGY0lQBeUwPh8q27FbBG+SQ/p3DqnKLIflJbyFnXC3Ho9nQg+igXQLjf3xWfGzdYUusvfq
	a+IFagNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Cxa-00000000SIA-06ll;
	Thu, 03 Sep 2026 19:18:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CxV-00000000SBH-1YT7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:18:52 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3FXR417591;
	Thu, 3 Sep 2026 19:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VktLdWvJiYSHU5/AMrDEoquXU3fviXjuJMSKa1znH8I=; b=D+Haq3ar5gd9BrPv
	OmdY2Uyg5EeoGeeoCCEKrlRoP34MhbcgGuOG+plg7ffv+pobXdFA0vqW4Dn04rtH
	G74pwWKbg/3Scg1ZUQBXf1oDKZlsUz+DYpisvbd9V3Mx375PXzcHtPPxnlajqa9e
	j4wiV3JQjiDx1aCYj8yP5Dtuyu/aB8hO4GK1OagsQ2PybLGdTUSw1fdOzLJJIJQy
	S56b/4EnDKwogrACKVdoZQN6B0J4t+UA2Qfj+wvJvv8UeFkWyHMttBcwEDBzhn+3
	dnfrmoZPIRtURYb5ZaMOQLPIeGMLY9ug9k9pl9z9yheZxphWhJ7PmefKnYwmEdF3
	vlAztg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m31a1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 19:18:36 +0000 (GMT)
Received: from pps.filterd (nalasppmta02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 683JIatY3208973;
	Thu, 3 Sep 2026 19:18:36 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 683JIZNA3208954
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 19:18:36 +0000 (GMT)
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 7163E24DC8;
	Thu,  3 Sep 2026 12:18:35 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 11/13] PCI/ATS: Add PRI stubs
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
        bhelgaas@google.com, praan@google.com, kevin.tian@intel.com,
        kees@kernel.org, smostafa@google.com, baolu.lu@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com,
        bbiber@nvidia.com, harsha.v@oss.qualcomm.com
In-Reply-To: <f7c924266e6f8d74de4508c812d0e49036fda53a.1788222486.git.nicolinc@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
 <f7c924266e6f8d74de4508c812d0e49036fda53a.1788222486.git.nicolinc@nvidia.com>
Date: Thu, 03 Sep 2026 12:18:33 -0700
Message-Id: <178846311319.1308030.16052628703269367709.b4-review@b4>
X-Mailer: b4 0.16.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: uP7B1osMXdLjrJeg-418h_Y7vu6SKDt_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfXww+lMLNnQNT3
 GlKgbjIPmVAm7OioOFD7KSci6Iqm1OoLsbPpBVrnvWPztBC92jF4A9+WLD7fj9uEfP8ZwAYqyHq
 Cm+SwJ3YovmQq9bze57oJlGtY5vUfJlJxQkm+MIQXXBLlHWsfX5yN7Y9yE1L/WONrEld39Jx4/j
 RcOATqAZgwjRjijb6HFtJ84nuEYQAWOwy4sUSf2fZpjd3lYHtRAmqDKyIJk7/o/dAnQFJb5j0/i
 xMvm1LGyQ9KX6FRzI+cXXxPYn4lnglb0soisegR4fbMON7K1ggz0LN9i7t3CrwoYsq3MWfx2Aup
 9lEKBbgEK8VPGRibhPyvVekEQx/j3zpP+Qqcf0BOyeovbjb6DSoRFjlAFfxL6zTbHALGzZYB1Hn
 9K3V/DuFukJYlqVUM4hQp5S0+GxG62ENThYvsMZ2VcDDib7TopateStN3SqbdLl01yBrit//w7Y
 9aJmkxwJ58WBL8BriRQ==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a99c80c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=1XWaLZrsAAAA:8 a=QyXUC8HyAAAA:8 a=Ikd4Dj_1AAAA:8
 a=EUspDBNiAAAA:8 a=mYKCapFDX9Uc1BMOXFAA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfX2f1KzRajk/Sc
 rDWbsJWkdB81Hl6YaReHlfk8gnK7yCVIiq3jj/AG7qDrICV3PzmNIZzaNzHWV5HFNASSoKbzYB1
 KN2inD87eZSKOrnQIptYl9CCm51buo8=
X-Proofpoint-ORIG-GUID: uP7B1osMXdLjrJeg-418h_Y7vu6SKDt_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_121849_433763_6A856410 
X-CRM114-Status: UNSURE (   9.67  )
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

> The SMMUv3 driver, which may be built without CONFIG_PCI, will shortly gain
> PRI support. Partially revert commit c6e9aefbf9db ("PCI/ATS: Remove unused
> PRI and PASID stubs") to re-introduce the PRI stubs, avoiding more #ifdefs
> in the SMMU driver.
> 
> Link: https://lore.kernel.org/iommu/20201112125519.3987595-8-jean-philippe@linaro.org/
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> [nicolinc: drop stale APIs]
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

