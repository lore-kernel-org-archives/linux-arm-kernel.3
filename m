Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E95C36014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 08:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIuXEWs8pxVCLrGMKh1I+8Tc4BMgzgYO0SrkW0NZOZk=; b=SFOOmat8hqtaJwTbzJMZ293WJe
	dkFX5p1CyRau73VWqZL9VxS/41riCzNjRmiyNFhd5fNVptcI/DC3OZ4raSkbXpLTcEcjpLW1hZT8b
	QD8UnMTpa1yyr2SjsUGfGtHjQ+IG4tMRk80dA9/IKJNH0Hf/daIvwyUK6EiGXi/dTQY77wxVDoNkk
	Q4Lve3bJulzF+Ju/V7MCGOW814stvQpGjK5jCZPvnWOQAszubbNePWjtfmBGx5+LcLA2JjuGwcQCF
	iGp/CYc/dQfxp6b2iHyoJSLVhcvvJ5XTLIGzDoYhdp619lL5uuHaI1ArIw6qRd6FZTYX6CUdCe++4
	RhIcnuYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztpx-00000005acr-1wOi;
	Wed, 02 Apr 2025 08:52:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztiB-00000005Zgs-27nm;
	Wed, 02 Apr 2025 08:44:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48E8243C67;
	Wed,  2 Apr 2025 08:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1C9C4CEDD;
	Wed,  2 Apr 2025 08:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743583478;
	bh=KvDqUYfEbkG7FBvQEjTcdGDOcKrbTsyRE+m9Ramdl2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOtnba23t4jsv3gl0G1rGOpljk1PeH+8nMsDmQzjPdAQlc6ikStG9ElTQjd7qN73F
	 Y12+nMS1HhO9bQeWY2wimb4f5f4kFaLdGq2FL+bg+KdjaqZv7c8kkqkazTcPwkcnhg
	 G5LDXsy721Cc5oGfnzEI89Zx06+IdsWVET6M+nxuPsJfrbWgDTD8L7CDkXHthiKKej
	 CzQp7YiIhNcVXS8/QQBxNWdHbF18zFIcu2+ztrqBGEGJsSxaDWuUjrmPwblg3BVrrm
	 g8WbKkIOrRzCOotrxYXmM171W1WuvtpdgrjCrzFXgMU0eEIiiKzC3F90MOgmLmHuXm
	 v7HTPsyyaNlww==
Date: Wed, 2 Apr 2025 09:44:34 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v4] net: airoha: Validate egress gdm port in
 airoha_ppe_foe_entry_prepare()
Message-ID: <20250402084434.GF214849@horms.kernel.org>
References: <20250401-airoha-validate-egress-gdm-port-v4-1-c7315d33ce10@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401-airoha-validate-egress-gdm-port-v4-1-c7315d33ce10@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_014439_566234_A277E283 
X-CRM114-Status: GOOD (  14.17  )
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

On Tue, Apr 01, 2025 at 11:42:30AM +0200, Lorenzo Bianconi wrote:
> Dev pointer in airoha_ppe_foe_entry_prepare routine is not strictly
> a device allocated by airoha_eth driver since it is an egress device
> and the flowtable can contain even wlan, pppoe or vlan devices. E.g:
> 
> flowtable ft {
>         hook ingress priority filter
>         devices = { eth1, lan1, lan2, lan3, lan4, wlan0 }
>         flags offload                               ^
>                                                     |
>                      "not allocated by airoha_eth" --
> }
> 
> In this case airoha_get_dsa_port() will just return the original device
> pointer and we can't assume netdev priv pointer points to an
> airoha_gdm_port struct.
> Fix the issue validating egress gdm port in airoha_ppe_foe_entry_prepare
> routine before accessing net_device priv pointer.
> 
> Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v4:
> - Return bool in airoha_is_valid_gdm_port() instead of int
> - Link to v3: https://lore.kernel.org/r/20250331-airoha-validate-egress-gdm-port-v3-1-c14e6ba9733a@kernel.org

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>

