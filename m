Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14027D61013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 13:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJI6azVkXkgIfaMxff/M3tZ2LPX3nIaJgPt7XOt8j40=; b=UKgQ4vR4Kj9t4nRQ3LXfbuDwph
	4ogJ43Fl/gU9GnS6+b4482zidC9ZS2fXVXOJRM9s2Q+UI3RRZn2RPRuGyGRz0vFkssX+xQ5TajmcR
	aIzuWi2GsYlV989vlxiud3TqHZ9L/rHC/bQ/enPm8uirI4Oz+l+KVxthMIKb36vePJYtSAujmHb3r
	y6ye+/3lVLpDkRNOiL2PXAZjgqH64cxMTzgrG7n1XQ1YngOhoGhPdlJihx5Yu8aF/rzYoeEUG1sHv
	UsNLsFpdv+dzr+euU8yYeSEgTsuNmVKiAaoHqQbY0JaSy9+3lkRYxL2nEDHtHdYHTJMPduWypZmDw
	Xzn8v9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlS1l-000000009kP-2yxF;
	Thu, 29 Jan 2026 13:25:41 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlS1i-000000009jg-47OC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 13:25:40 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-658b7d13f09so1835080a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769693137; cv=none;
        d=google.com; s=arc-20240605;
        b=ENFWhhjL2cWUloEWF9F0E3S2x9eqyL/YaUdnZ13PZqsnka4bQd6eZtZTU0J/mQNzZm
         WLcjYIcHuGv6+cVt7YgJITTQDh5lgrxXNL4rkeo7GiWvZDtXikfSrUVZSdN6Yub08pbL
         wwlM2DDY9WOyuUphoUC6+t0+u8O18h2SaBrTeg8EYBV8KDKv347qN9zV26h+GhPR4g1h
         2JuyM8RI+2qgsr4666jaDkjEmNHIfTajHIOCgcpd3q6F+/Vvdt89T1iHcb7q3r2U34Ve
         IWGG/xIEkegTKe/xfE+DXZxG4qFpLjC8DsP4Z/ScPaMqP8tbbX0Hpe5cSxeVfVtQi0FF
         RvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iJI6azVkXkgIfaMxff/M3tZ2LPX3nIaJgPt7XOt8j40=;
        fh=izq2G8oW6XlH+pfyC8IU/Sb5NNUZQyx16qU0ejlzWiU=;
        b=fWUHFn4dheDdLNtWw3ViSAkepJOykmZ75YMS+KtEHLSwMovlsz0wvWTG9ISrJjRXSg
         LC7eB5sp3uQPQHHbs3WACvxQJpB5ag1NgTqKY4uomlX8Hx1drSB1nukiggdwICu3gLuW
         grx/7TAN7qjUP46khaI1xlDdZN4hHvx7Y/R7ZWAwEOr4dvMutcUYl7MkAdvW3nv9mULq
         UuFNkKHqjczGSjQGItfaBjfyxeQBacgLBDbrbzBkJilMmRv4t/GMwJuNxQycutbSZEq1
         Bv7UdIRASSOwp9JrjWf9S2ulNR6GjEKLObecziJtnv74Wd4JBbVgb9GD3fV0IZQGpJBn
         iz3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769693137; x=1770297937; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iJI6azVkXkgIfaMxff/M3tZ2LPX3nIaJgPt7XOt8j40=;
        b=EfPTXneIAk593rQxm9y2O53PDgSXicU+AII2b3OCwUJ0h1BB1q0iInwSniwyoWLH8M
         G4zv/bu5p842to32cmgqYZG8wE6Ixwxr/DT7WaP0z60kSV7FVivWytMMVfbIp/y/O35i
         tHRmD1hjbUTb9t+DF0vRU8vc4cA25J865nA6YAjp4/ViLGxe3Pbt/mUQ1rQyyYmUqpV9
         f9R/9rQexT4IQo8ebCZNAilDz2HGZd87EHOndZy53mllpQJ3gPVv66vGn3oQYKY+5Jkm
         TQ4eu3Ma2pet9Y09dxuuEQzwYemAkUB6C4Zu+ZsR8UbiaiyHs6wbS3Z8Z2tc7lpOF2Nc
         Bj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769693137; x=1770297937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJI6azVkXkgIfaMxff/M3tZ2LPX3nIaJgPt7XOt8j40=;
        b=KAeM1YAu5WhyOvA7kN+Mr/QEWUWO86OIX+nffDqR5efzm/M99CLjOUI+egsyfurs+N
         qHlS5S9z3+ifyuI/rJz5ypJHgE7EFnX21KOGxNChXEZzeNWEfgATN/xDdukku2NvgcX1
         XtRxp+BW6C1zfj5+JcxqP9t+PMbH9kcOLFAOMqfAI31OtZJ+bXHYrUJX0IaukQeeMlD0
         na7egiRwFhLq9OhRH0fow/owQzQIUns0dvhiyD1D/Sd2gUmJceUCIM6x00OrHNC6Cmb8
         6vaPz42jDqFrspXhnN2xeFO+a+vcPLG2HXvxwIg3Gp2Fhldj27fiDApGXFf6TUHUp3uB
         wz+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKg/gRrsPc2g0V7Yvy47et7vXYD2r7BLD6fxOrkA8wrUFlz41vmks4VHKiYXTI/SAQDoc/KwTJkcr/wfadxpRI@lists.infradead.org
X-Gm-Message-State: AOJu0YxYlgAfTtaQSiCrfRSDgEq3FBKuHP3REuechQDv2rkm4x4qNr6s
	nkaZrZRg0Pq2JB7vyu/1m4HTeDxMapvhqjUNTj1oPOJn8tHw8TUdcr6l+mOr6AYrMI3zqQHlFJT
	dG0BvOGfZa1QlDhdfAT7sde0mYSJEFasOFoVT0RNMLA==
X-Gm-Gg: AZuq6aIKCA58afk30KizXMWYgb+u3PC6EOa6Ux3sRP/2HpzyBtnO4BtM27HBmt2hVOx
	MBgNTKELQ8gtpbhHBGFlas9EZY5HrYsfMKSWyNqJg2rdeY5WDQSNEa0BIztNZv+7kyb/kx1sxax
	oxcS9zrD/uH4WfbDhJPJmkAla0M7lUS4Gvj97ERrmVVlmpICRZovaxKOUU8n8WtWHHs7ZPeRFSL
	RO8VqTIU8FEDFzfqPciRDaHnahBaMNWL20/C22+UCjGz/rddI+v+yiJPpGFA9FTJNnL3hBBDjKs
	UPAheWmqtEEeoOTXe41k/WEB
X-Received: by 2002:a05:6402:2792:b0:64d:3b22:a5b9 with SMTP id
 4fb4d7f45d1cf-658a6064db3mr4654871a12.9.1769693137209; Thu, 29 Jan 2026
 05:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
 <20260126092159.815968-5-vincent.guittot@linaro.org> <20260129120757.GA358439@kernel.org>
In-Reply-To: <20260129120757.GA358439@kernel.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 29 Jan 2026 14:25:25 +0100
X-Gm-Features: AZwV_Qhzp9iT1f899kqFHSBaYxaRjfwJBMJyrZuFRXvntdrURTUvSVnGWlmRJag
Message-ID: <CAKfTPtArVxXnAw0F4s03QH3wTPvJ3RRBGf2JQ2burh3v=rS-Tg@mail.gmail.com>
Subject: Re: [PATCH 4/4] MAINTAINERS: Add MAINTAINER for NXP S32G Serdes driver
To: Simon Horman <horms@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com, 
	p.zabel@pengutronix.de, linux@armlinux.org.uk, ghennadi.procopciuc@nxp.com, 
	Ionut.Vicovan@nxp.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	Frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_052539_036822_FD931DDA 
X-CRM114-Status: GOOD (  18.28  )
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

On Thu, 29 Jan 2026 at 13:08, Simon Horman <horms@kernel.org> wrote:
>
> On Mon, Jan 26, 2026 at 10:21:59AM +0100, Vincent Guittot wrote:
> > Add a new entry for S32G Serdes driver.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  MAINTAINERS | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 765ad2daa218..888674a308a5 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3202,6 +3202,15 @@ S:     Maintained
> >  F:   Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> >  F:   drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> >
> > +ARM/NXP S32G SERDES DRIVER
> > +M:   Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > +R:   NXP S32 Linux Team <s32@nxp.com>
> > +L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/pci/nxp,s32g-serdes.yaml
>
> This patchset adds the following file, not the one above:
>
> Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml

yes, that's a typo.

>                                   ^^^
>
> > +F:   drivers/phy/freescale/phy-nxp-s32g-*
> > +F:   include/linux/pcs/pcs-nxp-xpcs.h
> > +
> >  ARM/Orion SoC/Technologic Systems TS-78xx platform support
> >  M:   Alexander Clouter <alex@digriz.org.uk>
> >  L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > --
> > 2.43.0
> >

