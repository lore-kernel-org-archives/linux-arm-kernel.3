Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50460CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtp1EGHAfNWkCgpoDgidzM3ipP/8kfdDhQyh7QgIsls=; b=v9IpF69SwrTDpmwLEZ65LhkAvP
	ZZjgdGr/gh6X/hsoW9zf3HSF36G05xDczXH5wstTZGJhI+8XzDxXxujoLpr+VUBgvuw0xor3a31ZQ
	X6h3NEEQaWoo5vjXF9esUcP14uSJD/6Khdi5Nucc3BYR41aCbybLL7YDbfNIXK+PWdL4cZAfOLKH0
	voe4x4XBBFc8HkWeoBBUKroP75CPVRaYF+hk3C4kSgJry7QKy/9t2DALLQbcMZjBidt8DdUfGQd8r
	ZQKaOn6bbNTMrB2svmRZAjGbTV8YxfozsfuYbJMg0jkkpaNrfcPMOdGuCWP/3bFrhUDUnPJMOBn6W
	ihQfk8Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCgM-0000000A72f-1k28;
	Mon, 12 Oct 2026 09:51:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCgL-0000000A72N-0bXd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:50:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42DE543AF7;
	Mon, 12 Oct 2026 09:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBB61F0089B;
	Mon, 12 Oct 2026 09:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798656;
	bh=mtp1EGHAfNWkCgpoDgidzM3ipP/8kfdDhQyh7QgIsls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Zaw652VoTUaN6K8mZnOCwQawPhCNG2cDBRhGMKbL/O569B3e5eJ3dIRUTXSWJljk7
	 6+1imYqawsGZlQWRlTdVD/xuhevFiUh/bkCqEYmNfsw05LmL7VASJaokxAQrwgk6bl
	 vEThj8V9xfLQ/FDIntbdgciITt+VUYhMZiJYJCosmWgwG6dxCE+7+NNrRE7m74+DhD
	 VeMxhz7lnn+dxktFsmTVMMeyaw+zza12nj2fmYNuXNuJh3jIrMjTmP6Ubcp2N95o6e
	 i1W00VV9MA9huCtZTqrpfEGD1TEGwmJ3uNnDdfvGTen/sx7Yku2kfPeEFyW0j8NS5D
	 GNAxFq/BXnYmA==
Message-ID: <3408fb1a-b957-4591-bf75-1eb44af73584@kernel.org>
Date: Mon, 12 Oct 2026 11:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: cpm1: tsa: fix wrong clocks released on cleanup
To: Haotian Zhang <vulab@iscas.ac.cn>, Herve Codina
 <herve.codina@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261009053720.3146117-1-vulab@iscas.ac.cn>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20261009053720.3146117-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 09/10/2026 à 07:37, Haotian Zhang a écrit :
> tsa_of_parse_tdms() gets and enables tdm->l1tsync_clk and
> tdm->l1tclk_clk in addition to l1rsync_clk and l1rclk_clk, but the
> error cleanup path releases l1rsync_clk/l1rclk_clk again in the
> l1tsync_clk/l1tclk_clk branches. The tsync/tclk clocks are leaked --
> never disabled nor clk_put() -- while rsync/rclk are clk_put() twice,
> underflowing their reference counts. tsa_remove() has the same
> copy-paste bug.
> 
> Release the clock actually held in each cleanup branch.
> 
> Fixes: 1d4ba0b81c1c ("soc: fsl: cpm1: Add support for TSA")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>


A similar patch is already in linux-next, discarding this one.

See 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/soc/fsl?id=46201d760c48e771fa2febfcb0787f22c3b71387


