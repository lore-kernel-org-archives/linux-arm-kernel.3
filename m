Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92582D2502F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 13:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckBPY9BcGf6vo2tq6j7tWFYJrA0tQ0sNu7QHFsHPJ+Y=; b=kyaAC5gf/fNxRKA35mw3ZUgIrr
	aVo/+opm5d+KneFvMi67w84PtIIMo4P5eIYcBxLnmAP2Ta+ZRZYn/I2EJrAFsNnnO9rYSy18IIYn7
	EO0cWHxVTDGjAmNtrYojDZuMmz0BRl5fTrYxk86lI8Q6UpmQwAeBX8lwsTEz2ecqKwDwHFPDOW/kC
	e1yq+z2RZTBoO8wumGVfGt4NQhKEO0RAny8/ZzyB1Nf2HNy8m3LUNjXgatVqjeBNKSZO7vhZ4bkpS
	uJwI07b3DYkZcFQm519MQexB26PQuhWwzZbJ/vSty4HPo1nebzdXa73CZnTvjiHHXcZM8MrFO+SrF
	Qc3doTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vevX1-00000004G04-36IY;
	Sun, 11 Jan 2026 13:30:59 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vevWw-00000004FzJ-2EsH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 13:30:58 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42fbc305882so2929966f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 05:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768138252; x=1768743052; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckBPY9BcGf6vo2tq6j7tWFYJrA0tQ0sNu7QHFsHPJ+Y=;
        b=acPq0GxjkSj1EiTcH7ieC8YE2nSO/eLX6BbSdrCpXOv9s/1yfSFcAOBNfpUTbGURT0
         3a4Nj1OoxkUSH/TrK8HmCVLloknMZs3ADcykIhkc4VO29+YLWSnr8OZcA+WmBf7HhyvG
         VTJ3Nxm+qAWe7tFaoZBMIsaWjpzgkvvv/PFd1OAx6THkGFJd0k4wzsftkQtN3Q389UUF
         pzbma+CLpv/69Khlm3jZ8qUGpyM8rS8tWlspkfHhqPHwO97jFmhEO8Iq6C0AgY1gyvHF
         aE1h/KY4gxnoIw0Hk3xha2/WWNUR2vehGNajH09w+noZOQE8SyuvGLjhsbEWqNcaavf+
         7J7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768138252; x=1768743052;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ckBPY9BcGf6vo2tq6j7tWFYJrA0tQ0sNu7QHFsHPJ+Y=;
        b=OSihXgfBwyFnybyI4e309eE1fTluDjiOwnPwJBZrbjHmLE+FnhkxvYnPSTg7ixOoXE
         GudFS/4arsvPPMt+gMZmIKxid+g29RlJK8hA+5nBiK8W70MLx9YaVep/PqL4JT8FMj5v
         8D3CQuM79F+K80G0QBpYmxJ60ZzGdXx/YyX0vWSAH12TXmPb7az13+A5+kPr3r8uzHcI
         kuRazChHIVYO04s6dTcV6LKSNJHSSmNp0j3C767DAfC7X+GqX+sb9eMFbHKIIo4Qnq/x
         IB5DhJpQcqIiydv8MDDARb7CugN7Kou818ePararu4DizHhWJhzc8CPGbvrj3KWgTD88
         lZDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXpuZRNqxkBKT+k6UmRWPXuIsXC+0mAVflR7LW6SPOYcXhUgLs0RVEoqSD0AJplcEK/Xj+wrbM52XLY2fRebPf@lists.infradead.org
X-Gm-Message-State: AOJu0YzIDLmEZ7JFnMf1p1gNrGxx0i/UX8KUyrdsetp6AfVZPFSMufZk
	KFSPy8Uie/xj7yr73XWT4AziFZVxljO+8l5EB8GmOLeajYkvPQYiO8xd
X-Gm-Gg: AY/fxX4vr23U4RB+1k6wBIHJt1E1/kfoCXHxb//as6w+H2FvETzjLpz4/5v6Zorv2Vb
	IiIZh7jY25pvuo2cGR1Hc0a7Ag3yfV405hvakmkIhsTJQN7S/cZ/J+IbRCFlojHa5DUAA4UAQTP
	f+bRB2R7zVsr5iXmVYo0MrpU87Dk+tPIq2CZDXAeKtF/BOD0S8Pz+loyrF7Ht3jlQvhdmAAyD9f
	lJuKofk1KO+Mi+BkD7Yzq82I+Cj6h73CtNjJxEdks8Qxz479SefDzB2TfipPiI+erMsj8+P6/oo
	7cj+vH1yU4YN9IixY2JBEc3mrtGv7M18ImhKaoqs4aH/3xwEBP6cj3IGH7P4ebQn1Xo//2SdzPb
	LUA3L2xMUHqsFwteGRgsdMA+/Fr3nv52+fQN4jGgZajs7lAEzjS7yXj969pD/htptRS/6Z/+6Av
	YLTlEF+m1enjXxpRMzS6TEvqgiyq7th6tho82gSZvnR//c8CpkcdPMfHg8A9/Y6R8P4Mu2l6luO
	jxXYu84BQ==
X-Google-Smtp-Source: AGHT+IFe9wWxjVQpeDITMzmRPx8fkixrUGFpGMFziE84e6O7knxtRUc2L2nWcJa5eYoiJK5xomAUhw==
X-Received: by 2002:a05:6000:401e:b0:431:488:b9b4 with SMTP id ffacd0b85a97d-432c36328d0mr15749317f8f.17.1768138251654;
        Sun, 11 Jan 2026 05:30:51 -0800 (PST)
Received: from smtpclient.apple (static.253.36.98.91.clients.your-server.de. [91.98.36.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5feaf8sm33320121f8f.39.2026.01.11.05.30.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Jan 2026 05:30:51 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.3\))
Subject: Re: [PATCH v3 2/3] media: rkvdec: Add support for the VDPU346 variant
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <DFL5TY0QQNMN.1RS04UM9D1V8S@cknow-tech.com>
Date: Sun, 11 Jan 2026 17:30:35 +0400
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 =?utf-8?Q?Olivier_Cr=C3=AAte?= <olivier.crete@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dragan Simic <dsimic@manjaro.org>,
 Chukun Pan <amadeus@jmu.edu.cn>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Dang Huynh <dang.huynh@mainlining.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E21F5FD9-AEBA-490F-A9DF-8E9BEF161763@gmail.com>
References: <20260110053727.2295260-1-christianshewitt@gmail.com>
 <20260110053727.2295260-3-christianshewitt@gmail.com>
 <DFL5TY0QQNMN.1RS04UM9D1V8S@cknow-tech.com>
To: Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: Apple Mail (2.3826.700.81.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_053054_616047_5D1F7EB8 
X-CRM114-Status: GOOD (  20.01  )
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

> On 10 Jan 2026, at 11:35=E2=80=AFpm, Diederik de Haas =
<diederik@cknow-tech.com> wrote:
>=20
> Hi Christian,
>=20
> On Sat Jan 10, 2026 at 6:37 AM CET, Christian Hewitt wrote:
>> VDPU346 is similar to VDPU381 but with a single core and limited
>> to 4K60 media. It is also limited to H264 L5.1 and omits AV1 and
>> AVS2 capabilities. VDPU346 is used with RK3566 and RK3568.
>>=20
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> Tested-by: Dang Huynh <dang.huynh@mainlining.org> # Pinetab2
>> ---
>> .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 =
++++++++++++++++++
>> 1 file changed, 103 insertions(+)
>>=20
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c =
b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> index a5cf6f3240f8..6e49b129d11f 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> @@ -236,6 +236,62 @@ static const struct rkvdec_ctrls =
rkvdec_hevc_ctrls =3D {
>> .num_ctrls =3D ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
>> };
>>=20
>> +static const struct rkvdec_ctrl_desc vdpu346_hevc_ctrl_descs[] =3D {
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_SPS,
>> + .cfg.ops =3D &rkvdec_ctrl_ops,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_PPS,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_MODE,
>> + .cfg.min =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> + .cfg.max =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> + .cfg.def =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_START_CODE,
>> + .cfg.min =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> + .cfg.def =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> + .cfg.max =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
>> + .cfg.min =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>> + .cfg.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>> + .cfg.menu_skip_mask =3D
>> + BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
>> + .cfg.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
>> + .cfg.min =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
>> + .cfg.max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
>> + .cfg.ops =3D &rkvdec_ctrl_ops,
>> + .cfg.dims =3D { 65 },
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
>> + .cfg.ops =3D &rkvdec_ctrl_ops,
>> + .cfg.dims =3D { 65 },
>> + },
>> +};
>> +
>> +static const struct rkvdec_ctrls vdpu346_hevc_ctrls =3D {
>> + .ctrls =3D vdpu346_hevc_ctrl_descs,
>> + .num_ctrls =3D ARRAY_SIZE(vdpu346_hevc_ctrl_descs),
>> +};
>> +
>> static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] =3D {
>> {
>> .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
>> @@ -463,6 +519,41 @@ static const struct rkvdec_coded_fmt_desc =
rk3288_coded_fmts[] =3D {
>> }
>> };
>>=20
>> +static const struct rkvdec_coded_fmt_desc vdpu346_coded_fmts[] =3D {
>> + {
>> + .fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
>> + .frmsize =3D {
>> + .min_width =3D 64,
>> + .max_width =3D 4096,
>> + .step_width =3D 64,
>> + .min_height =3D 64,
>> + .max_height =3D 2304,
>> + .step_height =3D 16,
>> + },
>> + .ctrls =3D &vdpu346_hevc_ctrls,
>> + .ops =3D &rkvdec_vdpu381_hevc_fmt_ops,
>> + .num_decoded_fmts =3D ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
>> + .decoded_fmts =3D rkvdec_hevc_decoded_fmts,
>> + .subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>> + },
>> + {
>> + .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
>> + .frmsize =3D {
>> + .min_width =3D 64,
>> + .max_width =3D  4096,
>> + .step_width =3D 64,
>> + .min_height =3D 64,
>> + .max_height =3D  2304,
>> + .step_height =3D 16,
>> + },
>> + .ctrls =3D &rkvdec_h264_ctrls,
>> + .ops =3D &rkvdec_vdpu381_h264_fmt_ops,
>> + .num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
>> + .decoded_fmts =3D rkvdec_h264_decoded_fmts,
>> + .subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>> + },
>> +};
>> +
>> static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] =3D {
>> {
>> .fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
>> @@ -1657,6 +1748,14 @@ static const struct rkvdec_variant_ops =
vdpu381_variant_ops =3D {
>> .flatten_matrices =3D transpose_and_flatten_matrices,
>> };
>>=20
>> +static const struct rkvdec_variant vdpu346_variant =3D {
>> + .coded_fmts =3D vdpu346_coded_fmts,
>> + .num_coded_fmts =3D ARRAY_SIZE(vdpu346_coded_fmts),
>> + .rcb_sizes =3D vdpu381_rcb_sizes,
>=20
> AFAICT this is not correct, the rcb_sizes are different for vdpu346 vs
> vdpu381. While for vdpu381 the sizes are the same across codecs, they
> vary for vdpu346. And vdpu346 does not have 'STRMD Row', 'Transd Row'
> and 'Transd col'.
>=20
> For RK3588/vdpu381 it is defined in RK3588 TRM V1.0 Part1 in
> paragraph 5.4.4.3 in 'Table 5-13 Row or Col buffer size required' on
> page 381.
>=20
> For RK3568/vdpu346 is is defines in RK3568 TRM V1.1 Part2 in
> paragraph 10.4.8 in 'Table 10-9 Row or Col buffer size required' on =
page
> 474 and 475.

This is what I=E2=80=99m hinting/referring to in the cover-letter. How
to correctly handle the differences in code is currently beyond
my n00b level comprehension of c and coding skills. I=E2=80=99ll need to
ask the audience for some assistance and coaching :)

Christian

>> + .num_rcb_sizes =3D ARRAY_SIZE(vdpu381_rcb_sizes),
>> + .ops =3D &vdpu381_variant_ops,
>> +};
>> +
>> static const struct rkvdec_variant vdpu381_variant =3D {
>> .coded_fmts =3D vdpu381_coded_fmts,
>> .num_coded_fmts =3D ARRAY_SIZE(vdpu381_coded_fmts),
>> @@ -1705,6 +1804,10 @@ static const struct of_device_id =
of_rkvdec_match[] =3D {
>> .compatible =3D "rockchip,rk3399-vdec",
>> .data =3D &rk3399_rkvdec_variant,
>> },
>> + {
>> + .compatible =3D "rockchip,rk3568-vdec",
>> + .data =3D &vdpu346_variant,
>> + },
>> {
>> .compatible =3D "rockchip,rk3588-vdec",
>> .data =3D &vdpu381_variant,



