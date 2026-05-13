Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD44CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWUdJt5QmKoXoKWfFdQ2KQor1K6FouHCxfPAdMf8TJg=; b=u0TbNINpt8ui/z
	CCZRSIEobANykpwVWUAKgaFVIVapdmbkkQM0DQBHtUWYdZ7+akaC3G8AqspLuLiLn0CtFg43RdaPg
	XVhN4DMCN8iRlhDG2sSrxwwxJtcTfetkPxDCNGtZwwefKXWzgL6nPvJsTXYsG85gsiPXugUe0b/EJ
	WaEuMUHYy5le9iqcep+/gKOZzluEoXzRCh2lYxMIhFTklW+QPRdot/9vBHi5dNOhM/+G+iec1L774
	BsAnVUqqCvn2SQ2800XxiZkgJD0/69iElV44/+3M48oUw5sns7hplaLnw9hRsUdgwtRFeEBWD9Byi
	VnnqTPznNWdwp/XQzBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN22B-00000001J5y-2st9;
	Wed, 13 May 2026 05:21:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN228-00000001J4c-40FK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 05:21:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3186141501
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 05:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13966C2BCC6
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 05:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778649683;
	bh=wG39Ji+Evy4auwV08BQ91JK+X5T6r322YoiDD9mHSjA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=N8CrScUmNYnIHpxJ6lc171g+eJphe2OhWMe8MuvTj3QqqLSF1jTAEh/h4ImFWhC4i
	 zfFi0iMugiMIXpDz0c/S1sh5fN+ZTa5ybY6e3NW5BNGAHvlK5Lk3y5ZKld9eOpD/fm
	 Y5VkRKxct2VWVuxJOvv5hu3UJ8CBHOBYXXVJoeOEKGsiBUZZlIPsmO74k692V3Kok/
	 uQKVj0NVIkJ9oHQD8kZm99OPFkLyJUjUTxG5v7XIxckSQmGHNvNRATiHRmD3q5Y7Rk
	 ao7l+1YUnCgXX+BjBbUl9hyShcHKzHYd3GZ50WcDvfvXaJ380vQRrqcHiO7RVX6+u6
	 4pxIcA4yJISVQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso59286311fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 22:21:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8n7oyhIph1uAlYDjCL1z33xplNA1h7rGYGTYIAf/99N4HRVsyqPGiu1gxF0IKeGnS5WwfF8bmF2GDjnUhvquMG@lists.infradead.org
X-Gm-Message-State: AOJu0YzokV5/1E0bTmOIepwfqdw+niroO3MrmdxcDumZcYGYfr+FQVsi
	adl+cNTZOYSBq6PrRfAGIa/KHRDKMDPZTXyii7bWg4GuML/YJme17Chgzajpz2nu19G5FqfCJ5m
	P/t6BfOL5C8Uwb2tPKcuwTRun80zOxlI=
X-Received: by 2002:a2e:8a89:0:b0:38e:6:4f89 with SMTP id 38308e7fff4ca-3944ea49693mr2922681fa.25.1778649681511;
 Tue, 12 May 2026 22:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260511221741.25888-1-andre.przywara@arm.com>
In-Reply-To: <20260511221741.25888-1-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 13 May 2026 13:21:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v64u4sqwiiQcEBg-XvmJ2DLEpSj-_AWNbp14RAp-GXP7OA@mail.gmail.com>
X-Gm-Features: AVHnY4LNzDSVxvL_bMTBGmDtpC-1_N73M3ApcObKe_HI8JqQNliaOIug0_HE6VA
Message-ID: <CAGb2v64u4sqwiiQcEBg-XvmJ2DLEpSj-_AWNbp14RAp-GXP7OA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_222125_039831_38135E5D 
X-CRM114-Status: GOOD (  18.11  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, May 12, 2026 at 6:18=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Cubie A5E board comes with 16MiB of SPI NOR flash.
>
> Enable the SPI0 DT node and describe the configuration.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> index bfdf1728cd14b..7ad22fc85d1fd 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -344,6 +344,21 @@ &r_pio {
>         vcc-pm-supply =3D <&reg_aldo3>;
>  };
>
> +&spi0  {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&spi0_pc_pins>, <&spi0_cs0_pc_pin>,
> +                   <&spi0_hold_pc_pin>, <&spi0_wp_pc_pin>;

This whole thing needs to be an overlay. The HOLD and WP pins
conflict with eMMC usage, so it seems that Radxa only populates
one or the other.

If you look at the pictures on their official website, you'll see the
SPI NOR chip populated, but not the eMMC chip. On the linux-sunxi wiki
page, you'll see the opposite.

And you probably want to enable QSPI, like Sashiko mentioned.


ChenYu


> +       status =3D "okay";
> +
> +       flash@0 {
> +               compatible =3D "winbond,w25q128", "jedec,spi-nor";
> +               reg =3D <0>;
> +               spi-max-frequency =3D <40000000>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +       };
> +};
> +
>  &uart0 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&uart0_pb_pins>;
> --
> 2.46.4
>

