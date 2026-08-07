Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424F4C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 04:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o17xvsOvPfH9++tJha96HSgr/uQMNYHba+/ZUL89Qak=; b=mM3L2j5AVGswY5VOLDXzxjMPuN
	lxIJIMcgdsxj65ecqCFTEE3Wy6BH/GEDUkgAd8prIXHWi28I9tOJHBVSLCWCs7OPWEddC26R8kbNK
	AJ4CyhYzm7bcqzftpW4yc52zI14Mvc/jNQYdRzmBWUAzzVCR1JApl7ljHWe2Y1WnIW4ROS9TwyCyL
	HHgjjkfHleuO15eKjxLP7KJ7KCoyQxzTYRHM4SCwXV2s4v9wzI1vqtaG7GGFkEPYt75/COoz3MNNy
	23OYghyhvnNO62EaDseLD+mzseY/UosLFD8ba01EgTG4S8ZqAYl8TvsTaFA/Ku7Azzb5rjARuBsVf
	eP1ger9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsC4j-000000074cz-2RBk;
	Fri, 07 Aug 2026 04:20:53 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsC4h-000000074cc-0G5C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 04:20:52 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso3570440b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 21:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786076450; cv=none;
        d=google.com; s=arc-20260327;
        b=qy+AJI76hUq0NsQ6aOkIk7g/F7n4qxCukIOCjBn/t85PKPIvAzT6fvcvNnFAwrqUC0
         oOlgoOzm4N5TdFYgnbKnpAGjSm6ShtOsMnaLMe/LB6NO+nZQcqz2lcr7Kqvg3W/nLdFG
         4VYkIW+AJV+K52Y1KVGkJdc0YN50PWZrEKlV0vsUZ1JwRh3EdCU6AdG+j07VbH5mBW/d
         MMds0X915hz622NFN/50iYI622sdFPXclDaphmghWNAxHRgi2ZuoWhc4/SRJS2KHXVbS
         VhuK0Q6XJxEsXbX1GORl9brriCFHLlT6MVs6p2bN7ghguTFdHi24ZD3oh1etq3yI0VJB
         nuXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o17xvsOvPfH9++tJha96HSgr/uQMNYHba+/ZUL89Qak=;
        fh=cvmDb2TT6SHcAw76TMCnJ9DdlAW3kEkfTSrwNm7ngvo=;
        b=RE194/1j468cblcU5qTmsLsjyRJXQUl6DyAti8kKh5e3xjAxcUi6zC22JwJm+N1pt5
         FdNTjJ3ChYWrXDgy/VlQlddVCgf2ReKryk7+mvKDHD6ZA5UdJriPxnIcx244oyTiDZMJ
         bEtlp1J3fuxdRxVMlzqRPQmjJB94pYJ+DLUcPAEETbvQgFGhdJtQ6HTNFXtTuMy8N5jV
         qCvogktmkIzxQO1i/BQKAAqK293F9Fd8I6fk6vyN8FQ2UDrTSsl4sDXPe9HGZ+cJso3T
         QH7Y9IfwJtGiu8XhvLv7VmGzcBoymYUU8xb/2CtjVCOsfcUBXngUoqh16udz8z4bTpCC
         6zXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786076450; x=1786681250; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o17xvsOvPfH9++tJha96HSgr/uQMNYHba+/ZUL89Qak=;
        b=fCGGgFiC2ngWzooaOFAEwZlwt9EwRnfhZ+H86/9pqtkWSkoPuZZ21hPAACGI4fi8jD
         FuFBgcwnJQehPPypK2VI22kHKkKHIf4QkabNu2S0syvw2TQv1/WeqbZ+YkHy3cthc5YU
         bTl55d/O4Z33lEur88uBk8wn9oj4yymPtN+3vine8hmfqRrYBO5DZwFcfLWAE7/AUzvU
         2bNuZ8M78rP7NBVRdfWY8J0lzm3coNGmLCYTNuYQ9SwbHNkZjBar9bgZZo2ZrBfCUZ/d
         TV0aidcGrydyJKeNWGRa7WmgZEdaaT1BlkZCso14X9x6QAxUN6yz2+wsLC1ZYVuUSTR6
         W92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786076450; x=1786681250;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o17xvsOvPfH9++tJha96HSgr/uQMNYHba+/ZUL89Qak=;
        b=Eail34WZXW42Oc67hWA66LrvWAY803fF5KCqQmIFTI9m+U+WWydoZfATG6MndWY/X0
         icExQ4uB2KunOVWbx/4ulsKDjr3mOc4m1qEqd7Y03hWu/2EY6yMSyfRSVMQ+ZMElVEec
         e/sY/cPmGRxsIVu1zdq0qvsVzSTw03l5a48mmF/PGI1LpbR3c1pfEzqRXUbcqqAaxKy0
         S/uLqx4v83qEqwf4zid9GQ5ZgsU5MjQmGVzlgH7jYd43ItFLB/HoVSbZ3icK31by/j7o
         MsjiKCHUcc0fFdwKUNrFi/Vs8VYLkBfvj+D1Ol9BDbtZt5hZhDg75yJudO5dS3fniKSO
         RrOw==
X-Forwarded-Encrypted: i=1; AHgh+RoF7L5m2MDsqtxn6IOwOU7rRFLZDhRpdPoV2jv70DGaE1iFhUdqAjfv40G/eQBvAQrI0dYSkC7OkyGbfFByRUAb@lists.infradead.org
X-Gm-Message-State: AOJu0YwDWhWylHVE6pwrA5fd7btGCPPjwF4pidfvarrYiGAq82f13VYg
	Dw/ju1mg94EOxnKQ4T6spxuYSzMli26SKMZDOaQeHMqd9KvcvjH0AYMGLNBKSz3E4BzNdiKIyvx
	NFrsE+USc76qY9eHsJ8/yDLe2MY3ofPw=
X-Gm-Gg: AR+sD12FvdzMqXg8ifQqWq5dCZsjPVIMAfLqWiZgyljGBX3gmiU8PJzHUwOZrhfjJ9g
	cn61rFKOifs7iQLD7VX+pbN8X6SIrM5D4lPFZF9kTis2khXh1eL6wKs4txyUyZuA/mPC2koHMIJ
	PSkPabhgalfttHhUfqEjPTtmpUd+oD9hTiByBZtRyB2go5MrPasdOkeg+O83uEmF70fvzKRLDVS
	25u9qpKCsyouACZkEFuj0xEEVw9zTCYTIajzM+vQdlMpPCmrWxkxQkhXcSCxEEDvEVsRrbIXtIw
	RbUEEnqhFXi6PWNKkkIXx8FzsCEBIqHXmZWCIBkugy8lukj3yu77n04MNj+Qq8kDy6YC+j8dwKr
	qsmTJixztcunN/B049fpc37ARErgpX0N27/RAccwkILvvDGjT0Iogsqk9
X-Received: by 2002:a05:6a00:983:b0:842:3a3b:d6e7 with SMTP id
 d2e1a72fcca58-84f2e052333mr20477801b3a.23.1786076449911; Thu, 06 Aug 2026
 21:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260806062812.26523-1-phucduc.bui@gmail.com> <81cf90a0-a966-4cab-b5ea-ceb1d241fb3f@roeck-us.net>
In-Reply-To: <81cf90a0-a966-4cab-b5ea-ceb1d241fb3f@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 7 Aug 2026 11:20:38 +0700
X-Gm-Features: AUfX_mwHvUlwr7cFbF1Ulitt4ashrEr_f7sBsQ9dvhUOUgB7zPiirsw1gqcqaS8
Message-ID: <CAABR9nEys_RZqpYEqhq+LGwWc1Fan3cN8mLSrejM+8vAnFOn0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] watchdog: orion_wdt: Propagate -EPROBE_DEFER from IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_212051_106018_B40EA563 
X-CRM114-Status: GOOD (  10.62  )
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

Hi Guenter,

Thank you for your review.

> > +     if (irq == -EPROBE_DEFER)
> > +             return irq;
>
> I think this should be
>
>         if (irq < 0 && irq != -ENXIO)
>                 return irq;
>

Agreed, that's better.
 -EINVAL also deserves to be returned, not just -EPROBE_DEFER
 only -ENXIO really means "no IRQ".
Will send v2 soon.

Best regards,
Phuc

