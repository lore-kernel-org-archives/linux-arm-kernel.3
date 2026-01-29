Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793AED46C01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 02:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KY3FuAaO7jk+J7ntke3xNfca9dezrklOhRP0dI2G3nI=; b=eKbFdpYhHQjnxEUu4Rhif3p7ya
	iSArMMaOHBNAkveM8O+2roYWPdvLgRWnyO6yshNWHQhpPAO0xUlWPhz8ZduSud4GDat499lqzIUcJ
	3ph/+3Mmbe3/0jYuxR48kxiW4YNUtWyIwPEl8/MCzQXUXjTnI8dz6paocDmngl4oEX9mgRbiWS+bf
	ei2yAU10Krc0Ii4scUAeGHGHhgLSLjl4vy+gV93omrEtglHX5Iouxg0UAv+ea3AuMYco2a929hUZR
	CvFklX58hvUisv8v4HBk/2E7RiiLQcFjCWvKeFgwLSIuDxlexYIq57eq7ZLwcKfGqvmeTFjgAPjZA
	wD45kpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHPI-0000000H64S-36UC;
	Thu, 29 Jan 2026 02:05:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHPB-0000000H644-3ajv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 02:05:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66BC5438D1;
	Thu, 29 Jan 2026 02:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2EEC4CEF1;
	Thu, 29 Jan 2026 02:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769652308;
	bh=KY3FuAaO7jk+J7ntke3xNfca9dezrklOhRP0dI2G3nI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kBTBWiC8RkwGjdhpKB1/gTBfD23akxEgAZuJJNmDNRSdIF8oj5apFGYIlvWpRo1c0
	 rhzTEfUMblXtP5uvG7buE08wa/ASToQ4TQjvS7rCOBGwmhs3IhlOcvVVpGgz1kZh+W
	 Sk09UIF1F9Z30PsitKwIZmAGKY5FtCnTh8M7SxUMu/NSgu7ozOTNf5dTy5YN2iyg2T
	 qPUvMHAOzeR0kxQjUWPiWHtuUJ+tsid7qO2RzkkkpYvT5+0F5Sk1MGTyTjtlatZ4zW
	 GMY540XJXZDNA60P4ANKfdpWs0piro9jU8LqM3vJu1/M4u5T+bulKBJ+l9QWR9ZpZq
	 BDPpdkIjXvHCw==
Date: Wed, 28 Jan 2026 18:05:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
Cc: festevam@gmail.com, linux-arm-kernel@lists.infradead.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, horms@kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, wahrenst@gmx.net,
 pabeni@redhat.com, davem@davemloft.net, netdev@vger.kernel.org,
 richardcochran@gmail.com, edumazet@google.com, andrew+netdev@lunn.ch,
 robh@kernel.org, krzk+dt@kernel.org, andrew@lunn.ch
Subject: Re: [net-next,v20,4/7] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20260128180506.742f20d9@kernel.org>
In-Reply-To: <20260128225533.39665c74@wsk>
References: <20260126103400.1683125-5-lukasz.majewski@mailbox.org>
	<20260128022558.4151582-1-kuba@kernel.org>
	<20260128225533.39665c74@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_180509_938480_BB72BCED 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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

On Wed, 28 Jan 2026 22:55:33 +0100 =C5=81ukasz Majewski wrote:
> > Would it make sense to merge these two patches together, or at minimum
> > have a note in the commit message explaining the dependency?
>=20
> @Jakub - If possible I would keep things as they are now.

Not ideal, but okay, we can leave it as is.

