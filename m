Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D1ECA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 11:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6sbNbnpwWkCzbLbbS6HdaXNpMuoxJitrtJysJoWmJw=; b=ShKXIx97pHvtH4L6IqYKE2uhR/
	UbY4Sz/Nz7bKLicI1cxYUNiKc1Q4awc5r5BhDH1fnLQEZAKSzhChj8HmatDxLnmI3/ZScbg01aDGo
	dkG+nETRT6vPq09h1V0KZHw5Hk7WeNwTlmTYnq8UgXgLTSViWDnDeKL2tDh7UZgObV+gFWUenwo1z
	7EXnOnSB+X7Z4PXJ0KobaVroKkI+DowNtzZXNyVMnncTO6yLUe7lmMp2qL4tPmZz30ALtnEHh6dvY
	JeTFS1VS+W4fCdFRMzamHFtVPw4KmDNYVFpRhQ6ntgpQV8rUxYM2mnBZXnlUpf32Kqb4NGcfyotl5
	uYlUnnLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3IV-00000000d5M-1N6P;
	Tue, 06 Oct 2026 11:25:27 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3IN-00000000d4L-0RHU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 11:25:26 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5338c1197easo22434661cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 04:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285917; cv=none;
        d=google.com; s=arc-20260327;
        b=nrUo0Kn5o4cToZgN6QvtQrWzOaXD2sNfLEVIfVitTBCg11SkotKb8Any4Ki2IDKUKM
         OoD6z1QXdFqhBAUdxYE00WkBdkq6ABg70kiQsdTp85vkHI90IUr5cIChyQxE6HqA7wg+
         NXb677WBYDZ45qsLZXssL74yCYIs1/gR332qTrhjwi3mOY7FR6Z3Tw/kKpy7rWp4fqnn
         FhlpI+louE1NnjOSWgRVW07jCkY2SAbE5M5bxVupNTcqud2X/yZLxKe/B0YZuyjuRENw
         qpx022CAx4F/+3kZjBXLhpvLanTWndSbVqP1qeYvkpvwWRi4mQTuR70NOVUKacRwtLu6
         5Z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y6sbNbnpwWkCzbLbbS6HdaXNpMuoxJitrtJysJoWmJw=;
        fh=esVnPomMLfeY6F6biPTxxigJ8beZn3kkY+sn3sKFt4M=;
        b=VvHf2yMEYR1GaGRYQyHH+opB8OdKKpV+PVtSqBxZBC0xkmnlwpRvU5BhpSsL7Z7EfC
         1GZojwmAzw1ePbtxjYF8m5pJqDdR5mjrHJpJyYuqAA/MMYy0B0tL1E27VpQ8BhSroWyj
         o9rF8dbOiEFicBkW72BOwOPOWd7ApL0iiYsYHYLCiFhGenz1tsT9hWULbkLEC9hCAmAu
         YYW1p2c2MC6p6Rjt9V3Rd0vQPUOZGy58O7x3IpusnYK96Tf3Kt/JObcCcp0YcbQTd5gY
         xnvNs3/lX9V0jSmNn9et1LpUCcR8KQMlmAAT7Ixz0MKmk6vpo6i72bTgApGiKxmEx6Fv
         0Dww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285917; x=1791890717; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6sbNbnpwWkCzbLbbS6HdaXNpMuoxJitrtJysJoWmJw=;
        b=G0CyfLiaPLsHIasSdhEydaWI2d6MS7z4opyG3NQ/Q3c+9QV8jVSc3/E0afAiCfw9Dz
         mRUd7YOVnV4h562b4Kw0MkjaE5zk/pGsymYCGOlIOkUeFjbFouX55cuzyZOP1+/y6zOD
         AZ1WW3ETGUaP8PKt8ZQl8ahZZgVe0EpU1K8vA9Jx0zj3maorM1lXcHOzxcSKNwlgQAoG
         Y+136+zcqd+ILs2qJCjWJIBtEGSo2uHrOQ18jRIedFO2s8IMgb9Mw4kcBO7LswTvC69R
         p+5hfgfEsK5bcBdr2UHLnkwuD0NlUvHFyRlea+0tKxZpc9vOATJLgi2e4bpL0U07Mlzk
         /fMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285917; x=1791890717;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y6sbNbnpwWkCzbLbbS6HdaXNpMuoxJitrtJysJoWmJw=;
        b=Jey+ffinTcj8M6yFXe0LxfHsi7xxLW2GHKzS9Cfqx0HPuraWFWD12TE+OSLt8C2X8S
         Gk7szE7gycHTIx2RuoCfOQHycxES/VARUj6vr256r+9KFKnXUES0zL3gVmuR++O7Osbs
         EBaUYLyeieOa2iW95qnk8zUTuCQDi16v/0A6VhHQHvq4/64AtdOtWoYKHWPm/FDn7uiV
         hqE79Ub020KHt3iHRoXrWYpQj4adr2rcWLlx0tggSWtN+/grG65XUmwsio22F9dZq1lN
         u2kj30aFvlts9LL7gsCyDsTW9Oyk1lOZsAYydLKM9r3bytQ2pETKYpG+lsx68MTZ827R
         l1fQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8IA2HhOVNZ2hvEh0oSOwzEl7WXltoaU70v+NWU2D0xdgWhz10nwgdjODI5csG8ZxF12CmFDf/td0Ce1a1YIuf@lists.infradead.org
X-Gm-Message-State: AFuF++lNZTsZBSgnKYviBXLVqXpxGJgcmz7wqwWwc120dz7vtU1SamQP
	KjZjau7jgNtsW7bg8jDHEEqkxmH4wuQpleAuQwbW8qxgxAnGb2dMiB+1Vl0qseCEZ6LNRGpqquT
	j95+KH/SZYt3p0xkjUpZMvydS9vQV+qw=
X-Gm-Gg: AYBFou2dNaesIACn6Z0wDZLY/vSRO21xJBShrGiocTchjVK0j4Y9r1ksO28DAlV0YjO
	auvXYR9waHmBFp6ZWk9uWbi8y9xxh/jO/5rE35YSNaOZAmtHfpomm/ai1UIayS5XBom9aWgy3Vw
	xkUF0nbvOQ0kyIyAn6MvL0PK2Xzt/c9co13BI6SBOGkrFCHvQbRZ8KEI0b8CHpl1pXaYViBKXNi
	aVg6j/TZ3MOK7d+zaFEUmbVlSR2Sh0ja0G38kLEFo2aBdxhyy1+LZrgXy1yVO4YkLNuEEiG0gPR
	giJPmSFHgYjMf/pn4RRtQO0AkWZJfyo/4JkTl11OEpiiuCsAS42dPDMdVcf8rpIOuGxNQ66P2rL
	vP0Tv/MRy
X-Received: by 2002:ac8:5707:0:b0:532:f0a2:ef4 with SMTP id
 d75a77b69052e-53511e431b0mr182844541cf.26.1791285917373; Tue, 06 Oct 2026
 04:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20261006102937.10972-1-ansuelsmth@gmail.com> <asTRQ6d0-NYOeHqX@parshuram>
 <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com>
 <asTVqsqOLb29LY08@parshuram> <CA+_ehUxra53C2N8a0t73nLpS4DkaNSzE3STfhU7j3ZoQ9becyg@mail.gmail.com>
 <asTYlWdkrlci37FB@parshuram>
In-Reply-To: <asTYlWdkrlci37FB@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 6 Oct 2026 13:25:04 +0200
X-Gm-Features: AclHuK-2iwD9Pk70twNlp_Yt_RVNdVYY6IjBqwJqtLPrbBVE4V3UaEW-eP-1_m0
Message-ID: <CA+_ehUyGgaodxKH_RddpaUXS44w=eFpediyQqEYhvJZ8LBKRRw@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_042525_460207_E10EC039 
X-CRM114-Status: GOOD (  19.10  )
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

Il giorno mar 6 ott 2026 alle ore 13:16 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 06-10-26, 13:07, Christian Marangi (Ansuel) wrote:
> > Il giorno mar 6 ott 2026 alle ore 13:04 Vinod Koul <vkoul@kernel.org>
>
> > > Okay so we have a cross tree dependency. I would like my tree to be
> > > buildable and not depend on next.
> > >
> > > I can
> > > a) get a signed tag for this from clk tree with the required patch,
> > > merge and then apply this series
> > > b) postpone to rc1
> > >
> > > Either works for me
> > >
> >
> > Maybe "a" is better for other phy driver? The pcie move patch is blocking
> > other airoha drivers currently.
> >
> > What is the procedure? In theory just the dt patch is needed, nothing else.
>
> Please send me Pull Request with a signed tag from clk tree. This is
> typical workflow. Is it soc clock on common clk tree? Stephan or someone
> can generate this and I can pull into phy/next and then apply this
> series
>

Just asked Brian since he merged the 2 patch series for the clk.
I added you to the relevant mail.

