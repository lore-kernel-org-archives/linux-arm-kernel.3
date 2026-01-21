Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D10D262B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlEsWVcrnlWmy29pj5zkQH3SZ2phU2MltcFHlX6p2yM=; b=jkpA205ZSE5sH4Zg3/qLNYUaYK
	hmDJ5bvWe51GfCxam4aJDcMwPrQH5/Bb/tvvQtaaMYdW0WEkha8EWVuSIT3INEuxabkXO3IDTVEqC
	zAr+G9e0zPXAUpw/rT8gns7OaYA+bblOkj+BVoij1gWG9Wqz60uRyP7Xx+O8kwJkSfSPoWfli2Fi8
	g1wEOJB9E0w6o1kKgn0QGg3k7IdMJot/lg46oxofiQjmMnZIXkOV0KyMRCuXtcrS8eNFsEsdqJmUv
	ts5Mz3aZ11cfeNM90+3assKJq/Bgo+apuEGHqYZyuBAhAch1uI3fVZ9GH5trHeKPasrGERLGhjbcr
	kOZ9XkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNzq-00000004nMv-09i4;
	Wed, 21 Jan 2026 02:31:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNzo-00000004nMJ-0LE1;
	Wed, 21 Jan 2026 02:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28FF960007;
	Wed, 21 Jan 2026 02:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA226C16AAE;
	Wed, 21 Jan 2026 02:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962658;
	bh=kakUcG5SzcJJ04uD/Xh1SJIe/+0LTLNt11k19MhqLXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/cGBS2ZiYJku/rO/phS4zAT6dn8nNrdqI8u+hc6Y2meUr+Es7RsLp0+Rm7l87ziC
	 C3NoqCyzyiNMNRzMrb+jVblUX2sl4m6KzPViOOYtIr0XrRQ5ON/zbpK6biDZ8PWiCw
	 QoUfeKSuGNQtezWsH+OK1b8zo4AunmsDaIsZQKMgFpnXQpVwpOBk0C68LMLQo+2czv
	 bVxOheQCsIgvu126fLB/oviuyBSovVh/Qi3dVWnXIsV9Q6/e/5o7+XtPgpKcFhJ4AQ
	 xIDTYbuJSe5Xl1ehzqDAdsRVuicF1Nr7islS6eL5n9rNFYEtyIxOuKbKIXDLK4HgtG
	 Ni0rpTqql6Avg==
Date: Tue, 20 Jan 2026 20:30:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/4] of: reserved_mem: Fix placement of __free()
 annotation
Message-ID: <176896265605.1837058.2000534852582541394.robh@kernel.org>
References: <20260107-mtd-memregion-v3-0-f9fc9107b992@bootlin.com>
 <20260107-mtd-memregion-v3-1-f9fc9107b992@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-mtd-memregion-v3-1-f9fc9107b992@bootlin.com>
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


On Wed, 07 Jan 2026 14:04:52 +0100, Gregory CLEMENT wrote:
> The __free() annotation was incorrectly placed before the variable
> name instead of after it, which resulted in the following checkpatch
> errors:
> 
> ERROR: need consistent spacing around '*' (ctx:WxV)
> +       struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);
>                                                ^
> WARNING: function definition argument 'idx' should also have an identifier name
> +       struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);
> 
> As part of this cleanup, also remove the useless return statement
> flagged by checkpatch.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  drivers/of/of_reserved_mem.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Applied, thanks!


