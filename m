Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E850C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sB9VxuqALQwrBeXPwHmokBPdEY6c1fmoxnp6wovATlE=; b=CfPjfDp6XmuRjMhmFL4FlzLwdD
	hNEMGQ2ZdkBEFfAowV5GYREF9EmnDeSJwfvZuukKfXVqTN6DhWkKqtjaIPRInHarHGckNZhME4kyd
	cdlZIV6x9mCXIFwLvonmEYiqnnrO2eA8onzFZqrfdRG4L/1t9elzA524Ff0ZIl9mtA1yYJYGJ5PiH
	XVXiSUjlUDXtJhrSDUJ7+fttzzA0Dw65gCDaLzc84I06pXNL9IB3Hhyw36Ia0JcWUCKeD8n8i2PHC
	T1PG8TLqGkWNWp1eTXWcUJwVYD8SvIisHZ3x+/BR/iQsOXMailHAD4gO+auLcaf87DPGaf6o6Amdh
	XmqMaa/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL7K-00000008DI6-2ZmW;
	Fri, 07 Aug 2026 14:00:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL7I-00000008DGz-0tUA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 14:00:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B62514E4113B;
	Fri,  7 Aug 2026 14:00:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8416C603F0;
	Fri,  7 Aug 2026 14:00:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6099811C37961;
	Fri,  7 Aug 2026 16:00:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786111205; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sB9VxuqALQwrBeXPwHmokBPdEY6c1fmoxnp6wovATlE=;
	b=epXFGuAfuU0GRB3UwM6B0HSdKC1jG/MpIUHuwmS511qPTiBwC5t+4XD/q6aDyEw9U/xxTw
	wJ4wN4QsECOaOC+u2ojQaQV8W2mPBpOwXVAwRKexYZKuOKxvwlcy5Y88vaI9vkzW8CH2J7
	RYcsnjbraQ2jQcaR9Xq8Fk7qblNEYxLBXdayPoasy3oupgYmqgUN1eK1yZtuc9hlvnPTlS
	4vdIQnNqTdYx3P1SljCfmgLrrY7OFL0tbf3cefSZNlOm/S9na4euFCs44oNCGB6GvPyeVK
	hr7SNHLFtzggk7tYOB1vbxM4jhaD/Zplhs3/00+xadU8Fw85WrZCkIiObqMcqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260717164202.3099982-1-james.hilliard1@gmail.com>
References: <20260717164202.3099982-1-james.hilliard1@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: add H616 MBUS DMA support
Message-Id: <178611120394.758547.12981488112151990618.b4-ty@bootlin.com>
Date: Fri, 07 Aug 2026 16:00:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_070008_389518_0AFF4CEC 
X-CRM114-Status: GOOD (  10.48  )
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

On Fri, 17 Jul 2026 10:41:58 -0600, James Hilliard wrote:
> The H616 NAND controller uses a descriptor-based internal MBUS DMA
> engine instead of the direct address and count registers used by the
> A23/A33 controller. Since the driver does not support these descriptors,
> it currently attempts to request an external rxtx DMA channel and falls
> back to PIO when none is provided.
> 
> Add a single-descriptor backend to the existing ECC page DMA paths.
> Allocate the descriptor coherently, constrain data mappings to the
> controller's 32-bit address range, program the H6-style data block mask,
> and request an interrupt for both command and DMA completion. Keep the
> existing external DMA and legacy MBUS DMA paths unchanged, and fall back
> to PIO if the descriptor cannot be allocated.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: sunxi: add H616 MBUS DMA support
      commit: 5ee37db34637ca6e33ce01d7062cb31275484404

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


