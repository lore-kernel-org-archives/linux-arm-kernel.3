Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3289AC5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wO+cXkZt+topJfy8NdQFR79mWwPl4kfgdmUuuL3DDzA=; b=QH6KO66re5KC4WZVL4uTj5PvfT
	Mt+otOtb1zHTJouWBPPfTviyeYr7XzzmRMEtZUJPlXYUv45UitmKnOLbGfWMZzJDKrKFdvS3s6UL3
	llBZfbMTfS1wfz9jJCNiPW73wsZzhy4gfTJVh2yy9upMDi8uzcKB0N172EAOwDQACNzKz2LbFCU1U
	3SV2G8AMFS1kTn/dWtgviYx7R8MFmA1isRfVvidXEViqg7NzKo0EMoadEHiapHO3MIoSjs6mKPS2E
	hU9/NaQajOYD7s26mdS9xtP+PjN6TdQUnyu87pOv55cXhzUVHBWl943YjO0OSA/SDWdCaXK9lE136
	FoOrcJAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQx3-0000000C0Nm-0Fp2;
	Mon, 10 Aug 2026 14:26:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQx1-0000000C0N9-0O8U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:26:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3FA151A153E;
	Mon, 10 Aug 2026 14:26:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 113176033B;
	Mon, 10 Aug 2026 14:26:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3546011C4A8B9;
	Mon, 10 Aug 2026 16:25:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786371955; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wO+cXkZt+topJfy8NdQFR79mWwPl4kfgdmUuuL3DDzA=;
	b=0Hv6b62vBOPQbozjljwug2VfT0fSg943Beu1OT2NhDbVVnhDhIkUY9PBI2m6S5t6cOg/pa
	WH97Ch6PZaAtdOwW5bS0xdGxazCL9apKC63/y3MysUwKJbyI6PhST+lF2db45YAyP3oubg
	pVDuwQzW4czhB8640hKUOmTL4lqckHMefpnSCoCOGi53qz4vgXi2LtQae2gxFlp5xj+6fC
	s07S9J0QepWqPDA1tSQs7N/LOq+6DSUEMPVAjwhmfWfQn9BdYcBt+DgUayegJa2isuFS+d
	KTGErDZ/axKgn1aLlixEADItLpzNVpiDNrlxr9o5uumfcDKvzdYi6tI+0l7ncw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260807-submit-sunxi-nand-h6-h616-timings-v3-0-91287b543f41@gmail.com>
References: <20260807-submit-sunxi-nand-h6-h616-timings-v3-0-91287b543f41@gmail.com>
Subject: Re: [PATCH v3 0/3] mtd: rawnand: sunxi: fix H6/H616 controller
 timings
Message-Id: <178637195198.1098769.15933415840493831349.b4-ty@bootlin.com>
Date: Mon, 10 Aug 2026 16:25:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_072603_270414_63CB73B3 
X-CRM114-Status: UNSURE (   8.10  )
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

On Fri, 07 Aug 2026 09:38:58 -0600, James Hilliard wrote:
> The sunxi NAND timing solver currently applies the original A10 NDFC
> timing characteristics to every supported controller. The H6/H616 NDFC
> uses two internal cycles for several setup and hold intervals and has
> different delay-field encodings, so the resulting clock and timing
> register values do not match the hardware.
> 
> Prepare for per-controller timing data in two behaviorally focused
> patches, then add and select the H616 characteristics in the final fix.
> Legacy controllers retain their existing setup-cycle behavior and delay
> encodings.
> 
> [...]

Applied to nand/next, thanks!

[1/3] mtd: rawnand: sunxi: group controller delay tables
      commit: 9f2e033754c6c023150f184b4e72bbcc5d6eea13
[2/3] mtd: rawnand: sunxi: describe tADL and tWHR delays
      commit: 147f2a5743f8864bfc265654b1856af11c8c0031
[3/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
      commit: 15a3cbce32994141252bb4ecfe3ff3a5d22d0b4f

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


