Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A36C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 21:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KggEA/YDHTi+B94iHR0d5HwR3sGfFH/eH/dYBbqHvU0=; b=zJOpZFne+nBpuhYTtabwtHN1xB
	S0mpq7rTHqf+ytaQwfmld7odd1rQZ+cqOVkPqLIURd873BQPUI0rpW/Bv+ovDcaSmAOg80aI7WKOj
	M8wfDOFsjZ8O3fhbTNwWSH7cfaRd8Qp6DtlqBkBTBKQOcvazr0dYzInIm6Bu5rGX4emVDdPBMjXFC
	fGRZFB7mQts5bhW2+H6xNCIyC5dqBStotRMd30MMDFwVA/a9HaB8/t1gRYcd+aM/M7VVSFAg7qPSd
	gmkschYy13aicwNyhkZRZ/Chpta9giHR3OIEHVoZayVpcazM3U8GiPBZCE7W3x7/paFycnqi0YM1H
	3ryTR2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKsD-0000000FrbA-052G;
	Fri, 11 Jul 2025 21:01:37 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJti-0000000FkIH-0qRm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 19:59:07 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7e0bb4a2c04so7580585a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 12:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1752263945; x=1752868745; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KggEA/YDHTi+B94iHR0d5HwR3sGfFH/eH/dYBbqHvU0=;
        b=XDexn7tuGvqlAgJTbrUCpyDiUO8J+SWDhdr+Q7yDXWb6iiIIH7Kc/cXvnuhdSUSaFX
         AYDOzzJjO0WvRxX3S13rN8Sq4tvqinmW7kjTsAdZgrvPQa08tRsxLaRkMcFemMp78Xm2
         2s1tNmuwVni24Uo7xc8eJPQFd8C7jAe7RogQZw8EfUIzG0u6+bPhSAVK81tDiv+M++Ui
         GXm4kAa+mkE68zV+E9XlS2gDQYDGyp3aaLXLp0sSXKuiP2/wJUsWJ1rCWdz1GetKSiMS
         2bQR8+Eq7HbQOTJDayO4wqZMgEh7ctjTERKCwqq1LZDIdTLvDZhNJO5klVfKfee/0klo
         agdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263945; x=1752868745;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KggEA/YDHTi+B94iHR0d5HwR3sGfFH/eH/dYBbqHvU0=;
        b=t1kI2FDT8LSwvTqsccn2BhaH+JhNJBCMHvTiRFykdb2B6umjAZzj/7/cGs1LhZXCUW
         Ctr9RBSSy8gL5SgBUGCQH9yXRZ8lX4PNIOyqeAh27ySYesENuM4LSasXqawF+rz+WFgn
         g3t7SyRzxcqfMgaMEGRK1lAIfdqzWKFplar6J9P0Uu7n31wTGbhrEUhYTWxLeCEsgzz0
         sUvDkHbjHxr3FrBsJEy/2u4kDg+mnzFywAn67iOOp2Vfm3EOlB3wBlPqt2zcyWQh53ac
         RBgUpLmHEVFslfn1oHY1cehRVE9E/hBfT+Z9uNFOhwimc32Gp4VIAdmj46vCPFMYSUW+
         IGFA==
X-Forwarded-Encrypted: i=1; AJvYcCXToAlBBtgHjebyGoAZR0mz0Ke9xx+KYtLJ5WspxRIbDxuiliM0QB5EAI/GvQakL3zbYHOyRf3mOT53QH5C9LZL@lists.infradead.org
X-Gm-Message-State: AOJu0YzpT0xAd3KCIiCKyj4IBy/IujTADihPcxrUriluqukPoTSfrqfV
	ucpJf7ozWlfpshBxWffHbCY51kl+7bTKkqkYjhReghYH/SgMwqNAHaqybpplgmqL4Pw=
X-Gm-Gg: ASbGncvBKKw/zwf/KG3vP+qOYIl0hS3HnNiPKkWnebz3BDt287nSBkHeDKGKIJ9HFgo
	hZI+RHi/CRjfwEuRjQbxJfhANXbc4GTGzMbztLxw7t5nzSOFeMdEmNRrdIBompChNfJJzdeYb5/
	LZgTI5+TxxiZ3nEcLHO4KWUIanMRevtBswI1MXWJXSth8INpSb8T2fhDwSOxw1EkbvRFIRGBlDX
	bgiihmq2BdRFqwRwczvoGKa5qBBlcuNR+U1deTdd/KFInYF8cUwO/HGXB8z8NSR5WeVGbeI71X4
	a81w2CAKilZwpbDqvdHCmsV2t9EN7oGosyzGL2STGO9q4+pPOUL9TXw/Ww81rwU5/juO3MIwitq
	64k1yzfbeY7N1jarUa5/AavEBoRc=
X-Google-Smtp-Source: AGHT+IEMN28GIL2fj0mSdcwNMNRsi58DvX91WQKhdFH3bBY+HPq8y10Ik8GGOtDgnbxn+L/FmEEnxg==
X-Received: by 2002:a05:620a:6590:b0:7e0:892b:e447 with SMTP id af79cd13be357-7e0892bec92mr129076085a.22.1752263944593;
        Fri, 11 Jul 2025 12:59:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde80650asm252765185a.90.2025.07.11.12.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:59:03 -0700 (PDT)
Message-ID: <9f4a00b3a0b6491b1f50c878cb18569009a4441e.camel@ndufresne.ca>
Subject: Re: [PATCH 5/8] media: uapi: HEVC: Add v4l2_ctrl_hevc_ext_sps_rps
 control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel	 <sebastian.reichel@collabora.com>, Cristian Ciocaltea	
 <cristian.ciocaltea@collabora.com>, Alexey Charkov <alchark@gmail.com>, 
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu
 <liujianfeng1994@gmail.com>, Nicolas Frattaroli	
 <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>,
  Andy Yan <andy.yan@rock-chips.com>, Frank Wang
 <frank.wang@rock-chips.com>, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rockchip@lists.infradead.org,
 Ezequiel Garcia	 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda
 <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>,  Yunke Cao
 <yunkec@google.com>, linux-media@vger.kernel.org, kernel@collabora.com
Date: Fri, 11 Jul 2025 15:59:01 -0400
In-Reply-To: <20250623160722.55938-6-detlev.casanova@collabora.com>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
	 <20250623160722.55938-6-detlev.casanova@collabora.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-QFZNUyCQD9CH6UQ+5gcH"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_125906_352158_F435CF57 
X-CRM114-Status: GOOD (  20.43  )
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


--=-QFZNUyCQD9CH6UQ+5gcH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 23 juin 2025 =C3=A0 12:07 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> Some hardware (e.g.: Rockchip's rk3588 hevc decoder) need the parsed
> long and short term reference information for HEVC decoding.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0.../media/v4l/ext-ctrls-codec-stateless.rst=C2=A0=C2=A0 | 73 ++++++=
+++++++++++++
> =C2=A0.../media/v4l/vidioc-queryctrl.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++
> =C2=A02 files changed, 79 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-statel=
ess.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.r=
st
> index 0da635691fdcb..745f38a8fe69c 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -2958,6 +2958,79 @@ This structure contains all loop filter related pa=
rameters. See sections
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x00000004
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
> =C2=A0
> +.. c:type:: v4l2_ctrl_hevc_ext_sps_rps
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_rps
> +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> +=C2=A0=C2=A0=C2=A0 :widths:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 2


Something, somewhere should say this is an array.

> +
> +=C2=A0=C2=A0=C2=A0 * - __u16
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``lt_ref_pic_poc_lsb_sps``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Long term reference picture order count=
 as described in section 7.4.3.2.1
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "General sequence parameter s=
et RBSP semantics" of the specification.

Each LONG term reference have one of these.

> +=C2=A0=C2=A0=C2=A0 * - __u8
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``delta_idx_minus1``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies the delta compare to the inde=
x. See details in section 7.4.8 "Short-term
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reference picture set semanti=
cs" of the specification.


And each SHORT term have one of these. How can both be int he same control =
? For
me this could make a bit more sense with two structures:

	v4l2_ctrl_hevc_ext_sps_st_rps[]
	v4l2_ctrl_hevc_ext_sps_lt_rps[]

Did I miss something ?

> +=C2=A0=C2=A0=C2=A0 * - __u8
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``delta_rps_sign``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Sign of the delta as specified in secti=
on 7.4.8 "Short-term reference picture set
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 semantics" of the specificati=
on.
> +=C2=A0=C2=A0=C2=A0 * - __u16
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``abs_delta_rps_minus1``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Absolute delta RPS as specified in sect=
ion 7.4.8 "Short-term reference picture set
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 semantics" of the specificati=
on.
> +=C2=A0=C2=A0=C2=A0 * - __u8
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``num_negative_pics``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Number of short-term RPS entries that h=
ave picture order count values less than the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 picture order count value of =
the current picture.
> +=C2=A0=C2=A0=C2=A0 * - __u8
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``num_positive_pics``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Number of short-term RPS entries that h=
ave picture order count values greater than the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 picture order count value of =
the current picture.
> +=C2=A0=C2=A0=C2=A0 * - __u8
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``used_by_curr_pic_s0[16]``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies if short-term RPS i (that has=
 a negative POC) is used by the current picture.

Use bit field for that, a __u16 works, and one per ST.

>=20
> +=C2=A0=C2=A0=C2=A0 * - __u8
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``used_by_curr_pic_s1[16]``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies if short-term RPS i (that has=
 a positive POC) is used by the current picture.
>=20

Same.

> +=C2=A0=C2=A0=C2=A0 * - __s32
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``delta_poc_s0[16]``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies the negative picture order co=
unt delta for the i-th entry in the short-term RPS.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 See details in section 7.4.8 =
"Short-term reference picture set semantics" of the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specification.

Keep it delta_poc_s0_minus1 like int he spec, and then you can go back so u=
16.

> +=C2=A0=C2=A0=C2=A0 * - __s32
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``delta_poc_s1[16]``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies the positive picture order co=
unt delta for the i-th entry in the short-term RPS.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 See details in section 7.4.8 =
"Short-term reference picture set semantics" of the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specification.

Same.


regards,
Nicolas

> +=C2=A0=C2=A0=C2=A0 * - __u8
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``flags``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - See :ref:`Extended RPS Flags <hevc_ext_=
sps_rps_flags>`
> +
> +.. _hevc_ext_sps_rps_flags:
> +
> +``Extended SPS RPS Flags``
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> +=C2=A0=C2=A0=C2=A0 :widths:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 2
> +
> +=C2=A0=C2=A0=C2=A0 * - ``V4L2_HEVC_EXT_SPS_RPS_FLAG_USED_LT``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x00000001
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies if the long-term reference pi=
cture is used 7.4.3.2.1 "General sequence parameter
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set RBSP semantics" of the sp=
ecification.
> +=C2=A0=C2=A0=C2=A0 * - ``V4L2_HEVC_EXT_SPS_RPS_FLAG_INTER_REF_PIC_SET_PR=
ED``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x00000002
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies if the short-term RPS is pred=
icted from another short term RPS. See details in
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 section 7.4.8 "Short-term ref=
erence picture set semantics" of the specification.
> +
> =C2=A0.. _v4l2-codec-stateless-av1:
> =C2=A0
> =C2=A0``V4L2_CID_STATELESS_AV1_SEQUENCE (struct)``
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b=
/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 3549417c7febb..dc7caf4bf6208 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -523,6 +523,12 @@ See also the examples in :ref:`control`.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - A struct :c:type:`v4l2_ctrl_hevc_d=
ecode_params`, containing HEVC
> =C2=A0	decoding parameters for stateless video decoders.
> +=C2=A0=C2=A0=C2=A0 * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_RPS``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - A struct :c:type:`v4l2_ctrl_hevc_ext_sp=
s_rps`, containing HEVC
> +	extended RPS for stateless video decoders.
> =C2=A0=C2=A0=C2=A0=C2=A0 * - ``V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR``
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a

--=-QFZNUyCQD9CH6UQ+5gcH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaHFtBQAKCRDZQZRRKWBy
9ISzAPidxCwdhetQDnozQ9rkv6zHmwuNG2/63/iuwoWBzkyQAQD7SLIPvi5xterW
wf+MjUZIrzLCUQ4C8voHcQLpGbHPCA==
=sK20
-----END PGP SIGNATURE-----

--=-QFZNUyCQD9CH6UQ+5gcH--

