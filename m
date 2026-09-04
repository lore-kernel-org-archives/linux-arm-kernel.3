Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDD0C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 18:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ca8H73x2xQm8L3T2lZGE+j6oHWmt8WLN0PGrvi1lAPs=; b=xreS9at8g82hBjC6uJM26nW3Pu
	0fzhGr/kltC/C2qxAWZ2O1t3gxpn2tYHdjftOgvYc0fGhcuvUpgnxAAwTqdan87bVCI6JI90xeZze
	e7pTdoUHh6FGf/6jz3SGfT10dWWdgZwUkGnh03ZqXcU9C8xDjOVv6ytFbDvQzJ5cWAFA3VVzT2oZq
	qQmEx2ORKeWyUTP0zJWV+xEoLSKVTI4J5pW/l3jiLlzHKgqc6FnFQ3rujPmgTZpAiCwo9GV9F5WIT
	IE0Xnduyh/d5dc/dKsFC72KrSjxesgDk0RIRWoLRHOUN4Nz0xEsT4b9bCUmbfwvyM12SPTz2B1Eqr
	bwSF2Xpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLf-00000002yrG-3XR7;
	Fri, 04 Sep 2026 18:09:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLc-00000002ymM-2Dkw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 18:09:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EFA6C4E41522;
	Fri,  4 Sep 2026 18:09:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBD9E6057F;
	Fri,  4 Sep 2026 18:09:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6818411C78705;
	Fri,  4 Sep 2026 20:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545346; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ca8H73x2xQm8L3T2lZGE+j6oHWmt8WLN0PGrvi1lAPs=;
	b=wHZnLEaCwcbRp47TkgRBv7KBXtgP6yQ1GzwIKpCaeCX0BEZCuFkrKBATzFIpAGAZzKvfNn
	XoOlE7UP7WHizpylU5fDBeRRwFiygiEtLy8Y+TvWSPQt0dyZakm6RGwh6XuGikgLp6oMQb
	+Dk4hzAB5XKlMTrQy/cx7Yt/aWf8KE8BQdDplAPApA6eJsWyfjbjtLnVpytgZFDgSYYXGv
	Lv9KqVBFZhaxVkDKVAILP0rXv5kWpfD+3rWuf0Zacw/koYQST+HYqOuJK9CpUfma/W2JDH
	Vopxt+F1GgoStHF1E+y51lRiIp63RO5YCaQCnSTb5wNS1Awy9FQfhSskUrC/Zg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, christophe.kerello@foss.st.com, 
 johan@kernel.org, linux-mtd@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260822045957.12511-1-triet.hoang.dev@gmail.com>
References: <20260822045957.12511-1-triet.hoang.dev@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-Id: <178854534427.1533016.709006887043927226.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:09:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_110908_718546_899C9018 
X-CRM114-Status: UNSURE (   6.23  )
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

On Sat, 22 Aug 2026 04:59:56 +0000, Triet Hoang wrote:
> Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
> and pm_sleep_ptr().
> 
> This lets us drop the __maybe_unused annotations from its suspend
> and resume callbacks, also reduces kernel size in case CONFIG_PM
> or CONFIG_PM_SLEEP is disabled.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: stm32_fmc2: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      commit: 09ec4fe9036ed0a0293518dc11f2480423d1139a

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


