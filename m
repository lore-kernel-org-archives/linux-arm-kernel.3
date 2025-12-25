Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D97E7AD41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GBIp9kX+hl2mkbN1urGov/Z/70FEgI+eflqjn/ioE4Y=; b=xCGEbPbISSGAxI
	Lk7ctC/IN6WW1P8AxmyeYpxyqfuCQkexpZ3e7G4hgS/fTaR9MQY80gyZzQSTQtkoKYyMNJPVmKGr0
	uppnbuVyTuaTVdr5dnJ+fODvsUARrWg2Vj+rbaP4vFinXZrpeehVjzZ+LeNb2h4c/QNgXS+X6xMXP
	Tws3sJf4wMBU18k5FQghw6/dS2j8Wne86VjnNBd3vny8RBfYt/ELJaB8MW4oWzFOjtx8bGvYSiIIW
	aUZZXmo9xChMbq1Melz00RVy74FX5iafEJcTc0CpreSPP751W6BT0jEIlLinb6aRMGBB3rN0g4OtH
	OfkOBXuukv5hKT8m/7MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYgcC-00000000Dgq-1NE1;
	Thu, 25 Dec 2025 08:22:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYgc8-00000000DgU-2Z9W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 08:22:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01B1841991
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 08:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9083C19423
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 08:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766650947;
	bh=GBIp9kX+hl2mkbN1urGov/Z/70FEgI+eflqjn/ioE4Y=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=a5yyFRb9uYBzXdPMfDY9vd4rIRPVEQsvsCeWkNpcuMRC1oFSiawSyRMjO8JH0ss+Z
	 x/QqhbYn4H2K5w5BJz4Wbqbc5yjW86RK+JUdiiASMd3rYdF75g5W/ucdGbgLZeZQtJ
	 M0aD3nb1BRHmorKDtA+gqJ9Vunr1cAH1IQDLNQgQjj3FSAKjIAustTvo2HAO7oejED
	 BQfq3K24nxEX3VBOrl0jQxIikCIXP2lCn1R15NZhdsQx8JQtBjoCUej1u3yfR7469C
	 CySkvxOuqSrDJxvFYWV0Xc9oVlUyzSzGKoOIKV0FOW4oDwBwhKze2XTGnNHiTt4ExL
	 DrphkeTLbTz8w==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37bb8bef4cdso61387101fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 00:22:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzF/c+PgZO1v5iBNKpdlylONLq+xPjUWZDQL9pb8l3c6kHrtJY77h3m5YFS9FeSyYGO8i3wcc+qTAUg4H+I7MP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0fE/Lvf/+6nWh8qSmrzulFp8KQsK+z+a4ZWp5QW3pW48CIMFd
	8XdDzSChCTNgFxZdUaEE96k/Fn84KdCdsJrl1nhnKYC/vybVr9XvA/787/hrqemTLOoTdG3vdKo
	PGaTEch6eHFThXPZpEvkg4oWwtbQsZ2c=
X-Google-Smtp-Source: AGHT+IFppeSVdlVccV8ZLOVWMT/HmjByzAPqOV4k8UjgxAxDAQTT6kTjy5H+aCpOAkmg3adrDHLP6/5j+VdObqpd5IA=
X-Received: by 2002:a05:651c:544:b0:37b:95ee:f605 with SMTP id
 38308e7fff4ca-381215af948mr71834481fa.10.1766650946149; Thu, 25 Dec 2025
 00:22:26 -0800 (PST)
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com> <20251115141347.13087-2-jernej.skrabec@gmail.com>
In-Reply-To: <20251115141347.13087-2-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 25 Dec 2025 16:22:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v64h5E+hz-G4HEBesVgu4bkFfTi5vNEpU2BQFUYHKCqY8A@mail.gmail.com>
X-Gm-Features: AQt7F2p6GeAz5pE56ddcluDZYRCFD_O3UDD7G_yS9PvFCxlCXBqEjAn8ZBftz2A
Message-ID: <CAGb2v64h5E+hz-G4HEBesVgu4bkFfTi5vNEpU2BQFUYHKCqY8A@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/sun4i: Add support for DE33 CSC
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_002230_107841_A74F2C09 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> DE33 has channel CSC units (for each plane separately) so pipeline can
> be configured to output in desired colorspace.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

