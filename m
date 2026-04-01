Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8381076368
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 05:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIWNE/RAkZ7ajOJ8PPae7L4AdvTk4JaPCBjSXOIrGz8=; b=qfdP8bXe3DxavMh4vOKgdA+dXa
	+snTzfmDCSdEUgxRzTcjBvaDvoKmSj/vdyjnOlkXect1aPZWWOmzbxcZib8yBK/NOigP+4ff1jHxK
	tULYKGkNpaSmvrN+kXxf/R3l5ZRGxca2o/REf7vWtdL9CLMXQBHA4Qt047qZfiXNMOmHM8stGzYHi
	HERsjmm5fVp8DtADlXJWT6iYPHUvasK2aRzyzCc/+VD8WFyPWgfPVGp7yYv0yiKIYX/ryiAa4s+cV
	LvVaiKs9tNnwteltsjLSgp/L/wK+z2nTvnbV61Omy+TOTnyJIBjKknvAKeLoPaYkieud3CNs0bdXF
	3d5cAcnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7noD-0000000DyWR-31Ri;
	Wed, 01 Apr 2026 05:08:05 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7noA-0000000DyW4-4Awd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 05:08:04 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7d7c77fd31cso5995922a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 22:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775020081; cv=none;
        d=google.com; s=arc-20240605;
        b=LR0P+nCYU30qsLZKQ1c1/HYDY57P4AaqqKCqrMk7Qodtjb4MOZMIMTjFM9gO+fcT3g
         9CsSDhYAn6FvPVAF41zwoJCUJc8M+WCtwTH3hPhyY/YMoEzUV6lqoKdV2cEEQLawnhvf
         +UJ0ZUsXxccH5c6PP+s6EwKOvdGpzGaRCod5HKFy4LYoXS8J1Ohkjpw/Wja4U9vkAcOX
         zVUfrj4td6dA5w/lzZVXNAWb6z+goLuMJ5N2wOpfaMl0p2YytkzTblcOnSrhsNsZrq6r
         0WOsQqKYg+clrfx4h9Xn0fUSI0lshpP8JStgDm637rVu5CQBcML7rxTdGKrIZLc8MYhn
         hdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sIWNE/RAkZ7ajOJ8PPae7L4AdvTk4JaPCBjSXOIrGz8=;
        fh=qy7wLyAThUQIqEyenimld37twO3yfUVdjoy/l1p0sP4=;
        b=OApES5TMNrqLIsIvjITAjBvJvs76iH10vhQe7OQoVpJWdj8zMiL4PgJm9lEubq71iF
         88NeyOp7IFQdoZZfHowCwh5uCay3nfceM6u12TBV/HiaKj2RjjdgFCiQR427SvTvmMkE
         fcYV9SJUY4nTMRkT8iAwb2ych8RjyyCvLM/Hu1LRu2/7Fyk+CdRIuc5jb+UFe/9z1nTv
         jNElfIbOGaT7E2T0m1IFIPINilbtf5w128sUVNwo1T5N4GHGc36OnslhvGINkLG7MkDT
         kdiEHQjKsQx5a3MSEJLYPsAt+oT6vNv2T8AOjgZcmOT5g62KfM985Px30s2SKSF+YUdD
         7edA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775020081; x=1775624881; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIWNE/RAkZ7ajOJ8PPae7L4AdvTk4JaPCBjSXOIrGz8=;
        b=EMhV/i0lM0l/brgtgugjLTEaZ00+D/6xSAeJ2alIEa56goyAfS0JaSmdnv6VQSUO2n
         DyVgQTxVIGbqOMYUhEbTI3V03vZ4bZ7M+X9oEO0X5etfgg+TMAZw4CDEWSzT2PsQwDHJ
         Tz+uMEh6ciofmM392sShGR0TtYjbsG5Pyg0rCO1WbqxQC2CsOZal7v+q1NPJhF43Jh6r
         JEgi2so2otlYw43yXYllGqxQ/hL9YOvA4gTM25fJYUDAInDKmD3uM4Jka4QxdfTLqe4X
         xrGWMVWQPVVwIFjUUnJUh38Sc/TK6PIIJ62y7JOCmWJzgiCcxnJvdWFspzerHn/E8CbI
         Ko6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775020081; x=1775624881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sIWNE/RAkZ7ajOJ8PPae7L4AdvTk4JaPCBjSXOIrGz8=;
        b=O5m5t+zwHmzle5DZxbF8pnM7xqytYFzqH31RUwBUiR3y1rst31jYtXjQZBGddiO6YW
         TIWLmBb8vo6D7xmOsh7/ofTReD2790T3c5q/VXk0gt4uhqfZIV7yWzKHLZxO5Tzod0AK
         0IdTddp3xHXWJfFgt3WLghl81PqFALoV0QsrE4Gd097aTDjEcTFmJ3eCeK4z8TQ0d0Ey
         FS4BbUheJe/DCDXI78s3GxxrG3OoyU+Ep2TTWT4DQtZMb4mR2PlYDvGVjLTdmnUGvQd/
         T3oMOXa2so67nerx+FaHz0nlWXPG8ysZy5dlBRqHxvVWxqVu1y+pxejE7F0VMum/ETnc
         MayA==
X-Forwarded-Encrypted: i=1; AJvYcCXwgFyDEGOc0WUgIyjuL5Iw0PFz36Z3hJprfE89jAOL5O8q11HoKKkaHCZRUJAnaYej7C/7metlq0Wz3Ya3n2qZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxLMv96xY6Z35o5BpQP8hypBWlrayF3yZBzFxY5axhWURq8DP2q
	dMmElKwWJ0BHBW9F6mT/I1slZJIVGHCNWGImiImLNAP4fhK7vPzV4Ou1REdzaj2C7Cwox7UruIg
	StjkfWVSiOD5INgE/BjtT2vlURGVjuho=
X-Gm-Gg: ATEYQzw3yu/eCRCQwS0JijRJPVPlqUXZsXYnyfYUMWE0N5ImcIoQpyHXSs0hx+gTSvn
	oqcZrmgF8riKhl8F1DqRGcI0Rt4dkcsOlIoy4XLEs4Ci5Pu3mxiVW0rQDTYL+GBwZbyg3rucTFw
	J88QWZ0CW0U6ZLQ6MDByby/6JGb+4W4FtyXLTe8QydiiNdh9StRH3Ua/cr/b0vBf4fZV7qUKl9Q
	dLCILhq/VFYNKS7Zex3j2helH4BzRq9WqlqxQq/5NPHZ+r70UGem7c4CPSiRvkkgD9ShcsQyf8A
	AquCDmuf
X-Received: by 2002:a05:6820:339c:10b0:67f:c06c:a5fa with SMTP id
 006d021491bc7-67fc06cbd7bmr215078eaf.41.1775020081458; Tue, 31 Mar 2026
 22:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260327220040.53326-1-jassisinghbrar@gmail.com> <20260331100816.2222507-1-joonwonkang@google.com>
In-Reply-To: <20260331100816.2222507-1-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 1 Apr 2026 00:07:50 -0500
X-Gm-Features: AQROBzBgRboNX7aeGBEGAkPjchrPljvkbxkg14i7EEsCKIYbKjwbOLwSwn_gDD4
Message-ID: <CABb+yY1ZTjnsumoBPYeeuJSNMFoNvz7ktZR-zk287M-Y6cjR6A@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Fix NULL message support in mbox_send_message()
To: Joonwon Kang <joonwonkang@google.com>
Cc: andersson@kernel.org, dianders@chromium.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, shawn.guo@linaro.org, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_220803_067119_464C4B35 
X-CRM114-Status: GOOD (  24.93  )
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

On Tue, Mar 31, 2026 at 5:08=E2=80=AFAM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> > The active_req field serves double duty as both the "is a TX in
> > flight" flag (NULL means idle) and the storage for the in-flight
> > message pointer. When a client sends NULL via mbox_send_message(),
> > active_req is set to NULL, which the framework misinterprets as
> > "no active request". This breaks the TX state machine by:
> >
> >  - tx_tick() short-circuits on (!mssg), skipping the tx_done
> >    callback and the tx_complete completion
> >  - txdone_hrtimer() skips the channel entirely since active_req
> >    is NULL, so poll-based TX-done detection never fires.
> >
> > Fix this by introducing a MBOX_NO_MSG sentinel value that means
> > "no active request," freeing NULL to be valid message data. The
> > sentinel is defined in the subsystem-internal mailbox.h so that
> > controller drivers within drivers/mailbox/ can reference it, but
> > it is not exposed to clients outside the subsystem.
> >
> > Fifteen in-tree callers send NULL (doorbell-style IPCs on Qualcomm,
> > Tegra, TI, Xilinx, i.MX, SCMI, and PCC platforms). All were
> > audited for regression:
> >
> >  - Most already work around the bug via knows_txdone=3Dtrue with a
> >    manual mbox_client_txdone() call, making the framework's
> >    tracking irrelevant. These are unaffected.
> >
> >  - Poll-based callers (Xilinx zynqmp/r5) are strictly better off:
> >    the poll timer now correctly detects NULL-active channels
> >    instead of silently skipping them.
> >
> >  - irq-qcom-mpm.c was a pre-existing bug -- the only Qualcomm
> >    caller that omitted the knows_txdone + mbox_client_txdone()
> >    pattern. Fixed in a companion commit ("irqchip/qcom-mpm: Fix
> >    missing mailbox TX done acknowledgment").
> >
> >  - No caller sets both a tx_done callback and sends NULL, nor
> >    combines tx_block=3Dtrue with NULL sends, so the newly reachable
> >    callback/completion paths are never exercised.
> >
> > Also update tegra-hsp's flush callback, which directly inspects
> > active_req to wait for the channel to drain: the old "!=3D NULL"
> > check becomes "!=3D MBOX_NO_MSG", otherwise flush spins until
> > timeout since the sentinel is non-NULL.
> >
> > The only tradeoff is that 'MBOX_NO_MSG' can not be used as a message
> > by clients.
> >
> > Reported-by: Joonwon Kang <joonwonkang@google.com>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
>
> Do you have plans to backport this patch to other stable versions?
> If not, I can send the backport for you to the stable versions that are i=
n my needs.
>
Please feel free to do so. Thanks for the help.

