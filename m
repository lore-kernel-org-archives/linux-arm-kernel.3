Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA16D41C1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 10:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ldeNS+K34xk+eAQDuDkOR1GFZlD8zB31Exc6VT8WK0=; b=xW9Y9JDiccCKQ4xM74UaCgfjlk
	4Kddnq6eFlLNpYYukTB3ImpwOzPSejAWWhkvtQDaXZnH4gEHiJ38+YA7PXCCmScTPv/ujenX8z5y9
	O/olqHb44hGJDLk02P+6kxgBhUYib6BhjXjtQT0JbX5hAkpSk6xV+uLlJfUzdW1RDCRNdsLmRHiNe
	hTi/Z6lXHhKI9LKSEilugM2cuVMfhA8LhWETuTDB5xw0H5HYKnmPhQsd7yyr9UM1Zv9DP7Y7I37PL
	xg/DHUjp9rTml7rakpvG3UBL+fSSbBe+goZEyG4KOxWQCgyygUMo7M8Kno1L3qBkaXjdEDjkwzWEQ
	N7ih2NQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTe9F-0000000GUZQ-3ga7;
	Thu, 11 Dec 2025 10:43:49 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTe9B-0000000GUYy-2tpF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 10:43:47 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 83B5F1FBCE;
	Thu, 11 Dec 2025 11:43:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765449817;
	bh=+ldeNS+K34xk+eAQDuDkOR1GFZlD8zB31Exc6VT8WK0=; h=From:To:Subject;
	b=S+DYN9/xavbmaxZgeiBZsV8CZh7ugeYRqPekJ6sbSaPxcT/GfPxOrAl0BLwoiKwmh
	 L4FBA06QDAybzFSZzQar7oUBjJCxg6e+OzVVu4WU6j7p32Ph9DBV0cBr6+PZOKkwUk
	 xjxaP/rDM08135OYwExO/GHKNlP8NWJow6XmPCsrEHeyCXjXtwiqcOWs+Yk8V+gja1
	 sY1kv0VyfDcN0rMN+1a8RxdY0JNitEZptzbEAJGzWVxt0QXAeBH08s0JUKP8VXzKuZ
	 4yjz3mq0Xpf+x9uu7nAUKQxIdu+qZ8vXXtMpYdmI/R89UXxEPyuw2crqa5E7Fel41d
	 gNsQ6zL+7ofrQ==
Date: Thu, 11 Dec 2025 11:43:32 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <frank.li@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	"Ivan T. Ivanov" <iivanov@suse.de>,
	Jason Liu <jason.hui.liu@nxp.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2] arm64: errata: Add NXP iMX8QM workaround
 for A53 Cache coherency issue
Message-ID: <20251211104332.GA9632@francesco-nb>
References: <20230420112952.28340-1-iivanov@suse.de>
 <20251210074550.GA10733@francesco-nb>
 <DU2PR04MB8951DEE7CB2D29D7E83CE03388A0A@DU2PR04MB8951.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR04MB8951DEE7CB2D29D7E83CE03388A0A@DU2PR04MB8951.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_024346_644617_A718396F 
X-CRM114-Status: GOOD (  15.96  )
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

Hello Frank,

On Wed, Dec 10, 2025 at 02:55:12PM +0000, Frank Li wrote:
> > On Thu, Apr 20, 2023 at 02:29:52PM +0300, Ivan T. Ivanov wrote:
> > > According to NXP errata document[1] i.MX8QuadMax SoC suffers from
> > > serious cache coherence issue. It was also mentioned in initial
> > > support[2] for imx8qm mek machine.
> > 
> > Ivan, from what I can see this patch was never merged and there was not any
> > follow-up on this. What's the status? Are you planning to work on it?
> > 
> > Frank, it would be nice to have this issue sorted out in mainline, any
> > chance that NXP can help move this forward?
> 
> Jason worked the original solution, what's difficult of upstream accept the
> Solution?

Was it ever sent to mainline for inclusion?

Can NXP help on having a workaround for this errata implemented in
mainline Linux, whatever is the actual final technical solution?

Francesco


