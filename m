Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8A1D11181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gcVBypLWbERJY8p8vcyLVaTMKTzyQc3bsZYqIHWRB8=; b=k0S30U8v8kv37c/dEmAQHUtsh4
	bXTnbRPkEb/6TXDNieGLViCB1x/ZLQ+lww0f7dfth3zaalIr9vnO3OfS6SctN1kXy9vTPTMnSXNPD
	jOX4cp3iphZnj6nTbTPKzGDOqQOCi9nxxNbX8mworfKx/LFtHrAXFqcJ5Kfk2XBNu55yVvMflpQk0
	u0QfRv5ST1QFKL8xgdJFKwyZQLV8eJmBEBRz5Kr/V1XeJxmyZVN/RFF0AHeXaI/Ys2tbnGx5FDo/8
	RipVPzDHwxlMbMb8aqmWRmLfWDzMxtxdVG1AzTrmThRUS7kREyVkf0e3gfNOfBFoTutP1o83n/Saw
	X1hYkAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI5Q-0000000FFty-3vJ0;
	Wed, 26 Nov 2025 16:09:44 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI5K-0000000FFky-2e7L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:09:40 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7b86e0d9615so8396649b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 08:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764173377; x=1764778177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gcVBypLWbERJY8p8vcyLVaTMKTzyQc3bsZYqIHWRB8=;
        b=rBwg8I/D/Kesw+3ipXm4dRVl+szncXIGfSU/Yld48hA0d6FDSTsUbL9st02muKmNJ1
         VLOfO9ctMPdZtkrwn4S0Q21ixdIOqF+fGK7RNZvHpzPFBV3b5boM/MEaSXeNRxkN8c+n
         IJjg5w45+wQlH6lq2qXs35uI3e43Wt2rbRysFEj7bJpDsQrdl1M0hSdyslUVikOcM7Ht
         I9jjd/dXNFXJSVo6YMgQyOlkvCGqk31VAh6OASbdzxLOpktfLXLm1Io2LY+IqNqZ+GEY
         1vt09qIqGvWi/ShOefUL9+qD6e0C4kcYdx4V5R9cnv6Xkn6FxQQxNzeRHdXw9VVm/9pv
         F78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764173377; x=1764778177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0gcVBypLWbERJY8p8vcyLVaTMKTzyQc3bsZYqIHWRB8=;
        b=aR2ZVYBHi6E2/ajgmNL+arDvbqAVBvu6sLf6WgK7DUEPTtQVQ2y1hdRZMxsHX7ldID
         kinZQ03XAc9hNinWU+9IMZ0wTYTupE2ILIIzTmoSJ3eVeOUI7GqFczgZLx/zCuFdJMut
         z4qNTa5PpyzgVlpX8uSe9m2df2MDP3nK/7vf1mdFAcLhSF3edJabPgWfbLo752+7rwgn
         CBmcH66Zc1iZtLNvXUbBpFnmj/zm+7CEP8J43kMGyHPM3gyh17PBggnyjNPVsv3bAH7d
         mYtPGy4B5Id9nL5X5jNmseq5hHQlHuWzpQ/Jz1ulNA9WH5vYnFkvUFxXv/oUJDKzq5Dg
         OxWg==
X-Forwarded-Encrypted: i=1; AJvYcCXq9s+tKO0uCpsReioyL3tUKax8IaKhzZNMw2Lzk9fv4b9rk4ACEbs0jn7LaVj4l40OhEWsLelH6YQQLLriKVon@lists.infradead.org
X-Gm-Message-State: AOJu0YzArkhZgj7bXpOolCUt3eBScexGW+I+DEUSlCs9GDuPwqaFXKDT
	zEloegGapPSW3y25zLi6a04W/bLL4hqDn58XVa7d8C0tZQpunFHvh/q16HJSnguA3XvrNlI2W2g
	tw+R4qoqsBmPt5+4WDf4LRqfcarFZxdPL5Gdrokdj
X-Gm-Gg: ASbGnctKDXmMz2WyZrazvVOWMg95MF1sKyeaGPqLNJcXW4K65NpaUQYURMEc5yUh3zd
	dMTvGvmpz7+wjXqHXhUk9udvghG4O0TZQmppP2VEs7GE9vW98My8MguBsSitBTlGcE+No1CaJME
	aOhVJPoqf2FNi3YXwtEivH71ezL6r0k+G+cBDQWisHgJ7mf/QH41mmn8Al1UbvqkehrLX2shyPj
	iVUApuuSj4q7ttlYa62ZHNcgBtJdmhFFqYIexuAiIr6rOQSNuO6JpZQttFv3DHXZMrqK0aZqfvS
	rYMVahDo62346zdPGJ3VhvHDR5Ej5msPOUsX
X-Google-Smtp-Source: AGHT+IGAEhibvtZ1cVjwHMHCZDx1pcwD0RfdJLVdTeE/4gtS8XoedlAk5KmMPIaBUkyCzvh/tSvw7tdpzJxiPpbYPHQ=
X-Received: by 2002:a05:7022:4293:b0:11b:7f9a:9f00 with SMTP id
 a92af1059eb24-11c9d6128f8mr16441440c88.4.1764173376414; Wed, 26 Nov 2025
 08:09:36 -0800 (PST)
MIME-Version: 1.0
References: <sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu>
 <k4awh5dgzdd3dp3wmyl3z3a7w6nhoo6pszgeflbnbtdyxz47yd@ir5cgbvypdct>
 <CANpmjNOsSmKUxrLxTWYMD3RKnzSw5dfM=7QNJ02GMFG7BMeOGA@mail.gmail.com> <l2tbxtfyjtu32wqv73hqc3loerzdshoq2mdkfpfnigtjjonrdc@3yacamzjcrti>
In-Reply-To: <l2tbxtfyjtu32wqv73hqc3loerzdshoq2mdkfpfnigtjjonrdc@3yacamzjcrti>
From: Marco Elver <elver@google.com>
Date: Wed, 26 Nov 2025 17:08:59 +0100
X-Gm-Features: AWmQ_bmhx5AyJc3aUebiyMdQ90XhVN16c7wvxxmC6w0jKeAhLXYecNNdM1Ixy_0
Message-ID: <CANpmjNMnKJGvneNDOCFRfC8xUWq-uuXVjLRQZsPYo86Xau5UHw@mail.gmail.com>
Subject: Re: CSD lockup during kexec due to unbounded busy-wait in
 pl011_console_write_atomic (arm64)
To: Breno Leitao <leitao@debian.org>
Cc: glider@google.com, dvyukov@google.com, usamaarif642@gmail.com, 
	leo.yan@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, rmikey@meta.com, 
	john.ogness@linutronix.de, pmladek@suse.com, linux@armlinux.org.uk, 
	paulmck@kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_080938_802315_F653799D 
X-CRM114-Status: GOOD (  17.69  )
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

On Wed, 26 Nov 2025 at 16:54, Breno Leitao <leitao@debian.org> wrote:
[..]
> > > Alexander, Marco and Kasan maintainers:
> > >
> > > What is the potential impact of disabling KFENCE during reboot
> > > procedures?
> >
> > But only if CONFIG_KFENCE_STATIC_KEYS is enabled?
> > That would be reasonable, given our recommendation has been to disable
> > CONFIG_KFENCE_STATIC_KEYS since
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D4f612ed3f748962cbef1316ff3d323e2b9055b6e
> > in most cases.
> >
> > I believe some low-CPU count systems are still benefiting from it, but
> > in general, I'd advise against it.
>
> Thanks for your review and guidance.
>
> Just to confirm my understanding: You=E2=80=99re okay with me adding this
> notifier specifically for CONFIG_KFENCE_STATIC_KEYS (which is what
> I need), but you would not support adding it for the general case where
> !CONFIG_KFENCE_STATIC_KEYS, correct?

Yes, correct. If there's a real issue with CONFIG_KFENCE_STATIC_KEYS,
it's worth fixing if there are still valid uses for it. But I wouldn't
pessimize the now default mode, which is !CONFIG_KFENCE_STATIC_KEYS,
as it doesn't appear to have this problem.

Thanks,
-- Marco

