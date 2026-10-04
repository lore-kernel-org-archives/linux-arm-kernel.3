Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6809CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 07:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXHSUTDfF56/ebo2tUNw1YI0rOH2BaPU/almIFz1WKg=; b=mNVWhOawwc0c+pepqVPh6ndjt8
	aKu6h0JhhVizAXbvwIYc8IcdH6QmicBQ21qDJ0EgEoJvhEibvTGD7IIsp+eMss0x2cC+sWYEIBw9J
	iLGFuNMtRM/fnMZ85/0Iz/ZECaCprYkYjiFEMZdQWLmljf81cSNsqZgdJBOdWgXeuMsz6bQbj96Z3
	jdFg59s0KYtaBt+j6GH5d15QQEMvT+yhJXGcqVcHsW94QikOD/gOi9m2qe3zIeU3O/m6mLcrvdzVI
	wTHkSNk+s+urYuS6xJe0sPC/sq79c7pndDtL08oniUcorZNo6UiS8x1ioDzc4pxNI6LyCXK5F11ew
	d7PVQLag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDGDW-0000000ERqR-14Pz;
	Sun, 04 Oct 2026 07:01:02 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDGDT-0000000ERpR-2AdJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 07:01:00 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3a2b4743936so6696431fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 00:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791097257; cv=none;
        d=google.com; s=arc-20260327;
        b=GLQFZBDLpGgsCFnKKCDKSsdISMdbV/9PzUtxsSivfQxT9KntyKYLi/RTp2zsjrxmEm
         CGT6G9mLUQXCgE7z4i/3LBGScEpAqXz5+GDcm1FMQBLBJLGSuBZPkytt1ony1lbO8wGd
         Yl2DB0zA5ymgbPbt5DqPj5FJoX4F7CHRbHxPAovb82KWCWFRbxjib+irOe3KVXfd8TAS
         QxQraz53wreBMnd93bl4PCxyQFxCnnGAYSp/xRyhQXiQ46MmBxQ25lv5OM/BwixzcJCt
         aGm8bPwyP2/4SCcK1ec2rcBGqejk7KapXyj9V/jTJkZPQB0BHvkPK7lsgTMtKovCgQTb
         pyWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bXHSUTDfF56/ebo2tUNw1YI0rOH2BaPU/almIFz1WKg=;
        fh=osj8ZzPvCTG11V8JuZcg9xB08eYTByfpeFmoiWrbs1w=;
        b=HijkaBDgCQP211sPkKeRkibHYFV85gijKtDp+mQ3CY1YNsMTk1FnS50kw0V6dmxI9e
         y0VT5/AaCxUjb2M/JiR623+VUJDJqvwTed+zmJ1IAE6JW7hRcsAmXoekot3eHHGKKoxj
         DRY8QtM0AWIQhMy/kJIdXgFux1IUG1pRjpOT43E9CqzwY26VJHFhT5pW4r7NamAE3mDQ
         3Sa4bT0w+hNjPnAHRq5fwUIgppuUbPBKDdtJn7JOSpwEbdS5sjqpe+xJVBI51PJP5U+r
         n1m3PC7OMtGbHQcI65mv6b54PZqoqK/IHZ6r6hj7YfyJ1qs+6QAhepM9NZe/TEckW8SF
         k7NQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791097257; x=1791702057; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXHSUTDfF56/ebo2tUNw1YI0rOH2BaPU/almIFz1WKg=;
        b=tHJ1tBuShilv4ouae2hJ70m0tM9Nb6B/y87oUWLKNahAk/HuIC0maGhq9Aa3WeEto1
         s/IxUPLq4mu2cnAjUF25Bc/g2qj0wftgiITn0eR5P8mxzmbQk3iBBP/kZbklil3KXKKb
         8K7C/JlSvaRgV/ctm4WJTXUCyZyLhFMqOyZflqUbx1H8ViZ+T1Xve4+1BrPzKMmi/ACH
         dSal+nwAanAiC+iETc97RU5EMejFxHNQ4gHEGhSJEcHhRfsUV5RBXoSn/7XIUsbjJtKW
         LN0EIxKe2YRV7NhCaPpicpEaIaD/+hnfkN9l7FY09rwZ5nLqVP+94hPOyQxiux1NfKyj
         CuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791097257; x=1791702057;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXHSUTDfF56/ebo2tUNw1YI0rOH2BaPU/almIFz1WKg=;
        b=WNZ5nfFav3MwqvQh28lV5OF7BOGY65dOWa+tKZ5XXc1k0JYcAwlAa+MKGk+0CU4/B2
         Q37f55Ziy/ats05qS49ZESZ3MZcT2+3DAobMqq0cMeiB5RsmGLgMZj0iq2L48y8tEN5L
         v+oOVlgyLox//rlWRGqHZuPeymVjRj8oVV2v6FVlGYC6VSU6RrZ+0nK0NXnZDIwDWc+C
         ZlXSd6Q1DkNt2TNPSIsXQLdu51fho1bG8z2QZ09FrXdYeHS5Zylqd7F0Ue11aGFZRjOX
         uOY2ujhkVZllBSEwYN80bnlR4dHsa4c33eGuCaZEtbrPiUZ3RC5CsfhKd7fPdqVU6VfF
         JJlA==
X-Forwarded-Encrypted: i=1; AKwUvBy5rA60ugOhZzGvt3Isglkr7cGm6OObZAf1sBtgVBSkZfeOzeTTqZkkcC8xdBE0K0ogqs4ifiNIJisqDtMRaZ+S@lists.infradead.org
X-Gm-Message-State: AFq9FYKox//mCy4VRgrzCR9YAH78zMoTm+ShcFho2KGm9AT3ieah1qNC
	2lbCjJQXDOjaxkIVXqqAL00N6dt4OWEHnFp9wRX1p7ZSi11AUwYuhQGXbHzKy1htgLzOfscXJfG
	c2GuR9ZTJx4air3zK47GgJ2ePdhkOVkA=
X-Gm-Gg: AYBFou1HHmcb4Ae1JCnG/mTVsPqWz8YkDzWaI9+mB6khhzgf+NvR9JSSzSOnbmzjyh3
	5yl7qwK7toVd0dRLMXYiuQ04OLpxwX2zd5teXDH/iThvFofcbS8N0v697xt0OwRmVLjdl8ZfKFV
	oWQ1RbmShcvh++FRq54lzPRmqT0rJd4GGEuCzi07tJRcXf1aWHOECxI/DDNU07c2TU3/Zm+O0de
	O9IV5le+AjgIMPRwFHCJlVtg1/Ot+YokUa6GCs7wsiFaSUBSoCbz237PMDQEXgHGp1Fp1Au6Ils
	a3fLyumMOQiQqA58ptVURvI47XqXN8B71GVpiyzXbH5I5bkiUl3tVw==
X-Received: by 2002:a2e:bc03:0:b0:3a6:6f81:1017 with SMTP id
 38308e7fff4ca-3a974f53555mr10680051fa.17.1791097256973; Sun, 04 Oct 2026
 00:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260930071536.627964-1-maimon.sagi@gmail.com> <20261001183814.4e9e88e6@kernel.org>
In-Reply-To: <20261001183814.4e9e88e6@kernel.org>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Sun, 4 Oct 2026 10:00:30 +0300
X-Gm-Features: AclHuK-gKLM5DyDjTIWluJ54WCoWTSUW6QHXG092v8fap6l1hS-WaFJz59CPzZQ
Message-ID: <CAMuE1bF_=t7qoPxxhXA5pAShnWx9kGpy0BSnRj_CwuD9WUuX8Q@mail.gmail.com>
Subject: Re: [PATCH net v4] net: axienet: cap the TX poll return value at the
 NAPI budget
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, radhey.shyam.pandey@amd.com, 
	michal.simek@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, robert.hancock@calian.com, sean.anderson@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_000059_574767_0DECA621 
X-CRM114-Status: GOOD (  14.59  )
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

On Fri, Oct 2, 2026 at 4:38=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 30 Sep 2026 10:15:36 +0300 Sagi Maimon wrote:
> > @@ -1027,7 +1027,12 @@ static int axienet_tx_poll(struct napi_struct *n=
api, int budget)
> >               axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, lp->tx_dma_cr=
);
> >               spin_unlock_irq(&lp->tx_cr_lock);
> >       }
> > -     return packets;
> > +
> > +     /* The whole ring was reclaimed above, which may be more than the
> > +      * budget, but a poll must not report more work than it was given=
.
> > +      * netpoll polls with a budget of 0 and expects no work reported.
> > +      */
> > +     return min(packets, budget);
>
> Please take a look at commit a58cdf56b6e, that's the correct approach
> (incl. feeding 0 to napi_complete_done).

Thanks, that is cleaner.  v5 does the same: it reclaims the ring,
completes with napi_complete_done(napi, 0) when budget is non-zero,
re-enables the TX interrupt and returns 0.  It is posted as "net:
axienet: do not report TX completions as NAPI work".

Sagi

pw-bot: cr

> --
> pw-bot: cr

