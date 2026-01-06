Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DE9CDC19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 13:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeGZplp5sgJdHRzpVFjYGFIWZjcUTG8nqX2p2zlQTQ4=; b=otCEPgR3NyNe0+IAM6GTf2gCGi
	Jei1vOmPYSPRtwVsBVZagP91u4Yhtl3se3xaSJ8hYX2rXWoq0PB0TLKN7aWMHzl2YQrCskndfiVxP
	oPXQniD869FJTI/cUwOkVCZ3z6pWxLxi2B86hdXo7pVPQolhCfalhbY2w4XatyCXVMZnbleageH1Z
	6d5A/3Dht9BxlOtHdjGKtEESJuXq/J4RSVfeaJ64r/xLBypU3784J7DVINMP22cSVPCk/rJB9Itqu
	RCXpiuW99TeJ47yYJb2jCB2V5GUfIjGyfEs+/J+Yq9xp5YOkWc06QS4NRpnYPS96/Tr7McjAImare
	l/ehZyeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7HD-0000000D72t-33iA;
	Tue, 06 Jan 2026 13:39:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7HC-0000000D72i-3FuW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 13:39:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA7FC6013D;
	Tue,  6 Jan 2026 13:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA68C116C6;
	Tue,  6 Jan 2026 13:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767706749;
	bh=vzhZy47WO9h/hidipeIZvSD1hWbqbVl3/wPi0/CNmjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oayL/TUMAzhEKXOUJ/hfA814KsaGfFTjsyIvPeuCq93vKHvPfd75A4vB+EL1zZrZq
	 2aRLgSyubyz1GIU1wNbcolrtcftrLXdOQ8NB7i2ObGKJpkw3TUOhwhTmkO5pxgbWez
	 GnNQWd2bekBpdQe8DHW1yP33HxRYV3TO45JNKgBxWBa8Oy7IqA9Is946LgC+v+dL60
	 6VlMFBVUmDkdIGwEWq/5kqup9Hfgz2R0KF7NBZkL6meXvvEmC88JTW23Y8Cl0xlFyy
	 iAWVFw1YGwJ3KJXumXemjZmA5ZldxjNd9tGeZscPjgDg/DMDrCZKK71lh4mQgsf2ZV
	 Zr/aGCopMDRsQ==
Date: Tue, 6 Jan 2026 13:39:03 +0000
From: Will Deacon <will@kernel.org>
To: "Kazuhiro Abe (Fujitsu)" <fj1078ii@fujitsu.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Koichi Okuno (Fujitsu)" <fj2767dz@fujitsu.com>,
	"kernel-team@android.com" <kernel-team@android.com>
Subject: Re: [PATCH v5] ACPI: AGDI: Add interrupt signaling mode support
Message-ID: <aV0Qd3k-MXVJXlP5@willie-the-truck>
References: <20251222065359.27330-1-fj1078ii@aa.jp.fujitsu.com>
 <176764598538.1443384.12447831892240359560.b4-ty@kernel.org>
 <OSCPR01MB16310961C8744194C94C51CAED587A@OSCPR01MB16310.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSCPR01MB16310961C8744194C94C51CAED587A@OSCPR01MB16310.jpnprd01.prod.outlook.com>
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

On Tue, Jan 06, 2026 at 07:29:58AM +0000, Kazuhiro Abe (Fujitsu) wrote:
> > > AGDI has two types of signaling modes: SDEI and interrupt.
> > > Currently, the AGDI driver only supports SDEI.
> > > Therefore, add support for interrupt signaling mode.
> > > The interrupt vector is retrieved from the AGDI table, and call panic
> > > function when an interrupt occurs.
> > >
> > >
> > > [...]
> > 
> > Applied to arm64 (for-next/acpi), thanks!
> > 
> > [1/1] ACPI: AGDI: Add interrupt signaling mode support
> >       https://git.kernel.org/arm64/c/9296d4fd190f
> 
> Thank you for applying the patch.
> 
> I apologize, but there was a mistake in the v5 patch I submitted.
> I mistakenly sent an older version (v1) instead of the intended v4.
> 
> Could you please revert commit "9296d4fd190f in for-next/acpi" ?
> I will properly prepare and resubmit the correct v6 patch, which contains
> the intended changes from v4, as soon as possible.
> 
> Thank you for your understanding and cooperation.

Not at all, thanks for letting me know. I can just rewind HEAD on
for-next/acpi. I look forward to v6!

Will

