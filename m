Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D7FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 18:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6rO+SlkWCI4ed22va2sH1WEW/tBlH9KFs/mXVLbY4w=; b=MpUHwzSH7zsFq4/k+ED3dBGTt7
	8YR8YBBp1570UG0a4esezqrh72DV3JtjYge9Xu+UKrYABZuMH5C9iToLrEw54/824OVISiyHdPhJq
	iK8eqPQfIgCxatzF/aAfzmCBwNHMaI2+j0Zn+CktiMVOubCcChD7rxllcfvT7MFofC5jPE1GKcEUZ
	2KyL/pUCWlSA0u3yG3VnoNB4194R5H59jTL6zdHy4XLG8s6yrLsgfYV/+UyDdd84FUhERDhseDnqD
	JpBOpjzQ0nlAHGy4+K8gKeVLC9f56+4f3aeyPYM1OgrtD1VdAAVvYYCrb3P4me2DoD2wGTlEETnGs
	n7N1wz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kpq-00000006hIq-3Hp3;
	Tue, 15 Apr 2025 18:16:38 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ko0-00000006h63-2Dk7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 18:14:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1u4knh-0005IM-7K; Tue, 15 Apr 2025 20:14:25 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u4knf-000Sd0-2o;
	Tue, 15 Apr 2025 20:14:23 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u4knf-002Fnx-2L;
	Tue, 15 Apr 2025 20:14:23 +0200
Date: Tue, 15 Apr 2025 20:14:23 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: POPESCU Catalin <catalin.popescu@leica-geosystems.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Shawn Guo <shawnguo2@yeah.net>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>,
	"stefan.klug@ideasonboard.com" <stefan.klug@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"
Message-ID: <20250415181423.qderfey4wpmp2bjm@pengutronix.de>
References: <20241007134424.859467-1-catalin.popescu@leica-geosystems.com>
 <ZxYiCv6SpLq9uh08@dragon>
 <qqi2z7wutuy7e6o5fhpzsgfwkyn4quqmdeftl24meld72sudpg@lo3qpk4x7lbv>
 <d6852cf6-e8a0-49b8-a565-2d94eeef67d9@leica-geosystems.com>
 <20250415154724.GG9439@pendragon.ideasonboard.com>
 <20250415155239.GH9439@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415155239.GH9439@pendragon.ideasonboard.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_111444_566766_EFF5C423 
X-CRM114-Status: GOOD (  32.58  )
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

Hi Laurent,

On 25-04-15, Laurent Pinchart wrote:
> On Tue, Apr 15, 2025 at 06:47:26PM +0300, Laurent Pinchart wrote:
> > Hi Catalin,
> > 
> > On Tue, Apr 15, 2025 at 03:42:22PM +0000, POPESCU Catalin wrote:
> > > Hi Jai,
> > > 
> > > This issue was already reported by Stefan. The problem is that I don't 
> > > have a Debix board to investigate.
> > > The main difference b/w WFI and cpu-pd-wait is that the first doesn't 
> > > call PSCI/TF-A. So, the issue looks to be related to some settings in 
> > > the TF-A.
> > 
> > Jai, are you using mainline U-Boot and TF-A, or a downstream version of
> > either (or both) ?
> 
> Actually, same question for Calatin :-)
> 
> I'm running mainline U-Boot 2025.01 and TF-A rel_imx_5.4.70_2.3.6 (from
> https://github.com/nxp-imx/imx-atf) and don't seem to experience the
> issue:

Interessting, can you share your imx-atf build-config please?

I checked the code base and found a missing SLPCR_A53_FASTWUP_STOP_MODE
during the imx_set_sys_lpm() which is called during
.pwr_domain_suspend(). Can you check/trace if pwr_domain_suspend() was
entered?

Regards,
  Marco

> # cat /sys/devices/system/cpu/cpu*/cpuidle/state1/disable
> 0
> 0
> 0
> 0
> 
> $ ping debix
> PING debix.farm.ideasonboard.com (192.168.2.230) 56(84) bytes of data.
> 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=1 ttl=64 time=1.03 ms
> 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=2 ttl=64 time=0.800 ms
> 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=3 ttl=64 time=0.935 ms
> 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=4 ttl=64 time=0.902 ms
> 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=5 ttl=64 time=0.738 ms
> 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=6 ttl=64 time=0.939 ms
> 
> > > What I don't get is why I don't see this issue neither on our IMX8MP 
> > > specific design nor on the EVK, which uses the same PHY as the Debix board.
> > >
> > > On 14/04/2025 14:07, Jai Luthra wrote:
> > > > On Oct 21, 2024 at 17:42:34 +0800, Shawn Guo wrote:
> > > >> On Mon, Oct 07, 2024 at 03:44:24PM +0200, Catalin Popescu wrote:
> > > >>> So far, only WFI is supported on i.MX8mp platform. Add support for
> > > >>> deeper cpuidle state "cpu-pd-wait" that would allow for better power
> > > >>> usage during runtime. This is a port from NXP downstream kernel.
> > > >>>
> > > > Since the introduction of this patch in mainline, I am facing sluggish
> > > > network performance with my Debix Model-A board with i.MX8mp SoC.
> > > >
> > > > The network latency jumps to >1s after almost every other packet:
> > > >
> > > > PING debix (10.0.42.5) 56(84) bytes of data.
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=1 ttl=64 time=1008 ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=2 ttl=64 time=0.488 ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=3 ttl=64 time=1025 ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=4 ttl=64 time=0.810 ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=5 ttl=64 time=590 ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=6 ttl=64 time=0.351 ms
> > > > ^C
> > > > --- debix ping statistics ---
> > > > 7 packets transmitted, 6 received, 14.2857% packet loss, time 6126ms
> > > > rtt min/avg/max/mdev = 0.351/437.416/1024.755/459.370 ms, pipe 2
> > > > darkapex at freya in ~
> > > >
> > > > If I revert the patch, or disable the deeper cpuidle state through
> > > > sysfs, the issue goes away.
> > > >
> > > > # echo 1 > /sys/devices/system/cpu/cpu$i/cpuidle/state1/disable
> > > >
> > > > PING debix (10.0.42.5) 56(84) bytes of data.
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=1 ttl=64 time=0.482 ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=2 ttl=64 time=2.28 ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=3 ttl=64 time=2.26 ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=4 ttl=64 time=0.848 ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=5 ttl=64 time=0.406 ms
> > > > ^C
> > > > --- debix ping statistics ---
> > > > 5 packets transmitted, 5 received, 0% packet loss, time 4051ms
> > > > rtt min/avg/max/mdev = 0.406/1.255/2.280/0.842 ms
> > > >
> > > >>> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
> > > >>
> > > >> Applied, thanks!
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

