Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2AEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 00:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmIRd3iGai9B8GwQnitcTjV6mPEycuUXQCqAtqWaspI=; b=VBilV6nrT32mXWatsnBb33kGpb
	ctGrpE3EH+3bxV9qmERNTUg0GzqL+LEnlbALOkimH2JWU/WbtVeLA1WKOnvQNkL1H9mYLXUAIQ8sW
	XcEPbdLi+4Sdvehzox880hHo5DMzVpWwqSxxflxBahwYWrZLXdJn7q5JNQV4c0n8JH5lI/giKjIx9
	HxCedutKf1gKXugmiqjl0+ZiZVzUCsgMJmd0YSlibenwrXo3lwPD+Nhqmi8ktinyElmt3UzvcPun1
	9KivU9EGlNS5aiep7OWNOkFWHz0Vo2hR69JDxYb4vKuZfDyghXdFBLQxBRya+woqqhXol5gnVZn0a
	XeujlhhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLAkg-0000000DJSk-44jL;
	Wed, 11 Dec 2024 00:38:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLAje-0000000DJNQ-0TcN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 00:37:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAGa3Uh024768;
	Wed, 11 Dec 2024 00:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bmIRd3iGai9B8GwQnitcTjV6
	mPEycuUXQCqAtqWaspI=; b=cwx5GojoORS34usLwO6coUU47gO6SMjRDwh+Gz0Q
	7xzGgYSS22GTCw0bCquQtxw6NunQm/Cudm5yjax4Cvcgit3494QMcWMac89qE0sv
	MUmFU+3hvVHIWDao1AnK/b9v/4TVaGqs8x+sGoXL9uWH7fmKsTdYGnsIvPZqXbO+
	DBBR09U0cAmS14/2+l6Hogn8wNtSxsUQ14kuLpvXC5QUCz9EBfui1p5dosR3i1jn
	W5Wzgy47NK0Y8X7GfkNegIxG95AgIemN7Hmg2GQUNspvaRo8DYr6Fw2zYCplJxyd
	fE83H/3y5cfYHAm4Qf9Wkelfxgt3KYeAgkZ2VjJsPUju3g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceettc8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 00:37:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB0bgdg009896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 00:37:42 GMT
Received: from hu-pkondeti-hyd (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 16:37:37 -0800
Date: Wed, 11 Dec 2024 06:07:34 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Marc Zyngier <maz@kernel.org>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Elliot Berman <quic_eberman@quicinc.com>,
        "Pavan
 Kondeti" <quic_pkondeti@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <92cee905-a505-4ce9-9bbc-6fba4cea1d80@quicinc.com>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <87ed2fs03w.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87ed2fs03w.wl-maz@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZVxb1h32_u863zORd3fXSAbJrr3RcbYa
X-Proofpoint-ORIG-GUID: ZVxb1h32_u863zORd3fXSAbJrr3RcbYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1011 impostorscore=0 mlxlogscore=839
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_163750_279394_15C48774 
X-CRM114-Status: GOOD (  16.26  )
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

On Tue, Dec 10, 2024 at 09:24:03PM +0000, Marc Zyngier wrote:
> > +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> > +{
> > +	int ret;
> > +
> > +#ifdef CONFIG_ARM64
> > +	/*
> > +	 * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
> > +	 * to switch the secure mode to avoid the dependency on zap shader.
> > +	 */
> > +	if (is_kernel_in_hyp_mode())
> > +		goto direct_switch;
> 
> No, please. To check whether you are *booted* at EL2, you need to
> check for is_hyp_available(). Whether the kernel runs at EL1 or EL2 is
> none of the driver's business, really. This is still absolutely
> disgusting from an abstraction perspective, but I guess we don't have
> much choice here.
> 

Thanks Marc. Any suggestions on how we can make is_hyp_mode_available()
available for modules? Do you prefer exporting
kvm_protected_mode_initialized and __boot_cpu_mode symbols directly or
try something like [1]?

[1]
https://lore.kernel.org/lkml/1443649252-10702-1-git-send-email-ralf@ramses-pyramidenbau.de/#t

Thanks,
Pavan

