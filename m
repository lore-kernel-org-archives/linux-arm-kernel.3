Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A071EC83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CftjyjJduWMdmlidiqFXIPvup6Qz4bYRSzSv1UpRW/4=; b=iM9M6ii/rLh7Z4u13I/PCOGGOx
	19HOovylP8o8FNB7NpHVKaMmZys3hbt2Wcy7sHY8ocXgYZbl7apaZGHzZBT6YEg/gnskwY/K6ieKb
	Qy4BvwCpwogDCtghL/mJgSaxecRky7eC7nsD7X7GzAqbMEjEYDVlgFEG/YABtcfO5si0Ag43qMYID
	LapFTRfxWEK7bHeZsN207KJmb2IRcwo5++QX67qkPqCdJl2I4rU0Z3WqMtUtQ1FRB6Y6W0jI+4gMB
	ig+guC+rA/8Zd8zFB68UqHZNghKH0PG+wJyCK/ObqpN6JROS392ALKQq2bLMg+aglCQBAKl7vxavL
	1A7a33jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgXg-00000005Ll4-2GFX;
	Tue, 15 Jul 2025 14:22:00 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfMs-000000059jk-2eKs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:06:48 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 30061EC0DB1;
	Tue, 15 Jul 2025 09:06:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 15 Jul 2025 09:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1752584803; x=1752671203; bh=CftjyjJduW
	MdmlidiqFXIPvup6Qz4bYRSzSv1UpRW/4=; b=CTLIsoKDs+AAcNGwt+v6mr0SJY
	xWvc+WKJK9r8mQuqjRxzO4M34aLWMJTbFOdWUMJY6L0Sd52kvYOeLD1C7FlyEZex
	qlLMqTlIXlMjB4yncl3qfY6c8eU7xkjCh4k4tVobi2YCYvi/MSpv7adKGrikBt5i
	Ju5xG8MtGXc/QE1LLZD+O1dXtwm7ubXZsFFKtnMy0EqS79c+qtT2SaQWVjVxki8k
	9jo68/A0ep1+XdZbA4Et+LE66NkKvSLG8Yt8e2SkCx8cirsSRy1bTsLH8JyhXfn3
	ZBN0dN692X7sxH2oQ/3tdUA4uAiIm2CPnYi1suLkqAKOVPkoUz+VYljMQQDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1752584803; x=1752671203; bh=CftjyjJduWMdmlidiqFXIPvup6Qz4bYRSzS
	v1UpRW/4=; b=B9e4GcnFexx8b72tNto8IVC1CXGB/qm59j9Oq0uQdRp+6VafIfL
	LgGL8Ij2sjcwfLRpx1VN5cYJaneVJ6ZwWYQPbDtTx3x0Y9/tpMdWpS7aNhDyc1kt
	vXizlT0bGavVqHYBf1qOd0Extti9P2/1QNqp4+LVOC949uG4zm16nZh9JKh2uem6
	HUauNkcHqgYZs4xfbVXkp4U0szdOqgY2u6Otus8rlV1zeVeaASfnMEYTKanmx5bx
	PkdCKwspflNdCOvjHELa8VAFVzoyf/p+qR7AmCWw5nXfK3arQYDiUiePFhen2A2y
	GlBIuxzedme2a8lFSauYGAVGWNzIL++ngMg==
X-ME-Sender: <xms:YlJ2aN6BBlbE0iacXOHFHzreSa5b8pVwWfrlVbuSaeNoh8hO-VCpHg>
    <xme:YlJ2aJ3ERUq7FQQWFGHyK6AcSY67S29KZFkrYJzA3cWD7F2quijlQzHbxi3Kb3vox
    OHhC1BAO4s5NQ>
X-ME-Received: <xmr:YlJ2aAg4wOiB49r8Xy1uQXeBYEhIxLnlNays0F9uspyGCyJiiGv4QN__nIrY4lvsMwLhFtkdiJmHkMASWgPM2-2tilV4qzY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgeeludcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeegheeuhefgtd
    eluddtleekfeegjeetgeeikeehfeduieffvddufeefleevtddtvdenucffohhmrghinhep
    khgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedugedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdp
    rhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtrggslh
    gvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdq
    khgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplh
    hinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    hihurhihrdhkhhhruhhsthgrlhgvvhesrghrmhdrtghomh
X-ME-Proxy: <xmx:YlJ2aJp7csQT0g_yv6xtcMJj2EDFX55R1OwjTHIdFt9Jtbj8JZ-EHQ>
    <xmx:YlJ2aDPMVFRG3LgRL_In43BGgiW7ZzbCXbpibsh7TYx7L2Lh_dngFA>
    <xmx:YlJ2aF3OP6upFexbcEBSnxyZ5MT-rDQ-1TW-oSaw_mYMvkepzPwyDw>
    <xmx:YlJ2aBrLAdUS59nrSAOOvdCr1Rft4aCzln6YMvJmrY2v5WlYgAoDLg>
    <xmx:Y1J2aNPymyR4oO4LxkEczI08VZKHDzO3o6knKqXXHlWOJkhuCKEIpslo>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jul 2025 09:06:42 -0400 (EDT)
Date: Tue, 15 Jul 2025 15:06:40 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yury Khrustalev <yury.khrustalev@arm.com>
Subject: Re: [PATCH 6.12.y] arm64: Filter out SME hwcaps when FEAT_SME isn't
 implemented
Message-ID: <2025071526-overblown-portion-5f5d@gregkh>
References: <20250715-stable-6-12-sme-feat-filt-v1-1-4c1d9c0336f6@kernel.org>
 <c586f05c-a077-4865-8529-08aaf16b8bd6@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c586f05c-a077-4865-8529-08aaf16b8bd6@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_060647_057420_142A825B 
X-CRM114-Status: UNSURE (   9.37  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 15, 2025 at 02:02:08PM +0100, Mark Brown wrote:
> On Tue, Jul 15, 2025 at 01:49:23PM +0100, Mark Brown wrote:
> 
> > Fixes: 5e64b862c482 ("arm64/sme: Basic enumeration support")
> > Reported-by: Yury Khrustalev <yury.khrustalev@arm.com>
> > Signed-off-by: Mark Brown <broonie@kernel.org>
> > Cc: stable@vger.kernel.org
> > Link: https://lore.kernel.org/r/20250620-arm64-sme-filter-hwcaps-v1-1-02b9d3c2d8ef@kernel.org
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> 
> This needs an additional signoff from me, sorry - I didn't register due
> there being a signoff from me further up the chain.

That's ok, being the original author of the change makes this "ok" :)

