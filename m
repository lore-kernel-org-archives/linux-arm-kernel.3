Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FABCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 22:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONnM8cPGqCvQUEArvOdVRHLA7AjrNnYCfdYyBl3uu6Q=; b=CxbB47zTPHs78JGyT+HoZjH+W4
	2l/0aj9NL1nx2FTDZf3AzE+LcVZclrWa/TaZPDQswu/FaY/hBzugjulBVlZdC08Xz9aXNItqdLHKj
	i9r1fA5EmyO8zbvsHFhg4lLzYaxYaqruKoyxxyIIUIdRLsky9vAQQVZAjEqIYVH48Zp+/ugVh8TfA
	NDZn6gHi4TlRex9tgumYLZSj03Rtvb5vJubGNPRFmwf1zXNsajrLzG3crgNDzhc5J+W3gqnfACgsT
	lXMtxm8ltYBkpcJmH9Ag0dpQlw9n6cvk4vXPntkiFUUge+q2o8H6l/tYdFLijdZiK8p6DJKWg+6wQ
	P1KBJNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUuYN-0000000FucB-3Yju;
	Wed, 03 Jun 2026 22:59:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUuYL-0000000FubJ-1T90
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 22:59:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653JZ1nR1039343
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 22:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ONnM8cPGqCvQUEArvOdVRHLA
	7AjrNnYCfdYyBl3uu6Q=; b=JUsHQt0DxYLPJKgSTR9tREQC+/92i/jaL10JeZka
	jx+w7LeQXnnmF1WukUK+kcEWnvuxt/l+kFvuthhHCI4AaDnS76xdU7CZe4PJzwyz
	K4pbBszfCfx+alv7S7iFmtT9ExLdFXbo7XeJLWvND6VGIKR9I6rEOyaIC7iQ90Xg
	9iCkzFtDeVSeFE9jXjV05X+B3ZHU8eGLF3uNdxHjQ9Y5yb4DSJt1nRiG8no/6vX1
	96gpOiH9tdw6cUja413gftwtc/vaKQ+VyGGi+jsd9T/Go18S/qq31wYXJCMNU+uF
	jhitbT5yARcAW7GDcsEOVJ2x/bh93aalFtYzYhWqyr/g6Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8gncq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 22:59:12 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963b2863d62so53273241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 15:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780527552; x=1781132352; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ONnM8cPGqCvQUEArvOdVRHLA7AjrNnYCfdYyBl3uu6Q=;
        b=ihJzcAHJi1bxEJOXQNJoi/fTurwHDvcuYUzYXtRGxQd/dtvkL48z7rJPBUhpb3hJXh
         s9GqxIeEFWhnL147BfJPkNO/GB12mGXqLI0o39UssPAZPDqr2jgBXsYbETxmG0HbZebk
         mSVOYXQXU5MYrEj3hlgGQ9/q5aCBOl181Ryv4MMSenGvwbFT//RCfmFOhDvb6xI3MumM
         eTzYWT8A8DBy8wWMbgT7tv3jZnonCT7sxtxY/DOwWiOWDH2hma02O92mpSptC0Jkatep
         sIlS9/s8w/2pLL5i+1ml0K6Mpeyg2k/hZZ/Lh45RebyDvWLbFXdaTRaHiEv05oEY3+eB
         e7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527552; x=1781132352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONnM8cPGqCvQUEArvOdVRHLA7AjrNnYCfdYyBl3uu6Q=;
        b=YnlXRHlG9ORLOtAKXB++Kyjq5yrxevy59c+K+D4vBgCtybiUoZY6IJo5PepsVR8Dc0
         N1GMUCrB4KPWXDN2XH4hp9pnOetU4XJPCowkObEZ2KKaCsW5L5s0s//fBfoGgra4tb2r
         9m7Bt1AQdamnvtWhGkQ6kFiVvho4T6j6GPMXEO2WREwxfytuL1FU4IL45JwfRqGDWuwT
         he6xrIdURTszEh3JqYaPMnhNQasNndnBEEH+ACEaHzMPOm/ZrrzNahPkk2URWwkTUXtA
         IgiGOQF3Xz4IQMYp0UcPfKplbjMmHoNVPff/4Xkg398mTzdGFCzHIYLBcH9HjQTUZr7M
         HsFw==
X-Forwarded-Encrypted: i=1; AFNElJ9eOKogArqgUBaqfoaT/KuLLoM7F+lY2N0OAibfA2iS0yQxivgOhRdMW298WfN0TcMoPa3Bi2OYxxLVDp2XTUXs@lists.infradead.org
X-Gm-Message-State: AOJu0YyM1fnGmHyfMwVmXagk5+j4NaztyC7XSHlcO1VgoCPq998PMZZl
	wJTisErYZrZ4DXTpk+1xXsUV8LRv5n7RwbNmZxmV7iXrfhjal3jM8queMNgK4VHwVcla7XWn3a+
	MtDxNo3+eDbuNvgr9Sde/UpoyClOeVQcEQKXeBKRHffhPQD+4yqF6xY1jedavztPznlnIEYZ1xN
	y+NA==
X-Gm-Gg: Acq92OEVPyJ+uNdc1s8cH6CPxvcXsEL/Z6LK+wmF7ZrQV/S3PAsU9/MENcsjPuOyJSa
	eiBWRVsZoH7N/KhhIlmJ3hkhSyysQZ7qggGquY2BLq2AsF4HCTy7pLn5tXma36uv8Odtm9Yf/1n
	g7TdMyIBPWgaUH1V+P05kYN+gvi9zkDWHseDiH4bloxX3zXyHl7Roro7yzVT7142vm9CJaylF+W
	sh1GQpaDgV4YXfoYFm464GKW5JwTSMT+3Ok5s4rm4ILQ/op6glRTmXU7Ey85s7Y1EGT8mBgg/FW
	RATfCZrJBDYYuQLW1TBNMn6tUF5+0gKgcPa9RPUlJy86hWOoUI9A753meeCABhpixnVUicZSArs
	+9L/CXso+FizyiOHl9dxD5piZohDSRhps2cczwphUBybYE6Cytah5EybrzX7TzWamcC2Nrp1xha
	O4cq/3iXGG9FSJ9W3wioGJTB95l8UhT8siUyPsWw8Cx8TN3g==
X-Received: by 2002:a05:6102:644b:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-6ec43376b39mr3216909137.18.1780527551799;
        Wed, 03 Jun 2026 15:59:11 -0700 (PDT)
X-Received: by 2002:a05:6102:644b:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-6ec43376b39mr3216884137.18.1780527551258;
        Wed, 03 Jun 2026 15:59:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac29sm880386e87.52.2026.06.03.15.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:59:08 -0700 (PDT)
Date: Thu, 4 Jun 2026 01:59:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
        linux-rockchip@lists.infradead.org,
        Julius Werner <jwerner@chromium.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to
 Chromium-based /firmware
Message-ID: <pfo7vpd3ooiyfuo3wjom7qzknnnkiyel2kdu5fjqqrq5nccysq@e63rs7lgdfl4>
References: <20260428200712.2660635-1-briannorris@chromium.org>
 <20260428200712.2660635-8-briannorris@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428200712.2660635-8-briannorris@chromium.org>
X-Proofpoint-ORIG-GUID: Z3459lkfMb2iTCuO6jlBKTdPK8aPJDcq
X-Proofpoint-GUID: Z3459lkfMb2iTCuO6jlBKTdPK8aPJDcq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNCBTYWx0ZWRfXzjt+JvpWLp/4
 bUX8+vPrEWAgrhhr7obrS/qBoq/qCy5d0NNDkk4L4X8cnm0tAJ9suuICEhXR0T9u72N88bNTQsV
 Huq2KpJfkGPPppoKd93ZeQ+K7HGQBFSNFVpMAw/b5qIx1vvFDB0PVpAHE2vgUcqdlu3eYric7I3
 AaIalYK+SHx60+HOcks6LRB8S6cUhuU8qAZcvk0DWDdhOJCdKH4IUiZmz6AIMmZ/A/JnZ5kSOSj
 y2NhlTKAnX31MGvj4z+/Z3MVIGf8tWjWF2xrH3P3oX3wO9ZpjwJLX2yIXxeEA0W8lE/sbZ2qxJm
 8Cgx0VfX4ER0ExUJapCL4rlKWKuFB8QjURbSzB8AM9o+f2KcgeEBTssH1m3jxSL9aO1ljm24Rh1
 2HoFgOp8E+15pXz9GgR9F3AvB5FfMp4nmgb2QlNYb711gPCDogn0FKgMAwpXYvpT3uUYPfnpD2n
 xpPW0kl6cFPTvZQ9Wqg==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a20b1c0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=MUleZ9s-AAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=iD_vE5mCeOLV2fS3_3cA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=f0F4d6ZXEnSYrzQLsEx4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_155913_434075_A70B7112 
X-CRM114-Status: GOOD (  21.26  )
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

On Tue, Apr 28, 2026 at 01:06:59PM -0700, Brian Norris wrote:
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
> 
> / {
>         firmware {
>                 ranges;
> 
>                 coreboot {
>                         compatible = "coreboot";
>                         reg = <...>;
>                         ...;
>                 };
>         };
> };
> 
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
> 
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
> 
> [    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22
> 
> Add appropriate #{address,size}-cells to work around the problem.
> 
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
> 
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
> 
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

