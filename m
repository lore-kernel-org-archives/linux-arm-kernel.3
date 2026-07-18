Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37815C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 15:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3Tozc6XvAyXDRXhNm08ssVPc4HklhucZjeYpfFjPmA=; b=R+qvb48lVWJLTKXv7kCOafPskI
	QcbR4kt9gGiC5EntqmGmo+EbY1USdqHoJXOvk8XHicwCwyzqM6q8Bqpla+QKop1DjBFopU4mgNKAM
	hwF+dsBC2NEzZWRqXvd2m8y3q2B4OX4FcF7y6JZgECjhek79l+zUC4hU/gx75zFrOXFgLjGxxraRQ
	j08+FBYj26FnQi8zPoD3hIE7gPLzZS5OeC/jmDzGDwm3abW/M6ZAwSVmX/1Hg/8IufZfm6vpWeXnb
	JzXdEkETGPvrg6wGylEl6ea3ntW8KLWzyfAkrAyA5Pgp5LioSvyBL5XdiTw5Mx5YwYiElzX8rSRpt
	errXiZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl7BI-00000004EHP-0YxY;
	Sat, 18 Jul 2026 15:42:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl7BF-00000004EGx-3vbq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 15:42:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IDDRIh386325
	for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 15:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3Tozc6XvAyXDRXhNm08ssVPc4HklhucZjeYpfFjPmA=; b=l9F6S0Gnb2vjgD6a
	NBQfReSJBOyCIXwIUgjQE9ha1CjdNnqVi17UErZCTYSlBRo/TxMbCbjqKp2d0Yy8
	2grbSegaeCpYWBsCtdZz1Mn3v8FEv1j5UcVICfCZoIiXa6CDvpkRuAbnTODcJZ/U
	B2BcXlqo9x1yKCfP3m63lMsLAwNF6umECQ3O2BYkakRH9Y3pltrWALui4/z2ZZDB
	Oohi70BkTEVI9LYX4Az4ZXFHWOAsSgFmcQVj/yBR+bc/KWRawPM7IARiYuzeczGl
	2Z7prJm/hdBFhaSSwCdQjPyC6p/fQJ948P1wqkX9Tl6bHTlDilZ5bfpKV/jZ9sV8
	GzU+Jw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhh12v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 15:42:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso5240997a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 08:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784389339; x=1784994139; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B3Tozc6XvAyXDRXhNm08ssVPc4HklhucZjeYpfFjPmA=;
        b=jBhfzSoiMhtYT7umbZ8bydkCHTCGrQu5DR6GaJK4R6yUmylRhxyBUNhj16iaGUuQtB
         AwD2QHD/AnJ3g/16UlGPtvD1loGOt0uDBKDDDCZ/wapNx108TaiolfNlGz+BGNQkVazB
         PqybKlSxj5kPQC/CqhEqVFWMWldAq9tdd2TiiBMwWERUTAFuub4Z4AujFYV6s5qRj1Cv
         l8QOera3+UaQixsC71BSVFr7R794SOGBpvwjQngyrkrrR5FGZrjGsH1+6JR1uRutbzJz
         /N0agLhiGozON43dsNoL5R2Odh8VuZ+Kg3p6dPDTZjx1dQF8M0BYssnX1TJxtF+5NLcV
         JCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784389339; x=1784994139;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3Tozc6XvAyXDRXhNm08ssVPc4HklhucZjeYpfFjPmA=;
        b=NdHw056gm7IUJVrU88q8CRkGz5/AxJjVBCoy8IlkiwIQp+qH7ERvpomdGSz7V81GkY
         7I62qO1GLI8cezFhrQMea4gDs7Ycnsl3YMROIXLC5yTvTKWXmc38rjs31f5DsuC6DFGL
         5PWfOiUd7t2wEP5Jw9IGd159YA8t80c0hNPCNeTUOeQ+gyPYucVGDizR4bYQRp+fJfzP
         D9XO0Me2iysUBPc9dXjIbDKqXfKHbR0SvsgAqRpAD5uV+fjhNCe4Sw54yFD4tOV4TlgV
         w41b5Vnx8ZbSoZzClrUyEEv086DzekWjHSvStgFkoR2siOTJmgZPSDwgfSJF+S7q6sYm
         fBHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7YFU/UCsBivte1IsvziOZ97waCv45+3d9yn1LIWUu4zS54YZgMEoe3kAYhvB2f2OS+pe18gyJdkhkWsQR+ERi@lists.infradead.org
X-Gm-Message-State: AOJu0YzrkL7Y61/48kc9dO+UdhGtNNfMDt+XKffcoPxpJ29JC/RzXBcS
	Wa3ZVJyfxR/hex5yt87lczAj/9Q6NJ6ExcqPorJc02n991WdWwolm+p2LNtMWJ1fEIJzQuE6PAp
	5F6gSnrCWol/vsIMWHZQc/f9RfdF1lty2R4abQAya+ESRLMeKA8Q10HYZNvHXFswpBjIhEieiGE
	dnmQ==
X-Gm-Gg: AfdE7cn0nEQgfmslDTyeasAeJJvl0TEfuBDpzH5g1Wphp9B3yloOQDhB2vlFCDLBcvO
	H6/HTcy/DrlX2ILDuhTl8YrsyI6wMg23yP8P68NQhTfh6SJ66kLZy+1IQVb4jGW0IN7KiRakiL/
	K0swVkuhFNz5NGEOWpVd9Yx7W6CBBIkgei21crVF3+RgN6iXRCkGHh22U9IobKt4kefQ2DcBZAI
	iaMF52YLwC/0pRpyjGfY6zslf1w6KmlK/ekItP2QupTHT0pJOTus4EuEyc4O0gl4aDyr7DHTpwB
	RrXGIAxLGwHqHCWflXQMWBeuxqpQp52bIr9mtxB182ypeFpCk3p1f4W5Wtynndvuw/rb3XDGIqp
	JxoQuyA==
X-Received: by 2002:a05:6300:95:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c3ad9717d4mr7925888637.40.1784389339433;
        Sat, 18 Jul 2026 08:42:19 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c3ad9717d4mr7925851637.40.1784389338852;
        Sat, 18 Jul 2026 08:42:18 -0700 (PDT)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm22974922eec.5.2026.07.18.08.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 08:42:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Jul 2026 23:42:10 +0800
Message-Id: <DK1T85P7OAAY.RXCY4AX71VRX@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 5/8] drm/gm12u320: replace struct
 drm_simple_display_pipe with regular atomic helpers
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
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com> <20260716-drm-simple-kms-removal-v2-5-1133a8fc3785@oss.qualcomm.com> <26981ae1-4aef-4965-8600-f5e30a1b564a@suse.de>
In-Reply-To: <26981ae1-4aef-4965-8600-f5e30a1b564a@suse.de>
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5b9edc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZBS7nKAnUslcPLfxFb0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 1AnnfQvnxZvlxv-I_oaC_IQaLMh8NJtu
X-Proofpoint-ORIG-GUID: 1AnnfQvnxZvlxv-I_oaC_IQaLMh8NJtu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDE2MyBTYWx0ZWRfX+3IhA8IUf/x8
 GdK8dmA10GfUQvqWQ9bfybe/cX8JtXS2paEG/CJ82/Pf21ZkPMTAnQwjH4IIHK1N89IY2fcSVm7
 TtN1Av37ypJuUoPIWRLZ7Vn/cirwm1xWc2rv4Y8zPxacMPhN0GdU0ck/A91jTtgLW3GCKQCgXwx
 akBozwQRBgGUZNxb6YD/xeftBjHRgMrlQBF2DTRbjN+nJyYmEBTjsVnqOHbsD3gyxG/Na+B68w6
 rlR5DiPZYSpXnROR3D/1VhkbrJAO4MOwvacIIr8HA5aWwnyurbO+wsV6kBU5c5e/eP5ALGjDAzO
 E0f4i3tmdbM2GEeWFNTl/Qd+h3cB/YwPvqWLmpO1IO2X+b1cArx5XYK/VEGEg7ZEsfsEIu+H5QM
 m7PbDiCvyDIK8jeKL6iAkyOSQXNXa4UfMWtcR2pD0Xydt8FYQWAf5UWdTfbpBPfe4XJdwFikZiS
 WPH3U2+76DcUw4tbaNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDE2MyBTYWx0ZWRfX9qORJttGgzyj
 zrD/kQ2di8wlEQReBOxDAHzg9NdEDQBkuyntUdS2wjcaXMr4ee1shZ5KS+KtZ2nxKzivDin3e0h
 BLXJJ0tfZTUp/qq0qS1WJCo1WrLtQkM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_084222_004808_14D53A28 
X-CRM114-Status: GOOD (  23.41  )
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

On Fri Jul 17, 2026 at 3:18 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 16.07.26 um 11:01 schrieb Ze Huang:
>> Convert gm12u320 to direct primary plane, CRTC and encoder setup.
>>
>> Keep shadow-plane helper state, framebuffer access helpers and
>> no-scaling plane-state check from simple-KMS path.
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/tiny/gm12u320.c | 132 ++++++++++++++++++++++++++++++++=
--------
>>   1 file changed, 107 insertions(+), 25 deletions(-)
>>
> [...]
>>  =20
>> -static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
>> -				 struct drm_crtc_state *crtc_state,
>> -				 struct drm_plane_state *plane_state)
>> +static void gm12u320_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					       struct drm_atomic_commit *commit)
>>   {
>>   	struct drm_rect rect =3D { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT=
 };
>> -	struct gm12u320_device *gm12u320 =3D to_gm12u320(pipe->crtc.dev);
>> +	struct gm12u320_device *gm12u320 =3D to_gm12u320(crtc->dev);
>> +	struct drm_plane_state *plane_state =3D gm12u320->plane.state;
>
> Did you see the reply from the Sashiko bot?
>
> What happens is that user space can apply multiple atomic commits in a=20
> row, but they are applied to hardware asynchronously. So if you take the=
=20
> plane state here directly from the plane, it could have been replaced by=
=20
> a later atomic commit already.=C2=A0 Rather get the correct plane state w=
ith=20
> the helper drm_atomic_get_new_plane_state().
>

I think I misunderstood this point. I had assumed that
drm_atomic_get_*_state() was only needed for the state object directly
matching the helper callback, for example crtc_state in
*_crtc_helper_atomic_enable() and plane_state in
*_plane_helper_atomic_update(), while other state could be accessed via
the device-private structure.

From your explanation, I see that this is wrong. In the atomic commit
path, any state associated with the current commit should be obtained
through drm_atomic_get_*_state(), because the object=E2=80=99s ->state may
already refer to a later commit.

> I did not look at all of the series' patches for this problem, but the ru=
le
> applies to all of the mode-setting code.
>
> Best regards
> Thomas

This affects other patches in the series as well, and some drivers may
need additional fixes in internal helpers too, e.g. arc_pgu_set_pxl_fmt()
in arcpgu.c [1].

I will audit the full series and fix such cases in the next version.

Best regards
Ze

