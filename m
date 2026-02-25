Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAF8FD3774
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6Fai54Ul21d21qsppL/OgbjNjE4u/Ww2JyK/Frhu5U=; b=EmeaIy2guli1ReqEVprYcESkTW
	TmMDhxQbWbA0Tp7MzEArMtHCS1fjSRfbNml9DYA60XMF6zDAbPi7tA3hMxwQMx6UnBny9YVv+ul5e
	T2Pri1xh/00XMqoJB8/cuYya6zobqRPx3EvQ42dsSMTpmp/Sx/c8BeMYLbNTk5U16ajDIIKHXPp+R
	iyPOH05OvtJEUSv/txzcePHqhsie+dndzAGnc/tbDJF/RN9kF6b2xXDV41pCg2OFENZt0Gw4mHdVk
	oi+dWU79BJDn3IzII1gJE8PUFWGjkVqxy1toeAAl0EfFiO0iP5BXh/sqqi92nMFANt7BbecOOqlTm
	Bdhewjmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvISu-00000004cxO-0RCU;
	Wed, 25 Feb 2026 17:14:24 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvISr-00000004cwZ-3kHH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:14:22 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso7012463eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772039661; x=1772644461; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M6Fai54Ul21d21qsppL/OgbjNjE4u/Ww2JyK/Frhu5U=;
        b=Jn1fUzqpKKXAxIzP52etZbRa668MaA+YbiBY2GyYDQ9lVa85nSP8xtXhlctoWPfVEV
         YMdQBLyo/caf5wo44+4FPFp/TkMMj6QrE6GLseu+NH6DBN4RgP1ViZTgufZMIAIHlnC9
         Iwyron/0lo/bko6FQ66YG7Ijccst0o/0HkryjtJv88MFHqf5C0qgjEEkZnJrJAQH7E9s
         Na1FjYDbGtU38Oi5bMgkJQ8LqfUl5mbQQXEbHSSG6B0IfUKFxEn+4doJ+/IWbk8FHAJn
         Tdxg8ytnDdfrprSznKqo64YUHLkntFzlnZegltm8PZ8yOP3Cyf1oJf9j8W9HRrl0WkAp
         xSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039661; x=1772644461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6Fai54Ul21d21qsppL/OgbjNjE4u/Ww2JyK/Frhu5U=;
        b=iEzKnfbpzY2b4UZtBdIiJZgI8ifV6oshCvQzTMPUxjKKsxBMeVavUeg0B5WNZWQIbi
         kx3nxMgN+Wr0s35THbQAKiCx4ALjv3yeHFY1kWpipsfEO05ppw+k1uYBq+B+nr9rFGwr
         onzUs9+x2GABWLGQVERZNJaSr7L2nQnvFPgFHUp7xU0pHB0kR7Awf8rQUZ4gZcZN3nUl
         IWL8rgYkMIwuRQX/6TVci3k6tfVT5I8hATW+/407vfecnemT56ng/maHGeWf8XqJOcen
         XjyF04dSy9qyR8GxteDnEg7bdO+Av5Csz0ufaR0qsy8A2VXyrtCo5zYDA1e8oEy16v+u
         VXcw==
X-Forwarded-Encrypted: i=1; AJvYcCUlM0JjDhQOVdL0Ak/qkAgDS+0N42PKlHt74N5y+7EVALOeiS1WBrYUBGVZ2/K8lbjCJbj+BaGdWXh8+38d1vr0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyerz4vRWpd4u7J941Y9HyKyxmzrOvRIDcKiJMH+kG+KSRDlCCj
	9dRW+sCuwVvzAdGzKRZatXKKUoQpAMlis0aifOohId94U5KSsyJKgeDZ
X-Gm-Gg: ATEYQzxb1Du9J6KMN3J4/4POgl+RmYrzKOqM8Qp/4RLcvO2wuxQKvWHhMVHTb2RZU/H
	yRjc8P/MtOg81WvSUpQ0nRtet+XtRzp7K05PTlJFBRtUcItCYVLOsfPIUO7nZfC8KFd4H+xN1k0
	nbbl8FJ+u5+9mYNeH5o9hascF9WLiEKhWPRKK9n2iJCgSrvIjtBU+scSm9BZk3Od2ZYsI7lcD+F
	ZXxHlurUdVD39ZS5lBNioe8WxzsIl9eEV//jE6EIoUm8Ushklg9qenuBtKkQTIi9pj4/5f2EI9L
	nC6416aJ7TEvH/XrX66V8RkXfvPT6T/SOCeqjiJfNiDTOgSiBJfKfp/AzJkVBQPxXjXuTknU6ty
	oVQdS5eci2gXnKIMsJkNefOtjr60zwZzM6xDRYNGgWhWDMFfOAGQo5Pk8gI2rqH/XwTSe6oFIw7
	smW6QsXLxVNa+tyq+2BSkbR7E/79pjoG7im2xuvlFYHRDhiVE7wmHQzkfdCd3kmQdO
X-Received: by 2002:a05:7301:d1a:b0:2bd:b2c9:851c with SMTP id 5a478bee46e88-2bdcc070e66mr620754eec.30.1772039660613;
        Wed, 25 Feb 2026 09:14:20 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:64dd:9670:711a:678e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7da4775dsm9332416eec.2.2026.02.25.09.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:14:20 -0800 (PST)
Date: Wed, 25 Feb 2026 09:14:16 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, robin@protonic.nl, 
	andy@kernel.org, geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, hvilleneuve@dimonoff.com, mkorpershoek@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, lee@kernel.org, 
	alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <aZ8tocPCKqTXqbC0@google.com>
References: <20260225155409.612478-1-hugo@hugovil.com>
 <20260225155409.612478-5-hugo@hugovil.com>
 <aZ8fXXGMx3fk7gKs@smile.fi.intel.com>
 <20260225114155.3ee2efb002aa0f52a905f535@hugovil.com>
 <20260225115652.8beb1979df3824f7a95d22bc@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225115652.8beb1979df3824f7a95d22bc@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_091421_934423_4C070F93 
X-CRM114-Status: GOOD (  23.94  )
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

On Wed, Feb 25, 2026 at 11:56:52AM -0500, Hugo Villeneuve wrote:
> On Wed, 25 Feb 2026 11:41:55 -0500
> Hugo Villeneuve <hugo@hugovil.com> wrote:
> 
> > Hi Andy,
> > thank you for the review.
> > 
> > On Wed, 25 Feb 2026 18:12:13 +0200
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > 
> > > On Wed, Feb 25, 2026 at 10:54:01AM -0500, Hugo Villeneuve wrote:
> > > 
> > > > Add support for GPIO-based charlieplex keypad, allowing to control
> > > > N^2-N keys using N GPIO lines.
> > > > 
> > > > Reuse matrix keypad keymap to simplify, even if there is no concept
> > > > of rows and columns in this type of keyboard.
> > > 
> > > ...
> > > 
> > > > +/*
> > > > + *  GPIO driven charlieplex keypad driver
> > > > + *
> > > > + *  Copyright (c) 2025 Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > > + *
> > > > + *  Based on matrix_keyboard.c
> > > 
> > > A single space after asterisk is enough.
> > 
> > Ok, leftover from copy/paste from matrix_keyboard.c :)
> > 
> > > 
> > > > + */
> > > 
> > > ...
> > > 
> > > + bitops.h
> > > 
> > > > +#include <linux/delay.h>
> > > 
> > > + dev_printk.h
> > > + device/devres.h
> > > + err.h
> > > 
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/input.h>
> > > > +#include <linux/input/matrix_keypad.h>
> > > 
> > > + math.h
> > 
> > Ok.
> > 
> > 
> > > 
> > > > +#include <linux/module.h>
> > > 
> > > > +#include <linux/of.h>
> > > 
> > > Is this in use? Or you wanted mod_devicetable.h for OF ID table?
> > 
> > I need only OF ID table, so will replace with mod_devicetable.h.
> 
> Hi Andy,
> finally I need <linux/of.h> for of_match_ptr()...
> 
> But I will keep <mod_devicetable.h> ...

Do we need the dependency on OF? We may include of match pointer
unconditionally and the driver could be used on ACPI systems with
PRP0001 HID.

Thanks.

-- 
Dmitry

