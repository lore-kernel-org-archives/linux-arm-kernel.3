Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F122C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2C1tL1cyUjmdUt5666UxjttpvYe1I2PpGbZ0Gq7p9u0=; b=bm8oueh/bq692DAtetE2v5GwkB
	FQtDDQVuKjzq61As7qIYGfmK8kKQ+6j+3/Vk4tYF9uaE4CQuR5goJYXBRku91FF9hOR4T4z3zi5wU
	xfo5DcqmK9kEbxm2r24PbIOuq3v0QakpIYFKlnwX0cxI1J60RwUrAWNU93291cgGdeMmBInkuJUz8
	L/4ryBbr4sQM0janRCaXNn51dnoGi9gLpNNGvrrUpN2QwvA7li7NdOUHXlv+BDq7h+raRUDnn8UhI
	OaKfyaaS+xDolWVEAyWVBLGXX4y4F8bY2jmni/5Mg/UqYd05+7WsRCKV8yZMmCTId5VIXv5uJz0Cc
	wapu3M+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeyq-0000000EIoV-1cJl;
	Fri, 04 Jul 2025 11:53:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeeV-0000000EFUd-34YC;
	Fri, 04 Jul 2025 11:32:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5645iBLC018568;
	Fri, 4 Jul 2025 11:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2C1tL1cyUjmdUt5666UxjttpvYe1I2PpGbZ0Gq7p9u0=; b=DQHc7R8C6yKFEVK/
	6IboEgwHcO3cocNXxQqLXFhnT2HU/ASiS1aEsWxKDNo96h0JIevrTyWfg0BzweZS
	uxasC4MbRMOBokwc7WL105SP5o8CF9e9jhIjI17G2WK8gsie3QbpNsr5d7Qn43Jr
	vDUT/NZGrHTAa2LUHRqFupSTjLZRN/kq/hP/yem0y2tQtKym33+fthgb6rah7y8C
	Q68Jg4Q6vVUVFlnS0Rhx00T+JrvHESixRuV6u9g0ruedJQMQD1Lhm/w8ESdmPE1L
	hRBgMIeruYtmoc9U8Ky1I7CIQ8s6kg5w/hLlDE1b2o8xE1i+uIYRjpsCbGa40iei
	NDLwjg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxuupq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 11:31:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 564BV8lC008382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 11:31:08 GMT
Received: from [10.50.59.132] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 4 Jul
 2025 04:30:55 -0700
Message-ID: <edfd0bd9-e2b0-93ef-a573-2f2a3ae8d810@quicinc.com>
Date: Fri, 4 Jul 2025 17:00:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 41/80] media: Remove redundant pm_runtime_mark_last_busy()
 calls
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tommaso Merciai
	<tomm.merciai@gmail.com>,
        Martin Hecht <mhecht73@gmail.com>,
        "Mauro Carvalho
 Chehab" <mchehab@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Alain
 Volmat <alain.volmat@foss.st.com>,
        Dave Stevenson
	<dave.stevenson@raspberrypi.com>,
        Kieran Bingham
	<kieran.bingham@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Michael Riesch
	<michael.riesch@collabora.com>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>,
        Nicholas Roth <nicholas@rothemail.net>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        "Matt Ranostay" <matt@ranostay.sg>,
        Nas Chung <nas.chung@chipsnmedia.com>,
        "Jackson Lee" <jackson.lee@chipsnmedia.com>,
        Dmitry Osipenko
	<digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan
 Hunter <jonathanh@nvidia.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        "Abhinav Kumar" <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Raspberry Pi Kernel Maintenance
	<kernel-list@raspberrypi.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Matthias Fend
	<matthias.fend@emfend.at>,
        Marco Felsch <m.felsch@pengutronix.de>,
        "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>,
        Ricardo Ribalda
	<ribalda@chromium.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA4OCBTYWx0ZWRfX94SUNz9Zog9s
 241uiCiS8OVAytLuDJY25SN5WBo2A15VpvTMJToQUJBTBD5tSk4brYdb7zaZPtNru1KP2D7ucOI
 MP7OoWwNRfSp2vZyGAhRtK+GWPKPTC8CYcaz3pJrf0bvbPF0p6Tg6lQG8kNVwjM1v/lwgpbm1sI
 9W3lBD8vDg9u5BhiyrHx5ES5xCkubkQOLvlAYhlLN0xeAziKI1O0M/r0b5MHvmDpyLTQ/s38Dus
 XjjluoWlT5f2jJF+Y1Ri81wN8xu6nn2AJfKF+gtxVeKeSC6SS29JcpLv2ONoxL/lbwrkxGfP05S
 WrLFk95oIfphsWUlPaLpl9uKyc9zZz6KR54Jmd1IWdNNg8BmRm8DRjzYRKFQFU3BwFHPABy84mN
 k7jN9W2mHATSPb7ZegYBV/S0C/iK3zQm+yZ/iqD+JuVLZ4pubHA+BceFQgNCaautkqWZ1okn
X-Proofpoint-GUID: L0pLOEq6Xr5MYWPfr9s13YUNZ-ZnYjRo
X-Proofpoint-ORIG-GUID: L0pLOEq6Xr5MYWPfr9s13YUNZ-ZnYjRo
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6867bb7d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8 a=PTLqzckoA416w6NZUygA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_043223_884945_3EAE679D 
X-CRM114-Status: GOOD (  16.02  )
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



On 7/4/2025 1:24 PM, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/media/i2c/alvium-csi2.c                          | 1 -
>  drivers/media/i2c/ccs/ccs-core.c                         | 4 ----
>  drivers/media/i2c/dw9768.c                               | 1 -
>  drivers/media/i2c/gc0308.c                               | 3 ---
>  drivers/media/i2c/gc2145.c                               | 3 ---
>  drivers/media/i2c/imx219.c                               | 2 --
>  drivers/media/i2c/imx283.c                               | 3 ---
>  drivers/media/i2c/imx290.c                               | 3 ---
>  drivers/media/i2c/imx296.c                               | 1 -
>  drivers/media/i2c/imx415.c                               | 1 -
>  drivers/media/i2c/mt9m114.c                              | 6 ------
>  drivers/media/i2c/ov4689.c                               | 3 ---
>  drivers/media/i2c/ov5640.c                               | 4 ----
>  drivers/media/i2c/ov5645.c                               | 3 ---
>  drivers/media/i2c/ov64a40.c                              | 4 ----
>  drivers/media/i2c/ov8858.c                               | 2 --
>  drivers/media/i2c/st-mipid02.c                           | 2 --
>  drivers/media/i2c/tc358746.c                             | 5 -----
>  drivers/media/i2c/thp7312.c                              | 4 ----
>  drivers/media/i2c/vd55g1.c                               | 4 ----
>  drivers/media/i2c/vd56g3.c                               | 4 ----
>  drivers/media/i2c/video-i2c.c                            | 4 ----
>  drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 4 ----
>  drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 5 -----
>  drivers/media/platform/nvidia/tegra-vde/h264.c           | 2 --
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c        | 1 -
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c     | 2 --
>  drivers/media/platform/verisilicon/hantro_drv.c          | 1 -
>  drivers/media/rc/gpio-ir-recv.c                          | 1 -
>  29 files changed, 83 deletions(-)
> 
[snip]> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index fac7df0c4d1a..0b37f9b76da5 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -142,7 +142,6 @@ int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
>  	}
>  	mutex_unlock(&core->lock);
>  
> -	pm_runtime_mark_last_busy(core->dev);
>  	pm_runtime_put_autosuspend(core->dev);
>  
>  	return 0;
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Thanks,
Dikshita

