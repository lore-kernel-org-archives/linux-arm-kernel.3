Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F3CC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aC2psv7ALiBxeuXZI5bTG7C7BxKxDQncU75RPTVHyag=; b=1WuNqWoNeErbDTB6+mgOeIaY7U
	dccmo2nz1nxAd4J925PgCyjsfQer68nEjWdDeDR37klm+0dRAKx9vKbTsK2IhN9HB0ijW98Xa7C9/
	e0h3YgIh32P/FZKH+YyE2FD+ntbVUqHdl7i5ENwMgWZyPxGX90FDcO9YTbKmSLjjxraUbdnm8V1U6
	tqjZYSEqFpUCcjSAYhRa8BKNKDPXT0+7BYAqu8dfFmaSMdF2xoIZ4p8iBjGpmieP13xsoGmW5RBs3
	xMi7ef0e4ehJXPg+oEDwjDQrfHEYSbtATBsxswPwxjVwgiGS5echNwGU5R0d0O6B4DSoTpB9b774g
	oRTdxLYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFGC-0000000GPTn-412p;
	Fri, 24 Jul 2026 12:44:16 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFGA-0000000GPSp-07WH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 12:44:15 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-92e5c92c389so25333885a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 05:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784897053; cv=none;
        d=google.com; s=arc-20260327;
        b=Aj/YMS5QBuOtx/X0IQjJ4bw7NnEfGD3xjvXSwntamAnOl993F6AKak0frLH64BXZza
         nq3SsFJiVGPHNEFCEMFJOMw1iUZfMXJoi9CVoZYuNgxHFMxQx1c70E2tNoUypOMRsMm1
         xXyWL5QkyhF2+FriP2l4D9CqVaXXajjyrKhKF4xA9kgVtg9FEUj66nVOtdCZBlOpndus
         kUwdQy8XJcC12Hx2xwEQvchWhrkLhfzQUjWTUa9gpyUxH7GnNTgtilokm1j6hQtYFX4s
         4Fx+L7JfkLfvaQjVwpXzp6gbhItZjPuk6ee9JcVvPdMXcmNj9Au16O/2/4OTzk3dMyaf
         kgOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aC2psv7ALiBxeuXZI5bTG7C7BxKxDQncU75RPTVHyag=;
        fh=bgolxu4r8E4wOdQInTl5jlv575jbQ58okBU8W2dpVNs=;
        b=YzPUlNKAhkSOAJYiO0tRzG6D6osUTk/dMCBT226ZevafiSFbpnQQboaIJIIi/l+7n5
         XF0xfbgBZ2LFqQuN9POlKz2r6cC87SjUSGsRqmyHmeAFHJoCFUBFV6Cr0VqS6V8kKZBO
         +gltLQ6d1i2TCUQxqW3g8OzWR5a2+bvVhwPMIaN+SxH2mjO431T4TSCPXZhcrBWUY+RW
         LIW4Vqx8loEznWva1/qonI6LTaZdrehvK+Ysmt53K8h0x3LFmtQJxXH1gwhmgYz62SLR
         5CvGAUm4Ldz0aG/xr4thoNli+o+6WAYdP03WembSRSVULXHXaBYhLZpl3rF47LoicSEe
         eK0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784897053; x=1785501853; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aC2psv7ALiBxeuXZI5bTG7C7BxKxDQncU75RPTVHyag=;
        b=HGbWw6wUKkd3jKAtaxxbD2G4N+Vx+LqgGwVLft/ZKsweTuM9/79157fXb5UOlBssvt
         uPLo/2QRq3hg4/OpuW2G/BlikbvZvzTpl24W8nwvr9M+xpl9S3FLFUXIKKdmQuBXmy0X
         HaJZA4X/UGcMABwEmAdiI3PBr21CZ8UZ2e7286Gu6slbZfpkfrx31kzxqydT13WYY5BA
         7DUFRRp1oGuIE09yFy/JWNxNCHGjwx8FHEcpLgAJmZbOsy8H1DbpHwVb8FF1e7aSqtAS
         CnJl8zqMS//466tXVON/hXCjyUoo+T60oHfP2DUsp+A5gGJuwdKYrssPUljE4Z9M8qP2
         G+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784897053; x=1785501853;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aC2psv7ALiBxeuXZI5bTG7C7BxKxDQncU75RPTVHyag=;
        b=dmrTN4H1vg5/katCEO+lFdsaunvJdzubSAMcYRkdnGUhYpbZdw4+V5rckEMUvCzkKd
         v6MyZu55zvbReCsE5+QW8LLUXqZKa3ljTpHZCPrnIaLGrFA8N+YQx8iRAihYoxAHMBiv
         df4Om8vBv7PF3KTSMpWFFpdvQ9kd0rENPrEac5BUrZ0v9u99Y9gOBVW/liOHVc61OGRE
         OR2jJDI+Unj5Eumj6SpbC9r4XH1brqT5UcNxc20Whrq3us77zlZ1keu5YEHIsgHQApYF
         v9tqp+N73EgaKx4zapVypwJKn5Tbi3IYtAuKoZgLSE40bracfU3XTS1EuBn9nneh105R
         kaYg==
X-Forwarded-Encrypted: i=1; AHgh+RqqG+j3dhIgGTRqZhas9dVSB+xUu70XA6q6RISorpbYCASjcaCw+eAA9pKOvKJ7oTX18TQFik0J8rw1s0W31oBb@lists.infradead.org
X-Gm-Message-State: AOJu0YwrtRAPlCLgcGZJwwLE5vY99jlH/M60WuLCQ63hKtqe7UD3GqtD
	ESPqKB3lMg0a+B9vVQYqVM1RDFfUZuWvok9JlgxpUOD3qEIVIkeuYQWNeJRdRTiIwmZLTV2hjfd
	bC7irk5qkiAEllhKoYzJs5CJIlmO/luk=
X-Gm-Gg: AR+sD11mW3LbPhciNL+NLW9EYY9h4tjDKt67a97RvHYvZui3CatyzgJmWXmewvFKl2k
	iiYYf7/nk9OSfl/yZlh2HVf4W5nfyhh3dD+l3yo/TMflz1zl+tEBXChj8YL22uOuodpthflIDky
	LhVyVtrRmXIrERtEg/p4x2QjMynk852yNaTxUR3B0jPyZV+Xw0apV9D1ZwRbKz/Gx1UTmgZ7+kD
	1PTUbEET4pe4tZnocC+B1MkEATR9KZA/cLHzNMuCHaU7MJOKUNtL8g9Yv0SNfASZct4eruy4zsv
	7QUMqIqM9/nC0VO1d3gSXF9NBEW8C2JO6ptYJUZ0Mz+9wa9fb4T5
X-Received: by 2002:a05:620a:6cca:b0:92e:cac7:96fc with SMTP id
 af79cd13be357-9310388efd2mr749905085a.24.1784897052712; Fri, 24 Jul 2026
 05:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260724111548.2109-1-tharitt97@gmail.com> <193a0d2b4f7c33163cb6aee56ceee0bf5cb6c11c.camel@pengutronix.de>
In-Reply-To: <193a0d2b4f7c33163cb6aee56ceee0bf5cb6c11c.camel@pengutronix.de>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Fri, 24 Jul 2026 19:44:00 +0700
X-Gm-Features: AUfX_mxLzK4lEzDdIm63lfvgUd6SAd7_Ys3EmQdE2d3UhBcu1j4jPRBGqdfCOww
Message-ID: <CACak8wN-Y=oDbEVbou+RetS9X-Lca_MZHSY2NJFaGWR3LoVBKQ@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: release runtime resources when device_run fails
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_054414_078809_367B308F 
X-CRM114-Status: GOOD (  13.07  )
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

> But right below this, you are still letting
>
>         if (ctx->codec_ops->run(ctx))
>                 goto err_cancel_job;
>
> without disabling the clocks.
>
> >
> > @@ -191,8 +192,12 @@ static void device_run(void *priv)
> >
> >       return;
> >
> > +err_disable_clock:
> > +     clk_bulk_disable(vpu->variant->num_clocks, ctx->dev->clocks);
>
> You have added vpu = ctx->dev, why not use vpu->clocks as second
> parameter?
>
> > +err_pm_put_autosuspend:
> > +     pm_runtime_put_autosuspend(vpu->dev);
> >  err_cancel_job:
> > -     hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
> > +     hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);
>
> Why are you changing ctx->dev to vpu here, but not in the other
> function calls in device_run(), e.g. pm_runtime_resume_and_get() and
> clk_bulk_enable() above?
>
> regards
> Philipp

Hi Philipp,

This is embarrassing. I did notice this, made a local change and
forgot to re-run git add.
I will fix this asap and send a v2.

Best,
Tharit

