Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A50D6DDD7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 05:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FCEL5cvn/DmJs+eCH4aavMuPmImiCDAr4Q8vsptoYs=; b=1HK3nJT2ZI0lvLUAVGmCtoJ1jC
	gQG+aRIHNURQPhMav7d31ihRPRj1XXvdPGTtI9xKyuDBSIcnxPvGMcqS+/N/SytWgkvZOi4gKqGqw
	IZcRPUeNwVfkRccrmImz2z78O4wEEaq0hRdSiM7CK1jQmwNieFjtGQuRkUcaLImOOP9rN07B4O2cf
	w8P8Ji0lhGLVxueVb8MfL3efIB3pPEwm4vG5R2hQ634wnSoaaVktlsejnW0lNnPTglL3SS9Gls2Wx
	mGPb1t9F0pT/m7ny67j7HyydL2EmEGWT4hZu/dzyhApnb0cZMv8OUfgXHWykr1boLh3QQCI9ZY4Pb
	0XwOWgBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBpMF-00000001jFR-33jf;
	Fri, 15 Nov 2024 05:59:03 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBpLL-00000001j4V-0ODP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 05:58:08 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-295e9f795dbso106883fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 21:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731650286; x=1732255086; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FCEL5cvn/DmJs+eCH4aavMuPmImiCDAr4Q8vsptoYs=;
        b=g5zxSRCdQIyGNmw1V7/bcpA50+out18XP7C/b8944WwyNJH2tRbQ+L4r5zgIVAw4br
         OCsle4eQXj28g+4Ai77Wur2jLng0CvIkFBueD97mPXUKF/14vz2bgLv2gUOxDsolaLwc
         9pXVftrE/E9StPTdg1tjN/sGB7VpYJenTKGJKr/tjyyS3Nb/oZfNlzfuyqwpnkEoGwu5
         EMpVTxnTCJun3ThuXAFDRw8UHAO+TvCDAHHTlCKg6cg3QfqO2cAIJyfNPQ750nlgV/lQ
         F4T5PCagpjLOG/qtnyQaZv8cvb4uZGEVGe4G+Q4osY8iVwr2waKTJ60sy4MRChU40mlq
         om0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731650286; x=1732255086;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FCEL5cvn/DmJs+eCH4aavMuPmImiCDAr4Q8vsptoYs=;
        b=feVXFJ0mndliPmqKZLGDVFbTPMI0TBcNDd/D0M3cqnO4/wBYWwQc0/B02ejWrZHHfh
         G/BWjNlm2tIfdDvpLymlWoINi13GsZpSGKKPGnem5N+kC7PviVvphkoiNXZJsZHfnsnL
         GJhCPqFF0z9HJwMNMmU3EZOc9o5+w2CRy7AF+Im9btqciPLbhSLq4GSTc9xA7uCpflnD
         u41SGHSUM57H+sRtm9eexFF4hs7d9kQVun26CNWdHto59d2+IkoQPjND5QB6Icf0+k/o
         fqXYDghQH4S4foESC4D9wTi4XhqozPADLF7d9ZGPPo2DhvxesrHRu0czHGYd1nDpGhaw
         IBlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv5Jlyx9Fg4aoOq4lLGG9ggGGS+qS6PcvT5UysNjQNfn6bSieYvK0YO+jz2tz/W+G+2LnZQvqDupWo1eKsBbBe@lists.infradead.org
X-Gm-Message-State: AOJu0YzSMBRc3jOxHoW2FT/5qdzYQO+gaAu3oHmQgu+U/5S8lJaUUbSF
	6Of6lAkbqEjNSxtsr+46N8u3MtvJH484zmTSbNclh7lEM9Necx2lSkjEEEqiThSiocAglGL/uF/
	ax2geVrg/4udISuKKEOJHBrZ8wX3iZ9NR9iTiZw==
X-Google-Smtp-Source: AGHT+IH08LKZaT/MNLlQJFmAnCHMH+5h4dFmcwDILxNxHwbbhWEamUPv8K0yf2DWpwhOv7gBw7hRU0rNhv2SZ1Q9U8g=
X-Received: by 2002:a05:6871:aa01:b0:260:ccfd:1efe with SMTP id
 586e51a60fabf-2962dd0882fmr263152fac.6.1731650284569; Thu, 14 Nov 2024
 21:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20241021072626.15102-5-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20241021072626.15102-5-xiazhengqiao@huaqin.corp-partner.google.com>
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Date: Fri, 15 Nov 2024 13:57:53 +0800
Message-ID: <CADYyEwSjV=YQ2dJ7+RwQFif7WHU7PCDPxbh4OwuBNULsoQ7bkQ@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 4/4] arm64: dts: mediatek: Modify audio codec
 name for pmic
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	wenst@chromium.org, hsinyi@chromium.org, sean.wang@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.or, 
	Doug Anderson <dianders@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_215807_129491_BA751FB9 
X-CRM114-Status: GOOD (  13.37  )
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

Hi

No one has responded to this patch for two weeks. Please help to review it.

thanks

Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
=E4=BA=8E2024=E5=B9=B410=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=80 15:27=E5=86=
=99=E9=81=93=EF=BC=9A
>
> change `codec` in pmic (in mt8186-corsola.dtsi) to `audio-codec`
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8186-corsola.dtsi
> index 943837f20377..13e464dac1be 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> @@ -1276,7 +1276,7 @@
>                 interrupts-extended =3D <&pio 201 IRQ_TYPE_LEVEL_HIGH>;
>                 #interrupt-cells =3D <2>;
>
> -               mt6366codec: codec {
> +               mt6366codec: audio-codec {
>                         compatible =3D "mediatek,mt6366-sound", "mediatek=
,mt6358-sound";
>                         Avdd-supply =3D <&mt6366_vaud28_reg>;
>                         mediatek,dmic-mode =3D <1>; /* one-wire */
> --
> 2.17.1
>

