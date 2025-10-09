Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF85CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 03:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsJEEsv3A5O4v+d0q0gbe7mKpNJ5lsVKHfbN1hMU8aU=; b=JepEQxFsnl3hCV0F9LGVd4R+bz
	JfWEO6foDCca7hE++exUBNKX3qc10hQ9zllV7Z3MW9xkUGtSem69yNX2JzbOHWqTvA25IZun/IgEl
	QcJyEELaihR3UPXq/EdLtwt0suNxTtx/TvdQsJLdEdhy1Xx/tnyXvFUR6H3nCpyF3ZQbnE8tPRFeG
	lf7Ixmdiq7Q4Ar7iRit2F6ZUpsJuExgwoS2ksRDX+KV/qV3fK6AcXQ5tJdJ79xp11rFvgYeJ6umKy
	DrOnihl6D6jLciYgk3U+LlCJSqiMwnJ9DlZ5blv7G9yy6g+SL1Vn69g9KNDJIg1h9wkfF1sGxZZgw
	nQ/t/Svg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hGg-000000055jo-2hOF;
	Thu, 09 Oct 2025 03:24:38 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hGe-000000055jD-0akH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 03:24:37 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-37612b15a53so5110991fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 20:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759980274; x=1760585074; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsJEEsv3A5O4v+d0q0gbe7mKpNJ5lsVKHfbN1hMU8aU=;
        b=PbLI9hu2trd0ko77FpOAmMwNdJu7zEBkgcs9ApmyEyUA2QMmv11tJcvSY+jZ5ht+Bt
         7OuTKn96o0uFl1/Z3e0owFUjJzSRVzjsJHQiCsE1Ms/F4VRrXbcT19BZG+Uej7nutGfW
         7r0tsRij6zZzRMGX/aI1sW+JJTYI2/B+2iwLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759980274; x=1760585074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsJEEsv3A5O4v+d0q0gbe7mKpNJ5lsVKHfbN1hMU8aU=;
        b=g03K7K5ZAh/+WyLno2P+0JQVPLcpPDRw9/QdjaL/vXX3Mdnthy407jeS647Tj7O8Zc
         ax7tu5aJe2tKqP2jlBIJSQ0jqxnYDARowghB4MPn4FzDnk7PUBtZcAYjiaJtnZkN7p0h
         aPdw4yvQLNqWfjkJGDXKSs9/Xpa1FHl8dFqmilK9sUgxxfwSuXavty0DH7fyE4ApNJo3
         5bkWo69BPfqosmhQTkXmAvJtSNE361Az4VsNvrR1X+q8Aa3SqU9wYENRN8EiERSPvmld
         YLO/SYTcX9DSVw3oaXi3KfM0GdxEX7aJJ/ac6wT0e79anb3UR2FeuQAy0rZndEA2ZxKt
         wkBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhFkt9NZB3FsyFy2lCbmodiprTd4IwUm6cD8IuXkw5xTzP706Cw0WlpVBpNmwMw2jz33xZK16Boe5i77mVRbFg@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ5wAFcKi82gYu/eiuPMp5W2WCt6Csq8aI0ciAl5bEOJWgv3DL
	auzLkOathDRNi7ecBnHWRRC+h0mbM7sy5v6cHhXkhv/WTbhdLRvftr6x944Bw+XIjb3faC8jY94
	7LneVYOSl0iZC7IbI9IuvUUW7UHuuhvMN9zd5exzR
X-Gm-Gg: ASbGncu6+Big3p2y6LkhHwh5FIktko8Q+ExbPz9Emn9DZR0s9rCsBg+O6LqA57hb6Au
	WdLLkNSWAMDHPjMzKr+lRQa7MF+Jv1NbvMc4W6jCAjmHo5OANLCaY092bRUwkkO34NVnwL2Lqot
	oYFDlBS3aqQzIc0BXfsx+hxoW+HMvrvC/Wpyp59uuePczVVG0q7Tp1viGFLSNIy+qFFKRF4WQ14
	VPUGywkbyBJLurV4YIdeznEH14vEq+NUcgnDQ9Zw+9f7sTD3GAo1+tLV2GcBQ==
X-Google-Smtp-Source: AGHT+IG+QPrYaBQEcc1m0DbO6LG5DEjR0TPM5uYoLtJqrCmn8hGuxLighHMEr0XBvn54MH/J/Jg3LC3BrvSJqr9grVc=
X-Received: by 2002:a05:651c:2125:b0:36a:925e:cf3c with SMTP id
 38308e7fff4ca-37609e92df7mr13074921fa.31.1759980273543; Wed, 08 Oct 2025
 20:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251002092036.2504858-1-wenst@chromium.org> <aOb6iNR9T4R9Hp3R@redhat.com>
In-Reply-To: <aOb6iNR9T4R9Hp3R@redhat.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 11:24:22 +0800
X-Gm-Features: AS18NWATwDeEXLQ-tcqHs03KqOOqKmAvfXttBG9nKH4eO_votAHmlfrLRfdR9ao
Message-ID: <CAGXv+5HPjEnYh+zUi67+Y=nmFfdRFw0xd=rT7L_-GNxouga4Ow@mail.gmail.com>
Subject: Re: [PATCH] clk: tests: Add tests for clk lookup by name
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_202436_243373_DC87A0BB 
X-CRM114-Status: GOOD (  25.67  )
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

On Thu, Oct 9, 2025 at 7:58=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> On Thu, Oct 02, 2025 at 05:20:35PM +0800, Chen-Yu Tsai wrote:
> > Clk lookup (by name) recently gained some performance improvements at
> > the expense of more complexity within the lookup code.
> >
> > To make sure that this works as intended and doesn't break, add some
> > basic tests for this part of the CCF.
> >
> > A new "clk_hw_lookup()" function is added purely for running kunit
> > tests.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/clk/clk.c      | 11 +++++++
> >  drivers/clk/clk.h      |  4 +++
> >  drivers/clk/clk_test.c | 66 +++++++++++++++++++++++++++++++++++++++++-
> >  3 files changed, 80 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 85d2f2481acf..a17d0070d11f 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -778,6 +778,17 @@ struct clk *__clk_lookup(const char *name)
> >       return !core ? NULL : core->hw->clk;
> >  }
> >
> > +#if IS_ENABLED(CONFIG_CLK_KUNIT_TEST)
> > +/* This is only provided for kunit tests to test the core lookup funct=
ions. */
> > +struct clk_hw *clk_hw_lookup(const char *name)
> > +{
> > +     struct clk_core *core =3D clk_core_lookup(name);
> > +
> > +     return !core ? NULL : core->hw;
> > +}
> > +EXPORT_SYMBOL_GPL(clk_hw_lookup);
> > +#endif
>
> Use EXPORT_SYMBOL_IF_KUNIT instead for consistency with the rest of the
> kernel. In clk_test.c, you'll also need to add:
>
> MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");

Didn't know about this one. Thanks!

> Since clk_hw_lookup() is only used by kunit, why not just put this new
> function in clk-test.c, and use EXPORT_SYMBOL_IF_KUNIT on
> clk_core_lookup?

Then we end up sort of exposing clk_core_lookup as well?

I believe Stephen wants to keep things contained as much as possible.


ChenYu

