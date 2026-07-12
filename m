Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D534C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBa6sEiBydXVWZOOLxPyxODjFUcBwp/AoovX00pVO0w=; b=25oa+OwqiUAcQ0JczcB1aQPVEn
	s4JAjLJyZGv9PqHVSHXjeFcrAnbL+UPXpL9KSmi83zT5Dr1tvsEvdk0cxEzN/Osm9N6kOBY0G1FaU
	/zEng2lHpm6Tbtpa32u9oQYKisCNJithPdkC3tmuC8W/YDb0XlcCvgj0RtzsH01x8AInNEWpLm1gQ
	NUjAlg8uH/u85eCXrbnurrahhmP2qI653pKOfXX92mqlAwfrK8AwuNk4GzGHjwrEHmyAFu4IZNJ45
	OszYr0UdTguzRapUrPSisbkJwkrvvkuxdLfxcDfE++8VMlCEI2fyihGsSlUAGcIDcjp9wQhwhZCGA
	cP5M8u1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirru-00000007O95-40Ml;
	Sun, 12 Jul 2026 10:57:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirrs-00000007O8O-3M9W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 10:57:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAc6nA2287908
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 10:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tBa6sEiBydXVWZOOLxPyxODj
	FUcBwp/AoovX00pVO0w=; b=PivHYZLu1uWprgW1eoB58HG5svn53cKX9CFOT9Ra
	DpXOIjfOFNTFYsugwlWIptjpLmaNaSTXEd3czJ/nXmH6RMJj+3yJ4yaDLOre7fwE
	wImX06xb2nsnhzHUig10cmOJhAJ4/dgaVrfIO1AG4AVFKVb3CFgQwCJk0B7plWie
	ID+72F8Zv1lnO7tR+fhprP6PVgn7NcZJXxXJqOiLCwLdYCLL44Qv6sPMIS8wrNf0
	AeUfeOZrUZfD5OOzcoCA9E+3MygWDCnUzPMk9qGU42IoTSqClF5gynN5rTGSS2hd
	P97lk5bHF2ZL/ZbiXZ5tVk6ZZZm7MXmJGTybAYjEXi4D+g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe912nke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 10:57:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso30887671cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 03:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783853823; x=1784458623; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tBa6sEiBydXVWZOOLxPyxODjFUcBwp/AoovX00pVO0w=;
        b=GemJydweEMycCmCAdozZCOz78HqAunQRVQXZSLNCr78wF/rtdJRjkCN4LHdYKpnppP
         ss/bq9neax9UYOGjHKlV4CTN9nyssbV/RVvu5D1HOJcYRPtvGice/reiTSSTUa+ef33z
         J1LQDskdQlJZLIJlawCC9Ze7Z6Q4VfFh/a3hgKgxZmaHb1HMcjJc1kUhVjEFhHei2O5o
         o1B9WfQgeaoMTwDBqozOiNRhmFVyWBcTJZ1bgc9h5DSmhQa4rxriUPi/O4EaoQOD9OFy
         IL7e9UDckEzUe/T+PDGB6j61ymdDkSQqZ3VBIiYu/W+hNqp7nmptpqeR6VYbBVeKM+zm
         Td6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783853823; x=1784458623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBa6sEiBydXVWZOOLxPyxODjFUcBwp/AoovX00pVO0w=;
        b=DJnCuISUx+2ESlwlBxF1sLBSsZh0j5wD8DCR2xVW3rWUU+H9z9iIndZbT2Ue7IOAlu
         izLwyKR5/PIKpq7v4P+dh/xrbpumpjM23nFemzi54bl5ChDNvpaWecNOvvIoRadDsrvi
         cqf52Sr+CEWUk1kTDLpsimBaH6E+qVr03PJScKRQdcnTa/9uEr742/SGa+CrCk7c1QWZ
         HKJdQh+z5w4TaRVcoOsY20EvR9frDvSvN3FNj/ah6Jpg/cwmDHsm+DDsnIlvG9rFJWdU
         yzLgVXT3IAi2n4nNslpZYM/WVMC79om6VTx88bxH/GTMVpg2Cc0tu+IiVwUvb7b5j0xP
         eb8g==
X-Forwarded-Encrypted: i=1; AHgh+RoQ+vYoIYmJfcegoSsi9WoJBOtfKhWdG3aASqwUqSjfk0xm5eAJ3vArSoiv8bRfd0ztRJwBNjY+IqVZjiKYzs34@lists.infradead.org
X-Gm-Message-State: AOJu0YxeFaR8+ANyGglKu+ja9vzuF6d8xx1poZpvWf/AJqM59azpAfoy
	Ro0m/r3aotNBnQmhUX2vN72HzPtOAQ3GQguEuquBcawepWEfhsB4RvDuxVCPY2yVTBfXW+3Z+Uf
	XpgV8yPW40PneJDy0xTiwcUNlLnYio2g5P9NYWOP3HcLduwgk+MCGibCnnI+5/oudSywxwkPLCF
	8Z7Q==
X-Gm-Gg: AfdE7ckclS+VpZkFCxCpKfTN7ZIKU06uXNu+QrJVmxfDEu6mzkh24v/EIhChlVe9Qpw
	1zTZvihwt7j6BQNzMucDmIT6DpwdVqZWTWwPazSpYSR7EZ7jzrBqzxwiNoOnUaV8wAjQfwtxFu3
	/GN/qqwELW4akpwmhmvzTHSqGef1IJUVrgYuZS5HQa+Q+6PQW8z8fisgiyebF1zYg/yI6c+ttNQ
	amFjgap8k+VYTH13P54HhtT3Es4pHD7yn2gc8oT5sAIqd2fi6VlcXZAJjzv0E/ECkTAWN5YOT1h
	Snp1qHvjNNOs5zRG7f9ggJZRriUXrt0tcY2kDu+MNcYyQmJJvYpwfIHrsGqokLFyYOvLK1GMdez
	fZQmADu+tAP7AoBiHtQpj3EPftNSl7LPiB+hAEQwE5Hb72AsKacB2zlseBbWBx9tpQCNWVzi50b
	EPnnNowz1jwyoPS8xPKU9/P83I
X-Received: by 2002:a05:622a:591b:b0:51c:25da:903e with SMTP id d75a77b69052e-51cbf264fc7mr51677771cf.58.1783853823034;
        Sun, 12 Jul 2026 03:57:03 -0700 (PDT)
X-Received: by 2002:a05:622a:591b:b0:51c:25da:903e with SMTP id d75a77b69052e-51cbf264fc7mr51677491cf.58.1783853822639;
        Sun, 12 Jul 2026 03:57:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9ddfbsm1969378e87.54.2026.07.12.03.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:57:01 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:56:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 5/5] drm/msm/dp: mark the SST connector disconnected when
 MST is enabled
Message-ID: <sijdmdhcbxyg23gh6c62hspruvbnyqbdrtv2er3bh6n6ftolsp@b6o4khv6dofc>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a5372ff cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=EGGHxoTsPsDd0Tq__ngA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExNCBTYWx0ZWRfXyLlcz/ObNJqu
 n/mnpHhJekh5c+G4/Rrm1amK6Dk7jWeAQW0WX/LPXd8V2fLD2kxthNCtHXV7xsohUjxRia6R5Ks
 le6rRIeXfdIiO5sZUweBkOhzfKLNqtA=
X-Proofpoint-GUID: jvRvIFWShlk0ZV2bevb8BlPqwBy4e6Co
X-Proofpoint-ORIG-GUID: jvRvIFWShlk0ZV2bevb8BlPqwBy4e6Co
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExNCBTYWx0ZWRfX/h2ptyvY1E+B
 3zVl0nh+jqrhc2Kj9ksAPNfR6ykvrjhAAb5H3m9lzhXLYTp5eX7pHyRJwQ1fzwfszLxahej7lCE
 I6FU6hRTVFzaWI/P3yZEhrSpb3Q76xkH0ctM9aHFVuj1N+rRNhTLyhaSmct6nXwcIwvHpLaalTh
 UJynQ/tYEKB4TpK7jqxv5uATxumzfJYh2LhJ2sAR5f+yBlbeHrQWwP/BdL4eSiuxROcjiLKw9gP
 uvBq6QdHj0fsIWN/AYSuajp8FwAN3zXW9LTqccDUmWWq9lvDndff/oZGw9q5HPDGbEu5yonrCqG
 CiCFaunUv5OvQCv0tMxtu9As5qM5ygNYWtWoMScybzA7yj585YWVyTPI9UrF+l/NT6t87U3MLHt
 APYJbytvDdIKRPrw+zhS8+HB2WRdxeOnyUmNv6rglJJqBqXX0IA9ow/1sPJl3Ne7cqNPp93HRpK
 rD63g6nF3L/6OfCFEzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_035704_954009_906C19EE 
X-CRM114-Status: GOOD (  23.90  )
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

On Mon, Jun 29, 2026 at 10:48:07PM +0800, Yongxing Mou wrote:
> When MST becomes active, the initial HPD plug notification updates the
> SST connector state to connected.
> 
> However, the subsequent SST connector detect path reports disconnected
> while MST is enabled. This connected -> disconnected transition is then
> observed by the polling logic and may result in an unnecessary hotplug
> event.
> 
> Set the SST connector state to disconnected immediately after MST is
> initialized so that the detect path does not introduce a transient
> state change.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4ee391cc7165..f8ca60d6d714 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -352,8 +352,10 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
>  		msm_dp_display_mst_init(dp);
>  
> -	if (dp->msm_dp_display.mst_active)
> +	if (dp->msm_dp_display.mst_active) {
> +		connector->status = connector_status_disconnected;
>  		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);

This should be a part of the MST series.

> +	}
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
>  
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

