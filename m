Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49348606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cIsl2Ykb;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tqh+XQG+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IMZYF5n/1Lsri4GEmH8cmKPfHLB3rZjCJ015owF/4NA=; b=cIsl2YkbXT74lTPN88w3C0jWf2
	coqe+ptqBZFaTMU07eV1D0/S1eJfmZAzgeF1j29G+hO302H+NYiYxvDDc5h9FvfFmKFYyeQrCsTdz
	BwDdVbwDhOWfNKQOiDQMCev/Zjs/wvU6DjTlMq03FE/SYCZ/U5aTZRtAulG1EGdsBhccoiaxhdtbc
	T8G28b+La5If+CdKGHsfDYbjvheZtYFIanURe6w0fU7Qj0To834EMBFz4emDpftX7PsXu7cTSWBRt
	woEUqW/MrFpKMKno0Cg+JCTpbuoREUqUTpBGp/yTmtlgJCnlwNFavahW7CaD/vxBOxxwty8bQ4TEj
	DitU+ULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdCv-000000047wN-30hP;
	Tue, 27 Oct 2026 09:11:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdCs-000000047uE-0ZRk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 09:10:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 476C460052;
	Tue, 27 Oct 2026 09:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0554C1F01825;
	Tue, 27 Oct 2026 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793092257;
	bh=IMZYF5n/1Lsri4GEmH8cmKPfHLB3rZjCJ015owF/4NA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Tqh+XQG+qJuOt8n1H+Wqcj9F2hhNtFH31Rh+ROMn1IdLM5EJbIelvvzc1s6pRzPW7
	 lACP2mLocq/oMG/zgnr0Kqeot19kh0Cc0nW+kDGQnYkMCDlk9xRT+FlSg0O6NFFxut
	 Noykj33QTBtuSgk/iEahfaI6tcv0sq+PIW2u2LbJ79qt7BOKUGvlpPJf2Iy9CbNoq5
	 R9mkI7B7IYlBP7zuIcjijzRnW5m+vg8ZACvOO0gVRRJd8SLBwomsV82R/oY7EWY+3l
	 b5eX4759EJXiVPkge6Dw90nwcLf+b11PbxdXCEkLaYHRC1NOmNJlSxABbsuNOSxO9J
	 0gik9cXrTiQqg==
Subject: Re: [PATCH net 4/6] net: stmmac: copy XDP metadata in AF_XDP zero-copy RX
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 o.rempel@pengutronix.de, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Date: Tue, 27 Oct 2026 09:10:55 +0000
Message-ID: <179309225560.3134.9863766306670060785@kernel.org>
In-Reply-To: <20261023-stmmac-xdp-fixes-v1-4-efb37e19f5bd@oss.qualcomm.com>
References: <20261023-stmmac-xdp-fixes-v1-4-efb37e19f5bd@oss.qualcomm.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] At this commit, the commit message says
  stmmac_construct_skb_zc() 'keeps the metadata aligned when…

--

net: stmmac: copy XDP metadata in AF_XDP zero-copy RX

This commit changes stmmac_construct_skb_zc() so that it copies the XDP
metadata in [xdp->data_meta, xdp->data) into the new skb together with
the packet data. The metadata ends up right before skb->data, and
meta_len is recorded with skb_metadata_set().

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 30a2774d722b7..8a2faf50d6957 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5519,7 +5519,8 @@ static struct sk_buff *stmmac_construct_skb_zc(struct stmmac_channel *ch,
>  		return NULL;
>  
>  	skb_reserve(skb, xdp->data - xdp->data_hard_start);
> -	memcpy(__skb_put(skb, datasize), xdp->data, datasize);
> +	__skb_put(skb, datasize);
> +	memcpy(skb->data - metasize, xdp->data_meta, datasize + metasize);
>  	if (metasize)
>  		skb_metadata_set(skb, metasize);

[Severity: Medium]
The commit message says this change:

  "keeps the metadata aligned when stmmac_rx_vlan() relocates it with the
  MAC header while stripping a tag."

Is that true at this commit? Here, stmmac_rx_vlan() still moves only the
two MAC addresses:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_rx_vlan() {
    ...
		vlanid = ntohs(veth->h_vlan_TCI);
		memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
		skb_pull(skb, VLAN_HLEN);
    ...
}

The software pop path runs when hw_vlan_en is false, CTAG or STAG RX
offload is enabled, and a tagged frame arrives. In that case,
stmmac_dispatch_skb_zc() calls stmmac_rx_vlan() before eth_type_trans():

    stmmac_rx_vlan(priv->dev, skb);
    skb->protocol = eth_type_trans(skb, priv->dev);

The metadata stays at [old_data - metasize, old_data), but mac_header is
set to old_data + VLAN_HLEN. skb_metadata_end() returns skb_mac_header(),
so the metadata window seen by TC BPF and the stack is shifted by 4
bytes.

Wouldn't that drop the first 4 bytes the XDP program wrote, and return
the first 4 bytes of the destination MAC as the last 4 bytes of
metadata?

The next patch in the series, "net: stmmac: fix VLAN tag stripping on
short and non-linear RX frames", changes stmmac_rx_vlan() to move
meta_len + ETH_ALEN * 2 bytes starting at skb->data - meta_len. That
fixes this by the end of the series.

Until then, this commit is a bisection window. A stable backport that
takes this patch without the next one would also have the problem.
Would it make sense to reorder the two patches? Another option is to
reword the commit message so it doesn't depend on a change that hasn't
landed yet.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261023-stmmac-xdp-fixes-v1-0-efb37e19f5bd%40oss.qualcomm.com

