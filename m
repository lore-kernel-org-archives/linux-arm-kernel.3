Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3B0CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 02:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRvfGkadThN28A+4nC2mZwKCLc8uSYzi+IwPFo8dqgo=; b=sMF27U0m0u8nEG9VenQTxiW+O1
	+EDISFXJXfmJtPaJzLiTjP60Qd4AcsS+ekpRdlVubXbI+w1xxfWC+Ocxga1zWnIcElySDgXA5B8F/
	5AUoR3IpzOEAv18/dNCMNPtog9RShPhuFJKoBxHc5gfLXoF+DzOMRprRriAk8Z7Oj9/T6d1gDhWlM
	u2KlbI2GHglsNTgUz3tvTkxlitnlFQQTB22RpzNLLmVy3N2EOPP1gqFjSOAn7jts97hhlTrXnMXBl
	L9qqq7NfmfDYO751eV+42Lmo4gWNRJrBh+hpbOdGaLoKF2M3eIgT87GurvZwmQ+d16U4XLgq8HrXW
	5H2k/2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbEv-0000000E66B-1epO;
	Wed, 03 Jun 2026 02:21:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbEt-0000000E65j-2KTl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 02:21:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4E0160200;
	Wed,  3 Jun 2026 02:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD931F00898;
	Wed,  3 Jun 2026 02:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780453310;
	bh=oRvfGkadThN28A+4nC2mZwKCLc8uSYzi+IwPFo8dqgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Gwm9kMJCnF3gF3CphivIvgG3mf5yYW/gp5LUYZxwhcl4c+xKOdq7YZ1qRwF+2z9H9
	 oNPasZsY+xsWSponiJ3KIzpGFAQ268/n7s4YU4E1S5bg9jaKhe23zreY/3nUT5sx1h
	 OzXauVoWh4yToPAJW241oPZaedVYAkrXenJ7OKKuQztUnPUxSW4QlXkXBb88cHG/f3
	 lzsWN4Nu+JcFFiVz0bQ/HU+NxB/J2x8AkImK/pwxnUG4GU9NSOxq1AdyqCmfYT2/HN
	 2n0pX39ccUB3f8jpns2KkcS5JUdz977qvBG1WP0W1UGR6ihgmrAXEj/gj1qzJs2uDX
	 jj6PDfo0//oFA==
From: Jakub Kicinski <kuba@kernel.org>
To: lihaoxiang@isrc.iscas.ac.cn
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	kees@kernel.org,
	jacob.e.keller@intel.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: microchip: sparx5: clean up PSFP resources on flower setup failure
Date: Tue,  2 Jun 2026 19:21:48 -0700
Message-ID: <20260603022148.2296220-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529065615.35782-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260529065615.35782-1-lihaoxiang@isrc.iscas.ac.cn>
MIME-Version: 1.0
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: microchip: sparx5: clean up PSFP resources on flower setup failure

This patch adds error handling paths to sparx5_tc_flower_psfp_setup() so
that PSFP resources allocated earlier in the function are unwound when a
later step fails.

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c b/drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c
> index f779a5c00803..a17143953502 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c
> @@ -807,7 +807,7 @@ static int sparx5_tc_flower_psfp_setup(struct sparx5 *sparx5,
>  		/* Add new flow-meter */
>  		ret = sparx5_psfp_fm_add(sparx5, pol_idx, fm, &psfp_fmid);
>  		if (ret < 0)
> -			return ret;
> +			goto err_sg_del;
>  	}
>  
>  	/* Map stream filter to stream gate */
> @@ -816,7 +816,7 @@ static int sparx5_tc_flower_psfp_setup(struct sparx5 *sparx5,
>  	/* Add new stream-filter and map it to a steam gate */
>  	ret = sparx5_psfp_sf_add(sparx5, sf, &psfp_sfid);
>  	if (ret < 0)
> -		return ret;
> +		goto err_fm_del;
>  
>  	/* Streams are classified by ISDX - map ISDX 1:1 to sfid for now. */
>  	sparx5_isdx_conf_set(sparx5, psfp_sfid, psfp_sfid, psfp_fmid);
> @@ -824,13 +824,23 @@ static int sparx5_tc_flower_psfp_setup(struct sparx5 *sparx5,
>  	ret = vcap_rule_add_action_bit(vrule, VCAP_AF_ISDX_ADD_REPLACE_SEL,
>  				       VCAP_BIT_1);
>  	if (ret)
> -		return ret;
> +		goto err_sf_del;
>  
>  	ret = vcap_rule_add_action_u32(vrule, VCAP_AF_ISDX_VAL, psfp_sfid);
>  	if (ret)
> -		return ret;
> +		goto err_sf_del;
>  
>  	return 0;
> +
> +err_sf_del:
> +	sparx5_isdx_conf_set(sparx5, psfp_sfid, 0, 0);
> +	sparx5_psfp_sf_del(sparx5, psfp_sfid);
> +err_fm_del:
> +	if (pol_idx >= 0)
> +		sparx5_psfp_fm_del(sparx5, psfp_fmid);

[High]
Can the err_fm_del path leak a flow-meter refcount when the flow meter
was already in use?

Looking at sparx5_psfp_fm_add():

	ret = sparx5_psfp_fm_get(sparx5, uidx, &fm->pol.idx);
	if (ret < 0)
		return ret;
	/* Was already in use, no need to reconfigure */
	if (ret > 1)
		return 0;
	...
	*id = fm->pol.idx;
	return 0;

When the flow meter is already in use, sparx5_psfp_fm_add() returns 0
without writing back to *id, so the caller's psfp_fmid is left at its
initialized value of 0.

If sparx5_psfp_sf_add() or one of the vcap_rule_add_action_* calls then
fails, err_fm_del runs sparx5_psfp_fm_del(sparx5, 0). Pool ids appear to
be 1-based:

	u32 sparx5_pool_idx_to_id(u32 idx)
	{
		return ++idx;
	}

so id 0 has no valid LBSET, sparx5_sdlb_group_get_by_index() returns
-EINVAL, and sparx5_psfp_fm_del() aborts before reaching its
sparx5_psfp_fm_put() call:

	ret = sparx5_sdlb_group_get_by_index(sparx5, id, &fm.pol.group);
	if (ret < 0)
		return ret;

	ret = sparx5_psfp_fm_put(sparx5, id);

The refcount that sparx5_psfp_fm_get() incremented on the actually-reused
flow meter would not be decremented.

Would it work to either move the *id = fm->pol.idx; assignment before the
ret > 1 early return inside sparx5_psfp_fm_add(), or to call
sparx5_psfp_fm_del(sparx5, fm->pol.idx) at this cleanup site instead?

> +err_sg_del:
> +	sparx5_psfp_sg_del(sparx5, psfp_sgid);
> +	return ret;
>  }
>  
>  /* Handle the action trap for a VCAP rule */
-- 
pw-bot: cr

