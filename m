Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA0BCE8E6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3x/Yzqr5rOkV6VpVIRWrECyDD+bnzjGWzKCC9ld0xY=; b=KMpxNnrWtNI9FZHMa384cW6Tm/
	KRwoVhfjSRyx+lh9YkZROSsgyrNCBHK4KRxZxqPQttCEedYhaTxeclCs0uv+IEPtT9usqBNUNMzmc
	9ZfUVCZUDr5fkrn5aAbyHiG3n/S/RH4AnZ0QkPJIsOkMhMgzTZ7JkSjOfmVa+bkf2A7eA+QHfuEPf
	4OeHfpFYZIs2CvZv2hKGggMsW8b5wHajlJuu/E6F76j6REarUaAuDAreG/iCiZLwv9ltmLfnBYig5
	iy2KxdHEeKam9UYkr8B38QmZUV+CwMcNWqdaN1KR8MogSMjpunFquXToT6xNjtT7jLnMrDMBMnYCT
	owJn+xQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41xM-00000001LKt-2gUQ;
	Thu, 24 Oct 2024 17:49:08 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41bh-00000001HTy-1oRl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 17:26:47 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539e7e73740so1102584e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 10:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729790803; x=1730395603; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3x/Yzqr5rOkV6VpVIRWrECyDD+bnzjGWzKCC9ld0xY=;
        b=PENpjwo78OddF7OtubRQmyUhqpXO7zocvbvJoSh2IbBB5+XxvYMVMG17rWQHKwKFME
         2vDkRjUl3WFeTDge67Xag/SPh90K1g49coPeud//SvJRzPAdXCAQNnB6BmWXp0GH2v+b
         Lqwoye30Gy4E6uTv4EqJ/OdlSEwom0x22vnMKDdUv0DDH3gIeSb7mw394rFHWAcdMZ3+
         vk8Bf6PT1arwp+L4z7t4F5Ve/UF0mA8t0pSHuJlGZ1016h8HZt0W0hHpMCC62UWDnE/L
         mMPmvuJKBL/751bxw+yK4ZjCTRwa4nzvA3kdbCLcH4X0izA1vDVhY24Hz7Lo9KX0j7Kn
         ZMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790803; x=1730395603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3x/Yzqr5rOkV6VpVIRWrECyDD+bnzjGWzKCC9ld0xY=;
        b=Jg/Cc0fdXMkcruQWnSae30H/+sfZqO0ijAXuiqINJgQehx7LotIQRfbz3rcafmv2bU
         fTZZrJHRG5UuOzAJbJooj04OmtEUvl3oeJwV3RgtyfYpMkocgUcvRmQ2nTjn8DnIoL92
         x4Yiq+SB6unanEZWBATYcQdjzXcIVhuUJ6QkpGwCZLvt0fKKofqJ+5ecb/QySamLmb6w
         irO5+8Js/Bk02sT9pu92wi2ITTHzfeSpycIaUn/FOBLjIUS2gzcFu/NF6prgo8+3j6LK
         jUddCZiCAqs6WNKpQIdOduWiBl/d0oEw75OWBBUpQWJrW6IKeR2CAbXcNmiZV7pAMGVS
         vr0A==
X-Forwarded-Encrypted: i=1; AJvYcCWEIjcvkXzfl6vRD6OZkx3sul/a0IKcOi6hDikpxVz+ZrHo3ixHGZpn+whf3xW/UfHwtwR8dfoXcPwDFTfhtkWJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ9YJXbgh/g/Y15/npH+bV6jqnaZduR3L7Fs66xAKSur8BIzfN
	Lm08QSI5AqYB1E+qPO9uWwWvpVXgsA7Vme5MS5zN29YihC8opQrq6Fuo+qqnOpr9hXISX3+fH43
	C4njj4LuNj9tOVMjRKrI3RpwoS38=
X-Google-Smtp-Source: AGHT+IGRxl832jNWkv4G/j5EbOky9Qs4+WgynnzzESmftSbrAVOpsaZoETsc+U+/YcqbVeYhcE4fW5L3Lrc4zeMjs1g=
X-Received: by 2002:a05:6512:10d4:b0:539:ebe5:2986 with SMTP id
 2adb3069b0e04-53b1a2fe4f1mr4269898e87.12.1729790803049; Thu, 24 Oct 2024
 10:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241023091231.10050-1-bhavin.sharma@siliconsignals.io> <172978739819.623555.106741073057492931.robh@kernel.org>
In-Reply-To: <172978739819.623555.106741073057492931.robh@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 24 Oct 2024 14:26:31 -0300
Message-ID: <CAOMZO5A7Erks3CHh97AN-XP=Aj2QBUcikAT0ijxkGEchqMfWVA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add support Boundary Device Nitrogen8MP Universal
 SMARC Carrier Board
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bhavin Sharma <bhavin.sharma@siliconsignals.io>, 
	Hiago De Franco <hiago.franco@toradex.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Michael Walle <mwalle@kernel.org>, Tim Harvey <tharvey@gateworks.com>, 
	Parthiban Nallathambi <parthiban@linumiz.com>, Max Merchel <Max.Merchel@ew.tq-group.com>, 
	Conor Dooley <conor+dt@kernel.org>, shawnguo@kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Joao Paulo Goncalves <joao.goncalves@toradex.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Gregor Herburger <gregor.herburger@ew.tq-group.com>, imx@lists.linux.dev, 
	Peng Fan <peng.fan@nxp.com>, Mathieu Othacehe <m.othacehe@gmail.com>, linux-kernel@vger.kernel.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_102645_516735_9826B874 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

Hi Bhavin,

On Thu, Oct 24, 2024 at 1:33=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> New warnings running 'make CHECK_DTBS=3Dy freescale/imx8mp-nitrogen-smarc=
-universal-board.dtb' for 20241023091231.10050-1-bhavin.sharma@siliconsigna=
ls.io:
>
> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: =
/soc@0/bus@30800000/i2c@30ae0000/gpio@20: failed to match any schema with c=
ompatible: ['microchip,mcp23018']

Please convert Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.t=
xt
to yaml.

Thanks

