Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465F8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jn4oJG4kk9AZGnKXQKwGIPd246ZQVSmkzpo6s8kUSt8=; b=GEJkHqOlA/qlRI
	8vkdoltxQofxpjUwq93nCGxSRCN5uFz5g9iaH+Z1MYCn5gcT6GBh9hcxWw6hMPaBdM3p6lMUhIKn0
	1p5Dn2oOd68505t/G78Cgtuc70SXVuDWk7RVgHuGVy3u763J+O49vBSg6yVh5IlQEqoyFRYtHJYZd
	K0TnBA9QZWIyzfRaaXwQnIqXqlDBGgYQ1ACLh3DY+CA81qziIyf5aQ9YU4JzS0br/Dv9QWSE8wnZK
	H1H72uf+Uhb/K13N4hHEFrCLUibuTzLEBIcp8YO8PXRJL0okbZ8xImfDDUjez5wFI5Q/K/Oazx51x
	NemX/JDTWgooxBxeRO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPnq-00000008bEB-3zcW;
	Sun, 22 Dec 2024 17:31:42 +0000
Received: from mail-il1-f169.google.com ([209.85.166.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPbx-00000008ZmQ-3FVD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:19:26 +0000
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3a7d690479eso27449255ab.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:19:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887963; x=1735492763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jn4oJG4kk9AZGnKXQKwGIPd246ZQVSmkzpo6s8kUSt8=;
        b=IMHgyo4osTgEQdx89bxmmAETxd63mVuVqBZbHrhRT9ZxBIyGi7QOMadrTuGFRzRfjZ
         +LAbluK5HfgB+fg+4fpnBtTwS5oTuuUcdQ9MURvlwLp3b4E37Mkdg4s8FaZ+JmlZf+SS
         UnPIr1HfjTdCOAR4GdD5lPR6hpzgNOP6pZwsGK92Ja0YyZXkQPpswi55a5HPA+FGStSx
         Ht4YRvs3oayYNDl2GSi2UfKPFjSvvkWNiuHFFsCNtKXgiuaj3vbfxPvQK3waRwCKVb3z
         +gkzUeAtW2VP0v1gAN4URE1U4Fem/86c3f7FitoYt5PaHFYfWIEzSPAJ9gPJTFcvL8Jm
         I6QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg+AdIXnEEd4dbwTdK6qlNKFkveAI5a3ho3Mc4ZxtubBWxjEu6SMz7XCMFaG6ktF3RFfcl48xvIW0Jbw9bEYd+@lists.infradead.org
X-Gm-Message-State: AOJu0YzIlwRhUDN6HJFXvVOI/hEzQtwmLrfVlOZezJZiFO3tes0415XW
	VlK7jvhmtnw+AymA18DerfVPEZnDESAfPZfU21LOm+YggTdJnv4rvi29qL0jxxA=
X-Gm-Gg: ASbGncv9/iDgfn4+DgDeazI30QmDlah+N6MFTqw4kPUJSKIDTvksHdo7jPsVzXrpv4z
	+9f6lXb0d1h56NY97M9AXhAn7PAwRqEQJmNqzA0d7aLCPQuj9/yArIzpIWgrRw0m0Gvqve99UIF
	6ZuG+3qmzHAmJZRTOFi98m+uF9+8R87ajuUnI5fQPpvlH9cvEkKzFNM2eDDC++beZeqSOY914pt
	ZehrCLlt5rLuCjryO2CCEo786lNTtY1p66hGMaBOEA/9ptsMbWeCXa7AJrIN6g6XtRnRZKEO8j1
	f8HzvOal6A==
X-Google-Smtp-Source: AGHT+IHoSuxJhX/l21cdSK/ax03xZ6ZMNZaQzc2nNMWPoyXWTLfngk54mRrhwFWXwTERFrmIs2Rtwg==
X-Received: by 2002:a92:cdaa:0:b0:3a7:44d9:c7dd with SMTP id e9e14a558f8ab-3c2d2780fbbmr110151035ab.6.1734887962775;
        Sun, 22 Dec 2024 09:19:22 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0e47d6d85sm20109085ab.68.2024.12.22.09.19.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2024 09:19:22 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-844de072603so332491839f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:19:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW53Ruc0f2CmD87fwGj0CW2JLa0eaUE4m9CfXpngOoHT+bOMEdrGwi8I/zSgqGhSeMydP0vecohblYd3Dt7SfQl@lists.infradead.org
X-Received: by 2002:a05:6602:2dc6:b0:844:dfcd:8de3 with SMTP id
 ca18e2360f4ac-8499e4f2fd1mr899114039f.1.1734887962153; Sun, 22 Dec 2024
 09:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20241220120038.3137248-1-pbrobinson@gmail.com> <20241220120038.3137248-2-pbrobinson@gmail.com>
In-Reply-To: <20241220120038.3137248-2-pbrobinson@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 23 Dec 2024 01:19:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v66enf0ybbyW3tW_YRdJB0=aOsXidm_bNHh=wdmm+HPBuw@mail.gmail.com>
Message-ID: <CAGb2v66enf0ybbyW3tW_YRdJB0=aOsXidm_bNHh=wdmm+HPBuw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_091925_879759_239DC1F4 
X-CRM114-Status: GOOD (  17.81  )
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

On Fri, Dec 20, 2024 at 8:00=E2=80=AFPM Peter Robinson <pbrobinson@gmail.co=
m> wrote:
>
> This adds all the pin mappings on the WiFi/BT header on
> the original Pine64. They're disabled by default as the
> modules don't ship by default. This includes, where they
> haven't been already, UART1 for BT and mmc1 for WiFi.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  .../boot/dts/allwinner/sun50i-a64-pine64.dts    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/a=
rm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> index 09e71fd60785..f04f0f1badc4 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> @@ -35,6 +35,11 @@ hdmi_con_in: endpoint {
>                         };
>                 };
>         };
> +
> +       wifi_pwrseq: pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> +       };
>  };
>
>  &codec {
> @@ -124,6 +129,17 @@ &mmc0 {
>         status =3D "okay";
>  };
>
> +/* On Wifi/BT connector */
> +&mmc1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&mmc1_pins>;
> +       vmmc-supply =3D <&reg_dldo4>;
> +       vqmmc-supply =3D <&reg_eldo1>;
> +       mmc-pwrseq =3D <&wifi_pwrseq>;
> +       bus-width =3D <4>;
> +       non-removable;

Please also add an explicit 'status =3D "disabled"', like what is done
for the uart below.

ChenYu

> +};
> +
>  &ohci0 {
>         status =3D "okay";
>  };
> @@ -286,6 +302,7 @@ &uart0 {
>  &uart1 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> +       uart-has-rtscts;
>         status =3D "disabled";
>  };
>
> --
> 2.47.1
>
>

