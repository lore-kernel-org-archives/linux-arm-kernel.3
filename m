Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1BBE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 23:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NcU+NmHJdNR31TOBlMnx/TcllfV5Lqqi/BTC8sXm10=; b=FK4pWYeqPOUQeX0Q+AfSFG9MDZ
	fW56DiE05JABoJoCmVuADkVwcxARukvzZ9eD0V92uaqludDM+RJgufEVbdlXEOhrBCA/NMFb5xx+U
	ygCo1zFxQ6XtNzVqWS6Fmha0ejNbAsRKiGOTRz+Gi42+ThLjfHWUNbRj1Wr5sfW0HAXRv4iZ23WIg
	yfFKtQYr81kZdJGxk50uMqD138c5S5KQ67x/nrmdfGvVSqwn0pVJH3RVbFYRdMhFhpMMXKeZ4+JOU
	LWxcGxNzG9bqS4Zke6G9/rEx75n2YAUJmLAVUTA6Ttqe9sNb9qWTwOWCal+T/IwQsb6exMtZWu0rE
	lj+K9agg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIyvj-0000000EBv8-2295;
	Wed, 04 Dec 2024 23:37:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIylc-0000000E909-37Vu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 23:26:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4GwrnU023313;
	Wed, 4 Dec 2024 23:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+NcU+NmHJdNR31TOBlMnx/TcllfV5Lqqi/BTC8sXm10=; b=THa7UkInrllMtWzJ
	uYkCvLLot7XsIfeRzLNoQGWv6Sj3rWCWJlXyW3UZnreHGwEtRTUooSNUvHEgK1PR
	K5Vm8zZAg+ebgd8n6M7uBY8jje3BMUl+6FEq3qCHA9PA8ii7qvuLQZM0nuVhsJZi
	182C2/CCqy1eSDupcgPyJ6Vvk6e0mtbA2QvKA0BR5OQAI0mTksQcZg7PPQf+lpvM
	l7HU0Fc5YBYUgQtojE1QP6NIsEgsmnunjne+QWyxD8hGDmk15RJQ1+qC6Go4TFk6
	xs0kXCPNIJys991PW+dDAvF7bgEVttrt4oW952qRKZbYE/C0wJJMqNlLP+r09eCD
	M8h8MA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43aj42aeds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 23:26:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4NQMKZ030623
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 23:26:22 GMT
Received: from [10.71.110.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Dec 2024
 15:26:19 -0800
Message-ID: <c4c3dd96-727b-4be1-9152-e384478a7508@quicinc.com>
Date: Wed, 4 Dec 2024 15:26:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] drm/msm/dp: use eld_mutex to protect access to
 connector->eld
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Harry Wentland
	<harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira
	<Rodrigo.Siqueira@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Xinhui Pan
	<Xinhui.Pan@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej
 Skrabec <jernej.skrabec@gmail.com>,
        Phong LE <ple@baylibre.com>, Inki Dae
	<inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park
	<kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim
 Akhtar <alim.akhtar@samsung.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Raphael Gallais-Pou <rgallaispou@gmail.com>,
        Dave Stevenson
	<dave.stevenson@raspberrypi.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?=
	<mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance
	<kernel-list@raspberrypi.com>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <amd-gfx@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
        <intel-xe@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <20241201-drm-connector-eld-mutex-v1-7-ba56a6545c03@linaro.org>
 <ca906dc4-ac72-4a76-a670-36c011c853c9@quicinc.com>
 <n2zmw4wquxzht6gvlx6yjurpobgwlsryh75n5gw65j5vjclhgr@jqubqjispqsr>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <n2zmw4wquxzht6gvlx6yjurpobgwlsryh75n5gw65j5vjclhgr@jqubqjispqsr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ih6cbWCa3Fo1OS03TdHomljQ100iLSU9
X-Proofpoint-ORIG-GUID: ih6cbWCa3Fo1OS03TdHomljQ100iLSU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=925 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_152648_903510_7A2C9326 
X-CRM114-Status: GOOD (  13.61  )
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



On 12/3/2024 5:58 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 07:27:45PM -0800, Abhinav Kumar wrote:
>>
>>
>> On 11/30/2024 3:55 PM, Dmitry Baryshkov wrote:
>>> Reading access to connector->eld can happen at the same time the
>>> drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
>>> order to protect connector->eld from concurrent access.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/dp/dp_audio.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Ack to merge through drm-misc?
> 

Yes,

Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

