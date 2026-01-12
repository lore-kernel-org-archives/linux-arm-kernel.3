Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132A2CF45CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 21:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TZYdcy92buA5+zb8K4DSLhDN3VCy/dmlapRWN0t8u8=; b=nD62ENrqYxZRs7pr8MGiwY1n2Q
	SxzVNNvMRSC0f5gPIyJZUu68upAt4Cn85aio6kRtg9Dtf5tGWdctnWyu6tK+HbDigUdG9pfc+8pxj
	KfWYOQvytpLE+IDAFZhHWagF1CEJiwD2mW6VkM5J7XmeggmZS3kkVBQb/D3lIHxafMGw6oObxsElR
	bVes6hhbgKuJuE36PepKtzlbK7UqFGxaQ9KgkSC4NMAzNK2gMGhX8YwvfRnh8F8rIJ3Jkq0LtVPd1
	dkP3NZLowC9EO+8LWr1u7i3GlZd6Dx+1hka9YgKboAuq+M73dKlP2vwDi6RBttd6tb5iYyACOtnVP
	jdGV8Upg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPMZ-00000006D33-2VoY;
	Mon, 12 Jan 2026 21:22:11 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPMX-00000006D2h-2Eg7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 21:22:10 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-11f36012fb2so8977877c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 13:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768252928; x=1768857728; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TZYdcy92buA5+zb8K4DSLhDN3VCy/dmlapRWN0t8u8=;
        b=cTCZBjvno4QMB7ep1OOz+ALEvmdTvOizquUJB2YpwEgrldMwHt4qgiAj6Lr7t63wHO
         KtbZdw2M9kv/x61CJCf/TVEy6kjWt8gVTma5bzHFuxvwX5FBP5c73KHlet2GC1jOZt9Q
         jH47SBM4jp+RvyjoerBVibEMoHPPMSJ1MEPPNP3qfgUQE2V1LeyarxewhTWYTTMcP05Q
         teqHFmmTdMZmYrgEfwshWM0DkRtcdfw+wzlyvuWk+DyBjYCL8U7k7wC5cvrR1o4OMVUm
         4hMTI4yj6ldbxgplKPWfU+5t+5ftZ/p4V/0eZUwKm3hfRkNI9KN6WDUZynSq08ZS2/h1
         CL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768252928; x=1768857728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9TZYdcy92buA5+zb8K4DSLhDN3VCy/dmlapRWN0t8u8=;
        b=b3Ab/T5zT69CLAHKbMt4nsJ1disTJiLVy9fOOeS4vmI8vFb10KNw9t+sYqeqfjZw7E
         J/AM9jF9Q4lbXv8ooOfLL40E8QdmJmm4YF5oD0y2T3Mtsfctzpd6rZDFitSkSH95UZzj
         2pqqBY7mBBJLrMzaCTOtCnN+/QCD8VSt/UK5xIkm1sJ/u8kkrwzpq1YAvvesPh42X2Ly
         Pxp9arQGktVTYBkezN9pEEXlOFuQgnnvuvAViQVydp0kugPaUkR+sg8yNf1bx6ACoH6E
         e0zKmM2A1mESEREcavQ0j9T0u6AR2kJ5F8zN2XwoGfo3KQf8uqGaQghKNpRhXwUtJQOV
         ElzA==
X-Forwarded-Encrypted: i=1; AJvYcCUAX+5+fnZhj7uG1xUWIMeH3Ep5UMgh8WowmJM17Ly0NZx2oVV4BrJPlgy2WeBpr8IT1KLXi2ORWOC7YRUDuWp2@lists.infradead.org
X-Gm-Message-State: AOJu0YxOWoJ88WplC77mBFtfnHya+2n6cuNL13z4IyJxLWQkwBspw5HO
	Sz0LXFvDUG+PsXKej5GO7TURYz+a8PxRMWsYt0H7NoHJw7WUSOl6CDjLd3EEUuHESPDyT7uVL7m
	GEsSAb+h7lMKL9ijffTYXEJPXJNQj0h0=
X-Gm-Gg: AY/fxX4EZspuchGqn3z1fDPQ/PPnNfJCP6zrVDr+0ItY49j4PmvKituruqXgRo3G4D1
	Q9CcVABchNAZRWtoOT8pm3GNumLc2N0BgpGx2wAg9vbm40+DXbMgAjd1rh3aE8nJtzSjke6GDKY
	U9FE2SAsxAofA44g3G41zUcFaf5W6tFtWGgF9a9UdhgMkA80uo3fYhr2xD9rQ9dBf5b1+xBdXI8
	4otljtw1UtF1INT4GxMHveX4TPvbIUZaZ6pl0ghp1QEM3hxV6kdilFDEHhRDcLlkMq1ppY2SaqT
	6WrRMttP
X-Google-Smtp-Source: AGHT+IGnz+TQ1FzkSNkzmiP6ZsSsl7BSHvN2O5m/ZEyz5sL8MgaN1tiwfu3haADXH57oieB3BqIDHqdJD5bVWVx+bZc=
X-Received: by 2002:a05:7022:1e15:b0:119:e56b:91e9 with SMTP id
 a92af1059eb24-121f8b46102mr11509935c88.26.1768252928474; Mon, 12 Jan 2026
 13:22:08 -0800 (PST)
MIME-Version: 1.0
References: <20260111201040.162880-1-anirudhsriniv@gmail.com>
 <20260111201040.162880-2-anirudhsriniv@gmail.com> <45bdf2a6c0d33dd6ce0fd3cc279ef6edc509a540.camel@codeconstruct.com.au>
 <20260112-whimsical-annoying-fulmar-25e4d9@quoll>
In-Reply-To: <20260112-whimsical-annoying-fulmar-25e4d9@quoll>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Mon, 12 Jan 2026 15:21:56 -0600
X-Gm-Features: AZwV_QiDoxEQSz_VBTL5mNLDJkArkIs_IZ-EllE4kfBgjkmOnTgx6aTvsjJIjLo
Message-ID: <CAJ13v3RKydFK+sP_Cm-HnQjsOJSDyX_dsGs_Yy564V=Wc7tQFw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add Asus IPMI card
To: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_132209_572178_68BF503E 
X-CRM114-Status: GOOD (  16.76  )
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

On Mon, Jan 12, 2026 at 5:47=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> >
> > It's a bit bike-sheddy, however: the pattern tends to be
> > ${vendor},${platform}-bmc, but as the platform can't be specified and
> > the card's function is the BMC itself, I'd go with "asus,ipmi-
> > expansion-card" (I couldn't immediately find a useful identifier other
> > than the product name).
>
> This should include some model name or at least soc. What if you have
> IPMI card for ast2600 and later completely different for ast2700?

Personally, I was okay with Andrew's suggestion of naming it
"asus,ipmi-expansion-card" because that's the official product name
and that exact term works well for online searches.

This seems like a pretty niche product Asus announced 4 years ago and
made in very low volumes. I'm not sure if they'll make a new one with
an ast2700, given how the modern trend is to have BMCs on
motherboards. What do you think about the naming Andrew?

--=20
Regards
Anirudh Srinivasan

