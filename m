Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00F2FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 18:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEso03AEGLwruWvXRN28p8qd5Yq2cVSCpKmWTTxzbw4=; b=SPKiUsEzTJzfP7WKxFlFmG3CLA
	cszPWkJHUnVibtzhM0mlI1ang+SuP1QU9n1z1ImfzLKltRBctFYuSNQEti+4vqWFIaexNkSkh5I5T
	OzxPeCMhHwoMCSDdkvqvuabEPgR1xMQuIq06ZuxQvAvpsCAWw1pIKR7b7Ln+Znx0pDddwwpLJmEZG
	at0luVduzviMFEL0Bl0sM20z9DJWru4doPn8a3J00fWCUWj/iovT0pQnRtuvg1GpuEusbgT56me6s
	gAgURrJKwGRV/TLPINQSwD7C8NBVkRrOzLWhzOiEiDpRRBMtkENjAUPPVP5q2eV1/6YK92byStsz7
	7/96z6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKrR-0000000HDsA-39df;
	Tue, 05 May 2026 18:51:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKrP-0000000HDrd-4BNH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 18:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778007071; x=1809543071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VDJOXjgjZEbpeB4zDJMcjcuhMeExkg7wy+dT+dQlbbQ=;
  b=da0Gs1w3f5NIvY6n2v3pemnyiqpdM23rvlFXzfDyvHonBWHWXLOPKEoe
   Q803pGCtlXQJ3pIark+SgsBSWlDIVjV7YNl1dhr89MydAMayIpWp3nniL
   kb3v6SafGf40XrwJdgsjzSr0UeMsdnfdA+Nkb3r/BNeWnLhDKqky0FKqk
   0TOAIlRH4XPzSe+SgRIsiHCsD3bv9scBR6f80LG7SJfT90mNLtLqfPgCX
   vuXc1E/H22b9KfhzNoPWc/WlpcLHVCyXMVuP6oBWm3sd0rlB4ag7bGBIW
   9eEmcxbzhCPIMeIm3tx3f7dIQnIDZPVgt0aHHT5qaHticLM/FuPH3uqCM
   g==;
X-CSE-ConnectionGUID: rdJ3Lq+USdyRShk3O56huA==
X-CSE-MsgGUID: 8Vitu6v3QSSCz52QCXNVpw==
X-IronPort-AV: E=Sophos;i="6.23,218,1770620400"; 
   d="scan'208";a="56297656"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 May 2026 11:51:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 5 May 2026 11:51:08 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 5 May 2026 11:51:05 -0700
Date: Tue, 5 May 2026 20:51:05 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, Bjarni Jonasson
	<bjarni.jonasson@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH net 2/4] net: sparx5: fix sleep in atomic context in MAC
 table access
Message-ID: <20260505185105.c7bcupjgm64vcrhy@DEN-DL-M70577.microsemi.net>
References: <20260504-misc-fixes-sparx5-lan969x-v1-0-6604306b5743@microchip.com>
 <20260504-misc-fixes-sparx5-lan969x-v1-2-6604306b5743@microchip.com>
 <20260504165258.30b81158@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260504165258.30b81158@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_115112_311443_A812CE44 
X-CRM114-Status: GOOD (  11.23  )
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

> On Mon, 4 May 2026 16:43:43 +0200 Daniel Machon wrote:
> > sparx5_mact_learn() is called from .ndo_set_rx_mode with
> > netif_addr_lock_bh held, but takes sparx5->lock which is a mutex.
> > A mutex may block, which is not allowed from atomic context.
> 
> Could you try to switch to the recently added ndo_set_rx_mode_async?
> We added it exactly because most drivers have to sleep / wait for FW
> to do something.

Interesting. That should get rid of the spinlock and readx_poll_timeout_atomic
conversions. I will try it out. Thanks.

/Daniel

