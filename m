Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91337C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 05:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vorWjyWoS+/pe1rTuodzRNXMvlPaeZ3qAjeUiTyfr/Y=; b=48RiMSjDGojN06
	wz+hJR+A7jfzGrwTBG3ZeGDGwXn3PCotTrd2cTq0X7w9V8/PwAiLlkOGjykYwdyE0kX5PR//2MSt+
	1yNcAyw5S7H/Q6/yL6RdVJkQau/5+6+q3MdCkdb9pUEsxdd2udAISgmhUtu63X4Hmc/hspyfb3l8o
	xLAUdBdLKQQlcIzhhIMrEkJneG2FSnvdE9pw7++hHh1TKuFQV4C/cBeVZPwnVlMgkVBOxsyl3GH5v
	kGDzEHQo7vdeR6UA53tq7LddGvckFLf9fB5NsfCM5rNkv9YnLd4fVqem7g5GZK5oLloloMeYX/aY4
	KMYMjuPzaWdLlRQxTkrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Bc5-0000000Fypv-0fwQ;
	Fri, 25 Apr 2025 05:28:37 +0000
Received: from mail-lj1-f180.google.com ([209.85.208.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8BaF-0000000Fyi3-0K0q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 05:26:44 +0000
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bfca745c7so16936851fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 22:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745558799; x=1746163599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vorWjyWoS+/pe1rTuodzRNXMvlPaeZ3qAjeUiTyfr/Y=;
        b=A8Nar9yThUwG/vTn452njE41TDmMwBiwlOjWulEBQ0nviztEVijQbM4Du6vBCOGqId
         v9soK7MzwTMVT6AhZxnZR/6ClQRixlZJlOmlWEbET1MOIU2P0VNtO408E5suEZrHzm8k
         AOBXjlWKQDZVJTYVNmmkbN1/IufeC6ZeHNvruZfMXdo6fxLzH1Uf4RX5vs7tDlWj7cJ1
         gqPPEPXHM8wDQLp2Mo/Ew6JSoNRGlbPEtG8FNl17o2lTreGMGaTHGsDeurMWjZdNiX/H
         rMsat4bblKa1GGsdODeRVxF5Td5ZBouHj9iouFiBTkVA/HFQlpVahX3RcNFideNUe17i
         tjdA==
X-Forwarded-Encrypted: i=1; AJvYcCWBYHos2q+7DFi8vttVxF9rP1V0CkFn6qBd4ZDGFw5csEGrQk9rL7hfrMftpx5FygQDtNHadwcgaLUHQt9WTOCd@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkc/GgWkcYcg86fMTMNfEXLPEEEZG7alFRvxWEZ6ztk0G2ZQA2
	phajV+AZsWoW1hR9lgfkevTpTbCBn1YeHpj7giUBaN3QT1xgPfhImWw34XM8u8s=
X-Gm-Gg: ASbGncseyY9MLwWAOw7R5dtwQdTtWClVabxK7DtePFf0UMICKz6Vfbqd1r2zXwpAhOO
	GR8/pqdOWud5oqNRMefTqsiWnjgrLUQuXLe5fPPKnFwO/bxusnwgUAp2h7clmyU7DPZHBg8tJF9
	kvU0J50uIpI/FIsxkVSSFQnqr8Cb1eckRzqNhJNvsNZCcd0+CumsiMe+KwhfzCw1aTTjQGbk5Ql
	qZSpBRCjrqzdZkza8H+iM1Zj3OOMIYOzU6g++H8gnfp/gpF2Vp0vI7wsTbpmF/TjxlywmMwyTZU
	N7LNLyUJffet+MBe9fb8rkmf8DvEwb+C2laO0pxjtb/Bo7HwUbabEbMuUXo24b9FfZnVrDlcKA=
	=
X-Google-Smtp-Source: AGHT+IHKyTh/vW3zXkfMytVjc0nBt9qPCYpsHvuy8P02NFtFnr8RTcL2i9PwIv5lm9TyIm17riG5FA==
X-Received: by 2002:a2e:be1b:0:b0:30b:b9e4:13cd with SMTP id 38308e7fff4ca-31905b6a701mr2132061fa.2.1745558798576;
        Thu, 24 Apr 2025 22:26:38 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb484eesm5785331fa.41.2025.04.24.22.26.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 22:26:38 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30de488cf81so19671051fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 22:26:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMh7Tz0q9Z/HmnmZlaUpMGNjF2u3mhnrireQC8tHqcrrfXO8vN/mli44vPjzVcu0mLZr4okAk5U59wuu+vBROE@lists.infradead.org
X-Received: by 2002:a05:651c:542:b0:30b:efa5:69c3 with SMTP id
 38308e7fff4ca-31906e314a0mr2145241fa.22.1745558797847; Thu, 24 Apr 2025
 22:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org> <20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org>
In-Reply-To: <20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 13:26:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66a4ERAf_YhPkMWJjm26SsfjO3ze_Zp=QqkXNDLaLnBRg@mail.gmail.com>
X-Gm-Features: ATxdqUFQB3DitZ7r67Jb5Ui1og31mJLNpJsBnkQBmfhJ0SUAid0UCHRMYJY-5Nc
Message-ID: <CAGb2v66a4ERAf_YhPkMWJjm26SsfjO3ze_Zp=QqkXNDLaLnBRg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andre Przywara <andre.przywara@arm.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_222643_112524_955CC9D9 
X-CRM114-Status: GOOD (  14.10  )
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

On Thu, Apr 24, 2025 at 6:09=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Add EMAC0 ethernet MAC support which found on A523 variant SoCs,
> including the A527/T527 chips. MAC0 is compatible to the A64 chip which
> requires an external PHY. This patch only add RGMII pins for now.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 40 ++++++++++++++++++++=
++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index ee485899ba0af69f32727a53de20051a2e31be1d..c9a9b9dd479af05ba22fe9d78=
3e32f6d61a74ef7 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -126,6 +126,15 @@ pio: pinctrl@2000000 {
>                         interrupt-controller;
>                         #interrupt-cells =3D <3>;
>
> +                       rgmii0_pins: rgmii0-pins {
> +                               pins =3D "PH0", "PH1", "PH2", "PH3", "PH4=
",
> +                                      "PH5", "PH6", "PH7", "PH9", "PH10"=
,
> +                                      "PH14", "PH15", "PH16", "PH17", "P=
H18";
> +                               allwinner,pinmux =3D <5>;
> +                               function =3D "emac0";
> +                               drive-strength =3D <40>;

We should probably add

                                  bias-disable;

to explicitly turn off pull-up and pull-down.

ChenYu

