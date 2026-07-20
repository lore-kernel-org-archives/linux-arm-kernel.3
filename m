Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055C4C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5pCJCNSlRvnmOb1Hy/xPjzYh4HxX+Ti5n4ExHAyluw=; b=WVS59sZmyqurwJezBCQhZ7wnjx
	LIh6dUhdBlRkao9TjDYvPKrvuqN+KjuF8dkz6uKPhylpfPpVpKkl8axqtHiG+3zWT4+TZquOWIds1
	Rkn7RMTaTHBxOZUBwZME1ppjRPw4AYG4cCXqzCszuDFfiwCLqHCIredCeI1qvAoU6oyyj7DG0ccfg
	KFGAHOfGE1de6t2upufhCfuYQHYwdhxbiiTmcvVGxs7yxlUr3cXYOj78jQpIbVD/U1O9OZzAWhO4v
	cMNDg8Lw11gU5Eii1Aid1t59JygQoVH1Jjf9EHIPRD8wyLHUi+F3yJZuoRsKI4w4OG4gyYss4Fe35
	N5dcoyiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqwn-00000007OuB-22dW;
	Mon, 20 Jul 2026 16:34:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqwl-00000007Otq-3GSM;
	Mon, 20 Jul 2026 16:34:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89A2C402F1;
	Mon, 20 Jul 2026 16:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4ED11F000E9;
	Mon, 20 Jul 2026 16:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784565267;
	bh=I5pCJCNSlRvnmOb1Hy/xPjzYh4HxX+Ti5n4ExHAyluw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lV4VupgvJObQ9qrv/YBl2S8GZ12F5T+H4ddshJCJv37k4Aesv5z1vJ8aaf4oU3wyk
	 jaSw3X+8nwIpDv6DheHiYWqccp5GXQRnlQ3cFvyPPPpqotdJvU8kuYoQqGx3tXCAC4
	 s2kHQDyLBGQkKcDf2WXUP6WVEnYhkk/gnJC+MsJIgz3yB1l0sSOTzluhedUknD0FPP
	 pjnzujGT4rms2Mis9cTk4/dYGuNEHbNX5UHfa9QwW4NCndbYQTaXCoznf5NTG8iHzL
	 vrI/evAXi9Nka0LH2lUVTwZ/JXtSTQ2NOITtjE1g473fGRjUUHC2LCIFuz0sG4BU3N
	 JIGNhYPfAinfQ==
Date: Mon, 20 Jul 2026 22:04:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 phy-next 8/8] phy: lynx-10g: use RCW override
 procedure for dynamic protocol change
Message-ID: <al5ODzYhpE-wHSSN@vaman>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
 <20260720133642.136324-9-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720133642.136324-9-vladimir.oltean@nxp.com>
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

On 20-07-26, 16:36, Vladimir Oltean wrote:
> Up until this patch, the only protocol change supported was between
> 1000Base-X/SGMII and 2500Base-X. The others require an RCW override
> procedure which was lacking.
> 
> Since now the guts driver provides the means of applying this procedure,
> make use of it and remove any comment which mentioned the limitation.

lgtm, is there any dependency. If not I can pick it

-- 
~Vinod

