Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EEEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 05:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9+wJ+4THMZ6aKAeDHGQEFe1hJ+XvdzKUMLTnVrjnRQ=; b=v9z42ubejTPOnFE5urjleJmFRL
	34poq+6pw12oeSIK0VQ2P8x2VIEA1yHCUJcwB0RLyzRsDyiB4SR3UG+ZCJUyphu8YbFY3Ljzvd1vp
	WAK3DbtF/7L+UIDoX6PvLuFLwSdIvH2giXFKX7j9T7CNSwPdZUlyqOTV5Ke+YkG3RcDn1xQwYo/2j
	316hHUXLRboEy4F28KAwH1lm5WclP16LM+hkRH3xNxj164j7ZqPwiGaRnElK0UYMPcqwYaTXgytAm
	3IIOtP2UfbeGSPaBKZURgb16UlTbuVFqPSsbtBnoAir502uplbbxpE8uH0pvBfqdhIeyBlo8Ekvks
	/csBBxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLboU-0000000Gxad-2iw6;
	Thu, 12 Dec 2024 05:32:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLbnQ-0000000GxRV-42gY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 05:31:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHD59G002087;
	Thu, 12 Dec 2024 05:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y9+wJ+4THMZ6aKAeDHGQEFe1
	hJ+XvdzKUMLTnVrjnRQ=; b=nPNTCbkfWfCu1Te64iYQgIXGCFr8bTR33PE4GjrL
	9kVDhksvM8ujfIKTSZFleSwdeavUPq7cAvuAdyFGTD6UianYJ2zMVCK+dkESgpHn
	Ej5e9dBFYyr3EZCwTnh1fHJa9iaKen0r3icOq5f27zqDZhlekAKrZfUrIVWpHd0u
	ynf2kx7+zX/u0q+0Xw+suOzNnbHmotFLP0X9hLw2NmHGA1ACCZ2kuZfoUWbKhFL2
	0R7d/tdlT/nO7hjpuZz5+q2F8gmrv9mXFqjmbn3DHKmZzy4pqg4P+L1wo8rIsJSR
	63si0/SyuyHETlHcmZqV5BjP0xLY1rqB8CkCvaTL2+rFHA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9v76c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 05:31:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC5V804029685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 05:31:08 GMT
Received: from hu-pkondeti-hyd (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 21:31:03 -0800
Date: Thu, 12 Dec 2024 11:01:00 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Marc Zyngier <maz@kernel.org>
CC: Pavan Kondeti <quic_pkondeti@quicinc.com>,
        Akhil P Oommen
	<quic_akhilpo@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul
	<sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Elliot Berman
	<quic_eberman@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <c197264b-3791-493a-b717-3dfd844de922@quicinc.com>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <87ed2fs03w.wl-maz@kernel.org>
 <92cee905-a505-4ce9-9bbc-6fba4cea1d80@quicinc.com>
 <86sequsdtp.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <86sequsdtp.wl-maz@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tyQb_xK72c8u2XdN2OgQP_4VMJmSutu8
X-Proofpoint-GUID: tyQb_xK72c8u2XdN2OgQP_4VMJmSutu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=968
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_213133_119361_56B2BB92 
X-CRM114-Status: GOOD (  26.62  )
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

On Wed, Dec 11, 2024 at 10:40:02AM +0000, Marc Zyngier wrote:
> On Wed, 11 Dec 2024 00:37:34 +0000,
> Pavan Kondeti <quic_pkondeti@quicinc.com> wrote:
> > 
> > On Tue, Dec 10, 2024 at 09:24:03PM +0000, Marc Zyngier wrote:
> > > > +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +#ifdef CONFIG_ARM64
> > > > +	/*
> > > > +	 * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
> > > > +	 * to switch the secure mode to avoid the dependency on zap shader.
> > > > +	 */
> > > > +	if (is_kernel_in_hyp_mode())
> > > > +		goto direct_switch;
> > > 
> > > No, please. To check whether you are *booted* at EL2, you need to
> > > check for is_hyp_available(). Whether the kernel runs at EL1 or EL2 is
> > > none of the driver's business, really. This is still absolutely
> > > disgusting from an abstraction perspective, but I guess we don't have
> > > much choice here.
> > > 
> > 
> > Thanks Marc. Any suggestions on how we can make is_hyp_mode_available()
> > available for modules? Do you prefer exporting
> > kvm_protected_mode_initialized and __boot_cpu_mode symbols directly or
> > try something like [1]?
> 
> Ideally, neither. These were bad ideas nine years ago, and they still
> are. The least ugly hack I can come up with is the patch below, and
> you'd write something like:
> 
> 	if (cpus_have_cap(ARM64_HAS_EL2_OWNERSHIP))
> 		blah();
> 
> This is obviously completely untested.
> 

I have tested your patch. It works as intended. Thanks Marc.

> It also doesn't solve the problem of the kernel booted on bare-metal
> at EL1, or with a hypervisor that doesn't change the programming
> interface of the device under the guest's feet. Eventually, someone
> will have to address these cases.
> 

Noted, Thanks.

~Pavan

