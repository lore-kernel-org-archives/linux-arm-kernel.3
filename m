Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BD1F4613B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+UYSRLmdUz8m2ECEPbWoYNIW4mZEno4VBvItMsoE48=; b=axKCLhhjv92J1rv4kE5o91HWSH
	q2L+rcxPs4mRbSstOXrpeN0oq6DmHNOq93JnSqc7aXEkLH3/AW54xT+1mjUYxZvY9b8kO6iNvRQFZ
	UhWPKZyim8/RVBfGFEH9VAM2oCH9y8gxT/cW3vXdWSOnDUOvdgwZis49DetyV+/5NGEQNhC8fKfRN
	dx/nHNE00SymMYLDwTzGVyZaNukUzBcVhs8GzhAEtWZ9N0FDxXXMG73L4dqrO+sXcjgSy2DOmo1tS
	u5WhNCb4K2UgdnC2febDfzBce1EkMMdkFeQ/wg5kU4BCMIHlWk7xnSly2fiZhLVG0M8WfY0hXBuZg
	Vg0CXe4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hR7-0000000H3U3-2QCx;
	Mon, 23 Mar 2026 15:43:25 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hR5-0000000H3T9-0HAZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:43:25 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-35842aa350fso23379585a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774280601; x=1774885401; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+UYSRLmdUz8m2ECEPbWoYNIW4mZEno4VBvItMsoE48=;
        b=nuOmxzQoh1BeBKJhNHRCs1uCxc4PNfr2pTJZgPUy3zUOPy90jGgtHZPkzP2yOfrNor
         MAhNvbrI8M3o1bt/XfEEnJq8QRzMzU1dYWoqMxngmf4u8weu5uny8eOIR0k+cdW4pN6t
         qE9QSaNU0hHL93LOZN+QxPm8pBC+VZCLq7l9BQE11OGo60+DsZzH+IeJ84D05vS2KIft
         pvD9s3nM5XaAqw6L+LYf0tmlTd7joO/8RMau8ShQVCmOKwivbBoA0rN3aAAOc3Hes6i4
         MLLjPuBY5P3TpJjwRII88DOw3RtmYB7xQVnCOrigRimkVHX2090dQpWVNYN9t20AtZ7P
         Hvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774280601; x=1774885401;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V+UYSRLmdUz8m2ECEPbWoYNIW4mZEno4VBvItMsoE48=;
        b=A8CEX8TX9OlahqyC0msT3Bl+dLhEUJ9qxaCYdoJlZzdrA5NSvzIq09Cgj9o8/A4bEk
         44eQmlmNwudUAeRVkh4t/1WvT4Vde2NLkEtcgfKH5H0uRuPzP5h+I6tnT6u7dSFUomTL
         vVOOHgcV0swseHXKwC5DUIcisynTo2Cm0PMM6m8cwZ+4v3nu7d3BYAP8rZMueOg4/0k1
         K6bu7TyQVr7bB+vRGvFXeYiIheRArK5ZdY+qiatXaMV9xPCHLgk7MNDsbb6uffsyius6
         w3vX4FtOgSXnBInKABY5VmBZjUFGQytC4/UEzRyfLPv5WzPyWLtFXzCLLaAslGFwx5xe
         sD4A==
X-Forwarded-Encrypted: i=1; AJvYcCXXXExhhuELVsclyMqkqgSEE84JNSDfxPvJJYmoc57gN+NF2k4LnKtjFF+cS01noa+KuzFLDKskn6NtuB7C65iD@lists.infradead.org
X-Gm-Message-State: AOJu0YxrISzoaY78za7hM9+ToSG61R47SbhnA7rXOXZ5TdjIqTfSSCpW
	MrujJwnRhg3Zq2wTXJE0r35oCJZZML+N+6GWOlO4+BWpEqiu5x/OJaCNiT7xaQ51ldnOAPjk57H
	hsu28sKflRGHigSCdiEuXogp8YQ==
X-Received: from pgbbw35.prod.google.com ([2002:a05:6a02:4a3:b0:c73:fc44:8bb5])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7d9a:b0:398:90e5:a9b9 with SMTP id adf61e73a8af0-39bce9f7ac5mr12047793637.27.1774280601248;
 Mon, 23 Mar 2026 08:43:21 -0700 (PDT)
Date: Mon, 23 Mar 2026 15:43:16 +0000
In-Reply-To: <CABb+yY2aAiAFU5iCBmBdpkTM6_4VMh7BFPbwKxwt-gdN-qqLWw@mail.gmail.com>
Mime-Version: 1.0
References: <CABb+yY2aAiAFU5iCBmBdpkTM6_4VMh7BFPbwKxwt-gdN-qqLWw@mail.gmail.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260323154319.3523356-1-joonwonkang@google.com>
Subject: Re: [PATCH] mailbox: Fix NULL message support in mbox_send_message()
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: akpm@linux-foundation.org, andersson@kernel.org, dianders@chromium.org, 
	joonwonkang@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, shawn.guo@linaro.org, 
	stable@vger.kernel.org, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_084323_133164_23862AB8 
X-CRM114-Status: GOOD (  31.36  )
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

> On Mon, Mar 23, 2026 at 12:14=E2=80=AFAM Joonwon Kang <joonwonkang@google=
.com> wrote:
> >
> > > The active_req field serves double duty as both the "is a TX in
> > > flight" flag (NULL means idle) and the storage for the in-flight
> > > message pointer. When a client sends NULL via mbox_send_message(),
> > > active_req is set to NULL, which the framework misinterprets as
> > > "no active request". This breaks the TX state machine by:
> > >
> > >  - tx_tick() short-circuits on (!mssg), skipping the tx_done
> > >    callback and the tx_complete completion
> > >  - txdone_hrtimer() skips the channel entirely since active_req
> > >    is NULL, so poll-based TX-done detection never fires.
> > >
> > > Fix this by introducing a MBOX_NO_MSG sentinel value that means
> > > "no active request," freeing NULL to be valid message data. The
> > > sentinel is defined in the subsystem-internal mailbox.h so that
> > > controller drivers within drivers/mailbox/ can reference it, but
> > > it is not exposed to clients outside the subsystem.
> >
> > It sounds that it allows future controller drivers also to refer to the
> > new sentinel pointer value.
> >
> Sentinel value is not the problem, active_req should have been hidden
> from controllers. Which is actually respected by all controllers
> except the tegra-hsp.c
>=20
> > >
> > > Fifteen in-tree callers send NULL (doorbell-style IPCs on Qualcomm,
> > > Tegra, TI, Xilinx, i.MX, SCMI, and PCC platforms). All were
> > > audited for regression:
> > >
> > >  - Most already work around the bug via knows_txdone=3Dtrue with a
> > >    manual mbox_client_txdone() call, making the framework's
> > >    tracking irrelevant. These are unaffected.
> > >
> > >  - Poll-based callers (Xilinx zynqmp/r5) are strictly better off:
> > >    the poll timer now correctly detects NULL-active channels
> > >    instead of silently skipping them.
> > >
> > >  - irq-qcom-mpm.c was a pre-existing bug -- the only Qualcomm
> > >    caller that omitted the knows_txdone + mbox_client_txdone()
> > >    pattern. Fixed in a companion commit ("irqchip/qcom-mpm: Fix
> > >    missing mailbox TX done acknowledgment").
> > >
> > >  - No caller sets both a tx_done callback and sends NULL, nor
> > >    combines tx_block=3Dtrue with NULL sends, so the newly reachable
> > >    callback/completion paths are never exercised.
> > >
> > > Also update tegra-hsp's flush callback, which directly inspects
> > > active_req to wait for the channel to drain: the old "!=3D NULL"
> > > check becomes "!=3D MBOX_NO_MSG", otherwise flush spins until
> > > timeout since the sentinel is non-NULL.
> > >
> > > The only tradeoff is that 'MBOX_NO_MSG' can not be used as a message
> > > by clients.
> >
> > The other, but I guess more important, tradeoff is that future controll=
er
> > driver developers should now know that the pointer value of `->active->=
req`
> > could be -1(=3D=3D MBOX_NO_MSG) other than conventional pointer value(m=
emory
> > address, NULL, or error-encoded pointer value).
> >
> That should not be a concern. Controller drivers shouldn't peek into
> mailbox internals

Thanks for this clarification on your intention. This resolves the afore-
mentioned concerns.

> and if they do they will know the sentinel value
> being used.
> For example, of the ~40 drivers, only tegra-hsp.c chose to (not had
> to) use active_req and it relied on the sentinel value, which will now
> be MBOX_NO_MSG.
>=20
> Thanks
> Jassi

Thanks,
Joonwon Kang

