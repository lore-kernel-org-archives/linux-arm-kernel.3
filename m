Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05DE607887A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 16:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y/vlQxyH;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Fvk+ieH9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gsEr2G1VwbZm52swmf076sFC83cmok9s9GQszaBVCY=; b=Y/vlQxyHa+sSTOJxpv+yfUpTno
	kZfSm+ezTjvIQ7iwWjJEC5mgC7243a1W1LpYtP4nMOYfrEr3slTL4yWXONpCQ+vkZ6mQMbIizzZF9
	1WZFr3Sh3R+L619Ob5c4A5YbD+HNk0mgVLKKWIHILLpJSBNUmttfoFA8b0DiJ33zO/j/6/rxBlzmJ
	8pUTI+1h3+RhJFyF8gWrLsnPotkia+OVDCKHK4d5keJWqULg8iXkbX06rZsNxf5AgwVaGpYWZW7aZ
	XzqNONW/VubHpJzk5vbOPiLIOqyKom9F/8z7peLUjNAYn/exvYwRFETzglMveJNqOboq1xVlBontu
	JaLiqF/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIps1-00000007vYp-3AsD;
	Mon, 19 Oct 2026 16:05:53 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIprw-00000007vWv-0l6R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 16:05:51 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DCFF34;
	Mon, 19 Oct 2026 18:03:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792425820;
	bh=Tji3ce7axDGovYVH1z8z/SIxY8WW+5ipBeaPIkgyp3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fvk+ieH9IiJVLS9ig2NlDKwCLpL5+yVojSBaFdNvz8euWU4/jB45zf/1viU5hzYZ5
	 oxP7KKZvxce01Zj0TJjF4Ta6ANjU3Q6aQ+XOcPzDEFEsnd6KP8pmNxp+xcMXX8LmnQ
	 B/d35X44Ul2i1POjDeKFdMqfIouBTS44NJswxY1c=
Date: Mon, 19 Oct 2026 19:05:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return
 -EPROBE_DEFER
Message-ID: <20261019160545.GC3705@killaraus.ideasonboard.com>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_090548_364286_082AB62B 
X-CRM114-Status: GOOD (  24.38  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Geert,

Thank you for the patch.

On Fri, Oct 16, 2026 at 05:55:44PM +0200, Geert Uytterhoeven wrote:
> Unlike provider-based look-up functions in other subsystems[1],
> genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> the provider is not found, thus not supporting probe deferral.
> Currently this is worked around in of_genpd_add_subdomain() by remapping
> -ENOENT[2].

But not in the other functions calling genpd_get_from_provider() and
propagating the error up. Have you validated that no existing call
stacks will break ?

> Fix this for all current and future callers by returning -EPROBE_DEFER
> instead, and drop the no longer needed remapping code.
> 
> [1] of_clk_get_hw_from_clkspec(), __fwnode_reset_control_get()),
> [2] Commit 18027d6f392ee8d8 ("PM: domains: Make of_genpd_add_subdomain()
>     return -EPROBE_DEFER").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - New.
> ---
>  drivers/pmdomain/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 964e44c2f78f1d55..88c886814a5b9da3 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3021,7 +3021,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>  static struct generic_pm_domain *genpd_get_from_provider(
>  					const struct of_phandle_args *genpdspec)
>  {
> -	struct generic_pm_domain *genpd = ERR_PTR(-ENOENT);
> +	struct generic_pm_domain *genpd = ERR_PTR(-EPROBE_DEFER);
>  	struct of_genpd_provider *provider;
>  
>  	if (!genpdspec)

Expanding the context:

>		return ERR_PTR(-EINVAL); 
>					
>	mutex_lock(&of_genpd_mutex);
>	
>	/* Check if we have such a provider in our array */
>	list_for_each_entry(provider, &of_genpd_providers, link) {
>		if (provider->node == genpdspec->np)
>			genpd = provider->xlate(genpdspec, provider->data);
>		if (!IS_ERR(genpd))
>			break;
>	}
>
>	mutex_unlock(&of_genpd_mutex);
>	
>	return genpd;

The for loop seems to imply that we can have multiple providers for the
same node. In case a provider fails, the function overrides the error
code from -EPROBE_DEFER to whatever the first xlate() returns. That may
cause issues for your use case.

If the of_genpd_providers list doesn't expect multiple providers per
device node, I would change the above into

	list_for_each_entry(provider, &of_genpd_providers, link) {
		if (provider->node == genpdspec->np) {
			genpd = provider->xlate(genpdspec, provider->data);
			break;
		}
	}

to make it explicit.

> @@ -3276,7 +3276,7 @@ int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
>  out:
>  	mutex_unlock(&gpd_list_lock);
>  
> -	return ret == -ENOENT ? -EPROBE_DEFER : ret;
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_add_subdomain);
>  

-- 
Regards,

Laurent Pinchart

