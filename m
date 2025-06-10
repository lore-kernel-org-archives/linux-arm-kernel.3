Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9CDC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 14:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EanlmV0cW1dyyqCiFlmm6H2lcoAcchpMNaepjtxFpoc=; b=hpGkcp/M0caP//KhvNEoSW+5QY
	d86K18hNc1hoWqpLl+4Mzd+B0awMlohPvZKdkp7R7o7XRN/L91ZME5njIkmGHL5c6oTPrm2zVko9W
	+yn+kUam1Z3iWQrpILNBj80stJMw/Vxn4FfCZNYzU9GQvEW9L8B7RphMI+foo58VksBtOBT+LGLKS
	PcGi1MSqocnuM8qHY0ECP4yntxbYSdghTlIfcDLeulUdMozbixrkLV6QopQTQnCnS1jZ+KthJbNtr
	8vsIz2wW9A56d5hfsNg7zmi81s6EoI0PFAZjY31yhXoTeSk21nlUey11nuS5WxcoXhft3zdhi9uiI
	+onoZ0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzhN-0000000761c-3Y1u;
	Tue, 10 Jun 2025 14:11:33 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAj-00000006mQI-43uA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:47 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-32ae3e94e57so33432301fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749558824; x=1750163624; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EanlmV0cW1dyyqCiFlmm6H2lcoAcchpMNaepjtxFpoc=;
        b=HYnt30RSC8NIgzXsSwIH5qPvexxmiyOpbbdA2WAA5WyK1hFENfQzhBrF0lgo5UxI9F
         kqwGKYcAc94bomssdv5RhkHBkNrHXJ4EuB1vxyrtaIPvEfzEkqBJYOTdxI7Rd/K9ZCKu
         ELZuNcJkDNDm5KaiRO1Br9RueGLyezUva0JkUucnauK85GP5zyBK1A6PhSz+6GE1lO/G
         BpPAroEtbaF40IJML5wo1ftoOz3k6ZBiHVO1Zri+UrQH5kZSoI/vq5gqoGmf+cTFJZhg
         AC0gkJY6yO6eTt5o4/wA6DteS8yBAi3ZWhRq/VvZPWt1Tkf00gQ5arsr7259uv9IikvP
         qDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558824; x=1750163624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EanlmV0cW1dyyqCiFlmm6H2lcoAcchpMNaepjtxFpoc=;
        b=mQdMx+WgkkQ+yB26y8RdT12OEkZPmkBDIIBxCNk8vyvcv7nGUdbFbWJRj8TKSG0jr4
         zybgLyMaF4PIsDLhg+18WSvHRkw5sVpHPrc30B4I7elcNQPdeBNtpKxh2NyEQ6mLJ27C
         e+FGI/fGPjdd/Bvo/+7+ct30UcPdKI0qIVZIoc+PHmdVjGEGa86+cvJxWGQBph2V6/mp
         pSvgKlILq6dfhdAgu1tc4ROoAKHjsrSWC4/WyxbCQCozCjo9WNxLCeGNL3UfZZUUIWNV
         9nWKygJuUBpRUTEedcf6jOZK+Dw/5RrPVhNAi9cLwj2VNRJ11CPJDYki6aM3tCUayUM5
         FRqw==
X-Forwarded-Encrypted: i=1; AJvYcCXTBumR7jVl8W30sgPK86WN6ACJHGy3OXTxrCxnecmwZULO1+1FEY+5cxehGGJgGJb+gPfZ/WIQQZJFyzn24Dw3@lists.infradead.org
X-Gm-Message-State: AOJu0YwtwFGV2jK43N/9rCcLzNGqs0GfDARyrg8TWJ7Z3+GryYR/dM40
	Fq4fJvHXS/6qZD4rqWoc7Rg4LFviv6ADrjOmmKmu/X7VvuEc94FVM1vq2xsDKnMGLXz7aPqiH9v
	9ndfOAscokv2PUmGEvyuXfeXjv9bUz5fGkvIC8e1ATA==
X-Gm-Gg: ASbGncvDacRtlutvi+TtaZguzSowYBd/mIsD9rRq77xuuMBLPazy+PXJq0IQKxMX/GK
	HNlzpwS52QhCzdsYvtSXj/0zY8XoGOvw6s/j9/8bv82e13xp638oCSM/Po0YdknCMJ7HU6iU1yl
	Eo5rU2TaiTk4CGNPRSfFdBoaZdTegIo1svL7Hg7dutXio=
X-Google-Smtp-Source: AGHT+IHH43p0qPfKtj3D38L9rrb9Pek2M3XXCtDSV7pxtgiYmdZWmLIORASeL7bRJw33PL8fU9QHGGRgHJcEcY5qb6k=
X-Received: by 2002:a05:651c:220a:b0:32a:8591:668f with SMTP id
 38308e7fff4ca-32adfdd88abmr40233771fa.31.1749558824159; Tue, 10 Jun 2025
 05:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com> <20250602-rk3576-pwm-v2-1-a6434b0ce60c@collabora.com>
In-Reply-To: <20250602-rk3576-pwm-v2-1-a6434b0ce60c@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:33:32 +0200
X-Gm-Features: AX0GCFuG7EFwJI0ElFjD6xqtEGmZqjqUSDaqvLfaNuSuiPY4NuX3iwrF0xr505A
Message-ID: <CACRpkdZKTo8rOUBDqqS6e5FPHnX83U4PfYQ6vsRxDVGEVNzJ7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: pinctrl: rockchip: increase max
 amount of device functions
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Kever Yang <kever.yang@rock-chips.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, kernel@collabora.com, 
	Jonas Karlman <jonas@kwiboo.se>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_053346_011188_74DD0A70 
X-CRM114-Status: GOOD (  13.17  )
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

On Mon, Jun 2, 2025 at 6:20=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:

> With the introduction of the RK3576, the maximum device function ID used
> increased to 14, as anyone can easily verify for themselves with:
>
>   rg -g '*-pinctrl.dtsi' '<\d+\s+RK_P..\s+(?<func>\d+)\s.*>;$' --trim \
>   -NI -r '$func' arch/arm64/boot/dts/rockchip/ | sort -g | uniq
>
> Unfortunately, this wasn't caught by dt-validate as those pins are
> omit-if-no-ref and we had no reference to them in any tree so far.
>
> Once again kick the can down the road by increasing the limit to 14.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

This  patch 1/7 applied to the pinctrl git tree for v6.17!

Yours,
Linus Walleij

