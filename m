Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F8DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vL4MQZJyYnOZgb+t9Slt97jlU8ZMhiBcIG4lPhLxhqk=; b=T3a5QqtbAEwibn+hbxbvJRxtk9
	xMuEpIZbhaLf/5uI42umYTgA57aMypnyAH/SJxeRQdNpF2XenkQhmREglDkCwHWjcNrbXhP/fP0br
	H2gIFtCrv57NvwZBFJgiuzS4V0eAZNEHkHeJ0PPdO1Ivvv8lyUKduWyOdNWEh3QbQPPsrHwkG23k+
	6vJAt4sKbKKzGIWmGFc9PEbYh/CBzrojSfQnD1Oy57L+83tcZI+7ezH6RkZUsXG/Fts66G0IxwsbJ
	FWSgDpDy2zxox11lmuOcVqb4HtahGviVIo5KfOAK/3Zfy1WXcb8myFI95WWPDJS9Ccel+5aKVAO/2
	bbyJ3UKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTY5-0000000HODS-0UnO;
	Wed, 08 Jul 2026 14:46:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTY3-0000000HOCy-2lpa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:46:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3RZX2738620
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Jul 2026 14:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vL4MQZJyYnOZgb+t9Slt97jlU8ZMhiBcIG4lPhLxhqk=; b=l9PTuMVsLQ/lb5E7
	FUy+YKYjhfuxGpV2yPYrT8cW990iscK3mTQzOIF8tGq/IN0UGqjuAyycToz5zcmp
	b5J5Ef65ekAr1pBRTSoIVmVaCAilH9sfGD3P2WGPIs887lWUsiNiEKklxBPgWTzc
	dEcSjBxCFMfjZgSkE9LOnrD5tnmd4F1z/y65PGB1QpI4IiFBzBbHqeO8mC3y1SyT
	VijYEMNHVsbO8/EMtiW5eEhFMLHRcUpvXEZ5J4PAOgvLKXcYGSY8gNO9U3ScfM0r
	JhbjreFoT0InUzIWIFkZZMGSEQ76sA922nbzv2otnraPB1TKtoPir2rkT9lzt6gG
	mmmXMA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv1vg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 14:46:51 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-448d61d82e8so360850fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783522010; x=1784126810; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vL4MQZJyYnOZgb+t9Slt97jlU8ZMhiBcIG4lPhLxhqk=;
        b=CdVOhoSC0PwrnJkqfa6c4/DViYnkc6JD2Akm3wtNHzAb/+aPnPFXaUC4sCfXge+9Sr
         fjIVTHB7wDFjqjRYaOIWycwPVTqSwvnfF791ZCJtZkYNMnzwd9bdBIQg9h+i64CabT8z
         a13aQGn8ToEbKMLz/0rBmKk/mf33GZ3PhlBRbdpm6TagFXb/rrvDBww4YCgwcFgKWy6V
         Zj2XlaElRmfDDrYY/uC+d/LNvqZcXqxcmRdmx4FyQQYTTSCXgPw5uI+wSMXPmG+G2rXP
         ex+puvu9MuPajH0uWZ0/nOVmJBk0ovzuwkg8VJf9Ljur5ndSRGXwRXwPL4UlnfSpTRH/
         y6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522010; x=1784126810;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vL4MQZJyYnOZgb+t9Slt97jlU8ZMhiBcIG4lPhLxhqk=;
        b=SSXrv0Tn0BzaET76DCIJzEph18pZH3tYO3AoTWZUr/XeNwO2xbhxU47PkLvtnEqgsP
         Lt+qaXNq8BzKnX9cAupi8FS8r3Zki0jl3kfYHQ3cqGyfLjy3YsYXn9TTAHRNsG610Erh
         i2+79l4BiL9ViyIVtBCfxNANVA0Y1LguwVBv5auHoAH0dOzwQB1C2K+AEDURermnEgY7
         bgBW0WFssoNBVbWIG14TekuFF/G+ejkvmnUdZ9xAbE9CQHN3yzUW/BMm0NtbY/cCLfak
         GnEIsdEJAHJrKjZzAXTWpQ/ziE80Xlg1yAo+8SKDoJA6iN0Uu5iYJXivcTAVNsiLAVNx
         WMFA==
X-Forwarded-Encrypted: i=1; AHgh+RoudsyW1XsfXLxKUOCFnfd9HH+ZmI6eC7WoPuNdwGrK67c9sdugvZsTnhagWiVb9cR98CoWWMk0Hi2UnClUp3Hj@lists.infradead.org
X-Gm-Message-State: AOJu0YxG1IzOY88mUNoLAlB+zbVWibLqqJNZM2h4eTg37H8qoEWF6nG9
	HpddxcbRl1AMcQAq2zImffh6GpSgsxi5SxRvau2UOCTy/veBlC0FVD0WAkPzQV5ypPN/nqBRZS+
	D3jdxWbO+bfO8rdi98Lrt7YmvRU1GqvzzO2zLckwrZrzp6xhlxtF8N6jRKneZEi8MKBhSHNSDww
	7N6g==
X-Gm-Gg: AfdE7cndJ2LuN1s2lAltZkQQCPGxPcBUo9g3T6FWiduGeK9rPGaMstifc/+GWtzMnFd
	+SxnwDO7Nvg/fiAiEmsJ+ioKVeAvOHft9IiRmOO12WD3MIyF3goDNV1wMbMIlpfGweF5Fnb1lAB
	wDmLTGsnueVICsO85skTEP1D8p8QVnpT9ixUSQ6TFP4GEewFZBWFx+ZPUit6uVgzJYmvzRRuQmN
	AVL8+X77s5/52NHDSLf0BYOEz84YVDgINignvTImRSDij6BpsKLP/TVkTfNKqIepTwl/FmGilY+
	fv7QwzYkKzG8tOySDxJdYsOrLRX2bIKPcELtrQfaEXRm59eFyxTO1NGa7LBsX378sNHHq7orEtI
	BbHbZUJBK1l1U29A=
X-Received: by 2002:a05:6871:2ecf:b0:447:a321:35d with SMTP id 586e51a60fabf-4516387345cmr1779002fac.10.1783522010284;
        Wed, 08 Jul 2026 07:46:50 -0700 (PDT)
X-Received: by 2002:a05:6871:2ecf:b0:447:a321:35d with SMTP id 586e51a60fabf-4516387345cmr1778984fac.10.1783522009770;
        Wed, 08 Jul 2026 07:46:49 -0700 (PDT)
Received: from localhost ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb13d619sm18125627fac.2.2026.07.08.07.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:46:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 22:46:30 +0800
Message-Id: <DJT9S3CQRB0P.982J925T9O4B@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/9] drm/pl111: replace struct drm_simple_display_pipe
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
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-5-b4e1ca053623@oss.qualcomm.com> <747ae980-9358-4e15-84e3-6e2f3e143423@suse.de>
In-Reply-To: <747ae980-9358-4e15-84e3-6e2f3e143423@suse.de>
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e62db cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bxtzNzRwT3Q_vXoiTiMA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NSBTYWx0ZWRfX1x4cRGQkCJVw
 Oo8w+4ONYis3zdrLFXTEBpIEzNiNwmvmGwy63AsZ3FdtukeOvwsRlNU9/C9u5KIyIRoHHHPX8tu
 D9MzpJjnSCWZywdshUz2/5QnRu/z2N0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NSBTYWx0ZWRfXzpovkvFpIY5t
 sdBVskgXGUfO8ajgcuGez8rGSfh1MAMAOqDgvJMl2vrOgtoCTrCXCc4uiwrCgv5YulQuOaAlqex
 hsw8WESTTrcTyphcdQFeOTSHLxXRa0gogSy86xM/mnxU0MZTtK58nicwR0MRLvNsKVULG8H4zeN
 WZ6d1lTkkQdP8a0MCkT4XOQtzHSngi3dcqWcUucG0cZ7AsLmptpRs1iT7G9LGKdlEp15FD5Wuqw
 HPHIkKrZfTEJYQuxluusUoFctbQHryhuq5LYm31gJISWITh3yI4sGY0OI0z2iDy6VGBSj154shy
 rqkDJgIWxCzJ3C6BiXwmiQ1T549rJpuOHtfnbJPhGKNY22jJ62lV1lb5oYSpEZ2xKefIqk3qfnv
 1weYcVnqw4QoWCFQFOvvPeSPU7LO2+8nCpQzDqlZyjTYlg4eFJobaykG/4T29dyezjjPFFOalbh
 iQNubwjdOIgIlx4C49g==
X-Proofpoint-ORIG-GUID: bsZHvmeTp_Wm7-jKfEJYHLsbuXSitnNb
X-Proofpoint-GUID: bsZHvmeTp_Wm7-jKfEJYHLsbuXSitnNb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_074651_709986_948D5E51 
X-CRM114-Status: GOOD (  16.12  )
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

On Wed Jul 8, 2026 at 9:03 PM CST, Thomas Zimmermann wrote:
>
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> Replace PL111 simple display pipe with explicit plane, CRTC and encoder
>> objects.
>>
>> Keep existing hardware programming and vblank behavior, and install GEM
>> framebuffer prepare helper explicitly.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/pl111/pl111_display.c | 174 ++++++++++++++++++++++++++=
--------
>>   drivers/gpu/drm/pl111/pl111_drm.h     |   5 +-
>>   drivers/gpu/drm/pl111/pl111_drv.c     |   3 +-
>>   3 files changed, 136 insertions(+), 46 deletions(-)
>>

[ ... ]

>> -static int pl111_display_check(struct drm_simple_display_pipe *pipe,
>> -			       struct drm_plane_state *pstate,
>> -			       struct drm_crtc_state *cstate)
>> +static int pl111_plane_helper_atomic_check(struct drm_plane *plane,
>> +					   struct drm_atomic_commit *state)
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
>> +
>> +	cstate =3D drm_atomic_get_new_crtc_state(state, crtc);
>> +	if (!cstate)
>> +		return 0;
>> +
>> +	ret =3D drm_atomic_helper_check_plane_state(pstate, cstate,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  false, false);
>
> This is another case of _check_plane_state() running conditionally.
>

Acknowledged

>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!pstate->visible)
>> +		return 0;
>> +
>> +	mode =3D &cstate->mode;
>>  =20
>>   	if (mode->hdisplay % 16)
>>   		return -EINVAL;
>> @@ -117,16 +140,14 @@ static int pl111_display_check(struct drm_simple_d=
isplay_pipe *pipe,
>>   	return 0;
>>   }

[ ... ]

