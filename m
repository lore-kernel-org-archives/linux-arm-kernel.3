Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3566CD13DD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 16:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VMCABcDQg3bj1MpLgUPb6hZG0b0uHbN8RDXsa01+ho=; b=ekwH1NyTg1r6jPp974pD13gFFd
	wmmzOBHZCAX1cg9KgNgliIoni05qhPyYb48o5qEAlGf+FIuGxJx3UF6RNUFSDevs+M4vOZUuQjK4x
	hx6aJQ8P3dpnV9OX/2Sr/4cd0KeSG/kam72mPHyTInM7TocnoZOcLDH2FTpG7yt157427FR7REoE5
	ncs/YTsD4+4/4atHLHO7B2RtdMo6PTMuJjSc/8U8louFNJov7EK6rVDU0GG4NWZkBfrut0wtT1J/4
	tm1vwNLGO16Ni7MT6lcAJPX8EoEaPr0PV9Smok7ByAGoeCjO3vcgKCjYrPiQ16zy7qzoGM5wYDDdA
	xEKKy6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDX7-00000009AQi-1vvZ;
	Wed, 12 Nov 2025 16:17:21 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDX5-00000009APG-157f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 16:17:20 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-3e4228e0fb7so578512fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 08:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762964237; x=1763569037; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8VMCABcDQg3bj1MpLgUPb6hZG0b0uHbN8RDXsa01+ho=;
        b=AhgGIIkc3sA97kppJXnS0Mojkh6RRGNZ1eycDzjbgxNeourU3Uhur8CkAP1I6083E9
         cXGpUAgDNb65WQBXyiLjb1Fh9x9NdvDz1Lhq6AZlghZ/zJHpP78LGd4YR0Hgt2YaIt+e
         PrX4H80kDQsZZQ/Rffm0drhFigXitjDrSAXZKR06YNmkBWo72P+rD2E8T9VA2oylhO/c
         rSYy13eHR+maW6SCmURY+GQwRiR28ldx73SOa/mRfI4oFHMxR7PnKewInX03fsMBVsV/
         gIJ1cc6Uukd2FvzKyy0WRR4dr1UbeGQyd87UK4siUWrTzUt9XkdATiucN7XACOi3FNTM
         RzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762964237; x=1763569037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VMCABcDQg3bj1MpLgUPb6hZG0b0uHbN8RDXsa01+ho=;
        b=bYfJRHLS6oQPrRyerS1+7w5eQ+oW2lOo6cuKHx7+ba/db5Xx1ma3KUapWQhTovopMM
         Qm+Zv7ZF34KS18DeDfo6QMBheAnHdVTcif/d7YZd4YZg8Ga3xKwdXWgcIhu0A/SyXQv7
         s6GCfi3/HDaNw1dT4f2bKS35w8IEinvYFzNfI5Th3p5vNhJ+5HDPLXsmcuouf4MRs6Gv
         pia9DMgz5x8fBw2M4468tI0GzZYq2CI2TWKiq6XQzGlZWmx7M/Fg3izblmRhNhGwylaS
         jyU+oW4JH6QbhUnDPBq73MkdqRqZ3d+rYBtbAZe9eoQd0kdzAth+1a0FfKXGffoH8rGm
         K2TA==
X-Forwarded-Encrypted: i=1; AJvYcCUBMtFzUv8eKNiYPy2WLFKsywjymlOAnspcOqwGD2bHSeNdXnAh2YWhH6WT99CEnRs/IMpWJcsgyguuCSW7dVIc@lists.infradead.org
X-Gm-Message-State: AOJu0YyT4FAZ6Y2C25ZEyxZVMjBek1DLKxGuBsq7XnM476ArfslKwQN9
	b3VE5ztik/H6tluI7sFfdn73Pz0CzwFXoqrt6TfMW+/9rmj7wUxtzuHjRt/KIJH6mp4vrFXGu3q
	MSsFHBciuaprd5IEILZ1z6sdUx2D5hYrkP58wbfkbZg==
X-Gm-Gg: ASbGncuUWRs5f5VfdTmMyt9eIdkMXA2GM/k0sNRXAOpVY8hEdQ6+Cx/laf7rX0TwrVa
	GIPsBX0+XPtWVg6gXpqUjvIsLRRV7bS/plIKwZewuvR7KjbcOH57/SD2RysR2xnY4fTd1Grqdpy
	FqQIX5USk4gl7LpFCqdCXwr9gmmcSZYLrw7gFluzQ6rid+8yW1yXuwK8/hCKiMXMiDXaUEji4gA
	zTK+ixBZQCc0LD7FxA3J8A5gCRVuceQlG5JL7xa4D8sW6DbXaOuesiOvvsTBA==
X-Google-Smtp-Source: AGHT+IEsUM5mecSa8OvDA3eHi3Rt//Ce7dwGX8jwgmu78EO/L2nrGwzBPId/luKJz03aDcGKbnhMLH136z6/UVOOfm4=
X-Received: by 2002:a05:6870:5694:b0:367:6cdd:8c52 with SMTP id
 586e51a60fabf-3e833fe5841mr1730179fac.14.1762964237482; Wed, 12 Nov 2025
 08:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20251112-phy-notify-pmstate-v4-0-717d78009d15@linaro.org>
 <20251112-phy-notify-pmstate-v4-1-717d78009d15@linaro.org> <aRSyTst8Vd-Qb2Ha@shell.armlinux.org.uk>
In-Reply-To: <aRSyTst8Vd-Qb2Ha@shell.armlinux.org.uk>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Nov 2025 16:17:06 +0000
X-Gm-Features: AWmQ_bmeUqnv9Axu23X8v5l7CIA0NkBrp9BKset-SthjnPv3fEKplJqCJGUzBUo
Message-ID: <CADrjBPqPUOQThv+KmeYyUhMA1S5HL_F8FwTa_srcZM43P4GzyA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] phy: add new phy_notify_state() api
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	William Mcvicker <willmcvicker@google.com>, Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_081719_299429_AF0551D6 
X-CRM114-Status: GOOD (  10.13  )
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

Hi Russell,

On Wed, 12 Nov 2025 at 16:14, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Nov 12, 2025 at 04:05:58PM +0000, Peter Griffin wrote:
> > +int phy_notify_state(struct phy *phy, union phy_notify state)
> ...
> > @@ -255,6 +266,7 @@ int phy_reset(struct phy *phy);
> >  int phy_calibrate(struct phy *phy);
> >  int phy_notify_connect(struct phy *phy, int port);
> >  int phy_notify_disconnect(struct phy *phy, int port);
> > +int phy_notify_state(struct phy *phy, union phy_notify state);
> >  static inline int phy_get_bus_width(struct phy *phy)
> >  {
> >       return phy->attrs.bus_width;
> > @@ -412,6 +424,13 @@ static inline int phy_notify_disconnect(struct phy *phy, int index)
> >       return -ENOSYS;
> >  }
> >
> > +static inline int phy_notify_phystate(struct phy *phy, union phy_notify state)
>
> Should this be phy_notify_state() ?

Yes, that's a good point! Let me send a new version fixing that.

Peter

