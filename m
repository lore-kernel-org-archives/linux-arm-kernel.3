Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43E7D29FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 08:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJ3Y8x4A9Kv0VojRXE40fqCjR+Xz0wiILYeF1Q+j1Bk=; b=IX96Prn3fGxW5Z1lIYYooN/Ffz
	oM8Gbe5/0noyOa0/bSlBmOmAEPvLvyhuauQd8HbCLcxCdFF0rqpblVBlEyEyqJHWFZUTYr4vNjjOs
	mTJXOytyqUYAa3qx+meAObmQWw5x5XWo/sx3R1tYm8VxHxZeJjvdY8/Q0axlQMOYLc4kWtNCaoSIj
	3QGpIscb3tJJVoBUhkDYM9tGx6P2w9kLTfkxkBPqeZdpG44WVU8BqFmBG11KRYZ56xax0v01kSuQN
	QBDhrXoG8/zlKQR6XvtpGkXXKj8vomZA89KxUPJjq/swtMqGlq/rX7s/b5l47HDdzQFEJoewB1xLS
	Wb3BSWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8b0n-00000002DIQ-2e2i;
	Wed, 06 Nov 2024 08:03:33 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8atA-00000002Boj-3NdZ;
	Wed, 06 Nov 2024 07:55:42 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7b150dc7bc0so445844185a.1;
        Tue, 05 Nov 2024 23:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730879739; x=1731484539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJ3Y8x4A9Kv0VojRXE40fqCjR+Xz0wiILYeF1Q+j1Bk=;
        b=gJcIA/IqqgxOxtOch/Be3rmnNhar9T9/wSriEVSFrk9ipxSp/CR5g5o9OVPMM4UR2p
         EgX78zs98zVskZYNEuzfCG6HTA+Q8GKyO/IdVY3c99N3a8uOgsbeeMLuOa4/TfBmb9xP
         9znd7RoJTtvZsl1s7Ijk/L6tTXSttcDF4sRAYCVnUCTpFlV4vfr23+kodkIw1s83I0jH
         7D1RK8IlRTxxMoAUiDYhAdhOqAbaLMqrOdVA3Z7mPpwUHlvm9yMGvwZcCIQrmu1oJX9K
         Afq3UP3g2HpUnWTieLdSuA7cJ37kzc/wIeagYCLxboMhDTGRUmbWybUhFk+O3DaIUQ4o
         8VXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730879739; x=1731484539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJ3Y8x4A9Kv0VojRXE40fqCjR+Xz0wiILYeF1Q+j1Bk=;
        b=HVCYKjzU7BBJTFN0R9uZ8wyO6TBWlCYWmmM6IEGoNJGQwUdUuG7thaE90nvZH/OGJL
         fXrBqTuySzDoThdYJDBXP859iLFq02KEgJMT3s8Q1+D2dzCvUh8WQf2uCirNXk8VaBHc
         vtIVzfCOX7zLvyI9qt0g4iVHtX9FuyfKEhCnT8sxfQpbUztNHY7you3ixLiF77/yGZBW
         z30q/0FmNIUEIwitk879E3E4oEpzVufw4fIpR9X+8vIZOtLE2KOrXY8RBf5clocDfapO
         pqmOtdvjd1y5t8Rgdbj3TOgqEGE5hGNfyx8WPEG+z03wCNeF4DH0/9N+UFyT/l8+SuEY
         fMng==
X-Forwarded-Encrypted: i=1; AJvYcCUmkRzpNdGeIYnYb6ITM2yfQ0cllq9eaLyi6JOOko/fChNPxBXujk29bk2xoyBXgotzXMxTsGpTZG8zjlcq7a8E@lists.infradead.org
X-Gm-Message-State: AOJu0YyjHB3MGIJp6CQnNwkXcPr/Rr1nkTnSj1BnAGgx/SxRdvsY2MvR
	2nP7BFkckI7BenIaG+Oi3Xs72cCljWcyQm6ijxz+9vmpXN94TYcGx4FsrTfZ+bfELg/nPfXrw9M
	wDdWIVe8NJiK8zzWpkcxWGyayn74=
X-Google-Smtp-Source: AGHT+IFhJbaqJv3pBEr11USTxaLxjnqc8AtjiRuH9iIT4+AXTrfXWWty6WhGqpPLOlJvr+SCaUZfi6Qr61u5KxyZgZQ=
X-Received: by 2002:a05:620a:294d:b0:7af:c3e6:651 with SMTP id
 af79cd13be357-7b2fb9d0c40mr2615260085a.44.1730879738759; Tue, 05 Nov 2024
 23:55:38 -0800 (PST)
MIME-Version: 1.0
References: <806d5e2a07ae0c81d9907bbe8bec4e3e1138b392.1730838347.git.dsimic@manjaro.org>
In-Reply-To: <806d5e2a07ae0c81d9907bbe8bec4e3e1138b392.1730838347.git.dsimic@manjaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 6 Nov 2024 11:55:28 +0400
Message-ID: <CABjd4Yyt6WiY5E5DbyjnboFvsTpp33dydkGMF7AwMB9m7bfX6A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add OPP voltage ranges to RK3399
 OP1 SoC dtsi
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_235540_964891_85DE6360 
X-CRM114-Status: GOOD (  16.66  )
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

Hi Dragan,

On Wed, Nov 6, 2024 at 11:50=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Add support for voltage ranges to the CPU, GPU and DMC OPPs defined in th=
e
> SoC dtsi for Rockchip OP1, as a variant of the Rockchip RK3399.  This may=
 be
> useful if there are any OP1-based boards whose associated voltage regulat=
ors
> are unable to deliver the exact voltages; otherwise, it causes no functio=
nal
> changes to the resulting OPP voltages at runtime.
>
> These changes cannot cause stability issues or any kind of damage, becaus=
e
> it's perfectly safe to use the highest voltage from an OPP group for each=
 OPP
> in the same group.  The only possible negative effect of using higher vol=
tages
> is wasted energy in form of some additionally generated heat.
>
> Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi | 52 ++++++++++----------
>  1 file changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi b/arch/arm64/bo=
ot/dts/rockchip/rk3399-op1.dtsi
> index b24bff511513..aa79219471d3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi
> @@ -12,125 +12,125 @@ cluster0_opp: opp-table-0 {
>
>                 opp00 {
>                         opp-hz =3D /bits/ 64 <408000000>;
> -                       opp-microvolt =3D <800000>;
> +                       opp-microvolt =3D <800000 800000 1150000>;
>                         clock-latency-ns =3D <40000>;
>                 };
>                 opp01 {
>                         opp-hz =3D /bits/ 64 <600000000>;
> -                       opp-microvolt =3D <825000>;
> +                       opp-microvolt =3D <825000 825000 1150000>;
>                 };
>                 opp02 {
>                         opp-hz =3D /bits/ 64 <816000000>;
> -                       opp-microvolt =3D <850000>;
> +                       opp-microvolt =3D <850000 850000 1150000>;
>                 };
>                 opp03 {
>                         opp-hz =3D /bits/ 64 <1008000000>;
> -                       opp-microvolt =3D <900000>;
> +                       opp-microvolt =3D <900000 900000 1150000>;
>                 };
>                 opp04 {
>                         opp-hz =3D /bits/ 64 <1200000000>;
> -                       opp-microvolt =3D <975000>;
> +                       opp-microvolt =3D <975000 975000 1150000>;
>                 };
>                 opp05 {
>                         opp-hz =3D /bits/ 64 <1416000000>;
> -                       opp-microvolt =3D <1100000>;
> +                       opp-microvolt =3D <1100000 1100000 1150000>;
>                 };
>                 opp06 {
>                         opp-hz =3D /bits/ 64 <1512000000>;
> -                       opp-microvolt =3D <1150000>;
> +                       opp-microvolt =3D <1150000 1150000 1150000>;
>                 };
>         };
>
>         cluster1_opp: opp-table-1 {
>                 compatible =3D "operating-points-v2";
>                 opp-shared;
>
>                 opp00 {
>                         opp-hz =3D /bits/ 64 <408000000>;
>                         opp-microvolt =3D <800000>;
> -                       clock-latency-ns =3D <40000>;
> +                       clock-latency-ns =3D <40000 40000 1250000>;

Did you mean to update opp-microvolt instead?

Speaking of which, this single opp having clock-latency-ns while none
of the others do (except the first one in cluster0) looks weird.

Best regards,
Alexey

