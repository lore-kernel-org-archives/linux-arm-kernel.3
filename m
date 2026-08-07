Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BD0C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 04:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFnpsZEDa2kOT31onzxrsvAFlmUG/9w4ITWZXzCCWLw=; b=JrMwFHKhO3LifSco65jZ6X7xHb
	kJgJ6r7Z8MVQxm7diICByrxc1mrbBTyMAmCDIabsbJ/jXHHlPLF5AwYuQaoBT/WCnbiv2EPFRxVbn
	fFVy8wwJxmSYfTNhyQ9shUyvt4no4xItv8iWvgBtkjlfNQhBNFT6GRQP+MZeokX/xQXX3pttg+/2B
	llYrrXEmT0WgDbeq8Q1I3I0KExrowOtyOpqW9DR92rMYg08QsE6fWa0T2KMuECjjkwJe342W+FDcz
	nVGQHWE6zzWbv4S8DhfS4qgqvTF40l+VCI8Vz+pDxpVrYqjWdWA5077aZAhbHcEbnk9DQ6Yh+GmAK
	857527lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsC7M-000000074p3-3sRv;
	Fri, 07 Aug 2026 04:23:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsC7K-000000074oe-3F3A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 04:23:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cc73e322dbso33398955ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 21:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786076614; cv=none;
        d=google.com; s=arc-20260327;
        b=aUMqE1hKFBFHoed1xtsu/ocZ46Ro1xGe1VfXc6FRqYTacnypimSb8Jo0grVBc37xlX
         dKT61ct6Z7dk8ie4NTBaTKXEFCstgGbLUDqufFn0S0Bz3TFr79/3zdJvUgW1/SxltDK5
         xogBZAmJsbxIOSNfPPDJL7uhZ10F2PzLcKBydaBx3MTBzqMSbVvkcz0My3pQ9XFlH1hj
         fyxracvNdRZCBZnJk0qxrh/AqrGjpA5pkDtYdIh6E7A+jmh+lrK3cfxDVZORAT6Y765L
         VS2aLnaH0jy97WX8zLj9GICvFAcmFHwmRwhtul1TtLq6KXzeNqMQ07Qalt5o3bMeh53m
         q6oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WFnpsZEDa2kOT31onzxrsvAFlmUG/9w4ITWZXzCCWLw=;
        fh=WOymJzbBaXr1JexK2XpAjH6NHTo+Ajih61yA+Jia0ps=;
        b=cfder61V8+6UsUUe5c5JTBVEIJd5NJZFQbtTcSEp0DB39sm0he4xU52eOTsgpj3kXf
         1zjnQhuTd8CtoiQZTjOTndjmW020XrPmGM+VjpJwRv/JETrp9Loh5TTbabyHk3f/NxcR
         7NB/4X2FucPz04aiLcUXmHWFF8xuQLHl4XQ2S7B4zTT6nRqM1jtgyGWU5Yfp/nU0COXL
         rpa1LSWMrJRPBPcFQKxrqYaMJGxuDI6LI04+q7BX/vCXc6R2mHnLpeSpA0+ExO9Eci/0
         eAVu3aivaexzXWMdYwlrOam5cx46DKWV7r9Jdh+VcmMzB651Lh0M7Usm1BIMvhDyaKGb
         bQMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786076614; x=1786681414; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFnpsZEDa2kOT31onzxrsvAFlmUG/9w4ITWZXzCCWLw=;
        b=spVlKpC/9yK0HPnrz/USZ6D1m+dkvMeEbfBjTYv4A8skm9xDmzPIcv7h/xHFt3cH7M
         eTctQqBbBAzyrDYvP4vIUbcMSz53EQ/NEJcwuXaipUkXEDXRFvsi8pvwFBSAz7NkmRID
         Z6pkDGC8w6u8957U5aa06EQ1Lewql6QcP0kFGbYBsbBTwnmY5iuF5USx5IpUNhhH2shW
         9zBoQLOZQBS3i2kM5fnCSeXZrC2tWMtaMvE7TvE1eTxI2N5ono/IpJ6Z6sUn/A4kFnnV
         Ek4g/ZK/AkkVfKbG5omXUSzzZWnByLDBSg5EE2XOASbho3NKMtwLNfUskHJY1W5NKFUx
         IAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786076614; x=1786681414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WFnpsZEDa2kOT31onzxrsvAFlmUG/9w4ITWZXzCCWLw=;
        b=Hju3WyD4DVXqsPfyICI4xQwyFRkW9201bOxCLmT9BdzTDN0GFEY0iBCzAebB5R0zAQ
         itBvO7TEc+kHVkZEtSaOB3nXhkSPHI1aM40tVy8/lofjTQLcaR/Os7T3r6IWJ4mzqtnk
         /wBDje6vD72/xbuNcR11p47xQZHWKUhPWF0DdC2noMubX/u0ACPp+w8UqsYKpO7BdNOC
         U1PI5VH5/xzFqPzjXCk79GlGWGz0xJQQcLHo4cwwFyLOZvU7Gtovm+ofhXEtP4/71K6k
         6TpjV37rtoXJ0NBguky5ePeKuMkVPxOvlMU4RGfys92x+uqMRgxe9+zyBoEGyiHn8LcO
         smNw==
X-Forwarded-Encrypted: i=1; AHgh+RqROjeKZjgIJyhyxPorvZXUUxQ6G3ZafnFlUR5DddzaQmfgBQimTXAV0gsblxDjXuQTKerVdfgTTxeq0bPGbrz7@lists.infradead.org
X-Gm-Message-State: AOJu0YxH5cXBULxTSWkL9S9tPMqPiUdnwqRXNzyD4a73Rb+rEESNEkX4
	pC/EDeiIn8l4y7pN5yRrjPfIYsTBZQ2pGoSEjLt/Fx0JmqcDmrXjHyOX5xbxaVju6oDcizzJrg4
	bSbFxDNdmk7gfxi3YUu6gGGSR+JyM/F8=
X-Gm-Gg: AR+sD12vwtKlmZHxVl9BkVP0ISpOEk7MNFs2sbBtALOxWByanBZym56wLeQYmoRJsmL
	YuyBwuM8b6/SJGs1SvD7rNzO5LpOuxcC+j6TYK1e0rjKQ67sB3nXjEPWFMkJtyo3eBpUO+qvpZD
	epJ1hJNfGV09NP0nU2MHlrudE64Hd+6tXUVOZOXahzkAxYcBI/zVIo7ZeFabQXqOwgJ8iaEssqm
	+/cURTiRYwMiPpUZq1LX6N+/zBx7JQYt0o+EEN1iltRd48JesRZ8UCPcGTYUgmuZYEJyjSwuPxg
	naifPaucOuCh8/wz00UFes4ynth3i8LpvgeD7g1AXnklv6/JgyKI2NVBzgLRqyAr0NNx6aCzfPA
	PUrWd+ZLmAEIt6M9gR4YIgsLnkhor+VyAEmiX3Z1HaAxllndey+bRSk8E
X-Received: by 2002:a17:903:46c7:b0:2c9:b48c:fdec with SMTP id
 d9443c01a7336-2d0ca75d2admr259114625ad.12.1786076613823; Thu, 06 Aug 2026
 21:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260806062812.26523-1-phucduc.bui@gmail.com> <20260806062812.26523-2-phucduc.bui@gmail.com>
 <697f8c44-1eef-47c2-8e59-9daa65e6989e@roeck-us.net>
In-Reply-To: <697f8c44-1eef-47c2-8e59-9daa65e6989e@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 7 Aug 2026 11:23:21 +0700
X-Gm-Features: AUfX_myprYNKXNoLAW3iUOi9MfOiRmf4CQgyEzA2vGpsF5wBvkFiXiwoc1ZIH4M
Message-ID: <CAABR9nFqTWPingLM+kPknpU1OfC+2kOqELiT2Ep7wqN5JB6P5g@mail.gmail.com>
Subject: Re: [PATCH 2/2] watchdog: stm32_iwdg: Propagate -EPROBE_DEFER from
 IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_212334_815865_37AAAD37 
X-CRM114-Status: GOOD (  10.87  )
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

> > -     if (irq <= 0)
> > +     if (irq == -EPROBE_DEFER)
> > +             return irq;
> > +     if (irq < 0)
> >               return 0;
>
>         if (irq < 0) {
>                 if (irq != -ENXIO)
>                         return irq;
>                 return 0;
>         }
>
> platform_get_irq_optional() does not return 0. and -ENXIO is returned
> if there is no interrupt.

I will send a v2 soon.

Best regards,
Phuc

