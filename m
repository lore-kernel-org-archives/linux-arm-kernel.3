Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC5ECA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L70Ii9x5C+z302d/Psn2CqblJNvQ2CMmeLwkxN/XibM=; b=PO/hAHJVysfPXixag5amYgsfEM
	KmTHimyjm/WJZVZtaRfuihQlAUqwFjUQmV4VUNyU62dmcnvPKUa2i4DsTdI6eA63LeEBZlLxIyR6+
	Wbwo4Y9G5gGf2+F0QXNr9g8NzGJU0euj8wVk6fnYGPc+3wmUMVoEuosFnCVMXhqr01m/6RajW+3Xr
	427FFLQhNwW6TnA6KG8yViWDAQzA+P+a0IHcrYF8qZWD2u6MUF6DZu50Pgx4PZiVXk9YWnacq32uL
	8B9VE6n4c2RpduTbGY9YA8U+2lk5DbYXItBEjuLqOoKwAiWDtYrVsLX7YPrjiAGwfl7VUjOAB4pgk
	Rkl24MYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLe4-0000000BNnH-0dM3;
	Mon, 12 Oct 2026 19:25:12 +0000
Received: from mail-ej2-x0b.google.com ([2a00:1450:4864:34::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLe1-0000000BNmB-0SxU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 19:25:10 +0000
Received: by mail-ej2-x0b.google.com with SMTP id a640c23a62f3a-c3184a307cbso105042366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 12:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791833107; cv=none;
        d=google.com; s=arc-20260327;
        b=VPN0A8+8tHPP3U3igvOWIaOD0qwPO0Gk7RDvZl5zJtkfw/VyEG36ltTi2gcG1Z38iG
         x9MD+6A5YFo7TkvGxE+R8c0g6MHZRVL98itWia00A8dn4Zi/mtSj40+x+sGRvF+MdlYV
         bOKmaIyyz1++q7T6UZt7xXsPsgR2xwQ+vO3rKtKC5GGl3T8w+bvUw3RtkbbYbxtDQIvn
         6UB/PPi7nxTypIcSy8tDO1+3Ni531TmtDccBhJreKABK4ZXYoiAmxz+o8B+dsW3OyS2e
         8St5aJViySUenIlsRJJOliqGJlMNplV2ZE/HiXJW/IixLwn9Mk/n+qU9kqP0Jud5df/M
         hejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L70Ii9x5C+z302d/Psn2CqblJNvQ2CMmeLwkxN/XibM=;
        fh=VLhj47uD5pP11NIElhg4PbykhTeeVXSms6hYWXwDv5s=;
        b=iGcgiZAC5JFNnYQj2633kxzsfwgwn++MVYS6AJChIrjZUZ8rPLBRJ2UYM25pd+oLBU
         0XdLwGMo+Mj1EkUj9bjTLYhMnxETjIomdRQhnN2UoIbW8uXkfgIaes6GB3HMxBdpSoV/
         fuuCxHzRf0HzUXHUYJ1C1QnQLF0XHaDDi0k7G4jusDA3994ihnOZypzcan6LPEg6Wzwe
         SbJqSPpomq8qZsteUML3I4QfTEH0S6gmIPm/hvJ43IcgIA2UhJCCJ6zxfGW+pQ+nVRV/
         BhbJhB5fGYmGz+yhs5i8lh4Y1Zt9FxDopbLz35DshJ77d2XpqjARdr88CPG4P5W9ThU2
         LqTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791833107; x=1792437907; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L70Ii9x5C+z302d/Psn2CqblJNvQ2CMmeLwkxN/XibM=;
        b=hwwYiCiGjJLPspNWcWAgyY1ipMQcSlLPBRrdwXvcu6jkZX0mbiTGc8Ag0SqU95ADvb
         2RNRcM+oR5+Z2hEQXA/805vNF7R0rO3FLGXKOWn62+d587BAOFUTGrcc53yvLGr3pCCo
         4Q8LqloJh77ILbdOv8bg1f1Ubw1vNKdyEf0JqceU+9OqVLX18scRiVov9ZQzZZMU7Qf+
         OW5O9uubyygYSdERFoPiGfkaesohpPw7yEHSTeEwMv4O8lupT3IAVRo5OIvmq20qQWZL
         0bCXWlHF+MZdY23tvokSKKTIS+sJN62m7VcDHXhk4H63vC6bxGMFTOiQZxQ/oAjlT+cF
         QFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791833107; x=1792437907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L70Ii9x5C+z302d/Psn2CqblJNvQ2CMmeLwkxN/XibM=;
        b=PEJ0Y/VHGTDnuz6zBZGU2R3UXANrLM9phIjE5ypGBrJS8miev1Db0c7OjZV0YbF/6D
         tlsHj7LpqJH6Bwa4bKzfWgEtzpc7kmajFFgbgKXF4YVdeuvzFTmGwXBemfZZxyC6Jsuw
         nzjNul/P/kS4E187NzrvL7mNzo4kFWCkZu3xFwfqMCLgp+1hKgZD6lmcOmw8L2tMugeh
         za262MW6ykF9tcJ8ucBQUwlQG0uIxH4Wa7dMub2FD81KkvLqSfavsOgfWwBh8+f8Og6l
         DnlLELmLHoJKAmtn392bRfcBMG3uW86Z1mnNZAkq9MNC0SlKBz26A6/oAMmsUJnA5IX0
         woLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLOq56ksVew1Us0QQ724J21hkIqc+tt5vsVp+4dKPs2QOflp7H0R3xm2ZL0Po7+T4Tgh08mOt2E3TpFLcx1bEX@lists.infradead.org
X-Gm-Message-State: AFq9FYKedGezlKMhSUA9DsdB9g0IL1XdX8hJLx0R24GdwvR4v34lvttr
	U/MDdDbgJds4WvgYps7szfEQ3TiP22j1bnrjo2gmyOW50/LM4p1jcw1eOcAO6VOMk8JIgUF/N5O
	IIgc4K5K6M9sDi1uWjt/Eh2jxf8TW+Vg=
X-Gm-Gg: AYBFou2KzPfgTt061pcC7FI2tKE4i+uaPWqSC4DdPa8cGKjAjJnv0Fr6yKwucBZ7Pz1
	T8vWXMl1cA0TzflqxKZVYHc3koYyC97kziFR8oH8a15LfEGbwmOeT2K8qRwyXydZvFd/pus6f02
	c/cf45kwg5kJRfJr/3KEvnkntztavpMX9vOTxFZqOlBUSM0pWrS7JnzJyMXvm+xAWsUtk53uIY8
	QpgmfU94xpvdecmMtmq6Bn6D/XoCE0mL8p9osdPyO5oTBQUgSkWZxZyluzH1XQszKGA/b+aE5rP
	5O3FESqxi7UsYFruEh3MyUr1C19OcweLXGErmWknq7yFrsCr8RYTmjA8wA==
X-Received: by 2002:a17:906:7948:b0:c29:60b7:3f14 with SMTP id
 a640c23a62f3a-c31aa02b449mr966426866b.46.1791833106527; Mon, 12 Oct 2026
 12:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20261008175225.3375274-2-coiaprant@gmail.com> <179183168522.434549.14619345397319265452@kernel.org>
In-Reply-To: <179183168522.434549.14619345397319265452@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 13 Oct 2026 03:24:59 +0800
X-Gm-Features: AclHuK_IK-J3xdjBLHul-e3CTuwWO6mo07_5PjrwMDoCpvY_M9ekvq5ssPY4yMg
Message-ID: <CALj3r0jTq+wztO=-TMDkNTM7OFkB4UHMpugTnQ+YPiuWYD9MFA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/6] net: pcs: xpcs: add ANRESTART support
 for SGMII link recovery
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org, netdev@vger.kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	david.wu@rock-chips.com, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_122509_194310_9F4F5AC0 
X-CRM114-Status: GOOD (  40.47  )
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

Thanks. Both points were raised in earlier versions and are intentional
for this hardware.

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8813=E6=97=
=A5=E5=91=A8=E4=BA=8C 03:01=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] xpcs_get_state_c37_sgmii() now does a non-atomic read -> act
>   sequence.
> - [Low] Concern: in xpcs_get_state_c37_sgmii() the ANCMPLT latch is
>   cleared (pcs-xpcs.c:1112) before BMCR_ANRESTART is issued (pcs-=E2=80=
=A6
>
> --
>
> net: pcs: xpcs: add ANRESTART support for SGMII link recovery
>
> This patch sets BMCR_ANRESTART alongside BMCR_ANENABLE when configuring
> C37 SGMII AN. It also clears DW_VR_MII_AN_INTR_STS before AN starts. In
> xpcs_get_state_c37_sgmii(), when AN completion is seen with the link down=
,
> it clears the ANCMPLT latch and restarts AN, so that parts such as RK3568
> can recover the link.
>
> > diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> > index b415b93d77c15..6466e0ff2a98b 100644
> > --- a/drivers/net/pcs/pcs-xpcs.c
> > +++ b/drivers/net/pcs/pcs-xpcs.c
>
> [ ... ]
>
> > @@ -1093,9 +1107,18 @@ static int xpcs_get_state_c37_sgmii(struct dw_xp=
cs *xpcs,
> >               return 0;
> >       }
> >
> > -     /* Clear AN complete status or interrupt */
> > -     if (state->an_complete)
> > -             xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0=
);
> > +     if (state->an_complete) {
> > +             /* Clear AN complete status or interrupt */
> > +             ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INT=
R_STS, 0);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             /* Initiate the next round of AN */
> > +             ret =3D xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_=
ANRESTART,
> > +                               BMCR_ANRESTART);
> > +             if (ret < 0)
> > +                     return ret;
>
> [Severity: Medium]
> Can two callers of .pcs_get_state() race here and restart a negotiation
> that has just finished with the link up?
>
> The read of DW_VR_MII_AN_INTR_STS at the top of the function and the
> clear and restart here are not atomic. phylink calls .pcs_get_state()
> from contexts that do not share a lock:
>
>   phylink_resolve()                   holds pl->state_mutex, not RTNL
>   phylink_ethtool_ksettings_get()     holds RTNL only (MLO_AN_INBAND,
>                                       no phydev)
>   phylink_mii_ioctl()->phylink_mii_read()   holds RTNL only
>
> struct dw_xpcs has no lock of its own, and the MDIO bus lock only covers
> each single access.
>
> A possible interleaving:
>
> CPU1 (ethtool get)                  CPU0 (phylink_resolve)
> xpcs_read(INTR_STS)
>   link=3D0, ANCMPLT=3D1
>                                     xpcs_read(INTR_STS)
>                                       link=3D0, ANCMPLT=3D1
>                                     xpcs_write(INTR_STS, 0)
>                                     xpcs_modify(BMCR, ANRESTART)
>                                     ... AN completes, link up ...
> xpcs_write(INTR_STS, 0)
> xpcs_modify(BMCR, ANRESTART)
>
> CPU1 acts on its stale sample. It clears the newly latched ANCMPLT and
> restarts AN on a link that has just come up.
>
> Before this patch, a concurrent caller could only clear the latch. The
> extra restart is new. Unprivileged users can issue ethtool get link
> settings.
>
> The commit message's reason for clearing the latch before the restart
> assumes that get_state calls are serialized. Does phylink actually
> guarantee that for these callers?

The C37 SGMII path needs to restart AN from xpcs_get_state() because
phylink does not call .pcs_an_restart for SGMII. On RK3568 the PCS does
not restart AN by itself, so a link that goes down would stay down
without this. The same pattern is already used by xpcs_get_state_c73(),
which calls xpcs_soft_reset() and xpcs_do_config() from the same
callback.

On the non-atomic read-act sequence: the concurrent caller can only
come from ethtool or mii_read, which do not hold pl->state_mutex. So
yes, the sequence is not strictly serialized against the normal poll
path.

The consequence is a possible extra AN restart on a link that just
came up. On this hardware an AN restart is idempotent and safe: if the
link is already up, the PCS re-negotiates and comes back up. There is
no state corruption, no register left in a bad state, and no way for
the concurrent caller to observe a torn value, since each MDIO access
is individually locked.

Before this patch a concurrent caller could clear the latch; the extra
restart is new, but its only effect is to shorten the window in which
a stale sample can be acted upon.

> [Severity: Low]
> What retries the restart if the xpcs_write() of DW_VR_MII_AN_INTR_STS
> succeeds and then this xpcs_modify() of MII_BMCR fails?
>
> The latched ANCMPLT that triggers this path has already been cleared. No
> restart is pending, and xpcs_get_state() only logs the error:
>
> phylink_resolve()
>   xpcs_get_state()
>     xpcs_get_state_c37_sgmii()
>       xpcs_write(DW_VR_MII_AN_INTR_STS, 0)    succeeds
>       xpcs_modify(MII_BMCR, BMCR_ANRESTART)   fails
>     dev_err(..., "xpcs_get_state_c37_sgmii", ...)
>
> On parts that do not restart AN by themselves, the link would then stay
> down until the interface is reconfigured.
>
> The commit message covers this case:
>
>   "If an MDIO access fails at this point, it indicates an unrecoverable
>   hardware condition until reset."
>
> On RK3568, the MMIO-based MDIO back end added later in the series seems
> to fail only through pm_runtime_resume_and_get(). That failure is not
> transient. On other XPCS platforms the databook says AN restarts on its
> own. So the documented behaviour may be fine as it is.
>
> > +     }
> >
> >       return 0;
> >  }

The latch ordering is deliberate: clearing it after the restart would
discard a freshly latched ANCMPLT from the new negotiation. An MDIO
failure at that point means the transport is gone, so there is nothing
to retry.

