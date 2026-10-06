Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316D4CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eTRhpUdAPhibVitSf9ugYG/3fmwl3lSEUIJCeeRHDY=; b=IHpSr4mCTUBvFJta5R46ip5SYU
	UGD7pzDvJbcdLhAZaQEJw15zcqDLnXJUOoHJXRJpTZGYDU/87e/VuaeT+LxIz1t4b+mYyHtfn5Sg9
	gtQ4XXK5DL9IkVOk/HlooF9JEhGM7v4+IvkB6BEvQDWeXqmllU/SmiEKpUu3am3nJxShV5cVASqJp
	sivyC0sOslZ5TpVtNsbWUwwKhx1eHxQTGFvAfxGiHqdcORSXupZQWw4n2WxvtzKsrvKCbQy+q+5TC
	GHgDIubvAizmkcNLZv3eI93ojm1UJujLId+Y0bio7u4B7C544dU+Ilcc9+S9bQtR+slSyv19M7b/3
	fhNOIQqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5oD-00000000vgD-1Iru;
	Tue, 06 Oct 2026 14:06:21 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5o9-00000000vfF-0wHk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 14:06:19 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-67583c777abso999563d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 07:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791295576; cv=none;
        d=google.com; s=arc-20260327;
        b=s7mjWzKRH4WuO3fOFKuwNUNbID8GGjiyiLH8d9/Y30QdzUv3EFvyE1eGh4XDunWGdE
         V2RTYqKGWnJMCdy1mFkk0dYJJPHxx5oMaJeDxqWE6LeyiK/b71XBU72sdGwiRNZjGLDA
         cEG95nFbEdRwQc1hzhHuMl1gACoiRg3qP4JieKUYwqufTDZpzcRsb/uBlM+OCJndEt1i
         JwZC4vxPVlZHHs+jM6t/kF1q7tRBvo9vhLV4oi9Ai2vIyyg/bODJtyL5q8mB8ka8op1y
         xJ6u4tiyYzLS/FPQjIPHJ7LBAA2T6ZxWoitBze6+0TliWz1RDvt+f/DNyMa8jNeW8uNK
         LXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7eTRhpUdAPhibVitSf9ugYG/3fmwl3lSEUIJCeeRHDY=;
        fh=TsSASEEcDiNpByk1KddOweNpzr4W7QeMdbHuf3meJ1w=;
        b=Q3Ke3JEijcZZbHPQR+YdbX/YRA8xNN5DW2NTKRu4eu3Fzr95RIvPXwp1Gyrv22MlG+
         ZEoQX0/rqAvdk6RF8iB8ZFdm6QZ7niVzOw33bmDyhn75UNOaBGqFl+VPjwARNfn34QKO
         d3fKAv62UjQO3ZoKNvpSd06YuGS/EdXIi6kTitDGK2aEDHK+gnVoMJUEaXI7n48mGRlU
         dH5k39U9cH8rS2AG9Zqq66US4uOYiP2mKJG8woifOwbgzK/8IqQoD6d/LmDRCPpvSEUG
         QILecy/0bBDreYlkYleFPDxrX3kuGBKIwJ7C6pSj3UUVi7mKBu4hYKHYfsd5IXNil6X7
         7JzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791295576; x=1791900376; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7eTRhpUdAPhibVitSf9ugYG/3fmwl3lSEUIJCeeRHDY=;
        b=SZlj9pAruqW6s8mr/rEHFSLzMd5PgdsPB+KTR1J6Jj3q0vNoTkAlr7/VOiwh3NbwJ2
         fSY09qxQ6p+TGGR5zkQQ2m/1fSQ32Uo6VvC6EVrlH3XR2mAQv8Esmh8EiYrEBHoWAwha
         LwVzf5WYk7hxTXlQNj1e2B6E7Bj6imndVf1YdcIiN7emmHAVeCer9z7cV96Fb9GrnXq9
         8p1VIIt0yu6KgoPE0mOrrnbGZjuYUv7ddnA0C9RkDbBZQufNmV/ojvyIy6iSsIBwbm3M
         bylzA05eO20CX1zf9m3ZcA92GM9F90tyQ3Ws+J6UCeAuRVN6vCgoHH6eYwHnWYklll0f
         8l9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295576; x=1791900376;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7eTRhpUdAPhibVitSf9ugYG/3fmwl3lSEUIJCeeRHDY=;
        b=aR2MsSrHGXS9BoiPfAQJw+WI0EVhv2UQl5aBzggNytI4GYtoEYSIHfv0qt5f6UEpQd
         AzNgshfuetXvbqRCELPlk4WGqEAIt2ZcZxfgIQyO1/8cZugMjSO1bG4E6ROAgPgnpNnJ
         a+TNogxSZLhvTSeSqq9V3eUDQpFJWDkxfQ/e03YZo/VHLFwsWMNkBbZz7hao+HTJvJtN
         PjT2Z+wbT2aaAthnJFZAvP5Aqm0XxUF5mEywKeXszkQKFmOJdc95Jjj087cxr2/xGGUg
         J0V17geq4vMz3gp0IknLmjfjUlVrI4g/RK+JNnNmdQTAWqk/NIHl02a3kjpavEkh6Xfs
         vZ8g==
X-Forwarded-Encrypted: i=1; AKwUvBwWJw3cm6EvpJX7bqz4eXSbLg0dUHIy/DuTGOrVYZ5pj4axvCR9U2JYeqPhRUxlsagEuyN6zq6LIU6uyILXJHjg@lists.infradead.org
X-Gm-Message-State: AFq9FYKCsb/fD1GH+WZtsu8w7iqvbgYjnijyn1/DvWo1ztxRFf11z8RX
	ZIwzEokuU/XgMVVbcRsVv5AgdU5tjs/s6iTvcFMThXxrqmTIIKRjbA1AsoXW43YwFl9PquL3xUq
	Sl8m9+0MBk4CQlBWRRoDSsdxdOM5ALuwapP/fuk1zVw==
X-Gm-Gg: AYBFou3kzb2j/MonCU4ZPoYoxyfigqQALg9fLELN/i34QXQy7U7yac9Qvlx+vmGZsPN
	nrz3V6MMlRVELB2U/RSQyH8XijcsRhfpKYH4dkN+YutMPO4RTLdUSCiGmKWC+C1NzNd6Jlf+Y4l
	tvTsCxl/DmMY0GL3otYOAGdE8koGJ4YOBsoL9ni8fnFcmWTSgyiqNIpnvjqUh2qpSUmSLGteJEs
	SVDwJfWE51a2rl2GZorIWhrETXHFXL+b42VJ3VnU3A6XXeErPbTthGFQrcA6+Cb5ccz78yeVmxl
	Swn3ITtfC83i6xQoYiERS08Ek1xMN3t4abH8ozr7kDZAFWq6bMB8z/FCESxwdyLddRPv00Pe5Tr
	mpBOH/zT/EK8=
X-Received: by 2002:a05:690e:bc5:b0:66f:c1bc:4045 with SMTP id
 956f58d0204a3-678fcec34d3mr595987d50.38.1791295575798; Tue, 06 Oct 2026
 07:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
 <asQcQIh56MV1OJur@lore-desk> <CAEev2e8+fr1tJnSErD+2TtLDw5fGJbQOMcM5eefMnLyFUR+m7w@mail.gmail.com>
 <asSb3RNcityVg6ia@lore-desk>
In-Reply-To: <asSb3RNcityVg6ia@lore-desk>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 6 Oct 2026 09:06:03 -0500
X-Gm-Features: AclHuK8FBU2I3CZudI7_swPmDfZGR4Ssa4TCnIVoMwFoQK6fIquDhT8Z6kXaqsg
Message-ID: <CAEev2e8c6hZQQom6NV-URgdSoWiafCcRR3BtA6yxxqy7T-me8g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261006_070618_091259_E57C3B3D 
X-CRM114-Status: GOOD (  30.85  )
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

On Tue, Oct 6, 2026 at 1:57=E2=80=AFAM Lorenzo Bianconi
<lorenzo.bianconi@oss.qualcomm.com> wrote:
>
> > Hi Lorenzo,
> >
> > On Mon, Oct 5, 2026 at 4:53=E2=80=AFPM Lorenzo Bianconi
> > <lorenzo.bianconi@oss.qualcomm.com> wrote:
> > >
> > > > On Tue, Sep 29, 2026 at 03:10:11PM +0200, Lorenzo Bianconi wrote:
> > > > > stmmac_update_subsecond_increment() ignores the error returned by
> > > > > stmmac_config_addend(), and stmmac_init_tstamp_counter() discards=
 the
> > > > > addend and system time programming errors, always returning succe=
ss. A
> > > > > failure to program the addend (PTP_TCR_TSADDREG) or to initialize=
 the
> > > > > system time counter (PTP_TCR_TSINIT) is therefore silently swallo=
wed,
> > > > > leaving the hardware timestamp counter in a non-running or partia=
lly
> > > > > configured state while the driver keeps operating as if timestamp=
ing
> > > > > were up. This matters for TAPRIO/EST offloading, which derives th=
e gate
> > > > > base time from the hardware timestamp counter.
> > > > >
> > > > > The same hooks are also called from the PHC callbacks: settime64 =
and
> > > > > adjfine drop the error and report success to clock_settime() and
> > > > > clock_adjtime(), so a dead PTP reference clock goes unnoticed by
> > > > > ptp4l/phc2sys.
> > > > >
> > > > > Return error codes from stmmac_update_subsecond_increment(),
> > > > > stmmac_init_tstamp_counter(), stmmac_dl_ts_coarse_set() and the
> > > > > settime64/adjfine callbacks instead of silently returning success=
. On
> > > > > failure, roll back the partially applied configuration so the har=
dware
> > > > > and the driver bookkeeping stay consistent, and report the reason
> > > > > through the devlink extack. Also guard against a zero sub-second
> > > > > increment, which would otherwise divide by zero when computing th=
e
> > > > > addend.
> > > > >
> > > > > Reset the persistent timestamping state (hwts_tx_en, hwts_rx_en,
> > > > > tstamp_config, systime_flags and tsfupdt_coarse) when (re)initial=
izing
> > > > > timestamping, so a failed init does not leave TX/RX timestamping
> > > > > enabled on a counter that never started.
> > > > >
> > > > > Fixes: cc4c9001ce31 ("net: stmmac: Switch stmmac_hwtimestamp to g=
eneric HW Interface Helpers")
> > > > > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.co=
m>
> > > > > ---
> > > > > Changes in v3:
> > > > > - Do not run stmmac_config_addend() in
> > > > >   stmmac_update_subsecond_increment() error path.
> > > > > - Return error from stmmac_adjust_freq() and stmmac_set_time().
> > > > > - Reset hw ts configuration in stmmac_init_timestamping().
> > > > > - Link to v2: https://lore.kernel.org/r/20260924-stmmac-ptp-added=
-systime-error-v2-1-beb2a6b5f866@oss.qualcomm.com
> > > > >
> > > > > Changes in v2:
> > > > > - Initialize sec_inc to 0 in stmmac_restore_subsecond_increment()
> > > > >   routine.
> > > > > - Link to v1: https://lore.kernel.org/r/20260920-stmmac-ptp-added=
-systime-error-v1-1-8ac9e7a3fce2@oss.qualcomm.com
> > > > > ---
> > > > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 106 ++++++++=
++++++++------
> > > > >  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  10 +-
> > > > >  2 files changed, 84 insertions(+), 32 deletions(-)
> > > >
> > > > Hello, I'm noticing that after this patch was merged into linux-nex=
t,
> > > > boot seems to hang when ip=3Ddhcp is used because ethernet isn't wo=
rking
> > > > on the TH1520 Lichee Pi 4a. These lines get printed in a loop over =
and
> > > > over
> > > >
> > > > IP-Config: end0 hardware address 72:ca:a8:eb:27:[   24.872982] thea=
d-dwmac ffe7070000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > > > f2 mtu 1500 DHCP
> > > > [   24.900412] thead-dwmac ffe7070000.ethernet end0: PHY [stmmac-0:=
01] driver [RTL8211F Gigabit Ethernet] (irq=3DPOLL)
> > > > [   24.912780] dwmac1000: Master AXI performs any burst length
> > > > [   24.912801] thead-dwmac ffe7070000.ethernet end0: No Safety Feat=
ures support found
> > > > [   25.010229] thead-dwmac ffe7070000.ethernet end0: PTP init faile=
d
> > > > SIOCSIFFLAGS: Connection timed out
> > >
> > > Hi Anirudh,
> > >
> > > based on the reported error, stmmac_init_tstamp_counter() fails with
> > > -ETIMEDOUT. In particular this can occurs if:
> > >
> > > stmmac_init_tstamp_counter()
> > >  -> stmmac_update_subsecond_increment() -> stmmac_config_addend() -> =
-ETIMEDOUT
> > >  -> stmmac_init_systime() -> -ETIMEDOUT
> > >
> > > I guess we should understand which one is failing and why it is faili=
ng.
> >
> > It seems like both are timing out, both config_addend
> > (PTP_TCR_TSADDREG) and init_systime (PTP_TCR_TSINIT).
>
> It seems hw timestamping has never worked on this board, it was just
> undiscovered since stmmac_init_tstamp_counter() was not reporting any
> error before (this is exactly the goal of this patch).
>
> What are the output for:
> - IEEE 1588-2002 Time Stamp
> - IEEE 1588-2008 Advanced Time Stamp
>
> root@rb3-gen2:~# grep 'Time Stamp' /sys/kernel/debug/stmmaceth/eth0/dma_c=
ap
> IEEE 1588-2002 Time Stamp: N
> IEEE 1588-2008 Advanced Time Stamp: Y

This is what I see

root@debian-trixie-riscv64:/# grep 'Time Stamp'
/sys/kernel/debug/stmmaceth/end0/dma_cap
IEEE 1588-2002 Time Stamp: N
IEEE 1588-2008 Advanced Time Stamp: Y

