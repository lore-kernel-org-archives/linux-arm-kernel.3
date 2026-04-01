Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4179CD2ED08
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 13:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcIm7yXA7KDT7CpVTwgIEnk1FCyvBlEw6vFDxeCbDSc=; b=ojoyWybzRvFAFbA/f3woENWXKn
	t1qg4fIUQHGvgsN/fzgHnWrx3Q9bQnWOWDq+Q7Bm3c0vRwXtQLFmed7mhkDgrl4V4lrOd70SW9JJG
	/xleO8BbfOAk6+M84MMj4AMIcLCiKkU2F+hDuD5wNh6ytncMHBCCoAOBHOy5GB6/N3zrPetyEEY1C
	XN1lD7JYntx4spcjBkvwQMDh9jqw931wcFNMICFH7lHl89lCK7AKTq8U32rhcS2gjFNrEQTr2GXUu
	wZZMqFwtP5G9Yojp9SzoXTcX4wjhsQqxQfI96ZSsxcfLfRte+YuMtd7rbht2hvXHpQ08VrKYmUTRy
	iuB0BBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vbm-0000000FJ61-3qS3;
	Wed, 01 Apr 2026 13:27:46 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vbj-0000000FJ5F-31XK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 13:27:44 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-89f68634786so50954386d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 06:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050062; cv=none;
        d=google.com; s=arc-20240605;
        b=MI22V5MMnUnjpI0/lZUQ0FxryzNR6ojPw/EGMo+FW9fGC1hSrkkc6hxxj3XlUdEV/6
         r3nCb4e6EnujLTZAJ11xA1VaXwDNUB/c9oOQMpSYb51DGH7L66kVky3WoGKr6vqTgBvN
         NrjKIptBbxqya/+BLaXzoDl0ACdgo1PISkXcVYzmb6QQX79lPIvsd/KnHg2Kbwg0EU6X
         BqW9hKh6I686HQ1Ohf1iTdKiXWEtoI8EQ6oIJW/5bzTHaNjgyM2nu1D/VHWP+kPk54YM
         LiPyS3j39UhbvpCUi0Abh45LsxLB0hSPjTWTE3Apz3z7BOad3Hha0QdK2eb3RnoyBwsA
         lp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WcIm7yXA7KDT7CpVTwgIEnk1FCyvBlEw6vFDxeCbDSc=;
        fh=UZ016bNKFzD0u7BAseoD/MwSvCmSULvbYPUO97Pm8yo=;
        b=hS9nDnN+amiJZVN4D0nZxiUX6SGh/8ljpc4Bouqz+pVpJtK7kH+DfSdFRr3m4S8yJa
         YU8Jp/4QjgT9VLq8LkwnEJrTqWIXlNhSHcbl7eL8fRiWRF3XVyyPbPsGUNb6RHKUMqsD
         kAfdbVqzJKJcoIaUHrf8q/7qnEliLJt97s8CcR5qYCKs1yjFLh47+FcUdfDMqS9A80S6
         uHYXNw2XLVmFY+bte0x860i+VypwuOg+wIvTlB7owCkzPtHdKFYr1a2TPKfQqu2q7ASy
         54M59TloY0QLQPpLotUh/92p1STt//z6RRToT7LKDZxOGr0+iv0iPUskzYZVy6su3f/z
         2pMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775050062; x=1775654862; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcIm7yXA7KDT7CpVTwgIEnk1FCyvBlEw6vFDxeCbDSc=;
        b=Pge71w4FOiiX4ohyrDuf+R2TFVf/Vuu9oWuO68xK4ezHVilbLOTN5MroP+ZFBG6Z9k
         /Ui4HHkDc4uehBr8c26X/LaUfVG2WL8UMD1jdcwN0odjPd13P4cJFF1HjruZuE0wdFSt
         C+MXwJGz9t8lWAlVF0PIRGg7O7+As+yaybrzuI+tfuwwMmKVeXeYxHPSEE72jQG+rvYC
         mQCL3r3BIehDd5+D4Gigw3JRZ5oWxL8iOTghZhl4MSrIjBwnJit/b9qSgS5hFg74VSqd
         sEZBPpFVM+y2KILrpw8SfN8gu35VDsdJcgO2+8R2EPPPOjxP/ESJdnR+ijAEpM1Xc/hb
         Dhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050062; x=1775654862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WcIm7yXA7KDT7CpVTwgIEnk1FCyvBlEw6vFDxeCbDSc=;
        b=UVxl1vYs6cAhttTCL1f4MiJKq0+QbY2+lqhL7DTjcA45JF9TdPz/hyjTv4ZXVUNnxb
         NW3jS0vqPp757m30yddiSTxkw5nG3J8eHS1UL7QdyrLC/95wKmCwmLvH2BKFtbwIpDa7
         TuY1DEY57mcRhJiCjyQ5+BBU7wdZKJjcd2wdQv+HAyYeJ+6SQ/h02EjOThBtnDL60WAR
         3WEmJ+Jl2ZelJM1WbnTBw7DwGVQw0RpbnC1D2zAz6CgCQj5eIw3nD/625ePhP22h+kQs
         uySYNcNj48huGsESMbiLpnyhlEsTBaiMNGRlAcASbMqqldpruQulkxQKxQsypKAN5cbv
         i15w==
X-Forwarded-Encrypted: i=1; AJvYcCVlGj/uJhsbailiB9yZr2+dul0spXk0dDjLM8tdgF7ci382jVYHuqCO4gzRKjaQ1HgQHunOiNbqO4xDFHsadCWx@lists.infradead.org
X-Gm-Message-State: AOJu0YyrH+aWwwKmiNYMOj9YN0+21RqKl7fLZHRpUEZyHKE1NllU8JaS
	XBSsQP33XpmPPmkztSqbbfh9NMpDSxQcH9dHUVLg2TTNgaVYNMgs8k63YO+5gGba1m9nkpTMtjb
	ooc48sA1lnGv6HmlZTZA8OEf0JCoDQ7ZvE1zGUyYRx8Vm4wyOTevMHJozP7zDWfU=
X-Gm-Gg: ATEYQzzzZcAOATje+dHINI3j7Ny+wczF1Md7D9vq07uHwMCcAYoiT6IXUAezflMy19R
	5m4Ikn85NiZ/zNr0DiKSirlRDjaL20DC/w8sYE0AKQtGM8hKhdEm2GLV9ViBE/uesAvNoUGuZ32
	6WUGygM2vhVdb0NTrUUGPnwSzq7C41gySy/JB0MmhoZ7dolKRtRFL5THQuSjYhHmpPE0U0PDFGi
	dtvqhx3Em2AZXzHhUTBSBdoGd+QbJz4eiUZ88GmHt1VBwq9qJyCYKv0tziAciTJH7TKBwzUft+T
	Gu5xG9d//16tbX3JgMOm5eYjL+ej/RzIOtkNUSi9mZvyCYF22dSMZQ2n0DlMtCdDA4TU3Jk=
X-Received: by 2002:a05:6214:2dc7:b0:89c:505e:a96d with SMTP id
 6a1803df08f44-8a436c12006mr53463596d6.3.1775050061865; Wed, 01 Apr 2026
 06:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260401010707.2584962-1-dennis@ausil.us> <20260401010707.2584962-3-dennis@ausil.us>
 <b733883d-e515-4946-a81f-d1a595985e01@lunn.ch>
In-Reply-To: <b733883d-e515-4946-a81f-d1a595985e01@lunn.ch>
From: Dennis Gilmore <dennis@ausil.us>
Date: Wed, 1 Apr 2026 08:27:30 -0500
X-Gm-Features: AQROBzCAzbfR_j_LOy-RUvYwgZyU2IUXkEObV_iLNc2MeYTFQXYM4pLFScKB5fA
Message-ID: <CAABkxwvnv7i=xg53qu4JDapBs6ATaMGh9iXZfi+od=CCxRxQUA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: rockchip: refactor items from Orange
 Pi 5/b to prep for Pro
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Alexey Charkov <alchark@gmail.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_062743_794635_D76656AE 
X-CRM114-Status: GOOD (  13.19  )
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

Hi Andrew,

On Wed, Apr 1, 2026 at 6:52=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +&gmac1 {
> > +     clock_in_out =3D "output";
> > +     phy-handle =3D <&rgmii_phy1>;
> > +     phy-mode =3D "rgmii-rxid";
> > +     pinctrl-0 =3D <&gmac1_miim
> > +                  &gmac1_tx_bus2
> > +                  &gmac1_rx_bus2
> > +                  &gmac1_rgmii_clk
> > +                  &gmac1_rgmii_bus>;
> > +     pinctrl-names =3D "default";
> > +     tx_delay =3D <0x42>;
>
> phy-mode =3D "rgmii-rxid" means the PCB provides the 2ns delay for
> TX. This is unlikely to be correct. Please try "rgmii-id" and delete
> the tx_delay.

As I mentioned to you in v2 I do not have the affected hardware to
test any changes. This patch is just moving the existing definition
from the common dtsi to the two devices that  have gmac1 wired up. I
am not comfortable making changes here that I can not verify if they
work or not.

Dennis

> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bi=
ndings/net/ethernet-controller.yaml#L287
>
>     Andrew
>
> ---
> pw-bot: cr

