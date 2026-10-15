Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A34CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 13:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBqSEJS1pKlmdf3ndF5libgTsU24GBtrkgdWyEsVvC0=; b=SmaWtc26YNbjLRYwTw40yHdR3U
	9jp5HpU/ijDqFU9dkZctxkswhmXQFx60nYKD2t3Ms69C4OzRmh+o54BvKSXZOFCzE6igInS9QsA1n
	YNalo7/9CTlcNRlvCJ4EDWCdiCk8hpVY0LudZ25fgYTlOesmjVjAvjFNp3OkIwQ7yic+FtSpB13uY
	P6ckGYM0PAma5wpdkabqDKq09WLlrlDDqtb3uyPBgKSKoQvXOCBL4VWt/BkpZZTQF64Jtxiedjzuy
	nQ4CW+ev9xrAaJwmi7ycWeY7+2La+NEq1m+aIGN/KhhbdsFFrUloYcGABi1O0LuGNzgvKqha50ZOc
	B8gG39ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLRv-00000000FQT-33OA;
	Thu, 15 Oct 2026 13:24:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLRu-00000000FQ2-3NlW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 13:24:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4283B6020C;
	Thu, 15 Oct 2026 13:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0541F000C4;
	Thu, 15 Oct 2026 13:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792070686;
	bh=CBqSEJS1pKlmdf3ndF5libgTsU24GBtrkgdWyEsVvC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DtyPL9TiozyW9P2rRYtq2WOT/lRgIOwc68mh4Mn3huviP5OWls6WyR8q4PWcDdXQU
	 zkAGHQTdqrMIQrbD/38CjQ6VMTcYhjdTLruMdZ53E+KbAK9eMZA8gG00oLnjrlsqgn
	 Jeo40wExX/LQ1OBst6rMBue65usx3sG7T2IIeKG+emXIC5XJLMhKMwu/tf5pQaZPyc
	 Ov3PNzRpb6p6LI1RAM/2c2yG3DFFYGh8B6fsjUciksIIeIzI2gxKptv7DB3N69q2ph
	 z//9IN06Z1kvu2lbubltus3KSDwNRfL7P3M81VyS8jrPW/scen1evNeuC/qFFbM70g
	 KgpHR/6uio0Gg==
Date: Thu, 15 Oct 2026 14:24:40 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, dan.carpenter@linaro.org, d-gole@ti.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v9 09/13] powercap: arm_scmi: Enable multiple constraints
 support
Message-ID: <20261015-urban-porcelain-smilodon-edbc1d@sudeepholla>
References: <20260909220437.1254412-1-philip.radford@arm.com>
 <20260909220437.1254412-10-philip.radford@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909220437.1254412-10-philip.radford@arm.com>
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

On Wed, Sep 09, 2026 at 10:04:33PM +0000, Philip Radford wrote:
> From: Cristian Marussi <cristian.marussi@arm.com>
> 
> Initialize the domains with all the discovered available constraints,
> making available multiple per-domain constraints when the platform has
> advertised support for multiple concurrent power limits.
> 
> CC: "Rafael J. Wysocki" <rafael@kernel.org>
> CC: linux-pm@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> [Philip: Amended Copyright]
> Signed-off-by: Philip Radford <philip.radford@arm.com>
> ---
> V8->V9
> - Added validation check to make sure powercap domain doesn't have too
> many constraints
> ---
>  drivers/powercap/arm_scmi_powercap.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
> index 2d9370aaaf5d..bcd1ba0bde8c 100644
> --- a/drivers/powercap/arm_scmi_powercap.c
> +++ b/drivers/powercap/arm_scmi_powercap.c
> @@ -2,7 +2,7 @@
>  /*
>   * SCMI Powercap support.
>   *
> - * Copyright (C) 2022 ARM Ltd.
> + * Copyright (C) 2022-2026 ARM Ltd.
>   */
>  
>  #include <linux/device.h>
> @@ -491,7 +491,7 @@ static int scmi_powercap_register_zone(struct scmi_powercap_root *pr,
>  
>  	z = powercap_register_zone(&spz->zone, scmi_top_pcntrl, spz->info->name,
>  				   parent ? &parent->zone : NULL,
> -				   &zone_ops, 1, &constraint_ops);
> +				   &zone_ops, spz->info->num_cpli, &constraint_ops);
>  	if (!IS_ERR(z)) {
>  		spz->height = scmi_powercap_get_zone_height(spz);
>  		spz->registered = true;
> @@ -649,6 +649,13 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
>  		 */
>  		spz->info = powercap_ops->info_get(ph, i);
>  
> +		if (spz->info->num_cpli > MAX_CONSTRAINTS_PER_ZONE) {

Since MAX_CONSTRAINTS_PER_ZONE = 10 and our SCMI f/w can return upto 15,
we may have to warn or clamp it to 10 or both.

-- 
Regards,
Sudeep

