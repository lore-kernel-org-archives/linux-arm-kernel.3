Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CECCA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 17:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOV4gqFTB4BnPT4BpjZV0TRwwy1hdPuOvpKA+jIuMf8=; b=AVNI9H8fTOpxQYLbWGtkUJV/PC
	oIVFBsQvD/MpDSObTLR0eZIfMOmAJ18NPcl640yIa3aqL+igeRxK90V20bIrp6dZolTIn+fNBP57q
	U97dqebdyquU3ztgdLx3NzcZYTe+HozU521nInSWH5pDB3oVsPea/Ohd5tlVUx7eUe2CtaeBFTdGv
	Ysg5UZRQYDK2ZWPA4RfS941fMbw+cLpLZl+Wc3qUFP3H/FhGKCAY/HajkU43nhQGhItEr8teKaTjd
	s5lGev/UUk77SGwOAno0He2vsVnQ7u27mi+Y+osaXIZD4YRMqcYgLepQHYCf7xa0+bmZ9gjjIlyto
	BIF1Ai7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFELI-00000006nNF-0PqJ;
	Fri, 09 Oct 2026 17:25:12 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFELE-00000006nMF-39mO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 17:25:10 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-8ad98c3fb15so40495717b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 10:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791566707; cv=none;
        d=google.com; s=arc-20260327;
        b=VqIQv7Lk3995guNcisGHe/VGCfhvotsEqUnicZ2uYzjZw2RXwUgZvIvDZZXAHBPobO
         1G9XP1a+v5XKMlXfvlAUjboyTtDk/CqRjoMEimsUYkbZdbgvbgpt4zVRWhtqis1Ze46w
         22YfO7RHxbiaK+I+lniSj2YY3PmxeZK6sFUkw2kXeg66T416A7HtpGvR/TyCIpG4j/Ij
         VQ4WsB09mJK0RfeBHymGhdYwssIGCaZHqiWe3PvGt62mzPe/gdWWqOxRMsJBLF/pZbbq
         QMwzIBfZl4EOS6Hf2USStPXjQdwSBlpq5xr5FZQ328eXUoSWEMQQEJu79AbAP9FN+JQD
         vEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AOV4gqFTB4BnPT4BpjZV0TRwwy1hdPuOvpKA+jIuMf8=;
        fh=vNraqhQzxFsqRwuTmdYOwkwx/etJzEyLO9aUGTp9Gq8=;
        b=BJkZmOk3Yq+BveLmpIKmWWC/H0yhjizWZX68O663mi5eTXz5AmfZUeU4+S5kLZQxn6
         O3H5Op91XIQBSyQTex278jgmvhVRUPf+msqCYA7bzitflQqEut7wlwvhcGmSwufqtImT
         Zr+H+dsq0pUweYybz5WkXtWtRVv1WYQ8Axw92Cd4ZZinjPXj7dAiplTOJI1eM/xid51A
         lePosU2ex3/aKQEw/G0gyjc4iYSVQVDXfx8gR0L7rUg6gwzNhk4W7PKcaX8KqYlPAaYv
         GbT5vaQjB+tVgoKCgd7hgg3g0n+rvFOuTCSths8MoEYC5uejZjj2OpMcEL5jt01MKbJl
         AmCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791566707; x=1792171507; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOV4gqFTB4BnPT4BpjZV0TRwwy1hdPuOvpKA+jIuMf8=;
        b=Kd6rMbISBsXfsS/oiUT563dLcetQYW8vir9o3R+RnmAojC+x4ASHqNcb0Ff1QLmpSh
         glMCS2N3uT4bcF+9mmCqvaJI2kK6GewDmqOIJqLqMZllZ6uFg0LtZiyjAwXg+IBYMcYU
         AwYffFSICvIP39SIjiiouZQlG+rYRqpGKtcxzaHXTRkr8ehgbl9oIYQynkVm6Mu2X4+K
         PEdu7rgaqAon8/DIGGBQUMkW6VcbkMSlnWBxRZPN1zk9455Ga3tXZbbs51+tCI66IuPb
         /Yc0czD8GNtCISIsbKfhoypsREbhZPoM1kxghpObDh1mUy1Wf7Qo/B2yG0TPFwkYUND/
         TCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566707; x=1792171507;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AOV4gqFTB4BnPT4BpjZV0TRwwy1hdPuOvpKA+jIuMf8=;
        b=GbfhaOJo0w2hfEooGQjJayZPGhBiUjro/JCRc8lT1Jy6yFr1vwN6vv8oACmVjkmtMB
         8tSrgmS4zs3f2KKZt1FJbK7x1czSPL91SP0L6qJI1tEM31zGjrysouSCBfz5lODGp2az
         m3FBKXU+6sDCQldL0FCrVZsOTmtRd+HgZZK37Sq/NyrzdtKILhpgm7urxhcydCwfY8ER
         a8Tx2timXT00D99x3q8c+cFZvRbjjTNOqkS62FOUr0Arsb4pag9Mfwryol+SNihnBOGc
         3fH99eU4DnU2fhQNBacBlE/BuDJ0lJPijby1F7D9NfS4qpOrBTLyResVcYPVcyDBbgNJ
         spZg==
X-Forwarded-Encrypted: i=1; AKwUvBzYWKFjVCXHPGatUYSHbJ5t32gGcmVQtzqPdEydLL9NdszYD52HukTyrxe+9pZ/mBoZCcJLA5sIVTWcDU/p1U/K@lists.infradead.org
X-Gm-Message-State: AFq9FYL6yBEp0WfKAZuyOw3dILIHZ27Cd4uKVZpBidbuiQGmC1b3gYBu
	nF1owxa88PMdgzTn2f/hD4wVgrNVOh7fOuZ2kMd+tXpTjJBfnlEi6oUmageHem7GU+i/vodtqb5
	hvbi6JjO42SDl72tyT1ygD0PXtwxFllk=
X-Gm-Gg: AYBFou2LRJnbv51+4FVmb5Drr9k8dYRxohEuMntOjbK5eZ6BQbTy0ae/XgkMv1vMrsu
	q0vAZTU/+8l8qv9cTY1dj34LQZY9XPozjkMbiYLcrX+EioBVbouMYxfPxukBr/cHiGqcpH7qSGV
	a27gyGee+/BVXI4Fu/XrrAuCCiZ4UAXlunNUaBlRVi4MMi99VMZmgy4hvRWyc+sBmNG2wwjyx/d
	p9cdEZu7tEgxEQF53VBpixZDRK3ak1v3FqQIRdhBIjR+joAHwsqK7CAJmlcB9nBxzcP2kRLQVFd
	VvgMKYxBv795nNhnRFH8aHPpS5zJX+KE9UpfdOTZt+UzNjDZxmuXhPYn+MJmTKkdAByK8ryI5+j
	igVAabNLCQZ9Gdawj603Pe5z78Ne0BoaoTg==
X-Received: by 2002:a05:690c:10d:b0:8b0:88b7:cfe3 with SMTP id
 00721157ae682-8b088b7d19bmr3339407b3.40.1791566703722; Fri, 09 Oct 2026
 10:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261006102937.10972-1-ansuelsmth@gmail.com> <asTRQ6d0-NYOeHqX@parshuram>
 <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com>
 <asTVqsqOLb29LY08@parshuram> <CA+_ehUxra53C2N8a0t73nLpS4DkaNSzE3STfhU7j3ZoQ9becyg@mail.gmail.com>
 <asTYlWdkrlci37FB@parshuram> <CA+_ehUyGgaodxKH_RddpaUXS44w=eFpediyQqEYhvJZ8LBKRRw@mail.gmail.com>
In-Reply-To: <CA+_ehUyGgaodxKH_RddpaUXS44w=eFpediyQqEYhvJZ8LBKRRw@mail.gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 19:24:49 +0200
X-Gm-Features: AclHuK8pxC9pxYotACGYDKYBARoHU0lbaBRjHN1fFMlOwVi1z9GLBZkUdQVGwFg
Message-ID: <CA+_ehUwgkXVoRHhsk_2mfO-6Hpd0fytcVN-7ykgRqoWsrV-b7Q@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_102508_806614_B63B01A0 
X-CRM114-Status: GOOD (  21.94  )
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

Il giorno mar 6 ott 2026 alle ore 13:25 Christian Marangi (Ansuel)
<ansuelsmth@gmail.com> ha scritto:
>
> Il giorno mar 6 ott 2026 alle ore 13:16 Vinod Koul <vkoul@kernel.org>
> ha scritto:
> >
> > On 06-10-26, 13:07, Christian Marangi (Ansuel) wrote:
> > > Il giorno mar 6 ott 2026 alle ore 13:04 Vinod Koul <vkoul@kernel.org>
> >
> > > > Okay so we have a cross tree dependency. I would like my tree to be
> > > > buildable and not depend on next.
> > > >
> > > > I can
> > > > a) get a signed tag for this from clk tree with the required patch,
> > > > merge and then apply this series
> > > > b) postpone to rc1
> > > >
> > > > Either works for me
> > > >
> > >
> > > Maybe "a" is better for other phy driver? The pcie move patch is blocking
> > > other airoha drivers currently.
> > >
> > > What is the procedure? In theory just the dt patch is needed, nothing else.
> >
> > Please send me Pull Request with a signed tag from clk tree. This is
> > typical workflow. Is it soc clock on common clk tree? Stephan or someone
> > can generate this and I can pull into phy/next and then apply this
> > series
> >
>
> Just asked Brian since he merged the 2 patch series for the clk.
> I added you to the relevant mail.

Hi Vinod, I wonder if a subset of this can be merged in the meantime?

Just the code move (second patch of this series)
It would unlock sending 2 other phy driver that depends on patch 2.

