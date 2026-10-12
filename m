Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5F6CC6B1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iquteC2WLun4rL54eIEjgx3C2ts8WjjltRIkjPLgyLc=; b=QsYw4cIp0dmA7zgI1RQ8pWt9RB
	rPUySRsjln7iobTpkfk/9lLzCJTW3AZVGpKhPykweqH0bvYTObEckXOHb2GQTaSrbNY5gcm15DRaO
	ya4Wat8eFaJhos/4VMFVVWUhQ6nR/0cNpb3e9ni+UwyHGEq/Yl4yXsCe6nHssqLHFY1lPv83IDsEG
	+PBSZGjUNH7x9nm/x+hnXBicA7VFXQjy9YsBztEze+gN0/18nzxmSwk2L1vwTPcBWag/FfrAaM+zw
	ftnsqWPZ3KS8PsT2xMkgsUGGQ9U+Wj8qJ+rMVCVswvAtp7oymQvkaNNWS+xJWkE8R6DkHM0oDoNFJ
	OBBwREfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgfu-0000000DlMa-3Yw0;
	Tue, 13 Oct 2026 17:52:30 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgeb-0000000Dl9P-0sgu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:51:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B29A94E4120F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 17:51:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8678B60362
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 17:51:07 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 2A94111D7183A; Tue, 13 Oct 2026 19:49:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iquteC2WLun4rL54eIEjgx3C2ts8WjjltRIkjPLgyLc=;
	b=VzUzDVuDR6cPJuabPGWIQ2Pg8tkK8yn66oIMM/2YbstbQl2PVpyjR4fwGdb2mIN7gpgeBd
	EFHr5gBIBNuTtQ9tyjlHEaoIluXtP4pR2TTzHpMUgTTSw1lW3zY2Qv5hGms6UXBl4c71yq
	jcUe5R12jC3j+xIj0Hy2MflS1ghbdH5x1pl0XvZY1ncaKXu951peakE5x/ogwTw496oXBz
	ENvF8Ow2mZndkD7Lb2BYE/QXg0LwnMWDhOgSFcPgd8w4JKpy5hdiQ9dnYDv/Ukk3T3TGsM
	VDJEQVxgrUReaNItCXRGJkKMNJBuDAwMgZBbr+d+W8I4TkXvi0TA2q6klZjpiA==
Authentication-Results: mail.galae.net;
	none
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Masahiro Yamada
 <yamada.masahiro@socionext.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  Brian Norris <computersforpeace@gmail.com>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v6 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
	(James Hilliard's message of "Mon, 14 Sep 2026 15:09:46 -0600")
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 10:06:50 +0200
Message-ID: <871p9v4a1x.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hUm30DN6Lpz6
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 2A94111D7183A
X-Spamd-Result: default: False [0.58 / 30.00];
	BAYES_HAM(-1.82)[87.08%];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[33];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	BCC(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[bootlin.com:mid,localhost:rdns,localhost:helo];
	FREEMAIL_CC(0.00)[nod.at,ti.com,kernel.org,gmail.com,sholland.org,bootlin.com,socionext.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105109_835974_BF9F8C84 
X-CRM114-Status: GOOD (  15.08  )
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

Hi James,

On 14/09/2026 at 15:09:46 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> Allwinner NAND firmware leaves the bad-block marker in the randomizer
> data stream. On H6/H616 it also places all protected user data before the
> first ECC step. These choices differ from the mainline format, which
> keeps the physical marker plain and maximizes the H6/H616 user-data area.

[...]

> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

I am sorry but I do not want to proceed further with this series.

Even though I am not capable of finger pointing what is wrong in the
diffs nor in the commit logs, I do not understand most of it. I cannot
clearly explain why, but I have had a hard time trying to understand
what the commits were doing. The risk is that nobody would then be able
to further maintain this driver and I am not willing to take that
option. The kernel policy so far has been to ensure readability and
maintainability, and my gut feeling is that this series is going
sideways wrt this major constraint.

Also, from a Linux kernel point of view, we generally just do not
support vendor specific layouts. I already told so Richard Genoud back
when he was working on H616.

With this added to the pile, I prefer not to merge the entire series. I
can still take some of the fixes if you feel like they would be relevant
anyway. In which case I invite you to send a v7 with just the few fixes
you think are actually relevant outside of the randomized layout
support.

Thank you for your understanding,
Miqu=C3=A8l

