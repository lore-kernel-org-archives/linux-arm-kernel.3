Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C5FD1D89F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUBfY5jIY1RcuIaYXy/4WSKR4pFxd1tabpa2Ll11nlI=; b=wjlt6yppaIuD+mm3pUjlRmEkLr
	2qtelIKI4Rajkc9ptfK2dj8mOo6rQhXqLcMp16ne+ZLVdu//A7Td0/zMy2T9LSt0XCylzHxt8FiLQ
	4CFd5i3gJClI/tutgv8nxQk/mDhSW6Ppji6HiWTbuWvdlGfaQ5lbisD/Lxg+tn2D46x1Ulto96Tfi
	h/o1xUnqmbyLd+uSz+dRuoCPBCcn1uogo8hbDzxeuy7BIxPsz++iDy435sCx6oy8vRcsd+Atw/lHO
	2Y2fizYK6y0Qzqi4/caaH/KYPXfLPuFNcgh0HjE94C1BAeZwJ9AdhWWh8O8qRGyo+RmxHD+qnCa5Z
	DHGic33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5w0-00000007mhA-2OYb;
	Thu, 04 Dec 2025 09:47:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5vx-00000007mgg-47hI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:47:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B48Ujog1043296
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 09:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUBfY5jIY1RcuIaYXy/4WSKR4pFxd1tabpa2Ll11nlI=; b=p2SR/SmD+5jskdfE
	NhJBNg/7+rTeMIaxexwvb/pi9N/rbxkNnXPtljm7hFYwK9bzYkagQXFy7FbSq86t
	/pNErXxwuO9vF6liQsqVRpxZBLsPMxEiwWQuOusYb4vKe+exA6RGIebkZVN5I2xL
	Bgruh3zseW6yNvkjD2ae3++7tKRdcbXgzUMfeLHCbEPJ9gZFO7c8wWdJNNYsU8iP
	XxpPSo6QYO1b06IdqOL1OASdmIFTs6YCnm1OggEMK/KTSSVLRUNlmUGsS9oROQTT
	UsGZyEY351Nyv1vE0FZ2f2OWVwRW8vdurF+vsFcNQsAfvwlpnL+XI71fuJbwG/yK
	dpuM2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6uvramj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 09:47:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22d590227so83928385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 01:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764841651; x=1765446451; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pUBfY5jIY1RcuIaYXy/4WSKR4pFxd1tabpa2Ll11nlI=;
        b=W4ejHa6rZWmyPoX0hopOMNKDZil4aqz+dLdBgbARbQxu5NuFTqPgDbq5TnMV3LX5OU
         GQldswbNhCIRzdKPaIXI9mdr8u29saDYtg3OhK+bqAUPHSBCTsoub08iSt+8r/w+oBVY
         NPP9KepmGW/DLvt/K9SUR7WBp6jhy4aS2VAmYjJ8hQKp8bSuTEX/glK4EahrFWm35DFe
         e7Qtl8VH/+pE7sFUwfe3Dg6tKvNQXv3QgriLwrT9+Eeea9m7Z2+df/Eih3nrc5lwEjDW
         ueip9jOIBrYrFDPYS0mBdf0sPsxD3HmfPDnxAZE4083ZpHPFHrMfChwlK57jt0grO8rl
         fefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764841651; x=1765446451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUBfY5jIY1RcuIaYXy/4WSKR4pFxd1tabpa2Ll11nlI=;
        b=o5fTyI6x4XtMki5xJkiF/MJQPluleQNHYy/S7QQQoQL3ryxq5n01IM/M5vB1HR6w3T
         ++UElNyTkvcHy0r8GkztDcvvFXqOAlBQll/yqwTno/RKsKNq+gbXYQkb6DgFt8jrjNm9
         HTwSVyuuFWl10gEzwS6Yw8qnkGLvozitq5BmifsdE3MatATuqVHHrIVdYwf4RVh0QkC3
         dlwMbPl/6HELv3QbB6ER4agb+XjIFKqTsJ3k4WCc1f1iVMoxk/BKoUvXPytv0INTc9Gv
         lp6sBziTE/DCzQQtcHBcpLflt4qDmQ02x1MJeqiqYHUW8v/dfW2UzOzqs12YXDPKcXqc
         xXrA==
X-Forwarded-Encrypted: i=1; AJvYcCUO4J3cZByBHzj1gzQm0atu1fT0jsqWr1i9kKgJ18le9p7K5gtWxf4OgQgsMGEA150Hd2uLTs/Rl3cfDPNxArOb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2h9bj7UuL6kQ/UzehVjrAoq9/0pG+XFGCZOfkYP3RGwwbrtUH
	NAaSwHJhpN7UafSO0juyqCXv6yzcw1itUyy+IsBDbAz+z98b68uKPLSmf5rWjJoU38y8AofY8Mh
	3+jmKo5ywFPXerlckJP8SueN4RJMwjDj3+tXlg238IQmh12+zTzngiFOtgm2720zHMUpD2C7QC9
	HTHw==
X-Gm-Gg: ASbGncvCyQWc6IC1a4XIwOheUkE1sS2/T9CMK6Bq0DBocYKrhEgMkUvwLZGDXfdswGC
	dzj1za8PaER+ijqv6KNaXsEBpeYx1Q89RCM5UCtpcEE62B7GvwBW7pD0o3vPh9TFAmMUawIi0lU
	0zznRENd5IgcHHSdxnW1jbu9EEIUDCa8FzxgEDu2ArKOHCwFX2+K+ICUsK15OQ/hNwPYyGacZ+N
	5//0GFegfLO+vQwVciyW6f2pl4SDqEcQpBAD5yDTOwlUgy6Tz0N0SG9arWrMwclrihYOVq9j11+
	VF1UngAOu4JRDS57+6Ai0Q0tINOITyJcwVopB18cYD+r7KwMwZDb1vCRQYPZ0HjnvEV453Yw3/K
	NFTQozDvwJfu/WG3RgOf4MS3C5Lj/vY9b3cJDwy1oPbahYgt0cBX/qLaHbD7LOE9yIgZselsYpG
	taQ82vAK5SocBS
X-Received: by 2002:a05:620a:46a2:b0:8b2:598d:6e98 with SMTP id af79cd13be357-8b6181f1c1dmr276409685a.58.1764841650891;
        Thu, 04 Dec 2025 01:47:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdWBTmtoknkMH8kz6B2X6j3KiGmUlXyUbfopjsR83o2iT6J6CZDZRB/IJn43+50pjA6xjPVQ==
X-Received: by 2002:a05:620a:46a2:b0:8b2:598d:6e98 with SMTP id af79cd13be357-8b6181f1c1dmr276406085a.58.1764841650129;
        Thu, 04 Dec 2025 01:47:30 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6feba575sm4180081fa.21.2025.12.04.01.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 01:47:29 -0800 (PST)
Message-ID: <191ee8f8-b48a-44be-9b2a-3690a362c541@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 11:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imx: select DRM_DISPLAY_HELPER as needed
To: Arnd Bergmann <arnd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251204094635.1030724-1-arnd@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251204094635.1030724-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3OSBTYWx0ZWRfX2tw5AjzTEFVw
 8C2U7nzoc0E+FeBGXEUz6wSxPv2DHFg+7r/++jduJG5exD5zSOnkGmsiAtqV4MvkW4SKCNUgB2M
 QQmhwxnKajSuZYAP/N9KP/LZu4W8FKRb+MQD265B1dwt0JpfybrqTlQSbv1q5oZxjDSeW0wrJDW
 C3v4IDTcY8g+WawxqrkT0M7iWZ8pB2CaWJb53/7izgVfAyj8qjg1Tw93jl6ODrzYqfrUMwvkQsw
 qmRz91V9s/D3UsLdgR77f8HB3LN6fW4guCV1/ixm8cu87weTVnTXE/d0gTEvZP9yixIZolxms2m
 TY/eJWqHp+mhM5ay4rpM0Gqe/krXWPhQlp/Dz3cdDv0Z/1hEehkxjdBlKeS2khL0AgBnCV+R5EJ
 3LKx3AKgHeVrPYf50pIMINCTVbPHjw==
X-Authority-Analysis: v=2.4 cv=d7n4CBjE c=1 sm=1 tr=0 ts=693158b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=t8mZWZZekR3hrNGy9_IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: bHewCdpWlotzxw3zpw-6TJsGOBcjIVk6
X-Proofpoint-GUID: bHewCdpWlotzxw3zpw-6TJsGOBcjIVk6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_014734_140193_71181A92 
X-CRM114-Status: GOOD (  16.37  )
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

On 04/12/2025 11:46, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> CONFIG_DRM_BRIDGE_CONNECTOR is a bool option that turns on features of
> the display helpers, which are in a module controlled by the (tristate)
> CONFIG_DRM_DISPLAY_HELPER. If the display helpers are in a loadable
> module, a built-in driver trying to use the bridge connectors fails
> to link:
> 
> x86_64-linux-ld: drivers/gpu/drm/imx/ipuv3/parallel-display.o: in function `imx_pd_bind':
> parallel-display.c:(.text+0xcd): undefined reference to `drm_bridge_connector_init'
> x86_64-linux-ld: drivers/gpu/drm/imx/ipuv3/imx-ldb.o: in function `imx_ldb_bind':
> imx-ldb.c:(.text+0x224): undefined reference to `drm_bridge_connector_init'
> 
> Select the DRM_BRIDGE_CONNECTOR symbol as well, to ensure it's built-in
> if anything needs it.
> 
> Fixes: f94b9707a1c9 ("drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/imx/ipuv3/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

