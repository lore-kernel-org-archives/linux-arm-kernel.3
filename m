Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1B3CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EM0isG1R2tZbZPOEASuzPFyGqzGhpBbd9nur44vny0=; b=UmzFs7FoLyZ0Sy8ep3DPz20ZeT
	3w2X8MXnTDSYz2O5EZKDd/dk4ZOrS6fdv4vmc6sVM3k64pIIcpIdjKftFeabkWry43OmcFBK0NgDy
	35ZL6LuCfV2QqM1UmvitS9H01liB2z9G+iGXrEDWpj2gRYitw+d0qFyRBhPj7hvi1EUW9Fu8MZLFl
	WjdIc9/TOJKQQ5ttgLRcF8nY9pHHa2b6cXkfRAAP1DH9Jkde3jvnZ2AkVDCv6U/BtbBLSFrKjZPX3
	oLo0DyM5qjSp1mqB/Sw1ITpkEtsf7HX9QOXsEXmM22IILMuUm+o/MBc6MIDJZ/JKaD1+SHw0K6qyS
	epSS1AcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHS31-00000001L6k-44vF;
	Thu, 15 Oct 2026 20:27:31 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHS2y-00000001L64-2vpQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:27:30 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-82tq.prod.antispam.mailspamprotection.com; s=arckey; t=1792096048;
	 b=oqFn1zwNr8rjgc0OsUAvKyUFVqVyBA/QahlrkIXke/EeAFFllxHhrQWaGnyJQZyVnTPpZVZQ/j
	  XiTtj42nU3IqDK5Q5uiUMt/XhOfx7LiCshnDI9N18HhXqZLwEeN9snKt2h2R1dH+yrIlCXPpT+
	  rfwmC56axWq/uDcDQg6jUlg/GlcegwIDvMeGc7hRUF87wwDrXxRQN0HBluyn+hWeljQzl+By3N
	  KnEQBEsu9q1Cg0OkhsQdsxXx42FUOhBGi3nuTk2f+fxdwDSwov9yiWgK3DvOQoWYx6ZMdlRwdo
	  5wqGm6AXqetkn8Ap9L6VD7UI0+LZ5mw5c0rLXecK/fh5hQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-82tq.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-82tq.prod.antispam.mailspamprotection.com; s=arckey; t=1792096048;
	bh=Yj8ej3HBMwylXx0QuhOi40Co/oMLqb7i/qo+mVXTbS8=;
	h=Message-ID:Date:References:In-Reply-To:Cc:To:From:Subject:
	  Content-Transfer-Encoding:Content-Type:MIME-Version:DKIM-Signature:
	  DKIM-Signature;
	b=nS6H1ApsZQxjcC1rJ25vCnAFr/v0ggGKnHIk/vVAS2FVbS3kvyS9AUDpJdAn4zWJLzf7ekT7Il
	  Ee5MNTwdK1vsm6nwO0CXcomXVQoZJVKzQkZJf3g6dy0/ZjSb4Le43yayr2bkhrzuMcK3wyuCCd
	  6RSYZoT2od9zpEfHLs7zvIIaA+lGmZw8w3mpFWsgYdH/w1z+23GC3CW72vc7M1UI4Ml3f0qnVB
	  KkAi0wXvYGbhpBYI6IH05K+UH7Fb8FpBZnlBgnArcHkKouj5sRjZDGWJ7SG0rvTNJBomm+aUdd
	  cc6sujzhOKoDrBVUjFupX555cqXFKw3AXd+NX1fPqn2phw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Message-Id:Date:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:List-Unsubscribe;
	bh=9EM0isG1R2tZbZPOEASuzPFyGqzGhpBbd9nur44vny0=; b=hDmBhsJhP2aZ8TMzW6LxIvfOFt
	QewZwG6r1fYnud8zjIb6Qq0MPVBREp3Urv/Bi6CIqFkIPSSistNyb7lACsrmqhVDHEh3DYNzhtV5y
	GhwKfc8ER6RbUYVfPiA/qmL7/B4TigrU35aHE1wirojz997ahn2vvvz2dvQcy0v8ACEw=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-82tq.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xHS2r-00000005IXS-1lkW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Cc:To:From:Subject:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=9EM0isG1R2tZbZPOEASuzPFyGqzGhpBbd9nur44vny0=; b=IR5/yIam9SRLwaZzPBIrk6qjNc
	lw49C0/GBY/dgfo3XEngJyFDBhM1eMrF0dBZYXdjAxHcqYQJhi9vM+v/mf6JqhL/vrCQDRcq4hZzl
	YcC6I3bVytXQj9cNjbe8Nn4zGoNSr7JIgpGmG++y0XtKYweu+9kuPcP0vDCY/3OfhwL4=;
Received: from [82.89.62.246] (port=63238 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xHS2Y-00000000KBz-4A5Q;
	Thu, 15 Oct 2026 20:27:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rpoc: use memory-region-names
 to avoid hidden ABI
From: Francesco Valla <francesco@valla.it>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261015-memory-region-name-v5-2-abc358b39a96@nxp.com>
References: <20261015-memory-region-name-v5-0-abc358b39a96@nxp.com>
 <20261015-memory-region-name-v5-2-abc358b39a96@nxp.com>
Date: Thu, 15 Oct 2026 22:26:51 +0200
Message-Id: <179209601177.660553.12335999939165725188.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3455; i=francesco@valla.it;
 h=from:subject:message-id; bh=Yj8ej3HBMwylXx0QuhOi40Co/oMLqb7i/qo+mVXTbS8=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkXzQV8zrGv3qFZvuHfdcavcw5JyGvE3t2hvkJCM9fhb
 +PzUNfHHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBEek4yMpxxmVPFv+RHypGZ
 qkITFfPtpv8Nsglj8Te+cLinoCd7zQVGhp+Pr93cETK5eUfDuh3JS/e7fTi2Yds144OXmJpNHho
 dMeACAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: bcadfa8d176426f7c49b4cb4120b74a0
X-AntiAbuse: ID - bcadfa8d176426f7c49b4cb4120b74a0
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xHS2r-00000005IXS-1lkW-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-82tq.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_132729_166238_1B4B90F2 
X-CRM114-Status: GOOD (  19.53  )
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

Hello Frank,

> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI. Since memory node names are
> not constrained by the binding, incorrect names can silently pass DT
> validation, as seen in examples using "vdevbuffer" instead of
> "vdev0buffer" ([1] and [2]).
> 
> Parse memory-region-names to identify the expected memory regions and avoid
> relying on memory node names as ABI.
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 745ce52cd822..ce9bdfc1fa98 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -643,7 +643,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		int err;
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>  		if (err)
>  			break;
>  
> @@ -818,11 +818,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  	if (nph <= 0)
>  		return 0;
>  
> +	if (!of_property_present(np, "memory-region-names")) {
> +		dev_warn(dev, "using node names for carveouts should be avoided\n");
> +	} else {
> +		if (nph != of_property_count_strings(np, "memory-region-names")) {
> +			dev_err(dev, "invalid reserved memory name count\n");
> +			return -EINVAL;
> +		}
> +	}
> +
>  	/* remap optional addresses */
>  	for (a = 0; a < nph; a++) {
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, a, &res);
> +		err = imx_rproc_rmem_to_resource(np, a, &res);
>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
>  			return err;
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 0d7d48352a10..3632bc375c71 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -7,6 +7,8 @@
>  #ifndef _IMX_RPROC_H
>  #define _IMX_RPROC_H
>  
> +#include <linux/of_reserved_mem.h>
> +
>  /* address translation table */
>  struct imx_rproc_att {
>  	u32 da;	/* device address (From Cortex M4 view)*/
> @@ -45,4 +47,23 @@ struct imx_rproc_dcfg {
>  	u32				reset_vector_mask;
>  };
>  
> +static inline int imx_rproc_rmem_to_resource(struct device_node *np,
> +					     int index,
> +					     struct resource *res)
> +{
> +	int ret;
> +
> +	ret = of_reserved_mem_region_to_resource(np, index, res);
> +	if (ret)
> +		return ret;
> +
> +	/* "memory-region-names" is optional */
> +	ret = of_property_read_string_index(np, "memory-region-names",
> +					    index, &res->name);
> +	if (ret == -EINVAL)
> +		return 0;
> +
> +	return ret;
> +}
> +

Shouldn't this be a regular function in imx_rproc.c instead of being
defined as inline here? Keeping it in the driver source file would
probably make the logic easier to follow, also considering that the
presence of memory-region-names is evaluated there in
imx_rproc_addr_init().

>  #endif /* _IMX_RPROC_H */

Regards,
Francesco

-- 
Francesco Valla <francesco@valla.it>

