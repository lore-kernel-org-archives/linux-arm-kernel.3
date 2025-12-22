Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96B9D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 10:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGX6q1EwizBQuQDLpaywg7mzFMLwjK5EiQRcSXh1QdI=; b=rKgU4VD5nnkJxZ49/6Ce+6S1es
	cmcIRDtaVDDNhmTpDUlgpelrDfSmB8+QUUq85ROv6LIgxQQtOxdYIytFxVre2TGJ6HQ7YAeUHmQr4
	nmIpvImm6WWwe4IX3jYyf1W0yihNCOgIvAT6/VOg7/GMO+QcxWCcZ64jM1CXNFnwss6yEG8VaPb44
	b59Q+UTMxDuGEjmvN00qZDMCFZB7+2HYfDHMmLpB1mxMoGAPbenNCNwSX62bqf3s1KoEDBXaTsNPg
	SMxOhioSd6+s6O6fpOBSwnkPrird0BYgp7Q6XeE1g3BaQVj0RFm5DPgmQll8xIQ5Tj8W+YllOQCkJ
	od6C8N3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd2D-0000000Dbns-208p;
	Mon, 22 Dec 2025 10:21:01 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd2A-0000000DbnM-2iXY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 10:21:00 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-64b4f730a02so6015810a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 02:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766398856; x=1767003656; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IGX6q1EwizBQuQDLpaywg7mzFMLwjK5EiQRcSXh1QdI=;
        b=sbf86AhA8y7qvFLI62cjzDxAYlXAXB1JqkdpXJQieVnsA3v2R4XPEPaR5J9jI2I6Op
         0H5UAUDhBqRblEKKovN+gPtt5FY1Fz71A828qtO4EcPtHa1175s+KYUGDVoXUv9TI61i
         UffCE2l0Dd7xIYvNbAwmqDVOKHzh075LVcd7KCfrBxb0oWkLbDiBexautBNVVBDuoYXc
         m8HnvgC0KZpJ317UkyEo40DzbsmtQ24W+a4mWXLcwZN3JiE9p/7s6IiRXjUAI05oZEAo
         G8nTnyrknnYEPy1naxs1UdIoaTdTPUIhPp/3ZrzfIBCRTX1g2QqoAxZiHKvXybtfuRJf
         iGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398856; x=1767003656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGX6q1EwizBQuQDLpaywg7mzFMLwjK5EiQRcSXh1QdI=;
        b=D2UlJ5ee15YHXfQyZWRif+qKGInTa/f15E3nJs3NqST1OvzvVaf2x4m/hMPYhiz1qk
         m43VYMZV8OiW1PLcT49jpbIyqhGl0ePfUyhXiyf2UXx3BgNKP0IiaU76xcF6UcISOpBm
         gpnNBoiRxkdiH+zOtQYLw7xfEWcxC5FoWFUVYPq+FO4Dhl32KQZpiX8HVY9A5hW5cmYd
         hrye1b+/G0Kd52+DYhLPCJu2ranNPMA4eJ1tkbOMcq7TLlvLmcqIOngZZtCq1E385tSQ
         6Dm4hqLCqz24qvtfmwMdSy/NfVLNQ/60AvgCTuKqXrjIWDvFV3vQ3YI5c5c33uvqBpHV
         ABeA==
X-Forwarded-Encrypted: i=1; AJvYcCUgC5RiT3hVRCdl4az4AxiXOidOpOyycW8iKEEF2YwgGXtMEfOOPkaAs3+W1BDGKRSEP25oBdbnv2xVX5GdfJ1d@lists.infradead.org
X-Gm-Message-State: AOJu0YynSI3lAJv4C2Th5Z6tQIj2fdkiprl9tWK1rd4BAAEsLzThA80v
	ytDgcN/gX/T/HORulob/mxZK2nsF+TB7xPdBrwnFWPomctozqIekg/jlbogGZzn8jA8msxY3KsU
	uLWECdvhDrRT6xU3kybcknQnAJOshR9w099RY8b/2sg==
X-Gm-Gg: AY/fxX5PKoyAanXwomgvM36emm5zYJnpzFKDIkq4hlvHj2GRnTNPHbd6W5RlT8534iM
	MKP9OJGfaruyP0j/XMTWT5Mr2YsQ0WcT95DQLbSbKhaYzUhR2EaiX1IlryBqDXNyg2pbwFQ6/9W
	6mFdXRqgt/YMxTK4sJ/0NYdqp7KXQXqZR+541Oz/LqvGFOkcNmjnTcRNivkhp/HA4+YhkUWrJDZ
	ZK6Qf2qAvpoFzLETPVrmAHyOrCOGcWkHXwz1AnlcPk0jLDWnpPXNZR56Z5veULTjHHHLQ==
X-Google-Smtp-Source: AGHT+IEqXEGu9cvltqcnQjyMesMjaoRtKgOECBN5qmN3T1OJaLoUGgTcyks/ZkPJRdcjfHofOWpRzwLbozye182dWTE=
X-Received: by 2002:a05:6402:3591:b0:64c:69e6:ad64 with SMTP id
 4fb4d7f45d1cf-64c69e6b268mr7653426a12.24.1766398856513; Mon, 22 Dec 2025
 02:20:56 -0800 (PST)
MIME-Version: 1.0
References: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
 <20251220-automatic-clocks-v6-1-36c2f276a135@linaro.org> <215eb434-683f-4cf2-9bcd-0860991ae23e@kernel.org>
 <CADrjBPoWcONhJJdCeovkwQ9Oha+t+dpHY_ohKPV7BQS1tougGw@mail.gmail.com> <d7a749e2-1d00-459f-adbb-0841190b7849@kernel.org>
In-Reply-To: <d7a749e2-1d00-459f-adbb-0841190b7849@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Dec 2025 10:20:44 +0000
X-Gm-Features: AQt7F2okhEmetfhP-OZXD27I-iFbBBEDggeAe_X29tbibS3bKuDBCabzrOTR_5o
Message-ID: <CADrjBPpv9OB5zjsE=+dUyZCz2xSs6XXWkpbK2qbFAdUyTaXXhQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_022058_710723_0AB92E20 
X-CRM114-Status: GOOD (  30.78  )
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

Hi Krzysztof,

On Mon, 22 Dec 2025 at 09:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 22/12/2025 10:39, Peter Griffin wrote:
> > Hi Krzysztof,
> >
> > On Sun, 21 Dec 2025 at 13:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 20/12/2025 10:05, Peter Griffin wrote:
> >>> Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> >>> that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
> >>> The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
> >>> bus components and MEMCLK gates the sram clock.
> >>>
> >>> Now the clock driver supports automatic clock mode, to fully enable dynamic
> >>> root clock gating it is required to configure these registers. Update the
> >>> bindings documentation so that all CMUs (with the exception of
> >>> gs101-cmu-top) have samsung,sysreg as a required property.
> >>>
> >>> Note this is NOT an ABI break, as if the property isn't specified the
> >>> clock driver will fallback to the current behaviour of not initializing
> >>> the registers. The system still boots, but bus components won't benefit
> >>> from dynamic root clock gating and dynamic power will be higher (which has
> >>> been the case until now anyway).
> >>>
> >>> Additionally update the DT example to included the correct CMU size as
> >>> registers in that region are used for automatic clock mode.
> >>>
> >>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >>> ---
> >>> Changes in v5:
> >>> - Invert the test for google,gs101-cmu-top (Andre)
> >>>
> >>
> >>
> >> <form letter>
> >> This is a friendly reminder during the review process.
> >>
> >> It looks like you received a tag and forgot to add it.
> >>
> >> If you do not know the process, here is a short explanation:
> >> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
> >> of patchset, under or above your Signed-off-by tag, unless patch changed
> >> significantly (e.g. new properties added to the DT bindings). Tag is
> >> "received", when provided in a message replied to you on the mailing
> >> list. Tools like b4 can help here. However, there's no need to repost
> >> patches *only* to add the tags. The upstream maintainer will do that for
> >> tags received on the version they apply.
> >>
> >> Please read:
> >> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> >>
> >> If a tag was not added on purpose, please state why and what changed.
> >> </form letter>
> >
> > Apologies, your tag should have been added.... got kind of sidetracked
> > bisecting the linux-next regression with the serial console and then
> > forgot to apply it.
>
> I think it was more than one tag, so I decided not to look for them.
> Please send v7 with all tags collected.

Sure, will resend shortly.

Peter

