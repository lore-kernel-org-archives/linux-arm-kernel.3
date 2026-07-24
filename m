Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0046C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RK+0ydkVq3QkQA31vNi6A6UpE/xnLiLeTaBJXi8dr9A=; b=z2LbZfyRWBtLNFRphEyqO+Cb8n
	43AHMVzKXBzI+MpLLoBoyrjJX1NBuSw3sO6xr/92KFLx/Ra+CBVsR50MOzohqTnQxhgjOZjyta/j9
	EPYqGZOXUYRSG4nZoqwz0VTbIvcm2NTSuSoCX7+J7u4cqYjrT7oNvHJEDTrQNy3occyZYn+ahRvA/
	Rk/fRFYJew+buuOodv3Jmlr3VTS7ulVwewec+Yfa0l8EMi2OwItbL67kpxpL+kX/M1JcXBCjeOOqP
	Fp2tqUYZbfy54sMR9XG9IvRbD/0epLB1+wJ46LXFJxEm7xKOlscT30zaP2lJuxHhnUN35UQ/VLq+t
	kHiUAZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIE1-0000000GlPA-2YGi;
	Fri, 24 Jul 2026 15:54:13 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIDy-0000000GlOj-3qCa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:54:12 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-51c10ed63c0so236961cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784908449; cv=none;
        d=google.com; s=arc-20260327;
        b=pm5sMM/7aPJA0jw/4TG4IHkzUY39mC9Zcot+nQn/PEDhbK8fM7sPJVVxQblT2Nt7rQ
         1PYWF7unbeGxLtzCLmvxEJZTrr8qjZduCdZCJ9WBCKzD8TGA8sbyeVxbxsX5divbxzuQ
         8ORdAppqwvpUaWAbFNZYMN35tGCM/KXEcJH/zkFOns5Q3hv3RNY5NRRQtEJTvekYMWe7
         mOcYcObL18FSCLt0EAWnqt4jtXGvBxmxrWBtpkUGlu4C+l/HX/xwg+qHKSRkYIy73ZDV
         NZjAJwqpfbxBFKe9e0uQbM/q9eyP1e81NfO4tRnm7xQFlD56I143vL5FGWTOjcCy4noQ
         wXlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RK+0ydkVq3QkQA31vNi6A6UpE/xnLiLeTaBJXi8dr9A=;
        fh=5aSr9qP9T+J0HOU3TnYdbOkdejTklYEigz1jlTLh7V4=;
        b=VzJwDeJ3mf0t23YroS3dWwz07fsTYcF2SSOIt4U1041YPGGP76819cEyGx2LaNRe2j
         hiz2f+3iEuqOwCxjVPXfPleUj5VJM+dOxEzD7sRUM7JzgRLa+cDckIk6YUUWLg6pUgMF
         MyBTc2SQ5PF/Omj7a/jGFj6PTSsiN/vNYKdk9L3MvnMyOIqj8Zr9NEFX1H8xuQwcW/dj
         Kda7GfZqaZ2O5E1IvX88SLZEfmB0crXQ2/pzwoqdOjkHkGPGdqv+zlMfAa8YXAJ3nBNN
         iWy1VdZfCmmPyvuvearyVcLTnppesBrLwwK/ieyYu8T7IfhsJ0eqXXCDpsa2XxdbfJZu
         yx+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784908449; x=1785513249; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RK+0ydkVq3QkQA31vNi6A6UpE/xnLiLeTaBJXi8dr9A=;
        b=VQJA0knhF9vTU0bFmUyDGs/3HxkdHVhPP9Lx4eGvlb06cI0TyR48zpLwUx2xRbzEh2
         4tlcIMR48Cml+v7CW73yAFOXDsoBVauQ50XNBMftY9b08CAn4GGe49ydCJRWqqzn8bz6
         pj4b6d2oQz8c94e7yEvi/Gdx10Vwe97D/VAPphyd8yqyXFOPfsuG1iFBlOTtlYF/tow2
         28Qcs+VQ0WHHqFUG2saGCJ/aGQFps9mPxFPJfKK6SHV3QYMpnhZ/mLH7XSzfQEIS+aGv
         mynUZteZubLy9rv8ieR+l+18BhCnisAeUOjoPb9weTOnq8QPnQCs/Jyb252uBwbTqLTu
         ePUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908449; x=1785513249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RK+0ydkVq3QkQA31vNi6A6UpE/xnLiLeTaBJXi8dr9A=;
        b=JEOVHhuwZqt3TgXK6IDV9x2pSX5zIDZ21HvOWiTX1NVYmOkMJK0PfwfQnsJGc3175E
         ez9rkSkYkrh96FYAG3gTgBFcj8jXHI7SsjoEz8jkjX1MRt5uc1dX9C9TgAjXKCrFg92G
         ZP38JORnixZHLRvEhYbyjQzn/i815QBtfCpfCHQ5L3BwmpNfm5NzWnbE54goWAEUnQnT
         L8Fw6xowAajt6W+Xth0qs2a6xlzlmUAZE/nUfxaewu+srBu5DXYZSxbuZD7T6xTi5Zw6
         AqjXjUN+3BnyL2NR4IVvqJDvVXSr8OpJMTz788jfUmHoAxhtLJSZS8ON8ZSBMkA4U/mp
         eWjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3UjKiro0oGndp/LHjFmjYUXDbVxMW6HR96NNbyQ+UbK1c6vA4JvIJ0XzWVksVzemjtY4y1NQhvYRcmGn5mU3A@lists.infradead.org
X-Gm-Message-State: AOJu0YzVt/fjTeSNOpF2XY2DfvyTOqJpv7lrJdz2UkPtuXz8L8HIL/wC
	yQWxqWzidUIdJuVOtiyvN0LRcE5yMO15QR5VsXxEo3EvpviR90yfnLx7GebPOlM6vt7g7s2oq/6
	Z9gyxSPDI7vpdWA37d7l8a1okq5IAqk1th0EDU7pm
X-Gm-Gg: AR+sD10jj10ZZ6sJUfsQ7fWoK6WpaktMYF8MS2IM7h0elSskCOilJrdSMuGHa9UFd5s
	+OgK34TeX8d56epEzq/yUEmzvlEf9c9h2qOJlTGGK+9w1q8YDnlFka16WwxShu3ZBTEAa9/bQfj
	dF01BygHaj9nFPPeouztaVRbAro96j9ZKII8ME2IQvUYVe89Z3dQHUttFS3XJDXC/t44DYkHJKZ
	KqG6jx5cVVdlZJvs7dY58vRnduyX5rnf9Fv4fy6kGNDWdYdJJnoflOgPGQ=
X-Received: by 2002:ac8:7d47:0:b0:51b:ff0a:2048 with SMTP id
 d75a77b69052e-5285229262bmr9058571cf.3.1784908448716; Fri, 24 Jul 2026
 08:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com> <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com> <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
 <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com> <CABCJKud9B8vB-J8f0HLHw6EgEKVWzy+Q1PrNxpO_6yCGtEyi8A@mail.gmail.com>
 <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com>
In-Reply-To: <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 24 Jul 2026 08:53:31 -0700
X-Gm-Features: AUfX_mwjkzQa0aKFOYVTkcojOnlyLhgENNWtHi2USSUpXbUHkHbBUjoNeksPsS8
Message-ID: <CABCJKufoQ0fX797M01t7CkTgMEwNCELY1=ptZsxr=jWOR-KAyA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_085410_993495_B7789D8F 
X-CRM114-Status: GOOD (  13.20  )
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

On Thu, Jul 23, 2026 at 12:56=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.com> =
wrote:
>
> On 2026-07-23 9:21 PM, Sami Tolvanen wrote:
> > What's the value for the __kcfi_typeid_imx6_suspend symbol in
> > vmlinux.o? I would expect the hash value to look a bit more random.
> Checking vmlinux.o with `llvm-readelf -s vmlinux.o` indeed shows:
>
>   a488ebfc  0 NOTYPE  WEAK  DEFAULT  ABS __kcfi_typeid_imx6_suspend

OK, so the hashes should match. I can only assume that the hash prefix
doesn't end up getting copied to OCRAM for some reason then, or
perhaps the source of the copy operation doesn't have relocations
applied? Either way, if this turns out to be infeasible, I think the
__nocfi approach is reasonable in this case too.

Sami

