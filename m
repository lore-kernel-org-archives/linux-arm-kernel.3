Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3B6CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 10:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INehRWTHTBM1ilUwastePElIHNWnGH8n+SvXXUnd6iA=; b=xSaUsx3fvYov3tA6dKYif5OnHK
	BCgGrkzwAaVnko6zz4fQOX8yc/gYAzMhCi+67yeqbV5QPgKVpsnh8SP63uu3sysrIg5lH7K/T9DU0
	uUtlsJv5sMqLRi6fGCW68gsstCvavDo5kODAPvaMLVtAJ7BoqIo46cs9xuo6CIfWiIK3N0rHGi4qF
	PzZHuKXqgoOJmzxtd6AueSqw4oOXXlkQmO2pQ+HhLDXAIEawSxFlOc63oqheb8b9MgQvZVhLaTc6H
	MgMPY9gSjJEg/D5tuBtdfcsK9D4O+UISDDNlvijByT74NdFaYX5dK6EWRWfEyHnryEoUc5NFi1hdj
	qwOCh0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTdcf-00000009VYF-2NOS;
	Sun, 31 May 2026 10:42:25 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTdcd-00000009VXf-29fM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 10:42:24 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5aa5ce4904eso2014468e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 03:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780224141; x=1780828941; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=INehRWTHTBM1ilUwastePElIHNWnGH8n+SvXXUnd6iA=;
        b=avBCKimJUUJQBhoeitREDmtU62uxZgKPyQ45Llb3wkPYAJXkYjVidePwNlWdIDZifQ
         ozIHGJbxlNG3PTszcz1LdQ9431NRuhOEiVPdyrhMNgGDniZQNnbnjz3p59egeWo2ZurM
         jIvmrR440sPpp2JtoCplenfdnEZ29G5SAubkIgEPOQQCw5G/9LcIkLt63sgHmo1QUSou
         +5cOHiN9RBGQVOKN8WIADDHxwZRjj2nj+yvA88W0CapVQkvPHofJKu3/zXyk8c0zdzkf
         6qxGBbJKJSA2r9jBZgNKcsQLpZMkSu5Rxm/+c7Z2r8SS6yWI9hMwIj9GGwT5a4BIReWm
         2rAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780224141; x=1780828941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INehRWTHTBM1ilUwastePElIHNWnGH8n+SvXXUnd6iA=;
        b=El07esn5cpjgmv1A3YwNG7LT0n/lhEFbd7bxUe1Yr6qUhhUcT+nqQLjJaBTzAR5JDN
         SOq599TvkDQITXFRTw6w5q3ekSxIcMUklI2caS8N5wwNM2Zq9jV3mLNPmBQH+NES5gG+
         tdp+OrCwosd2xCJjHXQiGZuPN7KgL1zBntZJorSQneFz7KQ0ewvaUxAgORw8qU1govZO
         3fEJGZ/gMWVhmR9qcMNiqW8vzhE9o7Y1DudmYRmIccNUAcFAXVDscq5n2Xz8fFr2y4OA
         gJ1+yP9yKV4I9TELoj//mLeJp0DfO8CDFRuSYbYuUPND8WBDRd8F/pW2CoJ8CnGRi3+k
         3wGw==
X-Forwarded-Encrypted: i=1; AFNElJ//ytPdZIpf+gQy+mXBN+gwIx9azNGk6LTyraxN1BRtZH4dUGUwMdkQ63wvFe/dUR6d3pSOX8brX5rtKZexoT4t@lists.infradead.org
X-Gm-Message-State: AOJu0YxSsnM14xDkuI7fuSDOtXBNDHUC1CCGv6MUGAqG8zO3mcwrzOuO
	sM5qN/afy+k6NziKhDjGFc/LUmQrkV00kWH2Jo2rBJBY593HDg0ZF5m/
X-Gm-Gg: Acq92OEFjfXWLQacrSJmYADWFmySfiakIoJVUqhOBxvnMjPndY2yP/QcLUj0X3A7gVp
	ddfwhjjjbJp6NIRBCCDRDbWX8Cw4FpcL+NPLhVLokTZAk+Vbt4i85RcfYvVwkcmykfKrUISJXha
	34shYn0Prv3lahOAbDrhgSk+XLcPOi5Z3D62qEJBIPcYJFPpZzXlm2YPWIkpUJzUdXgQvsPggfw
	lNL0KROaOYgO5ehG7wtiHQQ8LTY1wFLDsdHOhn+ez0ptWnbQMXdJ50A36OnPS8gyN1biPl+/fpI
	ebKKJFfK9fLJPDdVU4grtDX4tDaCuoWgCLbW3ckBHo1GgyF7jw7FckESpa73R2l6CpPm070VlIy
	deKzmdQoYm5OLP8OGvNcl/lRW2nCW3Avt9LzEFe3Y/T4oEWse/N5nsy+G+TewP4hVob9b0swkAL
	0UzJPAiXwmNDR7BsUIQuu/jsxYq6YptTMl8HJUU3T5qBU0y0y97WNj8o6If05pEpCxiUH3Ej0=
X-Received: by 2002:a05:6512:398e:b0:5a7:46f2:9860 with SMTP id 2adb3069b0e04-5aa608ec07fmr1928751e87.20.1780224141104;
        Sun, 31 May 2026 03:42:21 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b07214asm1480110e87.21.2026.05.31.03.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 03:42:19 -0700 (PDT)
Date: Sun, 31 May 2026 12:42:16 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Peter Rosin <peda@lysator.liu.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 5/5] docs: i2c: i2c-topology: add section about bus
 speed
Message-ID: <ahwQiJAwsPl2uJ5M@gmail.com>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
 <20260324-i2c-mux-v9-5-5292b0608243@gmail.com>
 <ahX4_WaqodYt3PmD@shikoro>
 <776cefab-fa6c-4092-8b95-236a3eaac729@lysator.liu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <776cefab-fa6c-4092-8b95-236a3eaac729@lysator.liu.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_034223_591306_CEAD9848 
X-CRM114-Status: GOOD (  26.14  )
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

Hi Peter!

On Sat, May 30, 2026 at 08:54:51AM +0200, Peter Rosin wrote:
> Hi all,
> 
> First off, sorry for being so incredibly slow in getting to this
> series.

No worries!


[...]
> > > +Consider the following example: ::
> > > +
> > > +                          .----------. 100kHz .--------.
> > > +        .--------. 400kHz |   mux-   |--------| dev D1 |
> > > +        |  root  |--+-----|  locked  |        '--------'
> > > +        '--------'  |     |  mux M1  |--. 400kHz .--------.
> > > +                    |     '----------'  '--------| dev D2 |
> > > +                    |  .--------.                '--------'
> > > +                    '--| dev D3 |
> > > +                       '--------'
> > > +
> > > +If the idle state of M1 is:
> > > +
> > > +- All channels disconnected: No problem, D1 and D2 are not affected by communication
> > > +  to D3.
> > > +- Last selected channel: Problem if D1 was the last selected channel. High speed
> > > +  communication to D3 will be "leaked" to D1.
> > > +- Predefined channel: Problem if the predefined channel D1. Set predefined channel
> > > +  to D2 as D2 may handle 400kHz.
> > 
> > ... unlike here. We have MUX_IDLE_AS_IS and MUX_IDLE_DISCONNECT defined
> > already. And I'd think we should only allow bus speed switching for
> > MUX_IDLE_DISCONNECT to avoid out-of-spec scenarios. Opinions?
> 
> It is probably not unwise to disallow MUX_IDLE_AS_IS in this context,
> at least until someone actually needs it. Which does not seem all that
> likely?

I agree, I had this in my first iteration [1][2], but only as a warning
though. 

Maybe I should reintroduce `idle_state` again and only allow
MUX_IDLE_DISCONNECT?


[1] https://lists.infradead.org/pipermail/linux-arm-kernel/2025-September/1064986.html
[2] https://lists.infradead.org/pipermail/linux-arm-kernel/2025-September/1064987.html

> 
> However, it seems like it should be fairly OK to allow a predefined
> idle channel, as long as that channel is not lowering the bus speed
> compared to the parent. But maybe supporting that can also wait for
> an actual user?
> 
> > > +Supported controllers
> > > +-----------------------
> > > +
> > > +Not all I2C controllers support setting the bus speed dynamically.
> > > +At the time of writing, the following controllers have support:
> > > +
> > > +============================   =============================================
> > > +i2c-davinci                    Supports dynamic bus speed
> > > +============================   =============================================
> > 
> > This paragaph is easy to get outdated. We can document that only
> > controller drivers with the callback function implemented will work.
> > People then can find out if that applies for their driver...
> 
> There are other such hard-to-maintain lists elsewhere in the text.
> Not saying that this makes neither those nor this list a good idea,
> but it is an explanation for adding one more.
> 
> Cheers,
> Peter


Best regards,
Marcus Folkesson


