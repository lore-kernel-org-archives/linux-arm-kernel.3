Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B800606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 10:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=odXiq7R3;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ysvry8ZX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N9HHi9fwsvtU7offP25Wt0v5zoGj3/L7qJNeRlZeT70=; b=odXiq7R32V1+5r
	gxbuJI6ttnQhIONppTaL1E6YeDRpoDZ+2SfOpqiPE3kBOCaLcclEkHd3CczavRRTIagMHtfrXo9X7
	pPGDyIQMFElEN5Qk8O3DwUVEuheUCOUGjkAphMJM3Bqw2AZHMG3v5flJpU9k4enNvvLpRkRDg7707
	or/zu8sLvMbD4TclmGfgRu8882nWo0OgfQsPPsuliMskeF0DYcpbmk14yVKKZPY7lt46JAJONJU7j
	fdF2t1bUQuYIdsv0S/9Z+sZ2l9kykF02Gm+d/2DHW2jQW6AI6MWM0lZmvPtVEsk2Z9Hcuc+Xmw9Id
	Lr4bnPJBK/cNwVjAhU9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqIZ-0000000DxM4-44h4;
	Thu, 22 Oct 2026 10:45:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqIX-0000000DxKw-249C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 10:45:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99D682C41;
	Thu, 22 Oct 2026 03:45:18 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D4D23F7B4;
	Thu, 22 Oct 2026 03:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792665921; bh=3X3M0isCHv6Nxso4ETuGI+iVhS7OfF0HzavL3Pe1L5Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ysvry8ZXBjN5H5Sa8n2Coo4qA4hYONE9ARB0xYkDq400NhtvRacaBACac238WWGzK
	 gtdPXPBH5l1VXOSE7ctgVVxROasRRgctXfzScNG7d5P+8MeRRl9OLEbnWm73LoO9UT
	 5NHiXmkt+7hHvmraRUYBIdQh1z3a6C67ph3Hl4OI=
Message-ID: <05e5d99a-c12f-4fb9-b632-2301f21d54c7@arm.com>
Date: Thu, 22 Oct 2026 11:45:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/10] arm_mpam: resctrl: Separate MPAM domains
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1792443633.git.reinette.chatre@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <cover.1792443633.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_034525_635299_715A42B4 
X-CRM114-Status: GOOD (  28.89  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Reinette,

On 19/10/2026 23:07, Reinette Chatre wrote:
> RFC v1: https://lore.kernel.org/lkml/85ca29e89eacf12cfa7071249419e7cadb8f0691.1788220029.git.reinette.chatre@intel.com/
> 
> The MPAM driver represents a resctrl domain with a single structure,
> struct mpam_resctrl_dom, that holds both a control domain and a
> monitoring domain. On a system that supports both allocation and
> monitoring, one instance is created for each domain and its two
> domains are added to the resource's control and monitoring domain
> lists.
> 
> Holding both domains in one structure requires control and monitoring
> to be done at the same scope, and ties each control domain to a
> monitoring domain. This does not fit the proposed support for multiple
> controls per resource [1]. There, each control of a resource, for
> example a "min" and a "max" memory bandwidth control, has its own list
> of control domains while the resource keeps a single list of
> monitoring domains. With one structure for both, every control domain
> would come with a monitoring domain of its own, which does not reflect
> the resource.
> 
> This series gives control and monitoring domains their own structures,
> set up and torn down independently as CPUs come online and go offline,
> in preparation for supporting multiple controls per resource. Along
> the way it stops failing CPU online when a domain cannot be set up,
> and adds checks when setting up a monitoring domain.
> 
>   1-2   Preparatory cleanups of domain allocation
>   3     Do not fail CPU online when domain setup fails
>   4-6   Separate the control and monitoring domain structures
>   7-9   Checks when setting up a monitoring domain
>   10    Comment update, kept separate for review
> 
> An earlier version of the domain split was posted on its own [2]. This
> version incorporates the feedback from that discussion. It gives each
> type of domain its own structure instead of duplicating the shared
> one, sets up each domain independently instead of undoing one domain
> when setting up the other fails, and adds the checks in patches 8 and
> 9.
> 
> Patch 7 turns a WARN_ON_ONCE(0) into a warning that fires. It is a
> separate patch because it is not clear whether the silent failure was
> intended. If it was, the patch can instead drop the dead
> WARN_ON_ONCE().
> 
> This is an RFC because I am only able to compile test MPAM changes,
> which is also why the patches are small and each change is justified
> on its own. Patches can be squashed if preferred, for example patch 10
> into patches 5 and 9. Testing on MPAM hardware would be greatly
> appreciated, as is any other feedback.

On an initial look through the patches everything seems sensible and in line with what we discussed
previously. I've given it a quick sanity check on a couple of models and nothing goes wrong. Is
there any particular shape of system needed to exercise corner cases? I'll try with monitor only
systems and control only systems and do some more testing on real hardware as well.

Thank you very much for taking so much care over the MPAM side of things.

Ben

> 
> The series is based on the for-next/mpam branch of the arm64 tree:
> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
> 
> [1] https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/
> [2] https://lore.kernel.org/lkml/85ca29e89eacf12cfa7071249419e7cadb8f0691.1788220029.git.reinette.chatre@intel.com/
> 
> Reinette Chatre (10):
>   arm_mpam: resctrl: Use find_component() when allocating a domain
>   arm_mpam: resctrl: Rename ctrl_comp in mpam_resctrl_alloc_domain()
>   arm_mpam: resctrl: Do not fail CPU online when domain setup fails
>   arm_mpam: resctrl: Split control and monitoring domain setup into
>     helpers
>   arm_mpam: resctrl: Give the monitoring domain its own structure
>   arm_mpam: resctrl: Rename struct mpam_resctrl_dom to
>     mpam_resctrl_ctrl_dom
>   arm_mpam: resctrl: Warn when no monitoring component is found for a
>     CPU
>   arm_mpam: resctrl: Require a component for each monitoring event
>   arm_mpam: resctrl: Require monitoring components to cover the same
>     CPUs
>   arm_mpam: resctrl: Update the comment on monitoring domain setup
> 
>  drivers/resctrl/mpam_devices.c  |   2 +-
>  drivers/resctrl/mpam_internal.h |  11 +-
>  drivers/resctrl/mpam_resctrl.c  | 325 +++++++++++++++++---------------
>  3 files changed, 181 insertions(+), 157 deletions(-)
> 
> 
> base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad


