Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EA6C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 17:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDzTlr3eZMQFfQ3OoSdWqZkvDvf6Cy2WXfC+CBg8D2Y=; b=LG0vlas3Bv3qHRsvr2IKbGeych
	JvmlKoDU/nVPn7wlVos5O9x6ogXxvryhdfc/npHmXyhJ/aPy+AssQlXpeh/n9eROQ7rTLqoV4ngVt
	4aFiLTd+l9PXRm5gcOXXPIsW+3tAA6NO/Fm+EC1UPUdjz/sIkZge/JKT6qhEKd/gC/sl4TykAsntV
	+5etkHVYwD5AJJAtZoJmxqQBtxS33PhopSr+rnfzdiQWdUPVljzHx4v12EdfbGLkLsbuaTyeNFtg+
	kbO4I5Y8fPuxNp857as8d6j6mkbduJHDD5DwsJYHahkpUhz1v9r3GFAbD0sfYBpMiHECc7MaUOHv7
	ZhC8xmQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgfR-00000004qbK-0GeC;
	Mon, 09 Jun 2025 17:52:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfWH-00000004hgN-3U6B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 16:38:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3931C14BF;
	Mon,  9 Jun 2025 09:38:26 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFBED3F673;
	Mon,  9 Jun 2025 09:38:44 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:38:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/9] coresight: Appropriately disable programming
 clocks
Message-ID: <20250609163840.GL8020@e132581.arm.com>
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-4-423b3f1f241d@arm.com>
 <e18507cb-bcbf-4cdd-8364-9bce0ea016d5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e18507cb-bcbf-4cdd-8364-9bce0ea016d5@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_093845_910663_88CD0A49 
X-CRM114-Status: GOOD (  18.26  )
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

On Mon, Jun 09, 2025 at 05:11:21PM +0100, Suzuki Kuruppassery Poulose wrote:
> On 09/06/2025 17:00, Leo Yan wrote:
> > Some CoreSight components have programming clocks (pclk) and are enabled
> > using clk_get() and clk_prepare_enable().  However, in many cases, these
> > clocks are not disabled when modules exit and only released by clk_put().
> > 
> > To fix the issue, this commit refactors coresight_get_enable_apb_pclk()
> > by replacing clk_get() and clk_prepare_enable() with
> > devm_clk_get_enabled() for enabling APB clock.  Callers are updated
> > to reuse the returned error value.
> > 
> > With the change, programming clocks are managed as resources in driver
> > model layer, allowing clock cleanup to be handled automatically.  As a
> > result, manual cleanup operations are no longer needed and are removed
> > from the Coresight drivers.
> > 
> > Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
> 
> This looks suspicious. This patch covers a lot of components, but the
> above commit is only affecting ETMv4 ?

Since commit 73d779a03a76 is the earliest patch that introduced the
issue, it has been selected as the fix tag. We assume this will cover
any subsequent changes that have the same issue.

> The patch as such looks good to me.

Thanks for review!

> Suzuki

