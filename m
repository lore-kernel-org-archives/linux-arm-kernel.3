Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1964F6082BEA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XHAf+hqV;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hU3C0FQ6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EHw38eN6k0S5PS2GsJCCIBq6WinXXG92Pz27LCOAbJ4=; b=XHAf+hqVSIIlCy
	wNwCvRbTIR+eKvoUZ7TF+C68Pgjb0ydgY6GEyB3Khr+br+3rfQSS732jzSq/U/ZrKZT4gZiEGtb0J
	WqC5EvrX0+QbtOUgoLq5EgIgbJN2Q+Q410KevMQjFJvNVIGIMsrhLlsivi3NcHW4j781g9X8JtwjP
	gI+k4ARZ9dLb9af8uYS13WFpFYNYyBjLdHvNaaMDAIGWGxnFNVI+Gwr6dZ39oS+ZngZqilRxD07FM
	Fg1PHx+wG+jlk6cXsjyfKcI4xpDNrm77WXHNKxmvwwX1RqT9iLcXBMRB6/D3RbnhPZyKiTV7KwexZ
	coBG7xUgy56tUEKvheWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD2G-00000002HNL-1b6k;
	Tue, 03 Nov 2026 11:50:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD2D-00000002HM9-1MGx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:50:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18C8E1691;
	Tue,  3 Nov 2026 03:50:31 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2185F3F632;
	Tue,  3 Nov 2026 03:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793706634; bh=RNsb2c+IWPbtzdn1kpsrH4bVFNQRQRVMo/MtYmG/t8A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hU3C0FQ6kf3yBRUnF5y2GzAQ8LrgdiyU5Gx73gUkAsW4hZ6XKIZHsa/EXx9rUQU4L
	 Ds/Gwhdd+2RDxfB3SmEM7faltIBC2vAN930vp2/7miQcAIZbwmbfPqVIBClJ67QUZa
	 RsGhsAIRcgZP/IP6utP3Ae01c+NKsOOC7NTHG+zI=
Message-ID: <9fac528e-d7b4-4052-8e50-4f4fae27b95b@arm.com>
Date: Tue, 3 Nov 2026 11:50:24 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH] arm_mpam: Only program MATCH_PMG when the monitor
 supports it
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
 <20261103023742.2624994-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261103023742.2624994-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_035037_495110_C86414EA 
X-CRM114-Status: GOOD (  13.27  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ping,

On 03/11/2026 02:37, Ping Li wrote:
> Hi Ben,
> 
> Sorry to bother you again. I was looking at how the driver derives
> mpam_pmg_max, and I think there is a similar blind spot:
> 
> mpam_msc_hw_probe() folds every MSC's MPAMF_IDR.PMG_MAX into the
> global mpam_pmg_max, regardless of whether the MSC has any monitors.
> 
> Concretely, on our platform the DSU has no monitors and reports
> PMG_MAX=1. Our memory controller MSC has monitors and currently
> reports PMG_MAX=0, but if we later add PMG support and report
> PMG_MAX=31, the global value would still be clamped to 1 by the DSU,
> and resctrl would only expose 2 RMIDs per CLOSID instead of 32.
> 
> Should the convergence only consider MSCs that have monitors?

No, the PMG_MAX can also indicate the largest propagated and so still
needs to be taken into account. Rules I_GSHTX and I_BTFZC are relevant here.

Thanks,

Ben

> The PE-side value from MPAMIDR_EL1.PMG_MAX would still apply, as
> that is the maximum PMG the cores can tag traffic with.
> 
> Thanks,
> Ping


