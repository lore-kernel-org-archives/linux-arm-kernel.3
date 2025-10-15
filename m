Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E591CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 15:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYjBf9y971X3wpsTmeQ8L2XweQgFkUNSGCrxO3zreok=; b=eN7WnKcPnvkZG1dDVmTNSBo8CG
	a02xEDhSLFlB0ze92TZyk9uU9CAAuzwDXCoNUbDTJzttB0+FEnNnRmASHGCXddFFMa2tPKjqTz1ky
	CqJp7NWC3U17Zh7t/1Px69vF5qq0UrY/QS0l1q+rNIUnUOpJ0+LJ2ynuIo1Uv+AdT7d/iPzQ8BZOf
	arGMwyzlJixQxiUwstdZqtbH3h94KNID3ZNnB9OVdB4HiYyMm/ejCve4ojZvgbK21wn4261VTMJSU
	c3uzAowyybEKf95eUB1DkCcA1P7T8eeTPH9gQfkWSRWGaBw0mddazfBxcb+WFwFx4vXp0KF9CY9sa
	KFiWFdPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93j4-00000002AP2-0DMI;
	Wed, 15 Oct 2025 15:47:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93j1-00000002ANV-1q8C;
	Wed, 15 Oct 2025 15:47:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A903E4A425;
	Wed, 15 Oct 2025 15:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD489C4CEF9;
	Wed, 15 Oct 2025 15:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760543258;
	bh=7SSKvHAijSlWofXaTTSRV6RFLX2i1LcCrhGDKzWlQ20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGH0xtdSIVA/HLIi76/6tLihtexifn5/54YloqXYWip65ngHLQGryac6RYlBgpG4e
	 HoTJwhinxEre29f3obZE9DuhzfKqbkzarHV6a2pbH8uONhgDyT5NSoSEa1GqQ5Tkci
	 pMC/ntF1HlI1keUJDF12UQvI3jGdpDQCeSNwWbDbtsj6cKzmaEDQBYM87d0znGg1lY
	 3ial0Zih5TGRkkfb6e6wHK5VV9eSJRmE/iiJp1D2e/2Y2aho2V0hgfAd3KA2BnEfOa
	 HFcpgCORI2M8wWfslJQTMWYPWn/Ma2F0WXHIDpxwYxlLGTp8dlwj10e2UoVVeg9j3I
	 xc0QomtzAgiEg==
Date: Wed, 15 Oct 2025 16:47:33 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 08/12] net: airoha: ppe: Configure SRAM PPE
 entries via the cpu
Message-ID: <aO_CFRYy6vXCQIS2@horms.kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
 <20251015-an7583-eth-support-v1-8-064855f05923@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-an7583-eth-support-v1-8-064855f05923@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_084739_498318_FE2D5E60 
X-CRM114-Status: GOOD (  17.40  )
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

On Wed, Oct 15, 2025 at 09:15:08AM +0200, Lorenzo Bianconi wrote:
> Introduce airoha_ppe_foe_commit_sram_entry routine in order to configure
> the SRAM PPE entries directly via the CPU instead of using the NPU APIs.
> This is a preliminary patch to enable netfilter flowtable hw offload for
> AN7583 SoC.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_ppe.c | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
> index fcfd2d8826a9c2f8f94f1962c2b2a69f67f7f598..0ee2e41489aaa9de9c1e99d242ee0bec11549750 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -662,6 +662,27 @@ static bool airoha_ppe_foe_compare_entry(struct airoha_flow_table_entry *e,
>  	return !memcmp(&e->data.d, &hwe->d, len - sizeof(hwe->ib1));
>  }
>  
> +static int airoha_ppe_foe_commit_sram_entry(struct airoha_ppe *ppe, u32 hash)
> +{
> +	struct airoha_foe_entry *hwe = ppe->foe + hash * sizeof(*hwe);
> +	bool ppe2 = hash >= PPE_SRAM_NUM_ENTRIES;
> +	u32 *ptr = (u32 *)hwe, val;
> +	int i;
> +
> +	for (i = 0; i < sizeof(*hwe) / 4; i++)
> +		airoha_fe_wr(ppe->eth, REG_PPE_RAM_ENTRY(ppe2, i), ptr[i]);

I realise that a similar pattern it is already used elsewhere,
but '4' seems somewhat magic here.

...

