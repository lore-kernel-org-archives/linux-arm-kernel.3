Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4C9606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iNJvykJc;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=B4H5r8BQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9sHZp3fDT8MdLdnD1VHW6kDwokQ+jpK3v6Y8Al7fDoQ=; b=iNJvykJcXuTA+Y
	jVGhvtQlnRkZo7hXWZ5r+qCo2zGZfe7aG5lgPcNOME1PUp/nFRb1IEZuIQ2csQzVXmbWvaPFSnyXi
	0nam4NGT8L9/R94DF+JMX3EUtC/MxO5g6LxgPNZFkQbMcQ8MFeSF5RvCYMgRhODF524fOHPenYUCB
	8YKgVSxjBJr5KMF2wPec/wK/1ECp7RNORycbfF5Baqs6qfpnpBj2Za1CqaT5RuN6mypjRoz/3uz1b
	ZXrIIdp6f2Xtxy7W05WLLzN8Pl7/y9ddSCgpRUZHjERBLnF+f+kw9f6CjFnfuIH53KH5NY2H03FXh
	H7zcvVmgIr6BRHodsVKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD8e-00000002IRz-3W06;
	Tue, 03 Nov 2026 11:57:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD8c-00000002IRA-3Wfr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:57:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83B601576;
	Tue,  3 Nov 2026 03:57:10 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 941063F632;
	Tue,  3 Nov 2026 03:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793707033; bh=us62N1Qh+XhSeUo46jRNGcqbJBHkV+YCfxCCeXzVRMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B4H5r8BQqwIt2/HR5mOlOrXioVnMbhotHQ68IoF6WbYl1/rD5FVK9o4uwhF+OoEbz
	 gJuOzMQ9Mzd9th9Aa1Aq1cNc24iXmecXv09Bk7VS4O65x+rSCSZ6IWdUW/ZZlRTlh0
	 WJgsSTenzcD6HCwLfQ5rMccoRdRcuWVppmVZuqjc=
Message-ID: <c6213995-fa80-40ab-a5ea-5d1072e70ad2@arm.com>
Date: Tue, 3 Nov 2026 11:57:10 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH] arm_mpam: Only program MATCH_PMG when the monitor
 supports it
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
 <20261103095526.238470-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261103095526.238470-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_035715_141307_B520A1B3 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

On 03/11/2026 09:55, Ping Li wrote:
> Hi Ben,
> 
> Sharing the outcome of our discussions with the hardware team and Arm
> support, to close this thread:
> 
> Although the MPAM specification allows up to 8 bits of PMG, our
> hardware team found that the DSU120AE and the Cortex-A520 only
> propagate 1 bit of PMG. Assuming 1 bit was as good as none, and
> without consulting the software team, they considered the 2 monitor
> groups it would allow dispensable. So the MSC they designed
> implements MSMON but no PMG support, and the bus carries PARTID only,
> without the PMG bit.

Thanks for sharing this information. 1 bit of PMG is common because
until recently CHI didn't allow more.

Ben

> 
> Sorry for the noise again on this one, and thanks for the pointers.
> 
> Ping


