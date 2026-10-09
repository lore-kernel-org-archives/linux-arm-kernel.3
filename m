Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790BCCA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 21:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOjh8O8Oq6aRVh6JgsLLuSInkH3+kGN0eVIPZ+j+jmc=; b=nuVtl+GWSyqCx6Do0N/xAsqApn
	h77+a4X4HLTC95Pl9aZj7ui3eLloHKCu1NdRD3HCL/y4l3c1t9bVEBVb2D0MgYAHTQUa48WqpGemW
	YgM6sFc734A/r7J7RCaLbbjY8Bk92Nq+J1OCXrmkbXWqIo/lYqzkRF/OBFP1vTwrf4vZ1931l4yBi
	aW9cAyHVKjoAUAKwZ9AxUnlEfXPo6uMgjGQVvOFttLMk+ytY5XSyhvjj3LsEpG1Hh4gmJpkugwHXx
	G4OMnIxINc/+ruhMtDeR1SqO4W4FASXppkSHv/S1vFGryrLU/FsjLhUltDpx42JUo9fJsb38Fl065
	NaG1Dj9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFHxS-00000007DwU-3nPO;
	Fri, 09 Oct 2026 21:16:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFHxR-00000007DwM-0w4w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 21:16:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F6AF43D59
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 21:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821871F00898
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 21:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791580608;
	bh=pOjh8O8Oq6aRVh6JgsLLuSInkH3+kGN0eVIPZ+j+jmc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cG+2CrOd/QgTwToV1AwTrkzyFuPmqfc73GdFV7wNvYOFnXZWbZWW/rrgmv46M8QYd
	 /coo1iRKTKUtKMdYTOT9l2sZy7jyZF6JHKG42SK9Yvohzctg1HD/lqYGjIZ9leOfAE
	 tV94AUotzs5KkNtvmqM0jwdlURnWerRBOt1KAvdHH9uVLTv8lBAUYBGp+WV/73feVu
	 SP0MhUlNc6O/DtAyJEWAWEmsKbt5y5f2OTFgYewpx1UmHilkQ/atenLnBQ23ZWxisa
	 wVylB5egjye+9e7J6pojE2czF6KCRzjr2GjzIFc1QRrtLA3ggcgPhYLStpTLCEqGG6
	 z3/NcrfY8ydGg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a9787a14ecso1882481fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 14:16:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzcNtfhhZ5A3n8TV6FFlOkA6cAShsbU7vsoHUwka6f1Jud+7m4scpMn7PIBbueSOjLcMmiqvEng12P/VQwmrCh6@lists.infradead.org
X-Gm-Message-State: AFq9FYLi+5buzZ1obwGJGH8Bj5XC2AiGzOCXMkQSXGloqM5+c9Gy7iDZ
	0AFg4kshyWwoEvIZpKmieb5SBNEexWUD7Y3qgY4pdkX2WmeBkSi0KrOrUIYUN7s0VXpPltjASSc
	K1xV8JDp46qex6/SaeYINZnQEwhQ8is0=
X-Received: by 2002:a05:651c:198f:b0:3a7:69bd:80ad with SMTP id
 38308e7fff4ca-3a9c5253754mr7279251fa.6.1791580607219; Fri, 09 Oct 2026
 14:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-5-9352be6b86b1@kernel.org>
 <CAL_Jsq+1O+os8=YGUoKg6zCm-r0gQ35baKX=z65uTQNB0i=RVQ@mail.gmail.com>
 <CAD++jLm+yRo9e1UDhnaYrdPq28mdyYKQZ6tdKuUa3UG85imkNA@mail.gmail.com>
 <20261009131902.GA1195061-robh@kernel.org> <CAPx+jO9F6wUG9M_cV-xiF-KAKD5kJ02n+yE6L9vocs=KWaKFTw@mail.gmail.com>
In-Reply-To: <CAPx+jO9F6wUG9M_cV-xiF-KAKD5kJ02n+yE6L9vocs=KWaKFTw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Oct 2026 23:16:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLkkWUpkg6gwZuRzwwLU5E_9AsLiv8PSjT04dvNFj4DBBA@mail.gmail.com>
X-Gm-Features: AclHuK9p2mVaeX7VK8JUI4a76kwVWB2K8tlFEwycQPwaH1SFyM2rvP_ArIybIGc
Message-ID: <CAD++jLkkWUpkg6gwZuRzwwLU5E_9AsLiv8PSjT04dvNFj4DBBA@mail.gmail.com>
Subject: Re: [PATCH v3 05/18] dt-bindings: display: ste,mcde: Allow power domains
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Lee Jones <lee@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dmaengine@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Oct 9, 2026 at 4:38=E2=80=AFPM Ulf Hansson <ulf.hansson@oss.qualcom=
m.com> wrote:

> I have queued up three patches [1] for next from Linus via my pmdomain
> tree. The patches are also available for you to pull via my immutable
> dt branch. I assume that should resolve this problem?

Way quicker than sending and having a revert accepted, and
way way more productive :D

Thanks Ulf!

Yours,
 Linus Walleij

