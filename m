Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D796C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 23:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4vyWk3reiE07secgDDnsAhYfN69/dzogtDPEgwwIbQ=; b=YoYSdkDm4MHKLJR/w786K9gz5q
	dVw0iaCYQtF8G6TnSUCE1JtYqdYVqODzwTnhxRWNNhK2LoImMAytcMcydSUTEFOY3TLih5BOO76qG
	c0oS7DZWyglG/FAjDJz/FpHnVOodnttFF3zAG45Vd5n2rpLLOWuanENFM9fJ52c3RNoG30dO1LP+f
	atSrAOdLWo9KTaONpJccafI3p3kJGgciWNtziZSMqdSfOLgodjJTmRIxHMapEgXvflYn5irHq+JIb
	m99+UQ6O492iaiDFUEcrwiK97P0AHGTIMhxCUq6lVZ9CsWaBthutjNxxfzvj5558Z3zwSEVyDoCJ9
	vMrpCSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhRb-0000000Fr3k-1yoX;
	Fri, 07 Mar 2025 23:49:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhHF-0000000Fpi8-3Fac;
	Fri, 07 Mar 2025 23:38:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5B503A45071;
	Fri,  7 Mar 2025 23:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D7BC4CED1;
	Fri,  7 Mar 2025 23:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741390728;
	bh=P4vyWk3reiE07secgDDnsAhYfN69/dzogtDPEgwwIbQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XysOcXqCwMhS/vjHd/vkus1NSBXvMx+V20sF2wi+4D/DHzvdTO5N8cLEgm4REpjkc
	 zszDsIMRor4cnRLho6jBpvF22DJex74YlJEan3P0ygsToJOndi4aAk7Ly1GvYj/fOi
	 RBy4GV/oU2xKuxl0WCsiVtVfuTXtAdo0IpF5RqqymSYj4Va/7za+OMeBX8yu6Vf77U
	 e1B/xP7+KaGYVx6dG576dsR5Ri5UjTOvY0ZiqSkSlE4BK1jTFdYULIQDwEe4lLKDT7
	 aINNGQE45jl1Kj91ObuWnVv3B0T7yJ2lkMrLT1o0Y97L5Il4qJw0ofDIVrmto0tl24
	 8/lypsITcWvnw==
Message-ID: <8e6c0123099039c2f69715f57ef7ba42.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250307-vsprintf-pcn-v1-2-df0b2ccf610f@bootlin.com>
References: <20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com> <20250307-vsprintf-pcn-v1-2-df0b2ccf610f@bootlin.com>
Subject: Re: [PATCH 2/2] vsprintf: remove redundant and unused %pCn format specifier
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Lukasz Luba <lukasz.luba@arm.com>, Petr Mladek <pmladek@suse.com>, Rafael J. Wysocki <rafael@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Zhang Rui <rui.zhang@intel.com>
Date: Fri, 07 Mar 2025 15:38:46 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_153849_899033_9C704AF1 
X-CRM114-Status: GOOD (  11.21  )
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

Quoting Luca Ceresoli (2025-03-07 03:19:08)
> %pC and %pCn print the same string, and commit 900cca294425 ("lib/vsprint=
f:
> add %pC{,n,r} format specifiers for clocks") introducing them does not
> clarify any intended difference. It can be assumed %pC is a default for
> %pCn as some other specifiers do, but not all are consistent with this
> policy. Moreover there is now no other suffix other than 'n', which makes=
 a
> default not really useful.
>=20
> All users in the kernel were using %pC except for one which has been
> converted. So now remove %pCn and all the unnecessary extra code and
> documentation.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

