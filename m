Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FF1CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 08:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ffBfXfkWnxBLysk65/GWI3ham98Fz2RAzunURzEpHM=; b=wE9ubskh+Mz635IzFTD8D1722N
	71ZrNivOaJZlUA44vL3i43uFt3g/ZWUbrsPLDRT6AdSomhdU4n/oNuNoT1PK/MwFL1e9zMT1CRZsR
	To1zC0oweNWWD/9UDvSwOSE07839CF55fRFQ9QlIK864Rgu4J0dvxg62yb5rdaaRkMJj0CuUmFVht
	8gyv1HbmxkVNLYH7UdW/CP6hKp4SFLN55Gp/+C5cB1n/ESKmWHNLj84wNL47W2tmPuf28aYxByVIs
	SIGuJ5jMkWN9R5PzFPfbXIaKbNPM0TDpeAr/mmt/h/8a2Ympk5sfpNGu5iOzT8ocn/LdRrC217zkh
	dUxT94wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoefd-0000000CpD7-34Gu;
	Wed, 20 Aug 2025 08:59:49 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodvS-0000000Cgk6-02aM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:12:07 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 183792CE348;
	Wed, 20 Aug 2025 10:11:55 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id XVIhD7bjm513; Wed, 20 Aug 2025 10:11:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A84F02CE374;
	Wed, 20 Aug 2025 10:11:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ObgVaPfNnbRa; Wed, 20 Aug 2025 10:11:54 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7C0032CE348;
	Wed, 20 Aug 2025 10:11:54 +0200 (CEST)
Date: Wed, 20 Aug 2025 10:11:54 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, 
	mhiramat <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	ardb@kernel.org, Eric Biggers <ebiggers@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, dave@vasilevsky.ca, 
	ruanjinjie@huawei.com, liuyuntao12@huawei.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel@vger.kernel.org, 
	Donglin Peng <pengdonglin@sangfor.com.cn>
Message-ID: <1672011332.146872.1755677514318.JavaMail.zimbra@nod.at>
In-Reply-To: <CACRpkdYYTe0YArbheo3msd6r+CNrt9oSZWNjkiwb=ZNWfJ1dkQ@mail.gmail.com>
References: <20250818103931.1100084-1-richard@nod.at> <CACRpkdYYTe0YArbheo3msd6r+CNrt9oSZWNjkiwb=ZNWfJ1dkQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: ftrace: Implement HAVE_FUNCTION_GRAPH_FREGS
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: ftrace: Implement HAVE_FUNCTION_GRAPH_FREGS
Thread-Index: CVXhU17DidlkWtQ6Ka0vacHBgIlQ2A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_011206_192002_40D7B4B9 
X-CRM114-Status: UNSURE (   6.66  )
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

----- Urspr=C3=BCngliche Mail -----
> Von: "Linus Walleij" <linus.walleij@linaro.org>
> Can you put this patch into Russell's patch tracker?
> https://www.armlinux.org.uk/developer/patches/

So far I had no success doing so.
Whenever I add the patch, I get back to the patch add form without
an error message or such.

Thanks,
//richard

