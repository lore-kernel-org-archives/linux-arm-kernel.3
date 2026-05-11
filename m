Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE83CD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFUvPTiGlfaEQ9Bwb+PHHQUmGBEkbhOA+etu+zwYPxg=; b=QXQnDCvF8/4Wqv6bJWqB4FKbE2
	IWZIMiuHodW8VWdM1R30SyodyJBHu4o7UtWUwbUs9cfdSeLIlLOwrFwdgKjy9pL+M7NWYay+5WGlr
	2gpxd11Dz3Jw/pzRIGh3+c70+x1FdBtve5AIYGyqTgBIkHs/ZUrFjj7qMtVL9lT1EYb8UTXjGLxr7
	vjP1Ug0CfWgK0y7mphj1IIiJuyoHWOcqNcSbKhCjE4Y0BoPY38lEv/L4TEBVBLGLhieS6tvuDY71m
	qTwJl1clS7WJvTmi13zyIdpz6P/kmrgby+SFyOsSDIFjAM/21avbRGi432aKJjH0V4ksoUPrzgIeA
	BEEAgQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOjK-0000000DJ2d-2U6U;
	Mon, 11 May 2026 11:23:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOjI-0000000DJ1v-1Opu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:23:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 365ED1595;
	Mon, 11 May 2026 04:23:14 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA0623F85F;
	Mon, 11 May 2026 04:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778498599; bh=ujSNN5cWvyVF4S7u0xQhZ8A7OACXeRpz8CHJJ9Km52s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ExM/W6Gg77bcfApdpGJciBaAvdH7139GgDEcOofjZbg2BSobdkpa4CNZbzyPQlc6E
	 9NkzY+NMBULB3Ek4UkLc52PczZaYW42DWOt9c6dV4tjr2tMGlSxHAFyX5+is8jC1dY
	 X01tGcetMpeqR+habgv5l96Rjlw+ea4Rt4mn4h1Q=
Message-ID: <043ecb1b-6c22-460a-bacc-e853b45c5808@arm.com>
Date: Mon, 11 May 2026 12:23:16 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v3 2/4] arm_mpam: Check whether the config array is
 allocated before destroying it
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, zengheng4@huawei.com
Cc: wangkefeng.wang@huawei.com, xry111@xry111.site, catalin.marinas@arm.com,
 yang@os.amperecomputing.com, reinette.chatre@intel.com, will@kernel.org,
 thuth@redhat.com, mrigendra.chaubey@gmail.com, fenghuay@nvidia.com,
 ahmed.genidi@arm.com
References: <20260508162341.3762549-1-james.morse@arm.com>
 <20260508162341.3762549-3-james.morse@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260508162341.3762549-3-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_042320_505757_62C58020 
X-CRM114-Status: GOOD (  13.82  )
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

Hi James,

On 5/8/26 17:23, James Morse wrote:
> __destroy_component_cfg() is called to free the configuration array.
> It uses the embedded 'garbage' structure, which means the array has
> to be allocated.
> 
> If __destroy_component_cfg() is called from mpam_disable() before the
> configuration was ever allocated, then a NULL pointer is dereferenced.
> 
> Check for this case and return early if the configuration is not
> allocated.
> 
> __destroy_component_cfg() also frees the mbwu_state as this is allocated
> by __allocate_component_cfg(). As the mbwu_state is allocated after
> comp->cfg is set, and is also under mpam_list_lock, only the first
> pointer needs checking.
> 
> Fixes: 3bd04fe7d807bb ("arm_mpam: Extend reset logic to allow devices to be reset any time")
> Signed-off-by: James Morse <james.morse@arm.com>
I checked on the FVP and with this and the previous patch and an early mpam_disable
due to an unsupported MSC version doesn't cause any problems. Additionally, the kunit
tests still run and pass.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

