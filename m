Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAABCA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 03:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONIfixNSBed8y1//bhXBif3hMWFst2m9Ve4WEzHasQI=; b=POd6OW0UUYMY/gUqRuk0UmUWl+
	3w7v6aGz7cQaLaDFdrS0Qmsyle78vD7JsIEgt+Odf1kSSmXsHwM+0sx5C4tdrZI0QtNHd9X8WcJ0i
	KH3KhCWpUe0+fcmMsUUNDE/y3sh3nqSDboKrXCeq2/i4Eyewu052HxB9dC4L7/edDVJDIMVukTt60
	aLfIrO6Lky+kcPwBPGmnLsLk7fIeSUKtzroY+TJJB0dG+vqbzGupZtAdzt7JbTi6AsEMdqJAJV2cQ
	vkQ1EgPVyyAHvvJs9xb3Gzck0KLG91hMBigB5I/+BJZD9+o0oTtX9Ms8G1AQVdolUhfSTL4f1fpGR
	8vGgH8zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viPF1-00000004qt8-1xby;
	Wed, 21 Jan 2026 03:50:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viPF0-00000004qsU-2HVo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 03:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 992EA60125;
	Wed, 21 Jan 2026 03:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436E1C116D0;
	Wed, 21 Jan 2026 03:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768967445;
	bh=ONIfixNSBed8y1//bhXBif3hMWFst2m9Ve4WEzHasQI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UocT9g05QmC669Vqn4jP22CvNPvxULzb8QwHvuVBqtICWTTwbZCZy6EM9fGLaj107
	 Vrv7gB3Yek29Wh4LLZ0yvB/XWvehUE3cuHl4MVDXtyW8pYXyr6Xvf9Ja1mCU58+fdt
	 kCjwteBJqieD6mrFZiItnxnaDNEMnTHYcdqLfOsxJ9up9nm1kfI3GiffprHS73U5SM
	 AbhsqLB1PTJgBpUCNbkpsh9ngDiOTdy+n5cQM0N/2+9EaSofgEUStbObut4BppjxDQ
	 3B0KxguUWCxbgoFH/pjMSez1KS5uhtzhzYq/+zINa+taivVOkpyVgHxIoxckIoi2v8
	 fNZJYdBv7jg3g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260116192725.972966-2-suraj.gupta2@amd.com>
References: <20260116192725.972966-1-suraj.gupta2@amd.com> <20260116192725.972966-2-suraj.gupta2@amd.com>
Subject: Re: [PATCH V3 1/2] clk: Add devm_clk_bulk_get_optional_enable() helper
From: Stephen Boyd <sboyd@kernel.org>
Cc: sean.anderson@linux.dev, linux@armlinux.org.uk, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bmasney@redhat.com
To: Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, michal.simek@amd.com, mturquette@baylibre.com, pabeni@redhat.com, radhey.shyam.pandey@amd.com
Date: Tue, 20 Jan 2026 20:50:43 -0700
Message-ID: <176896744341.4027.4548470924295153506@lazor>
User-Agent: alot/0.11
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

Quoting Suraj Gupta (2026-01-16 12:27:23)
> Add a new managed clock framework helper function that combines getting
> optional bulk clocks and enabling them in a single operation.
>=20
> The devm_clk_bulk_get_optional_enable() function simplifies the common
> pattern where drivers need to get optional bulk clocks, prepare and enable
> them, and have them automatically disabled/unprepared and freed when the
> device is unbound.
>=20
> This new API follows the established pattern of
> devm_clk_bulk_get_all_enabled() and reduces boilerplate code in drivers
> that manage multiple optional clocks.
>=20
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

