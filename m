Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC3FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 11:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jg8uIkhcxP179fvF2dpVPHFfiIEbz5Wu1Mynb405sTI=; b=hY3FEMquUfjJyBGacGNEEnpQnd
	uFYq+1BQm5adfboEMJGcNoqZWyxzHkX+dLql9MYR1Ia49Zf4oXHDyDAtersdSg4V3PCo8X9lSKALv
	lsbjzawqvcbH2iVkkaZbEgEJ2C4QaaAzMHrt+/+yKlQiqlxJrR3IwvLDkxOXWL87iLX265Z7JeoaH
	021LmOv7PFSpBm9ItC6c0yOpVYTjoog9LYQA7Xm91UTcy785CZtAPKnRBs+griSKgNYC6eQjAYvUa
	ScVb670Y/1enJ4LjnaaPb+nmK1CenxOFPZHbDfB08Fsv1oiENP4HX5gYuBtYk/9AA1r9x8CAHgtx4
	69aRsaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyDm-0000000BHYb-00GF;
	Tue, 10 Dec 2024 11:16:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyCh-0000000BHFV-0GLJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 11:15:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C8C4BA40BE8;
	Tue, 10 Dec 2024 11:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3CDC4CED6;
	Tue, 10 Dec 2024 11:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733829297;
	bh=lhICE9COOAdzLbeeCIG0N4z0GPEAUpsD9Gqft5qjfv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oPiwb6iiYNDZ/WGH9n+gRvMNUl6iGEU0HBgF/24GiCfBXOtlBxpMlXU2u10//8QC8
	 WqMttv5upsoZ3Tccjav4vJtLriG2z2rEYDsmEwVN/VvwArcRysn0T6bYIm41crkJJi
	 sl87IZYqvkQV6kkCxvZux0h/iSCXHxL+rzPJIg7IUXYsrf8XX7OdYAOgsTC9Mt6yrS
	 i0cjfLiLJFBKdSeY8auwuEVGyBJjgmQdF1jsB9TmQsBJLu/1gUHvM1k0/M620uRqjc
	 LqySKf6zHG+OnkBUJPKGWGfTB29xpI/OQhVkIq7IrAf3p6AyEoCARe02X2SdIi2UIZ
	 uzdvgQ8KgEQ0Q==
Date: Tue, 10 Dec 2024 11:14:51 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Rob Clark <robdclark@chromium.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joao Martins <joao.m.martins@oracle.com>,
	Joerg Roedel <jroedel@suse.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v10 0/4] io-pgtable-arm + drm/msm: Extend iova fault
 debugging
Message-ID: <20241210111450.GA14735@willie-the-truck>
References: <20241028213146.238941-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028213146.238941-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_031459_173197_E5E90203 
X-CRM114-Status: GOOD (  14.45  )
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

Hi Rob,

On Mon, Oct 28, 2024 at 02:31:36PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This series extends io-pgtable-arm with a method to retrieve the page
> table entries traversed in the process of address translation, and then
> beefs up drm/msm gpu devcore dump to include this (and additional info)
> in the devcore dump.
> 
> This is a respin of https://patchwork.freedesktop.org/series/94968/
> (minus a patch that was already merged)
> 
> v2:  Fix an armv7/32b build error in the last patch
> v3:  Incorperate Will Deacon's suggestion to make the interface
>      callback based.
> v4:  Actually wire up the callback
> v5:  Drop the callback approach
> v6:  Make walk-data struct pgtable specific and rename
>      io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
> v8:  Pass pte pointer to callback so it can modify the actual pte
> v9:  Fix selftests_running case
> v10: Call visit cb for all nodes traversed, leave the decision about
>      whether to care about non-leaf nodes to the callback

Do you plan to respin this? I see Mostafa left a proposal on patch 3.

Thanks,

Will

