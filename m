Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184D9CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 20:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fq32aLdkExAfMs+unlg+8+LEiZMP7TzFWNTFG3w+X6U=; b=Pc1RSpQnFD+WsQ0HKgksZ0phXM
	AbCWNu2/6kZg+CSksWID/b/Jl1eVai5PRRoVKUiSc60av2Gn7mB7W1Io5jkg2DktuHenDEkNANBst
	GbJ3KABBaxObJEi+joNt5K73pEFpr3U+28akzyzzGyreCJwu2cO1+uB1ML8ZxirjhpPC/+ZbYiAOU
	oWJL69adEgkq6K4ilweyXeri2CGI0e5f4RPeuvRx0LbHgKJJWWUHnklwlGmc/K08TN19gq77RpwDg
	q+Ags5R2owqNEcLdGjQ6kyk6gcOhu4Yf6bwpLoePbigYhMukur0ar+p6WRVaI9MTOeN80mBQ0odkj
	mPwlY+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMAhS-0000000BZHc-0Mge;
	Sun, 10 May 2026 20:24:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMAhN-0000000BZGf-2g2E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 20:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778444665; x=1809980665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bfc/WB8MtSNuuBFsXsab/2ISoT0JMcdHR58RLdjA2M4=;
  b=2HQfKeTFCFWmVJRc8eUyqfD7DKnRv86ob3qogZo/D3KQmO2jtYM/ZHGz
   Ys3cVqljOxA9CR0zvl/Jm+thHS1ZdLyKTo4No+aqQujJZg4y7ht+Zv5+b
   kFgt6trAQcsCT/T6O+dpuGmaQdYNM/bbrhQowRfHsseD/sjz5IEoywuuT
   x4YlOUp3zjCjmqR5m+ZAXXSCF3dIS1Yu9oWbznO0IN5Zd41l2cClV10CN
   xpOX1MvlEA5Jks31hYgYOZtim4LQu7038QCS/IQWVqBGBjazJpp5ZOhKk
   XEhDfX4heb8xeR/W16AXxYyJJacuNSCXVPQuxMKkvBU+naiSOWEy170XR
   Q==;
X-CSE-ConnectionGUID: VbcRMQGTQ6+eWcqm1CbgYQ==
X-CSE-MsgGUID: KIoiOUpwQPeOQIJgCqsT8A==
X-IronPort-AV: E=Sophos;i="6.23,227,1770620400"; 
   d="scan'208";a="57698493"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 May 2026 13:24:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 10 May 2026 13:24:22 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Sun, 10 May 2026 13:24:19 -0700
Date: Sun, 10 May 2026 22:24:19 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, Bjarni Jonasson
	<bjarni.jonasson@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, <kees@kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH net v2 1/4] net: sparx5: defer VCAP debugfs creation
 until after netdev registration
Message-ID: <20260510202419.zlh3nej2ohx237by@DEN-DL-M70577.microsemi.net>
References: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
 <20260506-misc-fixes-sparx5-lan969x-v2-1-fb236aa96908@microchip.com>
 <20260507090810.53e66ef6@kernel.org>
 <20260507184714.joyobsh6ydjzrkc4@DEN-DL-M70577.microsemi.net>
 <20260508162213.6b755d8c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260508162213.6b755d8c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_132425_753646_324F5787 
X-CRM114-Status: GOOD (  25.27  )
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

> On Thu, 7 May 2026 20:47:14 +0200 Daniel Machon wrote:
> > > On Wed, 6 May 2026 09:25:36 +0200 Daniel Machon wrote:
> > > > Move the debugfs setup into a new sparx5_debugfs() helper in
> > > > sparx5_debugfs.c, invoked after sparx5_register_notifier_blocks()
> > > > succeeds so the netdev names are finalized. sparx5_vcap_init() now
> > > > only deals with VCAP state. The sparx5/ debugfs root is created in
> > > > the new helper as well.
> > >
> > > netdev names are never final :( User can change them at any time.
> > > The best practice is to name the debugfs file by some stable hw-related
> > > property, bus, port number etc.
> >
> > Right, but they are finalized in the sense that we have a name we can use for the
> > debugfs files (which we dont pre-patch).
> >
> > Hmm. I think this patch fixes an actual issue, where you cannot query the
> > debugfs files, because a previous patch broke the ordering. I agree that the
> > names chosen (netdev_name()) for the files were poor, but is that really a fix
> > for this series? Should that not be adressed in a future patch for net-next (it
> > involves changing an VCAP API function that is not only used by Sparx5/lan969x,
> > but also lan966x.).
> 
> Dunno, if we are aiming to switch to a different naming scheme we can
> just do it now, I reckon. It will not make the fix much longer.
> And presumably it will alleviate the need to reshuffle the ordering.

OK, sounds good to me. I will make the changes for v3. Thanks!

/Daniel

