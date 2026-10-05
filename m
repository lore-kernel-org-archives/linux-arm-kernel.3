Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032A2CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yoy4+gNGcQV5h8mXnlsNwLFsTZ1uQXaQDtjTnekUSzk=; b=rxaePgiDqnN4Xt298Kw5Fy9e9H
	THKyzX2Z9M6In39biL7SGoCNG3mMGuksplgT/qNB4MbTU/jE7QfQyDoBf2ZB6xVDCMl4n6JoqTFVE
	KFjkgrdOlxJ8Zq8clQJ/XGuICuMhTubzoT+itcEN5TMbmQncbO3LK9TwH9rihCS41vWfOEhX2PQK7
	Enocy97YwH1QKwodXHp6xxP9/sgMdyyJ3TK/vtLWknCsx+sxIn0ar1+SfG4LXAWBshyAvFlKLbQW3
	syr7Am38Ebgb1X/KU6v9G5i5XSbs2g6VwYdUKVdqY1bMVqmGwH7o2lx/bP7DXJVamaduANRoIEmFE
	PmPOpGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrMb-0000000HHlG-0G6h;
	Mon, 05 Oct 2026 22:40:53 +0000
Received: from mail-yx2-x2a.google.com ([2607:f8b0:4864:41::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrMY-0000000HHhV-2WMp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:40:51 +0000
Received: by mail-yx2-x2a.google.com with SMTP id 956f58d0204a3-6768036283dso1776270d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791240049; cv=none;
        d=google.com; s=arc-20260327;
        b=cDKBjjgkk0k56FZP8gMPv2BPeGkYWgmw3BmGBZ7/UmJNAxZXxmPTUAeP6vdZ5u/Cwh
         pd5NhJb3CWO9wiKg6lg2682vqYDjRyB2AEzOoQolJDzF/gaAl45SeXzmnkM3yCpwklis
         IIRJguE8BQALTMKKBF1QWhIYZE8mS1mt8sb67DwgGf+lH/JSyADisAKKZ3kzFWbEzQ2Z
         tQPswHuYLJT0dsgcD3xHnNmb0xYy5dwrMochv1HWPkb5iqMNtvfB2At7AZ6i4SrIbcHv
         WnY6mLFy3vetEXNNgDCcpuHRknnwwaYd7UkhhwDc02vuFiocv0I80h32NaPqkGBnRthS
         iqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yoy4+gNGcQV5h8mXnlsNwLFsTZ1uQXaQDtjTnekUSzk=;
        fh=kdfzeyiStbZ5A3SUiVrQT108q7WNF6hM8cg5bxpac5c=;
        b=IY6pwphRZfQSJwuQxbVfzMM7Hd+asDT3/wlJBX4z9vgabkyDQi/9R3ZGUl7pZkXV1S
         9ikrAAPBZ9x9jUtDeRE6qtaGtimxHErYZSJSguKsZ4i0V4OUlzykOy5ykmCBIszqX2A5
         zAXkE/9e/XM+5FGGxFpQigaqidYf7VtgT2GzpgHkDz52O2UcQQJk4WVhmkhijrwWBpEL
         OIKZi2eKmTwFMTfqtykLD4KJ4+25wCKIiU+kHTZM1Ns5H+zBrR4LVQg12WsdRYeA4Mp4
         0F2bVKf0L4aWxN+AOQ1KmERCo942IbEsj12ZpYXKEMeZSG738jBan5VBq7PPrg8UKJn/
         E61w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791240049; x=1791844849; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yoy4+gNGcQV5h8mXnlsNwLFsTZ1uQXaQDtjTnekUSzk=;
        b=MoqLOTwrJb/61+KPF37F846o1YYLqN4xDdl4f5a9wbXJybEQ+C0YTUdlOepmVxd73N
         no94Z6uxpq5gc9MPxVq96wuqWHBneQBP8Q1f7pWg7diA5n9Vi/kHHE/R+nnTBEZFfM1C
         YCX7KeQqNZ+lqpU4zpGvyllnIyJHptPSt+SldjDS5+sbhehzr5GDA6F/GfpryNowPzDm
         Hdrpye6XIBN5O+zG/EguDW5GezH7knapocZjnp48CoNJulGtUe3rl0zyOBWF1zTRAjAW
         PDBTKQK/xU2LAwO2izf0BNF+g6nFs70drkYuATEDg4oUbfR/LdxPqTcxOmcr2BzOXz0c
         1JKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791240049; x=1791844849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yoy4+gNGcQV5h8mXnlsNwLFsTZ1uQXaQDtjTnekUSzk=;
        b=N6QzbqT/lVrIH0S/PqaMq5JtfLs57w/pp06Arp4Nf8Sef519Ksu0cZ2Ahas21draH1
         mIPDW1dUqvhJzUMg5k0EvmKv6FS22I2HN1jGLFp2hzfNepUug1YVO5iC2mthZXIO65PW
         TxJfpFwlplUwz/1sfCxASwkaIhe8Myk2YuwNK+uKj7M1OKLMzE3auRDKsX93vmbzTrLS
         T/xV88IZPR9vL9V9QUveChJyO6Kt/7tAVu5/V87PR5JEsMz6rSBThmBEsoKa4B5+JDse
         w0VwHmwo9SnXNUXMFJb/2ymQAs0ep9afB6W2CO1wSHlpdtqwFllt9yDZ3KllYmSIp4dy
         Y1Pg==
X-Forwarded-Encrypted: i=1; AKwUvBx0j6aF4uYgegRGebe3yGh79CCRUIC7GLVbsblKt+IsEiDpn7yGK5AARvIkAPCBkA67et6KtFDAil6AbCyZALPe@lists.infradead.org
X-Gm-Message-State: AFq9FYIeKlwovwXxfzdswThOvWY3GDMdYn+oOy9sfQHbt60D4+SNEOmA
	h+BdEVULF72wzdAJHhiFGX6i2H4b5ykYjRuC+2URdNgtOfT5KANcRa8R88U4N0HM+arT9Dwmf0q
	sZPnDrU9O9u3X742Uy9/g8db5uKZGWViASAPiZDUJog==
X-Gm-Gg: AYBFou0gPu1rJ4sxtUD4oTPr/IqWb/dZ3Ptlpu0k04oE2LMsm0/o6yFM8ZxUASVlB0p
	HpRXYzxZIYP0c8Vp5W1O2SK6lnUA2xMcYCngMryCVyPzrtQdPKVuQ5uCsIeInTD1ZiwHqZsWLxg
	lyaSm0hbjM7vJyVNjOGqd2dxu5JidDsQwI1PaQ7QX/rXaKsqX39y6J2pKcHpUdwyUI4NhMN/8kE
	p+V8hdxJ3FXQ+Lw8WgDAsknEI2kSzPLiWIXUwAiGHSgntFRdXkUZyrY1N31Xs1NauGcw4HSxyqR
	eMuVkt6D11P2rAyPPYxIgVafyyctnM72fT3z7qfiPj7Y+c89oWJLg3ijLO3tIoRXWtgZ04SFHAj
	iQoZFsTMhlNo=
X-Received: by 2002:a53:eb86:0:b0:677:a004:4c3b with SMTP id
 956f58d0204a3-677ac155deemr3157728d50.127.1791240048910; Mon, 05 Oct 2026
 15:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca> <asQcQIh56MV1OJur@lore-desk>
In-Reply-To: <asQcQIh56MV1OJur@lore-desk>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 5 Oct 2026 17:40:36 -0500
X-Gm-Features: AclHuK_waBcUE5jt710thOReYEcaNoXlOFQ7cNij63z-oA9tFI26Hbx-S3DtTtI
Message-ID: <CAEev2e8+fr1tJnSErD+2TtLDw5fGJbQOMcM5eefMnLyFUR+m7w@mail.gmail.com>
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Jose Abreu <Jose.Abreu@synopsys.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <fustini@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_154050_662095_8D037C0D 
X-CRM114-Status: GOOD (  27.08  )
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

Hi Lorenzo,

On Mon, Oct 5, 2026 at 4:53=E2=80=AFPM Lorenzo Bianconi
<lorenzo.bianconi@oss.qualcomm.com> wrote:
>
> > On Tue, Sep 29, 2026 at 03:10:11PM +0200, Lorenzo Bianconi wrote:
> > > stmmac_update_subsecond_increment() ignores the error returned by
> > > stmmac_config_addend(), and stmmac_init_tstamp_counter() discards the
> > > addend and system time programming errors, always returning success. =
A
> > > failure to program the addend (PTP_TCR_TSADDREG) or to initialize the
> > > system time counter (PTP_TCR_TSINIT) is therefore silently swallowed,
> > > leaving the hardware timestamp counter in a non-running or partially
> > > configured state while the driver keeps operating as if timestamping
> > > were up. This matters for TAPRIO/EST offloading, which derives the ga=
te
> > > base time from the hardware timestamp counter.
> > >
> > > The same hooks are also called from the PHC callbacks: settime64 and
> > > adjfine drop the error and report success to clock_settime() and
> > > clock_adjtime(), so a dead PTP reference clock goes unnoticed by
> > > ptp4l/phc2sys.
> > >
> > > Return error codes from stmmac_update_subsecond_increment(),
> > > stmmac_init_tstamp_counter(), stmmac_dl_ts_coarse_set() and the
> > > settime64/adjfine callbacks instead of silently returning success. On
> > > failure, roll back the partially applied configuration so the hardwar=
e
> > > and the driver bookkeeping stay consistent, and report the reason
> > > through the devlink extack. Also guard against a zero sub-second
> > > increment, which would otherwise divide by zero when computing the
> > > addend.
> > >
> > > Reset the persistent timestamping state (hwts_tx_en, hwts_rx_en,
> > > tstamp_config, systime_flags and tsfupdt_coarse) when (re)initializin=
g
> > > timestamping, so a failed init does not leave TX/RX timestamping
> > > enabled on a counter that never started.
> > >
> > > Fixes: cc4c9001ce31 ("net: stmmac: Switch stmmac_hwtimestamp to gener=
ic HW Interface Helpers")
> > > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > > ---
> > > Changes in v3:
> > > - Do not run stmmac_config_addend() in
> > >   stmmac_update_subsecond_increment() error path.
> > > - Return error from stmmac_adjust_freq() and stmmac_set_time().
> > > - Reset hw ts configuration in stmmac_init_timestamping().
> > > - Link to v2: https://lore.kernel.org/r/20260924-stmmac-ptp-added-sys=
time-error-v2-1-beb2a6b5f866@oss.qualcomm.com
> > >
> > > Changes in v2:
> > > - Initialize sec_inc to 0 in stmmac_restore_subsecond_increment()
> > >   routine.
> > > - Link to v1: https://lore.kernel.org/r/20260920-stmmac-ptp-added-sys=
time-error-v1-1-8ac9e7a3fce2@oss.qualcomm.com
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 106 ++++++++++++=
++++------
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  10 +-
> > >  2 files changed, 84 insertions(+), 32 deletions(-)
> >
> > Hello, I'm noticing that after this patch was merged into linux-next,
> > boot seems to hang when ip=3Ddhcp is used because ethernet isn't workin=
g
> > on the TH1520 Lichee Pi 4a. These lines get printed in a loop over and
> > over
> >
> > IP-Config: end0 hardware address 72:ca:a8:eb:27:[   24.872982] thead-dw=
mac ffe7070000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > f2 mtu 1500 DHCP
> > [   24.900412] thead-dwmac ffe7070000.ethernet end0: PHY [stmmac-0:01] =
driver [RTL8211F Gigabit Ethernet] (irq=3DPOLL)
> > [   24.912780] dwmac1000: Master AXI performs any burst length
> > [   24.912801] thead-dwmac ffe7070000.ethernet end0: No Safety Features=
 support found
> > [   25.010229] thead-dwmac ffe7070000.ethernet end0: PTP init failed
> > SIOCSIFFLAGS: Connection timed out
>
> Hi Anirudh,
>
> based on the reported error, stmmac_init_tstamp_counter() fails with
> -ETIMEDOUT. In particular this can occurs if:
>
> stmmac_init_tstamp_counter()
>  -> stmmac_update_subsecond_increment() -> stmmac_config_addend() -> -ETI=
MEDOUT
>  -> stmmac_init_systime() -> -ETIMEDOUT
>
> I guess we should understand which one is failing and why it is failing.

It seems like both are timing out, both config_addend
(PTP_TCR_TSADDREG) and init_systime (PTP_TCR_TSINIT).

Regards
Anirudh Srinivasan

