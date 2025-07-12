Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D8FC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 19:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmdrDokSvSEbkPXVz0WTUYECUUDrY3dIue4l79myHLA=; b=mK1vrsTtCWn5AZGDI5qYBsgU2R
	5Hw/mUVVSj+Px7WsrYICutdlICw5N1nxmu32Ommw7IUWHkAlsApbqYU7jMiRnWjOFCE75k0vhrRMv
	V4lnFSHkRFyjLvrATTOpb78zbrKoRFapqSpwzNr/WmVorJJgfIxII7hvQe9SXUB5WB+7c2bYLlyg2
	qHb9+42bDGUWgI5jakoIuLKAbIQfuT0lcIh/YaeKn7gIFzYdONTR/TLAHRDJt4Qh9nfcGIjmbduRJ
	PqsOILjE7kA32WBNEmsFfq0QLatN6NpyS4uJVYJlbZZ/IXPLW6CTYWbdlayD30Y6PJMOaWEYVUbvy
	GTmKwPxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uafum-0000000GwR1-2dhr;
	Sat, 12 Jul 2025 19:29:40 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uafsN-0000000GwMA-0dKB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 19:27:12 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-32b7cf56cacso30551361fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Jul 2025 12:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752348429; x=1752953229; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmdrDokSvSEbkPXVz0WTUYECUUDrY3dIue4l79myHLA=;
        b=HP2cjJ7I6xyR2XfMoSH5ZEpb1MTqy08eh1+2OQswdQVopgErJ4nn/XPaLuM8i+33l8
         KdW8+HYWlB7I2zM8O7Qa87SMVb7aH4z9QReDa6GbbWFnQxMz4s0ZQRXxsLlNtUF6fBZI
         ys3/v+XsZUWyaOAhA6cqmLAXvJDUi9At5Zc1ERKEnvjwRZTTVapFDvaOdJERvPCOrv49
         EhWzco6zhEJxsgtBC+MnKvxsbhhNi9nqi2iR1dxlVOHSjAy9nPK/VTUvqf+ltPQ5kJrr
         kPQsJ3K92YjdyRS+6t6agHAVO/Syp+t8l8IH+Q21w/Ov+G8QnttLceTRXQ+ixIQP1HHt
         vZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752348429; x=1752953229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmdrDokSvSEbkPXVz0WTUYECUUDrY3dIue4l79myHLA=;
        b=Eo2wms0SFLnyFukxBiHLActiR1nwVG7lKLjz7iOsZACoAgf0NfgUqHRSaX1NrlOIhL
         1r4QMe77izMHs/yJqyc2w7IMfMf+HPqR7Z6ay2LuAItQjzpJFQpZZQwZomdY48CZrgbL
         9msiWuxPEFxn2ztozAIHDGU+aT3E44rwKikB60Kx3NMgRy0YvpidYnLdvzLNr/s2qLLg
         wxz5S2ZLIO7LboC2wukpMF/Y4A7tSSGpETbEJTE5LXkFiMTGgKJPDlzVTuF6ikGdY4hA
         nW7Mw94sIR9LrqVUCdLpDgS08M3BEywl9Wdqmq+umsU4wywdikXhH5ws8qLQZ8E9A32K
         8pZw==
X-Forwarded-Encrypted: i=1; AJvYcCVXJyD3xLjnoCuSk+w4L+8r0zoJlA8pWteBKoLF0X+w+GPopxBjYvWgovtZ3Yqpvc+ed515/T422BQrHuZNqGYq@lists.infradead.org
X-Gm-Message-State: AOJu0YzzvXXB2QYeK7Pjb/j7jkTNgyIbqRvc9Z3XQpxxa+hLi56SW/ze
	JcSeCPOOggmrnYCQKPVsqWIVG+I04TkJKIYXvf9KlUfM9s8Ay8ysFrno+8CeJOK8ZQtwQhlRu+9
	oo/7KMjtdJb0j8AUcY8FoPUea8HJcthk0p0OIncJwPA==
X-Gm-Gg: ASbGncsUITQnjp1dkXWWUYcEotZcg0EQDcxNXHVeRsblBS8gV/ANSoXiA3bkqyFXaD4
	LxL99XuvyyusUThO4CzLxgItLbwKW+TXEycd2jAVkr7GChNDJgovBoMgPcqEcGeTENk6LrlRXzo
	FGVxiysUgRs4iLc9JjWhC/VyWbcK1fxmVc8UxDWimKTg90rFFCU8Vgjq4UPk5jH9lyj4u01ZvHY
	7Wnkhk=
X-Google-Smtp-Source: AGHT+IEg/39vWPjh633ZUj8UqZLuNkeQ4zJb+DeEXqhdOGqkb2UzJv4loDelR2kMaTSHX23IkdKGCBQxVkP3ySeashA=
X-Received: by 2002:a05:651c:4ca:b0:32b:755e:6cd7 with SMTP id
 38308e7fff4ca-3305509f9c8mr19310751fa.32.1752348428638; Sat, 12 Jul 2025
 12:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250710002047.1573841-1-ksk4725@coasia.com>
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Jul 2025 21:26:57 +0200
X-Gm-Features: Ac12FXwfRBs5js5oSquCaRb4DKz10a2pVgF5CqiS_5Na7OWkjOlWh-jR8X6bLJY
Message-ID: <CACRpkdaxAr8i-AByUsxnBmoSNtEDvik3VFvxAzk525GD=pH97Q@mail.gmail.com>
Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
To: ksk4725@coasia.com
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, kenkim <kenkim@coasia.com>, 
	Jongshin Park <pjsin865@coasia.com>, GunWoo Kim <gwk1013@coasia.com>, 
	HaGyeong Kim <hgkim05@coasia.com>, GyoungBo Min <mingyoungbo@coasia.com>, 
	SungMin Park <smn1196@coasia.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, 
	Shradha Todi <shradha.t@samsung.com>, Ravi Patel <ravi.patel@samsung.com>, 
	Inbaraj E <inbaraj.e@samsung.com>, Swathi K S <swathi.ks@samsung.com>, 
	Hrishikesh <hrishikesh.d@samsung.com>, Dongjin Yang <dj76.yang@samsung.com>, 
	Sang Min Kim <hypmean.kim@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_122711_218938_8EDC82AA 
X-CRM114-Status: GOOD (  15.30  )
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

Hi Hakyeong,

thanks for your patch!

On Thu, Jul 10, 2025 at 2:20=E2=80=AFAM <ksk4725@coasia.com> wrote:

> Add basic support for the Axis ARTPEC-8 SoC.
> This SoC contains four Cortex-A53 CPUs and other several IPs.
>
> Patches 1 to 10 provide the support for the clock controller,
> which is similar to other Samsung SoCs.
>
> The remaining patches provide pinctrl support and
> initial device tree support.
>
> Hakyeong Kim (9):
>   dt-bindings: clock: Add ARTPEC-8 CMU bindings
>   clk: samsung: Add clock PLL support for ARTPEC-8 SoC
>   clk: samsung: artpec-8: Add initial clock support
>   clk: samsung: artpec-8: Add clock support for CMU_CMU block
>   clk: samsung: artpec-8: Add clock support for CMU_BUS block
>   clk: samsung: artpec-8: Add clock support for CMU_CORE block
>   clk: samsung: artpec-8: Add clock support for CMU_CPUCL block
>   clk: samsung: artpec-8: Add clock support for CMU_FSYS block
>   clk: samsung: artpec-8: Add clock support for CMU_PERI block

Out of the 9 patches there are 7 patches related to "CMU" without
any explanation or even expansion of this acronym.

Camera Management Unit? I think I'm not supposed to
guess. Is is an Axis-custom piece of hardware? (Would make
sense.)

Please expand this acronym and state clearly that (if this
is a correct assumption) that you are not supplying any
bindings and even less a driver for the "CMU" thing, just the
clocks. (That's fine the actual CMU can come later, but
it should be clear *what* it is.)

Yours,
Linus Walleij

