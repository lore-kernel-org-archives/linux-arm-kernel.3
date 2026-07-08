Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BACC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7S+MjchcQqeSwjWf/6h1QHGeCWnNy62k3EwNXzSfzYE=; b=Oz8GeInhIg3xCo/7pn1a30Q5nX
	o1xnhylb9m/0RaFFuSG8nYjQvyPSHemkxypmtdt0Mk2wGSh/kIMLMzzkAWnhLFwe7w6atler2LMJp
	wA16dZo7FGGgWOn40IQ3qAiWkNmLTc69vi4Aq0nkJq42/2arOXi5V/E2dL4VMNaUC5t2JCbslpd4v
	Xk8QxMdAbq/WketE+bbQ0VSp15B3SzCiVPYprJ7/DaRzYKNlkkDkdyeE/95ijYPE5nSkIDtwAw3zr
	JH/lSot1e0rk1FVxNOm+QX6rv4Do1FfUR/wcy8NnUy1HV27X/u0XcQNfKXD2c2zoK0sAaJ6YUXsr5
	GyB/Nvsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whStI-0000000HEci-3e24;
	Wed, 08 Jul 2026 14:04:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whStG-0000000HEcM-3kdj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:04:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3BOL2751092
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Jul 2026 14:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7S+MjchcQqeSwjWf/6h1QHGeCWnNy62k3EwNXzSfzYE=; b=XYn5xS7iC7VCcWix
	xhnhTIcvDNsc1/nvfBhoPlNbOhiej2Avy11JpIjojoQiY5W7VaF6F64qB174NOCl
	2CQumGJy+kTFU2ACISEHy1qwarBGDEfgE0UKgxgCq12USRJvImgwzKRpvwoihH4a
	E8Dc1MurOOAeC6VGsIkChHnSuAel5oo0Yf4wS7G8TILVblGK+LApBlJNmAFhJrE3
	iMNn1EO5gr+PsJHXUPL5j/Z3LK24ZSi7OEIPpG/qFsg48yuKx+nfFFww6QPfWnLo
	FZxPnOLImbYNSBpBGfMHvs2t6mdaDaMv4RClDsBsjH5NqC5WGizNkXg9m+Uo2Pue
	d726+Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hj0b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 14:04:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb687f82eso13894965ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783519482; x=1784124282; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S+MjchcQqeSwjWf/6h1QHGeCWnNy62k3EwNXzSfzYE=;
        b=S3WpLkTisyTVPOlBUWSz1HtPt729ONJVyPyPuI3G818UNQPt8cXWmDY7cmmIuBHHvp
         8k1csmaBoHJ4l5uhFQNqb7d/gvEPjheZ/Rbsjl7Klh/c4SQnGQVd7xjg/scyOWLvbmwk
         Ez4KLioBrc7RyIWkjKlNya2qfHLwHKE1TTDB61sge9MhqaQuewFWgQ/CK0Eu8TK3vEDm
         b74pfb0JYmiKzjDY0lQAlTcEWjU2fLXOqtpxn83L91gr4+EpJIBH/pDGufYDC+gQWdX8
         T2yn3UK2++AZ/KU/kNNuJI06CivDfvCPbsikaPdf1A9RJFfnek/7tUGa9R5HfLvFc7Vn
         BMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519482; x=1784124282;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7S+MjchcQqeSwjWf/6h1QHGeCWnNy62k3EwNXzSfzYE=;
        b=IjkP5xhjUirqCuveRUtO66D/oNsc2Qhp+girrwEBOA5xKxJNnCtJF+ZvMfwg/KZItF
         qhmc9oJtH+pON95gNc+0def+2kNECwy1jL1ZrUw84rxvKEnbNuKzBX0A30BsufpoUhy/
         DkHHhwxEQqcL92YWK6E26OwYmhhA7r3yOvIqQ5OoXxvpMLYowrdwkXiSgmugBJZcQC7s
         q2cCLK8NKYkKla0QXQNS/b2D/YMeWOBlwQygaPS8ySJZlTAXAyZ4YQ/PUvz1IL3ZjOgB
         45WU34N+siAVeIrisOZSTt85C3vi41IBZObNUtQfmJfDuMeMzn2b8aSQDMSdhawbL8hR
         ExlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rohx/iRm9dOH5dBQvdBKiMFsKREQGhaBUq0fW1SYh25AHZbDLSQu1nf+3JaKAXtzsnuGUzaDY6USuFqCeR1Qz0d@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4YjeZva5hl0+hRgZlkvYTeAoKu7YN/JXqIsIt4WduWxJCi6QZ
	86AVts3T03AGLkHefl9b7rSbADCf2l9YeQIVxBk3wSLo9MeUT3xKJr8LsWdDasw/dc4kLle7+iH
	figUVde/TPsbsUQjyRtPUcMPldEQsLsp1AVAg6qEwNiiqvIqq5Ff0nbAL2zQkMBE8ALkv6WxAKK
	Adjw==
X-Gm-Gg: AfdE7clBtY482Zx6m6/cEaYa7ntaXSZeZpAs+Fm4vZhSWjG35585H6LIzuZjdEiueQ5
	TIT6vP4+Wtw89QcGlBpEPBMVPvUACyLUxrMsPPk54ruQvzbyCmAhHVmagSyPjKoLHRL7jcovINi
	YQdkPTwIFb+pm2Piw1ayPUfGIteQYrXTw9FzdSvlxsmKwaW6ay22u6jj6h0qFpeaWNCJaZH9Sg+
	YfEZgcYdlstu6DSjD9U09O7eDFNRq1yvRYBEZWwPjNMZDcztK5LzHlUPv+7Doo1dO8q0puBvuG7
	spf96w2wP7JZhlckyDEsTuu1DGx4AZOGbLY05DDGHp14+f7BxPE/XGzBh4fPSieLFDJFCsx696+
	OL14F3ghoq9PB27o=
X-Received: by 2002:a17:903:110f:b0:2c9:ae0b:61e3 with SMTP id d9443c01a7336-2ccea2d7e14mr27467195ad.2.1783519481634;
        Wed, 08 Jul 2026 07:04:41 -0700 (PDT)
X-Received: by 2002:a17:903:110f:b0:2c9:ae0b:61e3 with SMTP id d9443c01a7336-2ccea2d7e14mr27466655ad.2.1783519481069;
        Wed, 08 Jul 2026 07:04:41 -0700 (PDT)
Received: from localhost ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdcbe2sm29180235ad.9.2026.07.08.07.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:04:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 22:04:21 +0800
Message-Id: <DJT8VTO893BW.1DXRZNVOUL362@oss.qualcomm.com>
Subject: Re: [PATCH 4/9] drm/mcde: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Ze Huang"
 <ze.huang@oss.qualcomm.com>,
        "Alexey Brodkin" <abrodkin@synopsys.com>,
        "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard"
 <mripard@kernel.org>,
        "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>,
        "Joel Stanley" <joel@jms.id.au>,
        "Andrew Jeffery"
 <andrew@codeconstruct.com.au>,
        "Frank Li" <Frank.Li@nxp.com>,
        "Sascha
 Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        "Hans de Goede" <hansg@kernel.org>,
        "Alex
 Lanzano" <lanzano.alex@gmail.com>,
        "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-4-b4e1ca053623@oss.qualcomm.com> <4d1ddd5d-2635-4ee0-8481-78f3a034233b@suse.de>
In-Reply-To: <4d1ddd5d-2635-4ee0-8481-78f3a034233b@suse.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzOCBTYWx0ZWRfX77MhxMVKGlpZ
 bGGk/Rvl+F7BtgLp+JvVMW94mbZjNbXkWc74Ff72c7s4RLwdD/uhIudrChyf+e51e/c3QG1HRPD
 k1Rrl+sECgRCYFeWrs8VDZHvj/8DS0QMX6/18ddIxzusBDxRebFZN1fYx0PTS6+HFNBZDsrpXlW
 HA/QK6GIiU3lytTzpxiJFrI3XazbkRmXlLNch+HYdF/aWtbI/Swguba3ozAZpxxC1k9uyfIUxiW
 9LeCr+FsIYBQ/Q9eqQnc5eduL44lgz5hd82Hd5iKk28N5DaFDAD5GOuUmL2bGiTLdxiR+xki6Qd
 MgEZjcj/priheVk9gRXzS5SmF3qbg7swds09C1wEMfP3vncAsANIPrQ1jhktj/rK28x92x/7yvG
 Ez1LbErZPRFTI7WgceotnzoS3WZr+DBbJGA9e7d8lzKVPgAmGC97wQWsq78W9V6nrxlbi5dfVFL
 0ietAf9ThB8WWCtQcOw==
X-Proofpoint-GUID: k_NZUPDuqyGE5xL9mFOAJi4xyVHkyAPg
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e58fa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=7ZHkO8slaP7M83yUoBMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzOCBTYWx0ZWRfX+4HddH/17DIs
 8sHwhx+2+v//XvjJIlPPhyEQZJe66sY3E4w0B4GXTeTBhJt9OvXqb1T14dMBwwco9M7Coy9yxTp
 Dv1+cOTf3op4rXLMtff8WhZvMnytSbc=
X-Proofpoint-ORIG-GUID: k_NZUPDuqyGE5xL9mFOAJi4xyVHkyAPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_070442_941935_67ACC5E2 
X-CRM114-Status: GOOD (  27.81  )
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

On Wed Jul 8, 2026 at 9:02 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> Convert MCDE to explicit plane, CRTC and encoder objects.
>>
>> Keep FIFO, event and framebuffer update sequencing intact, and install
>> GEM framebuffer prepare callback explicitly.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/mcde/mcde_display.c | 162 +++++++++++++++++++++++++++-=
--------
>>   drivers/gpu/drm/mcde/mcde_drm.h     |   6 +-
>>   drivers/gpu/drm/mcde/mcde_drv.c     |   3 +-
>>   3 files changed, 129 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/=
mcde_display.c
>> index 257a6e84dd58..4d86fa5030eb 100644
>> --- a/drivers/gpu/drm/mcde/mcde_display.c
>> +++ b/drivers/gpu/drm/mcde/mcde_display.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/media-bus-format.h>
>>  =20
>> +#include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_fb_dma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> @@ -18,7 +19,6 @@
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_mipi_dsi.h>
>>   #include <drm/drm_print.h>
>> -#include <drm/drm_simple_kms_helper.h>
>>   #include <drm/drm_bridge.h>
>>   #include <drm/drm_vblank.h>
>>   #include <video/mipi_display.h>
>> @@ -132,7 +132,7 @@ void mcde_display_irq(struct mcde *mcde)
>>   	writel(mispp, mcde->regs + MCDE_RISPP);
>>  =20
>>   	if (vblank)
>> -		drm_crtc_handle_vblank(&mcde->pipe.crtc);
>> +		drm_crtc_handle_vblank(&mcde->crtc);
>>  =20
>>   	if (misovl)
>>   		dev_info(mcde->dev, "some stray overlay IRQ %08x\n", misovl);
>> @@ -157,13 +157,35 @@ void mcde_display_disable_irqs(struct mcde *mcde)
>>   	writel(0xFFFFFFFF, mcde->regs + MCDE_RISCHNL);
>>   }
>>  =20
>> -static int mcde_display_check(struct drm_simple_display_pipe *pipe,
>> -			      struct drm_plane_state *pstate,
>> -			      struct drm_crtc_state *cstate)
>> +static int mcde_plane_helper_atomic_check(struct drm_plane *plane,
>> +					  struct drm_atomic_commit *state)
>>   {
>> -	const struct drm_display_mode *mode =3D &cstate->mode;
>> -	struct drm_framebuffer *old_fb =3D pipe->plane.state->fb;
>> +	struct drm_plane_state *pstate =3D drm_atomic_get_new_plane_state(stat=
e, plane);
>> +	struct drm_crtc *crtc =3D pstate->crtc;
>> +	struct drm_crtc_state *cstate;
>> +	const struct drm_display_mode *mode;
>> +	struct drm_framebuffer *old_fb =3D plane->state->fb;
>>   	struct drm_framebuffer *fb =3D pstate->fb;
>> +	int ret;
>> +
>> +	if (!crtc)
>> +		return 0;
>
> Your planes' atomic_check functions should always run=20
> drm_atomic_helper_check_plane_state() first. Otherwise, the plane state=
=20
> will be incorrect.
>
> If there is no crtc, simply pass NULL for the CRTC state.=C2=A0 I'd advis=
e to=20
> duplicate the pattern at [1] from lines 487 to 498.=C2=A0 After=20
> _check_plane_state() ran, the atomic_check can do additional tests.
>
> If not looked over all the other patches for this problem, but this=20
> comment would apply to all of them.
>
> [1]=20
> https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/drm/mgag200/mg=
ag200_mode.c#L487

Will follow, thanks

>
>> +
>> +	cstate =3D drm_atomic_get_new_crtc_state(state, crtc);
>> +	if (!cstate)
>> +		return 0;
>> +
>> +	ret =3D drm_atomic_helper_check_plane_state(pstate, cstate,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  false, false);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!pstate->visible)
>> +		return 0;
>> +
>> +	mode =3D &cstate->mode;
>>  =20
>>   	if (fb) {
>>   		u32 offset =3D drm_fb_dma_get_gem_addr(fb, pstate, 0);
>> @@ -1149,16 +1171,14 @@ static void mcde_setup_dsi(struct mcde *mcde, co=
nst struct drm_display_mode *mod
>>   	*dsi_formatter_frame =3D formatter_frame;
>>   }
>>  =20
>> -static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
>> -				struct drm_crtc_state *cstate,
>> -				struct drm_plane_state *plane_state)
>> +static void mcde_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					   struct drm_atomic_commit *state)
>>   {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_plane *plane =3D &pipe->plane;
>>   	struct drm_device *drm =3D crtc->dev;
>>   	struct mcde *mcde =3D to_mcde(drm);
>> +	struct drm_crtc_state *cstate =3D crtc->state;
>>   	const struct drm_display_mode *mode =3D &cstate->mode;
>> -	struct drm_framebuffer *fb =3D plane->state->fb;
>> +	struct drm_framebuffer *fb =3D mcde->plane.state->fb;
>>   	u32 format =3D fb->format->format;
>>   	int dsi_pkt_size;
>>   	int fifo_wtrmrk;
>> @@ -1298,9 +1318,9 @@ static void mcde_display_enable(struct drm_simple_=
display_pipe *pipe,
>>   	dev_info(drm->dev, "MCDE display is enabled\n");
>>   }
>>  =20
>> -static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
>> +static void mcde_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +					    struct drm_atomic_commit *state)
>>   {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>>   	struct drm_device *drm =3D crtc->dev;
>>   	struct mcde *mcde =3D to_mcde(drm);
>>   	struct drm_pending_vblank_event *event;
>> @@ -1381,17 +1401,23 @@ static void mcde_set_extsrc(struct mcde *mcde, u=
32 buffer_address)
>>   	writel(buffer_address + mcde->stride, mcde->regs + MCDE_EXTSRCXA1);
>>   }
>>  =20
>> -static void mcde_display_update(struct drm_simple_display_pipe *pipe,
>> -				struct drm_plane_state *old_pstate)
>> +static void mcde_plane_helper_atomic_update(struct drm_plane *plane,
>> +					    struct drm_atomic_commit *state)
>>   {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_device *drm =3D crtc->dev;
>> -	struct mcde *mcde =3D to_mcde(drm);
>> -	struct drm_pending_vblank_event *event =3D crtc->state->event;
>> -	struct drm_plane *plane =3D &pipe->plane;
>> +	struct drm_crtc *crtc =3D plane->state->crtc;
>> +	struct drm_device *drm;
>> +	struct mcde *mcde;
>> +	struct drm_pending_vblank_event *event;
>>   	struct drm_plane_state *pstate =3D plane->state;
>>   	struct drm_framebuffer *fb =3D pstate->fb;
>>  =20
>> +	if (!crtc)
>> +		return;
>
> The helper first does vblank handling and then handles visibility by=20
> testing "if (fb)". No need for this test.

Will drop it

>
>> +
>> +	drm =3D crtc->dev;
>> +	mcde =3D to_mcde(drm);
>> +	event =3D crtc->state->event;
>> +
>
> And this needs to handle !crtc without returning.
>
>>   	/*
>>   	 * Handle any pending event first, we need to arm the vblank
>
> And the next block handled vblanks, which is not the right place. That's=
=20
> a preexisting issue.=C2=A0 Vblank handling is better done in the crtc's=
=20
> atomic_flush.

I'll move vblank handling logic to new atomic_flush function

>
> Best regards
> Thomas
>
>>   	 * interrupt before sending any update to the display so we don't
>> @@ -1443,9 +1469,8 @@ static void mcde_display_update(struct drm_simple_=
display_pipe *pipe,
>>   	}
>>   }

Thanks,
Ze

