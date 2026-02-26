Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76E4FD9E12
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqRKtiNCh+XHHlBIYDrgwzSJmgT5bespg03s/gki404=; b=hpcpdsMDBsZDnxPMl40qvmrqlu
	U9zDDKXBzAfPcqqWD04JhDhvf/XBlaadAs/N2KLyZVFWfSGw6/qvgc1+GqWFnBfZM+/w+AY/sjC79
	5A91VLJ0zlHy2x6ZG2cbaydN8l+0c4hi4nkamZPGPipAk4+5x4hx2Yx7KLdv8d6BQOnHP19/LMyZd
	ebppC+7S7qJ+vWXOYSI3B+C8tKz0ypjATUj+hqOh9bJV1/wW9XZ44bpZL1anidfzlRkmtQ1c768gi
	VD0LnK58e+xPYU+4gL52ceyh08X53OhF23lZt1Wdr8/abpHX9GEcMGOqQW2qTxKtWxLWPkYOm9ngK
	Hx3OiahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhjj-000000078k0-1JxF;
	Thu, 26 Feb 2026 20:13:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhjc-000000078jR-45je
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 20:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772136801; x=1803672801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=f+FH5u6NePnJWpkXpdMf0rFuk3vM+W+gFD63G5LmYC0=;
  b=c52KFlevDgDqnL/TGLtnctlcd0eFo7QW49CGC1vM/E4fVfqNMb7mk6/k
   1vblpUPhdJ+AB0FLj8M7U0Xl8RGw3zYrkZz63VW4i8siq7SmMml9Gj9TV
   KXoWVyiE2xqyI/5mZDX4aan+hKkc05nGIYqTnWRUsN3l+8wjedyn2U6ES
   C55ur6K9Gs1HVIyfYl61B1q6mRmCJA5REmDfaOupPt4wpnD2vRL+Iy8/B
   JNe86AIkkxTI78VlYR9BBM4PbfsxuRoKDwrx0iOIMilaT5f2ic4frCUcB
   p8we94SeDfLAHCd6MYvZKVqG2HsjfiyNUne9gtmnl+52qxY1GzLHeKZ0C
   g==;
X-CSE-ConnectionGUID: /3wlzlSWTeqatQ0/5yW24Q==
X-CSE-MsgGUID: u1+A7DOrQWul7wPPEnGxgA==
X-IronPort-AV: E=Sophos;i="6.21,312,1763449200"; 
   d="scan'208";a="54359471"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Feb 2026 13:13:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 26 Feb 2026 13:12:37 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 26 Feb 2026 13:12:35 -0700
Date: Thu, 26 Feb 2026 21:12:35 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next 0/7] net: sparx5: clean up probe/remove init and
 deinit paths
Message-ID: <20260226201235.vbnnp3skx3tv3obb@DEN-DL-M70577.microsemi.net>
References: <20260225-sparx5-init-deinit-v1-0-97036580b9f0@microchip.com>
 <aZ69uEQHdhASe5dj@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZ69uEQHdhASe5dj@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_121321_364140_AC6CED52 
X-CRM114-Status: GOOD (  27.39  )
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

Hi Russell,

> > This series refactors the sparx5 init and deinit code out of
> > sparx5_start() and into probe(), adding proper per-subsystem cleanup
> > labels and deinit functions.
> >
> > Currently, the sparx5 driver initializes most subsystems inside
> > sparx5_start(), which is called from probe(). This includes registering
> > netdevs, starting worker threads for stats and MAC table polling,
> > requesting PTP IRQs, and initializing VCAP. The function has grown to
> > handle many unrelated subsystems, and has no granular error handling —
> > it either succeeds entirely or returns an error, leaving cleanup to a
> > single catch-all label in probe().
> >
> > The remove() path has a similar problem: teardown is not structured as
> > the reverse of initialization, and several subsystems lack proper deinit
> > functions. For example, the stats workqueue has no corresponding
> > cleanup, and the mact workqueue is destroyed without first cancelling
> > its delayed work.
> >
> > Refactor this by moving each init function out of sparx5_start() and
> > into probe(), with a corresponding goto-based cleanup label. Add deinit
> > functions for subsystems that allocate resources, to properly cancel
> > work and destroy workqueues. Ensure that cleanup order in both error
> > paths and remove() follows the reverse of initialization order. What
> > remains in sparx5_start() is only hardware register setup and FDMA/XTR
> > initialization that does not require cleanup.
> >
> > Before this series, most init functions live inside sparx5_start() with
> > no individual cleanup:
> >
> >   probe():
> >     sparx5_start():              <- no granular error handling
> >       sparx5_mact_init()
> >       sparx_stats_init()           <- starts worker, no cleanup
> >       mact_queue setup             <- no cancel on teardown
> >       sparx5_register_netdevs()
> >       sparx5_register_notifier_blocks()
> >       sparx5_vcap_init()
> >     sparx5_ptp_init()
> >
> >     probe() error path:
> >       cleanup_ports:
> >         sparx5_cleanup_ports()
> >         destroy_workqueue(mact_queue)
> >
> > After this series, probe() initializes subsystems in order with
> > matching cleanup labels, and remove() tears down in reverse:
> >
> > probe():
> >     sparx5_ptp_init()
> >     sparx5_vcap_init()
> >     sparx5_mact_init()
> >     sparx5_stats_init()
> >     sparx5_register_netdevs()
> >     sparx5_register_notifier_blocks()
> >     sparx5_start()
> >
> >   remove():
> >     sparx5_unregister_notifier_blocks()
> >     sparx5_unregister_netdevs()
> >     sparx5_stats_deinit()
> >     sparx5_mact_deinit()
> >     sparx5_vcap_deinit()
> >     sparx5_ptp_deinit()
> >     sparx5_destroy_netdevs()
> >
> > Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> 
> Note that there is the general principle that drivers should not
> "publish" themselves (aka register their netdevs and/or ptp) until
> they have initialised enough so the facility that has been published
> is functional.
> 
> That, in general, means that there should be very little initialisation
> after the calls to register the netdevs and ptp.
> 
> It's fine if something gets published and then a later publication of
> another interface fails, causing the first publication to be withdrawn,
> that is pretty much unavoidable, but in such scenarios, one would want
> to do as much of the initialisation that may fail before any
> publication of any user interfaces.
> 
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


Thanks for pointing this out.

Before this series, quite a bit of initialization was already done after
publication. But as a consequence of moving netdev registration out of
sparx5_start() (patch #2), some initialization that previously happened before
publication now happens after — which is the wrong direction.

I will do some reordering to fix this in v2.

Thanks!

