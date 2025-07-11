Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E84DC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpWDwlYEFZONP4nYRAFW848J3k8ajKrSnxZeLFk6ATw=; b=KN09wWE9S38VsWmzKXTKTkIIqB
	9BcYqkbCGjYW0L+z8o6BT73O+CuOcx9uogOEl96zENw+5XpyHSZEDXgpTuYkyJy327F2Wgx17LSMI
	Ma1xxMv2LtAPYugh7w3yloL2bswZcBDwJTydTh0oT2JRl9jt6VW6E9lqMkj2hsFRT9l6tDTuwIwRN
	KSeqV0WANpw18u6Ec9xvK2EvzEK/T2TfoNk1sjLhHVid2VTQEeW+7+E8u1LwWKnHsh8o0fAbliQyc
	TdTtTvIvsTYoNDJoGV3+pmkgSDtqSrM0kqHIFGSBPjIFcr5omYQaxjbGL2Rdvm9HDXtUhpnuSeVh0
	C475nZpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGmL-0000000FJPY-2xQc;
	Fri, 11 Jul 2025 16:39:17 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaG0V-0000000FCDA-2HUo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 15:49:52 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-40b31468da3so710815b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 08:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752248990; x=1752853790; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kpWDwlYEFZONP4nYRAFW848J3k8ajKrSnxZeLFk6ATw=;
        b=Akok1LwbFz7IHAT+5RFX/sVqvKu8PWLH646L5HC959WkQiG6d+b66GYM2emx9a0lD/
         hffDYLXre5MSAJo25x9XhnWSwbaJ/qIn8nWwS2Ata0AxxWtDifPs7SnX13+DkNDjBUEQ
         puHZcVdMiBFwipOSQ+BhhA0KgYm/rQJ48l4qrTyW4HDcxwaXrtu277Vo4g7HAwJV7aa2
         Fw4h5UjTtSbuR3l7Ycx5wSgNsENS6Y64RZC/pi2+z8fvVBbE1S6mwDQ8kp6gbAR1fZfu
         eWU/KVOmGnjscGYLPuz++XhZi/Al8cwfv21wjF63A6npKiRg2njepcDjI5yApMsF3upV
         yN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752248990; x=1752853790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpWDwlYEFZONP4nYRAFW848J3k8ajKrSnxZeLFk6ATw=;
        b=gHktk8s6XgB+8s6tg8ohqYwzJc1TMxYLPtmlLqw2J+vpAUsde89SxxkiSHAkP9M6vG
         DNYySoXdZVfAI+CF1fPps4GzkF50MlBAzU7DRkQVvMAUVVNucfWe6/tZuIKUniQRHWq9
         ts17MUYBojrBGE46vrl3uogLYSEZCInPJlBjZaML9QWOylS84ihkBmvZN1E17PhdGR9u
         GYM9ayMfIvBTIXJU3LvC13ehZLq4ep8xQDcAtp08OiojQcvtqrUqtwbQTD89LwBlP0oZ
         ZmE5BJ4KJzkppAZJdrqsaI4+W54558BTv02ift5Ctr5309ElUigth3fHa/InYKYqN/rL
         +2cg==
X-Forwarded-Encrypted: i=1; AJvYcCUTgrrVwqct5r576W9Jv2yA+fjaHSLDp3JbkVpTp51LtXkcn2X63AMTq7CceP7UxROaHEADlLmr72DNRYl+UHjR@lists.infradead.org
X-Gm-Message-State: AOJu0YyGoY0igcMknoV1O9UhZUq6EXj/qOwJ9niNiPyan4bND4ti0L9S
	FEB4fUCqThpyhsaTXVe9ZCWrUwsQnzNPfQwVJp9E13fO+NRMNHzm+O28RCY2/b++qOJlJOJB8zl
	w3VblQ75a+goZj7vRhfac6ojT5KyzTg36MQHHtDkIbA==
X-Gm-Gg: ASbGnctOQDN1rVcHK7Tdmgt7S0dstnLiagqTJoFyHkbhz4WGCU+WHdoIUDXXuoZpRHi
	wNOqc5LWKCfbF+EVJsTHf57qzk4nXhtqmAQwnYMRegMtjWJ8gi/tdVZU7ocxvFGJO+z2MaXY1P2
	sP7OOUGlk75QoRAM10+9xkynXb/jK4NSYIMM5deYREHedqyRn6cTc5uSF8QGwnuoR72VYCW7CnQ
	2FzRAE=
X-Google-Smtp-Source: AGHT+IHv1hWw2pZQOckg98iZ5DP8H18RgsI97u/wmdJaWiqskQQPUlSUM7hA7IGFfKLNfKIFCIMEQTMIDL5dj9i09a8=
X-Received: by 2002:a05:6808:1a14:b0:406:5a47:a081 with SMTP id
 5614622812f47-4150dc288e1mr3095704b6e.13.1752248990474; Fri, 11 Jul 2025
 08:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250711-gs101-cpuidle-v6-1-503ec55fc2f9@linaro.org>
 <aHElXbj4-T--QqKk@bogus> <aHEmB-K7Pf7WOswk@bogus>
In-Reply-To: <aHEmB-K7Pf7WOswk@bogus>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 11 Jul 2025 16:49:39 +0100
X-Gm-Features: Ac12FXyPP2ayGhZhRKT9piHwpXNM8Cjgh20ByzhOS5Y4tdqk1oaHtAN9grK3Fzg
Message-ID: <CADrjBPrRbSYXVg5KyNB8Z9qLkZ2sGzEUcP+nf2UP2rVm2T7bSQ@mail.gmail.com>
Subject: Re: [PATCH v6] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, William Mcvicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_084951_597768_8113B5CB 
X-CRM114-Status: GOOD (  35.78  )
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

Hi Sudeep,

On Fri, 11 Jul 2025 at 15:56, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Fri, Jul 11, 2025 at 03:53:17PM +0100, Sudeep Holla wrote:
> > On Fri, Jul 11, 2025 at 02:50:26PM +0100, Peter Griffin wrote:
> > > Register cpu pm notifiers for gs101 which call the
> > > gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> > > C2 hint. This hint is required to actually enter the C2 idle state in
> > > addition to the PSCI calls due to limitations in the firmare.
> > >
> > > A couple of corner cases are handled, namely when the system is rebooting
> > > or suspending we ignore the request. Additionally the request is ignored if
> > > the CPU is in CPU hot plug. Some common code is refactored so that it can
> > > be called from both the CPU hot plug callbacks and CPU PM notifier taking
> > > into account that CPU PM notifiers are called with IRQs disabled whereas
> > > CPU hotplug callbacks are not.
> > >
> > > Additionally due to CPU PM notifiers using raw_spinlock the locking is
> > > updated to use raw_spinlock variants, this includes updating the pmu_regs
> > > regmap to use .use_raw_spinlock = true and additionally creating and
> > > registering a custom  pmu-intr-gen regmap instead of using the regmap
> > > provided by syscon.
> > >
> > > Note: this patch has a runtime dependency on adding 'local-timer-stop' dt
> > > property to the CPU nodes. This informs the time framework to switch to a
> > > broadcast timer as the local timer will be shutdown. Without that DT
> > > property specified the system hangs in early boot with this patch applied.
> > >
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > > Hi folks,
> > >
> > > This patch adds support for CPU Idle on gs101. In particular it achieves
> > > this by registerring a cpu pm notifier and programming a ACPM hint. This is
> > > required in addition to the PSCI calls to enter the c2 idle state due to
> > > limitations in the el3mon/ACPM firmware.
> > >
> >
> > I would rather keep the above note as part of the commit message or the
> > code comment as this will get lost when the patch is applied which is not
> > something we want. I clearly want to loudly shout or shame the broken
> > firmware for not getting this right.
> >
>
> I did see the comment but still thought it is worth adding the note in the
> commit log too. Sorry for referring code comment above which is wrong as it
> is already taken care.

I mentioned it in the commit log, a comment in the code and also the
cover letter so I think we should be all good? In the commit log it is
part of the first paragraph.

Thanks,

Peter

