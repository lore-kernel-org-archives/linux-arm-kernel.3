Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4E1CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 01:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFHU5Uj+jXoPoAM1BiBDUT8IhXi09SdGNJ1NomSthLE=; b=YErzPLmsfSVCZgECwozMuwy2ng
	IQBzX4Z0Wf91rjoi6+GtiW+NTUTEv2UgSnQ17IAWg++0jsJlvCf9PJEezkpmM572WS+EuCn1hL6Tc
	UwPaECKBhVmV17URYXzpmUEjMwEGKTP2spa4YJ1d6M9F/K+L4+Z1oV1jy4M0Anu8g6A27pwSrH1dI
	hmzGNjqK7UT3N+MIlspqTMlGcdQTS1kD2QInjSfW1FOtYRVG9xe4XQCYyFgGP91HoO/K3dO/e4S9I
	lD3G3JvT9CTOBoYpfsl3h4qom9zPh32KOSuUIkoMGVIVIiyfzotAxRqaRFAoT6GuFtpJlbhJ6+geY
	VAu66F1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXCK-0000000C13p-1msX;
	Wed, 20 Aug 2025 01:01:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoX25-0000000Bzno-2GyZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 00:50:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL1BAF027711
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 00:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fFHU5Uj+jXoPoAM1BiBDUT8I
	hXi09SdGNJ1NomSthLE=; b=M0G0lzwBza41VuZ6YB1X0z5czf2rGCswbu0hfe1R
	nnq1jEIb87cSyTsnH4s8YEg6Td7mYwIGrN+KkXxAMTcmpceRz+IIfX65QJxluT4Z
	HnsR0h5Ebpoi3zg1yiLhdNXfMwOWQIqwuZ2rm8y96Cl1GlXh4zFyvgrxvD0VbXlD
	YMl39iKdWHMpBAHB+lO3dNnLHnoriq8seVJp03cVsT6/2WEcJ/9tsm3sETjzOid+
	F+zAOJr3yzJfB5aV2asOtw6XMANoIs1VbcUlszRDU1kooZOe8YvXnmuYFkZ72naN
	4a/kjdsfYe3eWKd5/zWByF8GT+qEhoPUt7XeVIyEQsWKaQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0th0d7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 00:50:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a88dae248so9658606d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 17:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755651028; x=1756255828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFHU5Uj+jXoPoAM1BiBDUT8IhXi09SdGNJ1NomSthLE=;
        b=GaFTSNdhaeMAaY8Gyo8tIBRq7Jrl/igg33VT+UfpIP/V73AX7K5EAR7U88do6OmK9D
         UvoZYM5iCtkm2H/pRx8Mq2JgU8+gqrHOJKJRTTUzy3plROBqzrwlZCVpHVd0Ht6baPAd
         qNJbiAS8EqxagWnPZfcQtgXKIOJEr1Pe124mmio2AvksvD7PJWFlCV6MsXJRMNwqwStC
         2p7UGwXuTJcM/jvxTpmQmmzTlXI7czBECL+KqCslNO2+aXeQ/AlNL7txhh3OnUMKr3HC
         DisS8LvTpy9q0Gm2DUCJUsfjT4yg4bDDHFwcuJZJHY0cHCKqbEfCIRmBiFwy91hh0nOX
         DADw==
X-Forwarded-Encrypted: i=1; AJvYcCWcgh2/AL211JB47qs5PDH1BVXxU5APZcmx+FGXrxkVJNHNx9A/6u5UkVfrOSGCIOtnDb5qzV4Hp8E1ZgAlOzzR@lists.infradead.org
X-Gm-Message-State: AOJu0YyyvBL7TkhJEyLafkEO2f+XDe6Ag4iJyl6bNgwJRLU8WvdnvmX1
	TXzEQMqZWmFaHPkqGBreuZwNASUmHnTLe3j/ifiNQz1iqZMZSPaPMgU8zsZjlU+z1amKHV0wHYn
	NhDMUBO2zWM+Ef/Nripz4Vwm2V7pRxaPUaKLbAuOa0L7P5ha2d0t6YYUZ9YCxkv1jNJQMEfjMep
	a0fQ==
X-Gm-Gg: ASbGnctqvGsCyEbQ4Xo7knGN4dzmV7AqjTasJTRGTl9fznX+R622l9bd4HWUHmgz2FB
	cyDRt0gs4s2Y9NzxjElF0des+/F1Hy0O3mWfgBJpCbEWuuZV3Jwh2AiD4PKewZvUdRgqVXTxSR7
	bnUghFkCYlOoMQ/xVhg+s9LndBxAYPlJJdkfsav3+7KtYv0l+crxE5Sryeom2ZxpVx6mwnISMaQ
	If2MknljL6VwVUIdZn3h+zGOT9YlRhwy3y6KM14Te/bM+T4fJJpAhBWK4dv/GWqLsTnpu3Mhx77
	NNlYoFStKngO4R9ixUyaxG+xOil3HtGkPVCyIxTWqt8En4rmPMewW2wlQHRlrI2T2Sjf/JzZ0hK
	OzZ8SjasV1v6gg4Yh7pa4BtWSwNjNX/iFMMlkwsWbNENnhWaRt6S7
X-Received: by 2002:a05:6214:2347:b0:707:6cf8:5963 with SMTP id 6a1803df08f44-70c6769d407mr51600246d6.9.1755651027799;
        Tue, 19 Aug 2025 17:50:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESN0BIvM6CuJAs/DUGKSJfPhZ/a+kgpIoYK/BoCUIvKjOBaanSEDI8cOaQ20OdYtUduS4y3A==
X-Received: by 2002:a05:6214:2347:b0:707:6cf8:5963 with SMTP id 6a1803df08f44-70c6769d407mr51600096d6.9.1755651027357;
        Tue, 19 Aug 2025 17:50:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35a187sm2325712e87.46.2025.08.19.17.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 17:50:26 -0700 (PDT)
Date: Wed, 20 Aug 2025 03:50:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
Message-ID: <6lbathmvpjxdvcnhtncxclcdro7nv6gjwkvznnpv5zrbh2lcde@qw3gjj5lp7ev>
References: <20250819213831.1368296-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819213831.1368296-1-robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX1tVQy092JShL
 oVU9yW/0AAlyAcgtzn6qfm0eRIwSyf+3P6XqK0Jr1ot2LftpY7GiJ1GwzcRLzl2gLjh4m02JcUx
 /XvHwA9NTEdSVP8HeQ87CpEO1eJlifWkoItwBVcBUt+O3dMzLmcXSpvPrvzTiSBGTmQxq0T9dHK
 kgPgS3JZm+JK8XrKmnCTKkH+SYtq+5am1CKz5aT6AsGRj8rHvvk1ALMcDr1Qj4ixq+T1lczTt+S
 QknVEEVrsvAoJLhRRgN8f9jjzg6HZosMSCsc5k8ET5LIQLc0oVD0E4iKJhPWgbbxjkNDSY4nniE
 CWa093LbtSubCPXW1EjYHc80HvxNlMt3Y2bP9h+q5yqOw12dI0UYRdrXpxP2urR6MmQSyr8wFu+
 UnlDHYuS7oUFqEsutMnhdG/kSb8E8g==
X-Authority-Analysis: v=2.4 cv=dI7/WOZb c=1 sm=1 tr=0 ts=68a51bd4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_lrZVZmJbgvpAXfrVDQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: LgvBGTcYkOUgDvaxrFr_jEhv_XxFlPYk
X-Proofpoint-GUID: LgvBGTcYkOUgDvaxrFr_jEhv_XxFlPYk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_175029_696024_D2839FC2 
X-CRM114-Status: GOOD (  23.59  )
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

On Tue, Aug 19, 2025 at 04:38:27PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc.c
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v5:
>  - Drop some inadvertent whitespace changes in qcom_q6v5_pas.c and ti_k3.
>  - Fix error handling in adsp_alloc_memory_region()
>  - Drop unreachable returns after 'while (1)' loops
> 
> v4:
>  - Rebase on v6.17-rc1. qcom_q6v5_pas.c conflicted needing s/adsp/pas/
> 
> v3:
>  - Rebase on v6.16-rc1. Move TI K3 changes to new common file.
>  - Fix double increment of "i" in xlnx_r5
> 
> v2:
>  - Use strstarts instead of strcmp for resource names as they include
>    the unit-address.
>  - Drop the unit-address from resource name for imx and st drivers
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 47 +++++++----------
>  drivers/remoteproc/imx_rproc.c          | 70 ++++++++++---------------
>  drivers/remoteproc/qcom_q6v5_adsp.c     | 24 ++++-----
>  drivers/remoteproc/qcom_q6v5_mss.c      | 60 +++++++--------------
>  drivers/remoteproc/qcom_q6v5_pas.c      | 69 +++++++++---------------
>  drivers/remoteproc/qcom_q6v5_wcss.c     | 25 ++++-----
>  drivers/remoteproc/qcom_wcnss.c         | 23 ++++----
>  drivers/remoteproc/rcar_rproc.c         | 38 +++++---------
>  drivers/remoteproc/st_remoteproc.c      | 41 +++++++--------
>  drivers/remoteproc/stm32_rproc.c        | 46 +++++++---------
>  drivers/remoteproc/ti_k3_common.c       | 28 ++++------
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 53 +++++++------------
>  12 files changed, 199 insertions(+), 325 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # msm


-- 
With best wishes
Dmitry

