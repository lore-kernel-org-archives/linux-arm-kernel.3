Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664CAD216A3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UA/yY7fbsmAtbpdVmUxmHBhgln+Uq+ruk57Ak1wbz+s=; b=qj4/3q66Y2Eb3hE5bwlSgGYtt9
	KP3L7i1wQMTewZPmySuoNIlxHcdK1EKxjMB6n0SeDyNc4UFsR86LHyk0JSL6NQycPd1HWSKh0b2Z7
	m6Df6Xz7QC5RRr5VQOj7A2KMIYpa4gL8RigEOAkEZuCIXc5RLFymuB3/VZ9k0+wHbQEbODI+/Topf
	X/9WAcFH7lD3Q2K03/XG+Ijdl2/y04gOT5h31Gb0sxhA1C3oIc4uJUjDlqqKpksIUZWPyu1Tu9qpw
	5mzRUH/jADuAmCQB9Vph/QXUpuZevOhdc6kPGLJjm2b5tHihO7N6qVTbe2aEjOdDU6eB4ozgiKrt4
	O4k5lEYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBWv-00000008E4l-3P2g;
	Thu, 04 Dec 2025 15:46:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBWs-00000008E3t-38bT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 15:46:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47798f4059fso1551265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 07:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764863161; x=1765467961; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UA/yY7fbsmAtbpdVmUxmHBhgln+Uq+ruk57Ak1wbz+s=;
        b=g3enQ4AKNn7mCCgmppevJ8esnozxTbsbhOD4jL8D/cOOAt8LL7/ZQDoXffl5NxeXnC
         /dXThd9DTxTnhYx5YOBCjc3rdj7eKA7thdjmskyM/i3lrFPJm70rGSoS+4vXxj7Wboi6
         qlWyfCGE/bMJprcqBJ/6Wq7zdPRvN164E2VZp7hnlFINx+LCgPlhafP8cOtG1yloVCxe
         Vn/tkyZE80TJgui460UTSzHlhav46MeoKrJwi3Ed7NkkzsLcNNFYKaX0azfsX3s9Zwbc
         0VxS2sVdBcp66dBwW/y+Jo6e4FOzOIJmpVKlMY9ePAN7dFfwkMMksaDwfpSAvDYX0HLI
         L/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764863161; x=1765467961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UA/yY7fbsmAtbpdVmUxmHBhgln+Uq+ruk57Ak1wbz+s=;
        b=X4z5ZzH/az5wgio6GeWqVuDcC+pn/qdiyWVhYR4AXdieO1VaAKmmL9Lc4brQ9KzZur
         TDre+mHVhrh2FS9OEY+p8x8BL0uF5ibe0146qGqSUASnhG5zfNjFGZgxqMafuB0MBNha
         s6Ek0i+yLNSTTUuDlaNPldeB1nVngSlDTazPheBUJpNHnDECrJBLblnvJSoCrUFYwXqr
         GJ0KFD51iXOkWKV7y4qL2+w5OzC95zMwy5I8ilF3uim2i553qtkYhjyHYpBPFMVwGB7t
         jteMSnGA+Ib7WeRdfyv1iH+RhGH68hCHR1qZKQ2Jfw4ffQhJenHba/0ERMfLk2tZw60z
         F+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf15Aaja8aThRrYO+jAmoy/gyMwQ35wFnePiPynMEBI8ybQ5ro3TqpqpSD1cptanRz+hSmGmdsI+e1luqDzTHZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxYC9e7nt/urdGbBcxWhtxWjcRxp8teDk+KgaI4sS9JQuwn8yYC
	ABAr9Fi8bsGZxV2cJ4kSbT3QqbaKc0IM39k5F57rrTXHOMbNc6sqOmS+
X-Gm-Gg: ASbGncuSHj79dCfOxuc8Q1TURBfPBU56GF9YpC++UK9GrSt6IwXlRm0+tuOIQ/nSYJU
	uBagjZL9TKCzUhoBAvQQjDQ4jOJP+lKSasA5Qs8upXRrTbTl46oy4rf1y9Fq9eWhUTQbjOxEx07
	iTxTd6s2/I/fVKaxn2II5AUobDwmBKnWCt1UCLBt7gqzZNXtiOWP4X51ynO1YLt763DHIkD74Ws
	LiF08ltx+gGjqw/oLuOuEEWrgei8P9ha+1AzngOggSjNUDntdCIYGyedO/mddjg4jaxqToGOMiW
	Q8xNFg7VtRFTVPNrHS1sYM6DPVklOgb5lcjBbyNe+A7oOdzCMEtNX27BxCmxHsHoLk40FZtN/ZY
	f9+S2rpUUdbILC0/+ASFm0jBtQ3XWMRarG3Nw/msQ6i8DKGv38RDn7UGSrAhgv4kyMfQW7iIwXf
	BjjEI=
X-Google-Smtp-Source: AGHT+IHDhvMR+KTLaJIj8x4ZJCrP7vfLKbK4kH2ayI19QzVBsuMMnG5taOmZS+QplfMCnJIxB2E8tw==
X-Received: by 2002:a05:600c:3b90:b0:477:9c9e:ec6c with SMTP id 5b1f17b1804b1-4792c8f2462mr33160085e9.8.1764863160680;
        Thu, 04 Dec 2025 07:46:00 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:dbb2:245d:2cf5:21d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331a4fsm4069295f8f.33.2025.12.04.07.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 07:45:59 -0800 (PST)
Date: Thu, 4 Dec 2025 17:45:57 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Frank Wunderlich <frankwu@gmx.de>,
	Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Chen Minqiang <ptpt52@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <20251204154557.b7asnuxq7hiy5zlq@skbuf>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
 <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
 <20251130080731.ty2dlxaypxvodxiw@skbuf>
 <3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch>
 <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
 <20251204131626.upw77jncqfwxydww@skbuf>
 <aTGRvADkT-1kAQgA@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTGRvADkT-1kAQgA@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_074602_821722_04E52F18 
X-CRM114-Status: GOOD (  20.03  )
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

On Thu, Dec 04, 2025 at 01:50:52PM +0000, Daniel Golle wrote:
> On Thu, Dec 04, 2025 at 03:16:26PM +0200, Vladimir Oltean wrote:
> > If this is blocking progress for new device trees, can we just construct,
> > using of_machine_is_compatible(), a list of all boards where the device
> > tree defines incorrect reset polarity that shouldn't be trusted by the
> > driver when driving the reset GPIO? If we do this, we can also leave
> > those existing device trees alone.
> 
> From OpenWrt's point of view this would be kind of ugly as we would either
> have to extend the list of affected boards downstream, or fix the polarity
> in some but not all of our downstream DTS files.

Including the downstream-only boards, how many compatibles are we
talking about? If we patched mainline to cover all, are you confident
that it would be an exhaustive solution?

> I'd prefer to rather have the option to force the "wrong" GPIO
> polarity for theoretical future boards with that (very unlikely to
> ever exist) NOT gate between the SoC GPIO and switch reset line. That
> would allow to gradually update boards to reflect the physical reality
> and yet the driver would not break if the GPIO polarity is stated
> wrongly.

I didn't get that from this thread - how would you prefer having this
option implemented exactly?

