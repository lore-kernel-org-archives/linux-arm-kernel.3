Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D170C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 03:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6z7AN0CVMZUcd1/jA69i+08hLmV+o5WRzCn3iir7Mhc=; b=Tbaovt0xmuaNLnmombs8qGFd56
	HyYm5Oeo+SH+13KFgTVNm+X1yOTSNwbAACp7kAf8hBI2MUz2B/CGMqFboSqvvgW309Hoe1dpEKNrC
	HRv6Gshk2z5k1SFvgReg1N9wzmZBVVIEivCGqQVQa6C0EwGuO9mjNcthBLV7oghof0nRaeEbmRrFP
	mcooxa9RSQvIqoLLcnaC9O+KtFZKelkMdPHC5Dv0Rv11QwKIWS0EA0PupKMX0F7fxVbc6v5hcIpNC
	K3v13HZyNBmc+2V1Xohi2ov23zgtBM1OGEqNt7FeiwBxXxvIvM9nAI0I34xzQtTlBE5xubuI2NuYa
	+3tu4LHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAeQ-00000007Ci7-2aD7;
	Tue, 18 Aug 2026 03:38:10 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAeN-00000007ChZ-1ukL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 03:38:09 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-9063b380982so43353996d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 20:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787024286; cv=none;
        d=google.com; s=arc-20260327;
        b=R5S7pz0AV+UWgxTY6K63ypXfl9swvpD77CdsA0V3Nt5t54yB5r1FNkAqIExWxIuZeR
         pqZItl4NJ+bMoLn81enlrtIT2CvWPCFWNfrfR/+blkfnj/W50I+8zw/LrQvoZOPS4kYo
         a1cRX6e3uAeAAHdBqqMgmuKKdmxt+u3fZhmRJJvMcbST8NZZ6nxnXnu0BhFcgZ9ZnDUx
         0Nza5Xzpykt8CFj4Eof0MOd3UjRP8w0Pf8Q/ktkhuL71PM+7tlnKd8JbuAngES+8twNU
         xB8mIrFqDZ/DUaMLQEI3n0yD2zRnoBxFoGSODjuAhJgn9IsUCLyfD1CWJgplKnvEHqyB
         qtSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6z7AN0CVMZUcd1/jA69i+08hLmV+o5WRzCn3iir7Mhc=;
        fh=Sa0/3RmsCgCgz5G50x4i876BG7ZlssY7LQdESA6m6zE=;
        b=s2CWVW2PkaZ2NDqaO4MfLoXU7eBmV8gW9l3Mz3186BlRPJjTNH4466tvj0QrODth8o
         ZAPu1GMj25rhNRKuVZQ9Rr3i1syWaL2dmmhmZZq1xVTIN4Us09aemBslMjxTyE8pEgAG
         H8BUrPi/rrqDGc+47vJdSnES3CIoGPsc5cLpU/6ejWbhTlQlB4BcPLLlxnzJ7M8A/OD/
         45clGLoyc5T5CJNI5epn1+qyrQgqP4OkiL0afXcpiFhpdP10kkZZpFqPm1DEqDE9P9XG
         ms6a6nilMuK/YXxE77dPFE5yANNMg5fohrZRg4LfIGGq0maaK+GgMzZ3cHHTe/GjF6I7
         aQUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787024286; x=1787629086; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6z7AN0CVMZUcd1/jA69i+08hLmV+o5WRzCn3iir7Mhc=;
        b=NfMsS4RUHpQGdV3+CaVWr74ozQpdDklJQ74WRiRwAb1iIzvLRK6DNOh4yxZjuIlEw+
         oxGZ5+KfKfJ7EhFQ4O8X3eh+EzP8dtxp1nzYohzSWkCzYzt3angLRzj7xzuN+svUee9V
         lzDoF/9dOXdlIdKH+X6pGiGxFhSivsvvRjpyh9jNpvhx6zvOqFZf+HqJNyYw4afwv01Q
         wssSKrMRC3W6e1VjciCtQIP7NhyNbjMvXhzTmjoeo4IV7mvDBquMD9QV8Uf9FL5t7IUK
         02eDC+2uzLijR/QyAmd5YmNxQze0dIp2lQTEu7Y6PHc7M+ZmstKBUO4sXorrl/AThwd4
         Y+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787024286; x=1787629086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6z7AN0CVMZUcd1/jA69i+08hLmV+o5WRzCn3iir7Mhc=;
        b=FfIEzsL9b+OmtgK+/GFwMwTsDQ6COljP2J1XkDjd9C6XSoc4npn/WFoeKvOVRVFw3j
         SJAA+Rq+tqGHOCHJ/IiyGlJPTfve1P2iSszCEVaTmInZ4nCEfMvvD74wIlpJ7RMPNOVn
         FC8fyQvWtk//+cXulp+iYtV67yXJ8lV1t79h7fExsJIFdbsX+ZyIkO0Ij/aUfYm0qCLp
         UdxbA6QR/iD7upaPr1Las9qHf0Q/L+0sx1pkcS69NoaOKEt3cOdu13Er6Ytnw7sn1zrF
         2FJkAOhlYXJVfXiTCOeQcqDyWT8NkN6QasAhDkfRqvN9crfyiQ6Vv2htXs6rf7yyGPoK
         QMpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3EbAy8Jz51trYnYUY5YDmpCtOBO5j2dtfpe937yoT+scLBZDHuL79bUXcfeD8dy6qSMVNHOs8m0vppH1G0Hso@lists.infradead.org
X-Gm-Message-State: AOJu0YzaNFPpIa/aBM0JriaWZdh9aPRBynxp86I7wCngvbHgdgXWV+Y4
	pRzLasRog/s/DtTGEw5cQ0yRqkx0qhh+hcpyQrDVO/jhILXoaHf5ZsrTGssDQ+8Xn9hAROHY+IG
	0Z0zAH2r/Y//3ca2BpZxep0BlSS79YOw=
X-Gm-Gg: AR+sD10/d+1fq9/e33M0X9W2MCGxMGeOQ4PKpDbTxWnTXNDvBjso6h55HhXhvw81mo8
	GM7+/CF4iuIDFy/L8MdI5iyxVFHJ1tU5xgBr8hkBEtgs/URj5vluYsURXFEiVSIVxg7OG0PfqV9
	2P0TdVT9pu+2IEpkHcg1WCkdzswcrun+OiQPb8cQFORFZZEgf3pMqlQXCzAT5DN+rF+NdRC5jVv
	RJjsOpoB5MvaOyWtinpLzKkqGRrWgKPrs4MHvMUm5GghwhUAj5fF/13BXBcY0aE1u8zCZGYC6ku
	E2jB++Vxt7hizPAYbhUU+8UmW1q8waikiiI9h/5biHYB
X-Received: by 2002:ad4:5d42:0:b0:8f3:9586:c179 with SMTP id
 6a1803df08f44-90a91de382amr341852056d6.17.1787024285657; Mon, 17 Aug 2026
 20:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260810100221.9166-1-zxyan0222@gmail.com> <b3d90606-781a-4055-8529-e68e22a45ce9@bootlin.com>
 <20260812202027.976@gmail.com> <96146485-03f4-4c82-bb4b-9338b6591b2f@bootlin.com>
 <CAP7veT+fufSoBZBOQg+MQoGeedfzQBRtFrRPz8si2DJSJJ7NtQ@mail.gmail.com> <f18dfd79-c252-4e78-b37b-e5aaf1bffecc@altera.com>
In-Reply-To: <f18dfd79-c252-4e78-b37b-e5aaf1bffecc@altera.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Tue, 18 Aug 2026 11:37:54 +0800
X-Gm-Features: AcwNN1XGO3m5hEy0080m-Rkxdx5-kto7s9Z8yeSqOkdDrn2BCbYYWjpP3EgTyrg
Message-ID: <CAP7veTJdt=iONp5RauCeUz6q2g6RpdAcTRCrK6A35hw9xX+YaQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: stmmac: dwxgmac2: add XGMAC timestamp
 interrupt support
To: "Nazle Asmade, Muhammad Nazim Amirul" <muhammad.nazim.amirul.nazle.asmade@altera.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, 
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>, 
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, 
	"richardcochran@gmail.com" <richardcochran@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, 
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_203807_546167_D5EA61AF 
X-CRM114-Status: GOOD (  47.87  )
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

On Mon, Aug 17, 2026 at 11:11=E2=80=AFAM Nazle Asmade, Muhammad Nazim Amiru=
l
<muhammad.nazim.amirul.nazle.asmade@altera.com> wrote:
>
> On 13/8/2026 2:50 pm, zhu xin wrote:
> > [You don't often get email from zxyan0222@gmail.com. Learn why this is =
important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Hi Maxime,
> >
> > On Wed, Aug 12, 2026 at 10:08=E2=80=AFPM Maxime Chevallier
> > <maxime.chevallier@bootlin.com> wrote:
> >>
> >> +Nazim
> >>
> >> On 8/12/26 14:59, Zxyan Zhu wrote:
> >>> Hi Maxime,
> >>>
> >>> On 8/12/26 5:10 PM, Maxime Chevallier wrote:
> >>>> If there's an interrupt storm, then this should probably be a fix fo=
r -net
> >>>> with a Fixes tag.
> >>>
> >>> There is no interrupt storm. XGMAC_TSIE was never enabled before this
> >>> patch (XGMAC_INT_DEFAULT_EN was LPIIE | PMTIE only), and
> >>> dwxgmac2_host_irq_status() masks the status with the enable mask, so
> >>> XGMAC_INT_TSIS could never fire. The actual symptom is that
> >>> auxiliary-snapshot extts events were never reported -- a feature that
> >>> was never wired up, not a live interrupt storm.
> >>
> >> Ah indeed, quite the opposite then.
> >>
> >>>
> >>> So I'd like to keep this on net-next as a new feature rather than
> >>> retarget it to net.
> >>
> >> Yes makes sense indeed.
> >>
> >> Can you take a look at the sashiko-reported issues, it spots that this
> >> could interfere with the timestamping on agilex5 (another XGMAC platfo=
rm) :
> >>
> >> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260810100221.916=
6-1-zxyan0222%40gmail.com
> >>
> >> Maybe there's some stuff that could be made more generic by moving the=
m out
> >> of the socfpga code and putting it in the more generic timestamping co=
de ?
> >
> > Thanks for the pointer. I looked at the sashiko v2 review and the
> > Agilex5 concern is real. On Agilex5, smtg_crosststamp() polls
> > XGMAC_INT_STATUS for TSIS in process context as its only completion
> > signal. The patch enables XGMAC_TSIE in XGMAC_INT_DEFAULT_EN, so the
> > new hardirq handler now runs on every timestamp event and clears TSIS
> > by reading XGMAC_TIMESTAMP_STATUS -- that read can win against the
> > poll loop, and getcrosststamp() then times out with "Wait for time
> > sync operation timeout".
> >
> > On moving socfpga bits to the generic timestamping code: the
> > crosststamp path splits into a generic half (pick ATSENx, set ATSFC,
> > poll TSIS, read ATSNS, pop ATNR/ATSR) and an Agilex5-specific half
> > (GPO0 rising-edge trigger + SMTG MDIO system counter). Only the
> > generic half is worth lifting, and the platform-specific trigger
> > belongs in plat->crosststamp. That's a useful cleanup but may be
> > orthogonal to this race.
> >
> > For the race itself I'd like your view on the fix below. The simplest
> > option I found is to mask XGMAC_TSIE around the cross-timestamp so the
> > hardirq handler cannot steal TSIS while smtg_crosststamp() owns the
> > snapshot FIFO:
> >
> >    static int smtg_crosststamp(ktime_t *device,
> >                                struct system_counterval_t *system,
> >                                void *ctx)
> >    {
> >        ...
> >        if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
> >            return -EBUSY;
> >
> >        /* mask TSIE so the hardirq dwxgmac2_timestamp_interrupt() can't
> >         * clear TSIS via reading XGMAC_TIMESTAMP_STATUS while we poll i=
t
> >         */
> >        stmmac_mac_irq_modify(priv, XGMAC_TSIE, 0);
> >
> >        ... arm ATSENx, ATSFC, toggle GPO0 ...
> >
> >        ret =3D readl_poll_timeout(ioaddr + XGMAC_INT_STATUS, v,
> >                                 (v & XGMAC_INT_TSIS), 100, 10000);
> >        if (ret) {
> >            ...
> >            stmmac_mac_irq_modify(priv, 0, XGMAC_TSIE);
> >            return ret;
> >        }
> >
> >        ... read ATSNS, pop FIFO, get_smtgtime() ...
> >
> >        stmmac_mac_irq_modify(priv, 0, XGMAC_TSIE);
> >        return 0;
> >    }
> >
> >    /* every return path, including the -EINVAL default of the
> >     * int_snapshot_num switch, restores XGMAC_TSIE */
> >
> >    static void dwxgmac2_timestamp_interrupt(struct stmmac_priv *priv)
> >    {
> >        u32 ts_status =3D readl(priv->ioaddr + XGMAC_TIMESTAMP_STATUS);
> >
> >        if (!(priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN))
> >            return;
> >        ...
> >    }
> >
> > This keeps the extts handler unchanged and just makes "who owns TSIS"
> > explicit on the crosststamp side.
> >
> > An alternative I considered:
> >    - making socfpga set STMMAC_FLAG_INT_SNAPSHOT_EN and wait on
> >      tstamp_busy_wait like intel: cleaner long-term, but a bigger
> >      rewrite than fixing the regression warrants here.
> >
> > One worry: I'd like to confirm masking TSIE for the ~poll window is
> > acceptable on this platform -- extts snapshots taken during the window
> > still latch TSIS (just don't raise an interrupt) and are reported after
> > TSIE is restored, so they are delayed rather than lost. Does that match
> > your expectations?
> >
> >>
> >> I don't have any xgmac boards to verify sashiko's claim though.
> >>
> >
> > I don't have Agilex5 hardware to validate the crosststamp path either,
> > so I'm relying on the code analysis above. If this approach looks
> > reasonable I'll send it as a v3 with this as a second patch.
> Hi Zxyan,
>
> Let me know what kind of test needed, I can help to verify on my end
>
> BR,
> Nazim> Thanks,
> > Zxyan
>

Hi Nazim,

That would be great, thanks. The concern is that patch enables
XGMAC_TSIE in XGMAC_INT_DEFAULT_EN, so the new hardirq timestamp handler
runs on every XGMAC timestamp event and clears TSIS by reading
XGMAC_TIMESTAMP_STATUS.  On Agilex5, smtg_crosststamp() polls
XGMAC_INT_STATUS for TSIS in process context as its only completion
signal, so the hardirq read can win the race and getcrosststamp() times
out with "Wait for time sync operation timeout".

If you are able to verify on your Agilex5 board using the v2 patch
(which enables XGMAC_TSIE but has no socfpga fix yet), I would like to
confirm the following two points, to check whether the Agilex5
cross-timestamp regression that sashiko flagged actually reproduces:

1. Does smtg_crosststamp() time out -- that is, does the error "Wait
   for time sync operation timeout" appear in dmesg?
2. Is the cross-timestamp obtained correctly?

Anything else you'd normally run for the crosststamp path is welcome --
you know the board far better than I do.

If the issue does exist, I will send v3 with the fix.  The specific
approach still needs input from both Maxime and you; the options I see
are:

  1. Isolate the interrupt using stmmac_mac_irq_modify within
     smtg_crosststamp -- the minimal fix.
  2. Making socfpga set STMMAC_FLAG_INT_SNAPSHOT_EN and wait on
     tstamp_busy_wait like intel -- cleaner long-term, but a bigger
     rewrite.

Best regards,
Zxyan Zhu

