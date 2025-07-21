Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B68C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rmsuabFxgO5HQbcS/AHuTJwDw0eGQTKollo0RZOzC8=; b=tqdOEz8R4uaLpD
	guIlklg4t2dZDtqladtup53WKaeG7ILCvLe/BSu/nKchSBGIpgBZeUNjt+X+CuVuFonMpSgSv1mRc
	GkklqKiJoZs8f0Yfu5zJUbePUsVTZmd8qIhDR2iqU8wvNkQB9i3m1detWUmAGfywq5fvsKlQxqQLH
	UkCZZ930kj9H1BF/o8zp2yvkkjKWMP2pL2U6Mkldr/jAmpmrsmkhvD2U0ZjUh8icpomayxVAr9TuI
	MrJ9QYNXOeLU/IAyWDfHfmlp32wQav9sjqsBcKFuohbr1341HWoC8NP+uBaAhofHS/+7cajHnfbCk
	hjzM09lNWxRiGNX9o+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtdV-00000000Dvb-3k35;
	Mon, 21 Jul 2025 16:45:09 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrzC-000000001Iv-3en1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:59:28 +0000
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b435ef653so33543001fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 07:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753109963; x=1753714763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0rmsuabFxgO5HQbcS/AHuTJwDw0eGQTKollo0RZOzC8=;
        b=GgRmYl8WevglSQKr/APO8EUDTCEaYdbEpetRl+y3Hjag7xKPgfl/2WtKAlN+UE354a
         NLBU21pjnTII2jZuKy+XgyU8qgenpfqq82sEv/MR3TJwW1PmknVEHR7NzncADuw74VqC
         sZpjEe6MT+c7r95xpwaDC69VsgKmE/sz7As82R0ltSHa8kmdmmrC1uBrN3uNKSgS2jP9
         recvJpAC93/2god8RaG9Ae0bQVmzNODNwLhUEuPRrTcx0QNEowVzXL2sq8TBOOvHWxGA
         mVMT8NhXguZyofEFTNHskyRy+5p3ZCqArG24V1iHvP1HYjmFuJGP1/KsG+F3nJn6yP8X
         bkfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmIHWLU8riTgnF2ip4UCsUukY4zxCOT4hqESUhg26UFQH2vEXiHeBm2OJEaw8EwX2q+whotpjgXAoXPtya0VB7@lists.infradead.org
X-Gm-Message-State: AOJu0YxPe/O8IlLZLKSszerMiUVxmEW5KH+iXw2Syx4jd1xy8MhDLr+W
	3RHpqstPt92n8shIxEJbLLCAadWhTAVCqpOv7VI6qKT6FKOG57rBkaHWpw1NzClD
X-Gm-Gg: ASbGncutb+fBn6LtW5z21gglrpvI1G0QrKJvItSowDJNfLLUilELsUCct9mF4+hs83m
	gn3Hlwo2sJ04JYZtNjRzE4BPfQnaGoJC8TB+301yvOgpdK5XI1IDlLkCWlCvZP+9eO6WTB9OoP8
	dFbOd9IWc/zP3Jz2IQ8cNBbr4u37zKZtWugS5XHj6JBKaquvz8b5miyaH9ZolvVvJ5/tvqCBPH+
	sXc+pnj3W7LAfhaQ1CRGiPtmPgbEzxfBYLYJN9ezH6WrqEVX6de4TiX0yiq3+AfJKsADebPqKuL
	TKlkPvKonqBc6sT4bc8Z6KzCOxRMXkkIYmVB2Kc+t3VSqBydaE1y44NICGN5AAcngtKsM+i+nQG
	yCEs9rw014fPvrQd2AFFPvWjw8lFUbLszQBrU30yEnP6nSdUtDnZTLwA=
X-Google-Smtp-Source: AGHT+IEvn0xBqUhu8lE7G+C/qQQJb+D2RRUrzCig0trfNLaRkoAdiBXkZfJjM57bvMe4J3yE0gN0Lw==
X-Received: by 2002:a05:651c:509:b0:32a:8030:7004 with SMTP id 38308e7fff4ca-3309a466642mr39065521fa.4.1753109962397;
        Mon, 21 Jul 2025 07:59:22 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d89a3sm14994221fa.72.2025.07.21.07.59.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 07:59:22 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b435ef653so33542541fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 07:59:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/wHypJ9YER6fswEMe9jcq/zeAgLvm2AIYFw12zIVctXAVmbn8pBbhT//vQigiekRR/dKfdFN2ZFkY3jIjse/b@lists.infradead.org
X-Received: by 2002:a05:651c:b10:b0:32f:3671:4d6d with SMTP id
 38308e7fff4ca-3309a469ac4mr36664631fa.1.1753109960994; Mon, 21 Jul 2025
 07:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250720085047.5340-1-ryan@testtoast.com> <20250720085047.5340-2-ryan@testtoast.com>
In-Reply-To: <20250720085047.5340-2-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 21 Jul 2025 22:59:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v6641hLu85FJieWGH5YJsRmxCD1U-tXgStMZtCN1u0sFBQ@mail.gmail.com>
X-Gm-Features: Ac12FXy8xxyVpMZUJXrjnYkRucYHTAN65deHIYaoxabOBlfZwoY8o6UDGEBDiMM
Message-ID: <CAGb2v6641hLu85FJieWGH5YJsRmxCD1U-tXgStMZtCN1u0sFBQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: allwinner: Add TCON_TOP_LCD clock defines
To: Ryan Walklin <ryan@testtoast.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Chris Morgan <macroalpha82@gmail.com>, Hironori KIKUCHI <kikuchan98@gmail.com>, 
	Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_075926_911159_3A84AC6D 
X-CRM114-Status: GOOD (  14.41  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi.


On Sun, Jul 20, 2025 at 4:51=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> The Allwinner H700 exposes RGB and LVDS pins as well as a HDMI
> connector. This requires additional clocks for the TCON_TOP as per the
> T507 datasheet (which shares the same die).
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  include/dt-bindings/clock/sun8i-tcon-top.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/dt-bindings/clock/sun8i-tcon-top.h b/include/dt-bind=
ings/clock/sun8i-tcon-top.h
> index 25164d767835..2a12d047d2e1 100644
> --- a/include/dt-bindings/clock/sun8i-tcon-top.h
> +++ b/include/dt-bindings/clock/sun8i-tcon-top.h
> @@ -7,5 +7,7 @@
>  #define CLK_TCON_TOP_TV0       0
>  #define CLK_TCON_TOP_TV1       1
>  #define CLK_TCON_TOP_DSI       2
> +#define CLK_TCON_TOP_LCD0      3
> +#define CLK_TCON_TOP_LCD1      4

I'm confused as I don't see these new ones used anywhere in the series.

ChenYu

