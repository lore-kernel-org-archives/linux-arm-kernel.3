Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FEFF46137
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvBbBNsJFcFh6LZdhMnznYYLRi36NWaZNx0WnHPdGPc=; b=LSnU4AKG/BijikIvNv29unK/5k
	/yf2RLxwG8i3x8NmbOqnLj/e62s7uncevq9w0+M5rm+uoWNpq0gJsnnQXm7lYmHEOZxoJtu3zUJ6N
	ZxL0ORCad+HCTjlsYbCqp5Sn1JWN93JG6WZTctAGGd8MFyE/Xu6/2ktAedFsWPZFq3yZysg6LjPnR
	WLIl/yGbl99Gar3ucB4ALgw8H/+yH4d4JUwhYH5kc48yEYb9+GF+TiwVvk9KVeRfhxcrALCtN7/H5
	2O3IlcUAJ9mExLcZIT78Le4wYg8RcnfonujMij2LXVP2WCuyPO0bZ2vfJQGUJJOhsMfmxORImfc6i
	YxISkl6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gib-0000000GxlY-3YFk;
	Mon, 23 Mar 2026 14:57:25 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4giZ-0000000Gxkj-0Zlu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 14:57:24 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b97ed4ad579so459114966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 07:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774277841; cv=none;
        d=google.com; s=arc-20240605;
        b=CrMAM4zS7vsFidrT1ULGhWjGDs1OAyo3qvJ2spZriGsmhDLFJAIL7D+Re99+SWLlm/
         cL952BYvgl0JB8qBnC9TcZQuoVT7l/4bG8OWvWoAM6g2JKiSl9DU7B70WDFkaeM9ikEk
         UZbv3bxVA1GHP06XLLWsDpfYTHB3uckeOz8AQG0nF11NaNDrgaZIY4EcrG2NuYCHS65+
         p6mXoYIG8KfWn8Ev+19EbFcHSkNn8sGLSip9uoHFGvWllUDEGMoCeU1d3WLc5MeRAKkq
         L01j8/r63uDcq3aoPSFoaoCxrti79QwsoMvG2wNOMhmRCAJiK6FcwkraEuAJiASKM/cG
         Kdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fvBbBNsJFcFh6LZdhMnznYYLRi36NWaZNx0WnHPdGPc=;
        fh=O7FAe+BK2fGiYnE7jQ1qBWxE0/QBDob7DbmT0aaGNDk=;
        b=IjgmOsdESlye3J6gsMgzkohza56DAOEDmr3Xw2rUuEx836aXhobKBtvkoWsPO1Zk7+
         TX1pDaFQikr+AktpcCnuX6f8VD8CY8sdvvUWEpzcmM6pIErwwBe9/HLDihCGFoXf4U0v
         mdN1rlB+lzPUaAh4+Rvygo/YHGAKuh0TeDxUI+TXnUtNyvWf2Xt7le74sgxakkHUp2fc
         ZcfN9eWG8PIUZZyxtxlU0rkFVbtRKCZ31bwZQ2tCoPQtQIgs3GV77fvUblAoaebEbM7v
         +Xok0LhAuJFcsOba0Kz+cW/V+ZZMpHUZ9FWUbII1EjbeRc90bWKCBWRID70SaFvF54Zx
         MHSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774277841; x=1774882641; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvBbBNsJFcFh6LZdhMnznYYLRi36NWaZNx0WnHPdGPc=;
        b=Gr2uF0W+vW1JYjjmfaYzy/K1pvA2ydJqFqangt6oKA7T104KMp0xAApJ8goJQfshRP
         9S6gXpu5pNTZctD0FR3vo7TVKO9lcw8jNJJVnBMlJAlWqF7WoBxXkzko/nM165ZAO8Jf
         FK+LECxf3i51S3izXsdTjVBe3Avle1ziJpbzAzDDIJADp/euT9VPiq96ER0YOX3HTG9A
         CNlfEbvOUUb78n8Vl/rpBD7PwKoZKpOZeouYQY10uWPn19xl5IqaSAJTwC7O1mBoEgEN
         JqA1upd6dBWFOAN6QahcH2Y4e9UM48xH8pMuJd8l/1YrnihyOGpsjF845hM5dNs/jqET
         2SIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277841; x=1774882641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvBbBNsJFcFh6LZdhMnznYYLRi36NWaZNx0WnHPdGPc=;
        b=sWlRpFohNaJsQAuWJt/GAxylyWtMRqZRAWxb5QEYWGp5JaralFAxefZEZw4kcEk+Xt
         dUEQKKjipKtZO0WVUQKsXveoywLSymBWjeST7BqrPHJsFW5bDSeL4g0Cwg+cgGZ3kP5j
         GNSSwoX5JcZ0xldAtWEgaGrskZhbzToHfEzBtb68xOKA6B1Du5CP+yI8Dx/nkpUZ0xd9
         F3pzY8WANSDTn5zKjnwY1YJuf91JnO/vvOQhW0bTiW+q88F9Bx+1E93KTcqEGKqW9GQT
         g2YKiudC4moTh9biN7VcS4PcKcFqK0rLvVSOE04ol25HHWst3r2slJKo4LKyiFZvgKyX
         Yz2A==
X-Forwarded-Encrypted: i=1; AJvYcCXcq1O/0AezmsYzumdPYEHq9Hz6Pp34Iq9wEjdOzrcTBELct7jVKtpXH4GwyO7rDuswGvXpnvPhdkou1qQT660x@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb4rqh44nnFYYqIusLg08C7QXykCpR1AV0IzJDtn0h72pJ4z+s
	awHsyaVIWa4qa+BVvHcddrAiDSzV2XBp2L9gPu/LZJeUCNpNG2Rwvfl/Z3YmzsobD1P7jloAV82
	J0I0AtY9vaEyZFYhaCrqkVFz1v79lPug=
X-Gm-Gg: ATEYQzywgFa504PyDNNoLVw4J93rhPwM1bnZQpGBWDvWDcpQRw0rhADVUjPlTPHyo0P
	TNaZgkgJawAN/SMCG300570cuAqQGNTv0RTiD1rJCtzJe9OtHsruYgYT/dckImghlx3QnmnrVjR
	Mz9+GO2AWmeU+GpdEoVQkbMbRaI2F+S0ARPpaG2Hm7Yu906GSQ6AmEiZL+PYjNh/KHHL0lJBuZS
	p4sI28N1x+Hy3bMj0s2n3ePQVYbU4l0qEfo3DTMxxVDloduzbxaOD/G6SMOd//ssQu9tPvrBDMI
	fvv+WpJP4Fw1kXPL+dA=
X-Received: by 2002:a17:907:394:b0:b97:7157:e1d8 with SMTP id
 a640c23a62f3a-b982f362ce4mr665161666b.31.1774277840831; Mon, 23 Mar 2026
 07:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260322171752.608486-1-jassisinghbrar@gmail.com> <20260323051359.3167665-1-joonwonkang@google.com>
In-Reply-To: <20260323051359.3167665-1-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 23 Mar 2026 09:57:07 -0500
X-Gm-Features: AQROBzBe_IwTDmRX3xv3pKLn1drI9MBmr7nvWb2-uieo7Ubr1p6hTCoz3FnKSmk
Message-ID: <CABb+yY2aAiAFU5iCBmBdpkTM6_4VMh7BFPbwKxwt-gdN-qqLWw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Fix NULL message support in mbox_send_message()
To: Joonwon Kang <joonwonkang@google.com>
Cc: andersson@kernel.org, dianders@chromium.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, shawn.guo@linaro.org, stable@vger.kernel.org, tglx@kernel.org, 
	akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_075723_206902_AD3F50A8 
X-CRM114-Status: GOOD (  26.85  )
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

On Mon, Mar 23, 2026 at 12:14=E2=80=AFAM Joonwon Kang <joonwonkang@google.c=
om> wrote:
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
>
> It sounds that it allows future controller drivers also to refer to the
> new sentinel pointer value.
>
Sentinel value is not the problem, active_req should have been hidden
from controllers. Which is actually respected by all controllers
except the tegra-hsp.c

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
>
> The other, but I guess more important, tradeoff is that future controller
> driver developers should now know that the pointer value of `->active->re=
q`
> could be -1(=3D=3D MBOX_NO_MSG) other than conventional pointer value(mem=
ory
> address, NULL, or error-encoded pointer value).
>
That should not be a concern. Controller drivers shouldn't peek into
mailbox internals and if they do they will know the sentinel value
being used.
For example, of the ~40 drivers, only tegra-hsp.c chose to (not had
to) use active_req and it relied on the sentinel value, which will now
be MBOX_NO_MSG.

Thanks
Jassi

