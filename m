Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99870CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3WazqjT6pGYATAug8iwkJ9pe1uOxtYb9X/9dlsk5Ew=; b=BUAXTO99z7oUI0k7/N4wJuSpaX
	3+Shry8IdtOp8P3ySX3mC5dBLkFFZ+9kkS+6Qm0dwWGChsF4keqMaLEcaDEE351ote2O7ozlm3SXC
	ep/xtuo8ZvBIIPG0YyfAoc2wwR3VP1Czs/Z+SqEfxLpUImcm6vbuBgT3lnbdVPCvE4dgsbokYYLnD
	Zthz+rgEQlnI4bBYCXWzaQy9sIUgMJub7n/P4oneY9YrBd5syNIxk3LikVFpbFTjSASeO2y67OwZF
	xseXCwlysPMoxWss3Oc4RgrGSiqG7xTS1eycQI4A7nKcJC0m+LPuAWHLd8aVXnZ1d73VtS9VsgoO1
	pKPR+cuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWdx-00000003UAl-1lLT;
	Tue, 29 Sep 2026 12:09:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWdt-00000003UA6-36KW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790683745; x=1822219745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fUEHF47M7WKRCHrthzZ0wgaJU0aCQTKdbRlyJ0WN10M=;
  b=HVKc0kKAG54jLC7rQdrqTNmRdxYO6IPfgXmqCHAkkh/nTeY0yYaSWrl9
   37H0v9IGtwrW83Ln7FR6xEAql+evWwFfTa1O7wyj3sdP1VnvWHulshF4a
   bwglINedrCmvm8mIyp80A90bc4tm1MI9DkK8UNscT8cjPpFZE/MEuZ20j
   xn+zbuObZNWndxn/r3nsgzAkFafhBUG/d2FLcpanWVu5mu6ApghySM8IS
   A8tR41oJ85Rz+wlJy9/H7SA68HK31TZtX7YpVI+hrbXrjHFbMlY8BiU9C
   weyvW+9WkI6eEYuNuCXxNIiGJt32v2RPwtFAj6vaWEKsJYwuf+Q959V0k
   g==;
X-CSE-ConnectionGUID: m9FKC+SuTGSgQF4KR/WVAQ==
X-CSE-MsgGUID: 1e1vtWY5TeqyxnmFszmc5w==
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="231424125"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 05:09:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Tue, 29 Sep 2026 05:09:02 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 29 Sep 2026 05:09:00 -0700
Date: Tue, 29 Sep 2026 14:09:00 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Quentin Freimanis <quentin@q-lab.dev>
CC: <netdev@vger.kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: sparx5: start the domain 0 TOD counter on
 non-PTP lan969x variants
Message-ID: <20260929120900.zld2c3h4keqcnmcj@DEN-DL-M70577.microsemi.net>
References: <20260928044955.29647-1-quentin@q-lab.dev>
 <20260928151453.fzch356vrp3ergy7@DEN-DL-M70577>
 <4e1ef527-e843-4f1b-9f7f-cf2400fa443e@q-lab.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4e1ef527-e843-4f1b-9f7f-cf2400fa443e@q-lab.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_050906_053524_1F8D3D9B 
X-CRM114-Status: GOOD (  49.46  )
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

Hi Quentin,

> Hi Daniel, thanks for taking the time to reply.
> 
> On 9/28/26 8:14 AM, Daniel Machon wrote:
> > Hi Quentin,
> > 
> > > Currently the base non-PTP capable lan969x variants don't forward any
> > > ethernet frames. Testing showed that starting the domain 0 TOD counter
> > > gets them working again.
> > 
> > Ack. Not initializing the TOD domains on certain variants is a problem.
> > 
> > However, TOD domains shouldn't affect basic forwarding. I tried it on my board
> > with PTP forced off - no forwarding issues.
> > 
> > Certain TSN features do require TOD domains to be configured, though. How did
> > you test this, and what exactly did you see fail?
> 
> Here is my test setup:
> 
> - a LAN9698-V/3KW purchased on digikey in October 2025.
> 
> - My SoM dtsi [1], board dts [2], schematics of the som [3] and
> schematics of the carrier board [4].
> 
> - net/main commit a7bfaba4823e
> 
> - a minimal buildroot initramfs [5]
> 
> - eth10 in the test log is a 1g RGMII port connected to a RTL8211F PHY.
> 
> Note: I've snipped the output of some commands to save space.
> 
> Without this patch, right after a reboot:
> 
>     $ cat /proc/cmdline
>     console=ttyAT0,115200 earlycon
>     systemd.mask=systemd-networkd.service
>     systemd.mask=systemd-networkd.socket
> 
>     $ uname -a
>     Linux buildroot 7.3.0-rc4 #11 SMP PREEMPT Mon Sep 28 19:14:03 PDT
> 2026 aarch64 GNU/Linux
> 
>     $ ip link set eth10 up
> 
>     $ ip addr add 10.0.0.45/24 dev eth10
> 
>     $ ping 10.0.0.1
>     PING 10.0.0.1 (10.0.0.1): 56 data bytes
>     --- 10.0.0.1 ping statistics ---
>     9 packets transmitted, 0 packets received, 100% packet loss
> 
>     $ cat /proc/interrupts
>                 CPU0
>     20:          0  GIC-0  120 Level     sparx5-fdma
> 
>     $ ip -s link
>     12: eth10: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq
> state UP mode DEFAULT group default qlen 1000
>         link/ether 4e:b7:8e:61:37:1e brd ff:ff:ff:ff:ff:ff
>         RX:  bytes packets errors dropped  missed   mcast
>             53745     278      0       0       0     174
>         TX:  bytes packets errors dropped carrier collsns
>                 0       0      0       0       0       0
>         altname enx4eb78e61371e
> 
> After a fresh boot with this patch:
> 
>     $ cat /proc/cmdline
>     console=ttyAT0,115200 earlycon
> systemd.mask=systemd-networkd.service systemd.mask=systemd-networkd.socket
> 
>     $ uname -a
>     Linux buildroot 7.3.0-rc4 #10 SMP PREEMPT Sun Sep 27 21:23:12 PDT
> 2026 aarch64 GNU/Linux
> 
>     $ ip link set eth10 up
> 
>     $ ip addr add 10.0.0.45/24 dev eth10
> 
>     $ ping 10.0.0.1
>     PING 10.0.0.1 (10.0.0.1): 56 data bytes
>     64 bytes from 10.0.0.1: seq=0 ttl=64 time=1.927 ms
>     64 bytes from 10.0.0.1: seq=1 ttl=64 time=0.876 ms
>     64 bytes from 10.0.0.1: seq=2 ttl=64 time=0.832 ms
>     --- 10.0.0.1 ping statistics ---
>     3 packets transmitted, 3 packets received, 0% packet loss
>     round-trip min/avg/max = 0.832/1.211/1.927 ms
> 
>     $ cat /proc/interrupts
>                 CPU0
>     20:       2039  GIC-0  120 Level     sparx5-fdma
> 
>     $ ip -s link
> 
>     12: eth10: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq
> state UP mode DEFAULT group default qlen 1000
>         link/ether a2:ef:53:a5:06:73 brd ff:ff:ff:ff:ff:ff
>         RX:  bytes packets errors dropped  missed   mcast
>             147075    1646      0      96       0      61
>         TX:  bytes packets errors dropped carrier collsns
>             75918     957      0       0       0       0
> 
> 
> > 
> > > 
> > > Fix by moving the TOD counter start code into a helper and calling it in
> > > sparx5_ptp_init(). Non-PTP capable lan969x parts now start the domain 0
> > > counter, and PTP-capable parts start all three, as they used to. A similar
> > > workaround that starts all three and registers the PHC clocks is
> > > implemented in the vendor BSP 6.18 kernel [1].
> > 
> > What we do downstream, is to ensure that all domains and PHC's are configured
> > and registered on all variants, with a very simple is_sparx5() check.
> 
> My reasoning for only enabling the first counter and not registering the
> clocks is that the part does not have SPX5_FEATURE_PTP, so it should not
> expose any PTP features to userspace.
> 

I acknowledge the problem, and I agree that the PHCs should not be registered.
As for the solution, downstream we always start all three TOD domains, including
on sparx5. If you take the same approach here, you don't need the new helper.
Just move the existing TOD start sequence above the if (!sparx5->ptp) early
return, so the counters are always started, while the PHC registration below it
is still skipped on the non-PTP variants.

> > 
> > > 
> > > [1] https://github.com/microchip-ung/linux/tree/bsp-6.18-2026
> > > 
> > > Fixes: 207966787b71 ("net: sparx5: add feature support")
> > > Signed-off-by: Quentin Freimanis <quentin@q-lab.dev>
> > > ---
> > > If anyone with access to documentation more detailed than the
> > > register map knows WHY this clock needs to be running, I'd like to add
> > > that to the commit message.
> > 
> > 
> > > 
> > >   .../ethernet/microchip/sparx5/sparx5_ptp.c    | 72 +++++++++++++------
> > >   1 file changed, 49 insertions(+), 23 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
> > > index 5953e04ef14e..b436684ddae6 100644
> > > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
> > > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
> > > @@ -573,6 +573,42 @@ static int sparx5_ptp_adjtime(struct ptp_clock_info *ptp, s64 delta)
> > >          return 0;
> > >   }
> > > 
> > > +static int sparx5_ptp_tod_start(struct sparx5 *sparx5, u8 phc_mask)
> > > +{
> > > +       u64 tod_adj = sparx5_ptp_get_nominal_value(sparx5);
> > > +       int i;
> > > +
> > > +       if (phc_mask > GENMASK(SPARX5_PHC_COUNT - 1, 0))
> > > +               return -EINVAL;
> > > +
> > > +       /* Disable master counters */
> > > +       spx5_wr(PTP_PTP_DOM_CFG_PTP_ENA_SET(0), sparx5, PTP_PTP_DOM_CFG);
> > > +
> > > +       /* Configure the nominal TOD increment per clock cycle */
> > > +       spx5_rmw(PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS_SET(phc_mask),
> > > +                PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS,
> > > +                sparx5, PTP_PTP_DOM_CFG);
> > > +
> > > +       for (i = 0; i < SPARX5_PHC_COUNT; ++i) {
> > > +               if (!(phc_mask & BIT(i)))
> > > +                       continue;
> > > +
> > > +               spx5_wr((u32)tod_adj & 0xFFFFFFFF, sparx5,
> > > +                       PTP_CLK_PER_CFG(i, 0));
> > > +               spx5_wr((u32)(tod_adj >> 32), sparx5,
> > > +                       PTP_CLK_PER_CFG(i, 1));
> > > +       }
> > > +
> > > +       spx5_rmw(PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS_SET(0),
> > > +                PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS,
> > > +                sparx5, PTP_PTP_DOM_CFG);
> > > +
> > > +       /* Enable master counters */
> > > +       spx5_wr(PTP_PTP_DOM_CFG_PTP_ENA_SET(phc_mask), sparx5, PTP_PTP_DOM_CFG);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >   static struct ptp_clock_info sparx5_ptp_clock_info = {
> > >          .owner          = THIS_MODULE,
> > >          .name           = "sparx5 ptp",
> > > @@ -605,7 +641,6 @@ static int sparx5_ptp_phc_init(struct sparx5 *sparx5,
> > > 
> > >   int sparx5_ptp_init(struct sparx5 *sparx5)
> > >   {
> > > -       u64 tod_adj = sparx5_ptp_get_nominal_value(sparx5);
> > >          const struct sparx5_ops *ops = sparx5->data->ops;
> > >          struct sparx5_port *port;
> > >          int err, i;
> > > @@ -622,8 +657,17 @@ int sparx5_ptp_init(struct sparx5 *sparx5)
> > >                  sparx5->ptp = 1;
> > >          }
> > > 
> > > -       if (!sparx5->ptp)
> > > +       if (!sparx5->ptp) {
> > > +               if (!is_sparx5(sparx5)) {
> > > +                       /* the base, non-ptp-capable lan969x variants need the first tod counter
> > 
> > Nit: s/the/The
> > 
> > > +                        * running to forward frames.
> > > +                        */
> > > +                       err = sparx5_ptp_tod_start(sparx5, BIT(0));
> > > +                       if (err)
> > > +                               return err;
> > > +               }
> > >                  return 0;
> > > +       }
> > > 
> > >          for (i = 0; i < SPARX5_PHC_COUNT; ++i) {
> > >                  err = sparx5_ptp_phc_init(sparx5, i, &sparx5_ptp_clock_info);
> > > @@ -635,27 +679,9 @@ int sparx5_ptp_init(struct sparx5 *sparx5)
> > >          spin_lock_init(&sparx5->ptp_ts_id_lock);
> > >          mutex_init(&sparx5->ptp_lock);
> > > 
> > > -       /* Disable master counters */
> > > -       spx5_wr(PTP_PTP_DOM_CFG_PTP_ENA_SET(0), sparx5, PTP_PTP_DOM_CFG);
> > > -
> > > -       /* Configure the nominal TOD increment per clock cycle */
> > > -       spx5_rmw(PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS_SET(0x7),
> > > -                PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS,
> > > -                sparx5, PTP_PTP_DOM_CFG);
> > > -
> > > -       for (i = 0; i < SPARX5_PHC_COUNT; ++i) {
> > > -               spx5_wr((u32)tod_adj & 0xFFFFFFFF, sparx5,
> > > -                       PTP_CLK_PER_CFG(i, 0));
> > > -               spx5_wr((u32)(tod_adj >> 32), sparx5,
> > > -                       PTP_CLK_PER_CFG(i, 1));
> > > -       }
> > > -
> > > -       spx5_rmw(PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS_SET(0),
> > > -                PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS,
> > > -                sparx5, PTP_PTP_DOM_CFG);
> > > -
> > > -       /* Enable master counters */
> > > -       spx5_wr(PTP_PTP_DOM_CFG_PTP_ENA_SET(0x7), sparx5, PTP_PTP_DOM_CFG);
> > > +       err = sparx5_ptp_tod_start(sparx5, GENMASK(SPARX5_PHC_COUNT - 1, 0));
> > > +       if (err)
> > > +               return err;
> > > 
> > >          for (i = 0; i < sparx5->data->consts->n_ports; i++) {
> > >                  port = sparx5->ports[i];
> > > --
> > > 2.55.0
> > > 
> > > 
> > 
> > /Daniel
> 
> [1]
> https://gitlab.com/qfreiman/buildroot-external-qlab/-/blob/master/board/qlab/openswitch-lan969x/dts/microchip/lan9698-openswitch.dtsi
> [2]
> https://gitlab.com/qfreiman/buildroot-external-qlab/-/blob/master/board/qlab/openswitch-lan969x/dts/microchip/lan9698-openswitch-10x10g.dts
> [3]
> https://gitlab.com/qfreiman/openswitch-lan969x/-/blob/master/openswitch-lan969x.pdf
> [4]
> https://gitlab.com/qfreiman/openswitch-10x10g-carrier/-/blob/master/openswitch-10x10g-carrier.pdf
> [5]
> https://gitlab.com/qfreiman/buildroot-external-qlab/-/blob/master/configs/qlab_openswitch_lan969x_defconfig
> 
> - Quentin
> 

/Daniel

