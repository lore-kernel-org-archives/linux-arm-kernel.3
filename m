Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D4BCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 23:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXhmwOV3O8Q6o4UYPr9w+mru4KH2RsvYZ0kT2vDaaU0=; b=mTYV9nWekGM2Y/e3NMMV3jqmT0
	+RIZt/prAC6qbJ3cu8Gn9UBwWywV12PY/XtEvogUpqA8RY4GBDV1oA0J2dfwnvnmEx2tFTg3O+ksw
	U8MkcHRUX6fpujapC/EP+E/IiuD2LjYzg3WGyTiY+mrffY6uytJsQsQtUoZ6q28nY51KLMzrrGR0/
	6FxoakhLFOdipHF4VLW8p3Rsp+r6w8mGgAkYDxREFm8C2j38toqlRGBgS7XxRmH87by/45IrwKEEZ
	/C9GmGGkj8tWhiZtO5FmmgeyYWAgWBs9cdU8w5CAn2E7TE5+pbXKjdPXr6xqA29bxVt4TiTGLbQxB
	EH7ssdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLUWR-00000007jji-0Fj1;
	Fri, 08 May 2026 23:22:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLUWO-00000007jjF-3k7t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 23:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34EF54435E;
	Fri,  8 May 2026 23:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DAAAC2BCB0;
	Fri,  8 May 2026 23:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778282535;
	bh=2AevTr3shap19RUwMMlENTSD4YYHTePzbIvM0R5o1lo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U006x1Qi5eQV8i9yrksMub0wobOaVX5RjUJq+keDQ64c+l16x5WSvWiE4KFcC/+vJ
	 roHBlJI3OkPAJJA39d2ejeHLi0IISw5fbcqZccAwDh7PRzjRDwWyeENAZvGeaMsclr
	 RPDbwOtvr6Wv2cyXplNKOlJw1UdcYSp88opgx/WQ+rpBrJ9uJSiXthYLwMtnqzR3RU
	 OCBYCis4bgVvbE1Pufq5fptFH6tEj1GmoT2/x/dMCB0lwB94aDGGR/mwMnWbWO0Ddb
	 vKU6yPeBieS4Y1flyyZjEQ8dztxlSJwdSabxUL/iJqKYO6aic98zhe8C4Kdb7VGmsM
	 J/SLZDHVmTz6w==
Date: Fri, 8 May 2026 16:22:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
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
Message-ID: <20260508162213.6b755d8c@kernel.org>
In-Reply-To: <20260507184714.joyobsh6ydjzrkc4@DEN-DL-M70577.microsemi.net>
References: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
	<20260506-misc-fixes-sparx5-lan969x-v2-1-fb236aa96908@microchip.com>
	<20260507090810.53e66ef6@kernel.org>
	<20260507184714.joyobsh6ydjzrkc4@DEN-DL-M70577.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_162216_954153_803EB2E4 
X-CRM114-Status: GOOD (  22.30  )
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

On Thu, 7 May 2026 20:47:14 +0200 Daniel Machon wrote:
> > On Wed, 6 May 2026 09:25:36 +0200 Daniel Machon wrote:  
> > > Move the debugfs setup into a new sparx5_debugfs() helper in
> > > sparx5_debugfs.c, invoked after sparx5_register_notifier_blocks()
> > > succeeds so the netdev names are finalized. sparx5_vcap_init() now
> > > only deals with VCAP state. The sparx5/ debugfs root is created in
> > > the new helper as well.  
> > 
> > netdev names are never final :( User can change them at any time.
> > The best practice is to name the debugfs file by some stable hw-related
> > property, bus, port number etc.  
> 
> Right, but they are finalized in the sense that we have a name we can use for the
> debugfs files (which we dont pre-patch).
> 
> Hmm. I think this patch fixes an actual issue, where you cannot query the
> debugfs files, because a previous patch broke the ordering. I agree that the
> names chosen (netdev_name()) for the files were poor, but is that really a fix
> for this series? Should that not be adressed in a future patch for net-next (it
> involves changing an VCAP API function that is not only used by Sparx5/lan969x,
> but also lan966x.).

Dunno, if we are aiming to switch to a different naming scheme we can
just do it now, I reckon. It will not make the fix much longer.
And presumably it will alleviate the need to reshuffle the ordering.

