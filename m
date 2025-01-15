Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3390EC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkuohqVG+IvJc3quNTj2+aGrwlRPRoHWzyB5G/pyZzE=; b=mTwHJd7kdyZg24ocUO1ZiJLXr9
	MGelEqeUwAm8CtxCwdz08/RvqXT4t5FnAciJNw/PJZTO2BdApRkxv9h6dpPbqueXQ87dw6k1nE3k2
	L/cNc/nqiHozWJ5rRZrIaT5z/2HE3FUkEjcJLIktuu/0HbCwaBXs/If5ZDXzFig8AP/fJMjGkQfu+
	2eeqnmTHgSginoFtC0QK6bSbvszMXGnt8MtHrGoC1VAS6ikQ/oJKq7cBM4067Nj1V0T5CqYOWiFhR
	9mftqcMJPT7nVS9M07TYRFBVOjS77vnpZJccBzL+s1vm+YMXntWTJ9CjNgUnp23FHNSkNeGRsS3yJ
	bCAwGxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY66e-0000000CPgr-1Ozi;
	Wed, 15 Jan 2025 16:19:00 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY61Z-0000000COgG-38mR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:13:47 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6C3B525400DC;
	Wed, 15 Jan 2025 11:13:42 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 15 Jan 2025 11:13:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1736957622;
	 x=1737044022; bh=dkuohqVG+IvJc3quNTj2+aGrwlRPRoHWzyB5G/pyZzE=; b=
	ittFJ5JZET32icpjQvUOHKu1zt061kyx8AkR4Xy8nLPA6dH3kId6BIJBsyKc28ha
	gaVubIlTWIg8+A4WeBxR6+kMitEQz1fU3z/1RLpzN3sIPmWseYyPOPxvkIeEItub
	gq9OO0fAhQvz0OsMkvYxRgXtgRVCailygsdYy1UpASyXI6C/DVTmCzhvs0XLzDph
	+EKelDhcMoOAoJcIN0M+nuVvePM2NtIBDJ3GDb4dEa/LkQdo2oC1Ft7v9k1CVvyV
	Cy6LjxRctYoetZtzUx6QijR39+4A6Ua8w30oKXagBXJJ/7x/+ggRwfUezc7E5719
	1LYm2alYlgGGzyNdDLWgqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736957622; x=
	1737044022; bh=dkuohqVG+IvJc3quNTj2+aGrwlRPRoHWzyB5G/pyZzE=; b=M
	mqhH0YAct+mQhrEbpmY8vpzv7DcHLcHhisCUEIhTwY0EWX3f4sec/TA7knIS51Wp
	+PXkyiNBrK4xoGd4W9z/e/DVClRUbI3h+xCi72/cY5q/2tNc3mEy5VHN6blIol/8
	o6XUdJ46PffJjam/n8lg62CNDJTABvpayIZ5XHMnDgzGJoOfcGlEvmavZTqaaLkh
	wky23sGSueOKMxEvY+KUGTMjeWjZBc9ux1x6pA5mNmDHgTrJWmvT2+3VPizAvxBi
	lFEprD3yDnScIoHc/0hXac9+6VCVGlKNelHu68ithaJ6h0WpPrHC6uBPyFHSCLug
	6v4yMzhSws5VZGZoTR+Ug==
X-ME-Sender: <xms:tt6HZ8eA7pGASXWm0mFlJk1IliEcZT0FcovugJ1mX8Wwd6qKQplWQg>
    <xme:tt6HZ-O6qfvDWQ6Fs0iVFQv_DoHeAtOw4wfNunBgKn1lWazz_5FtCvUnQ5kkZGghk
    bJhhe_q5zBnz7f5XpE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsrhhunhgvthessggrhihlihgsrh
    gvrdgtohhmpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphht
    thhopehprdiirggsvghlsehpvghnghhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:tt6HZ9jc0L_IFxp5ExAnEd34lrX0CKuyw7GybZQXJ_dvELb0rrg0pA>
    <xmx:tt6HZx-EW34_rcrPVwEaE8bkLv_hV2ckN9xwNVq9h4l-6oup4hzwww>
    <xmx:tt6HZ4vfgvBUsk7ocybqJISTig-aM4-GOMhSvtgiRr9bdZkjxkgOrg>
    <xmx:tt6HZ4GsmhsqhzTaEhOtvJU4qKd_eyzqX9O5VoesiGjdOAWe1yFiCg>
    <xmx:tt6HZ6I0rNHc_hWOMNnvRWafG6Sw4ExGcnYJOxeqXHbbApBKh8oZ8JI8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E11272220072; Wed, 15 Jan 2025 11:13:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 15 Jan 2025 17:13:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Philipp Zabel" <p.zabel@pengutronix.de>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Jerome Brunet" <jbrunet@baylibre.com>
Message-Id: <d0e58f29-4e12-445f-b110-49dfbacf5b74@app.fastmail.com>
In-Reply-To: <20250113163648.1757178-1-p.zabel@pengutronix.de>
References: <20250113163648.1757178-1-p.zabel@pengutronix.de>
Subject: Re: [GIT PULL] Reset controller updates for v6.14
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_081346_493546_E065A4E3 
X-CRM114-Status: GOOD (  10.82  )
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

On Mon, Jan 13, 2025, at 17:36, Philipp Zabel wrote:
> Dear arm-soc maintainers,
>
> The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:
>
>   Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)
>
> are available in the Git repository at:

Hi Philipp,

I have no objections to the contents, but it would be good to
avoid the back-merge of rc3 into my current branch that
is based on -rc2.

I see that the two patches for the reset driver depend on
commit 5ae1a43486fb ("clk: amlogic: axg-audio: revert reset
implementation"), which went into rc3, and this was clearly
the reason for using that as the base.

Would it be possible to rebase your branch directly on that
5ae1a43486fb commit from upstream?

      Arnd

