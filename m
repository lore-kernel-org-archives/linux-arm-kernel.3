Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A628FD006F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvxfwv9YItCl98F/UgZP9Kytwk2UIr78C0lNmMRlKt8=; b=oMjgPmtKiD/iC65Ay3Gyc05Kva
	7TaC/mOKtr1g0kW2Sh8id43Kbv6OnJvTzNxF20nF+nQuKQi+sapySsCVTetCx++vWQ1oZFcv2Fm/Z
	knagYNfFpRo4UG8+XsJgEf2dAOYdfBCLxdy8zGDQ/zPeHKs3+V1ANF8GpbWVF4hQGlReKi7INXhGO
	sh36WvuamYCDiWqXl7wfxuxUH3gp23hRhajGsD2RBZ6b+UJb/f/BSBHsCYApO9+xj9l27KEW11APw
	d/bn3HFAo+VwwINGLHZuRBTHXa+hikYuwE+1uAAAvk4VVzZ/kYaqHBOhFDir84J7OpKtotq/BUbDg
	aYVW9XZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwiGO-0000000Bazz-3icc;
	Sun, 01 Mar 2026 14:59:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwiGL-0000000BazE-3DY3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 14:59:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-483bd7354efso50023925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 06:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772377155; x=1772981955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvxfwv9YItCl98F/UgZP9Kytwk2UIr78C0lNmMRlKt8=;
        b=SMYDVzweZ8T84hxhOzO10+0MbCRTUYp+yjab9xpDV3BlGK8oHoUONgHwC3AoakTlb9
         6yp0neoxE/U3DtYe4S3dPAz7ejg/irMHihC7wTXovLeXK3LP52QioXR17YzIqKjk3dXR
         MLJSiTVjMpCpe57eLRkgdpPUIokG+k18gIGg08ZVnjH3kcpCobjpN8o0W/ZiDxGaQuRD
         Jpm/Tkkn1tbnLN8cJbgyiYl3UWULoFi6jnOEEnTQmyCgi396pnflIxz5yApIHT5jCVpq
         NUzofsxEHA94p3QScZFnocxYVm7zl61KMiUASz9YAKwLNVzl64K2EFAFhD5kogfcpbc6
         tQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772377155; x=1772981955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kvxfwv9YItCl98F/UgZP9Kytwk2UIr78C0lNmMRlKt8=;
        b=IcWH82WrGsNOVOzfv8sbOAQheFlrcrzxdzokd6jT2sJBy6shdeE9bUVuK49PuelB29
         CntMx9htbgeeTTisLkjYy9wiwhSXG5RGmNkDPiTFbAfhjFVrE1Jku+8kaB+iDgSzGR6q
         NVmUiecqjEqMF4IXqUtYU2/1D6RB7+ptbz1aJ3HxsqRKecAN1GO31fP0Wp+ciwdYEQ6v
         BVmh0gHSyY5Wy+OIjxP0Z+n5rQvhtRgN+o41UCk9VzppGm1R12x6zA976f2vPYlzZe6+
         CIb5A1he7q9cPYQZ7WJaAyui8AsCxulVV1G2lWHar6HgAkuuWYvdXv3WurjzTVseHiOT
         cyKg==
X-Forwarded-Encrypted: i=1; AJvYcCUlrfohuffTYPYIV13Dsn7W7SiEThgQrNiR1Hq6obykEVoVbSRnC88Vg2yM02WUM1wjz+Gyv3Q7kwkyguWyefDM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+uj5JID8rR62mIk/UEUR5B6UvCd8Lkp2YthLp4TuDIkLid5ae
	ZHsTgta311tbaQ+SP6nx/bm7wI+vVPHFoaQ4NAOzOTR2rzaiI3TQLpwu
X-Gm-Gg: ATEYQzzphfmqTELi8nnPkl71k6jsOYqt2tDoSNx5sjFlLjOft0qkAOQ2EqrsCB05u/g
	GNq3DK7Omtxn1onVYuDaBViCsOz83akn8Mm1gHOiYd58uEG+qszmar8hLIzLJxQx+ufmjIKsUR/
	+6WiclFkFKN5ZNn3ZlJO+YzZYqSliCDFLewRRFdIEfF5Tc7sw8KmV5EQN5/mgUUXVyYD2z1BJ4b
	7fHdkUhEsMQNodKdjzEIQjBA/OFeCJog1RBlrB0Rlzcvy9oQcCxRBB0M+11MMGYMFVQs/kF5S7v
	+Pmqd9wK3QnOymT3x+0iK2/8u/JcDSk17SB6CAW+RWUvz9NiUWuyQYx4PruJZVsDQ8HeJDb76J8
	jO7RnmZTjX9Vnb3f37YRpI3ieuShVNFOgglbV31SihmmoeWfGCy7ZUvLgScjwWm/rF/zrPRo5uM
	HBqhsnmpZqo8RGz5mjsWD3
X-Received: by 2002:a05:600c:4e09:b0:483:a21:7744 with SMTP id 5b1f17b1804b1-483c9bc574cmr150778635e9.26.1772377155124;
        Sun, 01 Mar 2026 06:59:15 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7031f3sm309080845e9.6.2026.03.01.06.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 06:59:14 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: sashal@kernel.org
Cc: devicetree@vger.kernel.org,
	dsimic@manjaro.org,
	heiko@sntech.de,
	jerrysteve1101@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	pbrobinson@gmail.com,
	stable@vger.kernel.org
Subject: Re: FAILED: Patch "arm64: dts: rockchip: Do not enable hdmi_sound node on Pinebook Pro" failed to apply to 5.10-stable tree
Date: Sun,  1 Mar 2026 22:59:05 +0800
Message-ID: <20260301145905.41164-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260301020101.1728010-1-sashal@kernel.org>
References: <20260301020101.1728010-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_065917_809017_49A50C40 
X-CRM114-Status: GOOD (  24.38  )
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

> The patch below does not apply to the 5.10-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
I have manually tested the commit b18247f9dab73 ("arm64: dts: rockchip: 
Do not enable hdmi_sound node on Pinebook Pro") and found that executing
`git cherry-pick b18247f9dab73` applies successfully on the linux-stable 
branches 5.10.251, 5.15.201, 6.1.164, 6.6.127, and 6.12.74. 

Could there be other reasons that cause the patch to fail to apply?

Best regards,
Jun Yan
> 
> Thanks,
> Sasha
> 
> ------------------ original commit in Linus's tree ------------------
> 
> >From b18247f9dab735c9c2d63823d28edc9011e7a1ad Mon Sep 17 00:00:00 2001
> From: Jun Yan <jerrysteve1101@gmail.com>
> Date: Fri, 16 Jan 2026 23:12:53 +0800
> Subject: [PATCH] arm64: dts: rockchip: Do not enable hdmi_sound node on
>  Pinebook Pro
> 
> Remove the redundant enabling of the hdmi_sound node in the Pinebook Pro
> board dts file, because the HDMI output is unused on this device. [1][2]
> 
> This change also eliminates the following kernel log warning, which is
> caused by the unenabled dependent node of hdmi_sound that ultimately
> results in the node's probe failure:
> 
>   platform hdmi-sound: deferred probe pending: asoc-simple-card: parse error
> 
> [1] https://files.pine64.org/doc/PinebookPro/pinebookpro_v2.1_mainboard_schematic.pdf
> [2] https://files.pine64.org/doc/PinebookPro/pinebookpro_schematic_v21a_20220419.pdf
> 
> Cc: stable@vger.kernel.org
> Fixes: 5a65505a69884 ("arm64: dts: rockchip: Add initial support for Pinebook Pro")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> Reviewed-by: Peter Robinson <pbrobinson@gmail.com>
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> Link: https://patch.msgid.link/20260116151253.9223-1-jerrysteve1101@gmail.com
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> index eaaca08a76018..a6ac89567bafe 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> @@ -421,10 +421,6 @@ &gpu {
>  	status = "okay";
>  };
>  
> -&hdmi_sound {
> -	status = "okay";
> -};
> -
>  &i2c0 {
>  	clock-frequency = <400000>;
>  	i2c-scl-falling-time-ns = <4>;
> -- 
> 2.51.0





_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip


