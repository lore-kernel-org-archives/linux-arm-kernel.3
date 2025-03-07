Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE7EC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0tTBBkSXXJKUR9oaU2RMjBJaq/Kyp/6BfjUzv+/56o=; b=URs9V708eM6ogdJiQlwiS1oJv7
	Q+IYzQubdvU9/5oOA9evBPy3AcsC5o9+mwIWgrHNfn+Ky63AjPKsZg8W+du+7It4EklfaL2F3ZtU/
	4iGCkASJXuLzACcr6gri4CdMojPJib7qdlDC8xRmX/EJQ1BqGtJ8F06lrUzkdik3ZZgcFlPzL5aCk
	coxWS7489zjGPLTq51cTFSSb9FX9RY5eimnmIEM8YrhwK2xlQym37gdYEynKWsnHH49mB3OZyjQHR
	QUeLjJQost/Vikoth2j29bPY3pLDFVzvl+haxggX1wMjuOxQEBRKM/odyA6M5QyuVm8kbK55iJDKM
	0KGsg3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWgZ-0000000EAUW-2bxN;
	Fri, 07 Mar 2025 12:20:15 +0000
Received: from mail-ed1-f44.google.com ([209.85.208.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWcO-0000000E9l9-1VLy;
	Fri, 07 Mar 2025 12:15:57 +0000
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so3617790a12.0;
        Fri, 07 Mar 2025 04:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741349750; x=1741954550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0tTBBkSXXJKUR9oaU2RMjBJaq/Kyp/6BfjUzv+/56o=;
        b=J7mOiI2pWFErHWmXt54NLflTuql9IOrTaOsO3T7Vgtnbyt6eOFYAuTvkebzSQRWYF3
         0jO/q+vKcFqJRaJoa3UTJ/15w3GpC/eMcisIhSr3sltWL01cYOk3ifdl2jrKiQRqDGwk
         63RoTrf52W5ceRrwHJW6iHFa5YTeG3JGH29A3QKEcg6vZf2zdlZ7fsHJ2XknWpkjtohg
         IfDQ8NVAPe0VVm+Abph/LR5qauIe3egwKL268eAeBISUcBwYxZwTsb39C3BCzQChA8FR
         AvgmXr5AqzpTHQlVrf3YyJs/O3ZNqI7dxGQ1u2gafRvaw/msWM/V2os/LGjMCmBgPgN1
         Wimw==
X-Forwarded-Encrypted: i=1; AJvYcCVqs9GgfRpcvy5/D/KLyX2qDOMm10g88fMG5GiH0E8VdZ0+pZfC5FTA9AxxkY8mTtYBC4ukBUY7nz27UXIiBZ1F@lists.infradead.org, AJvYcCXpYsOFVB20V3wBoLMbl4/3QgnhtLgHhAI7wSL4ND9+GNEQVIrgvca6F8EHcTLIx3j7xlZZkIyjIJsU8X/pR5a/JA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX+SiuJ7HFUB2+/7f4KkNYOIuIU5o1D3utkkbDLPZ9UQofSHtj
	CS3mN/LPODGiGBnISa+zCombySccQe9LnIa46Bxu5F/fEQ/lcrJMEcPwbhnHqAE=
X-Gm-Gg: ASbGncuN5m0cSRm82uoeq6kBkzrK+atgGa5O3IriklPnsyH46qmtIAdpdxkeokHYAgU
	/qWG7iwVek80r32qpqRzNQoLZVg7dBPa89vaHJFU1RQYkspnwGDLb7pJbD0fatmx6mjIw1RC7RA
	X/iCIQ8b3XgfEkKAKSK1Pv2YgZDSJfs9SRP1tNQr4zoFLJkscUTOFpYZjI8qeu9VyRZvT2wyDu6
	TWto+wsTgPNHhQ3+GZTMzc+yuJUSpOIylE2PUr8v9UDKY37ywCuXQRCXiaESWImdEy+ToCrbVol
	PCIksi797xI7CoXOLBw7Y5doZlPf+Ya0xGyFAof+2WYzlZixVIfyydqfun/tk5aThicD+NyBWPp
	++uqq6FY=
X-Google-Smtp-Source: AGHT+IHzmqG0s8KbhRwJgKsN3xNWaolaSa63Uz9hpncdytfr8WZx7JjM4aC226UW+KKgDaLKWcS98Q==
X-Received: by 2002:a05:6402:3586:b0:5de:d932:a54c with SMTP id 4fb4d7f45d1cf-5e5c1afab02mr7385086a12.2.1741349749870;
        Fri, 07 Mar 2025 04:15:49 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c768ecb5sm2463671a12.77.2025.03.07.04.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 04:15:48 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac256f4b3ecso107019666b.0;
        Fri, 07 Mar 2025 04:15:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9if5LA8AhvK+DQlehzMNk5j2Z82W/118H5GjXnL+i0ySzQUOVyCWj7C0Im7uP2UctHUmZjFI5LQMD0r1WbvSx/Q==@lists.infradead.org, AJvYcCXjevYi3N26XZGsVP3sVUXz353HARtWpc0UNZoVJcgrIFRSkZ+rSOEs74/dgR22aQ++qeFSrl0BI3cTDmCSRjlO@lists.infradead.org
X-Received: by 2002:a17:906:59a1:b0:abf:555a:899f with SMTP id
 a640c23a62f3a-ac24e8a165dmr392518166b.6.1741349746952; Fri, 07 Mar 2025
 04:15:46 -0800 (PST)
MIME-Version: 1.0
References: <20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com> <20250307-vsprintf-pcn-v1-2-df0b2ccf610f@bootlin.com>
In-Reply-To: <20250307-vsprintf-pcn-v1-2-df0b2ccf610f@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Mar 2025 13:15:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUzZ8GK1mqXw+YgvFZ5xhOy-v_oOeaVrCtFUhk=n+rF8g@mail.gmail.com>
X-Gm-Features: AQ5f1JpiPD-qF9biv1S8tlEkcmxPY9MCTwa00AZqEgKbE5uM-n1NMvZ7sTZ9fuM
Message-ID: <CAMuHMdUzZ8GK1mqXw+YgvFZ5xhOy-v_oOeaVrCtFUhk=n+rF8g@mail.gmail.com>
Subject: Re: [PATCH 2/2] vsprintf: remove redundant and unused %pCn format specifier
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_041556_394017_9CA4A180 
X-CRM114-Status: GOOD (  21.67  )
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

Hi Luca,

On Fri, 7 Mar 2025 at 12:19, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> %pC and %pCn print the same string, and commit 900cca294425 ("lib/vsprintf:
> add %pC{,n,r} format specifiers for clocks") introducing them does not
> clarify any intended difference. It can be assumed %pC is a default for
> %pCn as some other specifiers do, but not all are consistent with this
> policy. Moreover there is now no other suffix other than 'n', which makes a
> default not really useful.

The original intention was indeed to serve as a default, like some
other formats also have ("%pa[p]", %pOF[f]").

> All users in the kernel were using %pC except for one which has been
> converted. So now remove %pCn and all the unnecessary extra code and
> documentation.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I guess this is a worthwhile cleanup.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

