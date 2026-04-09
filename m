Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB75F364B6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 21:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkT2BXpxWHehgHaz7HpCxZpYhADGt5iQQLiK/P6Xocs=; b=Y2ZdQJwXerLoRXldiaOefxVID2
	iCBt/Z4gQN96aeL+U5AkisYzT/RcsrBy6YbRtV6oNfwPDn7tu6fsOtUHer3q3j1blZDvKFZV2sm6c
	a6zDsjNTTW4k3ZEcbPU8lP9JyZRFn97oToid7FKe46bpPvWYY420ToOMI4BFPbuQzrKKeKksybyp8
	CIsJASmOOT1SQiP6WM79Sa6OWwqq++LUBq4G8kLgtG9vAalZ4RW5HmYERINutbR8CECVk/ItHNyst
	cu6zOpfowgGha6bCoe5dcnjdtMvnTLR/Z3YtAsPEsH3pG1T2CbzY3q+4DUB+zG9qfgBa7XimwjGb7
	tNrn965A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwaD-0000000BD9H-34Ct;
	Thu, 09 Apr 2026 21:06:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwaA-0000000BD8c-2lir
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 21:06:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639INJLN3352581
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 21:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BkT2BXpxWHehgHaz7HpCxZpY
	hADGt5iQQLiK/P6Xocs=; b=BIWL5Rqqsj0jnC+EeLvbLFI4/kra1Oj3NiTjbMPp
	/XQeyVBxb1yj1Xik4FOtTE05S4A4Y8Ie772HGVqYNd61VIRj2+D0qMLWU16xVOr6
	SM2jzt68Gq35kUw0JSA5klvDL3s06inD5cmehemAhJy+NTeCO4+x9w/k9DFM7GVO
	2sRadJT/Ay75272QJ8YVCFvUNQnZjK3Mo0EuFRALKPE2QdZetCMfBW3rLcVM6eDl
	9MYmcQAnR4te0uifG3MWVMAHfVb4kTUUdEuDcVYlQ4cZNNOkheYns+TXTwxVubvu
	gCj0kpjPZ6D3EUQfYXRaSw3MpMLftlHDyqgbxpS4EoM0iQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qswu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 21:06:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4076dc16so57311521cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 14:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775768793; x=1776373593; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BkT2BXpxWHehgHaz7HpCxZpYhADGt5iQQLiK/P6Xocs=;
        b=FtKlR2eEBgj0f1VkRGicYRnBuLBESjG7bnJ8YA3GvedBbxVdcRMOJUzREl/5QplXQq
         gBtR3Y6a/iZt6UCMBOLTBZ51i/DBAU6xJ1hUyAsKq4uxJ1dlEr9xQUx7J1XwSmb0Fa29
         pXjAlPtZ8WI9+Icvo2n5TegQhzyLuTwhlSzOubBqzt1E5KYJ5w9mSVTBOFFd23fytU/h
         2hy/RARDqOPrvIvRsbC6JNK29crW1Xoxux4hKZNV7XRDD7dO42/go90HhlgIgN4lifMF
         5C8OtdvueG2K/ngwSxtQkzPd+Gmw2pw+w7kJHGG8cJddwQaQHVOXPn2cqYGHxOXurLl6
         UDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775768793; x=1776373593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkT2BXpxWHehgHaz7HpCxZpYhADGt5iQQLiK/P6Xocs=;
        b=A5s4feneirKv4P5kpx95RrKX8/U/UE1TXCXYt8MlUa9HHlfZ6yyyjRV0Oku/VpgMO6
         BtBj1CxTdM9suHf9zN76sCLr5CpJXubxYxDTYEG+h0DGm52SF/zeIrDUJK+28hHUbSoY
         i6d/1kKYQ5+pQQaimU2HdPURPGirg158D+v1egK+yvuqDgWqaSmqXhXWneP/yryQw+k+
         gpsc9RDhS1yRLUbwgeU7I1EmIwwwSCFRscCTZh6E4Oc2Ux4D1FU7Yo2jhPnOoEWTV9Ao
         CTHBIWcqdXFWu5MQBJ8WmIG3+TNiEzlyx4TmIJrxe0az4qghA6J5zYFdMkkbg3wqSTxb
         JevQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuWqAuKk+tadwu2Ttsvzzx7tcgr62dUjFHqVP7LvI2CSSbuqNM3t7d4v4wr+p68euxl1DuQ9WxGKUCpOtOa6Qe@lists.infradead.org
X-Gm-Message-State: AOJu0YxFH3Bw9JP966eny8lSJ4NQ1TXkooo9lUD7uGgWiSdFplkzvBzT
	EOdSPbeDHHo9ZDtExIsb2zFyhxiqCOrs+tJua2JZradhEQ51iCSO70aVpbRiRrn4Nbz35htgQCO
	LHA5HreBDvWWVFjHzY6mrfC/9WjE5kXhs6mTT5Bwd4kG+nagZqkXsAc0fB61877y9d1+BdwKlJb
	iOvA==
X-Gm-Gg: AeBDiesYPsOei84KSC25eyNe7yoDni/23U/7mrcyf/e7faje7VveTBDbf5gH21iraX2
	VxssQ8CG53+lQ92xH6B5iR1hJBBcyNsv15lsK5P0HusArUP68vJ8sIA3BBDG25FZb5NzKXZE3SR
	5V9/9UsUBl2th66S5lpJ2PRcbJPA/CTTDWgB1DA0LX8soXrkL47aZcTgnwKYqhGNpYv55wH+Iyz
	SAFQ5O9892tINqsVpQ+7hOwqGkKnuQkKmdg7uLHdkSeaRQGiUeVtbdLzbVAfRdpYTV8ouTSw6ng
	eZ6yT+ZQ3CwqgXzReIz7WuB+TL368jQo05fQkWtxIzKs0Y9SmrOXL0vBloU18xZ5m6aGsssE/tR
	fryVf2v4fYd8ZMXNskjkbQOlkVu2gtMJzx5xU4tCEYQoSVva8ym2fhY3GvBiuH5eA2YxaK/AysA
	lgDidOVmKmrfImKbadUL6g48NQoI/ijku9bdg=
X-Received: by 2002:ac8:5a02:0:b0:50d:8734:ba65 with SMTP id d75a77b69052e-50dd5b95bc8mr14103931cf.11.1775768792666;
        Thu, 09 Apr 2026 14:06:32 -0700 (PDT)
X-Received: by 2002:ac8:5a02:0:b0:50d:8734:ba65 with SMTP id d75a77b69052e-50dd5b95bc8mr14102751cf.11.1775768791806;
        Thu, 09 Apr 2026 14:06:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee86641sm161191e87.3.2026.04.09.14.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:06:30 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:06:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        victor.liu@nxp.com, Frank.Li@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, krzk@kernel.org, jingoohan1@gmail.com,
        p.zabel@pengutronix.de, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com, kernel@pengutronix.de,
        festevam@gmail.com, alim.akhtar@samsung.com, luca.ceresoli@bootlin.com,
        nicolas.frattaroli@collabora.com, dianders@chromium.org,
        m.szyprowski@samsung.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v13 11/17] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Message-ID: <wmt75edxyrmhyyfxx7xrrhfdjvdu6u24zwwwsd4ryy52ctwm6f@th73j4phtvmm>
References: <20260409065301.446670-1-damon.ding@rock-chips.com>
 <20260409065301.446670-12-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409065301.446670-12-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NCBTYWx0ZWRfX0BdK86z2b3Nr
 +RjdbCZwu/s+td5s96Kzekdk/uw+xC72PNPj/anFc1NZWvw3lghKyxH8+falB0zKNpnvykWCsg9
 1i/tdU5+LxkZAXTSPM5V2y7PRM8qXKEjlwoE/gm+PJFgMZTFpbWYD41cknD7RJAROKNY+VINVzy
 c0xbqegz44+2/SBC5shde/4a7X84YTfONwdRfuACLfjx4eUiYK6jL+GWoXsPC+BZf41i84NqSBP
 wN3B09w3gmi6OQjGbTAK4uzc6+tgv0LC+lfB7D44BodZ7JI7fBaztNre+VOTje9zUoAsMmjgQjJ
 MtMNHDMsAOQpQThBi7S/EtnY8E7TOwiIOd/WC56d4gnVOz3wsQZhdHt+hUQHFQGdtQ/w2oHOnPF
 C9wLQfGIsmJB110+/7x7gJBTnGGTsyl6+P4vXagXqJuZqCGqEMONxCGJ35uSCOT69KhUTJ1ku7k
 QMzLe8mWHKzgJImFDfQ==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d814d9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=s8YR1HE3AAAA:8
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=yovIxdhcBUqVpsxpVugA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: SH2LeL9ip0WYjfoqfqUq92JNmXSrXznv
X-Proofpoint-ORIG-GUID: SH2LeL9ip0WYjfoqfqUq92JNmXSrXznv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_140634_812458_8D281A5F 
X-CRM114-Status: GOOD (  15.72  )
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

On Thu, Apr 09, 2026 at 02:52:55PM +0800, Damon Ding wrote:
> Initialize bridge_connector for both Rockchip and Exynos encoder sides.
> Then, make DRM_BRIDGE_ATTACH_NO_CONNECTOR mandatory for Analogix bridge
> side, as the private &drm_connector is no longer created.
> 
> The previous &drm_connector_funcs and &drm_connector_helper_funcs APIs
> are replaced by the corresponding &drm_bridge_funcs APIs:
> 
> analogix_dp_atomic_check() -> analogix_dp_bridge_atomic_check()
> analogix_dp_detect()       -> analogix_dp_bridge_detect()
> analogix_dp_get_modes()    -> analogix_dp_bridge_get_modes()
>                               analogix_dp_bridge_edid_read()
> 
> Additionally, the compatibilities of Analogix DP bridge based on whether
> the next bridge is a 'panel'. If it is, OP_MODES and OP_DETECT are
> supported; If not (the next bridge is a 'monitor' or a bridge chip),
> OP_EDID and OP_DETECT are supported.
> 
> The devm_drm_bridge_add() is placed in analogix_dp_bind() instead of
> analogix_dp_probe(), because the type of next bridge (the panel, monitor
> or bridge chip) can only be determined after the probe process has fully
> completed.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> # rk3588
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

