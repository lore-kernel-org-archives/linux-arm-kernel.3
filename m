Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FB4E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3xDxT4wRLdO9sVfi+qzznU4KwqN9oaA0Ye/urJkYm0=; b=mlbYDY3TreyMqX4PpHmPWM7ezy
	r5dBznR4C86qecYlnpOgd+q8zrLLWtoy1UQO9FnNY7Dgw3na65R6C55hKsx7ZjsgOt+qDzz3mTVNb
	tGeIjtlh4+5kfVozT1Yc4RSqNmLIYbxRMurFJTiQbes+xdxoDFZftnVO4GLQZUqEaFPi37PGThR83
	0sIObTGOYSZWPQgSsMt9LP8g/RE9ud3FsMoHc9uaWyohByUSYDUNTcOx/q9wdygVrdxyfYXojLAs+
	DSLLFc6gfep3C+VqhPmFgtEiU9d4D/Q6u3I8d8edUJRNR9Jnmvp9Mj1FSjBgvGqi3Fp7g7ZYirtO4
	B6zwdY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcOX-0000000DX2a-0mIi;
	Mon, 22 Dec 2025 09:40:01 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcOU-0000000DX1R-0N1e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:39:59 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so2228440a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 01:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766396395; x=1767001195; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N3xDxT4wRLdO9sVfi+qzznU4KwqN9oaA0Ye/urJkYm0=;
        b=YFGQh6M5caf0vmucLhdNaiAiFDec0GozcyzIitqdAtLC/nQrl0QGNwoPbjudH7QAit
         uMSh8BJH+Las36BKLB+UFjUOx4BaVyV7L2aFktC5q/V2K339NGwigdRdHWAvQxI63U7U
         10Urwzx6LeNgeAPLeasIkeJkwGD1V3asZANfJq2O7XgkJwikD9q83EltmR8bnDo9vVwS
         YGGIOxZ8gS8MBZ9wxQDNPVVetJvl4JR+FzHa1ailVv4I3OBG0mw5hzKDgsER+nkYGjYg
         HMWtYZLXwNPiCeUJg1E4axBfG0z8qJqNr+w4x7u59dyPbtek3k8ft4bNLkgPTwfoGO1T
         nUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766396395; x=1767001195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3xDxT4wRLdO9sVfi+qzznU4KwqN9oaA0Ye/urJkYm0=;
        b=CyjjkAPotD7vsOia2XKnl6zovPEcwH/EpFiqHyOga8sqY8vZKI4oFlQjeMa9vylxX/
         QF/eIbnAZZWDbUMxSVSVybH/lkaGukrNZCatHJBSsifWer5va2KuVS3zzbbfsdcBAJDf
         /u47GuquELzy0HB4o8tfjYYxEKsI2za2acdVhtHjP7itmMyAeBfd5W9gvNeVh3/Cw7HP
         r4Eo9PKW6AASfgBFTjTpd3ww4IbAeOVwmc0Cd9JQp8V5rnChD0NR4RZxk3wFTJ1iZHHe
         RtvySQ6nh3amV3FIzqbH/1zw1N7ccZq07mllJ4lcxldMB3blnpazRY4p5a1LeKiYgtZ7
         KRRA==
X-Forwarded-Encrypted: i=1; AJvYcCWcIOU5MmPOy4yVQG3Atqpim9v7mWrsejMdH5RN9bDl4uZf7TfEcVBzoz5XrrTHxt7NKHWdzA2Q+ljmvoowDlSU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1ccq6juLsWmhlzDHOYPPexIU/lEns4fr6/CW+RjNLSOmSA/aJ
	MWno3e/3dLM1Mz8Z+h+O0EouLEw9AjR7da6V1VbcrTNPjFFOOoZqf5beTT5wxA0osWSzzZpCdyS
	ae8kbt9EPI40INt1SkrlUtBqy1Xx6byaQdGT/ymmdDQ==
X-Gm-Gg: AY/fxX7faRCKG9DZVc2YXG2iH6uxLJ7j4EId+tl/Wb/ZbtrZpiWE9zrq8fIf4ftQXRM
	mAb3XklPQ+6R6E1s8mbHUvku/n0sSiIfb/GJS872Nqkf2XQvfCiSaLHClGu0RVx9j9r2RUyFsnK
	cBaUuiIaf0W8e/592TlUIdmIqUrs9ytBCe3sMi5Yxe0zl5aMZWvTnJq3sBd1p8NkHfwlpwjzY4e
	saxTc3UCOvesT0Azez4VtjIW7C6u9aE7o2NIs3a4guq5pAk9HCtCBeOMh4Wbpu0vacdog==
X-Google-Smtp-Source: AGHT+IGPSwnqIzk14b53jhsi0LLKrWwl4Jdj+i+v0Qtc8GexQDbm48IQKNXUeCL0o0600WDhojcpvCkUpASsKgmBQ8c=
X-Received: by 2002:a05:6402:1ed5:b0:64b:7885:c985 with SMTP id
 4fb4d7f45d1cf-64b8e93c197mr10800970a12.3.1766396395392; Mon, 22 Dec 2025
 01:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
 <20251220-automatic-clocks-v6-1-36c2f276a135@linaro.org> <215eb434-683f-4cf2-9bcd-0860991ae23e@kernel.org>
In-Reply-To: <215eb434-683f-4cf2-9bcd-0860991ae23e@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Dec 2025 09:39:44 +0000
X-Gm-Features: AQt7F2p0LonyB7NCXdfWFQondzzQDwR97Lxzguv-wlpyW3em81jQv8hflpu1MCU
Message-ID: <CADrjBPoWcONhJJdCeovkwQ9Oha+t+dpHY_ohKPV7BQS1tougGw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251222_013958_526009_539C5102 
X-CRM114-Status: GOOD (  28.26  )
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

On Sun, 21 Dec 2025 at 13:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 20/12/2025 10:05, Peter Griffin wrote:
> > Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> > that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
> > The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
> > bus components and MEMCLK gates the sram clock.
> >
> > Now the clock driver supports automatic clock mode, to fully enable dynamic
> > root clock gating it is required to configure these registers. Update the
> > bindings documentation so that all CMUs (with the exception of
> > gs101-cmu-top) have samsung,sysreg as a required property.
> >
> > Note this is NOT an ABI break, as if the property isn't specified the
> > clock driver will fallback to the current behaviour of not initializing
> > the registers. The system still boots, but bus components won't benefit
> > from dynamic root clock gating and dynamic power will be higher (which has
> > been the case until now anyway).
> >
> > Additionally update the DT example to included the correct CMU size as
> > registers in that region are used for automatic clock mode.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Changes in v5:
> > - Invert the test for google,gs101-cmu-top (Andre)
> >
>
>
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
> of patchset, under or above your Signed-off-by tag, unless patch changed
> significantly (e.g. new properties added to the DT bindings). Tag is
> "received", when provided in a message replied to you on the mailing
> list. Tools like b4 can help here. However, there's no need to repost
> patches *only* to add the tags. The upstream maintainer will do that for
> tags received on the version they apply.
>
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state why and what changed.
> </form letter>

Apologies, your tag should have been added.... got kind of sidetracked
bisecting the linux-next regression with the serial console and then
forgot to apply it.

Peter.

