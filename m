Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD102E9A757
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CC9seZVTC2RW0MreCmcdPM1JK1NcNqisbM0P3bcEO7M=; b=ZlCZ5vti4lvSsTI0ejwwpZhFIV
	OxtFlwzvYSq7eSH9Sdfqow/iObCQAieq702XwCNlwvMHxocLK19pHTdE8KJtZL3cMQtL8mB+ace0P
	IVb/wzeUre1zl4dwDj31erldyEvxwusDgVgqn2Kzpq8Irtz+kfhyiOHtvvSbv3/9bKMmErQQrE/I7
	DgZd7WDQo38O0VhLeBm/VSbFsZb2Rec4fBYxRSHiZKtxQZvV9DJtALNQHbmWiGkUcg7/WyqmJCoxx
	lB/xE8mFqeQ0XhzkRpBUkY3r8OiM1s4/dtYvW8Uuer8JuLsp9ZB1JUQ7CyhGqtbZFsA5Y8+TD1ajb
	gMM6b0Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yUM-000000019Pj-1dIs;
	Tue, 24 Mar 2026 09:55:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yUK-000000019Oo-3Es7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Mar 2026 09:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=CC9seZVTC2RW0MreCmcdPM1JK1NcNqisbM0P3bcEO7M=; b=V9HFGZIwXhX0lVW3TSfLksqntF
	vcxTz9rb1xM2auAXVE6r9/NNE23+bgN623DCtp1iMLnMy8P6Kkm4dvm+CwIHBRqJ5zuSFVWv/NbYA
	xOq+Z9rP7SlQYVH5AZzxK98bdxJfEQpiivFOgxQy+0s9E879Vj/USOPnanNMTgBq+aVlqmxsKuc/U
	sXSLc8NcWyu0PR9fywT2kxLMtLgti8D352gId+/2aOZkTwkpY5CGmpLmDFdRGK26iGWFNkxBQa68E
	N44morvIoZu6BSFOJYvxTmD25iLxpRvL9qWBqFrR9OVnxysXSahMiFlXJZFaYA3+fX77f3vOjIXWw
	LApfP4Qw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yUG-0000000DoJE-3l66
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:55:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w4yUG-0000CX-3N; Tue, 24 Mar 2026 10:55:48 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w4yUF-001sMU-2w;
	Tue, 24 Mar 2026 10:55:47 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w4yUF-000000003T0-3Zm9;
	Tue, 24 Mar 2026 10:55:47 +0100
Message-ID: <39b18202a275168eb4344a2515f7c18723eaf8b0.camel@pengutronix.de>
Subject: Re: [GIT PULL] Reset controller fixes for v7.0, part 2
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Tue, 24 Mar 2026 10:55:47 +0100
In-Reply-To: <20260324094255.3538772-1-p.zabel@pengutronix.de>
References: <20260324094255.3538772-1-p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_095548_958637_BCE17D41 
X-CRM114-Status: GOOD (  10.09  )
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

On Di, 2026-03-24 at 10:42 +0100, Philipp Zabel wrote:
> Dear arm-soc maintainers,
>=20
> The following changes since commit e0cf84109bc6c6768337123f1de24ff56b41c9=
1b:
>=20
>   reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before using it (2026-0=
2-23 17:03:28 +0100)
>=20
> are available in the Git repository at:
>=20
>   https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v7.0-=
2
>=20
> for you to fetch changes up to a0e0c2f8c5f32b675f58e25a9338283cedb5ad2b:
>=20
>   reset: spacemit: k3: Decouple composite reset lines (2026-03-23 12:25:4=
7 +0100)
>=20
> ----------------------------------------------------------------
> Reset controller fixes for v7.0, part 2
>=20
> * Decouple spacemit K3 reset lines that were incorrectly coupled
>   together as one, but are in fact separate resets in hardware.

It is important that this makes v7.0, as it fixes an incorrect binding
that has not been part of a release and which has no users yet.

> * Fix a double free in the reset_add_gpio_aux_device() error path.
>   This has already been fixed on reset/next by commit a9b95ce36de4
>   ("reset: gpio: add a devlink between reset-gpio and its consumer").

Because of this, commit fbffb8c7c7bb ("reset: gpio: fix double free in
reset_add_gpio_aux_device() error path") introduces a merge conflict
with reset/next:

  https://lore.kernel.org/all/acFRVzvV9Dww47v_@sirena.org.uk/

Should I resolve this myself by merging this tag in to reset/next as
well, before submitting reset updates for v7.1?

regards
Philipp

