Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F79C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 14:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kb+N7KX0rT6TQGPdAoyZC4q4c2muk934hfkb7Zz1PYk=; b=1/knwFyjN6vfc4SFvd//ojW8wI
	SGw04rWMe4JcB6Fu6j34cnX5A+LiumSSowlnRHMqIeZm4RZ8JnCoAYbUfaxM5Bi0KlP8OLyy3ohyH
	/QfuI6LqGQ0oCMBvvHA/gloNqdtDcQKEq6kJXj0cuzORjiz3j12dQKlIy3WJJNGdv5a1XCtZ47a0k
	qVsYbsYbxksYmjw0SOu5GCUiYStIyUrR0InDWT+1iIU4NkUN5prFlsAxeOrdRLXJjH8Np/eGtP/SP
	KOlDGVCbApnoMPqZL8I3oYm0JbxHLj5Kp5k/eZYI+9tByQ+GbEo9fzooTYfuswJHLrT93VIx1meIH
	epDsalYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhjb-00000008dyA-1dsq;
	Tue, 14 Jan 2025 14:17:35 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhgZ-00000008dDz-3e47
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 14:14:29 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso5188391e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 06:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736864066; x=1737468866; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kb+N7KX0rT6TQGPdAoyZC4q4c2muk934hfkb7Zz1PYk=;
        b=ng9PmChdt4ZL5/ILk/LWax8wQ4rPBwTZ3hkWDthmCROVvfsjg3DkiJ2QWS6Cj6j6Em
         HG8834i66udsK3p2+p+BAhTOEHd2gPKhTAGvgxSoKVsq2RpdN9013PxLTOaHgTIHBmMG
         3Tx0BvKoXI/R1I4UERClN/AtrgeAJEXetGbApc5mIsBN0VZ8hkY2cCNLqJp/8m/2TSC7
         eb/a8VZ6dT1qbOqxMGdrzV2r0J1SRt8daSo+U/y6+nQRje8YVLqi3p/gg9pbHVn4Y7dQ
         DIWr16TquIf4waRhaVqvXxYhQLJ42/o3nw8jpCOxzUBouGbaXG2VS/2gwEecULVkJbuM
         /BTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864066; x=1737468866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kb+N7KX0rT6TQGPdAoyZC4q4c2muk934hfkb7Zz1PYk=;
        b=I6akdNKDDOY7cpdUXw8gocCT0+almRSAoVy7elUknzPyo9eAyUwYL4JDPDSL5ryyKw
         IhUNvkQMEPaPqJNDnT6J6982qLswllf23c9uJ8nSoa82qu0JKZ1LhQT4Ye7wConBHCtQ
         hI/8d5ZLrY9J5T5CDft3H3Vc/nLVGd9zpO5OBvUevF5Qzt4rmISPWWzMyCwmLfzj68KW
         pCcx2gKNU1bniirUuMLprT9MmSosk6Qo1nar9NZSXXWqPVYFRvQ1OJeQBWNL+TbFFFby
         fKVi0pxbt1Ce2639sn488zKFcEUy+27Elj75FANr1t721ND1xDqIfMGqb7x7kFCvXsIi
         /wdw==
X-Forwarded-Encrypted: i=1; AJvYcCX6OsmTfj8z/y8WG4WAlCA3mrNDCYspqZUHKDjVxo7W1YQg2T2ycclHn0cp+hHO27fF9sohtRwjCIsWNd/nizMQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyNZEzcsrgOQ6U69RkQd1vKzsW4imGuMDoRreMk6P3gbITsAQtw
	3j+DohPrYrD+NqjMLFdMxSFqYnvu3ezNITfWAGEb+h+DU0hBxVOmlSmFYdf92B/JII9BQRzZJKt
	zl0+QyitoDKR5pmY26DRXtahwPDfEiRXoi7f81A==
X-Gm-Gg: ASbGncv7iiICBJmeNemRl6XiFqeyjMaB057vpNF/ykFlHeISonOZq3iKs9PsTgwEU2A
	8jgjb64yukZrh+hyOSc9Hayxa9ymvD7kuZOpn
X-Google-Smtp-Source: AGHT+IGQT/qQTanY0VeTmw14H4V1Aaz+aOnG3UKuUwYfMTsXxCW542oDFqS8vWTFAvYHrASeV6/2sAbC1dUoPYmd1+8=
X-Received: by 2002:a05:6512:104b:b0:542:8d45:cb3e with SMTP id
 2adb3069b0e04-5428d45cce2mr7226522e87.18.1736864066034; Tue, 14 Jan 2025
 06:14:26 -0800 (PST)
MIME-Version: 1.0
References: <20250110123923.270626-1-szemzo.andras@gmail.com> <20250110123923.270626-4-szemzo.andras@gmail.com>
In-Reply-To: <20250110123923.270626-4-szemzo.andras@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 15:14:14 +0100
X-Gm-Features: AbW1kvZbpuLPblFhcOWb0pAf-vXkkjGwXrNgVmso7Oy8q5LSTsj10tRLuD4ySG4
Message-ID: <CACRpkdaz7ABO2QQwv1NFaPm1dOF_maO-bxWQdPNoYAmUXDKCDw@mail.gmail.com>
Subject: Re: [PATCH 03/12] pinctrl: sunxi: add driver for Allwinner V853.
To: Andras Szemzo <szemzo.andras@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maxime Ripard <mripard@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_061427_929768_0F15D021 
X-CRM114-Status: GOOD (  12.21  )
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

On Fri, Jan 10, 2025 at 1:39=E2=80=AFPM Andras Szemzo <szemzo.andras@gmail.=
com> wrote:

> The V853 family has multiple package variants, from BGA to QFN88.
> The latter has co-packaged DRAM and fewer pins, and less features (pin mu=
xes).
> All family members can be supported by a single driver, as the available =
pins
> with allowed muxes is the same across the devices.
>
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>

Looks good to me, waiting for a review of the bindings before applying,
but I see no problem with the patch as it's just using the core sunxi
infrastructure and any minor issues can be fixed in-tree.

Yours,
Linus Walleij

