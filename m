Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C8EF3ED66
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 20:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5q5RroT50XruNLk8tby8qXtaVeWRUZkkC5f73ORjtiQ=; b=KiCbxtlnO9MSfZ1lPuZpjWFjuT
	HDebplUYWbUyJqb0ZSnG0ZHdpX06UnAbfqGjaOdmsBwxYDrtqjq93oYK/DdkTSS4IO8PnkT5MBVow
	pcA8OxJe41vv6qo4Cz60VBwGchJh9eQc5AxbGSaPlay+oqUzL7yeQkg0F3GXDrJpQH8OofULw0vmb
	dy1vVu05iRgglzEZaITePhu1SjMi/rRgli7NnOmIDBdLOO16mZ2/IVKgbHvLjSIwWGMJfw6JMVtpO
	Quz02qG4z0Ys7/Dl5By56f8ZXlsEqTPS1KQtzLxiKMPuhjLlYTR2iCHYg0QOXUX71p8HeVEdVE087
	h35wHuiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBf8e-0000000DmbD-3oFq;
	Sat, 11 Apr 2026 20:41:08 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBf8c-0000000Dmao-0moc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 20:41:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d7213b6ebso71223f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 13:41:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775940063; cv=none;
        d=google.com; s=arc-20240605;
        b=leTxnQc6kgtZiw+j3Hx+BDUNAkRstgLBIxTbgIME3w20IdqdlaH1enVKhuZ6Re8UUR
         ULduQ79oR0GlPK0j+RO6AElUm7qZcvcNS1oz0ePJyc5cVnLk89dsfjsBCVsEm0r49Bl2
         bxrcmQPxGPn/6pGT51kOA54ZpsUKyM239iDMTNAC9MmHklSCEq3tdO3THjj1kKWGOAVm
         Wt/fA2t2aJUDKPo2tgFmOf5FtkMqwMN53jrJOtGHDOgAHGK9YYr3rlWncP4E4DTeRZhl
         fMrfyf3fQj5eCvlvDTBxrqFaXuT+E1e8WuvIi+7h659ChyQWiyO+oq1jk5q2SvDJyju+
         7Egw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5q5RroT50XruNLk8tby8qXtaVeWRUZkkC5f73ORjtiQ=;
        fh=YKC5MJDy1XK3bOhk3/n/OU3AbWjjlXpK9Wem9qcEgL8=;
        b=AJpsv4oEJ/DdJEG83HygfCFtkaPWnOhmbNfynqJNDQJnEsqmNuQG/kfqPCSTQyH1GR
         VMwntw+WozCVyCr3LpEwdq9zVSlhiDqZuZe/AkuTAUAKYQ5CZFj/WZykhcYpLEd9ajlK
         5zCE0FI9Ii4qT/Oi0v2dRyXq+4s6C0MvOdCbNTkqn2l6PQfYqmWayTQCg/3EnhQDjvJ9
         CyTO/O2sk/glNhPFipHzghCwDTdgB/AWV+s4y1jYm6myqGKZT5FV9MRXrN9ad0bvvieT
         HKLiywtCloKotzh65bfTHQueyosmXHkId6vZZGIJvtCci6GOYn84mPD9NdYw/IVnzIwg
         3X+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775940063; x=1776544863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q5RroT50XruNLk8tby8qXtaVeWRUZkkC5f73ORjtiQ=;
        b=F0B/u36WJDKPLkCAw0TApQ7gVgV7UcHQQtB+kLVced4aUigM2P+KJcoipjxgIkWq3E
         HRKE8QfqwRmBXzuUj06UaNmJ8hKFIqG8h/lEPji6Ex1ZR4T0kwJ1fRwUQWeLuKdz+Syv
         wL7ohfOKHoTWQHQrKuWiidmWT//gXCDMa49yUR7BEOhwdWBsUfSYjRC/nMIBbp0E8hgh
         eY+Hjyt1CA6jajXTaKPQeTMNfynOYPB18ox2jnI1xgmk0quBFKPoW2bG4/1hkF47C8DE
         mdcDH6Y1n9U4QKKB87WDkc/ImFcnBqg65/Mdeb06OgXIX1zmyzWVnIAl5dizd2z3aICu
         XHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775940063; x=1776544863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5q5RroT50XruNLk8tby8qXtaVeWRUZkkC5f73ORjtiQ=;
        b=SM4TPBez0kXKtO1jPfl/aByvtpi23gj71KS9olQsjmb0NshhROun/OvVWAzrPyJaA/
         GQJ7DoFjoQLt6pfBUepL0EyS+oDG7E1RyrrMpqGDtARVrFvkZsuseKe2BTiiXGRTxZEl
         9+0me8nfk94yQvwsRZf4vNbFupqmChPei4e9VRbhPvGrpVsf1t5+Lj4VZ6MX8PI9Os51
         N+sjAwqF4HV81XuJsmiaOUO9mUcbfhD4cvUZ0uwYQO0viDHWK1sAfc8BxYdXq9zFmFqO
         zHnu+6V3eElgCCMivr5LwHVKMuQDBhup6AyUwDlpbQKWARK9d43ATXKvJIYT5EH/CJZ6
         HBog==
X-Forwarded-Encrypted: i=1; AFNElJ9aonu7rTux3tTgdu5r7Oegv+2NKWY7MmRpVFAixvWXwanAN0IUrMbhwJzsLyMpsZGS8xPC/dwPTyH+1LpOfKPO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9KY4/qRu8Q0GVvNND+Ai4zFh5TM1TDeDf2UlK/NqaA5nVTPa9
	medUckHNnwIx1GE6WYGB0ONwN6HDTxDDSMBlUtBfhAXdNoj6VboMYi9RQVYAokhmrtv7Xgy5ah3
	3R19fCqyCKHpRu/svAI0Mb8elB9c0AZo=
X-Gm-Gg: AeBDietnLoAGNmEDraH20LYwF9PuMVs1g2z/frb0knT/5hA+F1BMZyy4OYSN5Qb5dwA
	rNfiRJImNjGBFOUt7wBwFrnhmfFHkF19KeoDIrm3oNL+6LEuE7rgD36G/6xaubEh3rNrPgN6k58
	fxmnhysKgIRKvO5j07WweX1dKNrN6rCPAIAQxpS3SRq968XcvAiHz7dqkAPUSnqGsHO/0m3+xHe
	0bvXVfz16ddUuT+n42Vq0y6RQU6oUv1y+VKQbNYjR+s0opd3umgRUzyOkDcLZCuxmQWQI7SSO2U
	vkeBvwOSGEf04XOlOwvjdXm/4lPird+nR5cvyA==
X-Received: by 2002:a05:6000:18a9:b0:43c:f1da:488b with SMTP id
 ffacd0b85a97d-43d642b9ce4mr12087419f8f.30.1775940063242; Sat, 11 Apr 2026
 13:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260401041929.12392-1-CFSworks@gmail.com> <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
 <CAH5Ym4g3pbU_bWzMwJMdhEFv4K2sp3pty3g04=0=9Z80_LzW1w@mail.gmail.com> <adjrtRSepmac2hpN@shell.armlinux.org.uk>
In-Reply-To: <adjrtRSepmac2hpN@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Sat, 11 Apr 2026 13:40:51 -0700
X-Gm-Features: AQROBzCWE5R1ZaXZe3VP4juckZTMVk39IF4qj9BF-f9NpOBdP5trAKumJEG9Iww
Message-ID: <CAH5Ym4if3Wh8uBF85F8VrPWxXFHrs6eE=vrL=-bdHN0SnLat9A@mail.gmail.com>
Subject: Re: [PATCH net v4 0/2] stmmac crash/stall fixes when under memory pressure
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Baruch Siach <baruch@tkos.co.il>, Serge Semin <fancer.lancer@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_134106_263795_6830B55E 
X-CRM114-Status: GOOD (  34.69  )
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

On Fri, Apr 10, 2026 at 5:23=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Apr 02, 2026 at 10:39:32AM -0700, Sam Edwards wrote:
> > On Thu, Apr 2, 2026 at 10:16=E2=80=AFAM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > I've tested this on my Jetson Xavier platform. One of the issues I've
> > > had is that running iperf3 results in the receive side stalling becau=
se
> > > it runs out of descriptors. However, despite the receive ring
> > > eventually being re-filled and the hardware appropriately prodded, it
> > > steadfastly refuses to restart, despite the descriptors having been
> > > updated.
> >
> > Hi Russell,
> >
> > Just to make sure I understand correctly: before my patches, you've
> > been observing this problem on Xavier for a while (no interrupts, ring
> > goes dry); with my patches, the ring is refilled, but the dwmac5
> > doesn't resume DMA. (Ah, just saw your follow-up email.)
> >
> > > Any ideas?
> >
> > Off the top of my head, my hypothesis is that dwmac5 has an additional
> > tripwire when the receive DMA is exhausted, and the
> > stmmac_set_rx_tail_ptr()/stmmac_enable_dma_reception() at the end of
> > stmmac_rx_refill() aren't sufficient to wake it back up.
> >
> > I think this is new to dwmac5, because my RK3588 (dwmac4.20 iirc)
> > happily resumes after the same condition.
> >
> > You gave a lot of info; thanks! I'll try to scrape up some
> > documentation on dwmac5 to see if there's something more
> > stmmac_rx_refill() ought to be doing. I think I have a Xavier NX
> > around here somewhere, I'll see if I can repro the problem.
>
> I've added dma_rmb() into dwmac4_wrback_get_tx_status() and
> dwmac4_wrback_get_rx_status(), and with that I've had an iperf3
> instance finally complete... but only once:

Hi Russell,

To me it feels relevant that the T194 doesn't use first-party
ARM/Cortex cores but rather Nvidia's in-house "Carmel" architecture.
Do you suppose the cache there is quirky in such a way that either:
1) We're seeing poor cache hygiene in stmmac where other caches are
more forgiving (more likely)
2) Carmel's cache has a subtle hardware bug triggered by stmmac's
specific access pattern (less likely)?

I'm still trying to get my Xavier NX to boot on net-next. It's running
into eMMC corruption/stalls very early in the boot process (at
slightly different times; feels like a problem in autocalibration)
that I'm not seeing on older kernels. Once I'm done bisecting that
regression I'll take a deeper look at this stmmac mystery. :)

Cheers,
Sam

>
> root@tegra-ubuntu:~# iperf3 -c 192.168.248.1 -R
> Connecting to host 192.168.248.1, port 5201
> Reverse mode, remote host 192.168.248.1 is sending
> [  5] local 192.168.248.174 port 42232 connected to 192.168.248.1 port 52=
01
> [ ID] Interval           Transfer     Bitrate
> [  5]   0.00-1.00   sec  50.8 MBytes   426 Mbits/sec
> [  5]   1.00-2.00   sec  54.9 MBytes   460 Mbits/sec
> [  5]   2.00-3.00   sec  54.0 MBytes   453 Mbits/sec
> [  5]   3.00-4.00   sec  53.8 MBytes   452 Mbits/sec
> [  5]   4.00-5.00   sec  52.4 MBytes   438 Mbits/sec
> [  5]   5.00-6.00   sec  54.3 MBytes   455 Mbits/sec
> [  5]   6.00-7.00   sec  53.7 MBytes   452 Mbits/sec
> [  5]   7.00-8.00   sec  52.8 MBytes   443 Mbits/sec
> [  5]   8.00-9.00   sec  53.7 MBytes   451 Mbits/sec
> [  5]   9.00-10.00  sec  54.3 MBytes   455 Mbits/sec
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-10.01  sec   537 MBytes   450 Mbits/sec   13             sen=
der
> [  5]   0.00-10.00  sec   535 MBytes   448 Mbits/sec                  rec=
eiver
>
> iperf Done.
>
> So, it seems better, but not completely solved.
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers=
/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> index 2994df41ec2c..119f31c94b61 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> @@ -17,10 +17,12 @@ static int dwmac4_wrback_get_tx_status(struct stmmac_=
extra_stats *x,
>                                        struct dma_desc *p,
>                                        void __iomem *ioaddr)
>  {
> -       u32 tdes3 =3D le32_to_cpu(p->des3);
> +       u32 tdes3;
>         int ret =3D tx_done;
>
>         /* Get tx owner first */
> +       dma_rmb();
> +       tdes3 =3D le32_to_cpu(p->des3);
>         if (unlikely(tdes3 & TDES3_OWN))
>                 return tx_dma_own;
>
> @@ -70,12 +72,12 @@ static int dwmac4_wrback_get_tx_status(struct stmmac_=
extra_stats *x,
>  static int dwmac4_wrback_get_rx_status(struct stmmac_extra_stats *x,
>                                        struct dma_desc *p)
>  {
> -       u32 rdes1 =3D le32_to_cpu(p->des1);
> -       u32 rdes2 =3D le32_to_cpu(p->des2);
> -       u32 rdes3 =3D le32_to_cpu(p->des3);
> +       u32 rdes1, rdes2, rdes3;
>         int message_type;
>         int ret =3D good_frame;
>
> +       dma_rmb();
> +       rdes3 =3D le32_to_cpu(p->des3);
>         if (unlikely(rdes3 & RDES3_OWN))
>                 return dma_own;
>
> @@ -107,6 +109,7 @@ static int dwmac4_wrback_get_rx_status(struct stmmac_=
extra_stats *x,
>
>         message_type =3D FIELD_GET(RDES1_PTP_MSG_TYPE_MASK, rdes1);
>
> +       rdes1 =3D le32_to_cpu(p->des1);
>         if (rdes1 & RDES1_IP_HDR_ERROR) {
>                 x->ip_hdr_err++;
>                 ret |=3D csum_none;
> @@ -152,6 +155,7 @@ static int dwmac4_wrback_get_rx_status(struct stmmac_=
extra_stats *x,
>         if (rdes1 & RDES1_TIMESTAMP_DROPPED)
>                 x->timestamp_dropped++;
>
> +       rdes2 =3D le32_to_cpu(p->des2);
>         if (unlikely(rdes2 & RDES2_SA_FILTER_FAIL)) {
>                 x->sa_rx_filter_fail++;
>                 ret =3D discard_frame;
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

