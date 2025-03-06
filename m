Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC871C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeRfzX4J4SSpOIDf0qW1PY6Ceutjf1oaVySsSvMl5vc=; b=GQb6QcR7eNBYJb8NJt6e4mZwZb
	fbUoBucnkTaAmd9lEOMtoue8Tu/I907lxIHQvma/j+BBZWnPI00zptijAX04lQ0FDdM4aJuXhzwoD
	X5pnngTk8bZXT+xzCb+RNQOiGCW6u3feu6B5D72SvgZNNtZrjPexrhRqzBdg9odfP+LMxcJ+BFGoJ
	UPwNy5Jgb/EPn8Fbt83G3NRwrFnZZQnL2GhNeNd+OV5DE1L8elQrfVJHONEpstQcVd1bDSMI9S3+/
	L8Cl+FTOcv8BVR6S04DA4gBO/7BdfM3izc+sLrqf/Z9BAS0ukES72TpQKyq3koR2/Tu8d+X6h7iJE
	diaILFKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAJV-0000000Auy7-2jlE;
	Thu, 06 Mar 2025 12:26:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9hf-0000000Apvr-3CxO;
	Thu, 06 Mar 2025 11:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description;
	bh=FeRfzX4J4SSpOIDf0qW1PY6Ceutjf1oaVySsSvMl5vc=; b=lgeEcpXjBZKuU5BBNCWQvBwC2v
	hkAsB35hmlC7mJqFAimgNOXrUUaPrRzDMokx4NqIKcReWHffw720WnDIWxt0RPVrbh1bz/HEYVfJu
	zDMOG9XeRR0RETlspWAQfRt1VUrDUIi54q/sd3FwgNLF4ggO80i7j9aKoosIgOoBMw12T0ShcDiQx
	/9ApeQ9Bl+wLWOwWVn6tlA0LuK3zCzYNSxiK/Oj3J2VDicNNfRShFFK04D5CpjMX0NSGiMLl9pXlN
	PU1Pty78CuO01ecNY0YzJyz+yn/sPfmlmormtk1Nf+vRmF/JgT18tknfq/rEhJQZUAoDVlcEnnKrh
	vKoRKbnA==;
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9hc-000000013QY-239G;
	Thu, 06 Mar 2025 11:47:50 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so754611a12.2;
        Thu, 06 Mar 2025 03:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741261666; x=1741866466; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeRfzX4J4SSpOIDf0qW1PY6Ceutjf1oaVySsSvMl5vc=;
        b=GAUBGp+s4vp+GUbE56CFUcNcYLWfYcOwpDobCoEpgRrzRxNYlROs+jyBQxIsvTZFKU
         cEvND3c2JnE0yudcjOaXsRH/5KFHQLgmPywKFn1KRdK8Dq6HgQgj467KoUxlUXeVKE8O
         dskcBzdNvEuLKsrNfnnS90SpzwOE8g4tmk8vIODofwSYs68DfbFwg1moGTWDcmmx6nuJ
         jyag39czewROLEtnJPmkRzWUieZOE9vzH/094/2n6ge/gRW+jKS9QyTJd4tOd2EoAZ6a
         oSvY6vsch09oqTA82uPhBM5Nlay2wvhLOMPb4doAQSdpPwM1yyaanANwXuxCN2X8lj96
         a6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741261666; x=1741866466;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeRfzX4J4SSpOIDf0qW1PY6Ceutjf1oaVySsSvMl5vc=;
        b=K7R+l2RBfYY403gMzleDjb76lkK90p7sIR1TKuHRC9KqNWeJnR3fo348UEpsfV7yKE
         833BQsxZfjLdUa7f8dSH3DgsVL+4QNZX58vIj71ok3RCOVMlAbh6YYvoP+evKVIHL3Is
         hifzTle+a4EsFDTljiTEudQcUVVa6NzL43tA5D25AerP6nWCnlYotyOGngub69FhKtXt
         iznO1z4UmJxFk48mj98qVYRywWUCoyKqxw1pJVA01+z9OnywoA9pYH1MqSToy6BJMZ5z
         9UUoNDLtkAFz30gD1GaoJ/ylCf90nuao9+tRGC6j/Bzpx+T+ACSMPLoTKjm3gMyTeNRm
         TgrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi5BIlOqcu9WwBaSDI9xBdMmTUqW1pwB3RqSfdBiniF957p+bdwnC3S9krCqLv67gVwu9YpnXMlmdO9D9zobo=@lists.infradead.org, AJvYcCXyiQxkONXwwxj/WyWdPSCrL24OXs8o2QbFXyX+oDZkYH+QHf5TPcnMnJ7HaHW4wTSM0OkjmOs97VTkpK130Es/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9CdYFk3/T2IC7dT47qzvrUlE+EEW3Qy39RTZv1gCpNpqirQ+c
	ayMw76+3dXx9V+AYrGxRb4vtyarxaBqdJgThlDZ+GM8s8sqR8r/p
X-Gm-Gg: ASbGncstyB6iT9QrYzIfEWiQ1zKTkuYqqdvpyWM33C38mWqOyU66iFtCW8/h9fkPxli
	ixd5vfHnTCL+b1d7Wx7mePHNbp6m8vpDnDuMqdbv8RL6simLg2AH07Nxa16GJQpDD1XN4KjqUG5
	8tn/i3Z8+JFeJIdlaGoT+Rvf3P4MHuH4bT+UIKJLuLsMe40wEzApimFrFlcuSDGTYca4N3k+y9k
	kXrAIGqifUc3XNvLfub8jfck62Dq87oTRlLi5FL3W8cKUnY5hFV6sWDEV67O1tDfU5yhWnYrMOr
	6uL5UlEHdjrnBY+yh5brf81DXsOFQ3tRBqsaOMoeausG8qpLwhXr+YXcMtbYfchcDzVfsCkVYqh
	teDc9Ke5yIdAlzMWwFa5kRjpg8g==
X-Google-Smtp-Source: AGHT+IGmWH/iGLqzVwuFP7RJWXn1M1/VMzVhYdWXO/tkwNgc0iTeL4UpWXsQLzyXQnZ0n4LlZ1JcXg==
X-Received: by 2002:a17:906:730d:b0:ac2:63b:6a45 with SMTP id a640c23a62f3a-ac20db4ccd0mr725046966b.30.1741261665523;
        Thu, 06 Mar 2025 03:47:45 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23973a8d0sm82006266b.87.2025.03.06.03.47.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Mar 2025 03:47:45 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
X-Priority: 3
In-Reply-To: <74c154b6.8c50.1956aa8c8d2.Coremail.andyshrk@163.com>
Date: Thu, 6 Mar 2025 12:47:31 +0100
Cc: heiko@sntech.de,
 neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com,
 devicetree@vger.kernel.org,
 hjc@rock-chips.com,
 mripard@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org,
 robh@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1573D5D6-AFED-4D92-8112-B0C6BB52D5FF@gmail.com>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
 <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
 <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
 <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
 <74c154b6.8c50.1956aa8c8d2.Coremail.andyshrk@163.com>
To: Andy Yan <andyshrk@163.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_114748_579846_02E58818 
X-CRM114-Status: GOOD (  12.20  )
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


> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andyshrk@163.com> w dniu =
6 mar 2025, o godz. 09:53:
>=20
>=20
> Hi,
>=20
> =E5=9C=A8 2025-03-06 16:42:00=EF=BC=8C"Piotr Oniszczuk" =
<piotr.oniszczuk@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>>=20
>>=20
>>> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andyshrk@163.com> w =
dniu 6 mar 2025, o godz. 01:59:
>>>=20
>>>=20
>>>=20
>>>=20
>>> Both of the two config options should be enabled.
>>> andy@Pro480:~/WorkSpace/linux-next$ rg DW_DP .config
>>> 4044:CONFIG_ROCKCHIP_DW_DP=3Dy
>>=20
>> here i=E2=80=99m a bit lost=E2=80=A6.
>> greping on full kernel sources (with applied =
https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D936784)=
 gives me no single appearance of ROCKCHIP_DW_DP=E2=80=A6
>> Do i miss something?
>=20
> see PATCH 3/6:  =20
>=20
>=20
> diff --git a/drivers/gpu/drm/rockchip/Kconfig =
b/drivers/gpu/drm/rockchip/Kconfig
> index 26c4410b2407..c8638baf9641 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -8,6 +8,7 @@ config DRM_ROCKCHIP
> select DRM_PANEL
> select VIDEOMODE_HELPERS
> select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
> + select DRM_DW_DP if ROCKCHIP_DW_DP
> select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
> select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
> select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
> @@ -58,6 +59,12 @@ config ROCKCHIP_CDN_DP
>  RK3399 based SoC, you should select this
>  option.
>=20
> +config ROCKCHIP_DW_DP
> + bool "Rockchip specific extensions for Synopsys DW DP"
> + help
> +  Choose this option for Synopsys DesignWare Cores DisplayPort
> +  transmit controller support on Rockchip SoC.
>=20
> =
https://lore.kernel.org/linux-rockchip/047EECFC-7E55-44EC-896F-13FE04333E4=
D@gmail.com/T/#m178a325ea0ebc64187aae474d77c3f7a9e0bc93d
>>=20


Ah my bad!
One patch patch was commented - so not all dp code was applied.

Now it is much better:

root@myth-frontend-56b0f018b5e0:~ # dmesg | grep drm
[    9.795380] panthor fb000000.gpu: [drm] clock rate =3D 198000000
[    9.796257] panthor fb000000.gpu: [drm] mali-g610 id 0xa867 major 0x0 =
minor 0x0 status 0x5
[    9.796262] panthor fb000000.gpu: [drm] Features: L2:0x7120306 =
Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
[    9.796265] panthor fb000000.gpu: [drm] shader_present=3D0x50005 =
l2_present=3D0x1 tiler_present=3D0x1
[    9.851869] panthor fb000000.gpu: [drm] Firmware protected mode entry =
not be supported, ignoring
[    9.851921] panthor fb000000.gpu: [drm] Firmware git sha: =
814b47b551159067b67a37c4e9adda458ad9d852
[    9.852127] panthor fb000000.gpu: [drm] CSF FW using interface =
v1.1.0, Features 0x0 Instrumentation features 0x71
[    9.852436] [drm] Initialized panthor 1.3.0 for fb000000.gpu on minor =
0
[   10.003108] rockchip-drm display-subsystem: bound fdd90000.vop (ops =
vop2_component_ops)
[   10.004705] rockchip-drm display-subsystem: bound fde60000.dp (ops =
dw_dp_rockchip_component_ops)
[   10.006085] rockchip-drm display-subsystem: bound fdea0000.hdmi (ops =
dw_hdmi_qp_rockchip_ops)
[   10.006679] [drm] Initialized rockchip 1.0.0 for display-subsystem on =
minor 1
[   10.006737] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes
[   10.007663] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes

Unfortunately still nothing on screen

dri state: =
https://gist.github.com/warpme/5e971dfd2e9fd52fae76641831cebe46

and kernel dmesg https://termbin.com/r0m3

i=E2=80=99m not sure what is missing (some dts enablement or=E2=80=A6.)
 =20







