Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0627B606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GAeWj4eE;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=i7gz2s1V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aZ3FSAhacOoA0G/LYvZBcAVEF7qI69cr77OqatyrH7k=; b=GAeWj4eEIeWLH1rKpqBH+xTfiv
	9knkvxi9uC8P9vsSHEM8lkAA3Fr41a1JyIHOCRB1WmpwuPtUC8TRAcKngQDGE2DW7pl0u+mErqjJg
	nxRCc2yQ6PzyvYvtDyB6L0F4FbJG1/RJRJV8yXRm5wyIR2iUXDDusIzaG2S3ZO1mb/b/4IgnSCFbV
	BvzSvkRcB2UOSXPgagfXZRNRzXXYkJGqo05Q873BNx4HvO7HOVytEfZ2hpJ4CLWKDyWpKJEwtQWFV
	QDaCyU2WcVsE/vQ9K11HuAcwPiGUhGFEkbCoR5DGGq8FKmbm4k+bXZw5oYopkt/UDqh1KcxFc5L+9
	p5yFYAzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpxD-0000000DvWh-3MiF;
	Thu, 22 Oct 2026 10:23:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpxA-0000000DvWD-2mMX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 10:23:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04ECF1595;
	Thu, 22 Oct 2026 03:23:14 -0700 (PDT)
Received: from e121740.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DDEB3F7B4;
	Thu, 22 Oct 2026 03:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792664597; bh=LlWXz+PA+zM435hlpcLMlUTS430tdpoSr+PxDjy+z5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i7gz2s1V+8RC3RRnbxmDymuL7h2jDLYk4Ge6j4Bzn2SRLYA7flQ08O1OMxby7Bu56
	 fhWnOI1gmkJasfrzwWWxO/ZndH9TcprW7UxVqeBKx6QilV93iAtNRoSjPa62tIPENr
	 TetS7yunMuQpOyiteMUIdn8f2NIqA0VkME13bNHs=
Date: Thu, 22 Oct 2026 11:23:04 +0100
From: Philip Radford <philip.radford@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, d-gole@ti.com, souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH v9 03/13] firmware: arm_scmi: Refactor powercap domain
 layout
Message-ID: <atnkCP6oB4xT65dV@e121740.arm.com>
References: <20260909220437.1254412-1-philip.radford@arm.com>
 <20260909220437.1254412-4-philip.radford@arm.com>
 <20261022-spotted-impetuous-kittiwake-b2adcd@sudeepholla>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-spotted-impetuous-kittiwake-b2adcd@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_032320_786958_A47717C9 
X-CRM114-Status: GOOD (  23.07  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 11:10:06AM +0100, Sudeep Holla wrote:
> On Wed, Sep 09, 2026 at 10:04:27PM +0000, Philip Radford wrote:
> > From: Cristian Marussi <cristian.marussi@arm.com>

Hi,

> > 
> > SCMIv4.0 introduces the idea of an optional Concurrent Power Limit (CPL)
> > for each powercap domain, where CPL0 coincides with the one and only
> > per-domain constraint limit that was available in pre-v4.0 SCMI Powercap.
> > 
> > Refactor the powercap domain descriptors and powercap operations to allow
> > future v4.0 extensions to cope with multiple CPLs.
> > 
> > While at that generalize the powercap protocol API to drop PAI references
> > in favour of a more generic avg_ivl naming, since from v4.0 the number and
> > types of averaging intervals will change in a non-backward compatible way,
> > so let's bury these changes within the protocol layer.
> > 
> > Last but not least, make the necessary changes to the ARM SCMI Powwercap
> > driver in order to support all of these new capabilities.
> > 
> > No functional change.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > [Philip: Adjusted domain_id comparitor in scmi_powercap_pai_get]
> > Signed-off-by: Philip Radford <philip.radford@arm.com>
> > ---
> > V7->V8
> > - Fixed conflict due to changes in 7.2-rc1
> > ---
> >  drivers/firmware/arm_scmi/powercap.c | 182 +++++++++++++++++----------
> >  drivers/powercap/arm_scmi_powercap.c |  52 ++++----
> >  include/linux/scmi_protocol.h        |  74 +++++++----
> >  3 files changed, 189 insertions(+), 119 deletions(-)
> > 
> > diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
> > index 96d55921fefc..7c2dbba5002c 100644
> > --- a/drivers/powercap/arm_scmi_powercap.c
> > +++ b/drivers/powercap/arm_scmi_powercap.c
> > @@ -123,7 +123,7 @@ scmi_powercap_set_root_children_enable_state(struct scmi_powercap_root *pr, bool
> >  
> >  		if (!scmi_powercap_is_control_type_child(spz))
> >  			continue;
> > -		if (!spz->info->powercap_cap_config)
> > +		if (!spz->info->cpli[0].cap_config)
> >  			continue;
> >  		if (prev_state[i] == enable)
> >  			continue;
> 
> You seem to have left one use `powercap_cap_config` above this hunk which
> breaks the build and hence build bisectability with this series.
> 

Apologies, I was sure I had tested breaking the build throughout the series.
I'll amend this.

Regards,
Phil

