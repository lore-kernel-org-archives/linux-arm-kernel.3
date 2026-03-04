Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1036EFCE53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 23:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9sak1pWhxVBrwdJ2BGlDRM1u4FQCLLwnOBWXp3tU8M=; b=Vr+P9lxS6oc2/sot6w6VXQk7fj
	KX4uAK1mjG3RJsMqO+CTBvg4BpYm2YnwcNvCzvaGxHlZH5vqBEzvj5eM9S4BW6QRuHyQUUDyVIELF
	7hIAhuH1hki70EYrSx5xi1E9+XAMyFLviCNI/FlLIVUuyoOdtIypAT8tHRRrH2KDNmgd+ylvmQz5k
	63hYvk4abB9f7JU74xY9HwEr2wpFlzqbzQ/nuyAl3kUUgmE3V2EymSUPB+RjzAxMs+HhRg89PVOcX
	dLSdjX6TpDPDEDDHkwsW3CyhucVVxYynT3UrsOa83y+sOKG6nlNG6s/9lYMUB19H1oGCtakO6ZsQr
	GUHI2R0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxw3C-00000000elD-367S;
	Wed, 04 Mar 2026 23:54:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxw38-00000000eiM-1Jal
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 23:54:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHutC2495160
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 23:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D9sak1pWhxVBrwdJ2BGlDRM1
	u4FQCLLwnOBWXp3tU8M=; b=YDzVpAV36G9FJiGclgosp/BCt62vM9M9b056E3f0
	U+5xxlejiEUamIMH96BixcO5AaY77ZWBlSAKvu5XqmjeqoAku40urrsPuKmmnS9v
	3OkMLayFRlSKj3dBR7WZsu0j9iU2lRzpg2d7kLVS9w5ZRVAO2FJ6BsTzjCt69c98
	JFzB7UN71X/+3QF9qLWJGMzkqHwQXXEY1ttgq+wcei0KjxR3Fsb0D++XmNf1CbY5
	5aKHM5x6QqkmdYtjls//+oqXfFNFmC5IchUi4ZbV2wIf7afsnXeYSOnIz5G6c9dJ
	RXin04p5y380S3mSuZNgncUGt9sD1j/T6Lf+R7oqd/C+mg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wh1gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 23:54:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a178d7270so70243226d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 15:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668480; x=1773273280; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D9sak1pWhxVBrwdJ2BGlDRM1u4FQCLLwnOBWXp3tU8M=;
        b=RrnrL5IPAi7UNk8KJJ1ZF04ic178Rpjw93ebWO3/vEs/ZO9h/2vUQz9BE2wuoT8vfy
         rmNz+gmqRqR8ga9OrXyf2CX30Y/VVhSTMGoM80MEQEGFUQfubeco06SNDmCbkPmHhMsd
         4qyQtTUJgI78Mlrzwt3fnwFHcynhczoFJKrIGJVcPqT/1ZqsPuvPhPwMwVI6jcvXv15g
         MDibkBrqV2MlQqGWuDSf6E5Z0vywYp5lR2jRmHgb+odVhSnlWl9/xMgL/kK0ztqmVrTH
         GiWAisc/+pmg416JRB8IAp9T79nONly9tg52nKmk4GScF9EWqKVyg0NNsXjKfS3SzFTy
         vv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668480; x=1773273280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9sak1pWhxVBrwdJ2BGlDRM1u4FQCLLwnOBWXp3tU8M=;
        b=aPkzQaAMaPlWOrC6MTjtywSm/QbREzJdFXpxNIH1SR2FpKe+RIMnFDUxyqPbsGfu5L
         8xM9J8hQsW3ASSePGNUe5M74tvNreOhXyKRwCuvcl2ov3FQ+yYvCkOcnlQ+Gu14eZwUk
         SRPpQj2in5QKI8p/qmElchnPSeoO9W225lYo8mx6WcIDsKTho6rdsBmEyg3at8FLPvtH
         z9gn6S/Kne9fqqzfJyKIOQ6skyM119lYSFb5oWW8pWLoqrMKaODGQLPXT679aawHXU99
         8YQoImcEt/PRidSA0lgCL9cFa5cOxpKylhIOTjdtcxJ+lwdhNwlSzPfomVJLd723LJVF
         OXjA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ0h9zQMK9/fZURS1btQHDsRbuUX5UNtXg6lvJCDtO1dsCpIV0ow6u/0mxDbgEARDfDnsdYsGE7PaPtGWjUGcO@lists.infradead.org
X-Gm-Message-State: AOJu0YyaoqozOWRF9RDlVucpX1/nh1GfDy8ZIz3093509T8PCDZgbbpZ
	q9+f3N/47m0MnLafKn39vfmR2SLoGieNZyfd/M2c40YOoSKVV9hAeOopmomoEZd7ZA6oO89gNQG
	oihsYA0rDgDf8wUSMRQGRvVmDK5W1R1tUiiK61K0zzwEBlwXqXe6pmA6WykvK6mWJrX/hCXmiaG
	Q/+w==
X-Gm-Gg: ATEYQzzHSaRY+ObZyfnG69nyPcTKnCwBXm5BDbM3qHY/+jvIJ5gkmmGJgbt0i+Ia7R9
	gB0Y86NsNaNnst1t/DFwRO3/Bjcq7zMfsC+7DBrlcqFstFcmqcB1yU4VPBbf0aoNKQysxehPMy9
	n4s+ATsy/E6YjF7DpXgbb6xaRNe843DJO3SEO9r9GwEaCEdhVyKs/085GN+13LtDCVmbnP5XyWg
	GBg3h1ZtAfNYEX6C61OLWuYYxvuM4vGohrkzCdChvIvlJco3CVWqL4bCNiELtc4tG9O1/KHAZKV
	tSP/VmfrDuu+1fwvBm3z5+CFzGMISLFitfcxTvOHcva/V9UoV9rZsSTrxN6KPP0pe5phZQRZNM6
	HDzNAWEHdlBFc+0MjqnKg1rLmIhlg8/ER6nB2aJFkR46xiYGLWbu+miem/xI7Aww56xNm94u8bV
	BQOeL71m0aIdJ2obM9XjkN9T3MDymTbm9p3Kg=
X-Received: by 2002:a05:620a:2986:b0:8cb:5442:d537 with SMTP id af79cd13be357-8cd5aed61e0mr519314885a.12.1772668480067;
        Wed, 04 Mar 2026 15:54:40 -0800 (PST)
X-Received: by 2002:a05:620a:2986:b0:8cb:5442:d537 with SMTP id af79cd13be357-8cd5aed61e0mr519310585a.12.1772668479418;
        Wed, 04 Mar 2026 15:54:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123573c42sm1615588e87.72.2026.03.04.15.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:54:38 -0800 (PST)
Date: Thu, 5 Mar 2026 01:54:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 12/22] phy: move provider API out of public
 <linux/phy/phy.h>
Message-ID: <cleew6tvum3jnflztfcqfwtafu4hjizjvebzr7qrsbnnp7vvrx@fjqhyh57o5hw>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-13-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
X-Proofpoint-GUID: jIQ_yQfOXnkhRKFxM4ZdvYIPa6wfKXGk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfX6nzb8th5IC7L
 1hUFmtGEMTZHBIp7sdvd5yn3HVtq1AHBP0GSkrH94tZuRxRAuOcrbX9pgzaXAOlQ/o9DtdfW5z9
 a7mgKHfWVY8GiHs6SeT7LjVb4ZjlVJCX14EH5+ECZRF0n3inEwskNlIHa1xL+p2IbInIRNCDdZ2
 f4bU0tka/EPDT4pSD3c2ZoqycbG6j87O5/i2BKsabUyMl0wkMLiQGPMHDlovcoFvFvFNXDQVj37
 E6l0kwvFucNdtSxi142fq+fOA6zOkKEzdmgX00swuYBS41kEncTs80+OaZSJqGZdIELE90UsCpe
 PCns31mbaK/RLY3LqaCw1InT5n3b+8uhQ0JN2pIHVpGkvcO50lKH9RiZImVT3u4p848156FV4Y8
 CkZ/KOdMgdxNlnDlV10DzebQgGmvruBE7cUZk1LlfcSWkDgNN4omO4yuYrXzZf2W+vorhBRhiFP
 SxMPZCpImzClSMwbLJg==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a8c640 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=lO4ColjPjyWKUZOT0LYA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: jIQ_yQfOXnkhRKFxM4ZdvYIPa6wfKXGk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_155442_485906_98207BEA 
X-CRM114-Status: GOOD (  24.66  )
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

On Wed, Mar 04, 2026 at 07:57:25PM +0200, Vladimir Oltean wrote:
> The major goal is to hide the contents of struct phy from consumer
> drivers.
> 
> The idea with "phy-props.h" is that both consumers and providers make
> use of some data types. So both headers include "phy-props.h".
> 
> Two slight points of contention.
> 
> 1. phy_set_bus_width(): Vinod explains that despite the current caller
>    situation (9 providers, 1 consumer), it is a consumer API function.
> 
>    The use case is that the controller (for example UFS) may have
>    limitations and should set the expected lanes to be used and width on
>    those lanes. A number of Generic PHYs can support multiple lanes and
>    multiple width so this is way for controller telling I am using this
>    configuration.
> 
> 2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
>    We do have 3 PHY providers outside of drivers/phy/:
> 
>    drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>    drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>    drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> 
>    but the practice is not encouraged, and with time, these should be
>    moved to the subsystem. This is not something that I can do now.
> 
> For temporary compatibility, keep including the provider header. This
> will be removed when abuses are all gotten rid of.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  drivers/phy/phy-core.c        |  34 +++
>  drivers/phy/phy-provider.h    | 256 +++++++++++++++++
>  include/linux/phy/phy-props.h |  75 +++++
>  include/linux/phy/phy.h       | 499 +++++++---------------------------
>  4 files changed, 458 insertions(+), 406 deletions(-)
>  create mode 100644 drivers/phy/phy-provider.h
>  create mode 100644 include/linux/phy/phy-props.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

