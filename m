Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EADD2594F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53BvYz3/SPRYq30mBJV+ceu/2Ei+ykQW7AqcHlbYuOw=; b=pWS+bDMniONh7YcO97HkHdsecg
	ovJxD9c14mSpuh2dxmQ5+JxxZdajB6+gMYpk+WjXOdJXsp9wLkR8SeYQHOXD1BhmuQwcU29IXq+0Q
	WsefxDN5YfNCWEsXkv5F/mFQ3vZE08wPKJ4s799LvXQasHRVDhu3E2X/6vEHXLhoR74+8aKVSHBCs
	cilTr0GQf+VhUlDgxWvmy2b+lThMoRT1zf+60jTiMVIaeFN8eQeZ/QsQ5NaeZiE0v1lhWgVIbFi0i
	2dEROfdd5V2wkLgYqcFVRAdLrqUZZIxtDhsU9PnzAO362ExRNYPJbFXp4herfoLxGtzCJq6/qYIzp
	Mgt7eoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkp5-0000000EWZy-3Qs4;
	Tue, 27 Jan 2026 15:17:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkoz-0000000EWXT-3U22
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 15:17:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F29B2600AD;
	Tue, 27 Jan 2026 15:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81194C116C6;
	Tue, 27 Jan 2026 15:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769527056;
	bh=06YFaYPc4N1f9nnWVb6MYBol7sp8w7ue49DiDGANxVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHES0NxaudMq/qmeoTiz0aeclmGvJfz6FxHT6K36GqTbqX7FuX2L4MAYRvyv2v4+X
	 BO8l5M8snhZ8zh6nJ9R9fVzCk1PGKpa0Si8inyfomPFntwM/9OBbQEYi5+xV2hK9Zt
	 qRMHdYlFhrhArQZJJNNQoMB/UGmUjNpyKB0ttAxROg3Q8JEWRMqN2ZeLs4Yh2y8GiJ
	 RTfouRyNIM2aGEtnaMuLeCyPstykfmMm75Sb8mUaDNqSZNW1KN9ronMaiveSfvW+A5
	 qi47mLikdVZfjQDeb5VjMW11aG3f+FEG8+eJlswA8Muqs7glrWyhKuZxH4fXd5YFwx
	 ZeZoJNND0LucQ==
Date: Tue, 27 Jan 2026 09:17:35 -0600
From: Rob Herring <robh@kernel.org>
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v5 1/2] pmdomain: core: support domain hierarchy via
 power-domain-map
Message-ID: <20260127151735.GA1699112-robh@kernel.org>
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
 <20260122-pmdomain-hierarchy-onecell-v5-1-76855ec856bd@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-pmdomain-hierarchy-onecell-v5-1-76855ec856bd@baylibre.com>
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

On Thu, Jan 22, 2026 at 05:14:00PM -0800, Kevin Hilman (TI) wrote:
> Add of_genpd_[add|remove]_subdomain_map() helper functions to support
> hierarchical PM domains defined by using power-domains-map

power-domain-map. No 's'.

> property (c.f. nexus node maps in DT spec, section 2.5.1).
> 
> This enables PM domain providers with #power-domain-cells > 0 to
> establish subdomain relationships via the power-domain-map property,
> which was not previously possible.
> 
> These new helper functions:
> - uses an OF helper to iterate to over entries in power-domain-map
> - For each mapped entry: extracts child specifier, resolves parent phandle,
>   extracts parent specifier args, and establishes subdomain relationship
> - Calls genpd_[add|remove]_subdomain() with proper gpd_list_lock mutex protection
> 
> Example from k3-am62l.dtsi:
> 
>   scmi_pds: protocol@11 {
>       #power-domain-cells = <1>;
>       power-domain-map = <15 &MAIN_PD>,  /* TIMER0 */
>                          <19 &WKUP_PD>;  /* WKUP_TIMER0 */
>   };
> 
>   MAIN_PD: power-controller-main {
>       #power-domain-cells = <0>;
>   };
> 
>   WKUP_PD: power-controller-main {
>       #power-domain-cells = <0>;
>   };
> 
> This allows SCMI power domain 15 to become a subdomain of MAIN_PD, and
> domain 19 to become a subdomain of WKUP_PD.

One concern I have here is generally *-map is transparent meaning when 
you lookup <&scmi_pds 15>, &MAIN_PD is returned as the provider. It's 
also possible to have a map point to another map until you get to the 
final provider. The only way we have to support both behaviors is the 
consumer has to specify (i.e. with of_parse_phandle_with_args_map() vs. 
of_parse_phandle_with_args()), but the consumer shouldn't really know 
this detail.

Maybe a transparent map of power-domains would never make sense. IDK. If 
so, then there's not really any issue since the pmdomain core handles 
everyone the same way.

Rob

