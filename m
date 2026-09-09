Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA25C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCziTK7/ZlchWwHqmkXGXHZceo76YfKx9HLgZZV+t2Y=; b=MDMmbPjYZ0yxgMfINlz+212HzX
	PN3M5VMeOKjhJErVmoxaTm76paElYszHTy76yySNKq50Rn+Zo8/dH7fZ1zoZQ9sozd1T+RISFz/by
	WsA5zGO4S2AnloWadttaWwKL9VO0JevrqCcuflhDd4Kp0o9PG1SBdGCKqj3Ty6bwX02IR5saYufnI
	hQe9INQ28V+edl1WdK0tS5mtDAo5ECZyz8GOMIzjSI23UfbQXV5269gTlUBo25HJpWycSGB7M7BCe
	/FgooUJOmF9JNlHVAE8h+rg1ZaA4DjeB1a2bTqaj0L2KR43qzK1ID4GjBPU5kJYwjhNDOVuKxDy4W
	VvMuyOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4D8x-0000000B2Md-3F6d;
	Wed, 09 Sep 2026 07:54:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4D8q-0000000B2Kq-3Mnl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:54:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5D5771A1A74;
	Wed,  9 Sep 2026 07:54:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3218560448;
	Wed,  9 Sep 2026 07:54:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4341011C7AF61;
	Wed,  9 Sep 2026 09:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788940486; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VCziTK7/ZlchWwHqmkXGXHZceo76YfKx9HLgZZV+t2Y=;
	b=wLocEo5NeGJxWZoMuHWNaoeWhaRnwV3YoqdXrF51kluEIHy3s9lRqOdyhklt96QunRLrWB
	OGEBxmAjUOBlOFWfu2mMpp56Z5G9vnJQjEDxkgln2AgIKjUosDnP3rPyOuE4cNxdop2q68
	oigEErkDma6koDhmK+/WNFPiDzQ6pVI4McsS2ko1Ux6dlyvGDJQ7XMPDmz9G8C3WhoITzc
	cruyy4aygAFPfAJ4EPTgKZkjbWg6mmptzb5+FkUxg/tsUa4d7A9cFtLjkcW9cyo5IO6KH5
	OlPFPplfjnzk4CK3Dckj4ea3aIKmgOAJ7oqN6wRIyTBSfiyPe+/liDR53g6zxg==
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
In-Reply-To: <20260904-submit-sunxi-nand-free-oob-offset-v1-1-cf389b9ac94c@gmail.com>
References: <20260904-submit-sunxi-nand-free-oob-offset-v1-1-cf389b9ac94c@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: sunxi: fix free OOB section offsets
Message-Id: <178894048508.2040467.13585862125514884362.b4-ty@bootlin.com>
Date: Wed, 09 Sep 2026 09:54:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_005448_976058_3871FDBF 
X-CRM114-Status: UNSURE (   9.44  )
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

On Fri, 04 Sep 2026 16:17:58 -0600, James Hilliard wrote:
> The sunxi hardware ECC OOB layout places protected user data before the
> ECC bytes for every step. Since variable user-data lengths were
> introduced, free sections after the first use sunxi_get_ecc_offset(),
> which skips the protected user data and points at the ECC bytes instead.
> 
> As a result, the MTD free-OOB interface addresses ECC bytes rather than
> the protected user data for those sections. Use sunxi_get_oob_offset() to
> point each free section at the beginning of its protected user data. Keep
> the special two-byte offset for section zero to reserve the bad block
> marker.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: sunxi: fix free OOB section offsets
      commit: c56d52865624ca236c44838ef9366a8597b6af6c

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


