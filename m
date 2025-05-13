Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9A2C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 19:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v02MlTjPuKP4Y2/Qe6D/comJgBivOdHhNOC4o8MeDjc=; b=34Zp2JFOOUXp5QlQMy6YkbcxJt
	3RgMBlUGXdN21xHlOXDFq91pLp6HU2iYK1E0cPxJHFtUiVKsz48z7t5rHUiPvjMoqxdXoqfEX74V6
	JtbLmxtAnBvObXMOQwrBHMtXcS/olIyQNswHsOuZbQFhRuqOGm5XcMSGTMPS5+ArNL5pOqvIA4ktz
	9ms1CkPQYWbSHWcIIwgfR2tnozumytsARV4Qrd9jIbThUxKOR86/fp92QTQc+RduT5TD4aAFYIeIc
	+W8IBDcirqeYsTw4YBF6BzKhz8KJUrlslQ2e3n1WmPg06ZP+FgubCofSWqbBod7usCG1YVntmbWg9
	PR1AtM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvHd-0000000DN78-0iKb;
	Tue, 13 May 2025 19:27:21 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEucW-0000000DHQv-1UuY;
	Tue, 13 May 2025 18:44:54 +0000
Message-ID: <bb2a379e-c701-4b50-932a-20dcfbb0ebea@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747161888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v02MlTjPuKP4Y2/Qe6D/comJgBivOdHhNOC4o8MeDjc=;
	b=vJ6nDT005BmhxrNYGRvgIO27rdBpIdn0ygjz1B3IGq9kYoPpRsGiZ3iVRFkTdKnew/D7s8
	1V3JyVzOhj77HQPocNG+eJ6pyuGYyGTQTqkojHPO1hGqkRtik13SSX2567/RPy+PoULIJ5
	ENGe3Fe1y2vg27H+ZLguzuobLSOW51k=
Date: Tue, 13 May 2025 14:44:42 -0400
MIME-Version: 1.0
Subject: Re: [net-next PATCH v4 08/11] net: phylink: add .pcs_link_down PCS OP
To: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
 <20250511201250.3789083-9-ansuelsmth@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250511201250.3789083-9-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_114452_793281_F3175AA2 
X-CRM114-Status: GOOD (  20.22  )
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

On 5/11/25 16:12, Christian Marangi wrote:
> Permit for PCS driver to define specific operation to torn down the link
> between the MAC and the PCS.
> 
> This might be needed for some PCS that reset counter

Counters must be preserved across link u/down.

> or require special
> reset to correctly work if the link needs to be restored later.

Can you describe this in more detail?

> On phylink_link_down() call, the additional phylink_pcs_link_down() will
> be called before .mac_link_down to torn down the link.

tear

> PCS driver will need to define .pcs_link_down to make use of this.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/phy/phylink.c | 8 ++++++++
>  include/linux/phylink.h   | 2 ++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 1a4df0d24aa2..39cd15e30598 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1009,6 +1009,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
>  		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
>  }
>  
> +static void phylink_pcs_link_down(struct phylink_pcs *pcs)
> +{
> +	if (pcs && pcs->ops->pcs_link_down)
> +		pcs->ops->pcs_link_down(pcs);
> +}
> +
>  static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
>  {
>  	if (pcs && pcs->ops->pcs_disable_eee)
> @@ -1686,6 +1692,8 @@ static void phylink_link_down(struct phylink *pl)
>  
>  	phylink_deactivate_lpi(pl);
>  
> +	phylink_pcs_link_down(pl->pcs);
> +
>  	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
>  				   pl->cur_interface);
>  	phylink_info(pl, "Link is Down\n");
> diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> index c5496c063b6a..8b3d1dfb83a1 100644
> --- a/include/linux/phylink.h
> +++ b/include/linux/phylink.h
> @@ -494,6 +494,7 @@ struct phylink_pcs {
>   * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
>   * @pcs_link_up: program the PCS for the resolved link configuration
>   *               (where necessary).
> + * @pcs_link_down: torn down link between MAC and PCS.

ops documentation should use imperative verbs.

You are also missing the longer documentation below.

>   * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
>   *		     at the MAC.
>   * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
> @@ -521,6 +522,7 @@ struct phylink_pcs_ops {
>  	void (*pcs_an_restart)(struct phylink_pcs *pcs);
>  	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
>  			    phy_interface_t interface, int speed, int duplex);
> +	void (*pcs_link_down)(struct phylink_pcs *pcs);
>  	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
>  	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
>  	int (*pcs_pre_init)(struct phylink_pcs *pcs);


