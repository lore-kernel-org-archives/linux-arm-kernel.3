Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9959FC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9vqYc9e5MyeZ9OmPpOdtvS3YemB4Mu1FMfPMp1z04o=; b=qfb+6E4w0VVxjYLxOXwbVRAuzl
	TTJo7Z9VZqqTgr+VnrtOj4fk3tLtFsqwWSfVenDu33Y7ZjtSmVPxPo+A3PNtWVIm8sk2OvlwLdzKh
	AOaJvH5E7F5nLOl+U2BG+GIrUMjnXIP41n2wVo6Tt48/gJSk97rJhhn5Phfc8B97VdXx54yzAkl4E
	aSegMdNSUHGA0fz2078sFPNajp80XAAqSVDtDVc7+p0TN2oYYiSao4YId8CRoWzHip4HiDqNxnudH
	JQ8jexJAEE2CNv47YFSrMLCBW7J7sSMDA4XmvUwcznhs9MNsuzxw+30/xre87tV91mjxHTOc58NsE
	UWj1JewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4D8s-0000000B2LZ-2ndj;
	Wed, 09 Sep 2026 07:54:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4D8q-0000000B2Kl-0HzI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:54:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 118CB1A1A73;
	Wed,  9 Sep 2026 07:54:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D5C8960448;
	Wed,  9 Sep 2026 07:54:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 250C011C7AF5E;
	Wed,  9 Sep 2026 09:54:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788940484; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y9vqYc9e5MyeZ9OmPpOdtvS3YemB4Mu1FMfPMp1z04o=;
	b=bRT6Xe2FdQ+XRFsktJaNrW8Pqt37ur7Cf9Wv5TXK2XlSeDwSbk5WlW2x0krsCsFWTYev2B
	kFToIhXNDLL9SC0DbdXze+GCddx1ynO2du5g+llK1WTJ1BQGphRYTgCC0r5+VGeOJe1dXn
	XrkspEnPA9cmQ39cdARQTF2sGFjbiV0yKF7xge23J4lbaVEEWYUCM9qioJGJ1l1RBh6qA9
	dFCVHk4UqejGj3X6CDm+z7622r3KUMDDmcrA1A0txuJDHURwcrzDnaWXHzAknD8CSTKnzf
	lUUffrFze6bC6nYuplxGJPetgbhJy85KSGYT/E9OJ9ggVaCKm4gNSUhIEjbV1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260904-submit-sunxi-nand-ecc-step-validation-v3-1-931cec317c10@gmail.com>
References: <20260904-submit-sunxi-nand-ecc-step-validation-v3-1-931cec317c10@gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: sunxi: reject ECC maximization on
 small pages
Message-Id: <178894048196.2040467.15162790705275563335.b4-ty@bootlin.com>
Date: Wed, 09 Sep 2026 09:54:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_005448_244220_5E7FDA3F 
X-CRM114-Status: UNSURE (   9.52  )
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

On Fri, 04 Sep 2026 19:05:37 -0600, James Hilliard wrote:
> When nand-ecc-maximize is set, the driver selects a 1024-byte ECC step
> and divides the available OOB bytes by the resulting number of steps. A
> NAND with a smaller page therefore produces zero steps and a division by
> zero.
> 
> The older controllers also provide a 512-byte ECC block mode, but the
> hardware documentation describes that as an ECC block size within NAND
> pages whose supported sizes start at 1024 bytes. It does not document a
> 512-byte NAND page mode.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: sunxi: reject ECC maximization on small pages
      commit: a3c84084a73e170374b7dd493947efdef4ee57bc

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


