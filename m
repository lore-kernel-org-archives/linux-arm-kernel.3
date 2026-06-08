Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836A6CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfDmQD3XkqnhyOK6L1IuRTH5e227SPMKiBMcBej6ec8=; b=l264d2fAERr65CW/86RktfIAdt
	l0OuFdb9q7lsyB+w1Sse2wibIuC65Qs2rdY9U72suDVSXm2ZT7KQ/tP0IZCzlS5EWVbPFjiTi9UPw
	GgkhUXvwSIrVuZrevUVG00NZGX5Qu4xhbXV0vrNej6gQhMWvYaFoKNJXdXaC2w/OU+n8an+BWkgwt
	qBJ7dEHlquHBjfXS3jZSn2xwwHwKzpv9NTOlOznJVYgPJT1HWJNqCWxdPZYYMMTDCxnsrurmUv4JC
	HFv6umBglL9onqeG8q6lTPfoUqJy1WLQChu/yA0CV72JU1FLDPRZ610S8Fjwn53GLT+whZ+4Vyeto
	WUnEQzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZqk-00000003b6K-0IAM;
	Mon, 08 Jun 2026 13:17:06 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZqg-00000003b5n-3Wy6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:17:04 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-43b7e186a0cso1553498fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780924621; cv=none;
        d=google.com; s=arc-20240605;
        b=Ie/HJksN47xOQyNK7lJVBsNUEshREqQ/d7qfneT4lkzdTvZyxhiGLHQL+Wvk/XiTfc
         FkrmLdJqft+THehupbJR+6HzIXm33Vylo5GV4KVOmnyeIgrK2NLm0xQx+GGqnCFZZVJJ
         rhkKVdD0QxCkWcDbFjH/EZ+K16ltH+I2Q6UqhiJR/5ZutpUwebBp4tlcKdFySIjuZjNV
         nRTmRXoGd6gh9PCgWTW+IpcH1nV0bN8uuQzM8UuxV4tmeWneAiKplNmn6BDrLM+u8FsY
         h3hlbz9o0bvHqDXisN7lvrP9xqBvyWpQ3mZQGnZ7AUAewYQwZvl25zZ4TPpxzOPd7ayS
         N8Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AfDmQD3XkqnhyOK6L1IuRTH5e227SPMKiBMcBej6ec8=;
        fh=88WuWbWt94E03SBzLFLG/mkBydq/AvOkHYv5uxes9tw=;
        b=SOLsmbM4b68Qgu7aX/OfBIcnaHvgD/AgiDIbIxPUSwKr7xxe1wwkq0NZa/vJ4lnp2d
         bI1oCriZMHW7tLPqFDrVCHFtITyUYTJ7hQukcP9pjkC4Ki0rpHCsgOFFsL+sSULzezBk
         IEHsQuHy/YykA/vsaEd1cEt3FkP9P7GZ+lnQ0WXTbatjHYhwEdJaYG/BLoPk3/Qp1qkS
         cXNdecteaBDb92TMawBLbhp/XSGgc9RZhsoRoqMB6wnF2BF27EBMO+a7CrgIMt3gJNmZ
         Lx4wlYk6M8Pj1UVzc0Rvfw7QmWInbm4zOJih+WBBy6tNp5Y2UEJVwklXC03E0OhnrfP1
         xJLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924621; x=1781529421; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfDmQD3XkqnhyOK6L1IuRTH5e227SPMKiBMcBej6ec8=;
        b=cvD9cPGc1F1Y1UmywKg6lXUsBKtxWncsU0c/byyW6iyOYC/6ScS5beroRb3nFKPNJI
         URu2UYQJr2D8voTohefxH4xO5cpA1+/V6ygGAx1eThoKoAgc/y9XnU7vuyMI3vg9hlx7
         OkKeCnYP3moKVUekceKQoEIH0jjQih/LOK39dQh/ORHkeD2DR7yDtlM8BPEqUtlzkUnQ
         v+hDgLz2L8Yx293IpEfpChWjgl5097KCxvaA7jpDxxt/S7pjnOAfb0+kdgB3zgIH/O1e
         ejYjrmHOq1668nm4TEPZa5756mfV6FDMhd3NSDjLZb+L5X06mpFJenbGHNrwV9wCt3R+
         xRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924621; x=1781529421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AfDmQD3XkqnhyOK6L1IuRTH5e227SPMKiBMcBej6ec8=;
        b=ALGRow2R+WI8V9btM9COSbSlJh+54kzbLQQyfHSp82oLXUfVT5lbmlL1M0nbId0Lf9
         Tkkgro6mxqKCJQFIXj0CWxEdEufUIGAkrTQLggY5+FZhALosl97zs2XooEq1RA/+t9OC
         MWzVWwdDKintMPGy2ngy0IP1D2vrGb3x+q0mZGAuELC8Smq8zuKlus3dNaGiDbuG1YpH
         jfAvSRtkbEr5QwbYAXMzMb3tjhug7zo/Twr/gcFRpz6q3mlS5B/Qx/DJbSItadSKe8PG
         ybul9/Tt8Q7oH/zwiS91zzicmlFrt7caGsnr4hSYR656lFEOy82WnQ7atugiIhGRsQX0
         zeFw==
X-Forwarded-Encrypted: i=1; AFNElJ9jl8bmgJKCV5A7/DDPJDyEvyF8jyu4Mrpa8CvKq7E+uwl1byw88s1tafp6Fqo6ELBCQ2/p/orH7oHJtWreezOA@lists.infradead.org
X-Gm-Message-State: AOJu0YxMNKQYR2fiEg+1I/omHb7OeniCwpEzMj6tSsvxIsYHAZeB+Fp7
	ZWAnRkvxcNDtbhqZds551dhBbZ4eTm9vrscI1RFJmNQDn3SzEeFY+ZwpiD3f+qV0MaNZktqYqFe
	Rkp/GSbx0GRoK1Onj3iLF2YHUMd9URJMY0x14DAvZnQ==
X-Gm-Gg: Acq92OEDgyKb65dWZxiq5+r/mBCq4tdQPJzpX1ltPiFk5HtktA/Ukz/OK+QW5eCthnS
	B/Pcs3Nk9hGZRkaTFJsPaAu5PHmW+Tcpx4Sq6A5UsjPhBeOqr87t00Z9Wbo89sj3w31z7U3oZx5
	3SAtJM8jLXnOW6jy0bvBfhjv6AeqytY7eSGmzjVpvZM8QoTJWqd+E5PMxueVUpGz9TR6JjIjoi4
	4dHiNRHzwsWck4fEuAXThug2qYPtL2EUboNAHRdd1bUibsPOKJfvRZUd6LkWQNmP6dkgLztKyWy
	BzpIKuM+0U6irn1Cvfv4Zd05BWs+4gP4lhB7gObiw3qS/Y09
X-Received: by 2002:a05:687c:2346:20b0:441:b0ff:132a with SMTP id
 586e51a60fabf-441b0ff148fmr1273772fac.18.1780924620975; Mon, 08 Jun 2026
 06:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260526151934.3783707-1-smostafa@google.com> <20260526151934.3783707-2-smostafa@google.com>
 <aiK6lgW5YFWSMTxf@google.com>
In-Reply-To: <aiK6lgW5YFWSMTxf@google.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 8 Jun 2026 15:16:49 +0200
X-Gm-Features: AVVi8CfBberieRGRzkn_uKkTDDGnJq3OimnjM0eDLOzbP178qkP9W2-4m7NvonA
Message-ID: <CAHUa44FO02DKqqNeFuRfx8bQjwcNRfPMF2=8MdjMUFp6vYUpNw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] optee: ffa: Add NULL check in optee_ffa_lend_protmem
To: Sebastian Ene <sebastianene@google.com>
Cc: Mostafa Saleh <smostafa@google.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oupton@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, catalin.marinas@arm.com, 
	sumit.garg@kernel.org, vdonnefort@google.com, sudeep.holla@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_061702_937180_51400990 
X-CRM114-Status: GOOD (  19.65  )
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

On Fri, Jun 5, 2026 at 2:01=E2=80=AFPM Sebastian Ene <sebastianene@google.c=
om> wrote:
>
> On Tue, May 26, 2026 at 03:19:29PM +0000, Mostafa Saleh wrote:
> > Sashiko (locally) reports a possible null dereference under memory
> > pressure due to the lack of validation of the allocated pointer.
> >
> > Fix that by adding the missing check.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/tee/optee/ffa_abi.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> > index b4372fa268d0..633715b98625 100644
> > --- a/drivers/tee/optee/ffa_abi.c
> > +++ b/drivers/tee/optee/ffa_abi.c
> > @@ -698,6 +698,9 @@ static int optee_ffa_lend_protmem(struct optee *opt=
ee, struct tee_shm *protmem,
> >       int rc;
> >
> >       mem_attr =3D kzalloc_objs(*mem_attr, ma_count);
> > +     if (!mem_attr)
> > +             return -ENOMEM;
> > +
> >       for (n =3D 0; n < ma_count; n++) {
> >               mem_attr[n].receiver =3D mem_attrs[n] & U16_MAX;
> >               mem_attr[n].attrs =3D mem_attrs[n] >> 16;
> > --
> > 2.54.0.746.g67dd491aae-goog
> >
>
> Thanks for fixing this and for including my other patches in the series
> Reviewed-by: Sebastian Ene <sebastianene@google.com>

Please add a Fixes: tag. This patch is independent of the others in
the patch set, so if you send it alone with the Fixes: tag I'll pick
it up.

Cheers,
Jens

