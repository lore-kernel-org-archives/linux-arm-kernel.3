Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E8DC2A062
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 12:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBKDKmgNeuHP/wUApQBBZMmfpGBUmHNRwxjuRpd57cM=; b=bUxlOpxvCxL71MQrHfvjohafzL
	n/Kuqlyb35327aSGx9vaGrs4r+l02VIs6LQeLrIw3KlKBH3dF7jDGRmMqLh2W1mJ/7twTXrI8C7M7
	a3QAWuJ4HcJMu82aB2l8PKIgrF8CxLa/g+0wGG9TPvN7G/pcw3dpIsez36kNlqWpmKeiExm3cuuQI
	35139xHZ6p75C/oMeyw1GAoAnnjUdUh5eggSqUCFnWtX4eAnDgjVJMfQ0y/fND71Q7phvgAfmyVfz
	E9shAV//oYiGM+B8YO/loToGTdaD5LgtT6dYLrUN0ysVN9az5dHyWZx0twwLq/oJ7ikrHB1y+dK97
	csoSpsxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMn3-0000000ADH3-1Sxc;
	Sun, 04 Jan 2026 12:00:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMmr-0000000ADGH-0Tcx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 12:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 816F044300
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Jan 2026 12:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66058C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Jan 2026 12:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767528044;
	bh=gk/O5/8TMjlT+wpe3vNH+tG/DMBud2FXxDco5ugVk+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mlDVT1QiOwDEfe1eqQ3t6OAtcw1k0oy5smmcPpJ4kxyr3+q90ttSwWtdSKvvC5rS7
	 BokbEN7YBv4M3/G4kuBooAa6eOUJvf27Z24/bhQKA0Yx5pDwth4TKHxgt0OjSpWOyD
	 PcfTJmxk9AfHc6UzZGfLlnt5eMn1LrV0V6mcr/s1ugXv7JeAozXkzT4qtSqtAbyYBQ
	 EhXkfXN4TgMJu4SJkD1cfdmXLDzR40l8wzYdRfxi3OjcALbyyGpaW1klTct9AsBIoO
	 gk7JhzQZjJvL0vWK0SrJz2hGNtDsPdszNl0WA0W7ZEchgdYvFJHtitonLFOLkuoaZR
	 4S2nP3mbiffPg==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78fccbc683bso99612277b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Jan 2026 04:00:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvJGA2uZ82Jxh1+7UXBCPgVKkflEO7CXFPYdgXXb83fDYKQmq+/cUEISji1/ULnUtsNukL0WGdeyMAOozkBqVu@lists.infradead.org
X-Gm-Message-State: AOJu0YwEhnuxFL/KI8lqBKaoKNFzw1K0KJrP61tLkUvcAKs1l61lianT
	90JGwxBaeqTsafgdbeH84TrO3UERGCXUR7VqvTb/aDyxMOmiInOAuYmk2un/SzIZ+aJbmw8DytM
	qNOBN9AWr3uL+eZN2/cqgPgemnup+UmY=
X-Google-Smtp-Source: AGHT+IHRIvO3ksa3QLYzzJfkSuNK3DEv4ik61urgIslLHNVqtp8kyS2NMIh1/AKMplqEBnEftxOF3QWj4wCPJzd1mUo=
X-Received: by 2002:a05:690c:3612:b0:781:64f:3132 with SMTP id
 00721157ae682-78fb409d56cmr309348707b3.64.1767528043622; Sun, 04 Jan 2026
 04:00:43 -0800 (PST)
MIME-Version: 1.0
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com> <20251227114957.3287944-8-ye.zhang@rock-chips.com>
In-Reply-To: <20251227114957.3287944-8-ye.zhang@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 13:00:32 +0100
X-Gmail-Original-Message-ID: <CAD++jLnKoOPCKRi9hvqqH54g1MYbGiK9r7pMi+3z6yHG43nGFQ@mail.gmail.com>
X-Gm-Features: AQt7F2rYDZXFYhSLsCcm698mZHPaUMrH9YKco-_ba-MTp1nPcf5WWSnYw7QDXME
Message-ID: <CAD++jLnKoOPCKRi9hvqqH54g1MYbGiK9r7pMi+3z6yHG43nGFQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] ARM: dts: rockchip: rk3506: Add pinctrl and rmio
 dtsi for rk3506
To: Ye Zhang <ye.zhang@rock-chips.com>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_040045_211290_480BC6AE 
X-CRM114-Status: GOOD (  11.41  )
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

Hi Ye,

thanks for your patch!

On Sat, Dec 27, 2025 at 12:55=E2=80=AFPM Ye Zhang <ye.zhang@rock-chips.com>=
 wrote:

> +&pinctrl {
> +       rm_io0 {
> +               /omit-if-no-ref/
> +               rm_io0_uart1_tx: rm-io0-uart1-tx {
> +                       rockchip,pins =3D
> +                               <0 RK_PA0 7 &pcfg_pull_none>;
> +                       rockchip,rmio-pins =3D
> +                               <0 0 1>;
> +               };

This is just adding more and more "necessarily different"
pinmux to these poor DTS files.

I would do this:

&pinctrl {
      rm_io0 {
              rm_io0_uart1_tx: rm-io0-uart1-tx {
                  iomux {
                      pinmux =3D  <0<<16 | RK_PA0 << 8 | 7>;
                      bias-disable;
                  };
                  rmio {
                      pinmux =3D <0 << 16 | 0 << 8 << | 1>;
                  };
              };

If this requires some changes to the iomux driver to handle pinmux =3D <>;
as well and some code to handle subnodes for each pin controller,
that's fine. It's just work.

I need the DT bindings maintainers word on this, especially Conor
who has worked a bit on standardizing pin control bindings.

Yours,
Linus Walleij

