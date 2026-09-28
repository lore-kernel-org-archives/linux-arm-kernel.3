Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2C8CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIbizLL1IW50D5D/SYfMtdqVqG9t1BZagIkpl9KdDG8=; b=G46vguMB70IQLRd5248celaaZc
	Jil2ZrcmOaj15waHo7TsKaq1gG2UTQ+7h8WdBpG98v46aU3uS6DXJPC4OG2F9ErLTocr7mR2HePbu
	WUuMN6nbDFMqduP9O2WLIJ+MnKIBKFn3H4eIAHEhWuAz9XaeAwtQs/fQCf3jNQn7Lzea9y4qsZNjG
	lXiwysnJFf/UZNR3x8kSmL02tXNj7dR24rIHQINE8GTpUKbwoQLRgRGQ8E22Uy+i7txtd5AtRoFsD
	fD0gPmvdkIGtocPiF09rq2Kgu74pDXYLnd1Xau+BTyCK+YeVFP5LFXCdjBASQKoondaszE4n32wHP
	+1vDIgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJPJ-00000001j3D-0Kdc;
	Mon, 28 Sep 2026 22:01:09 +0000
Received: from mail-vs2-x10.google.com ([2a00:1450:4864:3a::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJPF-00000001j2W-2crP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:01:07 +0000
Received: by mail-vs2-x10.google.com with SMTP id ada2fe7eead31-790b4aeb66bso1772518137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 15:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790632863; cv=none;
        d=google.com; s=arc-20260327;
        b=Bd5DqAO55+VmSaGfjYaaCGm/B3n+U+td6h2EeRO3ZcaCT95vYVQgkt4IIWBtIybTPH
         swSIJvR29NV/a5oPsKt5kSKCruwn6R6H/y4YlWeVRr5ZxLtGre3HBB31WDols8cxcBSK
         kZePbAuvVjKzl6BwMY5KI6OsrNCF7G00L5gLFy8erJ883XEOz+8Dzfvx7KVwfjNg6CO4
         Svpl8Aa/9eXiUnR7ww6ANk+5mXZkD7xYfJzPkKJjiUamYC58qFssaiqcHZ/SJDm3IYxD
         Vw7xBgRwh0OR7Con7+i+Vmea0IFhsHL4boCngOYsicrmPZ74JoyhezOgZZ6ZgnzFburE
         PuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IIbizLL1IW50D5D/SYfMtdqVqG9t1BZagIkpl9KdDG8=;
        fh=xIKeWcADAQdelMGpCd8PO8PahK3CgN39mEtgmo2kqAs=;
        b=VwRdO+soI5UURq4HZXxvsRjz2TZA2Ykg8PomLJiEcg75EGqdkZ4mixsMjkYHoEW04K
         cHRGSsQQjvvPJ3Hqjpo9w5UrstWHfCYm/xOyPaiVbHjMcBUh6chA/w105rH3ZAX48Uqp
         NqbLfWi8a7jnYxIuoUAevgJkkWKcix0qzbTRf+L3FHhEcrmv2oipSISvzD9KVh0xtAkK
         Zm7ccVG3yc2nWvzi7f2ws4jC0CrCaVZstcHesX9nvMNzKv0fAWMAg3lcvP2bd7fN2pe5
         Xe8k+qdAN2SSQJzy8WnHowAbYaJVAYl9h9rrxbTMi8HvLqVC+O4uUYOzoLg89VgskyW9
         aA4w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790632863; x=1791237663; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IIbizLL1IW50D5D/SYfMtdqVqG9t1BZagIkpl9KdDG8=;
        b=AF/gM5jO0ehStbE7N1D4NbkyovFW7CfP8oaUcFypzi/LANTzsM38wXMlKiPyXRcA6+
         +FOKHI64cdkVslOXntm+01LQsemQEjh5Qef2JwdUUdvx92ttsSjiF/crEhHX1LEHuagr
         vHmJnlaz/ftg2PIPeFPxTjdt1kjep2l/VYdNkqIV27XpHXTT9Y8mE/F7C+yDyGO3ez9U
         jb/wQ1zHDGun7acuwvuhI9wGABcgvjzonQTlwQCq/kb+DA8C/j3T6eLJuDhRKIC11pwZ
         aJYyTnIzYZdm72v94e4Tcj6OqsSGSKDZTpbgOpi9/o1PC3Xr1rYyE+GBSoOsz74J8kEr
         jHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790632863; x=1791237663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIbizLL1IW50D5D/SYfMtdqVqG9t1BZagIkpl9KdDG8=;
        b=bo3ju/avKmOz9f5GssdHv+KFVEAXGx5Lzw468DS40xcDhbM+af4kQ6bQJ7Wyo+0nyb
         N1eqjZ/QSv/R75zxFCqh188ppAyDSZoQAoqnK8i2JWeUQwjA8ZPKo88Pf4WdDXfpUYGU
         kHDMPVF0FqQ8N9hxmz9TIz2uErNzJdVeIJ+WirpH50Kmzkwcwwjjj4UDqzSZXktE362e
         DE8BYT19z6pl3alE2x3HA6R66aUrCHTf9r8EXWR+Az85i8ItCiDe19r/3cHpKDMbVP7b
         AF+SmtNlShWMW2EoO0Mlfoe1AEopIj0AxeFwaUI5oCo69sQaijJnV6G4GoupKf5tPgMy
         lfPg==
X-Forwarded-Encrypted: i=1; AKwUvBzIgVm4rh2WSgj8DMPEphkm2JLdqXKZIzxr8jE9j18sg1ADS+rZO26ILD4nJqqPvbn4CAIDrXxWxuU/zF7Nkv31@lists.infradead.org
X-Gm-Message-State: AFq9FYKmuqwim+RfrK3Iwwfb7gdWt0EKAM4PJpdxE8FC5ViBkQpbYdN8
	i1llUvex6pYWb9HKc93jAnQRzTTVTo/JeF9Hjzb8kZbxMLpNgswz2ox7HdYvgv4bQunwgAOjZQK
	CFuVuDTp7Jk3oLK3NjeGpWYU19DFHcjJLrxlgXDTUpaw71BbyD6Es4QE=
X-Gm-Gg: AYBFou3zE5ntkrmee0cton1+zddWY9ggiPH7dkk2nN+Y+7EE7CQ5m2bjI/bqNNZ44T3
	IIgrEmHA2Yg8Qvit1ZTRYuJPnf6bPfY600jY00oENYnhiGIk2KMgijcYp9N24kpD8KZ9K4RKLK9
	JktfxeUXQADZO09yUiai9zCkZ4HshcJ6qRWUOqzW6Jj0NmYLLYVoZ98Z+o9D1t9oox2+JHDQFjG
	P6LaPbAyw66xHQJFgkUv9tnFeb0/HCeQpieBaAaQM5uDIDFpibuqIZ4AqFgNA9h/oBRpBxXV2ws
	AFGZzBWlhaAAxMLWL/DUbgapqfAN1I2h5pltiEOMaxPgV1yvEmXquV1irdOu169szQTckDPE0G0
	ZwfeC6U5e/57fjj/GsnIZFNv4ScBUggU=
X-Received: by 2002:a05:6102:f9b:b0:7a5:2792:32d0 with SMTP id
 ada2fe7eead31-7af1ceaa02emr5908124137.15.1790632862303; Mon, 28 Sep 2026
 15:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260927190758.609156-1-nikitash.mariiaw@gmail.com> <arrfZ5CYyLt0vwu5@google.com>
In-Reply-To: <arrfZ5CYyLt0vwu5@google.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Sep 2026 15:00:45 -0700
X-Gm-Features: AclHuK94P4MPekguKF_IY4W_INzWG9JHQ-jlAiJvXzpu9Cjfe5tqxJdexiBcwT8
Message-ID: <CAGG=3QVY_OGjSYZgJ8i8Nb-EbwHKPOvZsbqqXfcbv+Vvq_wsww@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: Use snprintf() to construct pin bank names
To: Justin Stitt <justinstitt@google.com>
Cc: Mariia Nikitash <nikitash.mariiaw@gmail.com>, krzk@kernel.org, s.nawrocki@samsung.com, 
	peter.griffin@linaro.org, linusw@kernel.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, 
	aleksandr.loktionov@intel.com, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_150105_714981_D4214D65 
X-CRM114-Status: GOOD (  28.71  )
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

On Mon, Sep 28, 2026 at 2:43=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> Hi,
>
> On Sun, Sep 27, 2026 at 12:07:58PM -0700, Mariia Nikitash wrote:
> > From: Bill Wendling <morbo@google.com>
> >
> > samsung_banks_node_get() constructs each pin bank node name by copying
> > bank->name with strscpy() and appending the suffix with strlcat().
> >
> > In preparation for removing the deprecated strlcat() API[1], format the
> > node name in a single snprintf() call, which preserves the existing
> > truncation check against sizeof(node_name).
> >
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Cc: codemender-patching+linux@google.com
> > Assisted-by: LLM
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
> > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
>
> Are you forwarding this patch on behalf of Bill? I see Bill as the
> author of the commit and I recall seeing this in some series he sent
> earlier [1] and this patch you've sent doesn't seem to be a v2.
>
> Let me know what your role is on this patch and why it has been
> separated out from Bill's series.
>
> It is entirely possible that I am lacking context. Please fill me in :)
>
She's been marsheling some of the strlcat patches I sent to the
mailing list. It's possible I sent a "v2" of all patches, whether
there were changes in them or not.

The patch series needs to be separated a bit because of Kees's
'seq_buf' changes, which will make some of the patches I sent
obsolete.

-bw

> > ---
> >  drivers/pinctrl/samsung/pinctrl-samsung.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctr=
l/samsung/pinctrl-samsung.c
> > index 5ecc9ed4c44d..0d639eec689c 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -1155,8 +1155,7 @@ static void samsung_banks_node_get(struct device =
*dev, struct samsung_pinctrl_dr
> >
> >       bank =3D d->pin_banks;
> >       for (i =3D 0; i < d->nr_banks; ++i, ++bank) {
> > -             strscpy(node_name, bank->name, sizeof(node_name));
> > -             len =3D strlcat(node_name, suffix, sizeof(node_name));
> > +             len =3D snprintf(node_name, sizeof(node_name), "%s%s", ba=
nk->name, suffix);
> >               if (len >=3D sizeof(node_name)) {
> >                       dev_err(dev, "Too long pin bank name '%s', ignori=
ng\n",
> >                               bank->name);
> > --
> > 2.43.0
> >
> >
>
> [1]: https://lore.kernel.org/all/20260915081910.4142719-17-morbo@google.c=
om/
>
> Thanks
> Justin

On Mon, Sep 28, 2026 at 2:43=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> Hi,
>
> On Sun, Sep 27, 2026 at 12:07:58PM -0700, Mariia Nikitash wrote:
> > From: Bill Wendling <morbo@google.com>
> >
> > samsung_banks_node_get() constructs each pin bank node name by copying
> > bank->name with strscpy() and appending the suffix with strlcat().
> >
> > In preparation for removing the deprecated strlcat() API[1], format the
> > node name in a single snprintf() call, which preserves the existing
> > truncation check against sizeof(node_name).
> >
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Cc: codemender-patching+linux@google.com
> > Assisted-by: LLM
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
> > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
>
> Are you forwarding this patch on behalf of Bill? I see Bill as the
> author of the commit and I recall seeing this in some series he sent
> earlier [1] and this patch you've sent doesn't seem to be a v2.
>
> Let me know what your role is on this patch and why it has been
> separated out from Bill's series.
>
> It is entirely possible that I am lacking context. Please fill me in :)
>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-samsung.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctr=
l/samsung/pinctrl-samsung.c
> > index 5ecc9ed4c44d..0d639eec689c 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -1155,8 +1155,7 @@ static void samsung_banks_node_get(struct device =
*dev, struct samsung_pinctrl_dr
> >
> >       bank =3D d->pin_banks;
> >       for (i =3D 0; i < d->nr_banks; ++i, ++bank) {
> > -             strscpy(node_name, bank->name, sizeof(node_name));
> > -             len =3D strlcat(node_name, suffix, sizeof(node_name));
> > +             len =3D snprintf(node_name, sizeof(node_name), "%s%s", ba=
nk->name, suffix);
> >               if (len >=3D sizeof(node_name)) {
> >                       dev_err(dev, "Too long pin bank name '%s', ignori=
ng\n",
> >                               bank->name);
> > --
> > 2.43.0
> >
> >
>
> [1]: https://lore.kernel.org/all/20260915081910.4142719-17-morbo@google.c=
om/
>
> Thanks
> Justin

