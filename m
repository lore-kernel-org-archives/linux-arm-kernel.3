Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B6AC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 22:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWToxAdnI6Aa9yCRFIPR9W7z9KJYBd0BVcFA7/xQZy0=; b=E6wXQFbRnhm/TUKJBxuF+jVIsY
	bfnORSlLGHR1YCkfUtO7xOjpUD9HQkk7PcBk0NDle+9wtAShc48OsLYKDCgiOnUQ3NH77IRghxK/O
	56NKUDGNblER47jNSYcofoux1M+43gl7W6uAIUgL33YFSaRTznF9bmGfOiPKFrzpL32a+GmTD5Bui
	6nGYxgmgkfD63Owv9XG8vNRp/b6zbE5yMLlmwHHkjWQu+eJrbpR5n5lNJNULtNtXyCpHW745lYuC2
	3fltyfyCP6CS4y94Ij8GO64UdbOKkuRqKsj70S7jkrahvSzyn3S/nhl8ppYorW6EsUo3QcFynIho2
	W938E71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6dIR-000000037mQ-133i;
	Sun, 20 Apr 2025 22:37:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6dGT-000000037fa-3EaH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 22:35:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KML6VO018296
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Apr 2025 22:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWToxAdnI6Aa9yCRFIPR9W7z9KJYBd0BVcFA7/xQZy0=; b=VETGHU7ZdMmSPg1u
	mm6xJoxzR7diITNxdHOrVBiOWOsUjmYfdOv5dBArLmnkkTpXpazh41iBZ+6r3O78
	XoMjEw0sAZk06VoWWyMoi29CbaHKibMZZyvR+ESTeylwvDCKLuS0I3DXv+CsnDWL
	1BWeCOexNAveWvKhWNCr3xUNnM7EpNyR5OR3CRAAFcxPl5vY/v5CCNatdTdTY50s
	+6Voa1veAjLBGzoSYAAlt9CK9sWSYpFslAZ0rf3NiMoW9kJl4ckf5RTTJk4dORt8
	TT9f3y9b3/JVyC8DGlq4xi99+1CUA91D57lvEb2yi5gqg8A172g1luA4OpSb+J3m
	tEoeZw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642u9ajf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Apr 2025 22:35:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d9d8890fso792343585a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Apr 2025 15:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745188549; x=1745793349;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWToxAdnI6Aa9yCRFIPR9W7z9KJYBd0BVcFA7/xQZy0=;
        b=ZlGL6QWUkmanImviz7+wC8tTbrVBag0tmjOVCp4Bbvw3FuZHbP9NXy+6TZh9Wmbdxs
         71P1+2k+1rTDbmcaSo/5Dx3jVXTELXBgAlLlRSaPee785xlk9mAqkow6u1IYzTBkM+T/
         4JvFq+ne1/O4/23FosKn8zcZdGqLKl1cAmHmtajVJwG6A6j8Ck94PsPaFSYiqU6zR1P/
         mvuVUH54XbgxWnqCMfrQ+wxFk100RefbJg/b5NCqt4DR+IdduE058oBZSTd7QhPqnpvW
         HDGmCQRovzbCzfGH6Bcmmn/qLlvtU4+pUsxATR7ZsfBiAXv/YuLCUBfjhLVCCZRJ1FtN
         KHYw==
X-Forwarded-Encrypted: i=1; AJvYcCVAZkziPNUcUCWDNlHzQoEY4GB8Yt3A98OtH8ojny8lqQIefZv87fKddbVFSrssbAKAIyse7OTwawEkqCSA5WSQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyADGlsEkumPTdl2SgYBLn+0MpCfYytCvL8AklW9vulhwF2rXCR
	WjHZwkCQeOfXggGsBmJO1HWP/XMBt6H07LVmO+mQMzZu4ewf2/w24k5W13fwivq8CTEPqY6KH76
	c2yptw1rpW/8ijaeFjjWyNUw4FCvRYKG5WtDJu7Y2/GWr7uRq1gDuun7VDnXRg15rf4pldVC4Yg
	==
X-Gm-Gg: ASbGncsKzXLQGGcGc2WQh9pLMA8O78Uxc6dL0zWN2nXFzymIeuakpUXtonufkeZcNk0
	SeWvnmtRcSdJdFLisFb262pOsnmfYw8ixUfqCVfSv8ijWUh1BermCcx8OAOyR5gElDDXchOiFOx
	4lc8RjEmZ7Z7UMGLwQn4c64U/SQJjjC5DXprBAr2FgVR9NSE2fuI1t7P5P5dYlf4VeS4LCWk53D
	09VbBWeIbh76F9wD02TxbaTM8y8imre//yFXqyvNOjKD6NYrCdmVgwfo0swDK7jgH+oN6pV2nWr
	LR/UFZatyFDpZimqWl0IIHM8W/rbrnUxPj4PUKG9PFVyfysQ5d9kKvVkcAKho/hmdsHYbb4OwpA
	=
X-Received: by 2002:a05:620a:17a1:b0:7c5:93bd:fbf2 with SMTP id af79cd13be357-7c9257ef5e5mr1664104485a.19.1745188549544;
        Sun, 20 Apr 2025 15:35:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBIsV9h73etG5RMWOHPnVmCLLh+xKK8HOQ3zsl0XthtAmLfRYE2wnVV4KjY87RqdCOwW2XyA==
X-Received: by 2002:a05:620a:17a1:b0:7c5:93bd:fbf2 with SMTP id af79cd13be357-7c9257ef5e5mr1664102385a.19.1745188549177;
        Sun, 20 Apr 2025 15:35:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090782facsm9022941fa.33.2025.04.20.15.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 15:35:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: heiko@sntech.de, Damon Ding <damon.ding@rock-chips.com>
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, dianders@chromium.org,
        sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
        boris.brezillon@collabora.com, l.stach@pengutronix.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250310104114.2608063-1-damon.ding@rock-chips.com>
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
Subject: Re: (subset) [PATCH v8 00/13] Add eDP support for RK3588
Message-Id: <174518854674.614969.14581984196577762340.b4-ty@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 01:35:46 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TYaWtQQh c=1 sm=1 tr=0 ts=680576c7 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=XGKhw0KbdVzlZrVxzTIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: CqrsDR3jU_lY5L0O99guUzrKatI66tDe
X-Proofpoint-GUID: CqrsDR3jU_lY5L0O99guUzrKatI66tDe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_10,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_153554_231495_D52051F1 
X-CRM114-Status: GOOD (  11.34  )
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

On Mon, 10 Mar 2025 18:41:01 +0800, Damon Ding wrote:
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=936932
> 
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
> on RK3399 sapphire excavator board.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/13] drm/bridge: analogix_dp: Add irq flag IRQF_NO_AUTOEN instead of calling disable_irq()
        commit: efab13e7d13a641a22c7508cde6e1a5285161944
[02/13] drm/bridge: analogix_dp: Remove CONFIG_PM related check in analogix_dp_bind()/analogix_dp_unbind()
        commit: c71db051142a74b255cb61b84d8fedae3b70952f
[03/13] drm/bridge: analogix_dp: Add support for phy configuration.
        commit: 2c0883459ed62ac65784289e9236d673102eee68
[04/13] dt-bindings: display: rockchip: analogix-dp: Add support to get panel from the DP AUX bus
        commit: 46b0caaad3a5aed817a02b239d4cb4392c2a5dea
[05/13] drm/bridge: analogix_dp: Support to get &analogix_dp_device.plat_data and &analogix_dp_device.aux
        commit: fd073dffef041d6a2d11f00cd6cbd8ff46083396
[06/13] drm/bridge: analogix_dp: Add support to get panel from the DP AUX bus
        commit: e5e9fa9f7aad4ad7eedb6359baea9193531bf4ac
[07/13] drm/bridge: analogix_dp: Add support for &drm_dp_aux.wait_hpd_asserted()
        commit: c8f0b7cb01eadef03558b21245357683409da438
[08/13] drm/rockchip: analogix_dp: Add support to get panel from the DP AUX bus
        commit: d7b4936b2bc0987ccea125d9653381a1a0038d6d
[09/13] dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
        commit: f855146263b14abadd8d5bd0e280e54fbab3bd18
[10/13] drm/bridge: analogix_dp: Add support for RK3588
        commit: 0e8b86b6df143662c631dee8bb3b1fff368aa18a
[11/13] drm/rockchip: analogix_dp: Add support for RK3588
        commit: 729f8eefdcadaff98606931e691910f17d8d59d6

Best regards,
-- 
With best wishes
Dmitry



