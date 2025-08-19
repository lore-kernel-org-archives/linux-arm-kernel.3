Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20536CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vpgl7WyLFrS0C/ZYYfn6MwQ/pZnCOwnJWShlT5q+tJ8=; b=LJQdSof2bOjxcGyNNKWf6rUF/v
	PykbXqFgpPva4ohELbRD3DzO7nnE6z4zXitHuJpG1f3GC8oibMt9sWm+Tnd++y24on+Mcj9HswPcw
	z4pXXrAxKRljM7jIocTFAb7CpTWCV7dP5WZPB1eC2vJQoDNN2kWjnm1SZZ/CQs6LBKQOEl0CSfE5d
	8Grs5ezpEhXqA6yJBlTKrduzSdXgBAU5M55mycqcdCyqDmzXUbf0ABiBxfPNRXGrPaotzQW02nhNt
	0eaCBI49Ut2DYD2gryXzzla5iHPHswcusy6laAyD1URydlTx+TuWunlGE8OwfRUy0ylPUt3Q4hqGc
	2Pq5DYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpV-0000000BBys-1Sr1;
	Tue, 19 Aug 2025 18:13:05 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMAb-0000000AYcW-2RYy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:14:34 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55ce5253a57so5483378e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609272; x=1756214072; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vpgl7WyLFrS0C/ZYYfn6MwQ/pZnCOwnJWShlT5q+tJ8=;
        b=nZ21/FFz7GZ7VK9MAnDnOaYRtArn9CEgOKQYiXOcp1rMzYaqRzmwMYzN2Ju2vvmN3A
         LKa5+NrTgfx+tTpzdtL2stdjoPJKF80mIQOhg9wnFF/UfWU1noZJCO185HF2eevJWcqY
         WoUuk7O7w4NKHt1mDVLmauyKrjBg7I9jxa1IE4Bn1puhsPShomr/a+dAStHVdeO1ZYlm
         Z+aSFc4OBygiy8UP7HHR0IbE47SfeeHjgwzD+XZh7NvSLgoat3Y6hfkU1TsKU6+N2aTa
         wNOo3LJQtPvcsTohdQZS+wEEITmwQUR6lrb7Ru6flB8DMqmVwbaNF8OyYKllGwUo3yz3
         kGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609272; x=1756214072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vpgl7WyLFrS0C/ZYYfn6MwQ/pZnCOwnJWShlT5q+tJ8=;
        b=VbZcXPHp7jnQqWT5FqLlPgi3z/cRQZX7HlQqPNDxfXkgLjBL5H3j4GhHByFZxTnflK
         LMrlPL76vzUSqlJJZ1kiUsnYtZWmPkpsYVRt0DPTT7rlMq6KKCrtF5xcAN6MpSz35uBm
         5S/uudVemI5OsYEcI2WsI0jdE0Lper42gEcaddoNfkgXhc7UJCi8qbKfGdjVAlC4dslZ
         wof1g21DSmbyrlMGO7jfqNliRwsVjeydP5ErF5gjvsEujRx42AfIM8fZzYo694J6FAs5
         C16KoZdmnxytjE2Q/hcWl2qprUmbPbOSK9pPn1d7dqA/exWtldxqi0vz61xdB5DZzKfW
         z/Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXfrM4FMrh0yNfEZrQQTpTc+apTj+ATLd3AA9iuLJ7UQo+i7hn7ix44gc85Spm4HWK8XqxjFDjEclfc0Zu29XLw@lists.infradead.org
X-Gm-Message-State: AOJu0YyISMfHUjwSGtT1FCiSytl6fDVuesHefgYQ2VV+YpPjXy0iBreX
	BKTUOXJ9kZGxHxFZEcshpOjcgPUJRzKiOugNpRuwmPQ3gCTJh9gTL94TrO7rRPtkTKQ0MDRebJz
	YdJGQNBd74YQsv5ytkpCl+0O5b2dK21zJV+yfl2N0uhlzoXfd2v91wkD14A==
X-Gm-Gg: ASbGnct7aNi8nTd833jNg3y6UuUbFB2gxEwgZyCTWZz1uKHmCjA2+wIQBOzWZslIEr/
	UD1/PRUBbJmTZUcgavqP8l+eXbaCay4m4NqIcw88X8+QxQLGAC2n14Oy58Egp91KSHp/HhFYwbd
	PzlyjAoPYo7tm29shywMemjT2mQiOK6YKgMG2mCydn7x0tk6V/vY/YPtz4Hnt25EP+SvVU85SNO
	YdWh4U4Xre8
X-Google-Smtp-Source: AGHT+IGCM1KzCADYv+7d911GPZZod1EPaNXRqTGrmgy/nj7uWJIDPQDYu8S6SC2inkRC3koGoFDH6NusO/qUGRi2QCs=
X-Received: by 2002:a05:6512:3b89:b0:55b:7bbd:672d with SMTP id
 2adb3069b0e04-55e0086f09emr1019476e87.51.1755609271646; Tue, 19 Aug 2025
 06:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org> <175529260025.3212383.1843651240268969923.robh@kernel.org>
In-Reply-To: <175529260025.3212383.1843651240268969923.robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 15:14:20 +0200
X-Gm-Features: Ac12FXzzR-dQTCGYXpk2upb89TzIiA9ngfM-ksyz3QF34dZzwFe2pZdcL3v_yBw
Message-ID: <CACRpkdbB=uyNhvr1VMuartWif0PuQ3uH2AOEGgvdReESO8EMzw@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: ixp4xx: Add device trees for MI424WR
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061433_622915_B2FDDBE0 
X-CRM114-Status: GOOD (  12.17  )
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

On Fri, Aug 15, 2025 at 11:19=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/intel/' f=
or 20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org:
>
> arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dtb: gpio@1=
,0 (brcm,bcm6345-gpio): 'bank-width', 'intel,ixp4xx-eb-write-enable', 'pci-=
reset-hog', 'pstn-relay-hog-1', 'pstn-relay-hog-2' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yam=
l#

This is an error since forever: the node is on an external bus and the
external bus while
defined in:
Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion=
-bus-controller.yaml

Adds properties to any child, which can be any MMIO device.

I don't know what is the proper way to solve this.

A separate include .yaml for the children and then pull that into
every possible device on that bus?

> arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dtb: /soc/u=
sb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc=
']

OK I should write that yaml file.

Yours,
Linus Walleij

