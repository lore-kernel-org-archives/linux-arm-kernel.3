Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DCEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0A44HOo06DPQTnDCUPqJ4UMJjyqFyasJ88lIL5lLZ8=; b=UXMyHmbBg3a3861+3SMiuLzclP
	mwWM50DK6k+b+0hxwdZT11cPDzSxRhE6ZfKbBWwQ3Ls0NfDwAJxojqQXdNfH0EoZaHIxKaBA4G9WA
	NqRoMAd0uEXGMpVCbAXwSZQ/IlDBz5vhR+JWGZB7jrI4pDqHUVcQyujpgfKjvBrQjWEgprxLWAaux
	p5fUnbrAeAZQbqV/Oc98weLdR8rmi02WtS5ItM+cyYxx8S7kw2CqhPzbIVOZo73TAX8lgYVWnpQcH
	jiCvjGB4CscR6eeOwHE4SJ73/F79pbKWb+FD+EN+8nl3+UULQDMVAoj13c/6pAkxgXAwf0E9J47l6
	gZPoLUAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjQv-0000000Cbk2-2ege;
	Mon, 06 Jul 2026 13:32:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjQs-0000000CbjZ-3MLL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:32:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxBJc238111
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 13:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b0A44HOo06DPQTnDCUPqJ4UMJjyqFyasJ88lIL5lLZ8=; b=fG+3SBywJZ4CROyC
	EBkvPSthGbsziZkeQ7K40QVe4l60fKx8Uz2ijBpMSp1CBVrM+HI0Qd48bpu+Nzhi
	b04ix3wRfk0Y6Vz8Brg9AsqOEADGYxOTg6YXVxaP6tiB5K+NL9xWmAIQdcSDsoja
	45b2aDZ3euian4+uXjzxtwYvwI7wgwpW24xN4DoAEA0dPPY4VKGbbtifFuvCkpGD
	W08lRaoc5vSPjy7BTnjfbHHH1tS2o+s/64gN7WIJ9Qc5EPV85CK276mNfFiZO5Kz
	6EK8MGQwRIYJLD/vCqeLfFfNvZBogj1cBhA/mt27j0jVSHDY5xiaxoDqHwFtLlDE
	9x26Mg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t896uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 13:32:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84696ed3b24so4843197b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 06:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344741; x=1783949541; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0A44HOo06DPQTnDCUPqJ4UMJjyqFyasJ88lIL5lLZ8=;
        b=BB1e2kmeS/p7VEHFPDdCSUxfsxTnH8VS4nrBoie69YFcsomX9DmqZJX7gmWS7rFThn
         aNnFZ1zmxJgvYo+E0kTXvY9flDlpFbAZirtOvKR7thDO2tj7NnO6+DaEpxcbEtJQcKn0
         WC5Y0aDfIJIt6Ex0zdikdcZb8Feiph6eDevJp13utO5XnlyqCk5T0Ap/X/Q7mTjRWd5V
         R8qhJLPCuP7OmYZ+mvNSCT6BvXq47FQWcPMPF8UsRYbkIivHktyxzCVUNyCl4yIhtBi1
         WSt/KHcKFp9gLN8hCR7MuaPKIvVeEXKVIFytdXO7Yj1NcWS+CCQM7x9JA623cNcStJKV
         zsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344741; x=1783949541;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b0A44HOo06DPQTnDCUPqJ4UMJjyqFyasJ88lIL5lLZ8=;
        b=ZZltGXyhdxYdtpZY40G04LueSDCslToEZUSJ4XLgz9MGrDKGkF4QLEkniAtyvVnYwD
         cSGg14+ww7JYwev/ANwCqLlrKDX5z+Fa30XX5oVmDC7TEJwqCrZhkIFcI9em+A9KSqn5
         GGkyZ8Dr+MPs9uQ0A3KBp+R9521ARzlGPa625wLGfZh47A1KRsgpj+EMzmKdPniXUzHg
         3dpc28VQkSmpUCeYgs+0AVkO08ayulvTU2em6p0L3zLqWq1LyuPAd2yEAlyZF4pf6mGx
         NxSLTFgruUPzEXB0h0dddUdIJXPK4ePHIHmJGegGOaW35Dwnw2FBGcEjOGF4deRarl/n
         7ZKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2j33S8GgENwc5p43YCfYxE1KvnlxGHNvBJrzqIX6zFQSCznlx0oWxynkvPvXNakyRDTYGsoMi+bp4h6OPlk+j@lists.infradead.org
X-Gm-Message-State: AOJu0YzyQb4cxsgLJyN3snj/I8hV/qgYqrqOyt+5E+kR9kK+VmZrdDBj
	Bcw0HPpozc7rlghK4A9N32LeUTtYfkb/OqyNlq3F6LkCqiGeh22i7SFjeXi2XgIv3Z8xw4OgNvr
	7KDkcfRzj3MO3BZVM1mbsI9eSyAKQxm1UpjSofHLwro2mxLGE0jjjNOiY3ieGM0IJZv3RaJ3eDO
	Cg6g==
X-Gm-Gg: AfdE7ckn60DuODxXJYmeE7rn5sKpsP3LFKEET5qciRlRTjkS7ESJenCJ9gvrVYOmyAc
	xzybeulQ9x2Y48+enQnmqB8w+pcXBxjdG0B2aneY66dkYADzC6XaU5uFDL3aJUDzpf06p94IMtc
	22R9FhI7yvWByFZPLZkaMl6N3WWVyyRsuKvLzNhFoa4xirqeMVYfEdywe4b1DvoVLhrfr8tUtAx
	9PvMCpwrb8zcg54jUrVR18fbAk6aTx8hGYHjJHtI8J5qTeXsJXqDawaiIZuVbMJMQsZBebWmTRr
	b99he1hHsM6HdKkov9MFaQWoBucwmw/48mQ/4428ernoVQAn1X4OpmD0uxlBrxNS/aJg9WLZIKk
	nkIiP0R/G0SJKffQ=
X-Received: by 2002:a05:6a00:c8d:b0:847:8f8a:a055 with SMTP id d2e1a72fcca58-84826bea1afmr615691b3a.17.1783344741257;
        Mon, 06 Jul 2026 06:32:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8d:b0:847:8f8a:a055 with SMTP id d2e1a72fcca58-84826bea1afmr615631b3a.17.1783344740650;
        Mon, 06 Jul 2026 06:32:20 -0700 (PDT)
Received: from localhost ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d82382sm3762898b3a.49.2026.07.06.06.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:32:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 21:32:03 +0800
Message-Id: <DJRIY04KAKRH.2XJRADHKJ4G55@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/9] drm/aspeed: replace struct drm_simple_display_pipe
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
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-2-b4e1ca053623@oss.qualcomm.com> <4e35e133-364a-4743-9ca0-f0799bdf28f8@suse.de>
In-Reply-To: <4e35e133-364a-4743-9ca0-f0799bdf28f8@suse.de>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX/vOKBiUnzzB3
 hgXQaH1ruuH6e/FkuhCGEWKJyXqYrILnaw6bj45YIrEu7RkAadAxm6a/4LyA6IhPIkCaz5Ul/tZ
 fmHXTG0fKgYi9qd1gciaxSKv8idwQDA=
X-Proofpoint-GUID: byGwwgsd0OyGPRk1cFfTDzC6smv_FCWf
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bae66 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OF-i8N8vVdU2NhfsQ9oA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: byGwwgsd0OyGPRk1cFfTDzC6smv_FCWf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX5x/Gzz8H1hbc
 8lIxkTAy8inAcLQHmL7jwgAsdrz/ZiIxeYgNKeoa8TXupab3ldzMFx0JCwQmnAsRb5jwcRR2rYn
 RUfXEXqPsztIgYhCuWVyPpdQ59VBiagAWnLoJ3okN5dshxtieK703j2CUz9N4o8Ttp0K1QOM7Nj
 I+ZYLNMIAqIpN/J04623AZ3XSPgn1DRpFM0OUD/ScbtjN8kYnuFixxgBFNa/RP08lh4LGKCnKho
 wvma1Mt3hG4HecpVboQ8j3bK7EgShIppgqSJE7DnriPogCtBtMsvFCh3f5Dae2z2b5QX2mOv8+N
 jb/GGbDLVRNBRFd1+wFmz27MyUBqs4GBeBJ1iTVaJGqnJMdHEpX6aVsW2emTQChu2aiFU5ol4M+
 O6HEfKiB12dvSg68OhoZh+mwteRw0KLPMT31nUC5Au1lJZKfqwXAkCB25LNhQ47XcA7OVzjaC7N
 L7BQ3gZebbgmyah+GFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_063222_846255_9D77D488 
X-CRM114-Status: GOOD (  23.26  )
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

On Mon Jul 6, 2026 at 4:31 PM CST, Thomas Zimmermann wrote:
> Hi,
>
> common points from my arcgpu review applied here as well. See below for=
=20
> a new other things.
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> Replace simple display pipe with explicit plane, CRTC and encoder
>> objects. Move callbacks to plane and CRTC helpers, with vblank handling
>> through drm_crtc_funcs.
>>
>> This removes intermediate simple-pipe layer and uses standard atomic
>> helper wiring.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/aspeed/aspeed_gfx.h      |   5 +-
>>   drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 156 +++++++++++++++++++++++=
--------
>>   drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
>>   3 files changed, 123 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspee=
d/aspeed_gfx.h
>> index 4e6a442c3886..a34811564c0d 100644
>> --- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
>> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
>> @@ -2,7 +2,6 @@
>>   /* Copyright 2018 IBM Corporation */
>>  =20
>>   #include <drm/drm_device.h>
>> -#include <drm/drm_simple_kms_helper.h>
>>  =20
>>   struct aspeed_gfx {
>>   	struct drm_device		drm;
>> @@ -17,7 +16,9 @@ struct aspeed_gfx {
>>   	u32				throd_val;
>>   	u32				scan_line_max;
>>  =20
>> -	struct drm_simple_display_pipe	pipe;
>> +	struct drm_plane		plane;
>> +	struct drm_crtc			crtc;
>> +	struct drm_encoder		encoder;
>>   	struct drm_connector		connector;
>>   };
>>   #define to_aspeed_gfx(x) container_of(x, struct aspeed_gfx, drm)
>> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/=
aspeed/aspeed_gfx_crtc.c
>> index 7877a57b8e26..3294795c31c4 100644
>> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
>> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
>> @@ -5,6 +5,8 @@
>>   #include <linux/reset.h>
>>   #include <linux/regmap.h>
>>  =20
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_fb_dma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> @@ -12,20 +14,13 @@
>>   #include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_panel.h>
>> -#include <drm/drm_simple_kms_helper.h>
>>   #include <drm/drm_vblank.h>
>>  =20
>>   #include "aspeed_gfx.h"
>>  =20
>> -static struct aspeed_gfx *
>> -drm_pipe_to_aspeed_gfx(struct drm_simple_display_pipe *pipe)
>> -{
>> -	return container_of(pipe, struct aspeed_gfx, pipe);
>> -}
>> -
>
> Please create a new helper
>
>  =C2=A0 struct drm_aspeed_gfx *to_aspeed_gfx(drm_device *drm)
>
> that does the upcast.
>

Will do

>>   static int aspeed_gfx_set_pixel_fmt(struct aspeed_gfx *priv, u32 *bpp)
>>   {
>> -	struct drm_crtc *crtc =3D &priv->pipe.crtc;
>> +	struct drm_crtc *crtc =3D &priv->crtc;
>>   	struct drm_device *drm =3D crtc->dev;
>>   	const u32 format =3D crtc->primary->state->fb->format->format;
>>   	u32 ctrl1;
>> @@ -79,7 +74,7 @@ static void aspeed_gfx_disable_controller(struct aspee=
d_gfx *priv)
>>  =20
>>   static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
>>   {
>> -	struct drm_display_mode *m =3D &priv->pipe.crtc.state->adjusted_mode;
>> +	struct drm_display_mode *m =3D &priv->crtc.state->adjusted_mode;
>>   	u32 ctrl1, d_offset, t_count, bpp;
>>   	int err;
>>  =20
>> @@ -139,33 +134,31 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct a=
speed_gfx *priv)
>>   	writel(priv->throd_val, priv->base + CRT_THROD);
>>   }
>>  =20
>> -static void aspeed_gfx_pipe_enable(struct drm_simple_display_pipe *pipe=
,
>> -			      struct drm_crtc_state *crtc_state,
>> -			      struct drm_plane_state *plane_state)
>> +static void aspeed_gfx_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +						 struct drm_atomic_commit *state)
>
> Please see my comment on arcgpu for the new naming of 'state'.
>

OK

>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> +	struct aspeed_gfx *priv =3D container_of(crtc, struct aspeed_gfx, crtc=
);
>
> Please use=C2=A0 your helper=C2=A0 to_aspeed_gfx(crtc->dev)=C2=A0 to do t=
he upcast.=C2=A0=20
> Here any in other places.
>

OK

>>  =20
>>   	aspeed_gfx_crtc_mode_set_nofb(priv);
>>   	aspeed_gfx_enable_controller(priv);
>>   	drm_crtc_vblank_on(crtc);
>>   }
>>  =20
>> -static void aspeed_gfx_pipe_disable(struct drm_simple_display_pipe *pip=
e)
>> +static void aspeed_gfx_crtc_helper_atomic_disable(struct drm_crtc *crtc=
,
>> +						  struct drm_atomic_commit *state)
>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> +	struct aspeed_gfx *priv =3D container_of(crtc, struct aspeed_gfx, crtc=
);
>
> Another upcast issue
>

Acknowledged

>>  =20
>>   	drm_crtc_vblank_off(crtc);
>>   	aspeed_gfx_disable_controller(priv);
>>   }
>>  =20
>> -static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe=
,
>> -				   struct drm_plane_state *plane_state)
>> +static void aspeed_gfx_plane_helper_atomic_update(struct drm_plane *pla=
ne,
>> +						  struct drm_atomic_commit *state)
>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_framebuffer *fb =3D pipe->plane.state->fb;
>> +	struct aspeed_gfx *priv =3D container_of(plane, struct aspeed_gfx, pla=
ne);
>
> to_aspeed_gfx(plane->dev)
>

Acknowledged

>> +	struct drm_crtc *crtc =3D &priv->crtc;
>> +	struct drm_framebuffer *fb =3D plane->state->fb;
>>   	struct drm_pending_vblank_event *event;
>>   	struct drm_gem_dma_object *gem;
>>  =20
>> @@ -190,9 +183,9 @@ static void aspeed_gfx_pipe_update(struct drm_simple=
_display_pipe *pipe,
>>   	writel(gem->dma_addr, priv->base + CRT_ADDR);
>>   }
>>  =20
>> -static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pip=
e)
>> +static int aspeed_gfx_crtc_enable_vblank(struct drm_crtc *crtc)
>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> +	struct aspeed_gfx *priv =3D container_of(crtc, struct aspeed_gfx, crtc=
);
>>   	u32 reg =3D readl(priv->base + CRT_CTRL1);
>>  =20
>>   	/* Clear pending VBLANK IRQ */
>> @@ -204,9 +197,9 @@ static int aspeed_gfx_enable_vblank(struct drm_simpl=
e_display_pipe *pipe)
>>   	return 0;
>>   }
>>  =20
>> -static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *p=
ipe)
>> +static void aspeed_gfx_crtc_disable_vblank(struct drm_crtc *crtc)
>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> +	struct aspeed_gfx *priv =3D container_of(crtc, struct aspeed_gfx, crtc=
);
>>   	u32 reg =3D readl(priv->base + CRT_CTRL1);
>>  =20
>>   	reg &=3D ~CRT_CTRL_VERTICAL_INTR_EN;
>> @@ -216,12 +209,75 @@ static void aspeed_gfx_disable_vblank(struct drm_s=
imple_display_pipe *pipe)
>>   	writel(reg | CRT_CTRL_VERTICAL_INTR_STS, priv->base + CRT_CTRL1);
>>   }
>>  =20
>> -static const struct drm_simple_display_pipe_funcs aspeed_gfx_funcs =3D =
{
>> -	.enable		=3D aspeed_gfx_pipe_enable,
>> -	.disable	=3D aspeed_gfx_pipe_disable,
>> -	.update		=3D aspeed_gfx_pipe_update,
>> -	.enable_vblank	=3D aspeed_gfx_enable_vblank,
>> -	.disable_vblank	=3D aspeed_gfx_disable_vblank,
>> +static int aspeed_gfx_plane_helper_atomic_check(struct drm_plane *plane=
,
>> +						struct drm_atomic_commit *state)
>> +{
>> +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state=
(state, plane);
>> +	struct drm_crtc *crtc =3D plane_state->crtc;
>> +	struct drm_crtc_state *crtc_state =3D NULL;
>> +	int ret;
>> +
>> +	if (crtc)
>> +		crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
>> +
>> +	ret =3D drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  false, false);
>> +	return ret;
>> +}
>
> Return directly.
>

OK

>> +
>> +static const struct drm_plane_helper_funcs aspeed_gfx_plane_helper_func=
s =3D {
>> +	.prepare_fb	=3D drm_gem_plane_helper_prepare_fb,
>> +	.atomic_check	=3D aspeed_gfx_plane_helper_atomic_check,
>> +	.atomic_update	=3D aspeed_gfx_plane_helper_atomic_update,
>> +};
>> +
>> +static const struct drm_plane_funcs aspeed_gfx_plane_funcs =3D {
>> +	.update_plane		=3D drm_atomic_helper_update_plane,
>> +	.disable_plane		=3D drm_atomic_helper_disable_plane,
>> +	.destroy		=3D drm_plane_cleanup,
>> +	.reset			=3D drm_atomic_helper_plane_reset,
>> +	.atomic_duplicate_state	=3D drm_atomic_helper_plane_duplicate_state,
>> +	.atomic_destroy_state	=3D drm_atomic_helper_plane_destroy_state,
>> +};
>> +
>> +static int aspeed_gfx_crtc_helper_atomic_check(struct drm_crtc *crtc,
>> +					       struct drm_atomic_commit *state)
>> +{
>> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(st=
ate, crtc);
>> +	int ret;
>> +
>> +	if (!crtc_state->enable)
>> +		goto out;
>> +
>> +	ret =3D drm_atomic_helper_check_crtc_primary_plane(crtc_state);
>> +	if (ret)
>> +		return ret;
>> +
>> +out:
>> +	return drm_atomic_add_affected_planes(state, crtc);
>> +}
>
> See arcpgu on a possible style improvement.
>

Will do, thanks


> Best regards
> Thomas
>

[ ... ]

