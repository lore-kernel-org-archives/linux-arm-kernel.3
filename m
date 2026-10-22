Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF668606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jXKC/dcK;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MVQam7vH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jwzWAXvfUTkgeLv8Aw5G0qXBzZ6fF68PoWuXyb88RTA=; b=jXKC/dcKg7Pjfmh/9yHbVlUAS8
	jLyheuJLiky4H38NMeYTRKnMMnbh0ihvTd+VC7tNhEoE6u0qnqeyzEWf1qgLY1uqx/jfDOVmrhJPQ
	6SBomxXkUVsaLhYHoEAMkmgd7aRnzk27IezilqsmVy25BffndATw9DUtWn5Xm24i6gDGhZxphw2P/
	1Ehx+DhHG3L71e9AyKLBwHDAHyywMr8xJBcOZPChUcXXkigGisULZgwBwTZSCaTPKrlefzS6wv8OV
	89BkZqYBCWWcHGZV77LUnXW7qUIPgcTJVI2ovz5DNWQiJXrh9uUkhb+AkqMA9SjO7z3W1q0lAUnNb
	JhTWPsQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpkU-0000000DuUG-2cJE;
	Thu, 22 Oct 2026 10:10:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpkR-0000000DuU0-3yw2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 10:10:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 95130435CD;
	Thu, 22 Oct 2026 10:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66E21F000C1;
	Thu, 22 Oct 2026 10:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792663811;
	bh=jwzWAXvfUTkgeLv8Aw5G0qXBzZ6fF68PoWuXyb88RTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MVQam7vHOshySlx0woJKjJ+pJx7q1a4ToyjZOlqu4+uZCcUkF91PfNu29gpKBoSvf
	 lKG1OKAlcpVB4DJ3n1eJ78NvfasukZBM8+aFpQSDgJFVIue52RV9xRpJZC/FKFzt4L
	 nwmYi5jqa/8llmjs8xQpC8znNy5s/6wZEAlTZ52oN/QCWpqapdvNV9REkPpYN7hh36
	 3qXqPo5YUAM+gN+TO0HdR7HibaaADeN3DFbukoOnka5Z7SFdSEexTkyhDqnrlQODy9
	 6O4P40aBN25M6YEio0ni/NRXRGgAVd7i1Mr0QTAWaPkpFsILFyjCwVITEdlqaFw3jM
	 KyF6zfPjv6IQw==
Date: Thu, 22 Oct 2026 11:10:06 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, dan.carpenter@linaro.org, d-gole@ti.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH v9 03/13] firmware: arm_scmi: Refactor powercap domain
 layout
Message-ID: <20261022-spotted-impetuous-kittiwake-b2adcd@sudeepholla>
References: <20260909220437.1254412-1-philip.radford@arm.com>
 <20260909220437.1254412-4-philip.radford@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909220437.1254412-4-philip.radford@arm.com>
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

On Wed, Sep 09, 2026 at 10:04:27PM +0000, Philip Radford wrote:
> From: Cristian Marussi <cristian.marussi@arm.com>
> 
> SCMIv4.0 introduces the idea of an optional Concurrent Power Limit (CPL)
> for each powercap domain, where CPL0 coincides with the one and only
> per-domain constraint limit that was available in pre-v4.0 SCMI Powercap.
> 
> Refactor the powercap domain descriptors and powercap operations to allow
> future v4.0 extensions to cope with multiple CPLs.
> 
> While at that generalize the powercap protocol API to drop PAI references
> in favour of a more generic avg_ivl naming, since from v4.0 the number and
> types of averaging intervals will change in a non-backward compatible way,
> so let's bury these changes within the protocol layer.
> 
> Last but not least, make the necessary changes to the ARM SCMI Powwercap
> driver in order to support all of these new capabilities.
> 
> No functional change.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> [Philip: Adjusted domain_id comparitor in scmi_powercap_pai_get]
> Signed-off-by: Philip Radford <philip.radford@arm.com>
> ---
> V7->V8
> - Fixed conflict due to changes in 7.2-rc1
> ---
>  drivers/firmware/arm_scmi/powercap.c | 182 +++++++++++++++++----------
>  drivers/powercap/arm_scmi_powercap.c |  52 ++++----
>  include/linux/scmi_protocol.h        |  74 +++++++----
>  3 files changed, 189 insertions(+), 119 deletions(-)
> 
> diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
> index 96d55921fefc..7c2dbba5002c 100644
> --- a/drivers/powercap/arm_scmi_powercap.c
> +++ b/drivers/powercap/arm_scmi_powercap.c
> @@ -123,7 +123,7 @@ scmi_powercap_set_root_children_enable_state(struct scmi_powercap_root *pr, bool
>  
>  		if (!scmi_powercap_is_control_type_child(spz))
>  			continue;
> -		if (!spz->info->powercap_cap_config)
> +		if (!spz->info->cpli[0].cap_config)
>  			continue;
>  		if (prev_state[i] == enable)
>  			continue;

You seem to have left one use `powercap_cap_config` above this hunk which
breaks the build and hence build bisectability with this series.

-- 
Regards,
Sudeep

