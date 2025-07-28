Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353D0C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 12:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLMkHEXhcpE9zqxnDSOUT7LZJSw53zS0jCgPn9nQ6+g=; b=KYA/2abLmF2orp+oTE/MJPuFIL
	MPx2U/MAOE+AzD3ju6h0Z8pr+Iga4uOe8VPq76TD0fvopdre9ewfSCCAzqJVxjCMY3dkh4e4wftIR
	O5Co7qIsU8G38AWLaw1ak/yAJTW/YfbgCrSPRX9wJwp/OSlAywdQRq+JVjU3tL+G/0O5I5c3vTBQ+
	19L+FYdyecVur/fnIqPyRx9yE3ei/XbbKyD6+WzgGQnDuZgS+tGzIRe1W0JcWcjc17RrOTTTTXsKR
	Kn5Ww967LzMyS2kqGRqmyVD/S9GOsyzJ193GynHEF//kT1ACIPwiTTIaHTY8L/eB27aaG4a2pJimq
	Re1VeYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugMhr-0000000EP0g-33jF;
	Mon, 28 Jul 2025 12:11:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugMbX-0000000EOab-090O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 12:05:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlJQB004997
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 12:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MLMkHEXhcpE9zqxnDSOUT7LZ
	JSw53zS0jCgPn9nQ6+g=; b=O/09t9ifQZ5pb1vgPcIgB4ft+YBrnr3NSj2lG8HH
	POO+dTiTkFe87ThnmxxXAY/3hNC9AY/qkpFt9yOkTp9buD7tG5o4So5ilDJSiHcT
	IbrApJia0nx3Yk0fh44+TzLDPGuUEXrNKW49zlTd0lh5kq1A1y7H9wekO+TdyKCw
	gsdgObcQ0Khe1RgBrpY9SVIvkM+PpZOjdoX9noy6s5+Z9HqX5Q4VzEvm2G5ZQr0D
	Qkc1zYcO329+XCB6xDLDLN+4gf3uAmFy1Ngz9e1WwyYl/e0z7Pxn2c+C4bTiZOk/
	h5xJ6Tl/iUnBOO4Y2GtroCJiMPewTlVJ7tYkmCzsULqtww==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytvp5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 12:05:18 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-615b4e018dbso960817eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 05:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753704317; x=1754309117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLMkHEXhcpE9zqxnDSOUT7LZJSw53zS0jCgPn9nQ6+g=;
        b=l6PJSCd8kZgZnc/JiZuuIFLfyZPyoh+oMsdqX08p7HiL6F3PotjFdUTIRPfMr7l3K6
         Um+UE1wtmXkqu86OttCgq0QH0JmEIZSvL77SVNUUdV2wCEkXl6QFA5phpa+tnlKmTU9x
         tcqBc1tFFfyMFyJiVCMD+TGy/wPQdh1SmcVS441gXISIqBCWHdbYP0gru8xl5d+vwIHl
         7Ff2UnxCH8Wj/kt2HeckEYFYBUbYPmht8nbxNCVq8H9AXVihqdJEXL/UI1JVfdUmO0eU
         MNrUm4xMOo+FJe7tt24Mil/txLlV+e28VE4mqmSVml+DRWbGkPOqd3a6OGq1e3GdY0KB
         w80A==
X-Forwarded-Encrypted: i=1; AJvYcCVSYBujre2AJrls2iA3XTzwnSm6hzzHc5IJ0SKeV4iplr9ueoP3ivJzYN1Og3cTdSDYUYLVBv63CCe1KBQcNNMJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwtAkj5ye7Lw5r+L3rWO2kJaQbv7RvFpeyKdJZZ0HAxf9ylgeHm
	tGEu5Dp/f7CLvsuJS3PeLgaWc4vgW+nW5ZNh4b2NOdfgR/AdHO/1ZMGYz6y+5vot5dfhePNR0wf
	VBtU7e/9yBs9FFev9aqJooujbVFAHfdlnfg3gDnfqdUyvXR0naAaRsdTO2nMCUP4KeOCy8FJAVN
	mj+w==
X-Gm-Gg: ASbGncuNmTieJe2EAQw9je4hpcEL6qgLFzVUIBFNGE6iXTUnQAquBWcx1gkf2TRq2p2
	ajPL8DlfCuzLrPloBGO3jl4DDfcPNtseGKytBSlJMOwqwsUmR3MEMqTqnDNlulTBkrtxSpWpJP9
	xqaxUpnDX+YjyndF0r/9S3XX1c5IRhz9tVsLBA4DnMGGilKYv/ftSrb1elrwqAk9WSdE8aN6mF9
	DVuOx06CPMRd6smWsr6UYF0FEahyJFiayuPaV5vn2rQ4TFJZEt997AZ1byVHCdtkfNY6RUzhzOS
	do97TwvO91m7amCDN7zi5prHSvYuG78DkaAvB9Zr86oglrANmgVaPOuc+eRR9GprTYOzi5p0JHz
	U6T+BdlVFkpXx1CFVZW3zLIO+bjw/gUDCn9HLxDMRgllPADBOmil1
X-Received: by 2002:a05:6808:1511:b0:3f9:2fdc:ee93 with SMTP id 5614622812f47-42bba1f2b8amr5993482b6e.30.1753704317201;
        Mon, 28 Jul 2025 05:05:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHSfeWv4VHXW2+zlLwrnah8CuiseIJTrikxH8XMRdQkuCbQ7xwR1kFZq9NS64k4Bn807RS+w==
X-Received: by 2002:a05:6808:1511:b0:3f9:2fdc:ee93 with SMTP id 5614622812f47-42bba1f2b8amr5993452b6e.30.1753704316668;
        Mon, 28 Jul 2025 05:05:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b63375932sm1240730e87.152.2025.07.28.05.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 05:05:15 -0700 (PDT)
Date: Mon, 28 Jul 2025 15:05:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com,
        stephen@radxa.com, cristian.ciocaltea@collabora.com,
        neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
        yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, robh@kernel.org,
        sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v6 02/10] drm/bridge: synopsys: Add DW DPTX Controller
 support library
Message-ID: <soz3wrbwlogzv6pi7i2cf5iq5gxhspkrti3pcxn5cdhztghwww@xxcdbp2n5cvq>
References: <20250728082846.3811429-1-andyshrk@163.com>
 <20250728082846.3811429-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728082846.3811429-3-andyshrk@163.com>
X-Proofpoint-GUID: KVonVqDW2Npzal6avq-D3nd2jGrxjDpD
X-Proofpoint-ORIG-GUID: KVonVqDW2Npzal6avq-D3nd2jGrxjDpD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA4NyBTYWx0ZWRfX0C5euTjzQOqH
 Kr7UZ0tJKuvaadQwqY199D6QHYZNlOBsV/6FcIQu4HrVsarSLhHzwJAoqGUz841XR90cyDXTE3Y
 8IletNNRU4VA/AV/PUDcTK3DQQtwE2Xmf/zOgrR5mpmKn0u/l5Wrv6ADKtv042ItGpZPPsIfmfP
 VuXWvyFREiLjnouoRgncjq/J6Lui1VnA7hvA9Ahs152h9Ft54m7hj3N1GX6mYO24l+pzzw2vdUV
 ZHcKbYdn2yb9/DkbphIFXqWpssWKxsvrip6nFxMyyyeINpJB9XGK0DmybXX3WUuvBxYtEF+J3vt
 P4PGkC41tKKNatRA7Xw1PQw25i80IDv1nKkOAlPyueP9xEOsrSqCDnrxHbAUVK8kjDeMNLAzxJZ
 CkkMRvi3MI4vvFztLQ2CDqaXHIzY1SO1B9S8yp1jOtffMlaUhetRAstR9mu+LQYXmm7dLD9c
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6887677e cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=rZy2__OW2t70H_ViVZ0A:9
 a=CjuIK1q_8ugA:10 a=WZGXeFmKUf7gPmL3hEjn:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_050519_079849_9D25A737 
X-CRM114-Status: GOOD (  24.26  )
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

On Mon, Jul 28, 2025 at 04:28:27PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The DW DP TX Controller is compliant with the DisplayPort Specification
> Version 1.4 with the following features:
> 
> * DisplayPort 1.4a
> * Main Link: 1/2/4 lanes
> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> * AUX channel 1Mbps
> * Single Stream Transport(SST)
> * Multistream Transport (MST)
> * Type-C support (alternate mode)
> * HDCP 2.2, HDCP 1.3
> * Supports up to 8/10 bits per color component
> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> * Pixel clock up to 594MHz
> * I2S, SPDIF audio interface
> 
> Add library with common helpers to make it can be shared with
> other SoC.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v6:
> - Use drm_dp_vsc_sdp_supported
> - Store bpc/bpp/color format in dw_dp_bridge_state
> 
> Changes in v5:
> - Use drm_dp_read_sink_count_cap instead of the private implementation.
> 
> Changes in v4:
> - Drop unnecessary header files
> - Switch to devm_drm_bridge_alloc
> 
> Changes in v3:
> - Rebase on drm-misc-next
> - Switch to common helpers to power up/down dp link
> - Only pass parameters to phy that should be set
> 
> Changes in v2:
> - Fix compile error when build as module
> - Add phy init
> - Only use one dw_dp_link_train_set
> - inline dw_dp_phy_update_vs_emph
> - Use dp_sdp
> - Check return value of drm_modeset_lock
> - Merge code in atomic_pre_enable/mode_fixup to atomic_check
> - Return NULL if can't find a supported output format
> - Fix max_link_rate from plat_data
> 
>  drivers/gpu/drm/bridge/synopsys/Kconfig  |    7 +
>  drivers/gpu/drm/bridge/synopsys/Makefile |    1 +
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c  | 2094 ++++++++++++++++++++++
>  include/drm/bridge/dw_dp.h               |   20 +
>  4 files changed, 2122 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c
>  create mode 100644 include/drm/bridge/dw_dp.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

