Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9EFCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNhFBhZJ1Uy9S9T7Mdb2V6I/OIGTRlw/PNdTv6L+1eM=; b=CK5crwaYY4fUslmuWbTz7m6Ga8
	nE0aES7WcPQwhAYRaI/aNw82bSu1wNP+z0zyoHHAhKQAtJ59w6KF5n33YKzxxhZEdmEJdNUveuxRu
	rb9K4bACL9hyUs9e+u/w6CrPa+zILj7XbSf3TuxZo42vWetXdNvZC6Q0/c8uPKN5fLvmziVFJsMhN
	EYCd/gSwCcE/xMgf68NqI+24HgxAZfDyG4+ijEoFOAP461nSF2ry0yrAZWbPydmeDcyfHziBVw9m8
	vEzfEE/Ek6wnlY/3Ewb7RlNgumt6IC1yMxSwPw/ladbJrDyEAJC2bZp9TDu9RuRzCEgiUt6JdQHVe
	pif5W5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGR6-0000000H6Cp-1Ot1;
	Thu, 15 Oct 2026 08:03:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGR5-0000000H6CZ-1TI9
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 08:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nNhFBhZJ1Uy9S9T7Mdb2V6I/OIGTRlw/PNdTv6L+1eM=; b=eQIPeCH80oeisuGQa8CPjLjtjb
	IT9pwT5lSGboLzz2BIJkoACxnC6i1ADEYmY465KVyutQbISrnfmvRYvKs65mDLQFY9jxKuWsxOxgN
	nCRt2QRD46DY6BqPa9VK6tlik7eNIP/4GnUVY234IiN8ex97wn7mYeR7yZ2mr8spa29Hr276M6F6n
	wGuKcfWA1yLZjfIOjfGln3h9B7LHdIHRCPZZ+JvuzEB1Db76vty0/W9dlVnid0u5ePV7GnuV5e2hM
	AKnYKahJadLvgex2aKuLtBZ5+OiKd6NnvxFwxtPz/BoceklGsHsDkXwKjFvKcMcOe7EWov8pBMWXS
	heKKQr4Q==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHGR2-000000004lY-0Elb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 08:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1792051418; x=1823587418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sEhQ8KBsekhw0zbOdanprd8DiArMJXCtOwTggfftcmc=;
  b=kW8eGdG7Pnuk6FhjkZpG8+8rFY+yNBg3gS92aPgUOY4vH096gDyuQhTU
   zcPoWzQ7SxSchx5g4zH1E+Rgi6CyB1DvurrfDP0RGRZJFBzqf6/iaPlXk
   MVL6GDeFE3BWMVqphwBgIX22uTHbqS8zd1NmnZISy+LbmwO80XRpBoDc2
   86SUV5QQ34qGiV9v1rAa1cl2Zlkwrb9GtkiSa5WY5rfrS6iYVuLTSBaph
   ZwkJsfr7zyMuvGuRO3ywIq1BDkKd0C046LffkPg3SatdXD72bT0ayRGu5
   XQ1npcBtkxOD96yb4J9RYknP8lrRwAMUofzXAl54QDcZqHJTQqVdg5BAS
   A==;
X-CSE-ConnectionGUID: Vay8vR0DQOiEN4pPhKguDg==
X-CSE-MsgGUID: wtEBimCOSSy+7cz24yqZ2g==
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="65077714"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 01:03:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Thu, 15 Oct 2026 01:03:25 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 15 Oct 2026 01:03:22 -0700
Date: Thu, 15 Oct 2026 10:03:21 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Paolo Abeni <pabeni@redhat.com>
CC: Jakub Kicinski <kuba@kernel.org>, Sagi Maimon <maimon.sagi@gmail.com>, Joe
 Damato <joe@dama.to>, <netdev@vger.kernel.org>,
	<radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<daniel@iogearbox.net>, <jacob.e.keller@intel.com>, <suraj.gupta2@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v3] net: axienet: free outstanding TX buffers in
 axienet_dma_bd_release()
Message-ID: <20261015080321.zefrpa6ylcbsk3uq@DEN-DL-M70577>
References: <20261004083759.1016519-1-maimon.sagi@gmail.com>
 <asQ1pF9AAqOiEo3r@devvm20253.cco0.facebook.com>
 <CAMuE1bGXcNwKKX1firkq6eEzymkrDOp8PnnowMzz97SibtpoSQ@mail.gmail.com>
 <20261006180210.03a15e52@kernel.org>
 <20261011084652.c5y3zj7wzmj53ur4@DEN-DL-M70577>
 <d832de5c-a01a-471d-b935-5ea00d1c5794@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d832de5c-a01a-471d-b935-5ea00d1c5794@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_090332_581265_B53DB98A 
X-CRM114-Status: GOOD (  24.18  )
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

> On 10/11/26 10:46, Daniel Machon wrote:
> > > On Tue, 6 Oct 2026 06:44:55 +0300 Sagi Maimon wrote:
> > > > Agreed on the helper.  As on v2, I kept the fix minimal for net, and
> > > > will send the helper to net-next once this has reached it, with both
> > > > axienet_dma_bd_release() and axienet_dma_err_handler() using it.
> > > 
> > > Let's do this now, trying to keep fixes small is a bit of
> > > an anti-pattern
> > 
> > Out of curiosity, why is that an anti-pattern?
> > 
> > I'd think that small fixes are, in general, easier to backport to stable. Is this
> > more of procedural question - if the whole fix gets into net, it will get merged
> > into net-next by the end of the week anyway?
> I'm answering here because I can only guess how scarefully long is
> Jakub's email backlog, and possibly this could get lost.

I appreciate that.

> 
> I think the key here is the context. This revision is incorrect because
> in order to be minimal intentionally adds a significant chunk of duplicate
> code, but such duplication must be avoided, the 'keep is small' is not a
> good argument to allow that.
> 
> I guess a one-line alternative implementing a different solution
> (if existing) could have been ok.
> 
> /P
> 

Thanks for the clarification.

/Daniel

