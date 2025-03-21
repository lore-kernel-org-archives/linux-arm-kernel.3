Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02794C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 16:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/ONfvw+x8a27A/BQ561OBzH4SKrnRVr3eIQSdmNCaw=; b=zJUDZFTSi2JWeuTJs09RN3xTaB
	r4r23npp4xjO7zzfVGL4lG/MktQd2mLN3WiNV6Cg0Mnn4y5JQhubOk9CiERbIAtBatDEMksk14nir
	uaelWK4SFlCNHnVQZp1cMTF/Q39TmMCVO2xBRoyrW4OVKv2vJIo7JvJRVN4JcO472wI4dQlpvRcSX
	QQed7yQpNZGXY5q0J/DkIt+1ZAh+cnfdqiRPrlE7RslmmuTj3VCRoHK8C46oh25EKIR836v1dOOiz
	6/Nb5krNbyHvqkgxDwxz84AthvT12z7OBgMSzAwSr6FhW2SDnSnsl5C2jGA82DLT+iFv8wbZULItx
	34PTfkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tveo5-0000000FOfB-11cp;
	Fri, 21 Mar 2025 16:01:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvejj-0000000FNkx-1IQU;
	Fri, 21 Mar 2025 15:56:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LAThKi015854;
	Fri, 21 Mar 2025 15:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/ONfvw+x8a27A/BQ561OBzH4SKrnRVr3eIQSdmNCaw=; b=je9FwhF5PJH2fz5I
	7bsQTxqUXeTEitNoUuG3FDXPkf7N/0dCiJYZdkZvwRczTcWDAaP5EWlDye9uYBK8
	3t658jB3gl4JwEV7r9nkRMbmWPRKh4aHv5zOi4p/3WDBhNqiZu+B2TC7GK8Z4Wrh
	bAZUNZnACNlwzdQAQs7BFiMaVW0a+pPUKJZJN95Jipaz+XpoYpvXyhFpys5z/w6A
	1ZdCBk4D5GA97CNLEyt/FvXdFYPe2z/DIaSxUsHJhi291SLDc3J5himfMGf9toNZ
	wo08UC4ku/dgQ+qydCDyIAJtadfs2myzyJvwR2nvnhSpktxhkBFiaEIv/8gtXI3+
	K3BpcQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gbngng41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 15:56:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52LFuOVd005443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 15:56:24 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Mar
 2025 08:56:23 -0700
Message-ID: <24721e4c-ea9e-4405-81f8-084b3ce8b138@quicinc.com>
Date: Fri, 21 Mar 2025 09:56:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian
 Reichel <sebastian.reichel@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-5-d4dbcfafc141@tomeuvizoso.net>
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250225-6-10-rocket-v2-5-d4dbcfafc141@tomeuvizoso.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W-BfmQYQibuV4EVJsdNt4KMNnB_uwp2L
X-Authority-Analysis: v=2.4 cv=MJ5gmNZl c=1 sm=1 tr=0 ts=67dd8c29 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=uuLSczJ1SNS1zB8tvcoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: W-BfmQYQibuV4EVJsdNt4KMNnB_uwp2L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=755 clxscore=1011
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_085643_365722_0B5BC821 
X-CRM114-Status: UNSURE (   9.71  )
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

On 2/25/2025 12:55 AM, Tomeu Vizoso wrote:
> +/**
> + * rocket_gem_create_object - Implementation of driver->gem_create_object.
> + * @dev: DRM device
> + * @size: Size in bytes of the memory the object will reference
> + *
> + * This lets the GEM helpers allocate object structs for us, and keep
> + * our BO stats correct.
> + */

I would expect that this would throw a warning when making the kernel 
documentation since you are not describing the return value.



