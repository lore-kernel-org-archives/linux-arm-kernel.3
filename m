Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3934C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DL02opBJ2GOeQ6pVsKBzjcKKbv+jea7dqaSnTubtI4=; b=S+WaD8aZ/zTjArCCYjppb7nL5Y
	cMVceZAUNBILaz5PtQbYOXfDuZg3Vm4i3gTGxv98h74g+ioqpmP+kZ+FydHyYGi42vuP0D69VvyQP
	vLO1xbl38unipeuzwmS/EYZX2MR/A1XPjMlXKzdn0yNoay9A3qaIUXxaey2qZAdvmtq12Qtv8o+QA
	f4ACJaS/5SIod3d+yvJCgn6AE6eCXMLxa9+j/eaxvuIXDmivBIQxateGlESGYy2SUGIdskPFAt1ML
	aLc7td3JFVqKfG8dp57+ugWsR3eBVzSsyEgmvMr4DFneSfZKO+gHRKeB2QFg/inXLkyQCf02gxlZ/
	+UkaW9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8B4-00000002Han-0Vdl;
	Mon, 17 Mar 2025 10:58:38 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu84A-00000002Fqa-469R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:51:32 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6f666c94285so39529137b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 03:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742208690; x=1742813490; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3DL02opBJ2GOeQ6pVsKBzjcKKbv+jea7dqaSnTubtI4=;
        b=S+5GARJScrjCYfr+qHd+3J4GIPCivWb5E+hLv0npWr6FKIHImt2xphtOwIySqPzo0H
         z5Pgs5s2B+OgaCoY+7zwY0qEaKlmdXM5zCy1SsRaPLlcocqBirJuVysZYWyva/VLSK0b
         YKY1pvFh7JzlCleTD+tIlSxygbfawEeefDDGd8/xJO7PY5rg0pRAyJFXeVYqk4Ci8sG4
         gJbUA9QwhGfJ5BSBUShQEg0usAtmSTqyy9D/i+AW7FdoZMlAbIQHASo09W3UeWHcWO0p
         mcjHGThOz1Z8rMPv6F1JTPbWq6aEyfpQD/7RoLMHNTMIH6ZKc/P35NGjTv2OvVnQk9Q8
         kLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742208690; x=1742813490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DL02opBJ2GOeQ6pVsKBzjcKKbv+jea7dqaSnTubtI4=;
        b=ePfLp4C1r8a3+fYeE3uroVfnMZTTpE282h86rOdSF4AjjHM5SL4+i6ewfi0RjTiVr1
         DZyTsUZu6BgRBwnMdnSYdfV5/ca4u3PR0MLiWU81rTXAq2HZVYcJgNzdPOHRGqPVQ3o7
         zBGRx+Y01aV+YSv8+I8xwGFEkX6+4Lgb72U4A5t+NHaVnDlmqbzmlBU7tML1ObCdR/Uj
         iFAPqCEJLE6bzazmCV6zJzJhiSasRLbEfJAg7razEYJd5kOYRETDQ783Tzv1/9NAiKID
         7PkX7EZfy0+tTQrlwRnpyfatdgkPdq6tzFR06Qu4PBrtL2q1FNYugNjGYCIMdjdRB01w
         sXrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtRDK93pW8/ijVcw/FkbZfcphdd7oDyJp2bRwGKoIJRwctAW8Wx+EDGgMpcV33iieBgnN/ziL8RkNYvkdXrhnq@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj6jCx6Uzldnu/yDvfwqje3H5N2yONlEiQcApa/Wc+Ln3wn2ci
	kvlIvFl9Bc8h7x0fFIGgrhzcMSrhYXQfzKmUC2l0V11agOpuTi2sym0jpMvNQUOrG5pBWIs+u0i
	FF2TuBUSM0KFGvB1gwcDzKazNzm4qK9ehk8YlSQ==
X-Gm-Gg: ASbGnctkRW7n5kf7YrOVehwH233VGNhhtDxg0/1a1btExl9qqHjPUl+fBb375EGCJU7
	nJLXiwQws/4P5I5PnvUm3QeIwPa8BHiCZhrGSGciVCEt0oBNXfgricRNvCywcFghc6HGJiaJRYc
	aXz0MEisRZdOLdb0uONDb9Ln5TO6A=
X-Google-Smtp-Source: AGHT+IG8URJqqSBqONhuu8sYybucoSHmc+ZFyad25qn1SExsn3bIptprwg9F2pyuFSIv1SCLh33c21bFXaSGx6o+e0U=
X-Received: by 2002:a05:690c:7003:b0:6ff:1f58:7ce2 with SMTP id
 00721157ae682-6ff45f43340mr166246127b3.12.1742208689959; Mon, 17 Mar 2025
 03:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250314095851.443979-1-sudeep.holla@arm.com>
In-Reply-To: <20250314095851.443979-1-sudeep.holla@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Mar 2025 11:50:54 +0100
X-Gm-Features: AQ5f1Joaio6_TwbptUke6Aww5lNg-_7Fjau5OFgPk2QOhZDZNiKgiWIAn887rF4
Message-ID: <CAPDyKFqhvJnth4ASfnfj5xTkM625m-rAidZ3zdy01CzkB7e1Ng@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: Remove redundant state verification
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, 
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_035131_016713_183EBDE6 
X-CRM114-Status: GOOD (  21.60  )
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

On Fri, 14 Mar 2025 at 10:58, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> Currently, scmi_pd_power() explicitly verifies whether the requested
> power state was applied by calling state_get(). While this check could
> detect failures where the state was not properly updated, ensuring
> correctness is the responsibility of the SCMI firmware.
>
> Removing this redundant state_get() call eliminates an unnecessary
> round-trip to the firmware, improving efficiency. Any mismatches
> between the requested and actual states should be handled by the SCMI
> firmware, which must return a failure if state_set() is unsuccessful.
>
> Additionally, in some cases, checking the state after powering off a
> domain may be unreliable or unsafe, depending on the firmware
> implementation.
>
> This patch removes the redundant verification, simplifying the function
> without compromising correctness.
>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Cristian Marussi <cristian.marussi@arm.com>
> Reported-and-tested-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> index 86b531e15b85..2a213c218126 100644
> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> @@ -24,8 +24,7 @@ struct scmi_pm_domain {
>
>  static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
>  {
> -       int ret;
> -       u32 state, ret_state;
> +       u32 state;
>         struct scmi_pm_domain *pd = to_scmi_pd(domain);
>
>         if (power_on)
> @@ -33,13 +32,7 @@ static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
>         else
>                 state = SCMI_POWER_STATE_GENERIC_OFF;
>
> -       ret = power_ops->state_set(pd->ph, pd->domain, state);
> -       if (!ret)
> -               ret = power_ops->state_get(pd->ph, pd->domain, &ret_state);
> -       if (!ret && state != ret_state)
> -               return -EIO;
> -
> -       return ret;
> +       return power_ops->state_set(pd->ph, pd->domain, state);
>  }
>
>  static int scmi_pd_power_on(struct generic_pm_domain *domain)
> --
> 2.34.1
>

