Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ABACD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+dGb8BwyEwsf8sqCMMIZAMrwxIB47KJmEfZJldr0Ns=; b=ZabYqLIicJA9xKY+k9/uRJV3mi
	94yzZwYGpwEy5ARmpbM6pIE5e5U+8BYObus2s8DrW9HgW1kxumWSoTGS95EtQ13oa0vUjTR8jeAQP
	dh+qbwxsmFuzzJFvmjpUgtRWDtP0viHgn4PXhS93oLixKRAZ4H8VxYb7lJowpD9TZCj98VACweZmB
	6FcZAcLTpU2Vm+xY9AOgErb/jrdwB2ZCbx1txjoF4I/mgUNPBCxU7Z0ofD23uncx1ZFsbK1AOkoLJ
	z9SZLG2yF90yUVlochPG9OwlQ0k44tvLtbAjYVdkewffAbaI9Q9zSUEyosUR+nf3Xdbj1a/NfOiA9
	55ZtkDZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDvD-00000003QF3-3c0G;
	Wed, 13 May 2026 18:03:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDvC-00000003QEs-2gxe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 18:03:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C176E60126;
	Wed, 13 May 2026 18:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357E2C2BCB7;
	Wed, 13 May 2026 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778695381;
	bh=J3/DeLg5yTop5i593NLz2wTc3lXqfnyjLigYKgxELko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UsC7ML7+E1vmFSyI7MITRqGJgYaIFjQgpwnG47Vhqq+gGxLSfIg1mWCCanEc37RT/
	 +YHw4SnHWaSblYW5f16wZrchFqjcLMm2aa+U0SgpsFsOjrh5p+KLQgR3bCFUsd+Gh9
	 wqlhJcUMQFIgdMz5UVY4Vc2u6p+y82raKfniGwEGxv8MyzgAK7y4O/1YSFZAsQxp2P
	 rFvrLsW/FTWUY9frpXeE2p5TF9BpQvkF4YLutrOpcgj2XGxwsk97g0pY7OPtvoFoFS
	 jOM110JeqqE3S6J3fTBmTTmnsuDWEKNFqfDiZzal3ZUHEwG4CTjyaScqQzPhVonfJR
	 p+KJvDrRpyjZA==
Date: Wed, 13 May 2026 13:02:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-media@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/7] dt-bindings: media: sun4i-a10-video-engine: Fix SRAM
 count for H6
Message-ID: <177869537686.1492647.6830300416623513833.robh@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-3-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505134812.408316-3-wens@kernel.org>
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


On Tue, 05 May 2026 21:48:06 +0800, Chen-Yu Tsai wrote:
> On the H6, the SRAM C region includes an alias of part of the VE SRAM
> used by the video engine. This region should also be claimed so that no
> access happens through the alias window.
> 
> Add a second SRAM region phandle to the video engine for the H6.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


