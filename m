Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB12CCD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8kiyJfpS4AJieM5GN1HD0Jnn9d/pspH0taYDU8KwA8=; b=YqrmQ7xTCMRp2mc/Ry62AZRjYI
	k9aA+FEKc6y+gNAQ5IykVevvQnaXo+8Hq2ZDN612KtZAi5shK3vxKkXNF4DgsM129WyRJNYUwaqvN
	aHu3XXknJNE+ygl31pT0LFR64SgT13HUgGm+sAUEgnW/NJQQ2l+qyyuAaCR+3QXQEJdFhQWnJYydJ
	yOeKGzZwlPbjZ8OILUYUfY60Fd7kU3z5enAFZ5kvF+TaClrU+Bu3Qym3+0jYBe9MiKPTmTFMs83Gs
	nsE3JMk9pqJjgQPPsmwwPjBUZ06QWSK4bfhz6mcV0HZ2gsTsHGgSZIudjCd3WQiRJt85kq4RiVYaR
	PTTkQ9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxSp-0000000Aavu-0OXL;
	Fri, 12 Jun 2026 08:42:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxSm-0000000AavG-22p8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:42:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490b23c828aso34795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 01:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781253721; x=1781858521; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h8kiyJfpS4AJieM5GN1HD0Jnn9d/pspH0taYDU8KwA8=;
        b=vcHU+GGBSdyCHz5Gufwxg0kldQzo66Q/ssIQiim8JJI3DX1EMgJRKHw8mVNyEi87cz
         kqgAQ4yy0JoGgCsNBdKl05CFTSoKvYyjo57vM9CcGJc3K09+IJHpdUaUeEIlE2Ot7Rkj
         LcxZUBstf1+LDmxFL+Gi7Qbe3yHYWZWJeh7ZIZ4vkE4sKrwwhcdzH5hyNjbpyIi5jKmv
         dvFAftskqgCXtihDYtmrHM1vOMjSeUgIEpmBiT52Gc3XSIZOwKbFKMOG3Y6tPvRC+5J6
         0gouU2MS1VVplKeSHKgo0kUpduF8n4R2vGFA3BjBIN9WGS5LNv71f/qc/PD3h3n3ZQdy
         VDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781253721; x=1781858521;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8kiyJfpS4AJieM5GN1HD0Jnn9d/pspH0taYDU8KwA8=;
        b=ldNqSz02Zn8vS/EscHbS5UjyYMWxC94WwD4ar97WQ6JEog0PmrZvI24G0Z/j/hH/K5
         UIflP9IlLdBvUznI2FkHByutnRirDrBBS8GqSDUvMHiayvzhOhcZ6yOp+iP1VFXVHyuM
         1M+BIjc3iUiawQsjWWu5c+iYn4ebb6VMgdlHzMBMhK5+XkCuaq0HJtCkT4nrxQwrJ+Yl
         kvvIW/kPyyVMAELWajBkWOTEkOP8Ptn5qGmrSAnGtPL7peOpluCwn0D9Cw5LyA5peOFl
         nXshjvtO2nLlQ6HwvXB7aaWeJOYHYIY0wrDKwrTkh54oJb3j81669r1a+5jDdkbl9Y+D
         INcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dacQiIBVSZpT+712xPIIcvhzc5Rwt0FJtEO3Co+EPnH/QhDNikH3WAChNV6SEZ4pAYg30gD+a/mFffwRJSVKr@lists.infradead.org
X-Gm-Message-State: AOJu0YxW+mSUQCobuGbQI2PvS3GvqX8xp8X52su1ERLIG78fFgp377eC
	O0IPhr91Z/4+TzS9b6Xsw1NGg26xQpo060SxETbaH5Dt6cWruOLiE1ciGfp1Q9su8w==
X-Gm-Gg: Acq92OFNUH10+fhL7nLBAzJf/SExjBVgeEkYCs5y6iyHA6erTnLrWaj3iIbVtvUVQOh
	saUhOysQCtY2Kye3R03vQVMg8IV+CVKSn1wRDcbheti5kW8qpS7TUeN3CrwRiKMp9VUmMuOeM0B
	frRaUPAVdW+P77Z+N5lK2DyjhUSvYKnR3k7jfqOZoNfjBf0vR12IkeKC3TLTZ9oxgOewlFkb1TK
	NksKgkgqQaq03z3kHPoo13YbbvvzFEHGD3Sfq5IAKwkBRMr3sE1hj/joEIrOqxk/rw9sq9vGuFO
	4ycXnnTwfjqmkpC6IVcR7NlsjEoygcIuCA2EqTY/X2wGxPgVFdjM4sRN7EQzLJO3aqYbQCBfcls
	pwe++paqbZUo1+Y5YMDlxPCVojdQqylGBFEVQw1mLgEtXWxvTVoYmSoIwIkyhVB9MWzdYGkJxCO
	fR64AVNVPg9wt1l5vf6mTNMRO2j5n8FZOmNRhKX+uO+yeQH/i7B9XzQSifY6J/guow2c2mvtn1
X-Received: by 2002:a05:600d:4452:20b0:490:b2ae:44e1 with SMTP id 5b1f17b1804b1-490eabf94bcmr544755e9.5.1781253721001;
        Fri, 12 Jun 2026 01:42:01 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2cf5537sm158942595e9.9.2026.06.12.01.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 01:42:00 -0700 (PDT)
Date: Fri, 12 Jun 2026 08:41:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sebastian Ene <sebastianene@google.com>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, catalin.marinas@arm.com,
	sumit.garg@kernel.org, vdonnefort@google.com,
	sudeep.holla@kernel.org
Subject: Re: [PATCH v5 1/6] optee: ffa: Add NULL check in
 optee_ffa_lend_protmem
Message-ID: <aivGUzU-xxiR-egQ@google.com>
References: <20260526151934.3783707-1-smostafa@google.com>
 <20260526151934.3783707-2-smostafa@google.com>
 <aiK6lgW5YFWSMTxf@google.com>
 <CAHUa44FO02DKqqNeFuRfx8bQjwcNRfPMF2=8MdjMUFp6vYUpNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44FO02DKqqNeFuRfx8bQjwcNRfPMF2=8MdjMUFp6vYUpNw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_014204_550522_816BF1FB 
X-CRM114-Status: GOOD (  23.68  )
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

On Mon, Jun 08, 2026 at 03:16:49PM +0200, Jens Wiklander wrote:
> On Fri, Jun 5, 2026 at 2:01 PM Sebastian Ene <sebastianene@google.com> wrote:
> >
> > On Tue, May 26, 2026 at 03:19:29PM +0000, Mostafa Saleh wrote:
> > > Sashiko (locally) reports a possible null dereference under memory
> > > pressure due to the lack of validation of the allocated pointer.
> > >
> > > Fix that by adding the missing check.
> > >
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > ---
> > >  drivers/tee/optee/ffa_abi.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> > > index b4372fa268d0..633715b98625 100644
> > > --- a/drivers/tee/optee/ffa_abi.c
> > > +++ b/drivers/tee/optee/ffa_abi.c
> > > @@ -698,6 +698,9 @@ static int optee_ffa_lend_protmem(struct optee *optee, struct tee_shm *protmem,
> > >       int rc;
> > >
> > >       mem_attr = kzalloc_objs(*mem_attr, ma_count);
> > > +     if (!mem_attr)
> > > +             return -ENOMEM;
> > > +
> > >       for (n = 0; n < ma_count; n++) {
> > >               mem_attr[n].receiver = mem_attrs[n] & U16_MAX;
> > >               mem_attr[n].attrs = mem_attrs[n] >> 16;
> > > --
> > > 2.54.0.746.g67dd491aae-goog
> > >
> >
> > Thanks for fixing this and for including my other patches in the series
> > Reviewed-by: Sebastian Ene <sebastianene@google.com>
> 
> Please add a Fixes: tag. This patch is independent of the others in
> the patch set, so if you send it alone with the Fixes: tag I'll pick
> it up.

I posted a v6 for this patch with the Fixes tag [1]

[1] https://lore.kernel.org/all/20260527150236.1978655-2-smostafa@google.com/

Thanks,
Mostafa

> 
> Cheers,
> Jens

