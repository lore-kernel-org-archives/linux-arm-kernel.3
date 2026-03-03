Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71C6EB3648
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 02:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8W3/ulCrw8vSj1DgQF8sLcFVhCCR3ueTyaIp34sDHU=; b=H1IMgQUIBoJZI/GVGlfTE3LkVP
	ek4LErTdVx1jsyNcatZLy/pf5Dhc7sj6rZ/oMw1VhIBxpJgBtrM+QZ4hWvDDgxb2QGAWY4OiCz3P4
	HJ022tvMWuroCVTrTUpz9++l7KfijqKjl7Wxw34XCp9WE/ePJss/d39hAs6MEezxiKl5837OFfqLz
	gT7igrkwwISmwZL0Jc8eWb0O4xsMA/bl50LOkYGg2RkdEnlH+JoR6pjbEg0OulRG4Cc7QkUML4Bv0
	qHpJGguTpT7TKYxX1HiDdINIy2lPvKtlZmrdeNdtd0IA0bdFE5liuGYCsapLuslDFwXAr6QEGovnv
	Zv8Wz0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxFVb-0000000EOzX-12Ex;
	Tue, 03 Mar 2026 02:29:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxFVZ-0000000EOyo-3o5G;
	Tue, 03 Mar 2026 02:29:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F80760127;
	Tue,  3 Mar 2026 02:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C309C19423;
	Tue,  3 Mar 2026 02:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772504951;
	bh=ZWSjDglVV8rV94EH0XRkO98jwAKM9tzwFT5sW1hwJnw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lK6kECNQH/MKzjx/eLAD6yVhEThloPbePGhSvt4wh4ZmBHnBrIFF2Ovamdmch2aYh
	 /9ElB2EKdcZVeSbMr0erPOU+KiiPg9FHeRnMhU1ayUdAdp0RgpfEL6Xe76SwJfzAKJ
	 +hq9qN2dR8MA8Q+YnKOexpUo5kMcwO6Fi1p5QEdq7/MoOPQWHW8B+kD4Zhk3yi3KBq
	 6hawD4eIIMPJGt+IATChGupmYRIXfYxQ7/FptU+DXGXBcSJYlEo3TfgGnbpb3u+jP8
	 lFZhBAr+EfY2Ph6lO2ybv+C6YaHhfKu5Oc6veSpEnzpUlH5MRiBGz+xrO5E6+2sP4S
	 bi8MG6R4ZK9BQ==
Date: Mon, 2 Mar 2026 18:29:09 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Paolo Valerio <pvalerio@redhat.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: Reset prog ptr to NULL
 in case of error in mtk_xdp_setup()
Message-ID: <20260302182909.06de1942@kernel.org>
In-Reply-To: <20260227-mtk-xdp-prog-ptr-fix-v1-1-b73d7588b645@kernel.org>
References: <20260227-mtk-xdp-prog-ptr-fix-v1-1-b73d7588b645@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 27 Feb 2026 16:52:11 +0100 Lorenzo Bianconi wrote:
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -3751,8 +3751,16 @@ static int mtk_xdp_setup(struct net_device *dev, struct bpf_prog *prog,
>  	if (old_prog)
>  		bpf_prog_put(old_prog);
>  
> -	if (netif_running(dev) && need_update)
> -		return mtk_open(dev);
> +	if (netif_running(dev) && need_update) {
> +		int err;
> +
> +		err = mtk_open(dev);
> +		if (err) {
> +			rcu_assign_pointer(eth->prog, NULL);
> +
> +			return err;
> +		}
> +	}
>  
>  	return 0;

Maybe there's something special here, not obvious without context,
but why are we setting eth->prog to NULL rather than old_prog?
At the very least the commit message needs to explain..
-- 
pw-bot: cr

