Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE0DCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8Zx+JtT+seNHXXb8F6mftLhCjuV5sSjme8e5SelnMk=; b=sWNihQFjPzDCXmVT336f+9TWZX
	AGtTWj8K/+qjNrQZHjw/1r6XVo3lN8b5X2iMn2PkSTmAfr8WnHk6jr1rjSLeuuf3RjVq/xo7cDgiD
	fa9GtemJlhq5Mb45bMZd/xj+VkAEy1Msfl/iJZ+jdh7FYz7UOn1GycH1NQMg73+aW2VyYpSDwNtPA
	IFPhqndPQxZvib5lkzhvSYO57dthekyViUpJ7MymbduxF/bo5Ii/FR/iXaPZWsKbWN5lT/+Q7yWQx
	Q58/WrDiH8dB34OIuG40Ijhkb7ArDygQ0Q4FKfNRDh27uJz8F6vYBtYDFr8eb1rzp50qUGbA/pY1j
	AHqWFkYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL3kp-00000004cro-28JR;
	Thu, 07 May 2026 18:47:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL3kn-00000004crK-1HWt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 18:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778179641; x=1809715641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nV80bCDLgSyQneDPT+TZoCa6lKd1n1qaxJOqkPDtorc=;
  b=V/hXIc3/J8pv+9EjePCdPbTY2/ZKMf8ZDlWI4ybrDj9kG3rBJ2rG5Bnp
   vJNCH9gSEZgeuD6nN77DfgKQI9rueET5hLxXMTP095EXjUxh1eghwiilY
   nBiDHL8Z6d9Bhsi/HOddSNDc0k0DJRr8V2vf+YKrL/mMk2lILpCKqo5TJ
   +vJL1f/L6/Nc4JRSXDnoTYHAfkaOoOYjFDJ8rnBT+i86yhsxxsQutOs39
   RnD+H4MSxdveNLi3RHDLtNxiBbMfJX7StgEpXu0vm+6icYkLX2HyBkApN
   xhWD4VbfuXQ+Sa3/CRxMB7i/54DWqTQvJDMfkHn9N0P2Zy35WOEts6VI/
   Q==;
X-CSE-ConnectionGUID: rpcJMlA7QfSsF+A+h2bwPQ==
X-CSE-MsgGUID: 4g6NkmJdQtC0Lw8C4aM6Jg==
X-IronPort-AV: E=Sophos;i="6.23,222,1770620400"; 
   d="scan'208";a="224434606"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 11:47:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Thu, 7 May 2026 11:47:18 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 7 May 2026 11:47:14 -0700
Date: Thu, 7 May 2026 20:47:14 +0200
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
Message-ID: <20260507184714.joyobsh6ydjzrkc4@DEN-DL-M70577.microsemi.net>
References: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
 <20260506-misc-fixes-sparx5-lan969x-v2-1-fb236aa96908@microchip.com>
 <20260507090810.53e66ef6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260507090810.53e66ef6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_114721_414732_6ACAE496 
X-CRM114-Status: GOOD (  15.82  )
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

> On Wed, 6 May 2026 09:25:36 +0200 Daniel Machon wrote:
> > Move the debugfs setup into a new sparx5_debugfs() helper in
> > sparx5_debugfs.c, invoked after sparx5_register_notifier_blocks()
> > succeeds so the netdev names are finalized. sparx5_vcap_init() now
> > only deals with VCAP state. The sparx5/ debugfs root is created in
> > the new helper as well.
> 
> netdev names are never final :( User can change them at any time.
> The best practice is to name the debugfs file by some stable hw-related
> property, bus, port number etc.

Right, but they are finalized in the sense that we have a name we can use for the
debugfs files (which we dont pre-patch).

Hmm. I think this patch fixes an actual issue, where you cannot query the
debugfs files, because a previous patch broke the ordering. I agree that the
names chosen (netdev_name()) for the files were poor, but is that really a fix
for this series? Should that not be adressed in a future patch for net-next (it
involves changing an VCAP API function that is not only used by Sparx5/lan969x,
but also lan966x.).

/Daniel

