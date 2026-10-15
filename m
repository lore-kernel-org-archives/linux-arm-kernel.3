Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2BDCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fj8G0lh/T0uv2YxD5gx/OqL46rcU+a5LXrh9IDCCfAM=; b=gffHRJ+Tw89p2ghP8XJQtX5bkp
	pSHXjv8Tmtal3XL3WKJ9D1VXguDxLRwE49Ez4D6+iho5iIJPvgMC+Ef5FyRaEhzohWPOSrwD3YKL/
	G9PNuxJH4xkH/pNNifu/l9//0N67nC314dDN6ldQYpoCJFbj6/ILUKMQcihHMWCzsQGfHa+3K8eAg
	jlssER/qOdllXx6Tn+K2vIP/ZZu9tx3OuZzd6pT2gNnpVF87I9bscqTx6aGFPbu90Ai+mIZ/Fhdeh
	rP2T8yHBu2X0HLEBBHQ8Jkkk1tEhRtPRoUnLm8d99tt5txQpBoGw61iB7zP55CO7zZs7kkpkNQaUs
	MamkUYYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMVw-00000000Ohb-2P5i;
	Thu, 15 Oct 2026 14:33:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMVr-00000000OgB-03lW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:32:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0A171477;
	Thu, 15 Oct 2026 07:32:50 -0700 (PDT)
Received: from e121740.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 238BA3F871;
	Thu, 15 Oct 2026 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792074773; bh=qyawegKgr7KmH/89SsM3Ua3ftIQXLYUPg7IMiER6aPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u6duZc4/VnqunKshGSpsjVhyxzmOxOYIac1TTevcRt1EAB8yLhwmsW9U8FAEVtEMq
	 I+YJGaLUhefbS1+H94N1jGgqB6Vkh25ty1vgtGzzjV0s7SHCpu6Ljx6N5VAGgTG8kZ
	 +7QSS3qF29tjLi60tPDAwNUHWJQTo46IDhEQGhzk=
Date: Thu, 15 Oct 2026 15:32:42 +0100
From: Philip Radford <philip.radford@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, d-gole@ti.com, souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v9 09/13] powercap: arm_scmi: Enable multiple constraints
 support
Message-ID: <atDjzW/XnTVLlR9S@e121740.arm.com>
References: <20260909220437.1254412-1-philip.radford@arm.com>
 <20260909220437.1254412-10-philip.radford@arm.com>
 <20261015-urban-porcelain-smilodon-edbc1d@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-urban-porcelain-smilodon-edbc1d@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_073255_099942_D42A8FA0 
X-CRM114-Status: GOOD (  20.37  )
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

On Thu, Oct 15, 2026 at 02:24:40PM +0100, Sudeep Holla wrote:
> On Wed, Sep 09, 2026 at 10:04:33PM +0000, Philip Radford wrote:
> > From: Cristian Marussi <cristian.marussi@arm.com>
> > 

Hi,

> > Initialize the domains with all the discovered available constraints,
> > making available multiple per-domain constraints when the platform has
> > advertised support for multiple concurrent power limits.
> > 
> > CC: "Rafael J. Wysocki" <rafael@kernel.org>
> > CC: linux-pm@vger.kernel.org
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > [Philip: Amended Copyright]
> > Signed-off-by: Philip Radford <philip.radford@arm.com>
> > ---
> > V8->V9
> > - Added validation check to make sure powercap domain doesn't have too
> > many constraints
> > ---
> >  drivers/powercap/arm_scmi_powercap.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
> > index 2d9370aaaf5d..bcd1ba0bde8c 100644
> > --- a/drivers/powercap/arm_scmi_powercap.c
> > +++ b/drivers/powercap/arm_scmi_powercap.c
> > @@ -2,7 +2,7 @@
> >  /*
> >   * SCMI Powercap support.
> >   *
> > - * Copyright (C) 2022 ARM Ltd.
> > + * Copyright (C) 2022-2026 ARM Ltd.
> >   */
> >  
> >  #include <linux/device.h>
> > @@ -491,7 +491,7 @@ static int scmi_powercap_register_zone(struct scmi_powercap_root *pr,
> >  
> >  	z = powercap_register_zone(&spz->zone, scmi_top_pcntrl, spz->info->name,
> >  				   parent ? &parent->zone : NULL,
> > -				   &zone_ops, 1, &constraint_ops);
> > +				   &zone_ops, spz->info->num_cpli, &constraint_ops);
> >  	if (!IS_ERR(z)) {
> >  		spz->height = scmi_powercap_get_zone_height(spz);
> >  		spz->registered = true;
> > @@ -649,6 +649,13 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
> >  		 */
> >  		spz->info = powercap_ops->info_get(ph, i);
> >  
> > +		if (spz->info->num_cpli > MAX_CONSTRAINTS_PER_ZONE) {
> 
> Since MAX_CONSTRAINTS_PER_ZONE = 10 and our SCMI f/w can return upto 15,
> we may have to warn or clamp it to 10 or both.
> 

Noted. I will address this in the next version, thank you.

Regards,
Phil

