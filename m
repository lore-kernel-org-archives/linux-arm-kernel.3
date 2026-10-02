Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7732CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+6anAjBWwwyq2myOIAQCnGt8ykxWfOmfyjZNrQsOg8=; b=xjrtKWBgi5dIGXdJSRmtagjRod
	JzFY8l+2zn/TvV7lBkH3cNf2+nnGp9PeMjFZDQXKXjLYaUyveSCaVQ+02KvxrPNOoqaN+e64i6eCu
	cbzobsmW9WNG1dkkmJo/tLfXiuxpevnlH8ckkfXOOQ3U8cFgAU6Uvt5UpvxkW7iUIOWedrroQdd3x
	jyjTFA560u9ol+LagkCjLYD1O5innmUHp9n7ellLY8MB0/p0hXJ5ExlkJ/MTTWdzG0jhVFD+6O7O2
	IKpgPxa1udu9IyKwtPWOwtBQnaAuYSs3YNZJMKUDgLcN0616tVl728cV9Xyd3DokLPWFEIAN17QoX
	8u3a8SeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjCz-0000000CQWg-37yt;
	Fri, 02 Oct 2026 19:46:17 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjCx-0000000CQW4-3SHg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:46:16 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6acbdbc1725so801491a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 12:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790970372; cv=none;
        d=google.com; s=arc-20260327;
        b=Nm0Bi5Mzu3CNtRG4zScfV1VVxvySRo1RcsXybyU8TDozggVqrBF/enbzDzALm3ngzT
         ogiHv2aFfbEKTX8kskgJo9h3gq9Zy1PmeviyRrZpNDx2Am1LPycUEpzlJ9XV6je8RCxN
         xo6Iryt7Zm516mCGe5mA7pE7K+MoVnzcttSaJ7v0ChRADghqSsRtS8fKJ5Dv59pRN3Ha
         KvWOg1hKhXFBQbfUCbECQSQYovRFAavES8x7IZFTolVKGbZbk1BGYi8LfB4VoLD7yQj0
         +vuyjYsTs10CqOKfJkDC2k7kd6A57RkZBmiexALNdb9hNh0NAdCX1qeC3LHMYamEyaxt
         k79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j+6anAjBWwwyq2myOIAQCnGt8ykxWfOmfyjZNrQsOg8=;
        fh=Kg05ywj06voHKVfyxB4J94ZNT4HDa5rh+CHnC4fyCg4=;
        b=s82GpdObPQ+rDuzovCBB4v2SSA/b8sUdGjFwe83in9CArCKVCyOzny+ZcFat0SHK/O
         wt/F4dfa4Rvj0nmuEEcEiubwVnCBWpKKSNWtTitXYXGzJ2uGeJPs8QVuEujt98IrrK2r
         UWTEbrh0ef5XKNxsmo2WE+4lKpIlp1sQTAepDMylegD2ZMCXWOSzGVb6t55NSQKDE3mc
         LOdDB2SuXWEc/xRCxXr4oFGideSg7Bw6C0ef7JayFppNKcs/SvN2zdyZkZhClJA0yAru
         nlBQN9/G8laPKGKjebu8fP4IAxMCcbIVTmpFcrk+xZWSjMYTrFNlNiU7NxQIwlrQzDds
         mDbQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790970372; x=1791575172; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j+6anAjBWwwyq2myOIAQCnGt8ykxWfOmfyjZNrQsOg8=;
        b=kGld5Mt+YyKQwJ1SkjcnfPizVOn7u5yseUPMi1AKoAmqL38gGp9ndm7kQ82gaBOHG8
         rytlKJC5yOzdipCSMzuYe2ZIibu6EzwqCc9oPuezoWzD2gPx7eXFbosITQkprPvByi7G
         NzcG5+UnmpgzLNlHEjUuezqbaxEdxrJzTPAhJdWe4BgfJBccDVDmNDNnyQpIKF9ZA25f
         yQbih5fdVLBvqb21JgrwUIB/EG+mNDQRHHAh6yNx4XpTs614Yhof/st/LSssCLBqQCs1
         1WFyNYwuUnDQIWoCKM7rg7lg2ykGSovF4/YqiAy8hnywYFBfkiSv7XpWqoXAd6PgvOLJ
         NSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970372; x=1791575172;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+6anAjBWwwyq2myOIAQCnGt8ykxWfOmfyjZNrQsOg8=;
        b=AeZaq9dBj2HPHp03WTw6ra3TSFTxQF0hN1f//CVNwzZNSSZ7dDdKq+ykZGEdbspyBU
         tRyzIC8qYfeDykBx3ELCMLK93wdz6hw3ln9rn1/Yz4VTrfvME6G8E2Qp/YZu/0JFz7sW
         7HsemNTA85cEwLQRbePRcqUYtPgGTjmswF/d68YmMeSGm0XoxGoOsOmaI/BBV6CCky0U
         Jdh4tMNathe7WONmvsvTcxTxWpquarYMJDl4H2LrEOc5mDHezGYcoyy2Jns5alHRM+ai
         gPAhfLRsfEb3mfHUNOlt3JTVrXpiSM/N+icsihseKsvGbHaGCutaQE7sTioBlvl0DCJZ
         NX2Q==
X-Forwarded-Encrypted: i=1; AKwUvBziSj7v1CC0BGOm1Tma1R95MKptLI9uEklZmbfHROxwktoFLuWQZLtMgtvdko95e2cJ3vSgYo4jY6QDXpnIBlf/@lists.infradead.org
X-Gm-Message-State: AFq9FYIq0erd2rNUNOGq5+owpdpWbQDew23T4Y4O8ebAW8vzF89c7B7l
	73pr40pxchfUU4t+47It/smJDJQNXZJ0OThDsRcab2jApcwtrXTFjKe/BJr3eLMRr75zBE81Ubr
	H4vFiXdEQBx8DpnJfgndS9PGRbZSWaw==
X-Gm-Gg: AYBFou32nh5AWx98A+miHlnjrTX7I/cW1pDHVVufSurGz4YMKKEGnmY0eddpM+jsp1v
	LUKvKjpdfh6ZMpq8sw6yetfkB5UznxeeejpRsAB5yt3glTSBQZiKIoMu9Lch0AY9PZi5tzvqpvg
	4UJfJToOpSpsYVaUor8oJRlAafAe5CHgeUaCnvREHw3e25pavlJ8jNFFkIgjMLEVsBAyg2Sor2r
	nPJreNH1h50UjBuvV6zUERipY2Usvy/g8UqPeAkVu3f8B//p7CeQiwMY2yxsstdlPN9stuR6v6Y
	QqsK885f/uZOuSmor7dzNGeuGSUdgr+LKmpzwmIoE9TrkcykLGgVovBgr+Si8AyPx7rPSwWiSEr
	PX96H3NCML8jycI3pQ1gAH+tZGLlqmtlCwSS7Bi6jAPtdAjhN1jMgjxyqwxMog/wLzUfZ
X-Received: by 2002:a05:6402:5389:b0:6ae:16f5:5bf0 with SMTP id
 4fb4d7f45d1cf-6afada04d25mr366851a12.29.1790970372050; Fri, 02 Oct 2026
 12:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260917200136.75721-1-mhun512@gmail.com> <ajjy7y3ycnfqrofts457he5zlv34ncqg3n3g2qxgdgod5vbb2u@u56cc6pxihau>
In-Reply-To: <ajjy7y3ycnfqrofts457he5zlv34ncqg3n3g2qxgdgod5vbb2u@u56cc6pxihau>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 2 Oct 2026 15:46:00 -0400
X-Gm-Features: AclHuK-OVkulTTcELXTW6ppNQtuiiKOubv_hU1rUhsWYHuSBkRjxBxVA6Daq1vQ
Message-ID: <CAGEsz8FO4vN2yg=n7-Md9PBm5XVNjSiWAkH0fXNANZkYgUOkhw@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: dpio: Free the IRQ before releasing the I/O object
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Christophe Leroy <chleroy@kernel.org>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_124615_879890_9A433854 
X-CRM114-Status: GOOD (  23.43  )
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

Hi Ioana,

Thanks for the suggestion. I've moved devm_free_irq() into
unregister_dpio_irq_handlers() to keep registration and unregistration
in sync.

I'll resend both fixes as a two-patch v2 series, with the probe
error-path cleanup first. That removes the unnecessary unregister call
before the second patch adds the managed IRQ release.

Thanks,
Myeonghun


2026=EB=85=84 10=EC=9B=94 2=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 6:44, I=
oana Ciornei <ioana.ciornei@nxp.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Thu, Sep 17, 2026 at 04:01:36PM -0400, Myeonghun Pak wrote:
> > The DPIO interrupt handler accesses priv->io, but dpaa2_dpio_remove()
> > releases that object before tearing down the interrupts. The IRQ was
> > requested with devm_request_irq(), and unregister_dpio_irq_handlers()
> > only clears its affinity hint. fsl_mc_free_irqs() returns IRQ resources
> > to the MC resource pool without freeing the handler. An interrupt can
> > therefore access the freed I/O object before devres releases the IRQ.
> >
> > Explicitly free the managed IRQ before returning its resource to the
> > pool, and perform IRQ teardown before releasing the I/O object. This
> > also waits for an in-flight handler while the object is still valid.
> >
> > This issue was identified during our ongoing static-analysis research
> > while reviewing kernel code.
> >
> > Fixes: 993fec7e11ca ("bus: fsl-mc: dpio: add the DPAA2 DPIO object driv=
er")
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >  drivers/soc/fsl/dpio/dpio-driver.c |    6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/=
dpio-driver.c
> > index d5198ffc4455..fa82cdcc4922 100644
> > --- a/drivers/soc/fsl/dpio/dpio-driver.c
> > +++ b/drivers/soc/fsl/dpio/dpio-driver.c
> > @@ -263,6 +263,8 @@ static int dpaa2_dpio_probe(struct fsl_mc_device *d=
pio_dev)
> >  static void dpio_teardown_irqs(struct fsl_mc_device *dpio_dev)
> >  {
> >       unregister_dpio_irq_handlers(dpio_dev);
> > +     devm_free_irq(&dpio_dev->dev, dpio_dev->irqs[0]->virq,
> > +                   &dpio_dev->dev);
>
>
> I would suggest moving the devm_free_irq() call inside
> unregister_dpio_irq_handlers() so that we keep the register_ and
> unregister_ in sync.
>
> Thanks,
> Ioana

