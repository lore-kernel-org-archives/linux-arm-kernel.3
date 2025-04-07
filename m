Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8E6C36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXJpfmhZ+8yM3mjrwdmbYrVV3J33ZSlFaLXrj0slIbA=; b=xxEMv+FdSCkYfGZnV+J+yxuDyV
	8G4QDiq2Kmqk5F7mldUO4k8ahMQ4n5aneR9KMpHojJr+dL9Wn1wqP8U5bfVj0r2XWiotMGfSlKHfl
	4iPzPGwMaTLVSGK1SqVcb5qmL3LQJBKEJCZVwh8IkgIw63JAYjVrMPDm2HQQAcHueWPSiG4uVdcxb
	AbBJ1rOLM69Zrx4+UEq+hYJ6umeGaAxwkHPGhR3d1PKqdDhVYtOmoXaBaTEl0UvBBR7tKlKaoqsrO
	P3GmbMCKZ58Jj6t3At03KCIbPTEuKUGP1UU6cLwx6xRWpHsuaDJP9Ry+W1mD34BbbZW08YCC1yXud
	zFEU+rpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYQ-00000001cvO-07El;
	Mon, 07 Apr 2025 18:50:42 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pcc-00000001GkL-35TG;
	Mon, 07 Apr 2025 16:46:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 910F543137;
	Mon,  7 Apr 2025 16:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744044412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXJpfmhZ+8yM3mjrwdmbYrVV3J33ZSlFaLXrj0slIbA=;
	b=Nuh6OFc3/kXzo6DFhHDNjBix1k6eSZDM8GdsMsXmsU0V3T4vccLEgUCC4EgQeWaqxdDd+m
	6iDycLP0ZRwOMlRdIP55ClDsYY3RRZggJjGc57Tbk0t12a7NIkAiyOyEKWjVYYGcYtB8cY
	LSF3wv/M4lhju7DTiyJXQ8Vfvi1s2OBuTch5r0lwm/s2X3bqq+j8hq+NI1nantxL2od+tP
	b5oVECDGuEQqoTNn/1N8Bm58s4JuR7NFVdrwxCIpRF2xGRCvUw2WN9uKmJ98U/NeGEgPJo
	E8lKL1tTsWOpYcW6n8W0UST7oX+rytoqLVzC9dA4uDFH/LG6/2QHCJ7BxnoDoA==
Date: Mon, 7 Apr 2025 18:46:47 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Petr Mladek <pmladek@suse.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Steven Rostedt
 <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Binbin Zhou <zhoubinbin@loongson.cn>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Liu Ying <victor.liu@nxp.com>,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] vsprintf: remove redundant and unused %pCn
 format specifier
Message-ID: <20250407184647.3b72de47@booty>
In-Reply-To: <Z9BKW_06nLAOzYfY@pathway.suse.cz>
References: <20250311-vsprintf-pcn-v2-0-0af40fc7dee4@bootlin.com>
	<20250311-vsprintf-pcn-v2-2-0af40fc7dee4@bootlin.com>
	<Z9BKW_06nLAOzYfY@pathway.suse.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtjeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdelpdhrtghpthhtohepphhmlhgruggvkhesshhushgvrdgtohhmpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghrohdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtoheprhhuihdriihhrghnghesihhnthgvlhdrtghomhdprhgtphhtthhopehluhhkrghsiidrlhhusggrsegrrhhmrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehrjhhuihessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepshgsrhgrnhguvghnsegsrhhorggutghomhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_094655_079892_FF327DDD 
X-CRM114-Status: GOOD (  19.32  )
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

Hello Petr, Daniel,

On Tue, 11 Mar 2025 15:36:11 +0100
Petr Mladek <pmladek@suse.com> wrote:

> On Tue 2025-03-11 10:21:23, Luca Ceresoli wrote:
> > %pC and %pCn print the same string, and commit 900cca294425 ("lib/vsprintf:
> > add %pC{,n,r} format specifiers for clocks") introducing them does not
> > clarify any intended difference. It can be assumed %pC is a default for
> > %pCn as some other specifiers do, but not all are consistent with this
> > policy. Moreover there is now no other suffix other than 'n', which makes a
> > default not really useful.
> > 
> > All users in the kernel were using %pC except for one which has been
> > converted. So now remove %pCn and all the unnecessary extra code and
> > documentation.
> > 
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> 
> Makes sense. Looks and works well, so:
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Tested-by: Petr Mladek <pmladek@suse.com>
> 
> Daniel, if I get it correctly, you have already taken the 1st patch.
> Would you mind to take also this patch using the same tree, please?
> Otherwise, we would need to coordinate pull requests in the upcoming
> merge window ;-)

I see none of these two patches in linux-next.

Anything I should do? Resend? Or just wait a bit more?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

