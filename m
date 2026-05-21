Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F009FCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HftGKTFDQHz46tZbCrQonIA0wDZTxmOItHnP/B1pm30=; b=vVcEZAaX+fce8VaT1by9BK7wSy
	2lFnmonDytzocvBi1vNwPaUcu4XYuQkFZsyTLSFThThcLQ2jikjCgxl4ATsKgXquTgMzEwnj2t/UW
	m0om1SUVWUCRGn3dtrWfz1B2pECetALbw2xgEvYJs3vN3VO6zI7FSGMMySpNRudIu82drInXKw78/
	9RjtR7494mZRnzPcYeMkVAy+o6lBEp0VjkGfroEeszfMXwJCQTlJDiB0aMypALHPqk49pXsZ6njrO
	Dxa0rnflW+LcAKyl0GcmjW1lZgtDnYxMNLq7OKE4lfQZ8Jmkq2ZujyVqcPI6elMv4MR8n9cXvoiCI
	2mbiyVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyj3-0000000785c-3zh9;
	Thu, 21 May 2026 08:25:53 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyj0-00000007844-0h7r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 08:25:53 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-68852a4fc68so396949a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 01:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779351948; cv=none;
        d=google.com; s=arc-20240605;
        b=W/HqjZl3n7MXQ98jAu2fcLIsP+hYPg6aO+Wbz70SPcG70OSOJcE6Us6rQr1H1mTwz+
         n+NG+gtSyspQeJrpUIb2+7/66IfbGom5VBCIWU0X9zBCFuIHouf+XkNReLj6GyfToOUy
         ++Uomgl6cAA+Opu4MqhZPV52R5DDnfXAIxya+PjA6bZHRH1mf/jSBDTwDBnzqKKN448/
         /RGyeivzcWorkJ3PeT5a2B8uGV5js0Y0S/+3Wahyn4rDZt/EwW+Sj4A6ePxT3A9pNT7H
         ml71T9CloI1N7A437rLvIXM7EGP0TxY3Xyt9TKpaejlObsbJGl66GCNSu44RARcqEawZ
         W3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HftGKTFDQHz46tZbCrQonIA0wDZTxmOItHnP/B1pm30=;
        fh=aPLqB/XcUjsH8LVsdmmJ48ZiaCtWI9iGD8SyixJhIXk=;
        b=aHPAMyZHJqGuPr+XRsFqpG5jOX0tuSEM05DgmncB36Nq7JcXFeSeveiLfo9/9cyvWG
         /eyRZZqTDn4wp2wcyJCSVSPexRMF4QTKyZN5zU1AvNRoJ1PI1CDZyo0T2mB7eUfSfhUh
         AYcq1iHHUXIImp/w1MjIIzvAmlEq8l6TgS3UFLZ9EuhW4j8HHx3zBo95vW+haZE1smww
         7T2Lx5GlmizXBbMNRuseTw162k2Et4o6rph6w2SYBck31srb1uILcVqLbWZAMl6xETrc
         jJyGYsQ3qR82IxS8/ggkHqSC5r/tqkDEP0Jb3hBP4AGJT0eOaf7rsG3MhGUa/GMK0DbT
         yPUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779351948; x=1779956748; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HftGKTFDQHz46tZbCrQonIA0wDZTxmOItHnP/B1pm30=;
        b=oSMwrHQ4efe8l6SDa21CkKReTIaOcS+g/yb75cvbL0mQD8gNJpAU3yExRWVKXwDggf
         9DNYbWwD/jnuokHaYqtMou6F5uX/ATWGDiYrdMKIrlObja0BJrpDc9xhiPV02hVVZXm3
         yxOK72pkdAQ5zZjFQrw3uK4WOo8BtJ9xQW9P5oLrUEq8mlYsY1d6fL62Ey6VTSBOwOuy
         nys0Ei0uTpFFJJv3DrjpP9vwRilQxHMhcZ8Us/VAm/oZUIzhWVUrpdetDfhmkWoZx1GV
         0F3IRHjNyXdM8PwBRu+2Yp9rSDeVpma0QIi2FCrwmfQec/sSe+/tJnc9RfSRbji7xejs
         SP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351948; x=1779956748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HftGKTFDQHz46tZbCrQonIA0wDZTxmOItHnP/B1pm30=;
        b=qH1b7HRJwvrOHOI42JOEsokolYFssXc0wiXPpg+mWSvaO7MkScBE8PYyjQQnGyoaZC
         ztfcVbGZUbXEdyTEXG+c8BaVH0btVJeELI5jWdQX9oBXUhAdzyycDdoCjVErO+PvRmNx
         8yoFctow5TQjmvBHOy+PNXfApzQy9gf2KP/vrFjH/ed92A/UilkpoC4Gl9NwQGcB0fDk
         9OpM+iDUnfGsH2G043NaBWSXowAnqzdectlPFTaYtkHY+aRouBOoKlGUnNw9c62FLDXJ
         m+qn+teA9Q7gYhiaOEBl9lGi+cklU6GN9JDBn8hnGWvRVsAjqEqeABM3XUVbTfenuqKz
         n/Cw==
X-Forwarded-Encrypted: i=1; AFNElJ+rwu33UctBghfDarvHU4Almod7OcvDJ69Ouls0fpExJc5i6RK5nMiKN5Oe371jnHg6XZNCokMnOLo6cJ3Be+WW@lists.infradead.org
X-Gm-Message-State: AOJu0YxRl3sXctORZcSUZ5Oj6YqPvf62dFi3w30+2Eu9Jn5Nn5hQUtWQ
	FLC1QEQ44yGQ0smx+x3BjN/dUkg70yDqhi9l6GQogrBCXORweoF9Pa3Jp5DKFsWHQyHIQmTvgvS
	jSCqISxh6MJ/ozw7h3mk6UwgiJ6aLsJGBRwFWCUY44Q==
X-Gm-Gg: Acq92OHQonRfPQ4ogf8Jpf+8IBMkbToBPah+rDUZs0WtD0rkWqzcVNQmOW+kD1LsK1K
	kowodcG+jRwPlfQhNQTSviC0mxZ/aiwmQHue7VzdeUVlGuXiJD/hqoJkUALRUZ+5w7CHiMXzrMV
	bwqlriuYbtxvtmmBhOEhVUaEpIQkgfZbitKYuCn79AIVFi13W7oQwHNvFs0VyYjbGc3PCCK8Got
	mBVE/9Ww0NuTEvXgT09XhScoSYIWVr8Cgkp+Ib2M1D5Kl8BPbraCQLlSNEEKyQq7NyqiMJxIeVZ
	c4p5z2BOdGdT4VwfdsTqzDvy7QJcMzkj/TmxSdfa3/yRr2IUgri/
X-Received: by 2002:a05:6402:5306:b0:672:8f26:8a9a with SMTP id
 4fb4d7f45d1cf-68835bf6a4amr868802a12.8.1779351947791; Thu, 21 May 2026
 01:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org> <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org> <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org> <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
 <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org> <DINT2DFDVWFX.BGTG7LOC91RH@linaro.org>
In-Reply-To: <DINT2DFDVWFX.BGTG7LOC91RH@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 21 May 2026 09:25:34 +0100
X-Gm-Features: AVHnY4JhWIGAx26PwOK0C45852TVZfJmuG1qn6e3lCf-fVcwgDGuhhZK4l_Sw9Y
Message-ID: <CADrjBPqiooFC9o56bOAg-j7908ssPtrzff1reNe6eXmu7hcA=w@mail.gmail.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	jyescas@google.com, kernel-team@android.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_012550_273504_32964486 
X-CRM114-Status: GOOD (  30.71  )
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

Hi Alexey,

On Wed, 20 May 2026 at 22:01, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Hi Tudor,
>
> On Tue May 19, 2026 at 4:46 PM BST, Tudor Ambarus wrote:
> > Hi, Alexey,
> >
> > On 5/18/26 2:24 PM, Alexey Klimov wrote:
> >> Thinking further about this I'd humbly suggest that even
> >>
> >>      if (fw_err >= 0)
> >>              return 0;
> >>
> >>      pr_debug_ratelimited("ACPM tmu call returned: %x\n", fw_err);
> >>      or pr_debug(...);
> >>
> >>      if (fw_err == -1)
> >>              return -EACCES;
> >>
> >> some debug message would do.
> >> Perhaps we need some convertation, for instance as it is done in scmi
> >> code (scmi_to_linux_errno(), scmi_linux_errmap[]). But I don't have any
> >> data for mapping acpm errors to some human meanings.
> >
> > I did that for the pmic helpers. I don't need any debug prints for
> > gs101 TMU as I have clear instructions from firmware: 0 for success,
> > -1 for error.
>
> This doesn't look like a right approach for upstreaming a ACPM TMU
> framework.
>
> You are trying to submit a gs101-specific implementation masquerading
> it as a generic ACPM TMU framework, while explicitly pushing the
> refactoring work onto the next developer to add support for other
> SoCs in this generic ACPM code.
>
> The ACPM TMU protocol implementation on Exynos850 is different: it uses
> different error codes, and half of the calls in this 'generic' driver
> are not even implemented in the Exynos850 firmware. Relying on a
> hardcoded if (fw_err == -1) in a driver named generic ACPM is broken
> by design and may silently swallow critical firmware errors on other
> SoCs.
>
> What about such options below?
> - rename the driver to reflect reality: rename this specifically to
> gs101-acpm-tmu-something to reflect that it is tailored for gs101-s;
>
> or
> - abstract the firmware error handling paths through driver_data or
> a dedicated ops structure now, so that other SoCs can cleanly hook into
> it without having to rewrite the logic later.

AFAIK it's pretty normal not to add new hooks before they are
required. I think the approach taken in this series makes sense, as
it's the developer adding support for SoC #2 who best knows what the
differences are on their platform versus what exists upstream.
Similarly, the developer adding support for SoC #3 may have different
requirements to e850 and gs101 and that developer is best placed to
refactor and add hooks or quirks that are required for that platform.

Let's not try to boil the ocean with this series, it's targeting GS101
support. We can evolve it for future SoCs as those requirements and
differences become clear.

Peter


Peter

