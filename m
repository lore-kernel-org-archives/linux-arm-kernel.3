Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBF5C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 15:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtQwQGv8F8oJXhyzp/mmJrRotQmL7KJWiE3zhpMTfrU=; b=RA9yuQRG7BqFt58GFLNk8S3a41
	LBa5Stt+1en1xnd5Zka8K8/7EdCESHBQq7CgekfnEnaeJlaLDHfhFQPbM91G3Epxn5OjCRRCG8oFN
	SMuLLUOkec/NBNRPwX2VsIHCCBm6aUadBvY7BYZcA8hDTXEo98PnRuXeriDTtbOeuRFz1AS9MWKO/
	JjQItp2nHDcLkfPma3kez0W59U4/vU2wGDzmMHKpaLMGumEY9xy7bguCOwjgZmp8UnM2fiC2MbisK
	VYifrvncJJnYxdeEUDR+BbRxuktPRhwv1VtteuiwWUrcZhoqvVp/YUt8TEvAch3fQcRYxva2OiChO
	NRPiS79g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5mbq-00000001o1p-1phZ;
	Sun, 13 Sep 2026 15:59:14 +0000
Received: from mail-ej2-x07.google.com ([2a00:1450:4864:34::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5mbi-00000001o0b-1qGi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 15:59:12 +0000
Received: by mail-ej2-x07.google.com with SMTP id a640c23a62f3a-c28e3998eb7so156391466b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 08:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789315144; cv=none;
        d=google.com; s=arc-20260327;
        b=NaU9oboeHgfitAg/CQOysy5fyks8Llxx4rKF7jRULHXC0ql7ku0Y/pyQq53cDdDDsG
         2LGX/uxo9C/tFLSRwFrSkBfPBWV73liLO8XTN696vG3qKjW88qh2168x4QN9It+/RA/9
         UWhRKY+JWIaVVOavTcYf3NujN4L65IjMILE+hWfrjbZpBJJRPmJBoiaACcFVslxDt9St
         RnljHFQ2ygK81Jt0ApnlW3ZTlZQ2hnjwL0K4l9E01Q6PXqYK8sBz0NPBzYF7muxFz96X
         vtVhakf2f886xfkTYFaCync/rkX1Ih+mv7O4TG+WorcYBo6JEEJWOx46lSQW9pFrBqyq
         gZvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QtQwQGv8F8oJXhyzp/mmJrRotQmL7KJWiE3zhpMTfrU=;
        fh=yKX+dBi6UeFWcjbtY7pUzz78AW9qGYUYaJvoEIVxHCk=;
        b=LDGYgZbPdQ2HAETUkfCt4r3DKV3w8ulIcQoTtrBDo5WIeFeM9IbRE3dygrv8sQegUR
         +l1/QalE2VZIfrR5CdInreEjaHcTpFzxqWTY1qIW5lDNGYZ4ygd3NxhqhVCXhlx+hijT
         NBxsufGz6KBibp0utPAcpv6nn7b9YitgS2BK7tlNtJOw8dEO2neyOhQ4MuTiBMSI1tJB
         xOPsn1FFnpWx49XSR0PcsLsaRHDkQjA9em6R5wnJcA5dEA3JAHF1EyYCwCTMaDw94qSE
         ZFXW6TPIqlVII4YLtH/5yzen39e/BBZD1aWC1JMSOBADT2uJrSIlR61T0Ff+jMA4jim8
         xlsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789315144; x=1789919944; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QtQwQGv8F8oJXhyzp/mmJrRotQmL7KJWiE3zhpMTfrU=;
        b=QLUFSjwwi+1Sk3gcZo6coHrqNWotkU/j60peNYLiQBnHeBajggQBanii5YD7o+4dnS
         JKfNSCYtMMRVBqxPCviGrVN63TtFWZkAjZCsyGVnd11xUWcbhZFVd+ULpW9Qi+Cp7WJU
         eszFfbO0nT8c17HOjpuUdPtZMzze4gGh8QyBY85jHEo4aSltHYrxjN6NjyZoDGwj+MyL
         TtaNRUvx91KhgmLRVx2W3bL2Zk3aL4u+eUO4zvbLgVYdK+76gGTZYS5W5TcG545TTDXJ
         mU/r1zz2L2ec02Trtyfw1TEty1XsZsG/BvJezRSMJOlEZ3ua+8TX3PHchiN7A8MyAZ9V
         hBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789315144; x=1789919944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtQwQGv8F8oJXhyzp/mmJrRotQmL7KJWiE3zhpMTfrU=;
        b=k3BEsAx89kU+3V9SZMxcyYAFUUjWdlul7aEQOHDHB+pQhmXzywCDCsSoMlh2ThHzI4
         lAvwrDT8r66hmlbeQZA5jRihZm4T6VjJCOEX2XBeoN6Oca6d1N3t1gl+bh0A96x5uzub
         FhMdZKZEUvzEwCcO8h8C4OBIm+1MqQHDucwacNZ8KhOfFz2qN5R/32iTrludrvphL8Qd
         NVF3EiFmsa9GvG338es87itbKZxUphadOrXw+cm0kaEtitE2QJtS5auN484BDzDnFq9c
         QyaHmk75xxWo+QxHY3DAzLFHNE6Y1nLMjd0aFZDzXaQOZqQ+VfPotyvQgeCxTpth6UxB
         IbIw==
X-Forwarded-Encrypted: i=1; AKwUvBzO01rYIr4pIG+HF7/rgXGL1l2kHAPL2nFemsgmbIpH0YfG5qrt3MiBaZn1H1vKZ0nMdlZ1bHK/QelM/csSmUsr@lists.infradead.org
X-Gm-Message-State: AFuF++mcvb7iWQNAlKNv5XgAy4y6NA7zxFuHtIsfnsCVfG4Rg+GbPMN6
	gJ8JC0YAK5jem+ZK19psZJLOBcqQVHj0s8UBK1/FipW+C0YFTLRrOIqRN7OB+NwR6U+LOKKtdJX
	aFI75ZmBb6sM0dxgz5LlkRKe0/kAJpyM=
X-Gm-Gg: AYBFou3PwsCPzdi5QEoP+zJw8W1ebtX9jergSKCoBTPBqLuxYht1gEJ1U/nE55pDdi2
	yHzAMtV3/7whmDGZRDD8qPCMcWNs6BIkVy555rulevx0bT6OHIgNwjacRzy6DZ22tQ+8dbbP4ID
	RNE96g5LX7BxxndpTJ9jP6DE1mGkTKnj7/xd/GopJfjyGG7VE4b18iw1kOzGYiUE4k44F55rExv
	wernYuiPzEtAA8oWNLMXt++uIA1SvTDvcYGCzurkqt+eqsWMKT8f59mfhBqbk8X00zFCrHhO+GI
	PmOFewM56VzykykSs4puSUi/BDR6BMjoc0dYW1dan9flgmA2adnmaj05yA==
X-Received: by 2002:a17:907:1992:b0:c19:6104:e5e4 with SMTP id
 a640c23a62f3a-c2985769204mr414384566b.20.1789315143958; Sun, 13 Sep 2026
 08:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260907153713.2572547-8-coiaprant@gmail.com> <20260912201327.127042-1-kuba@kernel.org>
In-Reply-To: <20260912201327.127042-1-kuba@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 13 Sep 2026 23:58:51 +0800
X-Gm-Features: AcwNN1XAulIb65_nNmPJqWeqm6n78LTScmm_BZJth6ooN4ELABvEb2CnyYjxeFw
Message-ID: <CALj3r0gRtJJMzZKW1DAyYJR3WQUX+JsBNH23VULhgLvopyHADQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 06/10] net: pcs: xpcs: add ANRESTART support
 for SGMII link recovery
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, vkoul@kernel.org, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, romain.gantois@bootlin.com, 
	hkallweit1@gmail.com, neil.armstrong@linaro.org, linux@armlinux.org.uk, 
	shawn.lin@rock-chips.com, david@ixit.cz, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_085910_674336_AD10D4EE 
X-CRM114-Status: GOOD (  42.03  )
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

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=
=A5=E5=91=A8=E6=97=A5 04:13=E5=86=99=E9=81=93=EF=BC=9A
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: pcs: xpcs: add ANRESTART support for SGMII link recovery
>
> The patch sets BMCR_ANRESTART together with BMCR_ANENABLE when configurin=
g
> C37 SGMII in-band negotiation, and clears the latched CL37 AN complete
> status before doing so.  It also restarts negotiation from
> xpcs_get_state_c37_sgmii() when AN completion is latched but the link is
> reported down.
>
> >     On some hardware using the DesignWare XPCS IP (e.g., RK3568 MAC sid=
e
> >     SGMII), the PCS does not automatically restart auto-negotiation whe=
n the
> >     link goes down and comes back up. Without an explicit ANRESTART, th=
e link
> >     stays down forever.
>
> [Severity: Low]
> The changelog describes a user visible failure ("the link stays down
> forever") in long standing shared code, but there is no Fixes: tag and no
> statement about which histories are affected.
>
> The only hardware named here, RK3568 XPCS, does not exist in the baseline
> tree: searching for xpcs_rk, rk3568-xpcs or pcs-xpcs-rk under drivers/net=
 at
> 879e280b8486 returns nothing, and the glue driver arrives later in this
> series ("net: pcs: xpcs: add Rockchip RK3568 platform glue driver").
>
> Could the changelog either name the pre-existing commit being fixed, or s=
ay
> explicitly that the affected platform is introduced later in the same
> series, so that stable tooling does not have to guess?

The affected platform (RK3568 XPCS) is introduced later in the same
series. I'll make that explicit in the changelog so stable tooling does
not have to guess.

> > diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> > index 0337e2bcc0125..50b9cdf94fdaa 100644
> > --- a/drivers/net/pcs/pcs-xpcs.c
> > +++ b/drivers/net/pcs/pcs-xpcs.c
> > @@ -816,9 +816,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xp=
cs *xpcs,
> >       if (ret < 0)
> >               return ret;
> >
> > +     /* Clear CL37 AN complete status */
> > +     ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0=
);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (neg_mode =3D=3D PHYLINK_PCS_NEG_INBAND_ENABLED)
> >               ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
> > -                              mdio_ctrl | BMCR_ANENABLE);
> > +                              mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTA=
RT);
>
> [Severity: Medium]
> Should the comment at the top of xpcs_config_aneg_c37_sgmii() be updated
> along with this change?  It still says the opposite of what the code now
> does:
>
> drivers/net/pcs/pcs-xpcs.c:xpcs_config_aneg_c37_sgmii() {
>         /* For AN for C37 SGMII mode, the settings are :-
>          ...
>          * 5) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] =3D 1b (Enable SGMII AN=
)
>          *
>          * Note that VR_MII_MMD_CTRL is MII_BMCR.
>          *
>          * Note: Since it is MAC side SGMII, there is no need to set
>          *       SR_MII_AN_ADV. ... There is also no need to
>          *       trigger AN restart for MAC-side SGMII.
>          */
>
> On the default path this same function selects MAC side SGMII:
>
>         } else {
>                 tx_conf =3D DW_VR_MII_TX_CONFIG_MAC_SIDE_SGMII;
>         }
>
> so the restart is now issued for exactly the case the comment says does n=
ot
> need it.  The new DW_VR_MII_AN_INTR_STS write is also a sixth step that t=
he
> enumerated sequence does not mention.
>
> If the databook statement no longer holds for these parts, could the
> comment be corrected, so that a later reader does not remove the ANRESTAR=
T
> bit as a mistake?

You're right. The comment still states that AN restart is not needed for
MAC side SGMII, which now contradicts the code. I'll update it to note
that on some hardware (e.g. RK3568) the PCS does not restart AN
automatically when the link comes back, so an explicit ANRESTART is
required.

> > @@ -1093,10 +1098,15 @@ static int xpcs_get_state_c37_sgmii(struct dw_x=
pcs *xpcs,
> >               return 0;
> >       }
> >
> > -     /* Clear AN complete status or interrupt */
> > -     if (state->an_complete)
> > +     if (state->an_complete) {
> > +             /* Clear AN complete status or interrupt */
> >               xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0=
);
> >
> > +             /* Initiate the next round of AN */
> > +             xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTAR=
T,
> > +                         BMCR_ANRESTART);
> > +     }
> > +
> >       return 0;
> >  }
>
> [Severity: Medium]
> Can this sequence get stuck if the xpcs_modify() fails?
>
> The latched status is cleared first, and DW_VR_MII_AN_STS_C37_ANCMPLT_INT=
R
> is the only thing that brings execution back into this branch:
>
>         state->an_complete =3D ret & DW_VR_MII_AN_STS_C37_ANCMPLT_INTR;
>
> So if the clear succeeds but the restart does not, every later poll reads
> ANCMPLT as 0, state->an_complete stays false, and the restart is never
> retried, leaving the port down with AN idle until something calls
> pcs_config again.
>
> mdiodev_c45_modify() does a read followed by a write, so there are two
> places it can return an error, for example a bus -ETIMEDOUT, or with the
> Rockchip glue added later in this series the pm_runtime_resume_and_get()
> error path in xpcs_rk_read_reg() / xpcs_rk_write_reg().
>
> Both return values are also discarded and the function still ends with
> return 0, so the diagnostic in the caller can never fire for them:
>
>         case DW_AN_C37_SGMII:
>                 ret =3D xpcs_get_state_c37_sgmii(xpcs, state);
>                 if (ret)
>                         dev_err(&xpcs->mdiodev->dev, "%s returned %pe\n",
>                                 "xpcs_get_state_c37_sgmii", ERR_PTR(ret))=
;
>
> Would it be better to assert BMCR_ANRESTART before clearing the latched
> status, and to propagate both return codes to xpcs_get_state()?

The current order (clear the latched status first, then restart AN) is
intentional. If the restart is issued first, the newly completed AN status
could be cleared by the subsequent write, losing the completion event.

I'll keep the original order and propagate the return value of
xpcs_modify() so the caller can observe errors on the restart path.

Best,
Coia

