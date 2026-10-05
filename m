Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E087BCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 15:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHbE/ZQrnN4lIbhz9d2lRY1XaGiqJgT56yvkXrJ87/I=; b=Lwaoe1jrPd/ys4j/he1izVFbRE
	abmxa5SU1OYybXVaJEXHpkZGV4nAjM8aYzhCL5KABLxBiiIX56k2b97mWY8Pz+1Uaelor2PkZLujQ
	0IUgD8vx0f2gAouLVBTED8//4y2COJMH/xXRvLSpifcEh9+lEu86Q2GWxbJu2ZvkxN6yWSJ6OPaFX
	zqtHKFzupFNy4NRYNokzg8eboWmRI9TmvKJgVDy+iQ3JcntCdMKUaLPgi7FAAsUOJ581Buh0Wotxg
	v4L0PUpwe+o3kje/QtZX+bJmNszeKoHyJtYmmrdMGnQ+neNckd+QBEqSJIUTumkLEF4ytHGnw4cXY
	GlgjQVKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkfq-0000000GlLM-1EtY;
	Mon, 05 Oct 2026 15:32:18 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkfn-0000000GlJX-0Xbl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 15:32:16 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-917a2800e83so25428806d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 08:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791214334; cv=none;
        d=google.com; s=arc-20260327;
        b=cHrjcB8C1edP9Smbvkr3xeKf2JUuzI26j6lMYyjse91dOnoeBNZKajrL0TUKasUofP
         qc78iujsvxHmGaJlWa8Y6UPAh8/aVSHSY3VfPUoCzRe7nbh04elqvLujbRauVwEGwy28
         j6MsQpEmtPfdnVTIS6v7m3QCqQEJ5Y/9LYVA5NRqc839HPImTzkJg18jQ+P3M5NJ/y/N
         ogcJbFVic1VCrszcDOUf32IPIwU0yftj1G0WK9dF2j0sR6G/qmoIN7445reE4XhnRnye
         79ufgWBHe+J7sBBl0w3FZCD0lotYjgvJx49rEuCU2tqRvAGub9BLw+UdgfkzeEZjqKqa
         nNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DHbE/ZQrnN4lIbhz9d2lRY1XaGiqJgT56yvkXrJ87/I=;
        fh=xniySZdR0lxY55RLxqZI6ZtVRkrWtxL3a672FZBnQJs=;
        b=IkZ/Zwg8pp9XThiYlQHZcWAtXEv6ORMSv4jdjfZflO/jp9W1BzhDPGb70sIiQx1zyH
         AN+FZeVkyqZVogM+CAtK2QBhETKknxSLJxz5KdCeybF6VwwfNGoQklMVu7MeSIx36JPU
         QWUvowjOY2S/SjsZ2MmtP6zwe5eHLcB93aO5Pdt6/9tkMGIIPpwFvoZndGa7oqzPpA9n
         Q1dk0DDXrFSaWOcX8qqdR/aZnQcqOj/deEcLx5POW+y+4vNBryGBBCnCU/e5u6eesZFH
         zfmS3m0bs0AgHbGtdAhqLQ540fOokJpOea1BPzh8LQeHo1WHSk/qwP1NvJV3pETalj/V
         cQ5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791214334; x=1791819134; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHbE/ZQrnN4lIbhz9d2lRY1XaGiqJgT56yvkXrJ87/I=;
        b=NpKru6aDvESWXWumGHAVJVh1sPMukLacdmbilG1DhNdCZL1DUDHhucsVXJCZFsAq4e
         g35n8Qp41b6SOgfyKA7nQSfo4ttYh0jE0iHOOJv5ivcKPGWpRfhO4wGZrpT5h6dUESme
         LwfRzOmrUV0hz19QHAlAqrXRcuOhdcwwyNalddBqnF4lI57rMsd6t5VZxTa6EhpPrRSb
         zsnvNOL2UTqMDwTMsdhQbDh58vDI/qHKhuCkJi9beEcybyoqmn2Tmh7PXIw9/6MB8/l+
         0/bgECRknk7Gj8UJkV4xSr+IO2qUpkFME5Kfv3y9CqAakWKENdUJwhSWpKY4vmo9rzXH
         aYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214334; x=1791819134;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DHbE/ZQrnN4lIbhz9d2lRY1XaGiqJgT56yvkXrJ87/I=;
        b=Aa/cG4hBz0XRcLYupBbiVHDWdY8Xmk1K668sReEf9tJzNeGN8C5rCejQ2Flbhjgtqq
         r6zhhiB7r3Np/cysa3snEq/4nk/KXm7xCBnyQQociUuud0K5TpReyhszeQDxcUftftN2
         zXtp3Q40w6l9KC+3TMY9BSX2hLnwhuCyHqidVgJN//584ic4iQuhDt7lsxJVUdKWH+n2
         ZK5KzMw4PZSF3z8yIC7unXxupdMi8gfyi8TX4UUkH+MrILdS5lt23pdEUWHIvdX2uhA4
         B2srvR7ayMg6sSP0LCeG64i+d43dtRo97561BZbeQAZmgADa0LjtLWtQp55mSvxsP1tX
         OYIg==
X-Forwarded-Encrypted: i=1; AKwUvBwb286i8LG3gnL+ZReFUqcdAQOWhktf1bCPbtx/Of9xCrQtZWJc4OacBQvc45zfhxpZpNirH8/O9ylpZDZcN+oe@lists.infradead.org
X-Gm-Message-State: AFuF++kDFZspH/aJTcES8Vfa0xT/ZJefb/cc8IGkemqNa0VNbTWRDma+
	XYJajQmNXpifCHxTvWrj7lPJWXK7fE/CSdJ0tFKjrYFSUWsItne9IV0iH0jxkz+EBphD80TZDgx
	fGI0T8+7ddtmHnB37OJ8CpFgwd1ZskM4NC4DP
X-Gm-Gg: AYBFou2pEGvrM43hDF3x1K9EGp61U24R61mofY2NDz01JrJBL0D1yx/oxFaBIZfQrnN
	3nKP48h4RusBtW2HDGKb7A1QyFNoZwfjGupdW2rVJlpXQxxscg4Y7izX8Nud8DCbrA8UMY6vdJt
	V2Lxe6Gh5RnKmoKgzNcnfzbsmjGHN6GnvQ1Sdd3PDbsHT9NIpEylUuNhthrEZYONb/cm2Ot3aMI
	NWSRvn7sGjCAbUoKP0+eNxbRh6I7MHv44jiIz17edVMxKWcMtm0A1mBTbeJyIYpcpz/yA1XTkKH
	+y/29Tkrg+hPAm3FIBwaZ6MXaviFrNQAV29yZ9qklLzq9A6FO0OfVUk=
X-Received: by 2002:a05:6214:4906:b0:915:e9af:3145 with SMTP id
 6a1803df08f44-9195d07bd1amr138006566d6.12.1791214333390; Mon, 05 Oct 2026
 08:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20261005105535.2472-1-ansuelsmth@gmail.com> <asPCFDMXyntAV6lx@parshuram>
In-Reply-To: <asPCFDMXyntAV6lx@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 5 Oct 2026 17:31:59 +0200
X-Gm-Features: AclHuK9sfRTTob9cejo5rJV-vGSG3XFEFgdIAL7ikLesT7uwwOKne_JE24bBBNs
Message-ID: <CA+_ehUx_B2K3WgLYkt2fz5jzDRB24LQRB3uX_VScZ2QSxCojPg@mail.gmail.com>
Subject: Re: [PATCH v13 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_083215_178063_4FD2C6DC 
X-CRM114-Status: GOOD (  25.27  )
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

Il giorno lun 5 ott 2026 alle ore 17:28 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 05-10-26, 12:55, Christian Marangi wrote:
> > This is a major rework of the old v2 series.
> >
> > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > configuration for the Serdes port. Such port can be either configured
> > for USB usage or for PCIe lines or HSGMII and these are configured
> > in the SCU space.
> >
> > The previous implementation of a dedicated SSR driver was too
> > complex and fragile for the simple task of configuring a register
> > hence it was dropped and the handling is entirely in the PHY driver.
> >
> > Everything was reducted to the dt-bindings to describe the Serdes line.
> >
> > Also the property for the PHY are renamed to a more suitable name and
> > everything is now mandatory to simplify the implementation.
> > (the PHY are always present and active on the SoC)
> >
> > Also other unrelated patch are dropped from this series.
> >
> > Changes v13:
> > - Rebase on top of phy next
>
> Pls fix the chechpatch issues. There is new blank line at EOF, SPDX
> format mismatches and many more. Make sure you pass --strict flag to it
>

My checkpatch doesn't report the blank line. Am I missing something?
For SPDX, is it ok to change it? The commit just move file. I would
like to fix that in a separate commit after. (I can include in this
series if you
want)

The other warning are about Kconfig description where I can
artificially make the help text longer (no idea if it's OK...)

And the line too long for the define but making the line shorter
would result in a disaster for the register.

Up to you what I should fix but I guess the real important one
is the blank line but my checkpatch script is not detecting that...

Can you help?

