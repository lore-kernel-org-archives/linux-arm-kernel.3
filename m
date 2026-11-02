Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140A6606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NV6iara2;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Zg48mlwk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jEXZn25mOSnRSnFkDPXVKbT86gLRaygrv7hBJoYn83Y=; b=NV6iara2Vmpkcj
	pOZ+UiZPCzutwJSEwckaWnldHAhym8pEBOOYV3V4O3oB5cq9YUKkQWCqwqxaTDNGxmWp2vUP+vfxb
	UCEfVAZDr7cpAkQJjmKPoNsZaIN8kA0jblwvAxvIHGg6Fn7CpfOdApBLWBoCSRmj2nS+7SLfvsQwF
	Kezmt+g/VuOWGaK9t3WDCRLO47QITwstnglA/j4EzD+SJgwqVTc4vkWDXd9dM7tvixh6EeeHNaolx
	F+P82El0CCCgskE9umDjg0YOOCeD+oIIvTZc1vffbQbKBGXlA+4iCWe33zMXYZ8YEFEL7f3V0KHTH
	Ad+K+mzLsT43C0i/nazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNomf-0000000G6Ny-33sy;
	Mon, 02 Nov 2026 09:56:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNomd-0000000G6Md-2RHr;
	Mon, 02 Nov 2026 09:56:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF3DE1595;
	Mon,  2 Nov 2026 01:56:48 -0800 (PST)
Received: from [10.57.16.53] (unknown [10.57.16.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E43FB3F59E;
	Mon,  2 Nov 2026 01:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613411; bh=a+LR+CmbFBIcR2fiRj3wp8/wI+yAEpxcNhNDKOn/P+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zg48mlwkHNaWfJLi8qkWbskLRD3Pspw0QyjdDGJgFahD1n2OQCvVFP2WKnQ6GxZG6
	 nbsNHPO6jsU2jOL517F/o6Cxqe5x79PUYiiL5XhOm8Bd/BYbyZUE72pzyB3COFi8C1
	 eagMYzWRrNx5SLM9k3X3rs43KFd3aK/61j/dJIio=
Message-ID: <3005f6f5-3b6a-4139-a170-1f60d93c9902@arm.com>
Date: Mon, 2 Nov 2026 09:57:20 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] powercap: dtpm: Use generic powercap hierarchy
 helpers
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, rafael@kernel.org,
 Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kselftest@vger.kernel.org
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
 <f34635d2ce1d5c741968708e6349f7f059b03173.1793288783.git.daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <f34635d2ce1d5c741968708e6349f7f059b03173.1793288783.git.daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_015655_735654_96633CCC 
X-CRM114-Status: GOOD (  30.58  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Daniel,

On 10/29/26 16:56, Daniel Lezcano wrote:
> DTPM implements its own hierarchy creation and destruction logic while
> the powercap core now provides generic helpers for this purpose.
> 
> Convert DTPM to use the generic powercap hierarchy infrastructure.
> Duplicate the platform hierarchy before creating it, and use
> powercap_hierarchy_create() and powercap_hierarchy_destroy() to manage
> the DTPM zones.
> 
> Add DTPM callbacks to create and destroy the zones associated with each
> powercap hierarchy node. Adapt the CPU and devfreq backends to return
> the created DTPM instance and use the node name provided by the
> hierarchy.
> 
> Convert the Rockchip RK3399 description to struct powercap_hierarchy
> and keep the device tree path as DTPM-specific node data.
> 
> This removes the DTPM-specific hierarchy traversal and destruction code
> and leaves the hierarchy management to the powercap core.
> 
> Preserve best-effort creation: an unavailable backend returns NULL to
> skip its branch, and setup failures are warned about and skipped rather
> than rolling back independent zones. Invalid node descriptors remain
> fatal.
> 
> When the representative CPU is offline, find an active policy through an
> online sibling whose related_cpus mask contains it. Hold the CPU hotplug
> read lock during selection and setup, and initialize the zone through the
> policy's active CPU while keeping the hierarchy-provided name. An entirely
> offline policy still has no active CPU to initialize through.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
> Changes in v4 (since v3):
> - Rebase on v7.3; no code or commit-description changes.
> 
> Changes in v3 (since v2):
> - Rebase on v7.3-rc7.
> - Preserve best-effort branch creation using the generic NULL result.
> - Find an online policy sibling for offline CPU representatives and
>    protect policy selection and setup against CPU hotplug.
> - Keep generic API behavior and documentation in patch 1.
> - Fix __initdata placement; match-table indentation is handled in patch 3.
> - Name setup callback arguments and remove whitespace-only lines.
> - Update the description.
> 
>   drivers/powercap/dtpm.c         | 177 +++++++++++++++-----------------
>   drivers/powercap/dtpm_cpu.c     |  62 ++++++++---
>   drivers/powercap/dtpm_devfreq.c |  22 ++--
>   drivers/soc/rockchip/dtpm.c     |  67 +++++++++---
>   include/linux/dtpm.h            |   6 +-
>   5 files changed, 195 insertions(+), 139 deletions(-)

Tha patch in general looks good. I only have one
comment related to the future usage of this mechanism.
For this implementation it's safe, but I would add
some extra safety net around the of_find_node_by_path().
See comments below.
[snip]

>   
> -static struct dtpm *dtpm_setup_dt(const struct dtpm_node *hierarchy,
> +static struct dtpm *dtpm_setup_dt(const char *name, const char *path,
>   				  struct dtpm *parent)
>   {
>   	struct device_node *np;
> -	int i, ret;
> +	struct dtpm *dtpm = NULL;
> +	int i;
>   
> -	np = of_find_node_by_path(hierarchy->name);


I would add a NULL check for 'path' here, or below
where dtpm_setup_dt() is called.

Usually it's up the the code which is calling that API
to make sure that the NULL is not sneaked in.
We probably can force drivers code for that, right?

> +	np = of_find_node_by_path(path);
>   	if (!np) {
> -		pr_err("Failed to find '%s'\n", hierarchy->name);
> +		pr_err("Failed to find '%s'\n", path);
>   		return ERR_PTR(-ENXIO);
>   	}
>   
>   	for (i = 0; i < ARRAY_SIZE(dtpm_subsys); i++) {
> +		struct dtpm *tmp;
>   
>   		if (!dtpm_subsys[i]->setup)
>   			continue;
>   
> -		ret = dtpm_subsys[i]->setup(parent, np);
> -		if (ret) {
> -			pr_err("Failed to setup '%s': %d\n", dtpm_subsys[i]->name, ret);
> -			of_node_put(np);
> -			return ERR_PTR(ret);
> +		tmp = dtpm_subsys[i]->setup(parent, np, name);
> +		if (IS_ERR(tmp)) {
> +			pr_err("Failed to setup '%s': %ld\n",
> +			       dtpm_subsys[i]->name, PTR_ERR(tmp));
> +			dtpm = tmp;
> +			break;
> +		}
> +
> +		if (tmp) {
> +			dtpm = tmp;
> +			break;
>   		}
>   	}
>   
>   	of_node_put(np);
>   
> -	/*
> -	 * By returning a NULL pointer, we let know the caller there
> -	 * is no child for us as we are a leaf of the tree
> -	 */
> -	return NULL;
> +	return dtpm;
>   }
>   
> -typedef struct dtpm * (*dtpm_node_callback_t)(const struct dtpm_node *, struct dtpm *);
> -
> -static dtpm_node_callback_t dtpm_node_callback[] = {
> -	[DTPM_NODE_VIRTUAL] = dtpm_setup_virtual,
> -	[DTPM_NODE_DT] = dtpm_setup_dt,
> -};
> -
> -static int dtpm_for_each_child(const struct dtpm_node *hierarchy,
> -			       const struct dtpm_node *it, struct dtpm *parent)
> +static struct powercap_zone *
> +dtpm_node_create(struct powercap_control_type *pct, const char *name,
> +		 void *data, struct powercap_zone *parent)
>   {
> +	struct dtpm_node *node = data;
> +	struct dtpm *dtpm_parent = parent ? to_dtpm(parent) : NULL;
>   	struct dtpm *dtpm;
> -	int i, ret;
>   
> -	for (i = 0; hierarchy[i].name; i++) {
> +	if (!node)
> +		return ERR_PTR(-EINVAL);
> +
> +	switch (node->type) {
> +	case DTPM_NODE_VIRTUAL:
> +		dtpm = dtpm_setup_virtual(name, dtpm_parent);
> +		break;
> +	case DTPM_NODE_DT:

... or a NULL check here.

> +		dtpm = dtpm_setup_dt(name, node->path, dtpm_parent);
> +		break;
> +	default:
> +		return ERR_PTR(-EINVAL);
> +	}


The rest looks good.

If we are sure we would never experience that NULL ptr coming to those
registration callbacks - then OK.

Regards,
Lukasz

